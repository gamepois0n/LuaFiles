local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_EventCart = CppEnums.EventCartDiscountType
Panel_IngameCashShop_EventCart:SetShow(false)
local isEventCartOpen = ToClient_IsContentsGroupOpen("379")
function FGlobal_IngameCashShopEventCart_IsContentsOpen()
  return isEventCartOpen
end
local EventCart = {
  _list2 = UI.getChildControl(Panel_IngameCashShop_EventCart, "List2_ItemList"),
  btn_X = UI.getChildControl(Panel_IngameCashShop_EventCart, "Button_Win_Close"),
  btn_Confirm = UI.getChildControl(Panel_IngameCashShop_EventCart, "Button_Buy"),
  btn_Cancle = UI.getChildControl(Panel_IngameCashShop_EventCart, "Button_ResetAll"),
  point_Tooltip = UI.getChildControl(Panel_IngameCashShop_EventCart, "StaticText_TooltipBg"),
  point_Btn_Question = UI.getChildControl(Panel_IngameCashShop_EventCart, "Button_Question"),
  point_Caution = UI.getChildControl(Panel_IngameCashShop_EventCart, "Static_DescBg"),
  BottomBg = UI.getChildControl(Panel_IngameCashShop_EventCart, "Static_BottomBg"),
  maxSaleTxt = nil,
  maxSaleTxt = nil,
  nextSaleTxt = nil,
  disCountPriveTxt = nil,
  beforePriceTxt = nil,
  currentDiscountValue = nil,
  DropArrow = nil,
  itemCount = nil,
  cautionTxt = nil,
  disCountValue = 0,
  AnimationBg = nil,
  Ruler = nil,
  point_TooltipList = Array.new(),
  eventCartList = {},
  eventKey = 0,
  eventDiscountType = UI_EventCart.eEventCartDiscountType_Count,
  isTooltipSet = false,
  maxGage = 0,
  oneMakingGage = 0,
  gageList = Array.new(),
  beforPrice = 0,
  isCalculate = false,
  currentColor = 0
}
local maxPpointCount = 10
local startGagePosition = 77
local endGagePosition = 748
local gageSize = endGagePosition - startGagePosition
local ChangeArrow = {
  [0] = -268,
  -469
}
local arrowTexture = {
  [0] = {
    270,
    149,
    403,
    269
  },
  {
    136,
    149,
    269,
    269
  },
  {
    2,
    149,
    135,
    269
  }
}
local function arrow_changeTexture(arrow, count)
  local self = EventCart
  if self.currentColor == count then
    return
  else
    self.currentColor = count
  end
  local control = arrow
  control:ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/cashshop_sale_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, arrowTexture[count][1], arrowTexture[count][2], arrowTexture[count][3], arrowTexture[count][4])
  control:getBaseTexture():setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end
