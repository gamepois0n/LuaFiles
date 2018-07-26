local pearlShopProductBuy = {
  _init = false,
  _panel = Panel_PearlShop_ProductBuy,
  _productNoRaw = 0,
  _amount = 1,
  _ui = {
    _titleControl = nil,
    _descControl = nil,
    _subItemSlotTemplateControl = nil,
    _itemSlotBgControl = nil,
    _amountControl = nil,
    _pearlControl = nil,
    _mileageControl = nil,
    _subItemSlotControlListSize = 5,
    _subItemSlotControlList = {}
  },
  _slotGapX = 7,
  _mainSlot = nil,
  _slotList = {}
}
function pearlShopProductBuy:initialize()
  if self._init then
    return
  end
  self._init = true
  local mainBgControl = UI.getChildControl(self._panel, "Static_MainBG")
  self._ui._titleControl = UI.getChildControl(mainBgControl, "StaticText_ProductName")
  self._ui._descControl = UI.getChildControl(mainBgControl, "StaticText_ProductDesc")
  self._ui._descControl:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._itemSlotBgControl = UI.getChildControl(mainBgControl, "Static_MainItemSlotBg")
  local titleSlotConfig = {
    createIcon = true,
    createBorder = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  }
  local slot = {}
  SlotItem.new(slot, "MainSlot", 0, self._ui._itemSlotBgControl, titleSlotConfig)
  slot:createChild()
  self._mainSlot = slot
  self._ui._subItemSlotTemplateControl = UI.getChildControl(mainBgControl, "Static_SubItemSlotBg")
  self._ui._subItemSlotTemplateControl:SetShow(false)
  local subSlotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  }
  for i = 0, self._ui._subItemSlotControlListSize - 1 do
    local subItemSlotControl = UI.cloneControl(self._ui._subItemSlotTemplateControl, self._panel, "Static_SubItemSlot" .. i)
    self._ui._subItemSlotControlList[i] = subItemSlotControl
    local slot = {}
    SlotItem.new(slot, "Slot" .. i, i, subItemSlotControl, subSlotConfig)
    slot:createChild()
    self._slotList[i] = slot
  end
  local upButtonControl = UI.getChildControl(mainBgControl, "Static_Up")
  upButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopProductBuyUp()")
  local downButtonControl = UI.getChildControl(mainBgControl, "Static_Down")
  downButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopProductBuyDown()")
  self._ui._amountControl = UI.getChildControl(mainBgControl, "StaticText_Count")
  self._ui._pearlControl = UI.getChildControl(mainBgControl, "StaticText_Pearl")
  self._ui._mileageControl = UI.getChildControl(mainBgControl, "StaticText_Mileage")
  local bottomControl = UI.getChildControl(self._panel, "Static_BottomSite")
  local closeButtonControl = UI.getChildControl(bottomControl, "Button_Close")
  closeButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopProductBuyClose()")
  self._panel:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "PaGlobalFunc_PearlShopProductBuyUp()")
  self._panel:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "PaGlobalFunc_PearlShopProductBuyDown()")
  self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_PearlShopProductBuyBuy()")
  local buyButtonControl = UI.getChildControl(bottomControl, "StaticText_Confirm_ConsoleUI")
  buyButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopProductBuyBuy()")
  self._panel:ignorePadSnapMoveToOtherPanel()
end
function PaGlobalFunc_PearlShopProductBuyCheckShow()
  return pearlShopProductBuy:checkShow()
end
function pearlShopProductBuy:checkShow()
  return self._panel:GetShow()
end
function PaGlobalFunc_PearlShopProductBuyBack()
  pearlShopProductBuy:back()
end
function pearlShopProductBuy:back()
  self:close()
end
function PaGlobalFunc_PearlShopProductBuyUp()
  pearlShopProductBuy:changeAmount(1)
end
function PaGlobalFunc_PearlShopProductBuyDown()
  pearlShopProductBuy:changeAmount(-1)
end
function pearlShopProductBuy:changeAmount(diff)
  local amount = self._amount + diff
  if amount <= 0 then
    return
  elseif amount > 20 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_OVER20"))
    return
  end
  self._amount = amount
  self:update()
end
function pearlShopProductBuy:open(productInfo)
  if not productInfo then
    return
  end
  self._productNoRaw = productInfo:getNoRaw()
  self._amount = 1
  self:update()
  self._panel:SetShow(true)
end
function pearlShopProductBuy:getProductInfo()
  if self._productNoRaw then
    return getIngameCashMall():getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  end
end
function PaGlobalFunc_PearlShopProductBuyOpen(productInfo)
  pearlShopProductBuy:open(productInfo)
end
function PaGlobalFunc_PearlShopProductBuyBuy()
  pearlShopProductBuy:buy()
end
function pearlShopProductBuy:buy()
  local productInfo = self:getProductInfo()
  if not productInfo then
    return
  end
  getIngameCashMall():requestBuyItem(productInfo:getNoRaw(), self._amount, productInfo:getPrice(), false, toInt64(0, -1), 0, 0, CppEnums.ItemWhereType.eInventory)
end
function pearlShopProductBuy:close()
  self._panel:SetShow(false)
end
function PaGlobalFunc_PearlShopProductBuyClose()
  pearlShopProductBuy:close()
end
function pearlShopProductBuy:update()
  local productInfo = self:getProductInfo()
  if not productInfo then
    return
  end
  self._mainSlot:setItemByStaticStatus(productInfo:getItemByIndex(0))
  self._ui._titleControl:SetText(productInfo:getDisplayName())
  local itemListCount = productInfo:getItemListCount()
  local firstPosX = self._ui._subItemSlotTemplateControl:GetPosX() - 0.5 * (self._ui._subItemSlotTemplateControl:GetSizeX() + 5) * (itemListCount - 1)
  local desc = ""
  for i = 0, self._ui._subItemSlotControlListSize - 1 do
    local control = self._ui._subItemSlotControlList[i]
    control:SetPosX(firstPosX + (self._ui._subItemSlotTemplateControl:GetSizeX() + 5) * i)
    local showFlag = i < productInfo:getItemListCount()
    control:SetShow(showFlag)
    if showFlag then
      local itemInfo = productInfo:getItemByIndex(i)
      self._slotList[i]:setItemByStaticStatus(itemInfo, 1)
      desc = desc .. itemInfo:getName() .. "\n"
    end
  end
  self._ui._descControl:SetText(desc)
  self._ui._amountControl:SetText(tostring(self._amount))
  local priceStr = makeDotMoney(toInt64(0, self._amount) * productInfo:getPrice())
  if toInt64(0, 0) < productInfo:getPearlPrice() then
    self._ui._pearlControl:SetShow(true)
    self._ui._mileageControl:SetShow(false)
    self._ui._pearlControl:SetText(priceStr)
  elseif toInt64(0, 0) < productInfo:getMileagePrice() then
    self._ui._pearlControl:SetShow(false)
    self._ui._mileageControl:SetShow(true)
    self._ui._mileageControl:SetText(priceStr)
  end
end
function pearlShopProductBuy:changePlatformSpecKey()
end
function FromClient_PearlShopProductBuyInit()
  pearlShopProductBuy:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PearlShopProductBuyInit")
