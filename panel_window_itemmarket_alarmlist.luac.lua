-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_alarmlist.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_ItemMarket_AlarmList:RegisterShowEventFunc(true, "ItemMarketAlarmList_ShowAni()")
Panel_ItemMarket_AlarmList:RegisterShowEventFunc(false, "ItemMarketAlarmList_HideAni()")
Panel_ItemMarket_AlarmList:SetShow(false, false)
Panel_ItemMarket_AlarmList:ActiveMouseEventEffect(true)
Panel_ItemMarket_AlarmList:setGlassBackground(true)
local ItemMarketAlarm = {
ui = {btn_Close = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "Button_Win_Close"), bg = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "Static_BG"), temp_SlotBG = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "Static_SlotBG"), temp_Slot_IconBG = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "Static_Slot_IconBG"), temp_Slot_Icon = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "Static_Slot_Icon"), temp_Slot_ItemName = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "StaticText_Slot_ItemName"), temp_Button_UnSelect = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "Button_UnSelect"), scroll = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "Scroll_List")}
, 
config = {maxSlotCount = 6, totalItemCount = 0, startIndex = 0}
, 
uiPool = {}
}
local _buttonQuestion = (UI.getChildControl)(Panel_ItemMarket_AlarmList, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"ItemMarket\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"ItemMarket\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"ItemMarket\", \"false\")")
ItemMarketAlarm.Init = function(self)
  -- function num : 0_0
  for slotIdx = 0, (self.config).maxSlotCount - 1 do
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R5 in 'UnsetPending'

    (self.uiPool)[slotIdx] = {}
    local slot = (self.uiPool)[slotIdx]
    slot.slotBG = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_AlarmList, "Static_SlotBG", (self.ui).bg, "ItemMarket_AlarmList_SlotBG_" .. slotIdx)
    slot.iconBG = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_AlarmList, "Static_Slot_IconBG", slot.slotBG, "ItemMarket_AlarmList_SlotIconBG_" .. slotIdx)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_AlarmList, "Static_Slot_Icon", slot.iconBG, "ItemMarket_AlarmList_SlotIcon_" .. slotIdx)
    slot.enchantLevel = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_AlarmList, "StaticText_EnchantLevel", slot.iconBG, "ItemMarket_AlarmList_SlotEnchantLevel_" .. slotIdx)
    slot.itemName = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_AlarmList, "StaticText_Slot_ItemName", slot.slotBG, "ItemMarket_AlarmList_SlotItemName_" .. slotIdx)
    slot.unSetBtn = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_AlarmList, "Button_UnSelect", slot.slotBG, "ItemMarket_AlarmList_SlotUnSetBtn_" .. slotIdx)
    ;
    (slot.slotBG):SetPosX(5)
    ;
    (slot.slotBG):SetPosY(5 + ((slot.slotBG):GetSizeY() + 5) * slotIdx)
    ;
    (slot.iconBG):SetPosX(5)
    ;
    (slot.iconBG):SetPosY(5)
    ;
    (slot.icon):SetPosX(0)
    ;
    (slot.icon):SetPosY(0)
    ;
    (slot.enchantLevel):SetPosX(5)
    ;
    (slot.enchantLevel):SetPosY(10)
    ;
    (slot.itemName):SetPosX(55)
    ;
    (slot.itemName):SetPosY(15)
    ;
    (slot.unSetBtn):SetPosX(325)
    ;
    (slot.unSetBtn):SetPosY(5)
    ;
    (slot.slotBG):SetShow(false)
    ;
    (slot.slotBG):addInputEvent("Mouse_UpScroll", "Scroll_ItemMarketAlarmList( true )")
    ;
    (slot.slotBG):addInputEvent("Mouse_DownScroll", "Scroll_ItemMarketAlarmList( false )")
    ;
    (slot.icon):addInputEvent("Mouse_UpScroll", "Scroll_ItemMarketAlarmList( true )")
    ;
    (slot.icon):addInputEvent("Mouse_DownScroll", "Scroll_ItemMarketAlarmList( false )")
    ;
    (slot.itemName):addInputEvent("Mouse_UpScroll", "Scroll_ItemMarketAlarmList( true )")
    ;
    (slot.itemName):addInputEvent("Mouse_DownScroll", "Scroll_ItemMarketAlarmList( false )")
    ;
    (slot.unSetBtn):addInputEvent("Mouse_UpScroll", "Scroll_ItemMarketAlarmList( true )")
    ;
    (slot.unSetBtn):addInputEvent("Mouse_DownScroll", "Scroll_ItemMarketAlarmList( false )")
    ;
    ((self.ui).temp_SlotBG):SetShow(false)
    ;
    ((self.ui).temp_Slot_IconBG):SetShow(false)
    ;
    ((self.ui).temp_Slot_Icon):SetShow(false)
    ;
    ((self.ui).temp_Slot_ItemName):SetShow(false)
    ;
    ((self.ui).temp_Button_UnSelect):SetShow(false)
  end
  toClient_LoadItemMarketFavoriteItem()