function IngameCashShopEventCart_Init()
  local self = EventCart
  Panel_IngameCashShop_EventCart:RegisterUpdateFunc("IngameCashShopEventCartUpdatePerFrame")
  self.btn_Confirm:addInputEvent("Mouse_LUp", "IngameCashShopEventCart_Buy( )")
  self.btn_Confirm:SetShow(true)
  self.btn_Cancle:addInputEvent("Mouse_LUp", "IngameCashShopEventCart_Clear( )")
  self.btn_Cancle:SetShow(true)
  self._list2:changeAnimationSpeed(10)
  self._list2:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "IngameCashShopEventCart_ListUpdate")
  self._list2:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._list2:getElementManager():clearKey()
  self.btn_X:addInputEvent("Mouse_LUp", "IngameCashShopEventCart_Close( )")
  self.btn_X:SetShow(true)
  self.point_Btn_Question:addInputEvent("Mouse_On", "PaGlobal_Event_Point_Tooltip(true)")
  self.point_Btn_Question:addInputEvent("Mouse_Out", "PaGlobal_Event_Point_Tooltip(false)")
  self.maxSaleTxt = UI.createAndCopyBasePropertyControl(self.BottomBg, "StaticText_MaxSale", self.BottomBg, "StaticText_MaxSale")
  self.nextSaleTxt = UI.createAndCopyBasePropertyControl(self.BottomBg, "StaticText_SaleDesc", self.BottomBg, "StaticText_SaleDesc")
  self.disCountPriveTxt = UI.createAndCopyBasePropertyControl(self.BottomBg, "StaticText_DisCountPriveValue", self.BottomBg, "StaticText_DisCountPriveValue")
  self.beforePriceTxt = UI.createAndCopyBasePropertyControl(self.BottomBg, "StaticText_BeforePriceValue", self.BottomBg, "StaticText_BeforePriceValue")
  self.currentDiscountValue = UI.createAndCopyBasePropertyControl(self.BottomBg, "StaticText_CurrentDiscountValue", self.BottomBg, "StaticText_CurrentDiscountValue")
  self.DropArrow = UI.createAndCopyBasePropertyControl(self.BottomBg, "Static_DropArrow", self.BottomBg, "Static_DropArrow")
  arrow_changeTexture(self.DropArrow, 0)
  self.itemCount = UI.createAndCopyBasePropertyControl(self.BottomBg, "StaticText_Title", self.BottomBg, "StaticText_Title")
  self.AnimationBg = UI.createAndCopyBasePropertyControl(self.BottomBg, "Static_AnimationBg", self.BottomBg, "Static_AnimationBg")
  self.Ruler = UI.createAndCopyBasePropertyControl(self.AnimationBg, "StaticText_Ruler", self.AnimationBg, "StaticText_Ruler")
  self.AnimationBg:SetRectClipOnArea(float2(0, 0), float2(200, 22))
  self.Ruler:SetPosX(0)
  self.gageList = Array.new()
  for ii = 0, maxPpointCount do
    local StaticText_Value = {}
    StaticText_Value = UI.createAndCopyBasePropertyControl(self.Ruler, "StaticText_Value_" .. ii, self.Ruler, "StaticText_Value_" .. ii)
    StaticText_Value:SetShow(true)
    self.gageList[ii] = StaticText_Value
  end
  self.point_Tooltip:SetShow(false)
  self.cautionTxt = UI.createAndCopyBasePropertyControl(self.point_Caution, "StaticText_Desc", self.point_Caution, "StaticText_Desc")
  self.cautionTxt:SetTextMode(UI_TM.eTextMode_AutoWrap)
  self.cautionTxt:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EVENTCART_MAINCAUTION"))
  local prevSizeY = self.point_Caution:GetSizeY()
  local textSizeY = self.cautionTxt:GetTextSizeY()
  self.point_Caution:SetSize(self.point_Caution:GetSizeX(), textSizeY + 15)
  if prevSizeY < textSizeY then
    Panel_IngameCashShop_EventCart:SetSize(Panel_IngameCashShop_EventCart:GetSizeX(), Panel_IngameCashShop_EventCart:GetSizeY() + (textSizeY + 15 - prevSizeY))
    self.cautionTxt:ComputePos()
    self.btn_Confirm:ComputePos()
    self.btn_Cancle:ComputePos()
  end
end
function IngameCashShopEventCartUpdatePerFrame(deltaTime)
  if false == Panel_IngameCashShop_EventCart:IsShow() then
    return
  end
  local self = EventCart
  if true == self.isCalculate then
    if self.maxGage < self.beforPrice then
      self.beforPrice = self.maxGage
    end
    local nextPosition = self.beforPrice * self.oneMakingGage * -1
    local currentPosition = self.Ruler:GetPosX()
    local calculatePosition
    if nextPosition < currentPosition then
      local movePoint = (currentPosition - nextPosition) * deltaTime
      if movePoint < 1 then
        movePoint = 1
      end
      calculatePosition = currentPosition - movePoint
      if nextPosition >= calculatePosition then
        calculatePosition = nextPosition
        self.isCalculate = false
      end
      if calculatePosition <= ChangeArrow[1] then
        arrow_changeTexture(self.DropArrow, 2)
      elseif calculatePosition <= ChangeArrow[0] then
        arrow_changeTexture(self.DropArrow, 1)
      end
    else
      local movePoint = (nextPosition - currentPosition) * deltaTime
      if movePoint < 1 then
        movePoint = 1
      end
      calculatePosition = currentPosition + movePoint
      if nextPosition <= calculatePosition then
        calculatePosition = nextPosition
        self.isCalculate = false
      end
      if calculatePosition > ChangeArrow[0] then
        arrow_changeTexture(self.DropArrow, 0)
      elseif calculatePosition > ChangeArrow[1] then
        arrow_changeTexture(self.DropArrow, 1)
      end
    end
    self.Ruler:SetPosX(calculatePosition)
  end
