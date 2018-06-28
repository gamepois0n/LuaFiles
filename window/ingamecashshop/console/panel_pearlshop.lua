local pearlShop = {
  _init = false,
  _panel = Panel_PearlShop,
  _productControlList = {},
  _productControlListSize = 0,
  _frameControl = nil,
  _frameContentControl = nil,
  _bgControl = nil,
  _scrollControl = nil,
  _startingProductInfoIndex = 0,
  _startingProductControlPosY = 0,
  _showingProductNo = -1,
  _isDirty = false,
  _frameUpdateDeltaStack = 0,
  _productControlSmallSize = 70,
  _productControlBigSize = 400
}
function PaGlobalFunc_PearlShopOpen()
  _PA_LOG("cylee", "PaGlobalFunc_PearlShopOpen()")
  pearlShop:open()
end
function pearlShop:initialize()
  _PA_LOG("cylee", "pearlShop:initialize()")
  if not _ContentsGroup_RenewUI_PearlShop then
    return
  end
  if self._init then
    return
  end
  self._init = true
  self._frameControl = UI.getChildControl(self._panel, "Panel_PearlShop_ProductListFrame")
  self._frameContentControl = UI.getChildControl(self._frameControl, "Panel_PearlShop_ProductListFrameContent")
  self._bgControl = UI.getChildControl(self._frameContentControl, "Static_MainBG")
  self._scrollControl = UI.getChildControl(self._frameControl, "Panel_PearlShop_ProductListFrameVerticalScroll")
  _PA_LOG("cylee", "pearlShop:initialize() scrollControl:" .. tostring(self._scrollControl))
  local productControlTemplate = UI.getChildControl(self._bgControl, "Button_ProductClick")
  self:hideProductListItemDesc(productControlTemplate)
  productControlTemplate:SetShow(false)
  local size = math.floor(self._frameControl:GetSizeY() / productControlTemplate:GetSizeY()) + 2
  _PA_LOG("cylee", "pearlShop:initialize() size:" .. self._frameControl:GetSizeY() .. "/" .. productControlTemplate:GetSizeY() .. "=" .. size)
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
  local frameContentSize = 0
  for i = 0, size - 1 do
    local productControl = UI.cloneControl(productControlTemplate, self._bgControl, "Button_ProductClick" .. i)
    self._productControlList[i] = productControl
    self._productControlListSize = self._productControlListSize + 1
    productControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopShowDesc(" .. i .. ")")
    local detailButtonControl = UI.getChildControl(productControl, "Button_XboxProductSelect_ConsoleUI")
    detailButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopShowDetail(" .. i .. ")")
    local buyButtonControl = UI.getChildControl(productControl, "Button_Buy")
    buyButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopBuy(" .. i .. ")")
    self:hideProductListItemDesc(productControl)
    productControl:SetPosY(productControlTemplate:GetSizeY() * i)
    frameContentSize = frameContentSize + productControlTemplate:GetSizeY()
  end
  self._frameContentControl:SetSize(self._frameContentControl:GetSizeX(), frameContentSize)
  self._bgControl:SetSize(self._bgControl:GetSizeX(), frameContentSize)
  self._scrollControl:SetControlPos(0)
  self._scrollControl:SetInterval(size)
  self._frameControl:UpdateContentScroll()
  self._frameControl:UpdateContentPos()
  self._panel:RegisterUpdateFunc("PaGlobalFunc_PearlShopProductListPerFrameUpdate")
end
function pearlShop:handleMouseOn(i)
  _PA_LOG("cylee", "pearlShop:handleMouseOn(" .. i .. ")")
end
function pearlShop:open()
  _PA_LOG("cylee", "pearlShop:open()")
  self._startingProductInfoIndex = 0
  self._startingProductControlPosY = 0
  getIngameCashMall():setSearchText("")
  getIngameCashMall():setCurrentClass(-1)
  getIngameCashMall():setCurrentSort(-1)
  getIngameCashMall():setCurrentSubFilter(-1)
  getIngameCashMall():setCashProductNoRawFilterList()
  local infoListSize = getIngameCashMall():getCashProductFilterListCount()
  self._scrollControl:SetControlPos(0)
  self._scrollControl:SetInterval(infoListSize)
  local contentsSize = self._productControlSmallSize * infoListSize
  self._frameContentControl:SetSize(self._frameContentControl:GetSizeX(), contentsSize)
  self._bgControl:SetSize(self._bgControl:GetSizeX(), contentsSize)
  self._frameControl:UpdateContentScroll()
  self._frameControl:UpdateContentPos()
  self:update()
  self._panel:SetShow(true)
end
function pearlShop:close()
  _PA_LOG("cylee", "pearlShop:close()")
  self._panel:SetShow(false)
end
function pearlShop:getProductInfoByControlIndex(controlIndex)
  local infoIndex = self:getStartingProductInfoIndex() + controlIndex
  local infoListSize = getIngameCashMall():getCashProductFilterListCount()
  if infoIndex >= infoListSize then
    return
  end
  local productNoRaw = getIngameCashMall():getCashProductNoRawFromFilterList(infoIndex)
  local productInfo = getIngameCashMall():getCashProductStaticStatusByProductNoRaw(productNoRaw)
  return productInfo
