-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_itemset.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_BUFFTYPE = CppEnums.UserChargeType
Panel_Window_ItemMarket_ItemSet:SetShow(false)
Panel_Window_ItemMarket_ItemSet:SetDragEnable(true)
ItemMarketItemSetShowAni = function()
  -- function num : 0_0
end

ItemMarketItemSetHideAni = function()
  -- function num : 0_1
end

local ItemMarketItemSet = {panelBG = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "Static_PanelBG"), btn_Close = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "Button_Win_Close"), btn_Question = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "Button_Question"), btn_RegistItem = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "Button_RegistItem"), registItemCount = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "StaticText_RegistItemCount_Value"), saleItemCount = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "StaticText_SaleItemCount_Value"), RegistDelayNotify = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "StaticText_RegistDelayNotify"), waitingCount = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "StaticText_WaitingCount_Value"), invenMoney = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "Static_Text_Money"), warehouseMoney = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "Static_Text_Money2"), btn_Inven = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "RadioButton_Icon_Money"), btn_Warehouse = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "RadioButton_Icon_Money2"), bottomDesc = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "StaticText_BottomDesc"), btn_GetAll = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "Button_GetAllItem"), _list2 = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "List2_ItemMarket_ItemSet"), startIdx = 0, totalCount = 0, 
ItemListUiPool = {}
, ItemListMaxCount = 7, 
slotConfing = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createClassEquipBG = true}
, _buttonQuestion = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "Button_Question"), escMenuSaveValue = false}
local bgTexture = {
{
{68, 123, 65, 181}
, 
{134, 123, 198, 181}
; 
[0] = {1, 123, 65, 181}
}
, 
{
{377, 440, 441, 498}
, 
{444, 440, 508, 498}
; 
[0] = {310, 440, 374, 498}
}
; 
[0] = {
{110, 265, 174, 323}
, 
{110, 325, 174, 383}
; 
[0] = {134, 2, 198, 60}
}
}
local currentMyTerritoryKey = function()
  -- function num : 0_2
  local selfPlayer = getSelfPlayer()
  local regionInfoWrapper = getRegionInfoWrapper(selfPlayer:getRegionKeyRaw())
  if regionInfoWrapper == nil then
    return -1
  end
  return regionInfoWrapper:getTerritoryKeyRaw()
end

