-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\itemmarket\panel_window_itemmarket_alarm_new.luac 

-- params : ...
-- function num : 0
Panel_Window_ItemMarketAlarmList_New:SetShow(false)
local PaGlobal_ItemMarket_Alarm = {
_ui = {_closeBtn = (UI.getChildControl)(Panel_Window_ItemMarketAlarmList_New, "Button_Win_Close"), _checkPopup = (UI.getChildControl)(Panel_Window_ItemMarketAlarmList_New, "CheckButton_PopUp"), _alramList = (UI.getChildControl)(Panel_Window_ItemMarketAlarmList_New, "List2_RegistItmeList"), _descBg = (UI.getChildControl)(Panel_Window_ItemMarketAlarmList_New, "Static_DescBg"), _checkRemainMsg = (UI.getChildControl)(Panel_Window_ItemMarketAlarmList_New, "CheckButton_RemainMessage"), _checkSound = (UI.getChildControl)(Panel_Window_ItemMarketAlarmList_New, "CheckButton_Sound"), _desc = nil}
, 
_config = {createBorder = true, createEnchant = true, createCash = true}
, _currentCount = 0, _unreadCount = 0, _maxCount = 20, 
_content = {}
}
PaGlobal_ItemMarket_Alarm.Init = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._desc = (UI.getChildControl)((self._ui)._descBg, "StaticText_Desc")
  ;
  ((self._ui)._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._desc):SetText(((self._ui)._desc):GetText())
  local bgSizeY = (math.max)(((self._ui)._descBg):GetSizeY(), ((self._ui)._desc):GetTextSizeY() + 10)
  ;
  ((self._ui)._descBg):SetSize(((self._ui)._descBg):GetSizeX(), bgSizeY)
  Panel_Window_ItemMarketAlarmList_New:SetSize(Panel_Window_ItemMarketAlarmList_New:GetSizeX(), bgSizeY + 355)
  ;
  ((self._ui)._desc):ComputePos()
  ;
  ((self._ui)._closeBtn):addInputEvent("Mouse_LUp", "ItemMarket_AlarmList_Close()")
  local popupOpen = ToClient_IsContentsGroupOpen("240")
  ;
  ((self._ui)._checkPopup):SetShow(popupOpen)
  ;
  ((self._ui)._checkPopup):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarket_Alarm_PopUp()")
  ;
  ((self._ui)._checkPopup):addInputEvent("Mouse_On", "PaGlobal_ItemMarket_AlarmList_TooltipShow()")
  ;
  ((self._ui)._checkPopup):addInputEvent("Mouse_Out", "PaGlobal_ItemMarket_AlarmList_TooltipHide()")
  ;
  ((self._ui)._checkRemainMsg):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarket_Alarm_SetCheck()")
  ;
  ((self._ui)._checkSound):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarket_Alarm_SetSoundCheck()")
  local alarmState = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ItemMarketAlarm)
  if alarmState == 0 then
    ((self._ui)._checkRemainMsg):SetCheck(true)
  else
    if alarmState == 1 then
      ((self._ui)._checkRemainMsg):SetCheck(true)
    else
      ;
      ((self._ui)._checkRemainMsg):SetCheck(false)
    end
  end
  local alarmSoundState = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ItemMarketAlarmSound)
  if alarmSoundState == 0 then
    ((self._ui)._checkSound):SetCheck(true)
  else
    if alarmSoundState == 1 then
      ((self._ui)._checkSound):SetCheck(true)
    else
      ;
      ((self._ui)._checkSound):SetCheck(false)
    end
  end
  -- DECOMPILER ERROR at PC162: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._ui)._list2Content = (UI.getChildControl)((self._ui)._alramList, "List2_2_Content")
  local list2SlotBg = (UI.getChildControl)((self._ui)._list2Content, "Static_Slot_IconBG")
  local slot = {}
  ;
  (SlotItem.new)(slot, "ItemMarketItemIconSlot_", 0, list2SlotBg, self._config)
  slot:createChild()
  ;
  ((self._ui)._alramList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ItemMarket_AlarmList_ControlCreate")
  ;
  ((self._ui)._alramList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  registerEvent("FromClient_NotifySellByreservation", "FromClient_NotifySellByreservation")
  registerEvent("onScreenResize", "Panel_ItemMarketAlarmList_New_Repos")
  Panel_Window_ItemMarketAlarmList_New:RegisterShowEventFunc(true, "Panel_ItemMarketAlarmList_New_ShowAni()")
  Panel_Window_ItemMarketAlarmList_New:RegisterShowEventFunc(false, "Panel_ItemMarketAlarmList_New_HideAni()")
end

Panel_ItemMarketAlarmList_New_ShowAni = function()
  -- function num : 0_1
end

Panel_ItemMarketAlarmList_New_HideAni = function()
  -- function num : 0_2
end

PaGlobal_ItemMarket_Alarm_SetCheck = function()
  -- function num : 0_3 , upvalues : PaGlobal_ItemMarket_Alarm
  if ((PaGlobal_ItemMarket_Alarm._ui)._checkRemainMsg):IsCheck() then
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ItemMarketAlarm, 1, (CppEnums.VariableStorageType).eVariableStorageType_User)
    if not Panel_ItemMarket_NewAlarm:GetShow() then
      local lastIndex = toClient_GetItemMarketFavoriteItemAlarmRecodeSize() - 1
      local info = toClient_GetItemMarketFavoriteItemAlarmRecode(lastIndex)
      FGlobal_ItemMarket_NewAlarmShow(info:getItemEnchantKey(), info:isSoldOut(), info:getAlarmTime())
    end
  else
    do
      ;
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ItemMarketAlarm, 2, (CppEnums.VariableStorageType).eVariableStorageType_User)
    end
  end
