local _panel = Panel_Window_MarketPlace_BuyConfirm
local MarketPlaceBuy = {
  _ui = {
    _centerBG = UI.getChildControl(_panel, "Static_CenterBg"),
    _selectItemEnchantBg = UI.getChildControl(_panel, "Static_SelectItemEnchantBg"),
    _selectItemPriceBg = UI.getChildControl(_panel, "Static_SelectItemPriceBg"),
    _button_Req = UI.getChildControl(_panel, "StaticText_A_ConsoleUI"),
    _button_Cancel = UI.getChildControl(_panel, "StaticText_B_ConsoleUI")
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createEnchant = true
  },
  _selectEnchantLevel = 0,
  _selectPriceInfo = {_price = 0, _index = 0},
  _selectCount = 0,
  _maxItemCount_s64 = 0,
  _selectItemSlot = nil
}
function MarketPlaceBuy:initialize()
  self:createControl()
end
function MarketPlaceBuy:createControl()
  self._ui._itemStatusBg = UI.getChildControl(self._ui._centerBG, "Static_ItemStatusBg")
  self._ui._itemPriceBg = UI.getChildControl(self._ui._itemStatusBg, "Static_SelectedPriceBg")
  self._ui._countBg = UI.getChildControl(self._ui._centerBG, "Static_CountBg")
  self._ui._enchantBg = UI.getChildControl(self._ui._centerBG, "Static_EnchantBg")
  self._ui._totalPrice = UI.getChildControl(self._ui._centerBG, "StaticText_TotalPrice")
  self._ui._myPrice = UI.getChildControl(self._ui._centerBG, "StaticText_MyMoney")
  self._ui._list2_SelectEnchant = UI.getChildControl(self._ui._selectItemEnchantBg, "List2_Category")
  self._ui._list2_SelectEnchant:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_MarketPlaceBuy_List2EnchantLevelCreateControl")
  self._ui._list2_SelectEnchant:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui._list2_SelectPrice = UI.getChildControl(self._ui._selectItemPriceBg, "List2_Price")
  self._ui._list2_SelectPrice:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_MarketPlaceBuy_List2PriceCreateControl")
  self._ui._list2_SelectPrice:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui._itemPriceBg:addInputEvent("Mouse_LUp", "PaGlobal_MarketPlaceBuy_SelectItemPrice()")
  self._ui._enchantBg:addInputEvent("Mouse_LUp", "PaGlobal_MarketPlaceBuy_SelectEnchantLevel()")
  self._ui._countBg:addInputEvent("Mouse_LUp", "PaGlobal_MarketPlaceBuy_SelectCount()")
  self._ui._button_Req:addInputEvent("Mouse_LUp", "PaGlobal_MarketPlaceBuy_Req()")
  self._ui._button_Cancel:addInputEvent("Mouse_LUp", "PaGlobal_MarketPlaceBuy_Cancel()")
  local slot = {}
  slot.background = UI.getChildControl(self._ui._itemStatusBg, "Static_ItemSlotBg")
  SlotItem.new(slot, "ItemIcon", 0, slot.background, self._slotConfig)
  slot:createChild()
  slot.icon:SetShow(true)
  self._selectItemSlot = slot
end
function MarketPlaceBuy:updateNeedTotalPrice()
  local needTotalPrice = self._selectCount * (self._selectPriceInfo._price + self._enchantLevelPrice)
  self._ui._totalPrice:SetText("\237\149\132\236\154\148 \234\184\136\236\149\161 : " .. makeDotMoney(needTotalPrice))
end
function PaGlobal_MarketPlaceBuy_SelectItemPrice()
  local self = MarketPlaceBuy
  if true == self._ui._selectItemPriceBg:GetShow() then
    self._ui._selectItemPriceBg:SetShow(false)
  else
    self._ui._selectItemPriceBg:SetShow(true)
    self._ui._selectItemEnchantBg:SetShow(false)
    Panel_NumberPad_Show(false, Defines.s64_const.s64_0, 0, nil)
  end
end
function PaGlobal_MarketPlaceBuy_SelectEnchantLevel()
  local self = MarketPlaceBuy
  if true == self._ui._selectItemEnchantBg:GetShow() then
    self._ui._selectItemEnchantBg:SetShow(false)
  else
    self._ui._selectItemPriceBg:SetShow(false)
    self._ui._selectItemEnchantBg:SetShow(true)
    Panel_NumberPad_Show(false, Defines.s64_const.s64_0, 0, nil)
  end
