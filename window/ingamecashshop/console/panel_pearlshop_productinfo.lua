local pearlShopProductInfo = {
  _init = false,
  _panel = Panel_PearlShop_ProductInfo,
  _titleControl = nil,
  _descControl = nil,
  _desc2Control = nil,
  _sellTypeControl = nil,
  _productInfo = nil,
  _preDefinedItemListSize = 5,
  _itemSlotControlList = {},
  _itemSlotControlListSize = 0,
  _focusedIndex = -1
}
function pearlShopProductInfo:initialize()
  _PA_LOG("cylee", "pearlShopProductInfo:initialize()")
  if self._init then
    return
  end
  self._init = true
  local mainBgControl = UI.getChildControl(self._panel, "Static_MainBG")
  self._titleControl = UI.getChildControl(mainBgControl, "StaticText_ProductName")
  self._descControl = UI.getChildControl(mainBgControl, "StaticText_ProductDesc")
  self._desc2Control = UI.getChildControl(mainBgControl, "StaticText_ProductCaution")
  self._sellTypeControl = UI.getChildControl(mainBgControl, "StaticText_SellType")
  local itemSlotTemplateControl = UI.getChildControl(self._panel, "Static_ItemSlot")
  itemSlotTemplateControl:SetShow(false)
  for i = 0, self._preDefinedItemListSize - 1 do
    local itemSlotControl = UI.cloneControl(itemSlotTemplateControl, self._panel, "Static_ItemSlot" .. i)
    self._itemSlotControlList[i] = itemSlotControl
    self._itemSlotControlListSize = self._itemSlotControlListSize + 1
    itemSlotControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopProductInfoFocus(" .. i .. ")")
  end
  local bottomControl = UI.getChildControl(self._panel, "Static_BottomSite")
  local closeButtonControl = UI.getChildControl(bottomControl, "Button_Close")
  closeButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopProductInfoClose()")
end
function pearlShopProductInfo:open(productInfo)
  _PA_LOG("cylee", "pearlShopProductInfo:open() productInfo:" .. tostring(productInfo))
  if not productInfo then
    return
  end
  _PA_LOG("cylee", "pearlShopProductInfo:open() productName:" .. productInfo:getDisplayName())
  self._productInfo = productInfo
  self:focus(0)
  self._panel:SetShow(true)
end
function PaGlobalFunc_PearlShopProductInfoOpen(productInfo)
  _PA_LOG("cylee", "PaGlobalFunc_PearlShopProductInfoOpen()")
  pearlShopProductInfo:open(productInfo)
end
function pearlShopProductInfo:close()
  _PA_LOG("cylee", "pearlShopProductInfo:close()")
  self._panel:SetShow(false)
end
function PaGlobalFunc_PearlShopProductInfoClose()
  pearlShopProductInfo:close()
end
function pearlShopProductInfo:focus(controlIndex)
  _PA_LOG("cylee", "pearlShopProductInfo:focus() controlIndex:" .. tostring(controlIndex))
  if controlIndex >= self._productInfo:getItemListCount() then
    return
  end
  self._focusedIndex = controlIndex
  self:update()
end
function PaGlobalFunc_PearlShopProductInfoFocus(controlIndex)
  pearlShopProductInfo:focus(controlIndex)
end
function pearlShopProductInfo:update()
  _PA_LOG("cylee", "pearlShopProductInfo:update()")
  _PA_LOG("cylee", "pearlShopProductInfo:update() itemListCount:" .. tostring(self._productInfo:getItemListCount()))
  for i = 0, self._itemSlotControlListSize - 1 do
    local control = self._itemSlotControlList[i]
    local showFlag = i < self._productInfo:getItemListCount()
    control:SetShow(showFlag)
    if showFlag then
      local itemInfo = self._productInfo:getItemByIndex(i)
      control:ChangeTextureInfoNameAsync("icon/" .. itemInfo:getIconPath())
    end
  end
  local focusedItemInfo = self._productInfo:getItemByIndex(self._focusedIndex)
  self._titleControl:SetText(focusedItemInfo:getName())
  self._descControl:SetText(focusedItemInfo:getDescription())
  self._desc2Control:SetText(focusedItemInfo:getExchangeDescription())
end
function pearlShopProductInfo:changePlatformSpecKey()
  _PA_LOG("cylee", "pearlShopProductInfo:changePlatformSpecKey()")
end
function FromClient_PearlShopProductInfoInit()
  _PA_LOG("cylee", "FromClient_PearlShopProductInfoInit()")
  pearlShopProductInfo:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PearlShopProductInfoInit")
