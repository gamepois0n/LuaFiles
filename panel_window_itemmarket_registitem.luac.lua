-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_registitem.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_Window_ItemMarket_RegistItem:SetShow(false)
Panel_Window_ItemMarket_RegistItem:setGlassBackground(true)
Panel_Window_ItemMarket_RegistItem:ActiveMouseEventEffect(true)
local ItemMarketRegistItem = {
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, btn_Close = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Button_Win_Close"), btn_Cancle = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Button_Cancle"), btn_Confirm = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Button_Confirm"), slotBG = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_SlotBG"), itemName = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_ItemName"), priceEdit = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Edit_SellPrice"), btn_MinPrice = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Button_MinPrice"), btn_MaxPrice = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Button_MaxPrice"), btn_CheckPrice = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Button_CheckSum"), SellSumPrice = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_SellSumPriceValue"), sellItemTitle = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_SubTitle1"), averagePriceIcon = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_AveragePrice_TitleIcon"), recentPriceIcon = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_RecentPrice_TitleIcon"), maxPriceIcon = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_MaxPrice_TitleIcon"), minPriceIcon = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_MinPrice_TitleIcon"), registHighPriceIcon = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_RegistHighPrice_TitleIcon"), registLowPriceIcon = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_RegistLowPrice_TitleIcon"), registListCountIcon = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_RegistListCount_TitleIcon"), registItemCountIcon = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Static_RegistItemCount_TitleIcon"), guideText = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_GuideText"), titleText = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_Title"), averagePrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_AveragePrice_Value"), recentPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_RecentPrice_Value"), max_Value = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_Max_Value"), minPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_MinPrice_Value"), registHighPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_RegistHighPrice_Value"), registLowPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_RegistLowPrice_Value"), registListCount_Value = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_RegistListCount_Value"), registItemCount_Value = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_RegistItemCount_Value"), _buttonQuestion = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Button_Question"), _buttonPassword = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "Button_Pass"), _staticTextPassword = (UI.getChildControl)(Panel_Window_ItemMarket_RegistItem, "StaticText_PassState"), 
itemSlot = {}
, _invenWhereType = 0, _invenSlotNo = 0, _registerCount = 0, _waypointKey = 0, _minPrice = 0, _maxPrice = 0, _isByMaid = false, _priceCheck = false, _isAblePearlProduct = false, 
_lastRegistPrice = {}
, _itemKey = nil, _password = 0}
local territoryKey = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")), [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")), [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")), [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6"))}
ItemMarketRegistItem_ShowAni = function()
  -- function num : 0_0
end

ItemMarketRegistItem_HideAni = function()
  -- function num : 0_1
end

ItemMarketRegistItem.Initialize = function(self)
  -- function num : 0_2
  (self.priceEdit):SetNumberMode()
  ;
  (self.priceEdit):SetMaxInput(13)
  ;
  (SlotItem.new)(self.itemSlot, "ItemMarketRegistItem_Icon", 0, self.slotBG, self.slotConfig)
  ;
  (self.itemSlot):createChild()
  self._isAblePearlProduct = requestCanRegisterPearlItemOnMarket()
end

ItemMarketRegistItem.SetPostion = function(self)
  -- function num : 0_3
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_ItemMarket_RegistItem:GetSizeX()
  local panelSizeY = Panel_Window_ItemMarket_RegistItem:GetSizeY()
  Panel_Window_ItemMarket_RegistItem:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_ItemMarket_RegistItem:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

ItemMarketRegistItem.Clear = function(self)
  -- function num : 0_4 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local emptyText = nil
  emptyText = ""
  ;
  (self.priceEdit):SetEditText(emptyText, true)
  ;
  (self.priceEdit):SetNumberMode(true)
  ;
  (self.averagePrice_Value):SetText("0")
  ;
  (self.recentPrice_Value):SetText("0")
  ;
  (self.max_Value):SetText("0")
  ;
  (self.minPrice_Value):SetText("0")
  ;
  (self.registHighPrice_Value):SetText("0")
  ;
  (self.registLowPrice_Value):SetText("0")
  ;
  (self.registListCount_Value):SetText("0")
  ;
  (self.registItemCount_Value):SetText("0")
  ;
  (self.SellSumPrice):SetText("")
  self._invenWhereType = -1
  self._invenSlotNo = -1
  self._waypointKey = 0
end