end
function PaGlobalFunc_PearlShopClose()
  pearlShop:close()
end
function pearlShop:frameUpdate(delta)
  self._frameUpdateDeltaStack = self._frameUpdateDeltaStack + delta
  if self._frameUpdateDeltaStack > 1 then
    self._frameUpdateDeltaStack = self._frameUpdateDeltaStack - 1
  end
  if 0 < self:getFirstProductControlIndex() then
    _PA_LOG("cylee", "pearlShop:frameUpdate() firstProductControlIndex:" .. self:getFirstProductControlIndex())
    local pos = 0
    for i = 0, self:getFirstProductControlIndex() - 1 do
      pos = pos + self:getProductControl(i):GetSizeY()
    end
    self:addStartingProductInfoIndex(self:getFirstProductControlIndex())
    self:addStartingProductControlPosY(pos)
    self:setDirty(true)
  end
  if 0 < pearlShop:getFirstProductControlPosY() then
    _PA_LOG("cylee", "pearlShop:frameUpdate() firstProductControlPosY:" .. self:getFirstProductControlPosY())
    local showCount = math.ceil(self:getFirstProductControlPosY() / self._productControlSmallSize)
    if self:addStartingProductInfoIndex(-1 * showCount) then
      self:addStartingProductControlPosY(-1 * showCount * self._productControlSmallSize)
    else
      self._startingProductInfoIndex = 0
      self._startingProductControlPosY = 0
      self._scrollControl:SetControlPos(0)
      self._frameControl:UpdateContentPos()
    end
    self:setDirty(true)
  end
  if self:checkDirty() then
    _PA_LOG("cylee", "pearlShop:frameUpdate() isDirty")
    self:update()
  end
end
function PaGlobalFunc_PearlShopProductListPerFrameUpdate(delta)
  pearlShop:frameUpdate(delta)
end
function pearlShop:changePlatformSpecKey()
  _PA_LOG("cylee", "pearlShop:changePlatformSpecKey()")
  if not self._init then
    return
  end
end
function FromClient_PearlShopInit()
  pearlShop:initialize()
end
function pearlShop:showProductListItemDesc(control)
  UI.getChildControl(control, "Static_BG1"):SetShow(true)
  UI.getChildControl(control, "Static_BG1"):SetShow(true)
  UI.getChildControl(control, "StaticText_ProductSubSetName"):SetShow(true)
  UI.getChildControl(control, "Static_ProductSubSetLeftIcon"):SetShow(true)
  UI.getChildControl(control, "Static_ProductSubSetRightIcon"):SetShow(true)
  UI.getChildControl(control, "StaticText_SubProductName"):SetShow(true)
  UI.getChildControl(control, "StaticText_ProductDesc"):SetShow(true)
  UI.getChildControl(control, "Static_ItemSlotBG"):SetShow(true)
  UI.getChildControl(control, "Button_Buy"):SetShow(true)
  UI.getChildControl(control, "Button_Gift"):SetShow(true)
  UI.getChildControl(control, "Button_Cart"):SetShow(true)
  UI.getChildControl(control, "Button_XboxBuy_ConsoleUI"):SetShow(true)
  UI.getChildControl(control, "Button_XboxGift_ConsoleUI"):SetShow(true)
  UI.getChildControl(control, "Button_XboxProductSelect_ConsoleUI"):SetShow(true)
  UI.getChildControl(control, "Static_BG2"):SetShow(true)
  control:SetSize(control:GetSizeX(), self._productControlBigSize)
  self:setDirty(true)
end
function pearlShop:hideProductListItemDesc(control)
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
  UI.getChildControl(control, "Button_XboxBuy_ConsoleUI"):SetShow(false)
  UI.getChildControl(control, "Button_XboxGift_ConsoleUI"):SetShow(false)
  UI.getChildControl(control, "Button_XboxProductSelect_ConsoleUI"):SetShow(false)
  UI.getChildControl(control, "Static_BG2"):SetShow(false)
  control:SetSize(control:GetSizeX(), self._productControlSmallSize)
  self:setDirty(true)
end
function pearlShop:addFrameContentSize(diffSize)
  self._frameContentControl:SetSize(self._frameContentControl:GetSizeX(), self._frameContentControl:GetSizeY() + diffSize)
  self._bgControl:SetSize(self._bgControl:GetSizeX(), self._bgControl:GetSizeY() + diffSize)
  self._frameControl:UpdateContentPos()