end

PaGlobal_ItemMarket_Alarm_SetSoundCheck = function()
  -- function num : 0_4 , upvalues : PaGlobal_ItemMarket_Alarm
  if ((PaGlobal_ItemMarket_Alarm._ui)._checkSound):IsCheck() then
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ItemMarketAlarmSound, 1, (CppEnums.VariableStorageType).eVariableStorageType_User)
  else
    ;
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ItemMarketAlarmSound, 2, (CppEnums.VariableStorageType).eVariableStorageType_User)
  end
end

FGlobal_ItemMarket_AlarmList_SoundCheck = function()
  -- function num : 0_5 , upvalues : PaGlobal_ItemMarket_Alarm
  return ((PaGlobal_ItemMarket_Alarm._ui)._checkSound):IsCheck()
end

ItemMarket_AlarmList_ControlCreate = function(content, key)
  -- function num : 0_6 , upvalues : PaGlobal_ItemMarket_Alarm
  local self = PaGlobal_ItemMarket_Alarm
  local recentBg = (UI.getChildControl)(content, "Static_RecentRegistBg")
  local alarmType = (UI.getChildControl)(content, "StaticText_AlarmType")
  local desc = (UI.getChildControl)(content, "StaticText_Desc")
  local btnCancel = (UI.getChildControl)(content, "Button_AlarmCancel")
  local slotBg = (UI.getChildControl)(content, "Static_Slot_IconBG")
  desc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  btnCancel:SetShow(false)
  local index = Int64toInt32(key)
  local info = toClient_GetItemMarketFavoriteItemAlarmRecode(index)
  local slot = {}
  ;
  (SlotItem.reInclude)(slot, "ItemMarketItemIconSlot_", 0, slotBg, self._config)
  if info == nil then
    return 
  end
  local itemSSW = getItemEnchantStaticStatus(info:getItemEnchantKey())
  if itemSSW == nil then
    return 
  end
  slot:setItemByStaticStatus(itemSSW)
  ;
  (slot.icon):addInputEvent("Mouse_On", "PaGlobal_ItemMarket_Alarm_TooltipShow(" .. index .. ")")
  ;
  (slot.icon):addInputEvent("Mouse_Out", "PaGlobal_ItemMarket_Alarm_TooltipHide()")
  do
    local itemName = FGlobal_ChangeItemNameColorByGrade(info:getItemEnchantKey())
    if info:isSoldOut() == true then
      alarmType:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ALARM_SOLDOUTTITLE"))
      desc:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ALARM_SOLDOUTDESC", "time", info:getAlarmTime(), "itemName", itemName))
    else
      alarmType:SetText("")
      desc:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ALARM_CANCELDESC", "time", info:getAlarmTime(), "itemName", itemName))
      if PaGlobal_ItemMarket_Alarm:checkItmeKey(info:getItemEnchantKey()) then
        btnCancel:SetShow(true)
        btnCancel:addInputEvent("Mouse_LUp", "PaGlobal_ItemMarket_Alarm_Delete(" .. index .. ")")
      else
        alarmType:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ALARM_CANCELTITLE"))
      end
    end
    recentBg:SetShow(index == toClient_GetItemMarketFavoriteItemAlarmRecodeSize() - 1)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

