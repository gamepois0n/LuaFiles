local MarketPlaceSell = {
  _ui = {
    _centerBG = UI.getChildControl(Panel_Window_MarketPlace_SellConfirm, "Static_CenterBg"),
    _button_Req = UI.getChildControl(Panel_Window_MarketPlace_SellConfirm, "StaticText_A_ConsoleUI"),
    _button_Cancel = UI.getChildControl(Panel_Window_MarketPlace_SellConfirm, "StaticText_B_ConsoleUI")
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createEnchant = true
  },
  _selectPriceInfo = {_price = 0, _index = 0},
  _selectCount = 0,
  _selectItemSlot = nil
}
function MarketPlaceSell:initialize()
  self:createControl()
end
function MarketPlaceSell:createControl()
  self._ui._itemStatusBg = UI.getChildControl(self._ui._centerBG, "Static_ItemStatusBg")
  self._ui._countBg = UI.getChildControl(self._ui._centerBG, "Static_CountBg")
  self._ui._countBg:addInputEvent("Mouse_LUp", "PaGlobal_MarketPlaceSell_SelectCount()")
  self._ui._totalPrice = UI.getChildControl(self._ui._countBg, "StaticText_TotalSellPriceValue")
  self._ui._priceBg = UI.getChildControl(self._ui._centerBG, "Static_PriceBg")
  self._ui._list2_SelectPrice = UI.getChildControl(self._ui._priceBg, "List2_Category")
  self._ui._list2_SelectPrice:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_MarketPlaceSell_List2PriceCreateControl")
  self._ui._list2_SelectPrice:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui._button_Req:addInputEvent("Mouse_LUp", "PaGlobal_MarketPlaceSell_Req()")
  self._ui._button_Cancel:addInputEvent("Mouse_LUp", "PaGlobal_MarketPlaceSell_Cancel()")
  local slot = {}
  slot.background = UI.getChildControl(self._ui._itemStatusBg, "Static_ItemSlotBg")
  SlotItem.new(slot, "ItemIcon", 0, slot.background, self._slotConfig)
  slot:createChild()
  slot.icon:SetShow(true)
  self._selectItemSlot = slot
end
function MarketPlaceSell:updateNeedTotalPrice()
  local needTotalPrice = self._selectCount * self._selectPriceInfo._price
  _PA_LOG("\234\185\128\236\167\132\237\149\156", "_selectCount : " .. tostring(self._selectCount) .. ", _price : " .. tostring(self._selectPriceInfo._price) .. ", needTotalPrice : " .. tostring(needTotalPrice))
  self._ui._totalPrice:SetText(makeDotMoney(needTotalPrice))
end
function PaGlobal_MarketPlaceSell_SelectCount()
  local self = MarketPlaceSell
  Panel_NumberPad_Show(true, self._maxItemCount_s64, nil, PaGlobal_MarketPlaceSell_SetCount)
end
function PaGlobal_MarketPlaceSell_SetCount(inputNumber)
  local self = MarketPlaceSell
  local itemCount = UI.getChildControl(self._ui._countBg, "StaticText_CountValue")
  itemCount:SetText(tostring(inputNumber) .. "\234\176\156")
  self._selectCount = inputNumber
  self:updateNeedTotalPrice()
end
function PaGlobalFunc_MarketPlaceSell_Initialize()
  MarketPlaceSell:initialize()