end
function pearlShop:showDesc(controlIndex)
  _PA_LOG("cylee", "pearlShop:showDesc() controlIndex:" .. tostring(controlIndex))
  local productInfo = self:getProductInfoByControlIndex(controlIndex)
  if not productInfo then
    return
  end
  local control = self:getProductControl(controlIndex)
  if not control then
    return
  end
  local isShowing = productInfo:getNoRaw() == self._showingProductNo
  if isShowing then
    self:addFrameContentSize(self._productControlSmallSize - self._productControlBigSize)
    self:hideProductListItemDesc(control)
    self._showingProductNo = 0
    return
  end
  if self._showingProductNo > 0 then
    self:addFrameContentSize(self._productControlSmallSize - self._productControlBigSize)
    self:hideProductListItemDesc(control)
  end
  self:showProductListItemDesc(control)
  self:addFrameContentSize(self._productControlBigSize - self._productControlSmallSize)
  self._showingProductNo = productInfo:getNoRaw()
  self:setDirty(true)
end
function PaGlobalFunc_PearlShopShowDesc(controlIndex)
  pearlShop:showDesc(controlIndex)
end
function pearlShop:showDetail(controlIndex)
  _PA_LOG("cylee", "pearlShop:showDetail() controlIndex:" .. tostring(controlIndex))
  local productInfo = self:getProductInfoByControlIndex(controlIndex)
  if not productInfo then
    return
  end
  PaGlobalFunc_PearlShopProductInfoOpen(productInfo)
end
function PaGlobalFunc_PearlShopShowDetail(controlIndex)
  pearlShop:showDetail(controlIndex)
end
function pearlShop:buy(controlIndex)
  _PA_LOG("cylee", "pearlShop:buy() controlIndex:" .. tostring(controlIndex))
  local productInfo = self:getProductInfoByControlIndex(controlIndex)
  if not productInfo then
    return
  end
  PaGlobalFunc_PearlShopProductBuyOpen(productInfo)
end
function PaGlobalFunc_PearlShopBuy(controlIndex)
  pearlShop:buy(controlIndex)
end
function pearlShop:hideProductDetailInfo()
  _PA_LOG("cylee", "pearlShop:hideProductDetailInfo()")
end
function pearlShop:buyProduct(info)
  _PA_LOG("cylee", "pearlShop:buyProduct()")
end
function pearlShop:getStartingProductInfoIndex()
  return self._startingProductInfoIndex
end
function pearlShop:addStartingProductInfoIndex(diff)
  _PA_LOG("cylee", "pearlShop:addStartingProductInfoIndex() current:" .. tostring(self._startingProductInfoIndex) .. ", diff:" .. tostring(diff))
  if self._startingProductInfoIndex + diff >= 0 then
    self._startingProductInfoIndex = self._startingProductInfoIndex + diff
    return true
  end
  return false
end
function pearlShop:getStartingProductControlPosY()
  return self._startingProductControlPosY
end
function pearlShop:addStartingProductControlPosY(diff)
  self._startingProductControlPosY = self._startingProductControlPosY + diff
end
function pearlShop:checkDirty()
  return self._isDirty
end
function pearlShop:setDirty(flag)
  self._isDirty = flag
end
function pearlShop:getFirstProductControlIndex()
  for i = 0, self._productControlListSize - 1 do
    local control = self:getProductControl(i)
    if 0 < self._frameContentControl:GetPosY() + control:GetPosY() + control:GetSizeY() then
      return i
    end
  end
  return -1
end
function pearlShop:getFirstProductControlPosY()
  return self._frameContentControl:GetPosY() + self:getProductControl(0):GetPosY()
end
function pearlShop:getProductControl(index)
  if index >= 0 and index < self._productControlListSize then
    return self._productControlList[index]
  end
  _PA_LOG("cylee", "pearlShop:getProductControl() invalid index:" .. tostring(index))
end
function pearlShop:update()
  _PA_LOG("cylee", "pearlShop:update()")
  local infoListSize = getIngameCashMall():getCashProductFilterListCount()
  _PA_LOG("cylee", "pearlShop:update() infoListSize:" .. infoListSize)
  local pos = self._startingProductControlPosY
  local showDescFlag = false
  for i = 0, self._productControlListSize - 1 do
    local control = self:getProductControl(i)
    control:SetPosY(pos)
    local info = self:getProductInfoByControlIndex(i)
    control:SetShow(info ~= nil)
    if info then
      self:updateControl(control, info)
      if info:getNoRaw() == self._showingProductNo then
        self:showProductListItemDesc(control)
        showDescFlag = true
      else
        self:hideProductListItemDesc(control)
      end
    end
    pos = pos + control:GetSizeY()
  end
  if not showDescFlag and 0 < self._showingProductNo then
    self._showingProductNo = 0
    local gapSize = self._productControlBigSize - self._productControlSmallSize
    self:addFrameContentSize(-gapSize)
  end
  self:setDirty(false)
end
function pearlShop:updateControl(control, info)
  local nameControl = UI.getChildControl(control, "StaticText_ProductName")
  nameControl:SetText(info:getDisplayName())
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
  local priceControl = UI.getChildControl(control, "StaticText_ProductPrice")
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
    discountControl:SetText(makeDotMoney(info:getPrice()))
    discountControl:SetShow(true)
  else
    discountControl:SetShow(false)
    discountDescControl:SetShow(false)
  end
  priceControl:SetText(makeDotMoney(info:getOriginalPrice()))
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PearlShopInit")