PaGlobal_ItemMarket_Alarm_Delete = function(index)
  -- function num : 0_7 , upvalues : PaGlobal_ItemMarket_Alarm
  local self = PaGlobal_ItemMarket_Alarm
  local info = toClient_GetItemMarketFavoriteItemAlarmRecode(index)
  if info == nil then
    return 
  end
  local enchantItemKey = info:getItemEnchantKey()
  local doDelete = function()
    -- function num : 0_7_0 , upvalues : enchantItemKey, PaGlobal_ItemMarket_Alarm
    if enchantItemKey:get() ~= nil then
      toClient_EraseItemMarketFavoriteItem(enchantItemKey:get())
      PaGlobal_ItemMarket_Alarm:Reload()
    end
  end

  local itemSSW = getItemEnchantStaticStatus(enchantItemKey)
  if itemSSW == nil then
    return 
  end
  local itemName = FGlobal_ChangeItemNameColorByGrade(enchantItemKey)
  local _contenet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ALARM_CANCELMSG", "itemName", itemName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ALARM_CANCELMSGTITLE"), content = _contenet, functionYes = doDelete, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PaGlobal_ItemMarket_Alarm_TooltipShow = function(index)
  -- function num : 0_8
  local info = toClient_GetItemMarketFavoriteItemAlarmRecode(index)
  local itemSSW = getItemEnchantStaticStatus(info:getItemEnchantKey())
  if itemSSW == nil then
    return 
  end
  Panel_Tooltip_Item_SetPosition(0, (self._ui)._descBg, "itemMarketAlarmList")
  Panel_Tooltip_Item_Show(itemSSW, Panel_Window_ItemMarketAlarmList_New, true)
end

PaGlobal_ItemMarket_Alarm_TooltipHide = function()
  -- function num : 0_9
  Panel_Tooltip_Item_hideTooltip()
end

FGlobal_ChangeItemNameColorByGrade = function(enchantItemKey)
  -- function num : 0_10 , upvalues : PaGlobal_ItemMarket_Alarm
  local self = PaGlobal_ItemMarket_Alarm
  local itemSSW = getItemEnchantStaticStatus(enchantItemKey)
  if itemSSW == nil then
    return 
  end
  local name = itemSSW:getName()
  local itemGrade = itemSSW:getGradeType()
  local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
  if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
    if enchantLevel == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_16") .. " " .. name
    else
      if enchantLevel == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_17") .. " " .. name
      else
        if enchantLevel == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_18") .. " " .. name
        else
          if enchantLevel == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_19") .. " " .. name
          else
            if enchantLevel == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_20") .. " " .. name
            end
          end
        end
      end
    end
  else
    if enchantLevel > 0 and enchantLevel < 16 then
      name = "+" .. tostring(enchantLevel) .. " " .. name
    else
      if enchantLevel == 16 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_16") .. " " .. name
      else
        if enchantLevel == 17 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_17") .. " " .. name
        else
          if enchantLevel == 18 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_18") .. " " .. name
          else
            if enchantLevel == 19 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_19") .. " " .. name
            else
              if enchantLevel == 20 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_20") .. " " .. name
              end
            end
          end
        end
      end
    end
  end
  local colorName = ""
  if itemGrade == 0 then
    colorName = "<PAColor0xffffffff>[" .. name .. "]<PAOldColor>"
  else
    if itemGrade == 1 then
      colorName = "<PAColor0xff5dff70>[" .. name .. "]<PAOldColor>"
    else
      if itemGrade == 2 then
        colorName = "<PAColor0xff4b97ff>[" .. name .. "]<PAOldColor>"
      else
        if itemGrade == 3 then
          colorName = "<PAColor0xffffc832>[" .. name .. "]<PAOldColor>"
        else
          if itemGrade == 4 then
            colorName = "<PAColor0xffff6c00>[" .. name .. "]<PAOldColor>"
          else
            colorName = "<PAColor0xffffffff>[" .. name .. "]<PAOldColor>"
          end
        end
      end
    end
  end
  return colorName
end

PaGlobal_ItemMarket_Alarm.Update = function(self, enchantItemKey, playerName)
  -- function num : 0_11
  do
    local isSoldOut = playerName ~= nil
    toClient_AddItemMarketFavoriteItemAlarmRecode(enchantItemKey, getTimeYearMonthDayHourMinSecByTTime64(getUtc64()), isSoldOut)
    if Panel_Window_ItemMarketAlarmList_New:GetShow() == true then
      self:Reload()
    end
    FGlobal_ItemMarket_NewAlarmShow(enchantItemKey, playerName)
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

PaGlobal_ItemMarket_Alarm.Reload = function(self)
  -- function num : 0_12
  (((self._ui)._alramList):getElementManager()):clearKey()
  for index = 0, toClient_GetItemMarketFavoriteItemAlarmRecodeSize() - 1 do
    (((self._ui)._alramList):getElementManager()):pushKey(toInt64(0, index))
  end
  ;
  ((self._ui)._alramList):moveBottomIndex()
end

