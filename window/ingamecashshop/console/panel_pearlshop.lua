local pearlShop = {
  _init = false,
  _panel = Panel_PearlShop,
  _productInfoOffset = 0,
  _frameContentOffset = 0,
  _productControlOffset = 0,
  _showingDescIndex = -1,
  _showingSubProductIndex = -1,
  _scrollContentSize = 0,
  _productControlSmallSize = 70,
  _ui = {
    _productControlList = {},
    _productControlListSize = 0,
    _subProductNameControlListSize = 20,
    _subProductNameControlList = {},
    _subItemControlListSize = 10,
    _subItemControlList = {},
    _categoryTitleControl = nil,
    _frameControl = nil,
    _frameContentControl = nil,
    _bgControl = nil,
    _scrollControl = nil,
    _pearlPriceControl = nil,
    _mileagePriceControl = nil
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  },
  _listItemGapY = 3,
  _infoListSize = 0
}
function PaGlobalFunc_PearlShopOpen()
  if pearlShop:open() then
    return pearlShop:update()
  end
end
function pearlShop:initialize()
  if not _ContentsGroup_RenewUI_PearlShop then
    return
  end
  if self._init then
    return
  end
  self._init = true
  local topMenuControl = UI.getChildControl(self._panel, "Static_TopMenu")
  self._ui._categoryTitleControl = UI.getChildControl(topMenuControl, "StaticText_CategoryTitle")
  self._ui._frameControl = UI.getChildControl(self._panel, "Panel_PearlShop_ProductListFrame")
  self._ui._frameContentControl = UI.getChildControl(self._ui._frameControl, "Panel_PearlShop_ProductListFrameContent")
  self._ui._bgControl = UI.getChildControl(self._ui._frameContentControl, "Static_MainBG")
  self._ui._scrollControl = UI.getChildControl(self._ui._frameControl, "Panel_PearlShop_ProductListFrameVerticalScroll")
  self._ui._categoryTitleControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopBack()")
  local productControlTemplate = UI.getChildControl(self._ui._bgControl, "Button_ProductClick")
  self:hideDescXXXXX(productControlTemplate)
  UI.getChildControl(productControlTemplate, "StaticText_ProductDesc"):SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  productControlTemplate:SetShow(false)
  local size = math.floor(self._ui._frameControl:GetSizeY() / productControlTemplate:GetSizeY()) + 2
  for i = 0, size - 1 do
    local productControl = UI.cloneControl(productControlTemplate, self._ui._bgControl, "Button_ProductClick" .. i)
    self._ui._productControlList[i] = productControl
    self._ui._productControlListSize = self._ui._productControlListSize + 1
    productControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopSelect(" .. i .. ")")
    productControl:registerPadEvent(__eConsoleUIPadEvent_DpadLeft, "PaGlobalFunc_PearlShopChangeSubProduct(-1)")
    productControl:registerPadEvent(__eConsoleUIPadEvent_DpadRight, "PaGlobalFunc_PearlShopChangeSubProduct(1)")
    local buttombg = UI.getChildControl(productControl, "Static_ConsoleBottomBg")
    local detailButtonControl = UI.getChildControl(buttombg, "Button_XboxProductSelect_ConsoleUI")
    detailButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopShowDetail()")
    local buyButtonControl = UI.getChildControl(productControl, "Button_Buy")
    buyButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopBuy(" .. i .. ")")
    local subProductNameControlBase = UI.getChildControl(productControl, "StaticText_SubProductName")
    for j = 0, self._ui._subProductNameControlListSize - 1 do
      local subProductNameControl = UI.cloneControl(subProductNameControlBase, productControl, "StaticText_SubProductName" .. j)
      subProductNameControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopSelectSubProduct(" .. j .. ")")
    end
    local subItemControlTemplate = UI.getChildControl(productControl, "Static_ItemSlotBG")
    for j = 0, self._ui._subItemControlListSize - 1 do
      local subItemControl = UI.cloneControl(subItemControlTemplate, productControl, "Static_ItemSlotBG" .. j)
    end
    self:hideDescXXX(i)
    productControl:SetPosY(productControlTemplate:GetSizeY() * i)
  end
  local bottomMenuControl = UI.getChildControl(self._panel, "Static_BottomMenu")
  local pearlBgControl = UI.getChildControl(bottomMenuControl, "Static_MoneyType2BG")
  self._ui._pearlPriceControl = UI.getChildControl(pearlBgControl, "StaticText_MoneyType_Price1")
  local mileageBgControl = UI.getChildControl(bottomMenuControl, "Static_MoneyType3BG")
  self._ui._mileagePriceControl = UI.getChildControl(mileageBgControl, "StaticText_MoneyType_Price1")
  self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_PearlShopShowDetail()")
  self._panel:RegisterUpdateFunc("PaGlobalFunc_PearlShopProductListPerFrameUpdate")
