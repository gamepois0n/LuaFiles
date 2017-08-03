-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\trademarket\panel_window_trademarket.luac 

-- params : ...
-- function num : 0
Panel_Npc_Trade_Market:SetShow(false, false)
Panel_Npc_Trade_Market:setGlassBackground(true)
global_IsTrading = false
global_setTrading = function(istrading)
  -- function num : 0_0
  global_IsTrading = istrading
end

gDialogSceneIndex = {[enCommerceType.enCommerceType_Luxury_Miscellaneous] = 8, [enCommerceType.enCommerceType_Luxury] = 7, [enCommerceType.enCommerceType_Grocery] = 5, [enCommerceType.enCommerceType_Cloth] = 10, [enCommerceType.enCommerceType_ObjectSaint] = 11, [enCommerceType.enCommerceType_MilitarySupplies] = 12, [enCommerceType.enCommerceType_Medicine] = 6, [enCommerceType.enCommerceType_SeaFood] = 14, [enCommerceType.enCommerceType_RawMaterial] = 13, [enCommerceType.enCommerceType_Max] = 0}
local UI_TM = CppEnums.TextMode
local const_64 = Defines.s64_const
local currentTradeSlot = 0
local tradeBuyMaxCount = 9
local npcTradeShop = {buyListFrame, buyListFrameContent, _buttonExit, _staticCategoryTotal, _staticPossessMoneyText, _staticPossessMoneyValue, _staticPossessMoney, _staticTotalMoneyText, _staticTotalMoneyValue, _staticTotalMoney, _staticTotalWeightText, _staticTotalWeight, _StaticTextCartWeightLT, _button_Confirm, _button_ClearList, _button_Confirm_EnterVihicle, _currentWeightText, _buttonTradeGameStart, _currentWeightLT, _vehicleWeightLT, _vehicleWeightText, _alertpanel, _alerttext, _btnInvestNode; 
slotConfig = {createIcon = true, createBorder = true, createCount = false, createCash = true}
, _TradeBuyListRow = 3, _TradeBuyListCol = 3, _buySlotMaxCount = 14, _buyRequest = false, _selectClickIndex = 1, _selectClickItemKey = 0, _numpadNumber = toInt64(0, 1), _totalWeight = const_64.s64_0, _myRemainWeight = const_64.s64_0, _totalCost = const_64.s64_0, 
preLoadUI = {_static_Icon = nil, _static_TextItemName = nil, _static_Multiply = nil, _button_Quantity = nil, _static_Equal = nil, _static_Cost = nil, _static_CostIcon = nil}
, 
_slotBuyAmount = {}
, 
_buyList = {}
}
global_setTradeUI = function(refreshGraph)
  -- function num : 0_1 , upvalues : currentTradeSlot, npcTradeShop
  currentTradeSlot = 1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  npcTradeShop._numpadNumber = toInt64(0, 1)
  npcTradeShop:InitTradeMarket()
  npcTradeShop:initTradeData()
  if refreshGraph == true then
    global_CommerceGraphDataInit(false)
  end
  ;
  (npcTradeShop._staticPossessMoneyValue):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  (npcTradeShop._staticTotalMoneyValue):SetText("0")
  setShowLine(false)
end

global_enterBasketInShop = function(slotItemKey, index, itemCount)
  -- function num : 0_2 , upvalues : tradeBuyMaxCount, currentTradeSlot, npcTradeShop
  if tradeBuyMaxCount < currentTradeSlot then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_NOTIFYDISPLAY"))
    ;
    (UI.ASSERT)(false, "너무 많이 담으려고 합니�\164.")
    return 0
  end
  if (npcTradeShop._slotBuyAmount)[slotItemKey] ~= nil then
    return 0
  end
  local slot = (npcTradeShop._buyList)[currentTradeSlot]
  local shopItemWrapper = npcShop_getItemBuy(index)
  local buyData = {_itemCount = toInt64(0, 0), _slotIndex = 0, _itemKey = 0, _commerceTypeIndex = 0}
  local itemSS = shopItemWrapper:getStaticStatus()
  buyData._itemCount = itemCount
  buyData._slotIndex = index
  buyData._itemKey = slotItemKey
  buyData._commerceTypeIndex = itemSS:getCommerceType()
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (npcTradeShop._slotBuyAmount)[slotItemKey] = buyData
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R7 in 'UnsetPending'

  npcTradeShop._selectClickItemKey = slotItemKey
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R7 in 'UnsetPending'

  npcTradeShop._selectClickIndex = currentTradeSlot
  local s64_inventoryItemCount = nil
  local shopItem = shopItemWrapper:get()
  slot:setItem(shopItemWrapper:getStaticStatus(), shopItem.leftCount_s64, shopItem.price_s64, s64_inventoryItemCount)
  currentTradeSlot = currentTradeSlot + 1
  totalCalculateMoney()
  Panel_Tooltip_Item_SetPosition(slot.slotNo, slot, "shop")
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R9 in 'UnsetPending'

  npcTradeShop._buyRequest = false
  return 1
end

global_CheckItem_From_Cart = function(checkItemKey)
  -- function num : 0_3 , upvalues : npcTradeShop
  do return (npcTradeShop._slotBuyAmount)[checkItemKey] ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