end
function FromClient_responseGetSellBiddingList(itemKey, enchantLevel, enchantMinLevel, standardPrice_s64, itemCount_s64, biddingSellListCount)
  local self = MarketPlaceSell
  self._ui._list2_SelectPrice:getElementManager():clearKey()
  tempItemEnchantKey = ItemEnchantKey(itemKey, enchantLevel)
  local itemSSW = getItemEnchantStaticStatus(tempItemEnchantKey)
  self._selectItemSlot:setItemByStaticStatus(itemSSW)
  self._itemKey = itemKey
  self._itemLevel = enchantLevel
  self._itemMinLevel = enchantMinLevel
  local itemName = UI.getChildControl(self._ui._itemStatusBg, "StaticText_ItemName")
  itemName:SetText(itemSSW:getName())
  local itemCount = UI.getChildControl(self._ui._itemStatusBg, "StaticText_LeftCount")
  itemCount:SetText(tostring(itemCount_s64))
  local itemPrice = UI.getChildControl(self._ui._itemStatusBg, "StaticText_SelectPriceValue")
  itemPrice:SetText(makeDotMoney(standardPrice_s64))
  for ii = 0, biddingSellListCount - 1 do
    self._ui._list2_SelectPrice:getElementManager():pushKey(ii)
  end
  self._maxItemCount_s64 = itemCount_s64
  PaGlobalFunc_MarketPlaceSell_SelectPrice(0, standardPrice_s64)
  PaGlobal_MarketPlaceSell_SetCount(0)
  Panel_Window_MarketPlace_SellConfirm:SetShow(true)
end
function PaGlobalFunc_MarketPlaceSell_List2PriceCreateControl(content, value)
  local self = MarketPlaceSell
  local buttonPrice = UI.getChildControl(content, "RadioButton_Money")
  local moneyIcon = UI.getChildControl(content, "StaticText_MoneyIcon")
  local index = Int64toInt32(value)
  local price_s64 = ToClient_getWorldMarketSellBiddingLstPrice(index)
  if self._selectPriceInfo._price == price_s64 then
    buttonPrice:SetFontColor(Defines.Color.C_FFFFEEA0)
  else
    buttonPrice:SetFontColor(Defines.Color.C_FFC4BEBE)
  end
  moneyIcon:SetText(makeDotMoney(price_s64))
  buttonPrice:addInputEvent("Mouse_LUp", "PaGlobalFunc_MarketPlaceSell_SelectPriceByIndex(" .. index .. ")")
end
function PaGlobalFunc_MarketPlaceSell_SelectPriceByIndex(index)
  local price_s64 = ToClient_getWorldMarketSellBiddingLstPrice(index)
  PaGlobalFunc_MarketPlaceSell_SelectPrice(index, price_s64)
end
function PaGlobalFunc_MarketPlaceSell_SelectPrice(index, itemPrice)
  local self = MarketPlaceSell
  local text_price = UI.getChildControl(self._ui._priceBg, "StaticText_PriceValue")
  text_price:SetText(makeDotMoney(itemPrice))
  local prevSelectPriceIndex = self._selectPriceInfo._index
  self._selectPriceInfo._index = index
  self._selectPriceInfo._price = itemPrice
  self._ui._list2_SelectPrice:requestUpdateByKey(self._selectPriceInfo._index)
  if nil ~= prevSelectPriceIndex then
    self._ui._list2_SelectPrice:requestUpdateByKey(prevSelectPriceIndex)
  end
end
function PaGlobal_MarketPlaceSell_Req()
  local self = MarketPlaceSell
  ToClient_requestSellItemToWorldMarket(self._itemKey, self._itemMinLevel, self._selectCount, self._selectPriceInfo._price, self._itemLevel)
  Panel_Window_MarketPlace_SellConfirm:SetShow(false)
end
function PaGlobal_MarketPlaceSell_Cancel()
  Panel_Window_MarketPlace_SellConfirm:SetShow(false)
end
function FromClient_responseSellItemToWorldMarket(mySilver)
  PaGlobalFunc_MarketPlace_UpdateMyInfo()
  Proc_ShowMessage_Ack("\237\140\144\235\167\164 \236\132\177\234\179\181")
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MarketPlaceSell_Initialize")
registerEvent("FromClient_responseGetSellBiddingList", "FromClient_responseGetSellBiddingList")
registerEvent("FromClient_responseSellItemToWorldMarket", "FromClient_responseSellItemToWorldMarket")