local territoryKey = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")), [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")), [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")), [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6"))}
ItemMarketItemSet.Initialize = function(self)
  -- function num : 0_3 , upvalues : UI_TM
  (self.panelBG):setGlassBackground(true)
  ;
  (self.panelBG):ActiveMouseEventEffect(true)
  local minSize = float2()
  minSize.x = 100
  minSize.y = 50
  local list2Control = (UI.getChildControl)(Panel_Window_ItemMarket_ItemSet, "List2_ItemMarket_ItemSet")
  local list2Content = (UI.getChildControl)(list2Control, "List2_1_Content")
  local createSlot = {}
  list2Control:setMinScrollBtnSize(minSize)
  local itemlist_Slot = (UI.getChildControl)(list2Content, "Template_Static_Slot")
  ;
  (SlotItem.new)(createSlot, "ItemMarketItemSet_ItemListSlotItem", 0, itemlist_Slot, self.slotConfing)
  createSlot:createChild()
  ;
  (createSlot.icon):SetPosX(4)
  ;
  (createSlot.icon):SetPosY(1)
  ;
  (self._list2):changeAnimationSpeed(10)
  ;
  (self._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ItemmarketItemSet_ListUpdate")
  ;
  (self._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.bottomDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.bottomDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKETSET_BOTTOM_DESC"))
  ;
  (self.btn_GetAll):addInputEvent("Mouse_LUp", "ItemMarketSetItem_GetAllItemCheck()")
  ;
  (self.btn_GetAll):addInputEvent("Mouse_On", "ItemMarketSetItem_GetAllItem_Simpletooltip(true)")
  ;
  (self.btn_GetAll):addInputEvent("Mouse_Out", "ItemMarketSetItem_GetAllItem_Simpletooltip()")
end

ItemmarketItemSet_ListUpdate = function(contents, key)
  -- function num : 0_4 , upvalues : ItemMarketItemSet, UI_TM, currentMyTerritoryKey, UI_color, territoryKey
  local self = ItemMarketItemSet
  local idx = Int64toInt32(key)
  local replaceCount = function(num)
    -- function num : 0_4_0
    if num ~= nil then
      local count = Int64toInt32(num)
      if count == 0 then
        count = "-"
      else
        count = makeDotMoney(num)
      end
      return count
    else
      do
        do return "-" end
      end
    end
  end

  local ItemBG = (UI.getChildControl)(contents, "Template_Static_ItemBG")
  ItemBG:SetPosX(10)
  ItemBG:SetPosY(0)
  local ItemPeriodEndBG = (UI.getChildControl)(contents, "Template_Static_ItemBG_PeriodEnd")
  ItemPeriodEndBG:SetPosX(10)
  ItemPeriodEndBG:SetPosY(0)
  local SlotBG = (UI.getChildControl)(contents, "Template_Static_SlotBG")
  SlotBG:SetShow(true)
  SlotBG:SetPosX(10)
  SlotBG:SetPosY(7)
  local createSlot = {}
  local itemlist_Slot = (UI.getChildControl)(contents, "Template_Static_Slot")
  itemlist_Slot:SetShow(true)
  itemlist_Slot:SetPosX(10)
  itemlist_Slot:SetPosY(7)
  ;
  (SlotItem.reInclude)(createSlot, "ItemMarketItemSet_ItemListSlotItem", 0, itemlist_Slot, self.slotConfing)
  local ItemName = (UI.getChildControl)(contents, "Template_StaticText_ItemName")
  ItemName:SetShow(true)
  ItemName:SetPosX(60)
  ItemName:SetPosY(7)
  ItemName:SetTextMode(UI_TM.eTextMode_AutoWrap)
  local AveragePrice_Title = (UI.getChildControl)(contents, "Template_Static_AveragePrice_TitleIcon")
  AveragePrice_Title:SetShow(true)
  AveragePrice_Title:SetPosX(210)
  AveragePrice_Title:SetPosY(10)
  local AveragePrice_Value = (UI.getChildControl)(contents, "Template_StaticText_AveragePrice_Value")
  AveragePrice_Value:SetShow(true)
  AveragePrice_Value:SetPosX(270)
  AveragePrice_Value:SetPosY(10)
  local SoldOut = (UI.getChildControl)(contents, "Template_StaticText_SoldOut")
  SoldOut:SetPosX(245)
  SoldOut:SetPosY(20)
  local RecentPrice_Title = (UI.getChildControl)(contents, "Template_Static_RecentPrice_TitleIcon")
  RecentPrice_Title:SetShow(true)
  RecentPrice_Title:SetPosX(210)
  RecentPrice_Title:SetPosY(32)
  local RecentPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_RecentPrice_Value")
  RecentPrice_Value:SetShow(true)
  RecentPrice_Value:SetPosX(270)
  RecentPrice_Value:SetPosY(32)
  local SellPrice_Title = (UI.getChildControl)(contents, "Template_Static_SellPrice_TitleIcon")
  SellPrice_Title:SetShow(true)
  SellPrice_Title:SetPosX(560)
  SellPrice_Title:SetPosY(10)
  local SellPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_SellPrice_Value")
  SellPrice_Value:SetShow(true)
  SellPrice_Value:SetPosX(620)
  SellPrice_Value:SetPosY(8)
  local RegistPeriod_Title = (UI.getChildControl)(contents, "Template_Static_RegistPeriod_TitleIcon")
  RegistPeriod_Title:SetShow(true)
  RegistPeriod_Title:SetPosX(410)
  RegistPeriod_Title:SetPosY(31)
  local RegistPeriod_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistPeriod_Value")
  RegistPeriod_Value:SetShow(true)
  RegistPeriod_Value:SetPosX(430)
  RegistPeriod_Value:SetPosY(30)
  local BTN_RegistCancle = (UI.getChildControl)(contents, "Template_Button_RegistCancle")
  BTN_RegistCancle:SetShow(true)
  BTN_RegistCancle:SetPosX(730)
  BTN_RegistCancle:SetPosY(9)
  local BTN_Withdrawals = (UI.getChildControl)(contents, "Template_Button_Withdrawals")
  BTN_Withdrawals:SetShow(true)
  BTN_Withdrawals:SetPosX(730)
  BTN_Withdrawals:SetPosY(9)
  local BTN_Settlement = (UI.getChildControl)(contents, "Templete_Button_Settlement")
  BTN_Settlement:SetShow(true)
  BTN_Settlement:SetPosX(730)
  BTN_Settlement:SetPosY(9)
  local RegistTerritoryText = (UI.getChildControl)(contents, "MultilineText_RegistTerritoryText")
  RegistTerritoryText:SetPosX(740)
  RegistTerritoryText:SetPosY(20)
  local SellCountIcon = (UI.getChildControl)(contents, "Template_Static_SellCountIcon")
  SellCountIcon:SetShow(true)
  SellCountIcon:SetPosX(410)
  SellCountIcon:SetPosY(8)
  local SellCountValue = (UI.getChildControl)(contents, "Template_StaticText_SellCountValue")
  SellCountValue:SetShow(true)
  SellCountValue:SetPosX(430)
  SellCountValue:SetPosY(8)
  local SellCompleteIcon = (UI.getChildControl)(contents, "Template_Static_SellCompleteIcon")
  SellCompleteIcon:SetShow(true)
  SellCompleteIcon:SetPosX(560)
  SellCompleteIcon:SetPosY(31)
  local SellCompleteValue = (UI.getChildControl)(contents, "Template_StaticText_SellCompleteValue")
  SellCompleteValue:SetShow(true)
  SellCompleteValue:SetPosX(620)
  SellCompleteValue:SetPosY(30)
  local DivisionLine1 = (UI.getChildControl)(contents, "Template_Static_Line_1")
  DivisionLine1:SetShow(true)
  DivisionLine1:SetPosX(385)
  DivisionLine1:SetPosY(12)
  local DivisionLine2 = (UI.getChildControl)(contents, "Template_Static_Line_2")
  DivisionLine2:SetShow(true)
  DivisionLine2:SetPosX(540)
  DivisionLine2:SetPosY(12)
  local currentTerritoryKey = currentMyTerritoryKey()
  local myItemInfo = getItemMarketMyItemByIndex(idx)
  if myItemInfo ~= nil then
    ItemBG:SetShow(true)
    local iess = myItemInfo:getItemEnchantStaticStatusWrapper()
    _PA_ASSERT(iess ~= nil, "myItemInfo 아이�\156 고정정보�\128 �\173 있어야합니다")
    if iess ~= nil then
      local nameColorGrade = (iess:getGradeType())
      local nameColor = nil
      if nameColorGrade == 0 then
        nameColor = UI_color.C_FFEFEFEF
      elseif nameColorGrade == 1 then
        nameColor = 4284350320
      elseif nameColorGrade == 2 then
        nameColor = 4283144191
      elseif nameColorGrade == 3 then
        nameColor = 4294953010
      elseif nameColorGrade == 4 then
        nameColor = 4294929408
      else
        nameColor = UI_color.C_FFFFFFFF
      end
      ItemName:SetFontColor(nameColor)
      local enchantLevel = ((iess:get())._key):getEnchantLevel()
      if iess:getItemType() == 1 and enchantLevel > 15 then
        ItemName:SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. iess:getName())
      elseif enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == iess:getItemClassify() then
        ItemName:SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. iess:getName())
      else
        ItemName:SetText(iess:getName())
      end
      createSlot:setItemByStaticStatus(iess, myItemInfo:getCount(), -1, false)
      ;
      (createSlot.icon):addInputEvent("Mouse_On", "_ItemMarketItemSet_ShowToolTip( " .. idx .. " )")
      ;
      (createSlot.icon):addInputEvent("Mouse_Out", "_ItemMarketItemSet_HideToolTip()")
      ;
      (createSlot.icon):SetShow(true)
      ;
      (createSlot.icon):SetPosX(0)
      ;
      (createSlot.icon):SetPosY(0)
      AveragePrice_Title:addInputEvent("Mouse_On", "ItemMarketItemSet_ToolTip( true,\t" .. idx .. ", 0 )")
      AveragePrice_Title:addInputEvent("Mouse_Out", "ItemMarketItemSet_ToolTip( false,\t" .. idx .. ", 0 )")
      RecentPrice_Title:addInputEvent("Mouse_On", "ItemMarketItemSet_ToolTip( true,\t" .. idx .. ", 1 )")
      RecentPrice_Title:addInputEvent("Mouse_Out", "ItemMarketItemSet_ToolTip( false,\t" .. idx .. ", 1 )")
      SellPrice_Title:addInputEvent("Mouse_On", "ItemMarketItemSet_ToolTip( true,\t" .. idx .. ", 2 )")
      SellPrice_Title:addInputEvent("Mouse_Out", "ItemMarketItemSet_ToolTip( false,\t" .. idx .. ", 2 )")
      RegistPeriod_Title:addInputEvent("Mouse_On", "ItemMarketItemSet_ToolTip( true,\t" .. idx .. ", 3 )")
      RegistPeriod_Title:addInputEvent("Mouse_Out", "ItemMarketItemSet_ToolTip( false,\t" .. idx .. ", 3 )")
      SellCountIcon:addInputEvent("Mouse_On", "ItemMarketItemSet_ToolTip( true,\t" .. idx .. ", 4 )")
      SellCountIcon:addInputEvent("Mouse_Out", "ItemMarketItemSet_ToolTip( false,\t" .. idx .. ", 4 )")
      SellCompleteIcon:addInputEvent("Mouse_On", "ItemMarketItemSet_ToolTip( true,\t" .. idx .. ", 5 )")
      SellCompleteIcon:addInputEvent("Mouse_Out", "ItemMarketItemSet_ToolTip( false,\t" .. idx .. ", 5 )")
      BTN_Withdrawals:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketItemSet_ItemWithdrawals( " .. ((iess:get())._key):get() .. "," .. idx .. " )")
      RegistPeriod_Value:SetFontColor((Defines.Color).C_FF6C7DE4)
      local periodSecond = ItemMarketSecondTimeConvert(myItemInfo:getDisplayedEndDate())
      if toInt64(0, 0) == periodSecond then
        RegistPeriod_Value:SetFontColor((Defines.Color).C_FFD20000)
        ItemPeriodEndBG:SetShow(true)
      else
        RegistPeriod_Value:SetFontColor((Defines.Color).C_FF6C7DE4)
        ItemPeriodEndBG:SetShow(false)
      end
      RegistPeriod_Value:SetText(converStringFromLeftDateTime(myItemInfo:getDisplayedEndDate()))
      SellCountValue:SetText(Int64toInt32(myItemInfo:getTotalCount()))
      SellCompleteValue:SetText(makeDotMoney(myItemInfo:getTradedTotalPrice()))
      BTN_RegistCancle:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketItemSet_RegistCancle( " .. ((iess:get())._key):get() .. "," .. idx .. " )")
      BTN_Settlement:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketItemSet_ItemSettlement( " .. ((iess:get())._key):get() .. "," .. idx .. " )")
      local leftBeginDate_s64 = converStringFromLeftDateTime(myItemInfo:getDisplayedBeginDate())
      if myItemInfo:isTraded() and Int64toInt32(myItemInfo:getTotalPrice()) == 0 then
        _ItemMarketItemSet_ChangeBgTexture(1, idx)
        ItemPeriodEndBG:SetShow(false)
        BTN_RegistCancle:SetShow(false)
        BTN_Withdrawals:SetShow(true)
        BTN_Settlement:SetShow(false)
        BTN_Withdrawals:SetFontColor(UI_color.C_FF96D4FC)
      elseif myItemInfo:isTraded() and Int64toInt32(myItemInfo:getTradedTotalPrice()) > 0 and Int64toInt32(myItemInfo:getTotalPrice()) > 0 then
        _ItemMarketItemSet_ChangeBgTexture(0, idx)
        BTN_Settlement:SetShow(true)
        BTN_RegistCancle:SetShow(false)
        BTN_Withdrawals:SetShow(false)
        BTN_Settlement:SetFontColor(UI_color.C_FFFAE696)
      else
        _ItemMarketItemSet_ChangeBgTexture(2, idx)
        BTN_RegistCancle:SetShow(true)
        BTN_Withdrawals:SetShow(false)
        BTN_Settlement:SetShow(false)
        local highItemPrice = requestDoBroadcastRegister(myItemInfo:getTotalPrice())
        local waitingItem = myItemInfo:isWaiting()
        if waitingItem == false then
          BTN_RegistCancle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTCANCEL"))
          BTN_RegistCancle:SetFontColor(UI_color.C_FFF03838)
        else
          BTN_RegistCancle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTWAITCANCEL"))
          BTN_RegistCancle:SetFontColor(UI_color.C_FFEF5378)
        end
      end
      local summaryInfo = getItemMarketSummaryInClientByItemEnchantKey(((iess:get())._key):get())
      _PA_ASSERT(summaryInfo ~= nil, "summaryInfo 정보�\128 �\173 있어야합니다")
      local temp_recentPrice = nil
      if summaryInfo ~= nil then
        temp_recentPrice = summaryInfo:getLastTradedOnePrice()
      end
      local masterInfo = (getItemMarketMasterByItemEnchantKey(((iess:get())._key):get()))
      local marketConditions = nil
      if masterInfo ~= nil then
        marketConditions = (masterInfo:getMinPrice() + masterInfo:getMaxPrice()) / toInt64(0, 2)
      end
      AveragePrice_Value:SetText(replaceCount(marketConditions))
      RecentPrice_Value:SetText(replaceCount(temp_recentPrice))
      SellPrice_Value:SetText(replaceCount(myItemInfo:getTotalPrice()))
      local _isSelfTerritory = false
      local _territoryKey = myItemInfo:getTerritoryKey()
      if currentTerritoryKey == _territoryKey then
        _isSelfTerritory = true
      end
      if ToClient_WorldMapIsShow() == true or _isSelfTerritory == false or ItemMarketItemSet.escMenuSaveValue then
        BTN_RegistCancle:SetShow(false)
        BTN_Withdrawals:SetShow(false)
        BTN_Settlement:SetShow(false)
        local _territoryKey = (myItemInfo:getTerritoryKey())
        local registTerritoryName = nil
        registTerritoryName = ""
        for i = 0, 6 do
          if i == _territoryKey then
            registTerritoryName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TEXT_REGISTTERRITORY", "territoryKey", territoryKey[i])
          end
        end
        RegistTerritoryText:SetText(registTerritoryName)
        if getGameServiceType() == 5 or getGameServiceType() == 6 then
          RegistTerritoryText:SetSize(140, 20)
          RegistTerritoryText:SetHorizonRight()
          RegistTerritoryText:SetSpanSize(5, 10)
        end
        RegistTerritoryText:SetShow(true)
        if myItemInfo:isTraded() and Int64toInt32(myItemInfo:getTotalPrice()) == 0 then
          if ToClient_WorldMapIsShow() == true or ItemMarketItemSet.escMenuSaveValue then
            RegistTerritoryText:SetPosY(18)
            RegistTerritoryText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_SELLCOMPLETE"))
          else
            RegistTerritoryText:SetShow(false)
            BTN_Withdrawals:SetShow(true)
          end
        end
      else
        RegistTerritoryText:SetShow(false)
      end
    end
  end
  -- DECOMPILER ERROR: 28 unprocessed JMP targets