click_TradeMarket_Quantity = function(index)
  -- function num : 0_4 , upvalues : npcTradeShop
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  npcTradeShop._selectClickIndex = index
  local slot = (npcTradeShop._buyList)[index]
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._selectClickItemKey = slot.itemKey
  param = {[0] = npcTradeShop._selectClickItemKey, [1] = index, [2] = false, [3] = ((npcTradeShop._slotBuyAmount)[npcTradeShop._selectClickItemKey])._commerceTypeIndex}
  local tradeItemWrapper = npcShop_getTradeItem(param[0])
  local buyableStack = tradeItemWrapper:getRemainStackCount()
  Panel_NumberPad_Show(true, buyableStack, param, TradeMarket_BuySome_ConfirmFunction)
end

TradeMarket_BuySome_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_5 , upvalues : npcTradeShop
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._numpadNumber = inputNumber
  local rv = global_enterBasketInShop(param[0], param[1], inputNumber)
  if rv == 0 and param[2] == true then
    return 
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((npcTradeShop._slotBuyAmount)[npcTradeShop._selectClickItemKey])._itemCount = inputNumber
  local quentityButton = ((npcTradeShop._buyList)[npcTradeShop._selectClickIndex]).button_Quantity
  quentityButton:SetText(tostring(inputNumber))
  local npcSceneCharacterKey = getClientSceneKey()
  if param[2] == true and npcSceneCharacterKey ~= 0 then
    callAIHandlerByIndex(1, gDialogSceneIndex[param[3]], "SceneTradeBuy")
  else
    totalCalculateMoney()
  end
end

calculateMoney = function(index)
  -- function num : 0_6 , upvalues : npcTradeShop, currentTradeSlot
  if npcTradeShop:checkSlotIndex(index) == false or currentTradeSlot < index then
    (UI.ASSERT)(false, "슬롯 번호�\128 이상합니�\164.")
    return 
  end
  local slot = (npcTradeShop._buyList)[index]
  local shopItemWrapper = npcShop_getItemBuy(slotIndex)
  local shopItem = shopItemWrapper:get()
  local s64itemPrice = slot.s64price * ((npcTradeShop._slotBuyAmount)[slot.itemKey])._itemCount
  ;
  (slot.static_Cost):SetText(makeDotMoney(s64itemPrice))
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R5 in 'UnsetPending'

  npcTradeShop._totalWeight = npcTradeShop._totalWeight + toInt64(0, slot.itemWeight) * ((npcTradeShop._slotBuyAmount)[slot.itemKey])._itemCount
  return s64itemPrice
end