end
function InitGageBar()
  local self = EventCart
  local eventWrapper = ToClient_GetEventCategoryStaticStatusWrapperByKeyRaw(self.eventKey)
  if nil == eventWrapper then
    return false
  end
  self.eventCartList = Array.new()
  local size = eventWrapper:getEventSize()
  self.maxGage = eventWrapper:getEventlDiscountCelling(size - 1)
  local makingSize = self.maxGage / maxPpointCount
  self.oneMakingGage = (endGagePosition - startGagePosition) / self.maxGage
  for ii = 1, maxPpointCount do
    self.gageList[ii]:SetText(makingSize * ii)
  end
  self.Ruler:SetPosX(0)
  return true
end
function ToolBgSet()
  local self = EventCart
  local eventWrapper = ToClient_GetEventCategoryStaticStatusWrapperByKeyRaw(self.eventKey)
  if nil == eventWrapper then
    return false
  end
  self.eventCartList = Array.new()
  local size = eventWrapper:getEventSize()
  self.point_Tooltip:SetSize(self.point_Tooltip:GetSizeX(), 30 + size * 25)
  for ii = 0, size - 1 do
    local eventText = {}
    eventText = UI.createAndCopyBasePropertyControl(self.point_Tooltip, "StaticText_EventDiscount", self.point_Tooltip, "StaticText_EventDiscount_" .. ii)
    if self.eventDiscountType == UI_EventCart.eEventCartDiscountType_Subtraction then
      eventText:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_EVENTCART_DISCOUNTSTEP", "pearl", tostring(eventWrapper:getEventlDiscountCelling(ii)), "discountpearl", tostring(eventWrapper:getEventlDiscountPrice(ii))))
    elseif self.eventDiscountType == UI_EventCart.eEventCartDiscountType_Rate then
      eventText:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_EVENTCART_NEXTAPPLYDISCOUNTBYRATE", "pearl", tostring(eventWrapper:getEventlDiscountCelling(ii)), "discountpearl", tostring(string.format("%.0f", eventWrapper:getEventlDiscountPrice(ii) / 10000))))
    end
    eventText:SetPosY(30 + ii * 25)
    eventText:SetShow(true)
    self.point_TooltipList[ii] = eventText
  end
  return true
end
function PaGlobal_Event_Point_Tooltip(isShow)
  local self = EventCart
  if false == self.isTooltipSet then
    self.point_Tooltip:SetShow(false)
    return
  end
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  local eventCartPosX = Panel_IngameCashShop_EventCart:GetPosX()
  local eventCartPosY = Panel_IngameCashShop_EventCart:GetPosY()
  local eventCartSizeX = Panel_IngameCashShop_EventCart:GetSizeX()
  local eventCartSizeY = Panel_IngameCashShop_EventCart:GetSizeY()
  local point_TooltipSizeX = self.point_Tooltip:GetSizeX()
  local point_TooltipSizeY = self.point_Tooltip:GetSizeY()
  local setPosX = 0 - point_TooltipSizeX
  local setPosY = 0
  if eventCartPosX - point_TooltipSizeX < 0 then
    setPosX = eventCartSizeX
  end
  if screenSizeX < eventCartPosX + eventCartSizeX then
    setPosX = 0 - point_TooltipSizeX
  end
  if eventCartPosY < 0 then
    setPosY = -1 * eventCartPosY
  end
  if screenSizeY < eventCartPosY + point_TooltipSizeY then
    setPosY = screenSizeY - (eventCartPosY + point_TooltipSizeY)
  end
  self.point_Tooltip:SetPosX(setPosX)
  self.point_Tooltip:SetPosY(setPosY)
  self.point_Tooltip:SetShow(isShow)