end

ItemMarketItemSet.SetPosition = function(self)
  -- function num : 0_5
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_ItemMarket_ItemSet:GetSizeX()
  local panelSizeY = Panel_Window_ItemMarket_ItemSet:GetSizeY()
  Panel_Window_ItemMarket_ItemSet:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_ItemMarket_ItemSet:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

local currentMyTerritoryKey = function()
  -- function num : 0_6
  local selfPlayer = getSelfPlayer()
  local regionInfoWrapper = getRegionInfoWrapper(selfPlayer:getRegionKeyRaw())
  if regionInfoWrapper == nil then
    return -1
  end
  return regionInfoWrapper:getTerritoryKeyRaw()
end

local myItemCountCache = 0
ItemMarketItemSet.Update = function(self)
  -- function num : 0_7 , upvalues : myItemCountCache
  local itemCount = getItemMarketMyItemsCount()
  local countryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTDELAYNOTIFY", "forPremium", requestGetRefundPercentForPremiumPackage())
  if getGameServiceType() == 5 or getGameServiceType() == 6 then
    countryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTDELAYNOTIFY_JP", "forPcRoom", requestGetRefundPercentForPcRoom())
  else
    if isGameTypeEnglish() then
      countryTypeSet = ""
    else
      countryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTDELAYNOTIFY", "forPremium", requestGetRefundPercentForPremiumPackage())
    end
  end
  ;
  (self.registItemCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTITEMCOUNT", "itemCount", itemCount))
  ;
  (self.RegistDelayNotify):SetText(countryTypeSet)
  local saleCount = 0
  self.totalCount = getItemMarketMyItemsCount()
  for idx = 0, self.totalCount - 1 do
    local myItemInfo = getItemMarketMyItemByIndex(idx)
    if myItemInfo ~= nil and myItemInfo:isTraded() and Int64toInt32(myItemInfo:getTotalPrice()) == 0 then
      saleCount = saleCount + 1
    end
  end
  local waitingCount = 0
  for idx = 0, self.totalCount - 1 do
    local myItemInfo = getItemMarketMyItemByIndex(idx)
    if myItemInfo ~= nil and myItemInfo:isWaiting() == true then
      waitingCount = waitingCount + 1
    end
  end
  ;
  (self.saleItemCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTITEMCOUNT", "itemCount", tostring(saleCount)))
  ;
  (self.waitingCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTITEMCOUNT", "itemCount", tostring(waitingCount)))
  local myItemCount = getItemMarketMyItemsCount()
  if myItemCountCache < myItemCount then
    for idx = myItemCountCache, myItemCount - 1 do
      ((self._list2):getElementManager()):pushKey(toInt64(0, idx))
    end
  else
    do
      for idx = myItemCount, myItemCountCache - 1 do
        ((self._list2):getElementManager()):removeKey(toInt64(0, idx))
      end
      do
        myItemCountCache = myItemCount
        ;
        (self._list2):requestUpdateVisible()
      end
    end
  end
end

ItemMarketSecondTimeConvert = function(s64_datetime)
  -- function num : 0_8
  local leftDate = getLeftSecond_TTime64(s64_datetime)
  local s64_dayCycle = toInt64(0, 86400)
  local s64_hourCycle = toInt64(0, 3600)
  local s64_minuteCycle = toInt64(0, 60)
  local s64_day = leftDate / s64_dayCycle
  local s64_hour = (leftDate - s64_dayCycle * s64_day) / s64_hourCycle
  local s64_minute = (leftDate - s64_dayCycle * s64_day - s64_hourCycle * s64_hour) / s64_minuteCycle
  local s64_Second = leftDate - s64_dayCycle * s64_day - s64_hourCycle * s64_hour - s64_minuteCycle * s64_minute
  local strDate = ""
  if (Defines.s64_const).s64_0 < s64_day and (Defines.s64_const).s64_0 < s64_hour then
    strDate = s64_day + s64_hour
  else
    if (Defines.s64_const).s64_0 < s64_day then
      strDate = s64_day
    else
      if (Defines.s64_const).s64_0 < s64_hour then
        strDate = s64_hour + s64_minute
      else
        if (Defines.s64_const).s64_0 < s64_minute then
          strDate = s64_minute + s64_Second
        else
          if (Defines.s64_const).s64_0 <= s64_Second then
            strDate = s64_Second
          end
        end
      end
    end
  end
  return strDate
end

ItemMarketItemSet.Open = function(self, escMenu)
  -- function num : 0_9 , upvalues : ItemMarketItemSet
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  ItemMarketItemSet.escMenuSaveValue = escMenu
  if ToClient_WorldMapIsShow() or escMenu then
    requestItemMarketMyItems(true, false)
  else
    requestItemMarketMyItems(false, false)
  end
  ItemMarketItemSet:SetPosition()
  ItemMarketItemSet:Update()
  Panel_Window_ItemMarket_ItemSet:SetShow(true, true)
end

_ItemMarketItemSet_ShowToolTip = function(idx)
  -- function num : 0_10 , upvalues : ItemMarketItemSet
  local self = ItemMarketItemSet
  if idx == nil then
    _ItemMarketItemSet_HideToolTip()
    return 
  end
  local contents = (self._list2):GetContentByKey(toInt64(0, idx))
  if contents ~= nil then
    local item_Slot = (UI.getChildControl)(contents, "Template_Static_Slot")
    local myItemInfo = getItemMarketMyItemByIndex(idx)
    if myItemInfo:isTraded() then
      local itemWrapper = (getItemMarketMyItemByIndex(idx)):getItemEnchantStaticStatusWrapper()
      Panel_Tooltip_Item_Show(itemWrapper, item_Slot, true, false, nil)
    else
      do
        local itemWrapper = (getItemMarketMyItemByIndex(idx)):getItemWrapper()
        Panel_Tooltip_Item_Show(itemWrapper, item_Slot, false, true, nil)
      end
    end
  end
end

_ItemMarketItemSet_HideToolTip = function()
  -- function num : 0_11
  Panel_Tooltip_Item_hideTooltip()
  TooltipSimple_Hide()
end

_ItemMarketItemSet_ChangeBgTexture = function(bgType, idx)
  -- function num : 0_12 , upvalues : ItemMarketItemSet, bgTexture
  local self = ItemMarketItemSet
  local contents = (self._list2):GetContentByKey(toInt64(0, idx))
  if contents ~= nil then
    local ItemBG = (UI.getChildControl)(contents, "Template_Static_ItemBG")
    ItemBG:ChangeTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/ItemMarket_00.dds")
    ItemBG:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/ItemMarket_00.dds")
    ItemBG:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/ItemMarket_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(ItemBG, ((bgTexture[bgType])[0])[1], ((bgTexture[bgType])[0])[2], ((bgTexture[bgType])[0])[3], ((bgTexture[bgType])[0])[4])
    ;
    (ItemBG:getBaseTexture()):setUV(x1, y1, x2, y2)
    ItemBG:setRenderTexture(ItemBG:getBaseTexture())
    local x1, y1, x2, y2 = setTextureUV_Func(ItemBG, ((bgTexture[bgType])[1])[1], ((bgTexture[bgType])[1])[2], ((bgTexture[bgType])[1])[3], ((bgTexture[bgType])[1])[4])
    ;
    (ItemBG:getOnTexture()):setUV(x1, y1, x2, y2)
    local x1, y1, x2, y2 = setTextureUV_Func(ItemBG, ((bgTexture[bgType])[2])[1], ((bgTexture[bgType])[2])[2], ((bgTexture[bgType])[2])[3], ((bgTexture[bgType])[2])[4])
    ;
    (ItemBG:getClickTexture()):setUV(x1, y1, x2, y2)
  end
end

HandleClicked_ItemMarketItemSet_RegistCancle = function(itemEnchantKeyRaw, index)
  -- function num : 0_13 , upvalues : ItemMarketItemSet
  if Panel_Win_System:GetShow() then
    return 
  end
  local self = ItemMarketItemSet
  local doCancel = function()
    -- function num : 0_13_0 , upvalues : itemEnchantKeyRaw, index
    requestCancelMyRegistedItemForItemMarket(itemEnchantKeyRaw, index)
    return 
  end

  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTCANCEL_DO")
  local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = doCancel, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData, "middle")
end

local withdrawalsItemKey = -1
local withdrawalsIndex = -1
HandleClicked_ItemMarketItemSet_ItemWithdrawals = function(itemEnchantKeyRaw, index)
  -- function num : 0_14 , upvalues : ItemMarketItemSet, UI_BUFFTYPE, withdrawalsItemKey, withdrawalsIndex
  if Panel_Win_System:GetShow() then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local myItemInfo = getItemMarketMyItemByIndex(index)
  if myItemInfo == nil then
    return 
  end
  local iess = myItemInfo:getItemEnchantStaticStatusWrapper()
  if iess == nil then
    return 
  end
  local self = ItemMarketItemSet
  local temporaryWrapper = getTemporaryInformationWrapper()
  local isPcRoom = temporaryWrapper:isPcRoom()
  local left_premiumTime = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local left_SecretDealsTime = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local isPremiumUser = false
  local isSecretDealsUser = false
  local isCashitem = (iess:get()):isCash()
  if left_premiumTime then
    isPremiumUser = true
  end
  if left_SecretDealsTime then
    isSecretDealsUser = true
  end
  local myItemInfo = getItemMarketMyItemByIndex(index)
  local itemTotalPrice = myItemInfo:getTradedTotalPrice()
  local isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_PCROOMMEMO", "forPremium", requestGetRefundPercentForPremiumPackage())
  if getGameServiceType() == 5 or getGameServiceType() == 6 then
    isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_PCROOMMEMO_JP", "pcRoom", requestGetRefundPercentForPcRoom())
  else
    isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_PCROOMMEMO", "forPremium", requestGetRefundPercentForPremiumPackage())
  end
  local ItemWithdrawalsExecute = function()
    -- function num : 0_14_0 , upvalues : ItemMarketItemSet, itemTotalPrice, withdrawalsItemKey, withdrawalsIndex
    local self = ItemMarketItemSet
    local toWhereType = (CppEnums.ItemWhereType).eInventory
    if (self.btn_Warehouse):IsCheck() or toInt64(0, 500000) <= itemTotalPrice then
      toWhereType = (CppEnums.ItemWhereType).eWarehouse
    end
    requestWithdrawSellingItemMoneyForItemMarket(withdrawalsItemKey, withdrawalsIndex, toWhereType)
    withdrawalsItemKey = -1
    withdrawalsIndex = -1
  end

  withdrawalsItemKey = itemEnchantKeyRaw
  withdrawalsIndex = index
  if isPremiumUser == false and not isCashitem then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
    local messageBoxMemo = isCountryTypeSet
    if isSecretDealsUser == false then
      do
        local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = ItemWithdrawalsExecute, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData, "middle")
        if isGameTypeRussia() and isServerFixedCharge() then
          local doWithdrawals = function()
    -- function num : 0_14_1 , upvalues : self, itemTotalPrice, itemEnchantKeyRaw, index, withdrawalsItemKey, withdrawalsIndex
    local toWhereType = (CppEnums.ItemWhereType).eInventory
    if (self.btn_Warehouse):IsCheck() or toInt64(0, 500000) <= itemTotalPrice then
      toWhereType = (CppEnums.ItemWhereType).eWarehouse
    end
    requestWithdrawSellingItemMoneyForItemMarket(itemEnchantKeyRaw, index, toWhereType)
    withdrawalsItemKey = -1
    withdrawalsIndex = -1
  end

          doWithdrawals()
        else
          do
            local doWithdrawals = function()
    -- function num : 0_14_2 , upvalues : self, itemTotalPrice, itemEnchantKeyRaw, index, withdrawalsItemKey, withdrawalsIndex
    local toWhereType = (CppEnums.ItemWhereType).eInventory
    if (self.btn_Warehouse):IsCheck() or toInt64(0, 500000) <= itemTotalPrice then
      toWhereType = (CppEnums.ItemWhereType).eWarehouse
    end
    requestWithdrawSellingItemMoneyForItemMarket(itemEnchantKeyRaw, index, toWhereType)
    withdrawalsItemKey = -1
    withdrawalsIndex = -1
  end

            doWithdrawals()
          end
        end
      end
    end
  end
end

ItemMarketSetItem_GetAllItemCheck = function()
  -- function num : 0_15 , upvalues : UI_BUFFTYPE
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if getItemMarketMyItemsCount() == 0 then
    return 
  end
  local left_premiumTime = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local left_SecretDealsTime = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local isPremiumUser = false
  local isSecretDealsUser = false
  if left_premiumTime then
    isPremiumUser = true
  end
  if left_SecretDealsTime then
    isSecretDealsUser = true
  end
  local isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKETSET_GETALLITEMDESC_MEMOBOX", "forPremium", requestGetRefundPercentForPremiumPackage())
  if isGameTypeJapan() then
    isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_PCROOMMEMO_JP", "pcRoom", requestGetRefundPercentForPcRoom())
  else
    isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKETSET_GETALLITEMDESC_MEMOBOX", "forPremium", requestGetRefundPercentForPremiumPackage())
  end
  if isPremiumUser == false then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
    local messageBoxMemo = isCountryTypeSet
    if isSecretDealsUser == false then
      do
        local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = ItemMarketSetItem_GetAllItem, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
        if isGameTypeRussia() and isServerFixedCharge() then
          ItemMarketSetItem_GetAllItem()
        else
          ItemMarketSetItem_GetAllItem()
        end
      end
    end
  end
end

ItemMarketSetItem_GetAllItem = function()
  -- function num : 0_16
  local myItemCount = getItemMarketMyItemsCount()
  for i = 0, myItemCount - 1 do
    local myItemInfo = getItemMarketMyItemByIndex(i)
    if myItemInfo ~= nil then
      local iess = myItemInfo:getItemEnchantStaticStatusWrapper()
      if iess ~= nil and myItemInfo:isTraded() and Int64toInt32(myItemInfo:getTotalPrice()) == 0 then
        HandleClicked_ItemMarketItemSet_ItemWithdrawals(((iess:get())._key):get(), i)
      end
    end
  end
end

ItemMarketSetItem_ItemWithdrawalsExecute = function()
  -- function num : 0_17 , upvalues : ItemMarketItemSet, withdrawalsItemKey, withdrawalsIndex
  local self = ItemMarketItemSet
  local toWhereType = (CppEnums.ItemWhereType).eInventory
  if (self.btn_Warehouse):IsCheck() then
    toWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  requestWithdrawSellingItemMoneyForItemMarket(withdrawalsItemKey, withdrawalsIndex, toWhereType)
  withdrawalsItemKey = -1
  withdrawalsIndex = -1
end

HandleClicked_ItemMarketItemSet_ItemSettlement = function(itemEnchantKeyRaw, index)
  -- function num : 0_18 , upvalues : ItemMarketItemSet, UI_BUFFTYPE
  if Panel_Win_System:GetShow() then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local myItemInfo = getItemMarketMyItemByIndex(index)
  if myItemInfo == nil then
    return 
  end
  local iess = myItemInfo:getItemEnchantStaticStatusWrapper()
  if iess == nil then
    return 
  end
  local self = ItemMarketItemSet
  local left_SecretDealsTime = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local left_premiumTime = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local isPremiumUser = false
  local isSecretDealsUser = false
  local isCashItem = (iess:get()):isCash()
  if left_premiumTime then
    isPremiumUser = true
  end
  if left_SecretDealsTime then
    isSecretDealsUser = true
  end
  local isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_PCROOMMEMO", "forPremium", requestGetRefundPercentForPremiumPackage())
  if isGameTypeJapan() then
    isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_PCROOMMEMO_JP", "pcRoom", requestGetRefundPercentForPcRoom())
  else
    isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_PCROOMMEMO", "forPremium", requestGetRefundPercentForPremiumPackage())
  end
  local doSettlement = function()
    -- function num : 0_18_0 , upvalues : index, self, itemEnchantKeyRaw
    local toWhereType = (CppEnums.ItemWhereType).eInventory
    local myItemInfo = getItemMarketMyItemByIndex(index)
    local itemTotalPrice = myItemInfo:getTradedTotalPrice()
    if (self.btn_Warehouse):IsCheck() or toInt64(0, 500000) <= itemTotalPrice then
      toWhereType = (CppEnums.ItemWhereType).eWarehouse
    end
    requestCancelRegistedItemAndWithdrawMoneyForItemMarket(itemEnchantKeyRaw, index, toWhereType)
  end

  if isPremiumUser == false and not isCashItem then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
    local messageBoxMemo = isCountryTypeSet
    if isSecretDealsUser == false then
      do
        local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = doSettlement, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData, "middle")
        if isGameTypeRussia() and isServerFixedCharge() then
          doSettlement()
        else
          doSettlement()
        end
      end
    end
  end