totalCalculateMoney = function()
  -- function num : 0_7 , upvalues : npcTradeShop, currentTradeSlot
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  npcTradeShop._totalWeight = toInt64(0, 0)
  local totalItemPrice = toInt64(0, 0)
  for count = 1, currentTradeSlot - 1 do
    s64itemPrice = calculateMoney(count)
    totalItemPrice = totalItemPrice + s64itemPrice
  end
  ;
  (npcTradeShop._staticTotalMoneyValue):SetText(makeDotMoney(totalItemPrice))
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  npcTradeShop._totalCost = totalItemPrice
  local itemWeight = (string.format)("%.1f", Int64toInt32(npcTradeShop._totalWeight) / 10000)
  if npcTradeShop._myRemainWeight < npcTradeShop._totalWeight then
    (npcTradeShop._StaticTextCartWeightLT):SetFontColor((Defines.Color).C_FFD20000)
  else
    ;
    (npcTradeShop._StaticTextCartWeightLT):SetFontColor((Defines.Color).C_FFFFBC3A)
  end
  ;
  (npcTradeShop._StaticTextCartWeightLT):SetText(itemWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end

npcTradeShop.checkSlotIndex = function(self, index)
  -- function num : 0_8 , upvalues : tradeBuyMaxCount
  if index < 0 or tradeBuyMaxCount < index then
    (UI.ASSERT)(false, "유효하지 않은 슬롯 번호 입니�\164.(lua)")
    return false
  end
  return true
end

npcTradeShop.registUiControl = function(self)
  -- function num : 0_9 , upvalues : npcTradeShop, const_64
  local index = 0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop.buyListFrame = (UI.getChildControl)(Panel_Npc_Trade_Market, "Frame_BuyList")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop.buyListFrameContent = (npcTradeShop.buyListFrame):GetFrameContent()
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop.title = (UI.getChildControl)(Panel_Npc_Trade_Market, "Panel_title")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._buttonExit = (UI.getChildControl)(Panel_Npc_Trade_Market, "Button_Win_Close")
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticEarnProfitText = (UI.getChildControl)(Panel_Npc_Trade_Market, "StaticText_Earn_Profit_Title")
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticEarnProfitValue = (UI.getChildControl)(Panel_Npc_Trade_Market, "StaticText_Earn_Profit_Value")
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticEarnProfitCoin = (UI.getChildControl)(Panel_Npc_Trade_Market, "StaticText_Earn_Profit_Coin")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._petInventoryTitle = (UI.getChildControl)(Panel_Npc_Trade_Market, "StaticText_Pet_Inventory")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._petInventoryValue = (UI.getChildControl)(Panel_Npc_Trade_Market, "StaticText_Pet_Inventory_Value")
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._alertpanel = (UI.getChildControl)(Panel_Npc_Trade_Market, "Static_AlertPanel")
  -- DECOMPILER ERROR at PC76: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._alerttext = (UI.getChildControl)(Panel_Npc_Trade_Market, "StaticText_Alert_NoticeText")
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._btnInvestNode = (UI.getChildControl)(Panel_Npc_Trade_Market, "Button_Node_Invest")
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._buttonTradeGameStart = (UI.getChildControl)(Panel_Npc_Trade_Market, "Button_TradeGameStart")
  ;
  (npcTradeShop._buttonTradeGameStart):SetShow(false)
  -- DECOMPILER ERROR at PC147: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop.preLoadUI = {_static_Icon = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "list_icon"), _static_TextItemName = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "list_name"), _static_Multiply = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "list_multiply"), _button_Quantity = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "Button_listCount"), _static_Equal = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "list_equal"), _static_Cost = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "StaticText_Cost"), _static_CostIcon = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "list_totalCost_moneyIcon")}
  -- DECOMPILER ERROR at PC155: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticCategoryTotal = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "category_total")
  -- DECOMPILER ERROR at PC163: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticPossessMoneyText = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "possessed_money")
  -- DECOMPILER ERROR at PC171: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticPossessMoneyValue = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "possessed_money_value")
  -- DECOMPILER ERROR at PC179: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticPossessMoney = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "possessed_money_moneyIcon")
  -- DECOMPILER ERROR at PC187: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticTotalMoneyText = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "totalCost")
  -- DECOMPILER ERROR at PC195: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticTotalMoneyValue = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "totalCost_value")
  -- DECOMPILER ERROR at PC203: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticTotalMoney = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "totalCost_moneyIcon")
  -- DECOMPILER ERROR at PC211: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticTotalWeightText = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "totalWeight")
  -- DECOMPILER ERROR at PC219: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._staticTotalWeight = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "totalWeight_value")
  -- DECOMPILER ERROR at PC227: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._StaticTextCartWeightLT = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "totalWeight_LT")
  -- DECOMPILER ERROR at PC235: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._button_Confirm = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "Button_confirm")
  -- DECOMPILER ERROR at PC243: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._currentWeightLT = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "currentWeight_LT")
  -- DECOMPILER ERROR at PC251: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._vehicleWeightText = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "StaticText_Vehicle_Weight")
  -- DECOMPILER ERROR at PC259: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._vehicleWeightLT = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "currentVehicleWeight_LT")
  ;
  (npcTradeShop._button_Confirm):addInputEvent("Mouse_LUp", "click_Confirm_BasketList()")
  -- DECOMPILER ERROR at PC273: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._button_ClearList = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "Button_clearList")
  ;
  (npcTradeShop._button_ClearList):addInputEvent("Mouse_LUp", "click_clear_BasketList()")
  ;
  (npcTradeShop._buttonExit):addInputEvent("Mouse_LUp", "closeNpcTrade_Basket()")
  -- DECOMPILER ERROR at PC293: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._button_Confirm_EnterVihicle = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "Button_confirm_EnterViehicle")
  ;
  (npcTradeShop._button_Confirm_EnterVihicle):addInputEvent("Mouse_LUp", "click_Confirm_Enter_Vehicle()")
  -- DECOMPILER ERROR at PC307: Confused about usage of register: R2 in 'UnsetPending'

  npcTradeShop._currentWeightText = (UI.getChildControl)(npcTradeShop.buyListFrameContent, "currentWeight")
  local preloadUIList = npcTradeShop.preLoadUI
  for countCol = 1, npcTradeShop._TradeBuyListCol do
    for countRow = 1, npcTradeShop._TradeBuyListRow do
      index = (countCol - 1) * npcTradeShop._TradeBuyListCol + countRow
      local buyList = {itemKey; slotNo = 0, s64price = toInt64(0, 0), s64StackCount = 0, itemWeight = 0}
      buyList.slotNo = index - 1
      buyList.static_TextItemName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, npcTradeShop.buyListFrameContent, "BuyListBuyItemName_" .. index)
      CopyBaseProperty(preloadUIList._static_TextItemName, buyList.static_TextItemName)
      buyList.static_Multiply = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, npcTradeShop.buyListFrameContent, "BuyList_multiply_" .. index)
      CopyBaseProperty(preloadUIList._static_Multiply, buyList.static_Multiply)
      buyList.button_Quantity = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, npcTradeShop.buyListFrameContent, "BuyList_Quantity" .. index)
      CopyBaseProperty(preloadUIList._button_Quantity, buyList.button_Quantity)
      ;
      (buyList.button_Quantity):addInputEvent("Mouse_LUp", "click_TradeMarket_Quantity(" .. index .. ")")
      buyList.static_Equal = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, npcTradeShop.buyListFrameContent, "BuyList_Equal" .. index)
      CopyBaseProperty(preloadUIList._static_Equal, buyList.static_Equal)
      buyList.static_Cost = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, npcTradeShop.buyListFrameContent, "BuyList_Cost" .. index)
      CopyBaseProperty(preloadUIList._static_Cost, buyList.static_Cost)
      buyList.static_CostIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, npcTradeShop.buyListFrameContent, "BuyListIcon_Cost" .. index)
      CopyBaseProperty(preloadUIList._static_CostIcon, buyList.static_CostIcon)
      buyList.icon = {}
      ;
      (SlotItem.new)(buyList.icon, "ShopItem_" .. index, index, npcTradeShop.buyListFrameContent, npcTradeShop.slotConfig)
      ;
      (buyList.icon):createChild()
      buyList.setItem = function(self, itemStaticWrapper, s64_stackCount, s64_price, s64_invenCount, disable)
    -- function num : 0_9_0 , upvalues : const_64
    do
      local enable = (const_64.s64_0 ~= s64_stackCount and not disable)
      ;
      (self.icon):setItemByStaticStatus(itemStaticWrapper)
      ;
      ((self.icon).icon):SetMonoTone(not enable)
      ;
      (self.static_TextItemName):SetText(itemStaticWrapper:getName())
      self.s64price = s64_price
      self.s64StackCount = s64_stackCount
      self.itemWeight = (itemStaticWrapper:get())._weight
      self.itemKey = ((itemStaticWrapper:get())._key):get()
      self:setShow(true)
      -- DECOMPILER ERROR: 2 unprocessed JMP targets
    end
  end

      buyList.clearSlot = function(self)
    -- function num : 0_9_1
    self:setShow(false)
    ;
    (self.button_Quantity):SetText("1")
    ;
    (self.static_Cost):SetText("0")
  end

      buyList.setShow = function(self, bShow)
    -- function num : 0_9_2
    local bShow = bShow or false
    ;
    (self.static_TextItemName):SetShow(bShow)
    ;
    (self.static_Multiply):SetShow(bShow)
    ;
    (self.button_Quantity):SetShow(bShow)
    ;
    (self.static_Equal):SetShow(bShow)
    ;
    (self.static_Cost):SetShow(bShow)
    ;
    (self.static_CostIcon):SetShow(bShow)
    ;
    ((self.icon).icon):SetShow(bShow)
  end

      -- DECOMPILER ERROR at PC468: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (npcTradeShop._buyList)[index] = buyList
    end
  end
  ;
  (npcTradeShop.buyListFrame):SetSize(getScreenSizeX() - 20, (npcTradeShop.buyListFrame):GetSizeY())
  ;
  (npcTradeShop.buyListFrameContent):SetSize((npcTradeShop.buyListFrame):GetSizeX(), (npcTradeShop.buyListFrame):GetSizeY())
  eventResetTradeUI()