end
function PaGlobalFunc_PearlShopCheckShow()
  return pearlShop:checkShow()
end
function PaGlobalFunc_PearlShopUpdate()
  return pearlShop:update()
end
function pearlShop:checkShow()
  return self._panel:GetShow()
end
function PaGlobalFunc_PearlShopBack()
  if pearlShop:back() then
    return pearlShop:update()
  end
end
function pearlShop:back()
  if self:hideDesc() then
    return true
  end
  PaGlobalFunc_PearlShopCategoryOpen(false)
  self:close()
end
function pearlShop:open()
  local categoryTitle = PaGlobalFunc_PearlShopCategoryGetCurrentCategoryTitle()
  self._ui._categoryTitleControl:SetText(categoryTitle)
  self._productInfoOffset = 0
  self._frameContentOffset = 0
  self._productControlOffset = 0
  self._showingDescIndex = -1
  self._showingSubProductIndex = -1
  getIngameCashMall():setSearchText("")
  getIngameCashMall():setCurrentClass(-1)
  getIngameCashMall():setCurrentSort(-1)
  getIngameCashMall():setCurrentSubFilter(-1)
  getIngameCashMall():setCashProductNoRawFilterList()
  self._infoListSize = getIngameCashMall():getCashProductFilterListCount()
  local contentSizeY = (self._productControlSmallSize + self._listItemGapY) * self._infoListSize
  self:initContentSize(contentSizeY)
  FGlobal_CashShop_SetEquip_Open()
  getIngameCashMall():clearEquipViewList()
  getIngameCashMall():changeViewMyCharacter()
  getIngameCashMall():hide()
  getIngameCashMall():show()
  self._panel:SetShow(true)
  return true
end
function pearlShop:initContentSize(size)
  self._ui._frameContentControl:SetSize(self._ui._frameContentControl:GetSizeX(), size)
  self._ui._bgControl:SetSize(self._ui._bgControl:GetSizeX(), size)
  self._ui._frameControl:UpdateContentScroll()
  local scrollAreaSizeY = size - self._ui._frameControl:GetSizeY()
  local scrollUnitSizeY = self._productControlSmallSize + self._listItemGapY
  local scrollInterval = scrollAreaSizeY / scrollUnitSizeY
  self._ui._scrollControl:SetInterval(scrollInterval)
  self._ui._scrollControl:SetControlPos(0)
  self._ui._frameControl:UpdateContentPos()
  self._scrollContentSize = size
end
function pearlShop:addContentSize(sizeOffset)
  local scrollPos = self._ui._scrollControl:GetControlPos()
  local scrollPosY = scrollPos * self._scrollContentSize
  local nextScrollContentSize = self._scrollContentSize + sizeOffset
  local nextScrollPos = scrollPosY / nextScrollContentSize
  if nextScrollPos > 1 then
    nextScrollPos = 1
  end
  self._ui._frameContentControl:SetSize(self._ui._frameContentControl:GetSizeX(), nextScrollContentSize)
  self._ui._bgControl:SetSize(self._ui._bgControl:GetSizeX(), nextScrollContentSize)
  self._ui._frameControl:UpdateContentScroll()
  self._ui._frameControl:UpdateContentPos()
  self._scrollContentSize = nextScrollContentSize