end

HandleClicked_ItemMarketRegistItem_Open = function()
  -- function num : 0_19
  FGlobal_ItemMarketRegistItem_Open()
end

HandleClicked_ItemMarketItemSet_Close = function()
  -- function num : 0_20
  FGlobal_ItemMarketItemSet_Close()
end

ItemMarketItemSet_ToolTip = function(isShow, idx, iconType)
  -- function num : 0_21 , upvalues : ItemMarketItemSet
  local self = ItemMarketItemSet
  local name = ""
  local desc = ""
  local uiControl = nil
  local contents = (self._list2):GetContentByKey(toInt64(0, idx))
  if contents ~= nil then
    local averagePrice_Title = (UI.getChildControl)(contents, "Template_Static_AveragePrice_TitleIcon")
    local recentPrice_Title = (UI.getChildControl)(contents, "Template_Static_RecentPrice_TitleIcon")
    local sellPrice_Title = (UI.getChildControl)(contents, "Template_Static_SellPrice_TitleIcon")
    local registPeriod_Title = (UI.getChildControl)(contents, "Template_Static_RegistPeriod_TitleIcon")
    local sellCountIcon = (UI.getChildControl)(contents, "Template_Static_SellCountIcon")
    local sellCompleteIcon = (UI.getChildControl)(contents, "Template_Static_SellCompleteIcon")
    if iconType == 0 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_AVGPRICE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_AVGPRICE_DESC")
      uiControl = averagePrice_Title
    else
      if iconType == 1 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_RECENTPRICE_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_RECENTPRICE_DESC")
        uiControl = recentPrice_Title
      else
        if iconType == 2 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_SELLPRICE_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_SELLPRICE_DESC")
          uiControl = sellPrice_Title
        else
          if iconType == 3 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_REGISTPERIOD_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_REGISTPERIOD_DESC")
            uiControl = registPeriod_Title
          else
            if iconType == 4 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_SELLCOUNTITEM_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_SELLCOUNTITEM_DESC")
              uiControl = sellCountIcon
            else
              if iconType == 5 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_SELLCOMPLETE_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_TOOLTIP_SELLCOMPLETE_DESC")
                uiControl = sellCompleteIcon
              end
            end
          end
        end
      end
    end
    if isShow == true then
      TooltipSimple_Show(uiControl, name, desc)
    else
      TooltipSimple_Hide()
    end
  else
    do
      TooltipSimple_Hide()
    end
  end
