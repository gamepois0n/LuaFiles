local pearlShopProductBuy = {
  _init = false,
  _panel = Panel_PearlShop_ProductBuy,
  _titleControl = nil,
  _descControl = nil,
  _desc2Control = nil,
  _sellTypeControl = nil,
  _itemSlot = nil,
  _productInfo = nil,
  _preDefinedSubItemListSize = 5,
  _subItemSlotControlList = {},
  _subItemSlotControlListSize = 0
}
function pearlShopProductBuy:initialize()
  _PA_LOG("cylee", "pearlShopProductBuy:initialize()")
  if self._init then
    return
  end
  self._init = true
  local mainBgControl = UI.getChildControl(self._panel, "Static_MainBG")
  self._titleControl = UI.getChildControl(mainBgControl, "StaticText_ProductName")
  self._descControl = UI.getChildControl(mainBgControl, "StaticText_ProductDesc")
  self._desc2Control = UI.getChildControl(mainBgControl, "StaticText_ProductCaution")
  self._sellTypeControl = UI.getChildControl(mainBgControl, "StaticText_SellType")
  self._itemSlot = UI.getChildControl(mainBgControl, "Static_ItemSlot")
  local subItemSlotTemplateControl = UI.getChildControl(mainBgControl, "Static_SubItemSlot")
  subItemSlotTemplateControl:SetShow(false)
  for i = 0, self._preDefinedSubItemListSize - 1 do
    local subItemSlotControl = UI.cloneControl(subItemSlotTemplateControl, self._panel, "Static_SubItemSlot" .. i)
    self._subItemSlotControlList[i] = subItemSlotControl
    self._subItemSlotControlListSize = self._subItemSlotControlListSize + 1
  end
  local bottomControl = UI.getChildControl(self._panel, "Static_BottomSite")
  local closeButtonControl = UI.getChildControl(bottomControl, "Button_Close")
  closeButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopProductBuyClose()")
end
function pearlShopProductBuy:open(productInfo)
  _PA_LOG("cylee", "pearlShopProductBuy:open() productInfo:" .. tostring(productInfo))
  if not productInfo then
    return
  end
  self._productInfo = productInfo
  self:update()
  self._panel:SetShow(true)
end
function PaGlobalFunc_PearlShopProductBuyOpen(productInfo)
  _PA_LOG("cylee", "PaGlobalFunc_PearlShopProductBuyOpen()")
  pearlShopProductBuy:open(productInfo)
end
function pearlShopProductBuy:close()
  _PA_LOG("cylee", "pearlShopProductBuy:close()")
  self._panel:SetShow(false)
end
function PaGlobalFunc_PearlShopProductBuyClose()
  pearlShopProductBuy:close()
end
function pearlShopProductBuy:update()
  _PA_LOG("cylee", "pearlShopProductBuy:update()")
  self._itemSlot:ChangeTextureInfoNameAsync("icon/" .. self._productInfo:getIconPath())
  self._titleControl:SetText(self._productInfo:getDisplayName())
  local desc = ""
  for i = 0, self._subItemSlotControlListSize - 1 do
    local control = self._subItemSlotControlList[i]
    local showFlag = i < self._productInfo:getItemListCount()
    control:SetShow(showFlag)
    if showFlag then
      local itemInfo = self._productInfo:getItemByIndex(i)
      control:ChangeTextureInfoNameAsync("icon/" .. itemInfo:getIconPath())
      desc = desc .. itemInfo:getName() .. "\n"
    end
  end
  self._descControl:SetText(desc)
end
function pearlShopProductBuy:changePlatformSpecKey()
  _PA_LOG("cylee", "pearlShopProductBuy:changePlatformSpecKey()")
end
function FromClient_PearlShopProductBuyInit()
  _PA_LOG("cylee", "FromClient_PearlShopProductBuyInit()")
  pearlShopProductBuy:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PearlShopProductBuyInit")