end
function pearlShop:close()
  self._panel:SetShow(false)
  FGlobal_Panel_Radar_Show(true, false)
  Panel_TimeBar:SetShow(true, false)
  FGlobal_QuestWidget_Open()
end
function PaGlobalFunc_PearlShopClose()
  pearlShop:close()
end
function pearlShop:getProductInfoByIndex(index)
  if index < 0 or index >= self._ui._productControlListSize then
    return
  end
  local infoIndex = self._productInfoOffset + index
  if infoIndex >= self._infoListSize then
    return
  end
  local productNoRaw = getIngameCashMall():getCashProductNoRawFromFilterList(infoIndex)
  local productInfo = getIngameCashMall():getCashProductStaticStatusByProductNoRaw(productNoRaw)
  return productInfo
end
function pearlShop:frameUpdate(delta)
  local frameTop = self._ui._frameControl:GetParentPosY()
  local frameShowingTop = frameTop - self._productControlSmallSize
  local frameBottom = frameTop + self._ui._frameControl:GetSizeY()
  if 0 <= self._showingDescIndex then
    local showingControl = self:getProductControlByIndex(self._showingDescIndex)
    local showingTop = showingControl:GetParentPosY()
    local showingBottom = showingTop + showingControl:GetSizeY()
    if frameBottom < showingTop or frameTop > showingBottom then
      self:hideDesc()
      return true
    end
  end
  local hideIndex = -1
  for i = 0, self._ui._productControlListSize - 1 do
    local control = self:getProductControlByIndex(i)
    local controlBottom = control:GetParentPosY() + control:GetSizeY()
    if frameShowingTop > controlBottom then
      hideIndex = i
      break
    end
  end
  if hideIndex >= 0 then
    local sizeStackToScrollUp = 0
    for i = 0, hideIndex do
      local control = self:getProductControlByIndex(i)
      sizeStackToScrollUp = sizeStackToScrollUp + control:GetSizeY() + self._listItemGapY
    end
    self._frameContentOffset = self._frameContentOffset + sizeStackToScrollUp
    self:addProductInfoOffset(hideIndex + 1)
    return true
  end
  local firstControlTop = self:getProductControlByIndex(0):GetParentPosY()
  if frameShowingTop < firstControlTop then
    local gapSizeY = firstControlTop - frameShowingTop
    local showCount = math.ceil(gapSizeY / (self._productControlSmallSize + self._listItemGapY))
    if self:addProductInfoOffset(-1 * showCount) then
      self._frameContentOffset = self._frameContentOffset - showCount * (self._productControlSmallSize + self._listItemGapY)
    else
      self._productInfoOffset = 0
      self._frameContentOffset = 0
      self._productControlOffset = 0
      self._ui._scrollControl:SetControlPos(0)
      self._ui._frameControl:UpdateContentPos()
    end
    return true
  end
end
function PaGlobalFunc_PearlShopProductListPerFrameUpdate(delta)
  if pearlShop:frameUpdate(delta) then
    return pearlShop:update()
  end
end
function pearlShop:changePlatformSpecKey()
  if not self._init then
    return
  end
end
function FromClient_PearlShopInit()
  pearlShop:initialize()
end
function pearlShop:showDesc(index)
  if self._showingDescIndex == index then
    return false
  end
  if self._showingDescIndex >= 0 then
    self:hideDesc()
  end
  local info = self:getProductInfoByIndex(index)
  if not info then
    return false
  end
  self._showingDescIndex = index
  local groupIndex = info:getOfferGroup()
  local subInfoListSize = getIngameCashMall():getCashProductStaticStatusGroupListCount(groupIndex)
  if subInfoListSize <= 0 then
    FGlobal_CashShop_SetEquip_Update(info:getNoRaw())
    FGlobal_CashShop_SetEquip_SelectedItem(info:getNoRaw())
  else
    self:selectSubProduct(0)
  end
  return true