end
function PaGlobal_MarketPlaceBuy_SelectCount()
  local self = MarketPlaceBuy
  self._ui._selectItemPriceBg:SetShow(false)
  self._ui._selectItemEnchantBg:SetShow(false)
  Panel_NumberPad_Show(true, self._maxItemCount_s64, nil, PaGlobal_MarketPlaceBuy_SetCount)
end
function PaGlobal_MarketPlaceBuy_SetCount(inputNumber)
  local self = MarketPlaceBuy
  local itemCount = UI.getChildControl(self._ui._countBg, "StaticText_CountValue")
  itemCount:SetText(tostring(inputNumber) .. "\234\176\156")
  self._selectCount = inputNumber
  self:updateNeedTotalPrice()
end
function PaGlobal_MarketPlaceBuy_Req()
  local self = MarketPlaceBuy
  ToClient_requestBuyItemToWorldMarket(self._itemKey, self._itemMinLevel, self._selectCount, self._selectPriceInfo._price, self._selectEnchantLevel)
end
function PaGlobal_MarketPlaceBuy_Cancel()
  _panel:SetShow(false)
end
function PaGlobalFunc_MarketPlaceBuy_List2EnchantLevelCreateControl(content, value)
  local self = MarketPlaceBuy
  local buttonEnchantLevel = UI.getChildControl(content, "Button_MainCategory")
  buttonEnchantLevel:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  local enchantLevel = Int64toInt32(value)
  if self._selectEnchantLevel == enchantLevel then
    buttonEnchantLevel:SetFontColor(Defines.Color.C_FFFFEEA0)
  else
    buttonEnchantLevel:SetFontColor(Defines.Color.C_FFC4BEBE)
  end
  buttonEnchantLevel:SetText("+" .. tostring(enchantLevel))
  buttonEnchantLevel:addInputEvent("Mouse_LUp", "PaGlobalFunc_MarketPlaceBuy_SelectEnchantLevel(" .. enchantLevel .. ")")
end
function PaGlobalFunc_MarketPlaceBuy_List2PriceCreateControl(content, value)
  local self = MarketPlaceBuy
  local buttonPrice = UI.getChildControl(content, "Button_Price")
  buttonPrice:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  local index = Int64toInt32(value)
  local price_s64 = ToClient_getWorldMarketBuyBiddingLstPrice(index)
  if self._selectPriceInfo._price == price_s64 then
    buttonPrice:SetFontColor(Defines.Color.C_FFFFEEA0)
  else
    buttonPrice:SetFontColor(Defines.Color.C_FFC4BEBE)
  end
  buttonPrice:SetText(makeDotMoney(price_s64))
  buttonPrice:addInputEvent("Mouse_LUp", "PaGlobalFunc_MarketPlaceBuy_SelectPriceByIndex(" .. index .. ")")
end
function PaGlobalFunc_MarketPlaceBuy_SelectEnchantLevel(enchantLevel)
  local self = MarketPlaceBuy
  local text_enchantLevel = UI.getChildControl(self._ui._enchantBg, "StaticText_EnchantValue")
  text_enchantLevel:SetText("+" .. tostring(enchantLevel))
  local prevSelectEnchantLevel = self._selectEnchantLevel
  self._selectEnchantLevel = enchantLevel
  self._ui._list2_SelectEnchant:requestUpdateByKey(self._selectEnchantLevel)
  if nil ~= prevSelectEnchantLevel then
    self._ui._list2_SelectEnchant:requestUpdateByKey(prevSelectEnchantLevel)
  end
  self._ui._selectItemEnchantBg:SetShow(false)
  _PA_LOG("\235\176\149\234\183\156\235\130\152", tostring(self._itemKey) .. "/" .. tostring(enchantLevel) .. "/" .. type(enchantLevel))
  ToClient_requestGetAddEnchantLevelPrice(self._itemKey, self._selectEnchantLevel)
end
function PaGlobalFunc_MarketPlaceBuy_SelectPriceByIndex(index)
  local price_s64 = ToClient_getWorldMarketBuyBiddingLstPrice(index)
  PaGlobalFunc_MarketPlaceBuy_SelectPrice(index, price_s64)