FromClient_NotifySellByreservation = function(characterName, enchantItemKey)
  -- function num : 0_13 , upvalues : PaGlobal_ItemMarket_Alarm
  local self = PaGlobal_ItemMarket_Alarm
  if not Panel_Window_ItemMarketAlarmList_New:GetShow() then
    self._unreadCount = (math.min)(self._unreadCount + 1, self._maxCount)
  end
  self:Update(ItemEnchantKey(enchantItemKey), characterName)
end

PaGlobal_ItemMarket_Alarm.checkItmeKey = function(self, enchantItemKey)
  -- function num : 0_14
  local inputKey = enchantItemKey:get()
  local myCount = toClient_GetItemMarketFavoriteItemListSize()
  if myCount > 0 then
    for idx = 0, myCount - 1 do
      local myEnchantItemKey = toClient_GetItemMarketFavoriteItem(idx)
      local compareKey = myEnchantItemKey:get()
      if compareKey == inputKey then
        return true
      end
    end
  end
  do
    return false
  end
end

FGlobal_ItemMarketAlarm_Open = function(enchantItemKey)
  -- function num : 0_15 , upvalues : PaGlobal_ItemMarket_Alarm
  local self = PaGlobal_ItemMarket_Alarm
  if not Panel_Window_ItemMarketAlarmList_New:GetShow() then
    self._unreadCount = (math.min)(self._unreadCount + 1, self._maxCount)
  end
  if self:checkItmeKey(enchantItemKey) then
    self:Update(enchantItemKey)
  end
end

FGlobal_ItemMarketAlarmList_New_Open = function()
  -- function num : 0_16 , upvalues : PaGlobal_ItemMarket_Alarm
  Panel_Window_ItemMarketAlarmList_New:SetShow(true, true)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_ItemMarket_Alarm._unreadCount = 0
  FGlobal_ItemMarket_SetCount()
  PaGlobal_ItemMarket_Alarm:Reload()
end

FGlobal_ItemMarketAlarm_UnreadCount = function()
  -- function num : 0_17 , upvalues : PaGlobal_ItemMarket_Alarm
  return PaGlobal_ItemMarket_Alarm._unreadCount
end

ItemMarket_AlarmList_Close = function()
  -- function num : 0_18 , upvalues : PaGlobal_ItemMarket_Alarm
  Panel_Window_ItemMarketAlarmList_New:SetShow(false, false)
  Panel_Window_ItemMarketAlarmList_New:CloseUISubApp()
  ;
  ((PaGlobal_ItemMarket_Alarm._ui)._checkPopup):SetCheck(false)
  Panel_Tooltip_Item_hideTooltip()
end

FGlobal_ItemMarketAlarm_CheckState = function()
  -- function num : 0_19 , upvalues : PaGlobal_ItemMarket_Alarm
  return ((PaGlobal_ItemMarket_Alarm._ui)._checkRemainMsg):IsCheck()
end

Panel_ItemMarketAlarmList_New_Repos = function()
  -- function num : 0_20
  Panel_Window_ItemMarketAlarmList_New:SetPosX(getScreenSizeX() - Panel_Window_ItemMarketAlarmList_New:GetSizeX() - 20)
  Panel_Window_ItemMarketAlarmList_New:SetPosY(getScreenSizeY() - Panel_Window_ItemMarketAlarmList_New:GetSizeY() - 100)
end

PaGlobal_ItemMarket_Alarm_PopUp = function()
  -- function num : 0_21 , upvalues : PaGlobal_ItemMarket_Alarm
  local self = PaGlobal_ItemMarket_Alarm
  if ((self._ui)._checkPopup):IsCheck() then
    Panel_Window_ItemMarketAlarmList_New:OpenUISubApp()
  else
    Panel_Window_ItemMarketAlarmList_New:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

PaGlobal_ItemMarket_AlarmList_TooltipShow = function()
  -- function num : 0_22 , upvalues : PaGlobal_ItemMarket_Alarm
  local control = (PaGlobal_ItemMarket_Alarm._ui)._checkPopup
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
  local desc = ""
  if control:IsCheck() then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
  else
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
  end
  TooltipSimple_Show(control, name, desc)
end

PaGlobal_ItemMarket_AlarmList_TooltipHide = function()
  -- function num : 0_23
  TooltipSimple_Hide()
end

FGlobal_ItemMarketAlarm_LuaLoadComplete = function()
  -- function num : 0_24 , upvalues : PaGlobal_ItemMarket_Alarm
  PaGlobal_ItemMarket_Alarm:Init()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_ItemMarket_Alarm._unreadCount = 0
  if toClient_GetItemMarketFavoriteItemAlarmRecodeSize() > 0 then
    FGlobal_ItemMarket_AlarmIcon_Show()
  end
  Panel_ItemMarketAlarmList_New_Repos()
end

registerEvent("FromClient_luaLoadComplete", "FGlobal_ItemMarketAlarm_LuaLoadComplete")