end
function pearlShop:showDescXXX(index)
  local control = self:getProductControlByIndex(index)
  local beforeSizeY = control:GetSizeY()
  UI.getChildControl(control, "Static_BG1"):SetShow(true)
  UI.getChildControl(control, "StaticText_SubProductName"):SetShow(false)
  UI.getChildControl(control, "StaticText_ProductDesc"):SetShow(true)
  UI.getChildControl(control, "Static_ItemSlotBG"):SetShow(false)
  local buttombg = UI.getChildControl(control, "Static_ConsoleBottomBg")
  UI.getChildControl(buttombg, "Button_XboxBuy_ConsoleUI"):SetShow(true)
  UI.getChildControl(buttombg, "Button_XboxProductSelect_ConsoleUI"):SetShow(true)
  UI.getChildControl(control, "Static_BG2"):SetShow(true)
  local topPosY = -1
  local bottomPosY = -1
  local subProductNameBaseControl = UI.getChildControl(control, "StaticText_SubProductName")
  for i = 0, self._ui._subProductNameControlListSize - 1 do
    local subControl = UI.getChildControl(control, "StaticText_SubProductName" .. i)
    subControl:SetPosX(subProductNameBaseControl:GetPosX() + 200 * (i % 3))
    subControl:SetPosY(subProductNameBaseControl:GetPosY() + 35 * math.floor(i / 3))
    if 0 < string.len(subControl:GetText()) then
      subControl:SetShow(true)
      if topPosY < 0 then
        topPosY = subControl:GetPosY()
      end
      bottomPosY = subControl:GetPosY() + subControl:GetSizeY()
    end
  end
  local showSubProductFlag = topPosY > 0 and bottomPosY > 0
  UI.getChildControl(control, "StaticText_ProductSubSetName"):SetShow(showSubProductFlag)
  UI.getChildControl(control, "Static_ProductSubSetLeftIcon"):SetShow(showSubProductFlag)
  UI.getChildControl(control, "Static_ProductSubSetRightIcon"):SetShow(showSubProductFlag)
  local subProductBgControl = UI.getChildControl(control, "Static_BG2")
  subProductBgControl:SetShow(showSubProductFlag)
  local descPosY = -1
  if showSubProductFlag then
    subProductBgControl:SetSize(subProductBgControl:GetSizeX(), bottomPosY - topPosY + 20)
    local bottomLineControl = UI.getChildControl(subProductBgControl, "Static_HorizontalLine2")
    bottomLineControl:SetPosY(subProductBgControl:GetSizeY())
    descPosY = subProductBgControl:GetPosY() + subProductBgControl:GetSizeY() + 10
  else
    subProductBgControl:SetSize(subProductBgControl:GetSizeX(), 0)
    descPosY = UI.getChildControl(control, "Static_ProductSubSetLeftIcon"):GetPosY()
  end
  local descControl = UI.getChildControl(control, "StaticText_ProductDesc")
  descControl:SetPosY(descPosY)
  local subItemPosY = descControl:GetPosY() + descControl:GetTextSizeY() + 10
  local info = self:getProductInfoByIndex(index)
  local subItemBaseControl = UI.getChildControl(control, "Static_ItemSlotBG")
  subItemBaseControl:SetPosY(subItemPosY)
  for i = 0, self._ui._subItemControlListSize - 1 do
    local subControl = UI.getChildControl(control, "Static_ItemSlotBG" .. i)
    subControl:SetPosX(subItemBaseControl:GetPosX() + i * (subItemBaseControl:GetSizeX() + 5))
    subControl:SetPosY(subItemPosY)
    subControl:SetShow(i < info:getItemListCount())
  end
  local bgPosY = subItemBaseControl:GetPosY() + subItemBaseControl:GetSizeY() + 10
  local bgControl = UI.getChildControl(control, "Static_BG1")
  bgControl:SetSize(bgControl:GetSizeX(), bgPosY - bgControl:GetPosY())
  local buttonPosY = bgControl:GetPosY() + bgControl:GetSizeY() + 10
  UI.getChildControl(control, "Button_Buy"):SetPosY(buttonPosY)
  local buttombg = UI.getChildControl(control, "Static_ConsoleBottomBg")
  UI.getChildControl(buttombg, "Button_XboxBuy_ConsoleUI"):SetPosY(buttonPosY)
  UI.getChildControl(buttombg, "Button_XboxProductSelect_ConsoleUI"):SetPosY(buttonPosY)
  local totalSizeY = buttonPosY + UI.getChildControl(control, "Button_Buy"):GetSizeY() + 10
  control:SetSize(control:GetSizeX(), totalSizeY)
  local diffSizeY = control:GetSizeY() - beforeSizeY
  return diffSizeY