end
function IngameCashShopEventCart_ListUpdate(contents, key)
  local self = EventCart
  local idx = Int64toInt32(key)
  local txt_Title = UI.getChildControl(contents, "StaticText_Name")
  local txt_Price = UI.getChildControl(contents, "StaticText_PriceValue")
  local btn_Delete = UI.getChildControl(contents, "List2_Button_MemoList_RemoveMemo")
  local slot_iconBG = UI.getChildControl(contents, "Static_Slot_IconBG")
  local cashProduct
  cashProduct = getIngameCashMall():getCashProductStaticStatusByProductNoRaw(idx)
  if nil ~= cashProduct then
    txt_Title:SetShow(true)
    txt_Title:SetText(cashProduct:getName())
    txt_Price:SetShow(true)
    txt_Price:SetText(makeDotMoney(cashProduct:getOriginalPrice()))
    slot_iconBG:SetShow(true)
    local item = cashProduct:getItemByIndex(0)
    local itemCount = cashProduct:getItemCountByIndex(0)
    slot_iconBG:ChangeTextureInfoName("icon/" .. item:getIconPath())
    slot_iconBG:addInputEvent("Mouse_On", "IngameCashShopEventCart_ShowItemToolTip( true, " .. idx .. ", " .. 0 .. " )")
    slot_iconBG:addInputEvent("Mouse_Out", "IngameCashShopEventCart_ShowItemToolTip( false, " .. idx .. ", " .. 0 .. " )")
    contents:SetIgnore(false)
    contents:addInputEvent("Mouse_LUp", "IngameCashShopEventCart_Selected(" .. idx .. ")")
    btn_Delete:addInputEvent("Mouse_LUp", "IngameCashShopEventCart_Delete(" .. idx .. ")")
  end
end
function IngameCashShopEventCart_ShowItemToolTip(isShow, cashProductKeyRaw, index)
  local self = EventCart
  if true == isShow then
    local cashProduct = getIngameCashMall():getCashProductStaticStatusByProductNoRaw(cashProductKeyRaw)
    local itemWrapper = cashProduct:getItemByIndex(index)
    Panel_Tooltip_Item_Show(itemWrapper, Panel_IngameCashShop_EventCart, true)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end
function IngameCashShopEventCart_Selected(productNoRaw)
  FGlobal_CashShop_SetEquip_Update(productNoRaw)
  FGlobal_CashShop_SetEquip_SelectedItem(productNoRaw)
end
function IngameCashShopEventCart_Update(productNoRaw)
  local self = EventCart
  local cashProduct
  if Panel_IngameCashShop_EventCart:IsShow() then
    self._list2:SetShow(true)
    if nil ~= productNoRaw then
      cashProduct = getIngameCashMall():getCashProductStaticStatusByProductNoRaw(productNoRaw)
      if nil == cashProduct then
        return
      end
      local rv = getIngameCashMall():pushEventCart(productNoRaw)
      if 0 == rv then
        self._list2:getElementManager():pushKey(productNoRaw)
        IngameCashShopEventCart_UpdatePrice()
        ToClient_RequestRecommendList(productNoRaw)
      end
    end
  end
end
function IngameCashShopEventCart_Delete(productNoRaw)
  local self = EventCart
  if Panel_IngameCashShop_EventCart:IsShow() then
    local index = getIngameCashMall():popEventCart(productNoRaw)
    if -1 ~= index then
      self._list2:getElementManager():removeByIndex(index)
      IngameCashShopEventCart_UpdatePrice()
    end
  end
