local _panel = Panel_Window_MarketPlace_SellConfirm
local MarketPlaceSell = {
  _ui = {
    _centerBG = UI.getChildControl(_panel, "Static_CenterBg"),
    _button_Req = UI.getChildControl(_panel, "StaticText_A_ConsoleUI"),
    _button_Cancel = UI.getChildControl(_panel, "StaticText_B_ConsoleUI")
  },
  _slotConfig = {createIcon = true, createBorder = true},
  _selectPrice = 0,
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
function PaGlobal_MarketPlaceSell_SelectCount()
  local self = MarketPlaceSell
  Panel_NumberPad_Show(true, self._maxItemCount_s64, nil, PaGlobal_MarketPlaceSell_SetCount)
end
function PaGlobal_MarketPlaceSell_SetCount(inputNumber)
  local self = MarketPlaceSell
  local itemCount = UI.getChildControl(self._ui._countBg, "StaticText_CountValue")
  itemCount:SetText(tostring(inputNumber) .. "\234\176\156")
  self._selectCount = Int64toInt32(inputNumber)
end
function PaGlobalFunc_MarketPlaceSell_Initialize()
  MarketPlaceSell:initialize()
end
function FromClient_responseGetSellBiddingList(itemKey, enchantLevel, enchantMinLevel, standardPrice_s64, itemCount_s64, biddingSellListCount)
  local self = MarketPlaceSell
  self._ui._list2_SelectPrice:getElementManager():clearKey()
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey, 0))
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
    local price_s64 = ToClient_getWorldMarketSellBiddingLstPrice(ii)
    self._ui._list2_SelectPrice:getElementManager():pushKey(price_s64)
  end
  self._maxItemCount_s64 = itemCount_s64
  PaGlobalFunc_MarketPlaceSell_SelectPrice(Int64toInt32(standardPrice_s64))
  PaGlobal_MarketPlaceSell_SetCount(0)
  _panel:SetShow(true)
end
function PaGlobalFunc_MarketPlaceSell_List2PriceCreateControl(content, value)
  local self = MarketPlaceSell
  local buttonPrice = UI.getChildControl(content, "RadioButton_Money")
  local moneyIcon = UI.getChildControl(content, "StaticText_MoneyIcon")
  local itemPrice = Int64toInt32(value)
  if self._selectPrice == itemPrice then
    buttonPrice:SetFontColor(Defines.Color.C_FFFFEEA0)
  else
    buttonPrice:SetFontColor(Defines.Color.C_FFC4BEBE)
  end
  moneyIcon:SetText(tostring(itemPrice))
  buttonPrice:addInputEvent("Mouse_LUp", "PaGlobalFunc_MarketPlaceSell_SelectPrice(" .. itemPrice .. ")")
end
function PaGlobalFunc_MarketPlaceSell_SelectPrice(itemPrice)
  local self = MarketPlaceSell
  local text_price = UI.getChildControl(self._ui._priceBg, "StaticText_PriceValue")
  text_price:SetText(makeDotMoney(itemPrice))
  local prevSelectPrice = self._selectPrice
  self._selectPrice = itemPrice
  self._ui._list2_SelectPrice:requestUpdateByKey(self._selectPrice)
  if nil ~= prevSelectPrice then
    self._ui._list2_SelectPrice:requestUpdateByKey(prevSelectPrice)
  end
end
function PaGlobal_MarketPlaceSell_Req()
  local self = MarketPlaceSell
  ToClient_requestSellItemToWorldMarket(self._itemKey, self._itemMinLevel, self._selectCount, self._selectPrice, self._itemLevel)
end
function PaGlobal_MarketPlaceSell_Cancel()
  _panel:SetShow(false)
end
function FromClient_responseSellItemToWorldMarket(mySilver)
  PaGlobalFunc_MarketPlace_UpdateMyInfo()
  Proc_ShowMessage_Ack("\237\140\144\235\167\164 \236\132\177\234\179\181")
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MarketPlaceSell_Initialize")
registerEvent("FromClient_responseGetSellBiddingList", "FromClient_responseGetSellBiddingList")
registerEvent("FromClient_responseSellItemToWorldMarket", "FromClient_responseSellItemToWorldMarket")