end
function pearlShop:hideDescXXXXX(control)
  local beforeSizeY = control:GetSizeY()
  UI.getChildControl(control, "Static_BG1"):SetShow(false)
  UI.getChildControl(control, "Static_BG1"):SetShow(false)
  UI.getChildControl(control, "StaticText_ProductSubSetName"):SetShow(false)
  UI.getChildControl(control, "Static_ProductSubSetLeftIcon"):SetShow(false)
  UI.getChildControl(control, "Static_ProductSubSetRightIcon"):SetShow(false)
  UI.getChildControl(control, "StaticText_SubProductName"):SetShow(false)
  UI.getChildControl(control, "StaticText_ProductDesc"):SetShow(false)
  UI.getChildControl(control, "Static_ItemSlotBG"):SetShow(false)
  UI.getChildControl(control, "Button_Buy"):SetShow(false)
  UI.getChildControl(control, "Button_Gift"):SetShow(false)
  UI.getChildControl(control, "Button_Cart"):SetShow(false)
  local buttombg = UI.getChildControl(control, "Static_ConsoleBottomBg")
  UI.getChildControl(buttombg, "Button_XboxBuy_ConsoleUI"):SetShow(false)
  UI.getChildControl(buttombg, "Button_XboxGift_ConsoleUI"):SetShow(false)
  UI.getChildControl(buttombg, "Button_XboxProductSelect_ConsoleUI"):SetShow(false)
  UI.getChildControl(control, "Static_BG2"):SetShow(false)
  for i = 0, self._ui._subProductNameControlListSize - 1 do
    local subControl = UI.getChildControlNoneAssert(control, "StaticText_SubProductName" .. i)
    if subControl then
      subControl:SetShow(false)
    end
  end
  for i = 0, self._ui._subItemControlListSize - 1 do
    local subControl = UI.getChildControlNoneAssert(control, "Static_ItemSlotBG" .. i)
    if subControl then
      subControl:SetShow(false)
    end
  end
  control:SetSize(control:GetSizeX(), self._productControlSmallSize)
  local diffSizeY = control:GetSizeY() - beforeSizeY
  return diffSizeY
end
function pearlShop:hideDescXXX(index)
  local control = self:getProductControlByIndex(index)
  local beforeSizeY = control:GetSizeY()
  self:hideDescXXXXX(control)
  local diffSizeY = control:GetSizeY() - beforeSizeY
  return diffSizeY
end
function pearlShop:hideDesc()
  if self._showingDescIndex < 0 then
    return false
  end
  self._showingDescIndex = -1
  self._showingSubProductIndex = -1
  return true
end
function pearlShop:select(controlIndex)
  local index = self:getIndexByControlIndex(controlIndex)
  if self._showingDescIndex == index then
    self:buy(controlIndex)
    return
  end
  return self:showDesc(index)
end
function PaGlobalFunc_PearlShopSelect(controlIndex)
  if pearlShop:select(controlIndex) then
    return pearlShop:update()
  end