end

check_Servant = function()
  -- function num : 0_10
  local myLandVehicle = getTemporaryInformationWrapper()
  local servantInfoWrapper = myLandVehicle:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  if servantInfoWrapper ~= nil then
    local myLandVehicleActorKey = servantInfoWrapper:getActorKeyRaw()
    if myLandVehicleActorKey ~= nil then
      local landVehicleActorProxy = getActor(myLandVehicleActorKey)
      local selfProxy = getSelfPlayer()
      if landVehicleActorProxy ~= nil then
        local isAbleDistance = getDistanceFromVehicle()
        if isAbleDistance then
          local vehicleInventory = servantInfoWrapper:getInventory()
          local maxInventorySlot = vehicleInventory:size() - 2
          local freeInventorySlot = maxInventorySlot - vehicleInventory:getFreeCount()
          local myLandVehicleActorKey = (myLandVehicle:getUnsealVehicle(false)):getActorKeyRaw()
          local servantWrapper = myLandVehicle:getUnsealVehicleByActorKeyRaw(myLandVehicleActorKey)
          local max_weight = Int64toInt32(servantWrapper:getMaxWeight_s64() / (Defines.s64_const).s64_10000)
          local total_weight = Int64toInt32((servantWrapper:getInventoryWeight_s64() + servantWrapper:getEquipWeight_s64() + servantWrapper:getMoneyWeight_s64()) / (Defines.s64_const).s64_10000)
          local vehicleRemainWeightValue = (string.format)("%.1f", max_weight - total_weight)
          return true, maxInventorySlot, freeInventorySlot, vehicleRemainWeightValue
        else
          do
            do
              do
                do
                  do return false, 0, 0 end
                  do return nil, 0, 0 end
                  do return nil, 0, 0 end
                  do return nil, 0, 0 end
                end
              end
            end
          end
        end
      end
    end
  end
end

check_Servant_Inventory = function()
  -- function num : 0_11 , upvalues : npcTradeShop
  local checkServant, maxInventorySlot, freeInventorySlot, remainWeight = check_Servant()
  if checkServant == true then
    (npcTradeShop._petInventoryTitle):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketList_Servant_Inventory"))
    ;
    (npcTradeShop._petInventoryValue):SetText(freeInventorySlot .. " / " .. maxInventorySlot)
    ;
    (npcTradeShop._vehicleWeightLT):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_WindowTradeMarket_Weight", "Weight", tostring(remainWeight)))
    ;
    (npcTradeShop._petInventoryTitle):SetShow(true)
    ;
    (npcTradeShop._petInventoryValue):SetShow(true)
    ;
    (npcTradeShop._vehicleWeightText):SetShow(true)
    ;
    (npcTradeShop._vehicleWeightLT):SetShow(true)
    ;
    (npcTradeShop._petInventoryTitle):SetSpanSize(155, 137)
  else
    if checkServant == false then
      (npcTradeShop._petInventoryTitle):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketList_Servant_NotNear"))
      ;
      (npcTradeShop._petInventoryValue):SetText(freeInventorySlot .. " / " .. maxInventorySlot)
      ;
      (npcTradeShop._petInventoryTitle):SetShow(true)
      ;
      (npcTradeShop._petInventoryValue):SetShow(false)
      ;
      (npcTradeShop._vehicleWeightText):SetShow(false)
      ;
      (npcTradeShop._vehicleWeightLT):SetShow(false)
      ;
      (npcTradeShop._petInventoryTitle):SetSpanSize(70, 137)
    else
      if checkServant == nil then
        (npcTradeShop._petInventoryTitle):SetShow(false)
        ;
        (npcTradeShop._petInventoryValue):SetShow(false)
        ;
        (npcTradeShop._vehicleWeightText):SetShow(false)
        ;
        (npcTradeShop._vehicleWeightLT):SetShow(false)
      end
    end
  end