end
function IngameCashShopEventCart_CheckBTN(checkType)
  self._list2:SetShow(true)
  IngameCashShopEventCart_Update()
end
function IngameCashShopEventCart_Open(enventKey)
  local self = EventCart
  if not isEventCartOpen then
    return
  end
  if Panel_IngameCashShop:IsShow() then
    local eventWrapper = ToClient_GetEventCategoryStaticStatusWrapperByKeyRaw(enventKey)
    if nil == eventWrapper then
      return
    end
    local isSellinPeriod = eventWrapper:isSellinPeriod()
    local isDiscountPeriod = eventWrapper:isDiscountPeriod()
    if true == isSellinPeriod and false == isDiscountPeriod then
      return
    end
    self.eventKey = enventKey
    Panel_IngameCashShop_EventCart:SetShow(true)
    local screenSizeX = getScreenSizeX()
    local screenSizeY = getScreenSizeY()
    local positionX = screenSizeX - Panel_IngameCashShop_EventCart:GetSizeX()
    local positionY = screenSizeY / 2 - Panel_IngameCashShop_EventCart:GetSizeY() / 2
    Panel_IngameCashShop_EventCart:SetPosX(positionX)
    Panel_IngameCashShop_EventCart:SetPosY(positionY)
    self.eventDiscountType = eventWrapper:getDiscountType()
    if true == isSellinPeriod and true == isDiscountPeriod then
      self.disCountPriveTxt:SetShow(true)
      local maxSaleString
      if self.eventDiscountType == UI_EventCart.eEventCartDiscountType_Subtraction then
        maxSaleString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCART_POSSIBLEMAXDISCOUNT", "maxpearl", tostring(eventWrapper:getEventlDiscountPrice(eventWrapper:getEventSize() - 1)))
      elseif self.eventDiscountType == UI_EventCart.eEventCartDiscountType_Rate then
        maxSaleString = ""
      end
      self.maxSaleTxt:SetText(maxSaleString)
    else
      self.maxSaleTxt:SetShow(false)
    end
    IngameCashShopEventCart_UpdatePrice()
    IngameCashShopEventCart_Update(productNoRaw, productCount)
    self.isTooltipSet = ToolBgSet()
    InitGageBar()
    self.disCountValue = 0
  end
end
function FGlobal_IngameCashShop_EventCart_DiscountValue()
  return EventCart.disCountValue
end
function IngameCashShopEventCart_Close()
  local self = EventCart
  if Panel_IngameCashShop_EventCart:IsShow() then
    IngameCashShopEventCart_Clear()
    Panel_IngameCashShop_EventCart:SetShow(false)
    InGameShopBuy_Close()
  end
end
function IngameCashShopEventCart_Buy()
  local self = EventCart
  if 0 ~= getIngameCashMall():getEventCartListCount() then
    FGlobal_InGameShopBuy_Open(0, false, false, false, true)
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCantBuyEventCartEmpty"))
  end