end

ItemMarketAlarm:Init()
ItemMarketAlarm.Update = function(self)
  -- function num : 0_1 , upvalues : UI_color
  for slotIdx = 0, (self.config).maxSlotCount - 1 do
    local slot = (self.uiPool)[slotIdx]
    ;
    (slot.slotBG):SetShow(false)
    ;
    (slot.unSetBtn):addInputEvent("Mouse_LUp", "")
    ;
    (slot.enchantLevel):SetShow(false)
  end
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).totalItemCount = toClient_GetItemMarketFavoriteItemListSize()
  local uiCount = 0
  if (self.config).totalItemCount > 0 then
    for slotIdx = (self.config).startIndex, (self.config).totalItemCount - 1 do
      if (self.config).maxSlotCount <= uiCount then
        break
      end
      local slot = (self.uiPool)[uiCount]
      local enchantItemKey = toClient_GetItemMarketFavoriteItem(slotIdx)
      local itemSSW = getItemEnchantStaticStatus(enchantItemKey)
      local itemName = itemSSW:getName()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      local enchantLevelValue = ""
      local iconPath = itemSSW:getIconPath()
      local isCash = (itemSSW:get()):isCash()
      local nameColorGrade = itemSSW:getGradeType()
      if nameColorGrade == 0 then
        (slot.itemName):SetFontColor(UI_color.C_FFFFFFFF)
      else
        if nameColorGrade == 1 then
          (slot.itemName):SetFontColor(4284350320)
        else
          if nameColorGrade == 2 then
            (slot.itemName):SetFontColor(4283144191)
          else
            if nameColorGrade == 3 then
              (slot.itemName):SetFontColor(4294953010)
            else
              if nameColorGrade == 4 then
                (slot.itemName):SetFontColor(4294929408)
              else
                ;
                (slot.itemName):SetFontColor(UI_color.C_FFFFFFFF)
              end
            end
          end
        end
      end
      if enchantLevel > 0 and enchantLevel < 16 then
        if isCash == true then
          (slot.enchantLevel):SetShow(false)
        else
          ;
          (slot.enchantLevel):SetText("+" .. tostring(enchantLevel))
          ;
          (slot.enchantLevel):SetShow(true)
        end
      else
        if enchantLevel == 16 then
          (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
          ;
          (slot.enchantLevel):SetShow(true)
        else
          if enchantLevel == 17 then
            (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
            ;
            (slot.enchantLevel):SetShow(true)
          else
            if enchantLevel == 18 then
              (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
              ;
              (slot.enchantLevel):SetShow(true)
            else
              if enchantLevel == 19 then
                (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
                ;
                (slot.enchantLevel):SetShow(true)
              else
                if enchantLevel == 20 then
                  (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
                  ;
                  (slot.enchantLevel):SetShow(true)
                end
              end
            end
          end
        end
      end
      if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
        if enchantLevel == 1 then
          (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
          ;
          (slot.enchantLevel):SetShow(true)
        else
          if enchantLevel == 2 then
            (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
            ;
            (slot.enchantLevel):SetShow(true)
          else
            if enchantLevel == 3 then
              (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
              ;
              (slot.enchantLevel):SetShow(true)
            else
              if enchantLevel == 4 then
                (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
                ;
                (slot.enchantLevel):SetShow(true)
              else
                if enchantLevel == 5 then
                  (slot.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
                  ;
                  (slot.enchantLevel):SetShow(true)
                end
              end
            end
          end
        end
      end
      ;
      (slot.slotBG):SetShow(true)
      ;
      (slot.itemName):SetText(itemName)
      ;
      (slot.icon):ChangeTextureInfoName("Icon/" .. iconPath)
      ;
      (slot.unSetBtn):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketAlarm_UnSet( " .. enchantItemKey:get() .. " )")
      uiCount = uiCount + 1
    end
    do
      ;
      (UIScroll.SetButtonSize)((self.ui).scroll, (self.config).maxSlotCount, (self.config).totalItemCount)
      if (self.config).maxSlotCount < (self.config).totalItemCount then
        ((self.ui).scroll):SetShow(true)
      else
        ;
        ((self.ui).scroll):SetShow(false)
      end
    end
  end
end

ItemMarketAlarm.Open = function(self)
  -- function num : 0_2
  if Panel_Window_ItemMarket:GetShow() then
    FGolbal_ItemMarketNew_Close()
  end
  if Panel_Window_ItemMarket_ItemSet:GetShow() then
    FGlobal_ItemMarketItemSet_Close()
  end
  if Panel_Window_ItemMarket_BuyConfirm:GetShow() then
    FGlobal_ItemMarket_BuyConfirm_Close()
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  Panel_ItemMarket_AlarmList:SetShow(true, true)
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_ItemMarket_AlarmList:GetSizeX()
  local panelSizeY = Panel_ItemMarket_AlarmList:GetSizeY()
  Panel_ItemMarket_AlarmList:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_ItemMarket_AlarmList:SetPosY(scrSizeY / 2 - panelSizeY / 2 - 100)
  ;
  ((self.ui).scroll):SetControlPos(0)
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self.config).startIndex = 0
  -- DECOMPILER ERROR at PC64: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self.config).totalItemCount = 0
  self:Update()
end

ItemMarketAlarm.Close = function(self)
  -- function num : 0_3
  Panel_ItemMarket_AlarmList:SetShow(false, false)
  ;
  ((self.ui).scroll):SetControlPos(0)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).startIndex = 0
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).totalItemCount = 0
end

ItemMarketAlarmList_ShowAni = function()
  -- function num : 0_4
  Panel_ItemMarket_AlarmList:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_ItemMarket_AlarmList, 0, 0.3)
end

ItemMarketAlarmList_HideAni = function()
  -- function num : 0_5
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_ItemMarket_AlarmList, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

Scroll_ItemMarketAlarmList = function(isScrollUp)
  -- function num : 0_6 , upvalues : ItemMarketAlarm
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  (ItemMarketAlarm.config).startIndex = (UIScroll.ScrollEvent)((ItemMarketAlarm.ui).scroll, isScrollUp, (ItemMarketAlarm.config).maxSlotCount, (ItemMarketAlarm.config).totalItemCount, (ItemMarketAlarm.config).startIndex, 1)
  ItemMarketAlarm:Update()
end

HandleClicked_ItemMarketAlarm_UnSet = function(enchantItemKey)
  -- function num : 0_7 , upvalues : ItemMarketAlarm
  if enchantItemKey ~= nil then
    toClient_EraseItemMarketFavoriteItem(enchantItemKey)
  end
  ItemMarketAlarm:Update()
end

HandleClicked_ItemMarketAlarmList_Close = function()
  -- function num : 0_8 , upvalues : ItemMarketAlarm
  ItemMarketAlarm:Close()
end

FGlobal_ItemMarketAlarmList_Open = function()
  -- function num : 0_9 , upvalues : ItemMarketAlarm
  if Panel_Window_ItemMarket:GetShow() then
    FGolbal_ItemMarketNew_Close()
  end
  if Panel_Window_ItemMarket_ItemSet:GetShow() then
    FGlobal_ItemMarketItemSet_Close()
  end
  if Panel_Window_ItemMarket_BuyConfirm:GetShow() then
    FGlobal_ItemMarket_BuyConfirm_Close()
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  if Panel_ItemMarket_PreBid_Manager:GetShow() then
    FGlobal_ItemMarketPreBid_Manager_Close()
  end
  ItemMarketAlarm:Open()
end

FGlobal_ItemMarketAlarmList_Close = function()
  -- function num : 0_10 , upvalues : ItemMarketAlarm
  ItemMarketAlarm:Close()
end

ItemMarketAlarm.registEventHandler = function(self)
  -- function num : 0_11
  ((self.ui).btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketAlarmList_Close()")
  ;
  ((self.ui).bg):addInputEvent("Mouse_UpScroll", "Scroll_ItemMarketAlarmList( true )")
  ;
  ((self.ui).bg):addInputEvent("Mouse_DownScroll", "Scroll_ItemMarketAlarmList( false )")
  ;
  (UIScroll.InputEvent)((self.ui).scroll, "Scroll_ItemMarketAlarmList")
end

ItemMarketAlarm.registMessageHandler = function(self)
  -- function num : 0_12
end

ItemMarketAlarm:registEventHandler()
ItemMarketAlarm:registMessageHandler()

