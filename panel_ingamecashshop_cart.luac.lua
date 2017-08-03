-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_ingamecashshop_cart.luac 

-- params : ...
-- function num : 0
local UI_PreviewType = CppEnums.InGameCashShopPreviewType
local IM = CppEnums.EProcessorInputMode
local UI_CCC = CppEnums.CashProductCategory
Panel_IngameCashShop_NewCart:SetShow(false)
Panel_IngameCashShop_NewCart:SetIgnore(false)
local CashShopCart = {_makeSlotCount = 20, _maxShowSlotCount = 7, _currentSlotIndex = 0, _remainSizeY = 0, _activeEditBoxUI = nil, _activeEditBoxRow = -1, 
_defaultUI = {}
, 
_uiData = {}
, _button_CartClear = (UI.getChildControl)(Panel_IngameCashShop_NewCart, "Button_CartClear"), _button_BuyAll = (UI.getChildControl)(Panel_IngameCashShop_NewCart, "Button_CartBuyAll"), _button_CartClose = (UI.getChildControl)(Panel_IngameCashShop_NewCart, "Button_CartClose"), _scroll = (UI.getChildControl)(Panel_IngameCashShop_NewCart, "Scroll_IngameCashCart"), _static_PearlBox = (UI.getChildControl)(Panel_IngameCashShop_NewCart, "Static_PearlBox"), _static_NowPearlIcon = (UI.getChildControl)(Panel_IngameCashShop_NewCart, "Static_NowPearlIcon"), _staticText_TotalCount = (UI.getChildControl)(Panel_IngameCashShop_NewCart, "StaticText_TotalCount"), _staticText_NowPearlCount = (UI.getChildControl)(Panel_IngameCashShop_NewCart, "StaticText_NowPearlCount")}
CashShopCart._scrollBTN = (UI.getChildControl)(CashShopCart._scroll, "Scroll_CtrlButton")
local contry = {kr = 0, jp = 1, ru = 2, kr2 = 3}
local cashIconType = {cash = 0, pearl = 1, mileage = 2, silver = 3}
local convertDateStr = function(ttime64)
  -- function num : 0_0
  local paTime = PATime(ttime64)
  return tostring(paTime:GetYear()) .. "." .. tostring(paTime:GetMonth()) .. "." .. tostring(paTime:GetDay())
end

local getSumPrice = function()
  -- function num : 0_1
  local cartListCount = (getIngameCashMall()):getCartListCount()
  local sumPrice = toInt64(0, 0)
  for index = 0, cartListCount - 1 do
    local selectItem = (getIngameCashMall()):getCartItemByIndex(index)
    selectItem:applySelectedItem()
    sumPrice = sumPrice + selectItem:getSelectedItemPrice() * toInt64(0, selectItem:getCount())
  end
  return sumPrice
end

local disCountSetUse = false
InGameShop_GameTypeCheck = function()
  -- function num : 0_2 , upvalues : disCountSetUse
  if isGameTypeEnglish() then
    disCountSetUse = true
  else
    disCountSetUse = false
  end
end

local changePearIcon = function(pearIconUI, cashProductSSW)
  -- function num : 0_3 , upvalues : contry, UI_CCC, cashIconType
  local serviceContry, iconType = nil, nil
  local categoryIdx = cashProductSSW:getMainCategory()
  local isEnableSilver = cashProductSSW:isMoneyPrice()
  local eCountryType = CppEnums.CountryType
  do
    local gameServiceType = getGameServiceType()
    if eCountryType.NONE == gameServiceType or eCountryType.DEV == gameServiceType or eCountryType.KOR_ALPHA == gameServiceType or eCountryType.KOR_REAL == gameServiceType or eCountryType.KOR_TEST == gameServiceType then
      serviceContry = contry.kr
    else
      if eCountryType.JPN_ALPHA == gameServiceType or eCountryType.JPN_REAL == gameServiceType then
        serviceContry = contry.jp
      else
        if eCountryType.RUS_ALPHA == gameServiceType or eCountryType.RUS_REAL == gameServiceType then
          serviceContry = contry.ru
        else
          if eCountryType.KR2_ALPHA == gameServiceType or eCountryType.KR2_REAL == gameServiceType then
            serviceContry = contry.kr2
          else
            serviceContry = contry.kr
          end
        end
      end
    end
    if UI_CCC.eCashProductCategory_Pearl == categoryIdx then
      iconType = cashIconType.cash
    else
      if UI_CCC.eCashProductCategory_Mileage == categoryIdx then
        iconType = cashIconType.mileage
      else
        local isRussia = isGameTypeRussia() or eCountryType.DEV == gameServiceType
        local isFixedServer = isServerFixedCharge()
        if isRussia == true and isFixedServer == true then
          if isEnableSilver then
            iconType = cashIconType.silver
          else
            iconType = cashIconType.pearl
          end
        else
          iconType = cashIconType.pearl
        end
      end
    end
    cashIcon_changeTextureForList(pearIconUI, serviceContry, iconType)
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