end
function PaGlobalFunc_MarketPlaceBuy_SelectPrice(index, itemPrice)
  local self = MarketPlaceBuy
  local text_price = UI.getChildControl(self._ui._itemStatusBg, "StaticText_SelectPriceValue")
  text_price:SetText(makeDotMoney(itemPrice))
  local prevSelectPriceIndex = self._selectPriceInfo._index
  self._selectPriceInfo._index = index
  self._selectPriceInfo._price = itemPrice
  self._ui._list2_SelectPrice:requestUpdateByKey(self._selectPriceInfo._index)
  if nil ~= prevSelectPriceIndex then
    self._ui._list2_SelectPrice:requestUpdateByKey(prevSelectPriceIndex)
  end
  self._ui._selectItemPriceBg:SetShow(false)
  self:updateNeedTotalPrice()
end
function PaGlobalFunc_MarketPlaceBuy_Initialize()
  MarketPlaceBuy:initialize()
end
function FromClient_responseGetBuyBiddingList(itemKey, minEnchantLevel, maxEnchantLevel, standardPrice_s64, itemCount_s64, biddingBuyListCount)
  local self = MarketPlaceBuy
  self._ui._list2_SelectEnchant:getElementManager():clearKey()
  self._ui._list2_SelectPrice:getElementManager():clearKey()
  for ii = minEnchantLevel, maxEnchantLevel do
    self._ui._list2_SelectEnchant:getElementManager():pushKey(ii)
  end
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey, minEnchantLevel))
  self._selectItemSlot:setItemByStaticStatus(itemSSW)
  self._itemKey = itemKey
  self._itemMinLevel = minEnchantLevel
  local itemName = UI.getChildControl(self._ui._itemStatusBg, "StaticText_ItemName")
  itemName:SetText(itemSSW:getName())
  local itemInfo = UI.getChildControl(self._ui._itemStatusBg, "StaticText_BasicPrice")
  itemInfo:SetText(string.format("\237\152\132\236\158\172 \234\184\176\236\164\128\234\176\128 : %s / \236\180\157 \235\167\164\235\172\188 : %s", makeDotMoney(standardPrice_s64), tostring(itemCount_s64)))
  self._maxItemCount_s64 = itemCount_s64
  for ii = 0, biddingBuyListCount - 1 do
    self._ui._list2_SelectPrice:getElementManager():pushKey(ii)
  end
  self._ui._selectItemEnchantBg:SetShow(false)
  self._ui._selectItemPriceBg:SetShow(false)
  PaGlobalFunc_MarketPlaceBuy_SelectPrice(biddingBuyListCount - 1, standardPrice_s64)
  PaGlobal_MarketPlaceBuy_SetCount(0)
  PaGlobalFunc_MarketPlaceBuy_SelectEnchantLevel(minEnchantLevel)
  local silverInfo = getWorldMarketSilverInfo()
  self._ui._myPrice:SetText("\235\179\180\236\156\160 \234\184\136\236\149\161 : " .. makeDotMoney(silverInfo:getItemCount()))
  _panel:SetShow(true)
end
function FromClient_responseEnchantLevelPrice(enchantLevelPrice)
  local self = MarketPlaceBuy
  self._enchantLevelPrice = enchantLevelPrice
  self:updateNeedTotalPrice()
end
function FromClient_responseBuyItemToWorldMarket(mySilver)
  local self = MarketPlaceBuy
  local silverInfo = getWorldMarketSilverInfo()
  self._ui._myPrice:SetText("\235\179\180\236\156\160 \234\184\136\236\149\161 : " .. makeDotMoney(silverInfo:getItemCount()))
  PaGlobalFunc_MarketPlace_UpdateMyInfo()
  Proc_ShowMessage_Ack("\234\181\172\235\167\164 \236\132\177\234\179\181")
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MarketPlaceBuy_Initialize")
registerEvent("FromClient_responseGetBuyBiddingList", "FromClient_responseGetBuyBiddingList")
registerEvent("FromClient_responseEnchantLevelPrice", "FromClient_responseEnchantLevelPrice")
registerEvent("FromClient_responseBuyItemToWorldMarket", "FromClient_responseBuyItemToWorldMarket")