ItemMarketRegistItem.getTargetItem = function(self)
  -- function num : 0_5
  if self._invenWhereType < 0 or self._invenSlotNo < 0 then
    return 
  end
  if (CppEnums.ItemWhereType).eInventory == self._invenWhereType or (CppEnums.ItemWhereType).eCashInventory == self._invenWhereType then
    return getInventoryItemByType(self._invenWhereType, self._invenSlotNo)
  else
    if (CppEnums.ItemWhereType).eWarehouse == self._invenWhereType then
      if self._waypointKey <= 0 then
        return 
      end
      local warehouseWrapper = warehouse_get(self._waypointKey)
      return warehouseWrapper:getItem(self._invenSlotNo)
    end
  end
end

ItemMarketRegistItem.Update = function(self)
  -- function num : 0_6 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local registedItemCount = getItemMarketMyItemsCount()
  ;
  (self.sellItemTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ENABLE_REGISTCOUNT", "itemCount", 30 - registedItemCount))
  local itemWrapper = self:getTargetItem()
  if not itemWrapper then
    _PA_ASSERT(false, "itemWrapper 없습니다. 비정상입니다.")
    return 
  end
  local itemSS = itemWrapper:getStaticStatus()
  local itemKey = ((itemSS:get())._key):get()
  local summaryInfo = getItemMarketSummaryInClientByItemEnchantKey(((itemSS:get())._key):get())
  local masterInfo = getItemMarketMasterByItemEnchantKey(((itemSS:get())._key):get())
  if summaryInfo == nil or masterInfo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_NOREGISTITEM_ACK"))
    return 
  end
  local registHighPrice = summaryInfo:getDisplayedHighestOnePrice()
  local registLowPrice = summaryInfo:getDisplayedLowestOnePrice()
  local marketConditions = (masterInfo:getMinPrice() + masterInfo:getMaxPrice()) / toInt64(0, 2)
  local recentPrice = summaryInfo:getLastTradedOnePrice()
  local registListCount = summaryInfo:getTradedTotalAmount()
  local registItemCount = summaryInfo:getDisplayedTotalAmount()
  local itemMaxPrice = masterInfo:getMaxPrice()
  local itemMinPrice = masterInfo:getMinPrice()
  self._minPrice = masterInfo:getMinPrice()
  self._maxPrice = masterInfo:getMaxPrice()
  ;
  ((self.itemSlot).icon):addInputEvent("Mouse_On", "_ItemMarketRegistItem_ShowToolTip( " .. self._invenSlotNo .. ", " .. self._invenWhereType .. " )")
  ;
  ((self.itemSlot).icon):addInputEvent("Mouse_Out", "_ItemMarketRegistItem_HideToolTip()")
  local replaceCount = function(num)
    -- function num : 0_6_0
    local count = Int64toInt32(num)
    if count == 0 then
      count = "-"
    else
      count = makeDotMoney(num)
    end
    return count
  end

  self._itemKey = itemKey
  ;
  (self.registHighPrice_Value):SetText(replaceCount(registHighPrice))
  ;
  (self.registLowPrice_Value):SetText(replaceCount(registLowPrice))
  ;
  (self.averagePrice_Value):SetText(replaceCount(marketConditions))
  ;
  (self.recentPrice_Value):SetText(replaceCount(recentPrice))
  ;
  (self.registListCount_Value):SetText(replaceCount(registListCount))
  ;
  (self.registItemCount_Value):SetText(replaceCount(registItemCount))
  ;
  (self.max_Value):SetText(makeDotMoney(itemMaxPrice))
  ;
  (self.minPrice_Value):SetText(makeDotMoney(itemMinPrice))
  if (self._lastRegistPrice)[itemKey] ~= nil then
    recentPrice = toInt64(0, (self._lastRegistPrice)[itemKey])
  end
  local highAndLowAvgPrice = (masterInfo:getMaxPrice() + masterInfo:getMinPrice()) / toInt64(0, 2)
  if toInt64(0, 0) < recentPrice then
    (self.priceEdit):SetEditText(tostring(makeDotMoney(recentPrice)), true)
  end
  self._averagePrice = highAndLowAvgPrice
  if itemMaxPrice < recentPrice or recentPrice < itemMinPrice then
    (self.priceEdit):SetEditText(tostring(makeDotMoney(highAndLowAvgPrice)), true)
  end
  if registItemCount == toInt64(0, 0) then
    (self.priceEdit):SetEditText(tostring(makeDotMoney(itemMaxPrice)), true)
  end
end

ItemMarketRegistItem.RegistDO = function(self)
  -- function num : 0_7 , upvalues : ItemMarketRegistItem
  if self._invenWhereType == -1 or self._invenSlotNo == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_REGISTITEM_ACK"))
    return 
  end
  local pricePerOne = nil
  local onePrice = (self.priceEdit):GetEditText()
  onePrice = (string.gsub)(onePrice, ",", "")
  pricePerOne = tonumber64(onePrice)
  if pricePerOne == nil or pricePerOne <= toInt64(0, 0) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_PERITEMPRICE_ACK"))
    return 
  end
  local self = ItemMarketRegistItem
  local itemWrapper = self:getTargetItem()
  if not itemWrapper then
    _PA_ASSERT(false, "itemWrapper 없습니다. 비정상입니다.")
    return 
  end
  local itemSS = itemWrapper:getStaticStatus()
  local masterInfo = getItemMarketMasterByItemEnchantKey(((itemSS:get())._key):get())
  if masterInfo:getMaxPrice() < pricePerOne or pricePerOne < masterInfo:getMinPrice() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ERRORPRICE_ACK"))
    return 
  end
  local doBroadCast = requestDoBroadcastRegister(pricePerOne)
  if toInt64(0, 0) < pricePerOne then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_MESSAGEBOX_ALERT")
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_CANCELITEM_MSGBOX")
    local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = ItemMarketItemSet_RegistDo_FromDoBroadcast, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "top")
    return 
  end
  do
    if itemWrapper:isCash() then
      PaymentPassword(ItemMarketItemSet_RegistDo_FromPaymentPassword)
    else
      if self._isByMaid then
        local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
        if regionInfo == nil then
          return 
        end
        if checkMaid_SubmitMarket(true) then
          requestRegisterItemForItemMarketByMaid(self._invenWhereType, self._invenSlotNo, self._registerCount, pricePerOne, self._password)
        else
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_COOLTIME"))
          return 
        end
      else
        do
          requestRegisterItemForItemMarket(self._invenWhereType, self._invenSlotNo, self._registerCount, pricePerOne, self._password)
          self._priceCheck = false
          itemMarket_afterRegist()
        end
      end
    end
  end