end
function pearlShop:showDetail()
  if self._showingDescIndex < 0 then
    return
  end
  local info = self:getProductInfoByIndex(self._showingDescIndex)
  if not info then
    return
  end
  local groupIndex = info:getOfferGroup()
  local subInfoListSize = getIngameCashMall():getCashProductStaticStatusGroupListCount(groupIndex)
  if 0 <= self._showingSubProductIndex and subInfoListSize > self._showingSubProductIndex then
    info = getIngameCashMall():getCashProductStaticStatusGroupByIndex(groupIndex, self._showingSubProductIndex)
  end
  PaGlobalFunc_PearlShopProductInfoOpen(info)
end
function PaGlobalFunc_PearlShopShowDetail()
  return pearlShop:showDetail()
end
function pearlShop:selectSubProduct(index)
  local info = self:getProductInfoByIndex(self._showingDescIndex)
  if not info then
    return
  end
  local groupIndex = info:getOfferGroup()
  local subInfoListSize = getIngameCashMall():getCashProductStaticStatusGroupListCount(groupIndex)
  if index >= subInfoListSize then
    return
  end
  local subInfo = getIngameCashMall():getCashProductStaticStatusGroupByIndex(groupIndex, index)
  if not subInfo then
    return
  end
  FGlobal_CashShop_SetEquip_Update(subInfo:getNoRaw())
  FGlobal_CashShop_SetEquip_SelectedItem(subInfo:getNoRaw())
  self._showingSubProductIndex = index
  return true
end
function PaGlobalFunc_PearlShopSelectSubProduct(index)
  if pearlShop:selectSubProduct(index) then
    return pearlShop:update()
  end
end
function pearlShop:changeSubProduct(diffIndex)
  if self._showingSubProductIndex < 0 then
    return
  end
  local index = self._showingSubProductIndex + diffIndex
  if index < 0 then
    return
  end
  local info = self:getProductInfoByIndex(self._showingDescIndex)
  if not info then
    return
  end
  local groupIndex = info:getOfferGroup()
  local subInfoListSize = getIngameCashMall():getCashProductStaticStatusGroupListCount(groupIndex)
  if index >= subInfoListSize then
    return
  end
  return self:selectSubProduct(index)
end
function PaGlobalFunc_PearlShopChangeSubProduct(diffIndex)
  if pearlShop:changeSubProduct(diffIndex) then
    return pearlShop:update()
  end
end
function pearlShop:buy(controlIndex)
  local index = self:getIndexByControlIndex(controlIndex)
  local info = self:getProductInfoByIndex(index)
  if not info then
    return
  end
  local groupIndex = info:getOfferGroup()
  local subInfoListSize = getIngameCashMall():getCashProductStaticStatusGroupListCount(groupIndex)
  if 0 <= self._showingSubProductIndex and subInfoListSize > self._showingSubProductIndex then
    info = getIngameCashMall():getCashProductStaticStatusGroupByIndex(groupIndex, self._showingSubProductIndex)
  end
  PaGlobalFunc_PearlShopProductBuyOpen(info)
end
function PaGlobalFunc_PearlShopBuy(controlIndex)
  return pearlShop:buy(controlIndex)
end
function pearlShop:addProductInfoOffset(offset)
  if self._productInfoOffset + offset < 0 then
    return false
  end
  self._productInfoOffset = self._productInfoOffset + offset
  self._productControlOffset = (self._productControlOffset + offset) % self._ui._productControlListSize
  if 0 <= self._showingDescIndex then
    self._showingDescIndex = self._showingDescIndex - offset
  end
  return true
end
function pearlShop:getControlIndexByIndex(index)
  local controlIndex = self._productControlOffset + index
  controlIndex = controlIndex % self._ui._productControlListSize
  return controlIndex
end
function pearlShop:getIndexByControlIndex(controlIndex)
  local index = controlIndex - self._productControlOffset
  index = (index + self._ui._productControlListSize) % self._ui._productControlListSize
  return index