local updateUI = function(uiGroup, selectItem, uiSlot)
  -- function num : 0_4 , upvalues : disCountSetUse, changePearIcon
  local cashProductSSW = selectItem:getCashProductStaticStatus()
  local count = selectItem:getCount()
  selectItem:applySelectedItem()
  local iconUI = uiGroup[2]
  local prductNameUI = uiGroup[3]
  local discountMsgUI = uiGroup[4]
  local priceUI = uiGroup[5]
  local pearIconUI = uiGroup[6]
  local countEditUI = uiGroup[7]
  prductNameUI:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  discountMsgUI:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  iconUI:ChangeTextureInfoName("icon/" .. cashProductSSW:getIconPath())
  iconUI:SetIgnore(false)
  iconUI:addInputEvent("Mouse_On", "InGameShop_CartProductShowToolTip( " .. cashProductSSW:getNoRaw() .. ", " .. uiSlot .. " )")
  iconUI:addInputEvent("Mouse_Out", "FGlobal_CashShop_GoodsTooltipInfo_Close()")
  prductNameUI:SetText(cashProductSSW:getName())
  local originalPrice = cashProductSSW:getOriginalPrice() * toInt64(0, count)
  local price = selectItem:getSelectedItemPrice() * toInt64(0, count)
  if selectItem:isDiscountApplied() then
    local endDiscountTimeValue = PATime((cashProductSSW:getEndDiscountTime()):get_s64())
    local endDiscountTime = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTTIME", "GetYear", tostring(endDiscountTimeValue:GetYear()), "GetMonth", tostring(endDiscountTimeValue:GetMonth()), "GetDay", tostring(endDiscountTimeValue:GetDay())) .. " " .. (string.format)("%.02d", endDiscountTimeValue:GetHour()) .. ":" .. (string.format)("%.02d", endDiscountTimeValue:GetMinute())
    if disCountSetUse then
      endDiscountTime = convertStringFromDatetime(cashProductSSW:getRemainDiscountTime())
    else
      endDiscountTime = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTTIME", "GetYear", tostring(endDiscountTimeValue:GetYear()), "GetMonth", tostring(endDiscountTimeValue:GetMonth()), "GetDay", tostring(endDiscountTimeValue:GetDay())) .. " " .. (string.format)("%.02d", endDiscountTimeValue:GetHour()) .. ":" .. (string.format)("%.02d", endDiscountTimeValue:GetMinute())
    end
    discountMsgUI:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_DISCOUNT", "endDiscountTime", endDiscountTime))
    discountMsgUI:SetShow(true)
    priceUI:SetText(makeDotMoney(originalPrice) .. PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_ARROW") .. makeDotMoney(price))
  else
    do
      discountMsgUI:SetText(cashProductSSW:getDescription())
      discountMsgUI:SetShow(true)
      priceUI:SetText(makeDotMoney(price))
      changePearIcon(pearIconUI, cashProductSSW)
      countEditUI:SetText(tostring(count))
    end
  end
end

CashShopCart.initialize = function(self, gapY)
  -- function num : 0_5 , upvalues : CashShopCart
  -- DECOMPILER ERROR at PC107: Confused about usage of register: R2 in 'UnsetPending'

  CashShopCart._defaultUI = {
[0] = {_name = "TemplateCart_Static_GoodsBG", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, _owner = nil, _lDownCallFunc = function(self, index)
    -- function num : 0_5_0
  end
}
, 
[1] = {_name = "TemplateCart_Static_SlotBG", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, _owner = 0}
, 
[2] = {_name = "TemplateCart_Static_Slot", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, _owner = 0}
, 
[3] = {_name = "TemplateCart_StaticText_ItemName", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, _owner = 0}
, 
[4] = {_name = "TemplateCart_StaticText_DiscountPeriod", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, _owner = 0}
, 
[5] = {_name = "TemplateCart_StaticText_ItemPrice", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, _owner = 0}
, 
[6] = {_name = "TemplateCart_Static_PearlIcon", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, _owner = 0}
, 
[7] = {_name = "TemplateCart_EditProductCount", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_EDIT, _owner = 0, _lDownCallFunc = function(self, index)
    -- function num : 0_5_1 , upvalues : CashShopCart
    CashShopCart:OnEditInputMode(index)
  end
, _lUpCallFunc = function(self, index)
    -- function num : 0_5_2 , upvalues : CashShopCart
    CashShopCart:OnEditInputMode(index)
  end
}
, 
[8] = {_name = "TemplateCart_Button_CountPlus", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, _owner = 0, _lUpCallFunc = function(self, index)
    -- function num : 0_5_3 , upvalues : CashShopCart
    CashShopCart:countUp(index)
  end
}
, 
[9] = {_name = "TemplateCart_Button_CountMinus", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, _owner = 0, _lUpCallFunc = function(self, index)
    -- function num : 0_5_4 , upvalues : CashShopCart
    CashShopCart:countDown(index)
  end
}
, 
[10] = {_name = "TemplateCart_Button_DeleteItem", _type = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, _owner = 0, _lUpCallFunc = function(self, index)
    -- function num : 0_5_5 , upvalues : CashShopCart
    CashShopCart:countErase(index)
  end
}
}
  for key,value in pairs(self._defaultUI) do
    value._ui = (UI.getChildControl)(Panel_IngameCashShop_NewCart, value._name)
    if value._owner ~= nil then
      value._diffY = (value._ui):GetPosY() - (((self._defaultUI)[value._owner])._ui):GetPosY()
    else
      value._diffY = 0
    end
  end
  local offset = 0
  for index = 0, self._makeSlotCount - 1 do
    -- DECOMPILER ERROR at PC144: Confused about usage of register: R7 in 'UnsetPending'

    (self._uiData)[index] = {}
    local uiGroup = (self._uiData)[index]
    for key,value in pairs(self._defaultUI) do
      local original = value._ui
      local ownerControl = Panel_IngameCashShop_NewCart
      if value._owner ~= nil then
        ownerControl = uiGroup[value._owner]
      end
      local copyControl = (UI.createControl)(value._type, ownerControl, value._name .. "_" .. tostring(index))
      CopyBaseProperty(original, copyControl)
      copyControl:SetShow(true)
      copyControl:SetIgnore(false)
      if value._owner ~= nil then
        copyControl:SetPosY(value._diffY)
      else
        copyControl:SetPosX(0)
        copyControl:SetPosY(offset)
        offset = offset + gapY
      end
      if key == 8 or key == 9 then
        copyControl:SetAutoDisableTime(0)
      end
      copyControl:SetIgnore((value._owner ~= nil and value._lDownCallFunc == nil and value._lUpCallFunc == nil) or key == 7)
      copyControl:addInputEvent("Mouse_UpScroll", "FGlobal_Scroll_IngameCashShop_NewCart( -1 )")
      copyControl:addInputEvent("Mouse_DownScroll", "FGlobal_Scroll_IngameCashShop_NewCart(  1 )")
      copyControl:addInputEvent("Mouse_LUp", "FGlobal_LUp_IngameCashShop_NewCart(" .. tostring(key) .. "," .. tostring(index) .. ")")
      uiGroup[key] = copyControl
    end
  end
  Panel_IngameCashShop_NewCart:SetChildIndex(self._scroll, 9999)
  Panel_IngameCashShop_NewCart:addInputEvent("Mouse_UpScroll", "FGlobal_Scroll_IngameCashShop_NewCart( -1 )")
  Panel_IngameCashShop_NewCart:addInputEvent("Mouse_DownScroll", "FGlobal_Scroll_IngameCashShop_NewCart(  1 )")
  for key,value in pairs(self._defaultUI) do
    (value._ui):SetShow(false)
  end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

CashShopCart.registEventHandler = function(self)
  -- function num : 0_6
  (self._button_BuyAll):addInputEvent("Mouse_LUp", "InGameShop_CartBuyAll()")
  ;
  (self._button_CartClear):addInputEvent("Mouse_LUp", "InGameShop_CartClear()")
  ;
  (self._button_CartClose):addInputEvent("Mouse_LUp", "FGlobal_Close_IngameCashShop_NewCart()")
end

CashShopCart.SetPosition = function(self, posX, posY, sizeY, gapY)
  -- function num : 0_7
  Panel_IngameCashShop_NewCart:SetPosX(posX)
  Panel_IngameCashShop_NewCart:SetPosY(posY)
  Panel_IngameCashShop_NewCart:SetSize(Panel_IngameCashShop_NewCart:GetSizeX(), sizeY)
  ;
  (self._button_CartClear):ComputePos()
  ;
  (self._button_BuyAll):ComputePos()
  ;
  (self._button_CartClose):ComputePos()
  ;
  (self._static_PearlBox):ComputePos()
  ;
  (self._static_NowPearlIcon):ComputePos()
  ;
  (self._staticText_TotalCount):ComputePos()
  ;
  (self._staticText_NowPearlCount):ComputePos()
  self._remainSizeY = sizeY - (((self._static_PearlBox):GetSpanSize()).y + (self._static_PearlBox):GetSizeY())
end

CashShopCart.SetScroll = function(self)
  -- function num : 0_8
  (self._scroll):SetSize((self._scroll):GetSizeX(), self._remainSizeY)
  local cartListCount = (getIngameCashMall()):getCartListCount()
  local scrollSizeY = (self._scroll):GetSizeY()
  local pagePercent = self._maxShowSlotCount / cartListCount * 100
  local btn_scrollSizeY = scrollSizeY / 100 * pagePercent
  if btn_scrollSizeY < 10 then
    btn_scrollSizeY = 10
  end
  if scrollSizeY <= btn_scrollSizeY then
    btn_scrollSizeY = scrollSizeY * 0.99
  end
  ;
  (self._scrollBTN):SetSize((self._scrollBTN):GetSizeX(), btn_scrollSizeY)
  if self._maxShowSlotCount < cartListCount then
    (self._scroll):SetShow(true)
  else
    ;
    (self._scroll):SetShow(false)
  end
  ;
  (self._scroll):SetInterval(cartListCount - self._maxShowSlotCount)
  ;
  (self._scroll):SetControlTop()
end

CashShopCart.open = function(self)
  -- function num : 0_9
  local scrSizeY = getScreenSizeY()
  local remainingSizeY = self._remainSizeY
  local possiableList = (math.floor)(remainingSizeY / ((((self._uiData)[0])[0]):GetSizeY() + ((((self._uiData)[1])[0]):GetPosY() - (((self._uiData)[0])[0]):GetPosY() - (((self._uiData)[1])[0]):GetSizeY())))
  self._maxShowSlotCount = possiableList
  Panel_IngameCashShop_NewCart:SetShow(true, false)
  self:SetScroll()
  self:fillSlots()
end

CashShopCart.close = function(self)
  -- function num : 0_10
  Panel_IngameCashShop_NewCart:SetShow(false, false)
end

CashShopCart.fillSlots = function(self)
  -- function num : 0_11 , upvalues : updateUI, contry, cashIconType, getSumPrice
  local cartListCount = (getIngameCashMall()):getCartListCount()
  local uiSlot = 0
  for index = self._currentSlotIndex, cartListCount - 1 do
    local selectItem = (getIngameCashMall()):getCartItemByIndex(index)
    if selectItem == nil then
      break
    end
    local uiGroup = (self._uiData)[uiSlot]
    updateUI(uiGroup, selectItem, uiSlot)
    if uiSlot == self._activeEditBoxRow and _activeEditBoxUI ~= nil then
      FGlobal_EscapeEditBox_IngameCashShop_NewCart(false)
    end
    uiSlot = uiSlot + 1
    if self._maxShowSlotCount <= uiSlot then
      break
    end
  end
  do
    for index = 0, self._makeSlotCount - 1 do
      local uiGroup = (self._uiData)[index]
      for key,value in pairs(uiGroup) do
        if index >= uiSlot then
          do
            value:SetShow(((self._defaultUI)[key])._owner == nil)
            value:SetShow(index < self._maxShowSlotCount)
            -- DECOMPILER ERROR at PC69: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC69: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    local eCountryType = CppEnums.CountryType
    local gameServiceType = getGameServiceType()
    if eCountryType.NONE == gameServiceType or eCountryType.DEV == gameServiceType or eCountryType.KOR_ALPHA == gameServiceType or eCountryType.KOR_REAL == gameServiceType or eCountryType.KOR_TEST == gameServiceType then
      serviceContry = contry.kr
    elseif eCountryType.JPN_ALPHA == gameServiceType or eCountryType.JPN_REAL == gameServiceType then
      serviceContry = contry.jp
    elseif eCountryType.RUS_ALPHA == gameServiceType or eCountryType.RUS_REAL == gameServiceType then
      serviceContry = contry.ru
    elseif eCountryType.KR2_ALPHA == gameServiceType or eCountryType.KR2_REAL == gameServiceType then
      serviceContry = contry.kr2
    else
      serviceContry = contry.kr
    end
    local isRussia = isGameTypeRussia() or eCountryType.DEV == gameServiceType
    do
      local isFixedServer = isServerFixedCharge()
      if isRussia == true and isFixedServer == true then
        if isEnableSilver then
          iconType = cashIconType.silver
        else
          iconType = cashIconType.pearl
        end
      else
        iconType = cashIconType.pearl
      end
      cashIcon_changeTextureForList(self._static_NowPearlIcon, serviceContry, iconType)
      ;
      (self._staticText_NowPearlCount):SetText(makeDotMoney(getSumPrice()))
      -- DECOMPILER ERROR: 18 unprocessed JMP targets
    end
  end
end

CashShopCart.pushCart = function(self, productNoRaw, count)
  -- function num : 0_12 , upvalues : CashShopCart
  local isSuccess = (getIngameCashMall()):pushProductInCart(productNoRaw, count)
  if isSuccess == false then
    return 
  end
  if Panel_IngameCashShop_NewCart:IsShow() == false then
    return 
  end
  CashShopCart:fillSlots()
end

CashShopCart.setCart = function(self, productNoRaw, count)
  -- function num : 0_13 , upvalues : CashShopCart
  local isSuccess = (getIngameCashMall()):setProductInCart(productNoRaw, count)
  if isSuccess == false then
    return 
  end
  if Panel_IngameCashShop_NewCart:IsShow() == false then
    return 
  end
  CashShopCart:fillSlots()
end

CashShopCart.Scrolling = function(self, value)
  -- function num : 0_14 , upvalues : CashShopCart
  (self._scroll):SetCtrlPosByInterval(value)
  local cartListCount = (getIngameCashMall()):getCartListCount()
  if cartListCount < self._maxShowSlotCount then
    self._currentSlotIndex = 0
  else
    self._currentSlotIndex = self._currentSlotIndex + value
    if self._currentSlotIndex < 0 then
      self._currentSlotIndex = 0
    else
      if cartListCount <= self._currentSlotIndex + self._maxShowSlotCount then
        self._currentSlotIndex = cartListCount - self._maxShowSlotCount
      end
    end
  end
  if Panel_IngameCashShop_NewCart:IsShow() == false then
    return 
  end
  CashShopCart:fillSlots()
  InGameShop_UpdateCartButton()
end

CashShopCart.countUp = function(self, index)
  -- function num : 0_15 , upvalues : CashShopCart
  local selectedItem = (getIngameCashMall()):getCartItemByIndex(self._currentSlotIndex + index)
  if selectedItem == nil then
    return 
  end
  local prodcutNoRaw = (selectedItem:getCashProductStaticStatus()):getNoRaw()
  ;
  (getIngameCashMall()):pushProductInCart(prodcutNoRaw, 1)
  if Panel_IngameCashShop_NewCart:IsShow() == false then
    return 
  end
  CashShopCart:Scrolling(0)
end

CashShopCart.countDown = function(self, index)
  -- function num : 0_16 , upvalues : CashShopCart
  local selectedItem = (getIngameCashMall()):getCartItemByIndex(self._currentSlotIndex + index)
  if selectedItem == nil then
    return 
  end
  if selectedItem:getCount() - 1 <= 0 then
    return 
  end
  local prodcutNoRaw = (selectedItem:getCashProductStaticStatus()):getNoRaw()
  ;
  (getIngameCashMall()):popProductInCart(prodcutNoRaw, 1)
  if Panel_IngameCashShop_NewCart:IsShow() == false then
    return 
  end
  CashShopCart:Scrolling(0)
end

CashShopCart.countErase = function(self, index)
  -- function num : 0_17 , upvalues : CashShopCart
  local selectedItem = (getIngameCashMall()):getCartItemByIndex(self._currentSlotIndex + index)
  if selectedItem == nil then
    return 
  end
  local prodcutNoRaw = (selectedItem:getCashProductStaticStatus()):getNoRaw()
  ;
  (getIngameCashMall()):popProductInCartAllCount(prodcutNoRaw)
  if Panel_IngameCashShop_NewCart:IsShow() == false then
    return 
  end
  CashShopCart:fillSlots()
  CashShopCart:Scrolling(0)
end

CashShopCart.OnEditInputMode = function(self, index)
  -- function num : 0_18 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  self._activeEditBoxUI = ((self._uiData)[index])[7]
  SetFocusEdit(self._activeEditBoxUI)
  ;
  (self._activeEditBoxUI):SetEditText("")
  self._activeEditBoxRow = index
end

CashShopCart.OutEditInputMode = function(self, isOkay)
  -- function num : 0_19 , upvalues : IM, updateUI
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  local selectItem = (getIngameCashMall()):getCartItemByIndex(self._currentSlotIndex + self._activeEditBoxRow)
  do
    if isOkay then
      local productNoRaw = (selectItem:getCashProductStaticStatus()):getNoRaw()
      self:setCart(productNoRaw, tonumber((self._activeEditBoxUI):GetEditText()))
    end
    if self._activeEditBoxUI == nil or self._activeEditBoxRow < 0 then
      return 
    end
    ;
    (self._activeEditBoxUI):SetEditText("")
    local uiGroup = (self._uiData)[self._activeEditBoxRow]
    self._activeEditBoxUI = nil
    self._activeEditBoxRow = -1
    ClearFocusEdit(nil)
    updateUI(uiGroup, selectItem, self._activeEditBoxRow)
  end
end

InGameShop_CartProductShowToolTip = function(NoRaw, uiSlot)
  -- function num : 0_20 , upvalues : CashShopCart
  local self = CashShopCart
  local icon = ((self._uiData)[uiSlot])[2]
  FGlobal_CashShop_GoodsTooltipInfo_Open(NoRaw, icon)
end

InGameShop_CartBuyAll = function()
  -- function num : 0_21
  FGlobal_IngameCashShop_MakePaymentsFromCart_Open()
end

InGameShop_CartClear = function()
  -- function num : 0_22 , upvalues : CashShopCart
  (getIngameCashMall()):clearCart()
  CashShopCart:fillSlots()
  CashShopCart:Scrolling(0)
end

FGlobal_Open_IngameCashShop_NewCart = function()
  -- function num : 0_23 , upvalues : CashShopCart
  CashShopCart:open()
end

FGlobal_Close_IngameCashShop_NewCart = function()
  -- function num : 0_24 , upvalues : CashShopCart
  CashShopCart:close()
  FGlobal_EscapeEditBox_IngameCashShop_NewCart(false)
end

FGlobal_IsShow_IngameCashShop_NewCart = function()
  -- function num : 0_25
  return Panel_IngameCashShop_NewCart:IsShow()
end

FGlobal_Update_IngameCashShop_NewCart = function()
  -- function num : 0_26 , upvalues : CashShopCart
  if Panel_IngameCashShop_NewCart:IsShow() == false then
    return 
  end
  CashShopCart:Scrolling(0)
end

FGlobal_PushCart_IngameCashShop_NewCart = function(productNoRaw, count)
  -- function num : 0_27 , upvalues : CashShopCart
  CashShopCart:pushCart(productNoRaw, count)
  InGameShop_UpdateCartButton()
  FGlobal_Update_IngameCashShop_CartEffect()
  FGlobal_Update_IngameCashShop_NewCart()
end

FGlobal_Scroll_IngameCashShop_NewCart = function(value)
  -- function num : 0_28 , upvalues : CashShopCart
  if Panel_IngameCashShop_NewCart:IsShow() == false then
    return 
  end
  CashShopCart:Scrolling(value)
end

FGlobal_LDown_IngameCashShop_NewCart = function(uicategoryIndex, rowIndex)
  -- function num : 0_29 , upvalues : CashShopCart
  if ((CashShopCart._defaultUI)[uicategoryIndex])._lDownCallFunc ~= nil then
    ((CashShopCart._defaultUI)[uicategoryIndex]):_lDownCallFunc(rowIndex)
  end
end

FGlobal_LUp_IngameCashShop_NewCart = function(uicategoryIndex, rowIndex)
  -- function num : 0_30 , upvalues : CashShopCart
  if ((CashShopCart._defaultUI)[uicategoryIndex])._lUpCallFunc ~= nil then
    ((CashShopCart._defaultUI)[uicategoryIndex]):_lUpCallFunc(rowIndex)
  end
end

FGlobal_CheckEditBox_IngameCashShop_NewCart = function(uiEditBox)
  -- function num : 0_31 , upvalues : CashShopCart
  do return uiEditBox ~= nil and CashShopCart._activeEditBoxUI ~= nil and uiEditBox:GetKey() == (CashShopCart._activeEditBoxUI):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_EscapeEditBox_IngameCashShop_NewCart = function(isOkay)
  -- function num : 0_32 , upvalues : CashShopCart
  CashShopCart:OutEditInputMode(isOkay)
  ClearFocusEdit()
end

FGlobal_Init_IngameCashShop_NewCart = function(gapY)
  -- function num : 0_33 , upvalues : CashShopCart
  CashShopCart:initialize(gapY)
  registerEvent("FromClient_NotifyCompleteBuyProduct", "FromClient_NotifyCompleteBuyProduct")
end

FGlobal_InitPos_IngameCashShop_NewCart = function(startPosX, startPosY, sizeY, gapY)
  -- function num : 0_34 , upvalues : CashShopCart
  CashShopCart:SetPosition(startPosX, startPosY - gapY, sizeY + gapY, gapY)
end

FromClient_NotifyCompleteBuyProduct = function(productNoRaw, isGift, toCharacterName, buyItemReqTrType)
  -- function num : 0_35
  FGlobal_Update_IngameCashShop_NewCart()
  InGameShop_UpdateCartButton()
  do
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
    if cashProduct ~= nil then
    end
  end
end

local cumulatedTime = 0
IngameCashShop_NewCartDiscount = function(deltaTime)
  -- function num : 0_36 , upvalues : CashShopCart, disCountSetUse, cumulatedTime, changePearIcon
  local self = CashShopCart
  if disCountSetUse then
    cumulatedTime = cumulatedTime + deltaTime
    if cumulatedTime > 1 then
      cumulatedTime = 0
      local cartListCount = (getIngameCashMall()):getCartListCount()
      local uiSlot = 0
      for index = self._currentSlotIndex, cartListCount - 1 do
        local selectItem = (getIngameCashMall()):getCartItemByIndex(index)
        if selectItem == nil then
          break
        end
        local uiGroup = (self._uiData)[uiSlot]
        local cashProductSSW = selectItem:getCashProductStaticStatus()
        selectItem:applySelectedItem()
        local discountMsgUI = uiGroup[4]
        local pearIconUI = uiGroup[6]
        if selectItem:isDiscountApplied() then
          local remainTime = convertStringFromDatetime(cashProductSSW:getRemainDiscountTime())
          discountMsgUI:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_DISCOUNT", "endDiscountTime", remainTime))
          discountMsgUI:SetShow(true)
        else
          do
            do
              discountMsgUI:SetText(cashProductSSW:getDescription())
              discountMsgUI:SetShow(true)
              changePearIcon(pearIconUI, cashProductSSW)
              uiSlot = uiSlot + 1
              if self._maxShowSlotCount <= uiSlot then
                break
              end
              -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

CashShopCart:registEventHandler()
Panel_IngameCashShop_NewCart:RegisterUpdateFunc("IngameCashShop_NewCartDiscount")

