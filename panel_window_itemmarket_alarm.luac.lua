-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_alarm.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_ItemMarket_Alarm:RegisterShowEventFunc(true, "ItemMarketAlarm_ShowAni()")
Panel_ItemMarket_Alarm:RegisterShowEventFunc(false, "ItemMarketAlarm_HideAni()")
Panel_ItemMarket_Alarm:SetShow(false, false)
Panel_ItemMarket_Alarm:ActiveMouseEventEffect(true)
Panel_ItemMarket_Alarm:setGlassBackground(true)
local ItemMarketAlarm = {
ui = {btn_Close = (UI.getChildControl)(Panel_ItemMarket_Alarm, "Button_Confirm"), btn_AlarmCancel = (UI.getChildControl)(Panel_ItemMarket_Alarm, "Button_AlarmCancel"), bg = (UI.getChildControl)(Panel_ItemMarket_Alarm, "Static_BG"), itemIcon = (UI.getChildControl)(Panel_ItemMarket_Alarm, "Static_Slot_Icon"), itemName = (UI.getChildControl)(Panel_ItemMarket_Alarm, "StaticText_Slot_ItemName"), enchantLevel = (UI.getChildControl)(Panel_ItemMarket_Alarm, "StaticText_EnchantLevel"), alarmTime = (UI.getChildControl)(Panel_ItemMarket_Alarm, "StaticText_AlarmTime")}
, 
config = {alarmItemEnchantKey = nil, isOpen = false}
}
ItemMarketAlarm.Init = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  ((self.ui).itemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
end

ItemMarketAlarm:Init()
ItemMarketAlarm.Update = function(self)
  -- function num : 0_1 , upvalues : UI_color
  local itemEnchantKeyRaw = (self.config).alarmItemEnchantKey
  local itemSSW = getItemEnchantStaticStatus(itemEnchantKeyRaw)
  if itemSSW == nil then
    return 
  end
  ;
  ((self.ui).enchantLevel):SetShow(false)
  local itemName = itemSSW:getName()
  local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
  local iconPath = itemSSW:getIconPath()
  local isCash = (itemSSW:get()):isCash()
  local nameColorGrade = itemSSW:getGradeType()
  if nameColorGrade == 0 then
    ((self.ui).itemName):SetFontColor(UI_color.C_FFFFFFFF)
  else
    if nameColorGrade == 1 then
      ((self.ui).itemName):SetFontColor(4284350320)
    else
      if nameColorGrade == 2 then
        ((self.ui).itemName):SetFontColor(4283144191)
      else
        if nameColorGrade == 3 then
          ((self.ui).itemName):SetFontColor(4294953010)
        else
          if nameColorGrade == 4 then
            ((self.ui).itemName):SetFontColor(4294929408)
          else
            ;
            ((self.ui).itemName):SetFontColor(UI_color.C_FFFFFFFF)
          end
        end
      end
    end
  end
  if enchantLevel > 0 and enchantLevel < 16 then
    if isCash == true then
      ((self.ui).enchantLevel):SetShow(false)
    else
      ;
      ((self.ui).enchantLevel):SetText("+" .. tostring(enchantLevel))
      ;
      ((self.ui).enchantLevel):SetShow(true)
    end
  else
    if enchantLevel == 16 then
      ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
      ;
      ((self.ui).enchantLevel):SetShow(true)
    else
      if enchantLevel == 17 then
        ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
        ;
        ((self.ui).enchantLevel):SetShow(true)
      else
        if enchantLevel == 18 then
          ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
          ;
          ((self.ui).enchantLevel):SetShow(true)
        else
          if enchantLevel == 19 then
            ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
            ;
            ((self.ui).enchantLevel):SetShow(true)
          else
            if enchantLevel == 20 then
              ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
              ;
              ((self.ui).enchantLevel):SetShow(true)
            end
          end
        end
      end
    end
  end
  if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
    if enchantLevel == 1 then
      ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
      ;
      ((self.ui).enchantLevel):SetShow(true)
    else
      if enchantLevel == 2 then
        ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
        ;
        ((self.ui).enchantLevel):SetShow(true)
      else
        if enchantLevel == 3 then
          ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
          ;
          ((self.ui).enchantLevel):SetShow(true)
        else
          if enchantLevel == 4 then
            ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
            ;
            ((self.ui).enchantLevel):SetShow(true)
          else
            if enchantLevel == 5 then
              ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
              ;
              ((self.ui).enchantLevel):SetShow(true)
            end
          end
        end
      end
    end
  end
  ;
  ((self.ui).itemIcon):ChangeTextureInfoName("Icon/" .. iconPath)
  ;
  ((self.ui).itemName):SetText(itemName)
  ;
  ((self.ui).alarmTime):SetText(getTimeYearMonthDayHourMinSecByTTime64(getUtc64()))
end

ItemMarketAlarm.Open = function(self, enchantItemKey)
  -- function num : 0_2
  Panel_ItemMarket_Alarm:SetShow(true, true)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.config).alarmItemEnchantKey = enchantItemKey
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.config).isOpen = true
  self:Update()