end
function pearlShop:getProductControlByIndex(index)
  local controlIndex = self:getControlIndexByIndex(index)
  return self:getProductControlByControlIndex(controlIndex)
end
function pearlShop:getProductControlByControlIndex(index)
  if index >= 0 and index < self._ui._productControlListSize then
    return self._ui._productControlList[index]
  end
end
function pearlShop:update()
  if not self._init then
    return
  end
  local pos = self._frameContentOffset
  local diffSizeY = 0
  for i = 0, self._ui._productControlListSize - 1 do
    local control = self:getProductControlByIndex(i)
    control:SetPosY(pos)
    if self:updateControlInfo(i) then
      if self._showingDescIndex == i then
        diffSizeY = diffSizeY + self:showDescXXX(i)
      else
        diffSizeY = diffSizeY + self:hideDescXXX(i)
      end
      pos = pos + control:GetSizeY() + self._listItemGapY
    end
  end
  if 0 ~= diffSizeY then
    self:addContentSize(diffSizeY)
  end
  local pearl = toInt64(0, 0)
  local pearlItem = getInventoryItemByType(CppEnums.ItemWhereType.eCashInventory, getPearlSlotNo())
  if pearlItem then
    pearl = pearlItem:get():getCount_s64()
  end
  self._ui._pearlPriceControl:SetText(makeDotMoney(pearl))
  local mileage = toInt64(0, 0)
  local mileageItem = getInventoryItemByType(CppEnums.ItemWhereType.eCashInventory, getMileageSlotNo())
  if mileageItem then
    mileage = mileageItem:get():getCount_s64()
  end
  self._ui._mileagePriceControl:SetText(makeDotMoney(mileage))