end

FGlobal_ItemMarketMyItems_Update = function()
  -- function num : 0_22 , upvalues : ItemMarketItemSet
  local self = ItemMarketItemSet
  self:SetPosition()
  self:Update()
end

FGlobal_ItemMarketItemSet_Open = function()
  -- function num : 0_23 , upvalues : ItemMarketItemSet
  local self = ItemMarketItemSet
  if Panel_Window_ItemMarket_ItemSet:GetShow() then
    return 
  end
  if Panel_Window_ItemMarket:GetShow() then
    if isNewItemmarket_chk() then
      FGolbal_ItemMarketNew_Close()
    else
      FGolbal_ItemMarketNew_Close()
    end
  end
  if Panel_ItemMarket_AlarmList:GetShow() then
    FGlobal_ItemMarketAlarmList_Close()
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
  ;
  (self.invenMoney):SetShow(true)
  ;
  (self.warehouseMoney):SetShow(true)
  ;
  (self.btn_Inven):SetShow(true)
  ;
  (self.btn_Inven):SetEnableArea(0, 0, 215, (self.btn_Inven):GetSizeY())
  ;
  (self.btn_Warehouse):SetShow(true)
  ;
  (self.btn_Warehouse):SetEnableArea(0, 0, 215, (self.btn_Warehouse):GetSizeY())
  ;
  (self.btn_Inven):SetCheck(false)
  ;
  (self.btn_Warehouse):SetCheck(true)
  ;
  (self.btn_RegistItem):SetShow(true)
  ;
  (self.btn_GetAll):SetShow(false)
  self:SetPosition()
  self:Open()