end

ItemMarketAlarm.Close = function(self)
  -- function num : 0_3
  Panel_ItemMarket_Alarm:SetShow(false, false)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).isOpen = false
end

ItemMarketAlarm_ShowAni = function()
  -- function num : 0_4 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_ItemMarket_Alarm:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.12)
  aniInfo1.AxisX = Panel_ItemMarket_Alarm:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ItemMarket_Alarm:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ItemMarket_Alarm:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.12)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ItemMarket_Alarm:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ItemMarket_Alarm:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

ItemMarketAlarm_HideAni = function()
  -- function num : 0_5 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo1 = Panel_ItemMarket_Alarm:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

HandleClicked_ItemMarketAlarm_Close = function()
  -- function num : 0_6 , upvalues : ItemMarketAlarm
  ItemMarketAlarm:Close()
end

HandleClicked_ItemMarketAlarm_Cancel = function()
  -- function num : 0_7 , upvalues : ItemMarketAlarm
  if ((ItemMarketAlarm.config).alarmItemEnchantKey):get() ~= nil then
    toClient_EraseItemMarketFavoriteItem(((ItemMarketAlarm.config).alarmItemEnchantKey):get())
  end
  ItemMarketAlarm:Close()
end

FGlobal_ItemMarketAlarm_Open = function(enchantItemKey)
  -- function num : 0_8 , upvalues : ItemMarketAlarm
  local hasList = false
  local myCount = toClient_GetItemMarketFavoriteItemListSize()
  if myCount > 0 then
    for idx = 0, myCount - 1 do
      local myEnchantItemKey = toClient_GetItemMarketFavoriteItem(idx)
      local compareKey = myEnchantItemKey:get()
      local inputKey = enchantItemKey:get()
      if compareKey == inputKey then
        hasList = true
        break
      end
    end
    do
      if hasList == true then
        ItemMarketAlarm:Open(enchantItemKey)
      end
    end
  end
end

FGlobal_ItemMarketAlarm_Close = function()
  -- function num : 0_9 , upvalues : ItemMarketAlarm
  ItemMarketAlarm:Close()
end

ItemMarketAlarm_CheckRestoreFlush = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_10 , upvalues : ItemMarketAlarm
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  if (ItemMarketAlarm.config).isOpen then
    Panel_ItemMarket_Alarm:SetShow(true, true)
  end
end

registerEvent("FromClient_RenderModeChangeState", "ItemMarketAlarm_CheckRestoreFlush")
ItemMarketAlarm.registEventHandler = function(self)
  -- function num : 0_11
  ((self.ui).btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketAlarm_Close()")
  ;
  ((self.ui).btn_AlarmCancel):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketAlarm_Cancel()")
end

ItemMarketAlarm.registMessageHandler = function(self)
  -- function num : 0_12
end

ItemMarketAlarm:registEventHandler()
ItemMarketAlarm:registMessageHandler()