end
function pearlShop:updateControlInfo(index)
  local control = self:getProductControlByIndex(index)
  if not control then
    return false
  end
  local info = self:getProductInfoByIndex(index)
  if not info then
    control:SetShow(false)
    return false
  end
  control:SetShow(true)
  local nameControl = UI.getChildControl(control, "StaticText_ProductName")
  nameControl:SetText(info:getDisplayName())
  local subTitleControl = UI.getChildControl(control, "StaticText_ProductSubSetName")
  subTitleControl:SetText(info:getDisplaySubName())
  local tagTexture = {
    [0] = {
      0,
      0,
      0,
      0
    },
    {
      4,
      3,
      238,
      67
    },
    {
      4,
      70,
      238,
      134
    },
    {
      278,
      246,
      512,
      310
    },
    {
      4,
      204,
      238,
      268
    },
    {
      274,
      443,
      508,
      507
    },
    {
      4,
      137,
      238,
      201
    }
  }
  local imageControl = UI.getChildControl(control, "Static_ProductBannerImage")
  if info:getPackageIcon() then
    imageControl:ChangeTextureInfoNameAsync(info:getPackageIcon())
  else
    imageControl:ChangeTextureInfoNameAsync(nil)
  end
  local tagControl = UI.getChildControl(control, "Static_ProductBannerSaleType")
  local tagType = info:getTag()
  tagControl:ChangeTextureInfoNameAsync("new_ui_common_forlua/window/ingamecashshop/CashShop_03.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(tagControl, tagTexture[tagType][1], tagTexture[tagType][2], tagTexture[tagType][3], tagTexture[tagType][4])
  tagControl:getBaseTexture():setUV(x1, y1, x2, y2)
  tagControl:setRenderTexture(tagControl:getBaseTexture())
  local tagType = info:getTag()
  if (4 == tagType or 5 == tagType) and not info:isApplyDiscount() and info:isDefinedDiscount() then
    tagControl:SetShow(false)
  else
    tagControl:SetShow(true)
  end
  local pearlPriceControl = UI.getChildControl(control, "StaticText_ProductPearlPrice")
  local mileagePriceControl = UI.getChildControl(control, "StaticText_ProductMileagePrice")
  local discountControl = UI.getChildControl(control, "StaticText_DiscountPrice")
  local discountDescControl = UI.getChildControl(control, "StaticText_ProductSaleDate")
  if info:isApplyDiscount() then
    local endDiscountTimeValue = PATime(info:getEndDiscountTime():get_s64())
    local endDiscountTimeStr = ""
    if isGameTypeEnglish() then
      endDiscountTimeStr = convertStringFromDatetime(info:getRemainDiscountTime())
    else
      endDiscountTimeStr = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTTIME", "GetYear", tostring(endDiscountTimeValue:GetYear()), "GetMonth", tostring(endDiscountTimeValue:GetMonth()), "GetDay", tostring(endDiscountTimeValue:GetDay())) .. " " .. string.format("%.02d", endDiscountTimeValue:GetHour()) .. ":" .. string.format("%.02d", endDiscountTimeValue:GetMinute())
    end
    discountDescControl:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_DISCOUNT", "endDiscountTime", endDiscountTimeStr))
    discountDescControl:SetShow(true)
    discountControl:SetText(makeDotMoney(info:getOriginalPrice()))
    discountControl:SetShow(true)
  else
    discountControl:SetShow(false)
    discountDescControl:SetShow(false)
  end
  pearlPriceControl:SetText(makeDotMoney(info:getPearlPrice()))
  pearlPriceControl:SetShow(toInt64(0, 0) < info:getPearlPrice())
  mileagePriceControl:SetText(makeDotMoney(info:getMileagePrice()))
  mileagePriceControl:SetShow(toInt64(0, 0) < info:getMileagePrice())
  UI.getChildControl(control, "StaticText_ProductDesc"):SetText(info:getDescription())
  local groupIndex = info:getOfferGroup()
  local subInfoListSize = getIngameCashMall():getCashProductStaticStatusGroupListCount(groupIndex)
  for i = 0, self._ui._subProductNameControlListSize - 1 do
    local subControl = UI.getChildControl(control, "StaticText_SubProductName" .. i)
    local subName = ""
    if i < subInfoListSize and subInfoListSize > 1 then
      local subInfo = getIngameCashMall():getCashProductStaticStatusGroupByIndex(groupIndex, i)
      subName = subInfo:getDisplaySubName()
      if subInfo:isApplyDiscount() then
        subName = "<PAColor0xfface400>" .. subName
      elseif 5 == subInfo:getTag() then
        subName = "<PAColor0xff33c5b3>" .. subName
      end
    end
    subControl:SetText(subName)
    if i == self._showingSubProductIndex then
      subTitleControl:SetText(subName)
    end
  end
  for i = 0, self._ui._subItemControlListSize - 1 do
    local subControl = UI.getChildControl(control, "Static_ItemSlotBG" .. i)
    local showFlag = i < info:getItemListCount()
    subControl:SetShow(subControl)
    if showFlag then
      local subItemInfo = info:getItemByIndex(i)
      subControl:ChangeTextureInfoNameAsync("icon/" .. subItemInfo:getIconPath())
    end
  end
  return true
end
function pearlShop:handleCompleteBuy()
  if PaGlobalFunc_PearlShopProductBuyCheckShow() then
    PaGlobalFunc_PearlShopProductBuyClose()
  end
  return true
end
function PaGlobalFunc_PearlShopHandleCompleteBuy()
  if pearlShop:handleCompleteBuy() then
    return pearlShop:update()
  end
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PearlShopInit")
registerEvent("FromClient_UpdateCashShop", "PaGlobalFunc_PearlShopUpdate")
registerEvent("FromClient_UpdateCash", "PaGlobalFunc_PearlShopUpdate")
registerEvent("FromClient_InventoryUpdate", "PaGlobalFunc_PearlShopUpdate")
registerEvent("FromClient_NotifyCompleteBuyProduct", "PaGlobalFunc_PearlShopHandleCompleteBuy")