end

FGlobal_ItemMarketItemSet_Open_ForWorldMap = function(escMenu)
  -- function num : 0_24 , upvalues : ItemMarketItemSet
  local self = ItemMarketItemSet
  if Panel_Window_ItemMarket_ItemSet:GetShow() then
    return 
  end
  if Panel_Window_ItemMarket:GetShow() then
    FGolbal_ItemMarketNew_Close()
  end
  if Panel_Window_ItemMarket_BuyConfirm:GetShow() then
    FGlobal_ItemMarket_BuyConfirm_Close()
  end
  ;
  (self.invenMoney):SetShow(false)
  ;
  (self.warehouseMoney):SetShow(false)
  ;
  (self.btn_Inven):SetShow(false)
  ;
  (self.btn_Warehouse):SetShow(false)
  ;
  (self.btn_RegistItem):SetShow(false)
  ;
  (self.btn_GetAll):SetShow(false)
  self:SetPosition()
  self:Open(escMenu)
  if Panel_Window_ItemMarket:IsUISubApp() then
    Panel_Window_ItemMarket_ItemSet:OpenUISubApp()
  end
  if Panel_Window_ItemMarket:GetShow() then
    FGolbal_ItemMarketNew_Close()
  end
end

ItemMarketItemSet_SimpleToolTips = function(tipType, isShow)
  -- function num : 0_25 , upvalues : ItemMarketItemSet
  local name, desc, control = nil, nil, nil
  local self = ItemMarketItemSet
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_INVEN_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_INVEN_DESC")
    control = self.btn_Inven
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_WAREHOUSE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_WAREHOUSE_DESC")
      control = self.btn_Warehouse
    end
  end
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