end

itemMarket_afterRegist = function()
  -- function num : 0_8 , upvalues : ItemMarketRegistItem, UI_TM
  local self = ItemMarketRegistItem
  ;
  ((self.itemSlot).icon):addInputEvent("Mouse_On", "")
  ;
  ((self.itemSlot).icon):addInputEvent("Mouse_Out", "")
  self:Clear()
  ;
  (self.itemSlot):clearItem()
  ;
  (self.itemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.itemName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ITEMSELECT_TEXT"))
  ClearFocusEdit()
  local registedItemCount = getItemMarketMyItemsCount()
  ;
  (self.sellItemTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ENABLE_REGISTCOUNT", "itemCount", 30 - registedItemCount))
  FGlobal_ItemMarketPassword_CanelPassword()
  FGlobal_ItemMarketRegistItem_CancelPassword()
end

ItemMarketItemSet_RegistDo_FromDoBroadcast = function()
  -- function num : 0_9 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local itemWrapper = self:getTargetItem()
  if not itemWrapper then
    _PA_ASSERT(false, "itemWrapper 없습니다. 비정상입니다.")
    return 
  end
  local pricePerOne = nil
  local onePrice = (self.priceEdit):GetEditText()
  onePrice = (string.gsub)(onePrice, ",", "")
  pricePerOne = tonumber64(onePrice)
  if itemWrapper:isCash() then
    PaymentPassword(ItemMarketItemSet_RegistDo_FromPaymentPassword)
  else
    if self._isByMaid then
      local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
      if regionInfo == nil then
        return 
      end
      if checkMaid_SubmitMarket(true) then
        requestRegisterItemForItemMarketByMaid(self._invenWhereType, self._invenSlotNo, self._registerCount, pricePerOne, self._password)
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_COOLTIME"))
        return 
      end
    else
      do
        requestRegisterItemForItemMarket(self._invenWhereType, self._invenSlotNo, self._registerCount, pricePerOne, self._password)
        self._priceCheck = false
        itemMarket_afterRegist()
      end
    end
  end
end

ItemMarketItemSet_RegistDo_FromPaymentPassword = function()
  -- function num : 0_10 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local pricePerOne = nil
  local onePrice = (self.priceEdit):GetEditText()
  onePrice = (string.gsub)(onePrice, ",", "")
  pricePerOne = tonumber64(onePrice)
  if self._isByMaid then
    local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    if regionInfo == nil then
      return 
    end
    if checkMaid_SubmitMarket(true) then
      requestRegisterItemForItemMarketByMaid(self._invenWhereType, self._invenSlotNo, self._registerCount, pricePerOne, self._password)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_COOLTIME"))
      return 
    end
  else
    do
      requestRegisterItemForItemMarket(self._invenWhereType, self._invenSlotNo, self._registerCount, pricePerOne, self._password)
      self._priceCheck = false
      itemMarket_afterRegist()
    end
  end
end

local savedConfirmPrice = 0
_ItemMarketRegistItem_RegistDO = function()
  -- function num : 0_11 , upvalues : ItemMarketRegistItem, savedConfirmPrice
  local self = ItemMarketRegistItem
  local onePrice = (self.priceEdit):GetEditText()
  local itemCount = self._registerCount
  onePrice = (string.gsub)(onePrice, ",", "")
  if not self._priceCheck then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_PERITEMPRICECONFIRM_ACK"))
    return 
  else
    if onePrice == "" then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ITEMSELECT_TEXT"))
      return 
    end
  end
  local sumItemPrice = onePrice * itemCount
  if toUint64(0, savedConfirmPrice) ~= toUint64(0, sumItemPrice) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETREGIST_CONFIRMPRICE"))
  else
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._lastRegistPrice)[self._itemKey] = onePrice
    ItemMarketRegistItem:RegistDO()
  end
end

HandleClicked_ItemMarketRegistItem_RegistDO = function()
  -- function num : 0_12
  _ItemMarketRegistItem_RegistDO()
end

HandleClicked_ItemMarketRegistItem_NumberPadShow = function()
  -- function num : 0_13 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local itemWrapper = self:getTargetItem()
  if (Defines.s64_const).s64_1 == self._maxPrice then
    itemPrice_MinOrMax(self._maxPrice, self._invenSlotNo, self._invenWhereType)
  else
    if itemWrapper ~= nil then
      Panel_NumberPad_Show(true, self._maxPrice, self._invenSlotNo, itemPrice_MinOrMax, nil, self._invenWhereType)
    else
      ClearFocusEdit()
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_NOSELECTITEM_ACK"))
    end
  end
end

itemPrice_MinOrMax = function(price, invenSlotNo, invenWhereType)
  -- function num : 0_14 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local countPrice = price
  local countMin = self._minPrice
  if countMin < countPrice then
    (self.priceEdit):SetEditText(tostring(makeDotMoney(countPrice)), true)
  else
    ;
    (self.priceEdit):SetEditText(tostring(makeDotMoney(countMin)), true)
  end
end

HandleClicked_ItemMarketRegistItem_SellPriceMinOrMax = function(index)
  -- function num : 0_15 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local itemWrapper = self:getTargetItem()
  if not itemWrapper then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_NOSELECTITEM_ACK"))
    return 
  end
  if itemWrapper ~= nil then
    if index == 0 then
      (self.priceEdit):SetEditText(tostring(makeDotMoney(self._minPrice)), true)
    else
      if index == 1 then
        (self.priceEdit):SetEditText(tostring(makeDotMoney(self._maxPrice)), true)
      end
    end
  end
end

HandleClicked_ItemMarketRegistItem_SellPriceSum = function()
  -- function num : 0_16 , upvalues : ItemMarketRegistItem, savedConfirmPrice
  local self = ItemMarketRegistItem
  self._priceCheck = true
  local onePrice = (self.priceEdit):GetEditText()
  local itemCount = self._registerCount
  onePrice = (string.gsub)(onePrice, ",", "")
  if onePrice == nil or onePrice == "" or onePrice == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_PERPRICE_ACK"))
    return 
  end
  if itemCount == nil or itemCount == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_NOSELECTITEM_ACK"))
    return 
  end
  local sumItemPrice = onePrice * itemCount
  savedConfirmPrice = sumItemPrice
  ;
  (self.SellSumPrice):SetText(makeDotMoney(sumItemPrice))
end

FGlobal_ItemMarketRegistItem_RegistDO = function()
  -- function num : 0_17
  _ItemMarketRegistItem_RegistDO()
end

FGlobal_ItemMarketRegistItem_Open = function(isOpenWarehouse, isByMaid)
  -- function num : 0_18 , upvalues : ItemMarketRegistItem, territoryKey, UI_TM
  local self = ItemMarketRegistItem
  local regionInfoWrapper = getRegionInfoWrapper((getSelfPlayer()):getRegionKeyRaw())
  if regionInfoWrapper == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ERRORAREA_ACK"))
    return 
  end
  if isOpenWarehouse then
    requestItemMarketMyItems(true, true)
    if Panel_Window_SearchMenuWareHouse:GetShow() == true then
      FGlobal_SearchMenuWareHouse_Show(false)
    end
  end
  if Panel_Window_ItemMarket:GetShow() then
    FGolbal_ItemMarketNew_Close()
  end
  ;
  (self.titleText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ITEMMODIFY_TEXT", "getItem", territoryKey[regionInfoWrapper:getTerritoryKeyRaw()]))
  self._invenWhereType = -1
  self._invenSlotNo = -1
  self._registerCount = 0
  if isByMaid == nil then
    self._isByMaid = false
  else
    self._isByMaid = isByMaid
  end
  ;
  (self.itemName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ITEMSELECT_TEXT"))
  ;
  ((self.itemSlot).icon):SetShow(true)
  ;
  ((self.itemSlot).icon):addInputEvent("Mouse_On", "")
  ;
  ((self.itemSlot).icon):addInputEvent("Mouse_Out", "")
  ;
  (self.slotBG):SetShow(true)
  ;
  (self.itemName):SetShow(true)
  self:Clear()
  ;
  (self.itemSlot):clearItem()
  ClearFocusEdit()
  FGlobal_ItemMarketItemSet_Close()
  ItemMarketRegistItem:SetPostion()
  Panel_Window_ItemMarket_RegistItem:SetShow(true)
  local selfPlayer = getSelfPlayer()
  local regionInfoWrapper = getRegionInfoWrapper(selfPlayer:getRegionKeyRaw())
  if regionInfoWrapper == nil then
    return 
  end
  local siegeWrapper = ToClient_GetSiegeWrapperByRegionKey(regionInfoWrapper:getAffiliatedTownRegionKey())
  if siegeWrapper == nil then
    return 
  end
  local isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_GUIDETEXT2", "forPremium", requestGetRefundPercentForPremiumPackage())
  if getGameServiceType() == 5 or getGameServiceType() == 6 then
    isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_GUIDETEXT2_JP", "pcRoom", requestGetRefundPercentForPcRoom())
  else
    isCountryTypeSet = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_GUIDETEXT2", "forPremium", requestGetRefundPercentForPremiumPackage())
  end
  local transferTaxRate = siegeWrapper:getTaxRateForFortress((CppEnums.TaxType).eTaxTypeSellItemToItemMarket)
  ;
  (self.guideText):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.guideText):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_GUIDETEXT", "feePercent", requestGetTradeFeePercent(), "transferTaxRate", transferTaxRate) .. isCountryTypeSet)
  Inventory_SetFunctor(FGlobal_ItemMarket_InvenFilter_IsRegistItem, FGlobal_ItemMarket_InvenFilter_RClick, InventoryWindow_Close, nil)
  if isOpenWarehouse == nil then
    Inventory_SetShow(true)
  end
  if getScreenSizeX() / 2 < Panel_Window_Inventory:GetSizeX() + Panel_Window_ItemMarket_RegistItem:GetSizeX() / 2 then
    Panel_Window_ItemMarket_RegistItem:SetPosX(getScreenSizeX() - Panel_Window_Inventory:GetSizeX() - Panel_Window_ItemMarket_RegistItem:GetSizeX())
  end
  local registedItemCount = getItemMarketMyItemsCount()
  ;
  (self.sellItemTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ENABLE_REGISTCOUNT", "itemCount", 30 - registedItemCount))
end

FGlobal_ReturnIsByMaid = function()
  -- function num : 0_19 , upvalues : ItemMarketRegistItem
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  ItemMarketRegistItem._isByMaid = false
end

FGlobal_ItemMarketRegistItem_Close = function(isItemMarketItemSet_Show)
  -- function num : 0_20 , upvalues : ItemMarketRegistItem
  Panel_Window_ItemMarket_RegistItem:SetShow(false)
  FGlobal_ItemMarketPassword_CanelPassword()
  ItemMarketRegistItem_SimpleToolTip(false)
  Inventory_SetFunctor(nil, nil, nil, nil)
  if ItemMarketRegistItem._isByMaid then
    if Panel_Window_Inventory:GetShow() then
      InventoryWindow_Close()
    end
    if Panel_Window_Warehouse:GetShow() then
      Warehouse_Close()
    end
    return 
  end
  if not Panel_Window_Warehouse:GetShow() then
    if Panel_Window_Inventory:GetShow() then
      InventoryWindow_Close()
    end
    if isItemMarketItemSet_Show ~= nil and isItemMarketItemSet_Show == true then
      FGlobal_ItemMarketItemSet_Open()
    end
    _ItemMarketRegistItem_HideToolTip()
  else
    FGlobal_Warehouse_ResetFilter()
    Inventory_SetFunctor(nil, FGlobal_PopupMoveItem_InitByInventory, Warehouse_Close, nil)
    Panel_Window_Warehouse:SetVerticalMiddle()
    Panel_Window_Warehouse:SetHorizonCenter()
    Panel_Window_Warehouse:SetSpanSize(100, 0)
  end
end

FGlobal_ItemMarket_InvenFilter_IsRegistItem = function(slotNo, itemWrapper, invenWhereType)
  -- function num : 0_21 , upvalues : ItemMarketRegistItem
  if itemWrapper == nil then
    return true
  end
  local isAble = requestIsRegisterItemForItemMarket((itemWrapper:get()):getKey())
  local itemBindType = (((itemWrapper:getStaticStatus()):get())._vestedType):getItemKey()
  local isVested = (itemWrapper:get()):isVested()
  local isPersonalTrade = (itemWrapper:getStaticStatus()):isPersonalTrade()
  do
    if isVested then
      local isFilter = not isUsePcExchangeInLocalizingValue() or isPersonalTrade
    end
    if isFilter then
      return isFilter
    end
    if isAble == true then
      if ToClient_Inventory_CheckItemLock(slotNo, invenWhereType) then
        isAble = false
      else
        isAble = true
      end
    end
    if itemBindType == 2 then
      if (itemWrapper:get()):isVested() ~= true and isAble then
        isAble = true
      else
        isAble = false
      end
    end
    if itemWrapper:isCash() then
      if isAble == false and ItemMarketRegistItem._isAblePearlProduct == false then
        isAble = false
      else
        if isAble then
          isAble = ItemMarketRegistItem._isAblePearlProduct
        end
      end
    end
    return not isAble
  end
end

FGlobal_ItemMarket_InvenFilter_RClick = function(slotNo, itemWrapper, s64_count, inventoryType, waypointKey)
  -- function num : 0_22
  if (Defines.s64_const).s64_1 == s64_count then
    FGlobal_ItemMarketRegistItemFromInventory(1, slotNo, inventoryType, waypointKey)
  else
    local masterInfo = getItemMarketMasterByItemEnchantKey(((itemWrapper:get()):getKey()):get())
    if masterInfo ~= nil and masterInfo:getMaxRegisterCount() < s64_count then
      s64_count = masterInfo:getMaxRegisterCount()
    end
    Panel_NumberPad_Show(true, s64_count, slotNo, FGlobal_ItemMarketRegistItemFromInventory, nil, inventoryType, nil, waypointKey)
  end
end

FGlobal_ItemMarketRegistItemFromInventory = function(s64_count, slotNo, inventoryType, waypointKey)
  -- function num : 0_23 , upvalues : ItemMarketRegistItem, UI_color, UI_TM
  local self = ItemMarketRegistItem
  local itemWrapper = nil
  if (CppEnums.ItemWhereType).eInventory == inventoryType or (CppEnums.ItemWhereType).eCashInventory == inventoryType then
    itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  else
    if (CppEnums.ItemWhereType).eWarehouse == inventoryType then
      if not waypointKey then
        local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
        if regionInfo == nil then
          return 
        end
        local regionInfoWrapper = getRegionInfoWrapper(regionInfo:getAffiliatedTownRegionKey())
        waypointKey = (regionInfoWrapper:getPlantKeyByWaypointKey()):getWaypointKey()
        if ToClient_IsAccessibleRegionKey(regionInfo:getAffiliatedTownRegionKey()) == false then
          local plantWayKey = ToClient_GetOtherRegionKey_NeerByTownRegionKey()
          local newRegionInfo = ToClient_getRegionInfoWrapperByWaypoint(plantWayKey)
          if newRegionInfo == nil then
            return 
          end
          waypointKey = (newRegionInfo:get())._waypointKey
          if waypointKey == 0 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CANTFIND_WAREHOUSE_INTERRITORY"))
            return 
          end
        end
      end
      do
        do
          local warehouseWrapper = warehouse_get(waypointKey)
          itemWrapper = warehouseWrapper:getItem(slotNo)
          if itemWrapper == nil then
            _PA_ASSERT(false, "itemWrapper 없습니다. 비정상입니다.")
            return 
          end
          local itemSS = itemWrapper:getStaticStatus()
          local summaryInfo = getItemMarketSummaryInClientByItemEnchantKey(((itemSS:get())._key):get())
          if summaryInfo == nil then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_VENDINGMACHINE_REGISTERITEM_MESSAGE_1"))
            return 
          end
          local iconPath = itemSS:getIconPath()
          ;
          (self.itemSlot):setItemByStaticStatus(itemWrapper:getStaticStatus(), Int64toInt32(s64_count))
          local nameColorGrade = (itemSS:getGradeType())
          local nameColor = nil
          if nameColorGrade == 0 then
            nameColor = UI_color.C_FFEFEFEF
          else
            if nameColorGrade == 1 then
              nameColor = 4284350320
            else
              if nameColorGrade == 2 then
                nameColor = 4283144191
              else
                if nameColorGrade == 3 then
                  nameColor = 4294953010
                else
                  if nameColorGrade == 4 then
                    nameColor = 4294929408
                  else
                    nameColor = UI_color.C_FFFFFFFF
                  end
                end
              end
            end
          end
          ;
          (self.itemName):SetFontColor(nameColor)
          ;
          (self.itemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
          local enchantLevel = ((itemSS:get())._key):getEnchantLevel()
          if itemSS:getItemType() == 1 and enchantLevel > 15 then
            (self.itemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemSS:getName())
          else
            if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSS:getItemClassify() then
              (self.itemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemSS:getName())
            else
              ;
              (self.itemName):SetText(itemSS:getName())
            end
          end
          self._invenWhereType = inventoryType
          self._invenSlotNo = slotNo
          self._registerCount = Int64toInt32(s64_count)
          self._waypointKey = waypointKey
          self:Update()
        end
      end
    end
  end
end

_ItemMarketRegistItem_ShowToolTip = function(slotNo, inventoryType)
  -- function num : 0_24 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local itemWrapper = self:getTargetItem()
  Panel_Tooltip_Item_Show(itemWrapper, (self.itemSlot).icon, false, true, nil)
end

_ItemMarketRegistItem_HideToolTip = function()
  -- function num : 0_25
  Panel_Tooltip_Item_hideTooltip()
end

ItemMarketRegistItem_SimpleToolTip = function(isShow, iconType)
  -- function num : 0_26 , upvalues : ItemMarketRegistItem
  local self = ItemMarketRegistItem
  local name = ""
  local desc = ""
  local uiControl = nil
  if iconType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_AVGPRICE_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_AVGPRICE_DESC")
    uiControl = self.averagePriceIcon
  else
    if iconType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_RECENTPRICE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_RECENTPRICE_DESC")
      uiControl = self.recentPriceIcon
    else
      if iconType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_MAXPRICE_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_MAXPRICE_DESC")
        uiControl = self.maxPriceIcon
      else
        if iconType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_MINPRICE_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_MINPRICE_DESC")
          uiControl = self.minPriceIcon
        else
          if iconType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_REGISTHIGH_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_REGISTHIGH_DESC")
            uiControl = self.registHighPriceIcon
          else
            if iconType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_REGISTLOW_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_REGISTLOW_DESC")
              uiControl = self.registLowPriceIcon
            else
              if iconType == 6 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_REGISTLIST_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_REGISTLIST_DESC")
                uiControl = self.registListCountIcon
              else
                if iconType == 7 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_REGISTITEM_NAME")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_TOOLTIP_REGISTITEM_DESC")
                  uiControl = self.registItemCountIcon
                end
              end
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
end

ItemMarketRegistItem.registEventHandler = function(self)
  -- function num : 0_27
  (self.btn_Close):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketRegistItem_Close()")
  ;
  (self.btn_Cancle):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketRegistItem_Close()")
  ;
  (self.btn_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketRegistItem_RegistDO()")
  ;
  (self.priceEdit):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketRegistItem_NumberPadShow()")
  ;
  (self.btn_MinPrice):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketRegistItem_SellPriceMinOrMax( 0 )")
  ;
  (self.btn_MaxPrice):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketRegistItem_SellPriceMinOrMax( 1 )")
  ;
  (self.btn_CheckPrice):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketRegistItem_SellPriceSum()")
  ;
  (self.averagePriceIcon):addInputEvent("Mouse_On", "ItemMarketRegistItem_SimpleToolTip( true, 0 )")
  ;
  (self.averagePriceIcon):addInputEvent("Mouse_Out", "ItemMarketRegistItem_SimpleToolTip( false )")
  ;
  (self.recentPriceIcon):addInputEvent("Mouse_On", "ItemMarketRegistItem_SimpleToolTip( true, 1 )")
  ;
  (self.recentPriceIcon):addInputEvent("Mouse_Out", "ItemMarketRegistItem_SimpleToolTip( false )")
  ;
  (self.maxPriceIcon):addInputEvent("Mouse_On", "ItemMarketRegistItem_SimpleToolTip( true, 2 )")
  ;
  (self.maxPriceIcon):addInputEvent("Mouse_Out", "ItemMarketRegistItem_SimpleToolTip( false )")
  ;
  (self.minPriceIcon):addInputEvent("Mouse_On", "ItemMarketRegistItem_SimpleToolTip( true, 3 )")
  ;
  (self.minPriceIcon):addInputEvent("Mouse_Out", "ItemMarketRegistItem_SimpleToolTip( false )")
  ;
  (self.registHighPriceIcon):addInputEvent("Mouse_On", "ItemMarketRegistItem_SimpleToolTip( true, 4 )")
  ;
  (self.registHighPriceIcon):addInputEvent("Mouse_Out", "ItemMarketRegistItem_SimpleToolTip( false )")
  ;
  (self.registLowPriceIcon):addInputEvent("Mouse_On", "ItemMarketRegistItem_SimpleToolTip( true, 5 )")
  ;
  (self.registLowPriceIcon):addInputEvent("Mouse_Out", "ItemMarketRegistItem_SimpleToolTip( false )")
  ;
  (self.registListCountIcon):addInputEvent("Mouse_On", "ItemMarketRegistItem_SimpleToolTip( true, 6 )")
  ;
  (self.registListCountIcon):addInputEvent("Mouse_Out", "ItemMarketRegistItem_SimpleToolTip( false )")
  ;
  (self.registItemCountIcon):addInputEvent("Mouse_On", "ItemMarketRegistItem_SimpleToolTip( true, 7 )")
  ;
  (self.registItemCountIcon):addInputEvent("Mouse_Out", "ItemMarketRegistItem_SimpleToolTip( false )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"ItemMarket\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"ItemMarket\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"ItemMarket\", \"false\")")
  ;
  (self._buttonPassword):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketRegistItem_OpenRegistPassword()")
end

HandleClicked_ItemMarketRegistItem_OpenRegistPassword = function()
  -- function num : 0_28 , upvalues : ItemMarketRegistItem
  if ItemMarketRegistItem._invenSlotNo > 0 then
    FGlobal_ItemMarketPassword_Open(ItemMarketRegistItem._password)
  end
end

FGlobal_ItemMarketRegistItem_RegistPassword = function(password)
  -- function num : 0_29 , upvalues : ItemMarketRegistItem
  (ItemMarketRegistItem._staticTextPassword):SetText("잠금 아이�\156")
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ItemMarketRegistItem._password = password
end

FGlobal_ItemMarketRegistItem_CancelPassword = function()
  -- function num : 0_30 , upvalues : ItemMarketRegistItem
  (ItemMarketRegistItem._staticTextPassword):SetText("")
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  ItemMarketRegistItem._password = 0
end

ItemMarketRegistItem.registMessageHandler = function(self)
  -- function num : 0_31
end

ItemMarketRegistItem:Initialize()
ItemMarketRegistItem:registEventHandler()
ItemMarketRegistItem:registMessageHandler()
if ToClient_IsContentsGroupOpen("344") == false then
  (ItemMarketRegistItem._buttonPassword):SetShow(false)
  ;
  (ItemMarketRegistItem._staticTextPassword):SetShow(false)
end

