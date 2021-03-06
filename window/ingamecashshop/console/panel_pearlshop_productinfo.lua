local pearlShopProductInfo = {
  _init = false,
  _panel = Panel_PearlShop_ProductInfo,
  _productNoRaw = 0,
  _focusedIndex = -1,
  _ui = {
    _itemSlotControlListSize = 5,
    _itemSlotControlList = {},
    _mainBgControl = nil,
    _titleControl = nil,
    _descControl = nil,
    _desc2Control = nil,
    _sellTypeControl = nil,
    _bottomControl = nil,
    _itemSlotBgTemplateControl = nil
  },
  _slotGapX = 7,
  _slotList = {},
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  }
}
function pearlShopProductInfo:initialize()
  if self._init then
    return
  end
  self._init = true
  self._ui._mainBgControl = UI.getChildControl(self._panel, "Static_MainBG")
  self._ui._titleControl = UI.getChildControl(self._ui._mainBgControl, "StaticText_ProductName")
  self._ui._descControl = UI.getChildControl(self._ui._mainBgControl, "StaticText_ProductDesc")
  self._ui._descControl:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._desc2Control = UI.getChildControl(self._ui._mainBgControl, "StaticText_ProductCaution")
  self._ui._desc2Control:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._sellTypeControl = UI.getChildControl(self._ui._mainBgControl, "StaticText_SellType")
  self._bottomLineControl = UI.getChildControl(self._ui._mainBgControl, "Static_HorizontalLine3")
  local itemSlotGroup = UI.getChildControl(self._ui._mainBgControl, "Static_ItemSlotGroup")
  self._ui._itemSlotBgTemplateControl = UI.getChildControl(itemSlotGroup, "Static_ItemSlotBg_Template")
  self._ui._itemSlotBgTemplateControl:SetShow(false)
  for i = 0, self._ui._itemSlotControlListSize - 1 do
    local itemSlotControl = UI.cloneControl(self._ui._itemSlotBgTemplateControl, itemSlotGroup, "Static_ItemSlot" .. i)
    self._ui._itemSlotControlList[i] = itemSlotControl
    local slot = {}
    SlotItem.new(slot, "Slot" .. i, i, itemSlotControl, self._slotConfig)
    slot:createChild()
    slot.icon:addInputEvent("Mouse_On", "PaGlobalFunc_PearlShopProductInfoFocus(" .. i .. ")")
    self._slotList[i] = slot
  end
  self._ui._bottomControl = UI.getChildControl(self._panel, "Static_BottomSite")
  local closeButtonControl = UI.getChildControl(self._ui._bottomControl, "Button_Close")
  closeButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopProductInfoClose()")
  self._panel:ignorePadSnapMoveToOtherPanel()
end
function PaGlobalFunc_PearlShopProductInfoCheckShow()
  return pearlShopProductInfo:checkShow()
end
function pearlShopProductInfo:checkShow()
  return self._panel:GetShow()
end
function PaGlobalFunc_PearlShopProductInfoBack()
  pearlShopProductInfo:back()
end
function pearlShopProductInfo:back()
  self:close()
end
function pearlShopProductInfo:getInfo()
  if self._productNoRaw then
    return getIngameCashMall():getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  end
end
function pearlShopProductInfo:open(productInfo)
  if not productInfo then
    return
  end
  self._productNoRaw = productInfo:getNoRaw()
  self:focus(0)
  self._panel:SetShow(true)
end
function PaGlobalFunc_PearlShopProductInfoOpen(productInfo)
  pearlShopProductInfo:open(productInfo)
end
function pearlShopProductInfo:close()
  self._panel:SetShow(false)
end
function PaGlobalFunc_PearlShopProductInfoClose()
  if pearlShopProductInfo._panel:GetShow() then
    _AudioPostEvent_SystemUiForXBOX(50, 3)
  end
  pearlShopProductInfo:close()
end
function pearlShopProductInfo:focus(controlIndex)
  local info = self:getInfo()
  if not info then
    return
  end
  if controlIndex >= info:getItemListCount() then
    return
  end
  self._focusedIndex = controlIndex
  self:update()
end
function PaGlobalFunc_PearlShopProductInfoFocus(controlIndex)
  pearlShopProductInfo:focus(controlIndex)
end
function pearlShopProductInfo:update()
  local info = self:getInfo()
  if not info then
    return
  end
  local itemListCount = info:getItemListCount()
  local firstPosX = self._ui._itemSlotBgTemplateControl:GetPosX() - 0.5 * (self._ui._itemSlotBgTemplateControl:GetSizeX() + 5) * (itemListCount - 1)
  for i = 0, self._ui._itemSlotControlListSize - 1 do
    local control = self._ui._itemSlotControlList[i]
    control:SetPosX(firstPosX + (self._ui._itemSlotBgTemplateControl:GetSizeX() + self._slotGapX) * i)
    local showFlag = i < info:getItemListCount()
    control:SetShow(showFlag)
    if showFlag then
      local itemInfo = info:getItemByIndex(i)
      self._slotList[i]:setItemByStaticStatus(itemInfo, 1)
    end
  end
  local focusedItemInfo = info:getItemByIndex(self._focusedIndex)
  self._ui._titleControl:SetText(focusedItemInfo:getName())
  self._ui._descControl:SetText(focusedItemInfo:getDescription())
  self._bottomLineControl:SetPosY(self._ui._descControl:GetPosY() + self._ui._descControl:GetTextSizeY() + 10)
  self._ui._bottomControl:SetPosY(self._bottomLineControl:GetPosY() + self._ui._bottomControl:GetSizeY() + 10)
  self._ui._mainBgControl:SetSize(self._ui._mainBgControl:GetSizeX(), self._ui._bottomControl:GetPosY() + 10)
  self._panel:SetSize(self._panel:GetSizeX(), self._ui._mainBgControl:GetPosY() + self._ui._mainBgControl:GetSizeY())
  self._ui._desc2Control:SetShow(false)
  self._ui._sellTypeControl:SetShow(false)
end
function pearlShopProductInfo:changePlatformSpecKey()
end
function FromClient_PearlShopProductInfoInit()
  pearlShopProductInfo:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PearlShopProductInfoInit")