FGlobal_ItemMarketItemSet_Close = function()
  -- function num : 0_26
  _ItemMarketItemSet_HideToolTip()
  Panel_Window_ItemMarket_ItemSet:SetShow(false, false)
  Panel_Window_ItemMarket_ItemSet:CloseUISubApp()
end

ItemMarketItemSet_UpdateMoney = function()
  -- function num : 0_27
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_UPDATEMONEY_ACK"), 5)
end

ItemMarketItemSet_UpdateMoneyByWarehouse = function()
  -- function num : 0_28 , upvalues : ItemMarketItemSet
  (ItemMarketItemSet.invenMoney):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  (ItemMarketItemSet.warehouseMoney):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
end

ItemMarketSetItem_GetAllItem_Simpletooltip = function(isShow)
  -- function num : 0_29 , upvalues : ItemMarketItemSet
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  local self = ItemMarketItemSet
  name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETITEMSET_SIMPLETOOLTIP_GETALLITEM_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETITEMSET_SIMPLETOOLTIP_GETALLITEM_DESC")
  control = self.btn_GetAll
  TooltipSimple_Show(control, name, desc)
end

ItemMarketItemSet.registEventHandler = function(self)
  -- function num : 0_30
  (self.btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketItemSet_Close()")
  ;
  (self.btn_RegistItem):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketRegistItem_Open()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"ItemMarket\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"ItemMarket\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"ItemMarket\", \"false\")")
  ;
  (self.btn_Inven):addInputEvent("Mouse_On", "ItemMarketItemSet_SimpleToolTips( 0, true )")
  ;
  (self.btn_Inven):addInputEvent("Mouse_Out", "ItemMarketItemSet_SimpleToolTips( false )")
  ;
  (self.btn_Warehouse):addInputEvent("Mouse_On", "ItemMarketItemSet_SimpleToolTips( 1, true )")
  ;
  (self.btn_Warehouse):addInputEvent("Mouse_Out", "ItemMarketItemSet_SimpleToolTips( false )")
  ;
  (self.btn_Inven):setTooltipEventRegistFunc("ItemMarketItemSet_SimpleToolTips( 0, true )")
  ;
  (self.btn_Warehouse):setTooltipEventRegistFunc("ItemMarketItemSet_SimpleToolTips( 1, true )")
end

ItemMarketItemSet.registMessageHandler = function(self)
  -- function num : 0_31
  registerEvent("FromClient_InventoryUpdate", "ItemMarketItemSet_UpdateMoneyByWarehouse")
  registerEvent("EventWarehouseUpdate", "ItemMarketItemSet_UpdateMoneyByWarehouse")
  registerEvent("FromClient_WarehousePushMoney", "ItemMarketItemSet_UpdateMoney")
end

ItemMarketItemSet:Initialize()
ItemMarketItemSet:registEventHandler()
ItemMarketItemSet:registMessageHandler()