end

npcTradeShop.InitTradeMarket = function(self)
  -- function num : 0_12 , upvalues : currentTradeSlot, npcTradeShop, tradeBuyMaxCount
  currentTradeSlot = 1
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  npcTradeShop._buyRequest = false
  for count = 1, tradeBuyMaxCount do
    ((npcTradeShop._buyList)[count]):clearSlot()
  end
end

npcTradeShop.initTradeData = function(self)
  -- function num : 0_13 , upvalues : npcTradeShop
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  npcTradeShop._slotBuyAmount = {}
  ;
  (npcTradeShop._staticPossessMoneyValue):SetText("0")
  ;
  (npcTradeShop._staticTotalMoneyValue):SetText("0")
  ;
  (npcTradeShop._StaticTextCartWeightLT):SetText("0" .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  TradeShopMoneyRefresh()
end

click_Confirm_BasketList = function()
  -- function num : 0_14 , upvalues : currentTradeSlot
  if currentTradeSlot <= 1 then
    return 
  end
  local showMessageBox = check_Servant()
  if showMessageBox == true then
    local tileString = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarket_BuyMsg_UseVehicleInvenTitle")
    local contentString = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarket_BuyMsg_UseVehicleInvenContent")
    local messageboxData = {title = tileString, content = contentString, functionYes = confirm_VehicleInventory, functionNo = confirm_ToMyInventory, exitButton = true, isCancelClose = false, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      confirm_ToMyInventory()
    end
  end
end

confirm_ToMyInventory = function()
  -- function num : 0_15
  local titleString = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarket_BuyMsg_UseInvenTitle")
  local contentString = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarket_BuyMsg_UseInvenContent")
  local messageboxData = {title = titleString, content = contentString, functionYes = confirm_MyInventory, functionNo = MessageBox_Empty_function, exitButton = true, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

confirm_MyInventory = function()
  -- function num : 0_16
  send_doBuy(0, 0)
end

confirm_VehicleInventory = function()
  -- function num : 0_17 , upvalues : npcTradeShop
  local myLandVehicle = getTemporaryInformationWrapper()
  local myLandVehicleActorKey = (myLandVehicle:getUnsealVehicle(false)):getActorKeyRaw()
  local servantWrapper = myLandVehicle:getUnsealVehicleByActorKeyRaw(myLandVehicleActorKey)
  local max_weight = Int64toInt32(servantWrapper:getMaxWeight_s64() / (Defines.s64_const).s64_10000)
  local total_weight = Int64toInt32((servantWrapper:getInventoryWeight_s64() + servantWrapper:getEquipWeight_s64() + servantWrapper:getMoneyWeight_s64()) / (Defines.s64_const).s64_10000)
  if max_weight - total_weight < Int64toInt32(npcTradeShop._totalWeight) / 10000 then
    local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_VEHICLE_MSG_TITLE")
    local contentString = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_VEHICLE_MSG_CONTENT")
    local messageboxData = {title = titleString, content = contentString, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    return 
  end
  do
    send_doBuy(0, 4)
  end
end

send_doBuy = function(fromWhere, toWhere)
  -- function num : 0_18 , upvalues : npcTradeShop
  local rv = 0
  rv = check_BuyableTradeItem()
  if rv ~= 0 then
    return 
  end
  for slotIndex,itemCount in pairs(npcTradeShop._slotBuyAmount) do
    if toInt64(0, 0) ~= ((npcTradeShop._slotBuyAmount)[slotIndex])._itemCount then
      local itemCount = ((npcTradeShop._slotBuyAmount)[slotIndex])._itemCount
      local itemCount32 = Int64toInt32(itemCount)
      for count = 0, itemCount32 - 1 do
        npcShop_doBuy(((npcTradeShop._slotBuyAmount)[slotIndex])._slotIndex, 1, fromWhere, toWhere, false)
      end
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R10 in 'UnsetPending'

      npcTradeShop._buyRequest = true
    end
  end
end

check_BuyableTradeItem = function()
  -- function num : 0_19 , upvalues : npcTradeShop
  local myMoney = (((getSelfPlayer()):get()):getInventory()):getMoney_s64()
  if myMoney < npcTradeShop._totalCost then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarket_Not_Enough_Money"))
    return -1
  end
  return 0
end

click_Confirm_Enter_Vehicle = function()
  -- function num : 0_20
  local myLandVehicle = getTemporaryInformationWrapper()
  local myLandVehicleActorKey = (myLandVehicle:getUnsealVehicle(false)):getActorKeyRaw()
  if myLandVehicleActorKey ~= nil then
    local landVehicleActorProxy = getActor(myLandVehicleActorKey)
    local selfProxy = getSelfPlayer()
    if landVehicleActorProxy == nil then
      NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "Lua_WindowTradeMarket_NotVehicleNear"))
      return 
    end
    local isAbleDistance = getDistanceFromVehicle()
    if isAbleDistance == true then
      send_doBuy(0, 4)
    end
  else
    do
      ;
      (UI.debugMessage)("�\136 것이 없습니다.")
    end
  end
end

click_clear_BasketList = function()
  -- function num : 0_21
  global_setTradeUI(false)
  global_TradeShopReset()
end

npcTradeShop.setBuyControlShow = function(self, index, isShow)
  -- function num : 0_22 , upvalues : npcTradeShop
  local resizeControl = (npcTradeShop._buyList)[index]
  ;
  ((resizeControl.icon).icon):SetShow(isShow)
  ;
  (resizeControl.static_TextItemName):SetShow(isShow)
  ;
  (resizeControl.static_Multiply):SetShow(isShow)
  ;
  (resizeControl.button_Quantity):SetShow(isShow)
  ;
  (resizeControl.static_Equal):SetShow(isShow)
end

npcTradeShop.setControlPos = function(self, control, PosX, PosY)
  -- function num : 0_23
  control:SetPosX(PosX)
  control:SetPosY(PosY)
end

npcTradeShop.setSizeBuyListControl = function(self, index, posX, posY)
  -- function num : 0_24 , upvalues : npcTradeShop, UI_TM
  local resizeControl = (npcTradeShop._buyList)[index]
  npcTradeShop:setControlPos((resizeControl.icon).icon, posX, posY)
  ;
  (npcTradeShop.title):ComputePos()
  ;
  (npcTradeShop._buttonExit):ComputePos()
  ;
  (npcTradeShop._staticEarnProfitText):ComputePos()
  ;
  (npcTradeShop._staticEarnProfitValue):ComputePos()
  ;
  (npcTradeShop._staticEarnProfitCoin):ComputePos()
  ;
  (npcTradeShop._petInventoryTitle):ComputePos()
  ;
  (npcTradeShop._petInventoryValue):ComputePos()
  ;
  (npcTradeShop._staticCategoryTotal):ComputePos()
  ;
  (npcTradeShop._staticPossessMoneyText):ComputePos()
  ;
  (npcTradeShop._staticPossessMoneyValue):ComputePos()
  ;
  (npcTradeShop._staticPossessMoney):ComputePos()
  ;
  (npcTradeShop._staticTotalMoneyText):ComputePos()
  ;
  (npcTradeShop._staticTotalMoneyValue):ComputePos()
  ;
  (npcTradeShop._staticTotalMoney):ComputePos()
  ;
  (npcTradeShop._staticTotalWeightText):ComputePos()
  ;
  (npcTradeShop._staticTotalWeight):ComputePos()
  ;
  (npcTradeShop._StaticTextCartWeightLT):ComputePos()
  ;
  (npcTradeShop._button_Confirm):ComputePos()
  ;
  (npcTradeShop._currentWeightLT):ComputePos()
  ;
  (npcTradeShop._vehicleWeightLT):ComputePos()
  ;
  (npcTradeShop._vehicleWeightText):ComputePos()
  ;
  (npcTradeShop._button_ClearList):ComputePos()
  ;
  (npcTradeShop._button_Confirm_EnterVihicle):ComputePos()
  ;
  (npcTradeShop._currentWeightText):ComputePos()
  ;
  (npcTradeShop._buttonTradeGameStart):ComputePos()
  local basePosX = ((resizeControl.icon).icon):GetPosX()
  local basePosY = ((resizeControl.icon).icon):GetPosY()
  ;
  (resizeControl.static_TextItemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
  npcTradeShop:setControlPos(resizeControl.static_TextItemName, basePosX + 50, basePosY + 3)
  basePosX = (resizeControl.static_TextItemName):GetPosX()
  basePosY = (resizeControl.static_TextItemName):GetPosY()
  npcTradeShop:setControlPos(resizeControl.static_Multiply, basePosX + 120, basePosY + 7)
  basePosX = (resizeControl.static_Multiply):GetPosX()
  basePosY = (resizeControl.static_Multiply):GetPosY()
  npcTradeShop:setControlPos(resizeControl.button_Quantity, basePosX + 20, basePosY)
  basePosX = (resizeControl.button_Quantity):GetPosX()
  basePosY = (resizeControl.button_Quantity):GetPosY()
  npcTradeShop:setControlPos(resizeControl.static_Equal, basePosX + 30, basePosY)
  basePosX = (resizeControl.static_Equal):GetPosX()
  basePosY = (resizeControl.static_Equal):GetPosY()
  npcTradeShop:setControlPos(resizeControl.static_Cost, basePosX + 30, basePosY)
  basePosX = (resizeControl.static_Cost):GetPosX()
  basePosY = (resizeControl.static_Cost):GetPosY()
  npcTradeShop:setControlPos(resizeControl.static_CostIcon, basePosX + 40, basePosY)
  basePosX = (resizeControl.static_CostIcon):GetPosX()
  basePosY = (resizeControl.static_CostIcon):GetPosY()
  npcTradeShop:setControlPos(resizeControl.static_CostIcon, basePosX + 20, basePosY + 5)
end

eventResetTradeUI = function()
  -- function num : 0_25 , upvalues : npcTradeShop, tradeBuyMaxCount
  Panel_Npc_Trade_Market:SetPosY(getScreenSizeY() - Panel_Npc_Trade_Market:GetSizeY())
  Panel_Npc_Trade_Market:SetSize(getScreenSizeX(), Panel_Npc_Trade_Market:GetSizeY())
  ;
  (npcTradeShop.buyListFrame):SetSize((npcTradeShop.buyListFrame):GetSizeX(), (npcTradeShop.buyListFrame):GetSizeY())
  ;
  (npcTradeShop.buyListFrameContent):SetSize((npcTradeShop.buyListFrame):GetSizeX(), (npcTradeShop.buyListFrame):GetSizeY())
  Panel_Npc_Trade_Market:ComputePos()
  ;
  (npcTradeShop.buyListFrame):ComputePos()
  ;
  (npcTradeShop.buyListFrameContent):ComputePos()
  local tradeFrame = npcTradeShop.buyListFrame
  tradeFrame:SetPosX(Panel_Npc_Trade_Market:GetSizeX() - tradeFrame:GetSizeX() - 20)
  local buyListSizeX = (npcTradeShop.buyListFrame):GetSizeX() - 300
  local displaySizeX = buyListSizeX / 3
  local displayPosY = (npcTradeShop.buyListFrame):GetPosY()
  local posX = 0
  local posY = 0
  local col = -1
  for count = 1, tradeBuyMaxCount do
    local row = (count - 1) % 3
    if row == 0 then
      col = col + 1
    end
    local rPosX = posX + row * displaySizeX
    local rPosY = posY + (col) * 50 + 5
    npcTradeShop:setSizeBuyListControl(count, rPosX, rPosY)
  end
end

closeNpcTrade_Basket = function()
  -- function num : 0_26
  if Panel_Win_System:GetShow() then
    Proc_ShowMessage_Ack("알림창을 먼저 닫아주세�\148.")
    return 
  end
  Fglobal_TradeGame_Close()
  SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  setIgnoreShowDialog(false)
  InventoryWindow_Close()
  Panel_Tooltip_Item_hideTooltip()
  Panel_Npc_Dialog:SetShow(true, false)
  if Panel_Trade_Market_Graph_Window:IsShow() then
    Panel_Trade_Market_Graph_Window:SetShow(false)
  end
  if Panel_Npc_Trade_Market:IsShow() then
    Panel_Npc_Trade_Market:SetShow(false)
  end
  global_buyListExit()
  global_tradeSellListExit()
  cutSceneCameraWaveMode(true)
  isNearActorEdgeShow(true)
  local mainCameraName = Dialog_getMainSceneCameraName()
  changeCameraScene(mainCameraName, 0.5)
  global_IsTrading = false
  local npcKey = dialog_getTalkNpcKey()
  if npcKey ~= 0 then
    closeClientChangeScene(npcKey)
  else
    ;
    (UI.ASSERT)("�\164 설정�\180 되어 있지 않습니다. 어떻�\140 실행�\132 했을�\140...")
  end
end

InitNpcTradeShopOpen = function()
  -- function num : 0_27 , upvalues : npcTradeShop
  if global_IsTrading == false then
    if Panel_Npc_Dialog:IsShow() == false then
      return 
    end
    local npcKey = dialog_getTalkNpcKey()
    if npcKey ~= 0 then
      openClientChangeScene(npcKey, 1)
    end
    SetUIMode((Defines.UIMode).eUIMode_Trade)
    setIgnoreShowDialog(true)
    global_IsTrading = true
    Panel_Npc_Dialog:SetShow(false, false)
    Panel_Npc_Trade_Market:SetShow(true)
    Panel_Trade_Market_Graph_Window:SetShow(true, false)
    global_setTradeUI(true)
    global_tradeSellListOpen()
    cutSceneCameraWaveMode(false)
    isNearActorEdgeShow(false)
    check_Servant_Inventory()
    ;
    (npcTradeShop._staticEarnProfitValue):SetText("0")
    ;
    (npcTradeShop._staticEarnProfitValue):SetShow(false)
    ;
    (npcTradeShop._staticEarnProfitText):SetShow(false)
    ;
    (npcTradeShop._staticEarnProfitCoin):SetShow(false)
  end
  do
    local talker = dialog_getTalker()
    local npcActorproxy = talker:get()
    local npcPosition = npcActorproxy:getPosition()
    local npcRegionInfo = getRegionInfoByPosition(npcPosition)
    local npcTradeNodeName = npcRegionInfo:getTradeExplorationNodeName()
    local npcTradeOriginRegion = (npcRegionInfo:get()):getTradeOriginRegion()
    local boolValue = checkSelfplayerNode(npcTradeOriginRegion._waypointKey, true)
    if not boolValue then
      (npcTradeShop._alertpanel):SetShow(true)
      ;
      (npcTradeShop._alerttext):SetShow(true)
      ;
      (npcTradeShop._alertpanel):SetSpanSize((getScreenSizeX() - (npcTradeShop._alertpanel):GetSizeX()) / 2, ((npcTradeShop._alertpanel):GetSizeY() + Panel_Npc_Trade_Market:GetSizeY() - getScreenSizeY()) / 2)
      ;
      (npcTradeShop._alerttext):SetSpanSize((getScreenSizeX() - (npcTradeShop._alerttext):GetSizeX()) / 2, ((npcTradeShop._alerttext):GetSizeY() + Panel_Npc_Trade_Market:GetSizeY() - getScreenSizeY()) / 2)
      ;
      (npcTradeShop._alerttext):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_WindowTradeMarket_NeedInvest") .. " <PAColor0xAAFFFFFF>[ " .. npcTradeNodeName .. " ]<PAOldColor> " .. PAGetString(Defines.StringSheet_GAME, "Lua_WindowTradeMarket_NeedInvest2"))
      local isNpcNodeCotrol = getDialogButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      if isNpcNodeCotrol ~= -1 then
        (npcTradeShop._btnInvestNode):SetSpanSize((getScreenSizeX() - (npcTradeShop._btnInvestNode):GetSizeX()) / 2, (npcTradeShop._alertpanel):GetPosY() + (npcTradeShop._alertpanel):GetSizeY() + 10)
        ;
        (npcTradeShop._btnInvestNode):addInputEvent("Mouse_LUp", "click_OpenWorldMap_InvestNode()")
        ;
        (npcTradeShop._btnInvestNode):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_WindowTradeMarket_NodeButton"))
        ;
        (npcTradeShop._btnInvestNode):SetShow(true)
      else
        ;
        (npcTradeShop._btnInvestNode):SetShow(false)
      end
    else
      do
        ;
        (npcTradeShop._alertpanel):SetShow(false)
        ;
        (npcTradeShop._alerttext):SetShow(false)
        ;
        (npcTradeShop._btnInvestNode):SetShow(false)
        FGlobal_RemoteControl_Show(2)
      end
    end
  end
end

click_OpenWorldMap_InvestNode = function()
  -- function num : 0_28
  closeNpcTrade_Basket()
  local buttonIndex = getDialogButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
  HandleClickedFuncButton(buttonIndex)
end

TradeShopGraphRefresh = function()
  -- function num : 0_29
  if global_IsTrading == true then
    local rv = global_updateCurrentCommerce()
    if rv == true then
      global_sellItemFromPlayer()
      global_setBuyList()
    end
  end
end

TradeShopMoneyRefresh = function()
  -- function num : 0_30 , upvalues : npcTradeShop, currentTradeSlot, const_64
  if global_IsTrading == true then
    if npcTradeShop._buyRequest == true then
      currentTradeSlot = 1
      -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

      npcTradeShop._numpadNumber = toInt64(0, 1)
      npcTradeShop:InitTradeMarket()
      npcTradeShop:initTradeData()
      TradeItem_BuySuccess()
    end
    local selfPlayerWrapper = getSelfPlayer()
    local selfPlayer = selfPlayerWrapper:get()
    local selfPlayerPossessableWeigh = selfPlayer:getPossessableWeight_s64()
    local selfPlayerCurrentWeigh = selfPlayer:getCurrentWeight_s64()
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R4 in 'UnsetPending'

    npcTradeShop._myRemainWeight = selfPlayerPossessableWeigh - selfPlayerCurrentWeigh
    local itemWeightDiv100 = selfPlayerPossessableWeigh / const_64.s64_100
    local s64_CurrentWeight = selfPlayerCurrentWeigh / const_64.s64_100
    local str_int32remainWeight = (string.format)("%.1f", Int64toInt32(itemWeightDiv100 - s64_CurrentWeight) / 100)
    ;
    (npcTradeShop._currentWeightLT):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_WindowTradeMarket_Weight", "Weight", tostring(str_int32remainWeight)))
    ;
    (npcTradeShop._staticPossessMoneyValue):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
    eventBuyFromNpcListRefesh()
    global_refreshScrollIndex()
    InventoryWindow_Close()
  end
end

TradeItem_BuySuccess = function()
  -- function num : 0_31 , upvalues : npcTradeShop
  local tradeItemMessage = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_BUYING_SUCCESS")
  ;
  (npcTradeShop._alertpanel):SetSpanSize((getScreenSizeX() - (npcTradeShop._alertpanel):GetSizeX()) / 2, ((npcTradeShop._alertpanel):GetSizeY() + Panel_Npc_Trade_Market:GetSizeY() - getScreenSizeY()) / 3)
  ;
  (npcTradeShop._alerttext):SetSpanSize((getScreenSizeX() - (npcTradeShop._alerttext):GetSizeX()) / 2, ((npcTradeShop._alerttext):GetSizeY() + Panel_Npc_Trade_Market:GetSizeY() - getScreenSizeY()) / 3)
  ;
  (npcTradeShop._alertpanel):SetShow(true)
  ;
  (npcTradeShop._alerttext):SetShow(true)
  ;
  (npcTradeShop._alerttext):SetText(tradeItemMessage)
end

npcTradeShop.registTradeShopEvent = function(self)
  -- function num : 0_32
  registerEvent("onScreenResize", "eventResetTradeUI")
  registerEvent("EventNpcTradeShopUpdate", "InitNpcTradeShopOpen")
  registerEvent("EventNpcTradeShopGraphRefresh", "TradeShopGraphRefresh")
  registerEvent("FromClient_InventoryUpdate", "TradeShopMoneyRefresh")
  registerEvent("FromClient_ServantInventoryUpdate", "check_Servant_Inventory")
end

refreshEarnProfit = function(profit)
  -- function num : 0_33 , upvalues : npcTradeShop
  (npcTradeShop._staticEarnProfitValue):SetText(tostring(profit))
  ;
  (npcTradeShop._staticEarnProfitValue):SetShow(true)
  ;
  (npcTradeShop._staticEarnProfitText):SetShow(true)
  ;
  (npcTradeShop._staticEarnProfitCoin):SetShow(true)
end

npcTradeShop:registUiControl()
npcTradeShop:InitTradeMarket()
npcTradeShop:registTradeShopEvent()