end
function IngameCashShopEventCart_UpdatePrice()
  local self = EventCart
  local eventWrapper = ToClient_GetEventCategoryStaticStatusWrapperByKeyRaw(self.eventKey)
  if nil == eventWrapper then
    return
  end
  local isSellinPeriod = eventWrapper:isSellinPeriod()
  local isDiscountPeriod = eventWrapper:isDiscountPeriod()
  local beforPrice = getIngameCashMall():getEventCartTotalPrice()
  local discountPrice = getIngameCashMall():getEventCartAlpplyDiscountTotalPrice(self.eventKey)
  self.beforePriceTxt:SetText(tostring(Int64toInt32(beforPrice)))
  self.itemCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EVENTCART_ITEMCOUNT") .. " : " .. tostring(getIngameCashMall():getEventCartItemListCount()) .. "/20")
  if true == isSellinPeriod and true == isDiscountPeriod then
    self.disCountPriveTxt:SetShow(true)
    self.nextSaleTxt:SetShow(true)
    local nextDiscountPrice = getIngameCashMall():getEventCartNextDiscountPrice(self.eventKey)
    local nextCellingPrice = getIngameCashMall():getEventCartNextCellingPrice(self.eventKey)
    local nextSaleString
    if self.eventDiscountType == UI_EventCart.eEventCartDiscountType_Subtraction then
      self.disCountPriveTxt:SetText(tostring(discountPrice))
      self.currentDiscountValue:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EVENTCART_PEARL", "pearl", tostring(beforPrice - discountPrice)))
      nextSaleString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_EVENTCART_NEXTAPPLYDISCOUNT", "pearl", tostring(nextCellingPrice - beforPrice), "discountpearl", tostring(nextDiscountPrice))
    elseif self.eventDiscountType == UI_EventCart.eEventCartDiscountType_Rate then
      if 0 ~= discountPrice and 0 ~= beforPrice then
        self.disCountPriveTxt:SetText(tostring(Int64toInt32(discountPrice)))
        if 0 == Int64toInt32(discountPrice) then
          self.currentDiscountValue:SetText("0%")
        else
          local size = eventWrapper:getEventSize()
          local discountPercent = 0
          for ii = 0, size - 1 do
            local celling = eventWrapper:getEventlDiscountCelling(ii)
            if Int64toInt32(celling) <= Int64toInt32(beforPrice) then
              discountPercent = eventWrapper:getEventlDiscountPrice(ii) / 10000
            end
          end
          if eventWrapper:getEventlDiscountCelling(size - 1) <= Int64toInt32(beforPrice) then
            discountPercent = eventWrapper:getEventlDiscountPrice(size - 1) / 10000
          end
          self.currentDiscountValue:SetText(tostring(string.format("%.0f", discountPercent)) .. "%")
          self.disCountValue = string.format("%.0f", discountPercent)
        end
        nextSaleString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_EVENTCART_DISCOUNTSTEPBYRATE", "pearl", tostring(nextCellingPrice - beforPrice), "discountpearl", tostring(string.format("%.0f", Int64toInt32(nextDiscountPrice) / 10000)))
      else
        self.disCountPriveTxt:SetText(0)
        self.currentDiscountValue:SetText(0)
      end
    end
    if tostring(-2) == tostring(nextCellingPrice) then
      self.nextSaleTxt:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EVENTCART_APPLYMAXDISCOUNT"))
    elseif tostring(-1) == tostring(nextCellingPrice) then
      self.nextSaleTxt:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EVENTCART_CANTAPPLYDISCOUNT"))
    else
      self.nextSaleTxt:SetText(nextSaleString)
    end
    self.beforPrice = Int64toInt32(beforPrice)
    self.isCalculate = true
  else
    self.disCountPriveTxt:SetShow(false)
    self.nextSaleTxt:SetShow(false)
  end
end
function FGlobal_IngameCashShopEventCart_Confirm()
  local self = EventCart
  getIngameCashMall():requestBuyItemByEventCart(-1, 0, self.eventKey)
end
function FGlobal_IngameCashShopEventCart_TotalPrice()
  local self = EventCart
  return getIngameCashMall():getEventCartAlpplyDiscountTotalPrice(self.eventKey)
end
function IngameCashShopEventCart_Clear()
  local self = EventCart
  self._list2:getElementManager():clearKey()
  getIngameCashMall():clearEventCart()
  IngameCashShopEventCart_UpdatePrice()
end
function FromClient_buyCompleteCashShopEventCart()
  local self = EventCart
  IngameCashShopEventCart_Clear()
  InGameShop_UpdateCash()
  FGlobal_InGameShop_UpdateByBuy()
  InGameShopBuy_Close()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_NOTIFYCOMPLETE_ACK"))
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_PEARLBAG"))
end
IngameCashShopEventCart_Init()
IngameCashShopEventCart_Update()
registerEvent("FromClient_buyCompleteCashShopEventCart", "FromClient_buyCompleteCashShopEventCart")
