-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\housing\panel_house_installationmode_cart.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
Panel_House_InstallationMode_Cart:SetShow(false)
local HouseInstallationCart = {bg_BuyPearl = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Static_BuyPearlBG"), have_PearlIcon = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Static_NowPearlIcon"), have_PearlValue = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "StaticText_NowPearlCount"), btn_BuyPearl = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Button_BuyPearl"), bg_Cart = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Static_CartBG"), cart_Title = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "StaticText_CartTitle"), bg_cartList = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Static_CartListBG"), scroll = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Scroll_CartList"), bg_BuyCart = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Static_CartBuyBG"), bg_BuyCartPearl = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Static_CartTotal_PearlBG"), sum_Title = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "StaticText_CartTotal_Title"), sum_PearlIcon = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Static_CartTotal_PearlIcon"), sum_PearlValue = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "StaticText_CartTotal_PearlCount"), btn_ClearCart = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Button_CartClear"), btn_BuyCartItem = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Button_CartBuy"), _isModeShow = false, 
SlotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true, createCash = true}
, 
slotUIPool = {}
, maxSlotCount = 14, hasItemCount = 0, nowInterval = 0, maxInterval = 0}
HouseInstallationCart.scrollCtrlBTN = (UI.getChildControl)(HouseInstallationCart.scroll, "Scroll_CtrlButton")
local Template = {cashIconBG = (UI.getChildControl)(Panel_House_InstallationMode_Cart, "Template_Static_CashIconBG")}
HouseInstallationCart.Initialize = function(self)
  -- function num : 0_0 , upvalues : UI_PUCT, Template
  local setGroup = function()
    -- function num : 0_0_0 , upvalues : self
    (self.bg_BuyPearl):AddChild(self.have_PearlIcon)
    ;
    (self.bg_BuyPearl):AddChild(self.have_PearlValue)
    ;
    (self.bg_BuyPearl):AddChild(self.btn_BuyPearl)
    Panel_House_InstallationMode_Cart:RemoveControl(self.have_PearlIcon)
    Panel_House_InstallationMode_Cart:RemoveControl(self.have_PearlValue)
    Panel_House_InstallationMode_Cart:RemoveControl(self.btn_BuyPearl)
    ;
    (self.have_PearlIcon):SetPosX(5)
    ;
    (self.have_PearlIcon):SetPosY(7)
    ;
    (self.have_PearlValue):SetPosX(30)
    ;
    (self.have_PearlValue):SetPosY(5)
    ;
    (self.btn_BuyPearl):SetPosX(125)
    ;
    (self.btn_BuyPearl):SetPosY(5)
    ;
    (self.btn_BuyPearl):SetShow(false)
    ;
    (self.bg_Cart):AddChild(self.cart_Title)
    ;
    (self.bg_Cart):AddChild(self.bg_cartList)
    ;
    (self.bg_Cart):AddChild(self.bg_BuyCart)
    ;
    (self.bg_Cart):AddChild(self.scroll)
    Panel_House_InstallationMode_Cart:RemoveControl(self.cart_Title)
    Panel_House_InstallationMode_Cart:RemoveControl(self.bg_cartList)
    Panel_House_InstallationMode_Cart:RemoveControl(self.bg_BuyCart)
    Panel_House_InstallationMode_Cart:RemoveControl(self.scroll)
    ;
    (self.cart_Title):SetPosX(0)
    ;
    (self.cart_Title):SetPosY(25)
    ;
    (self.bg_cartList):SetPosX(10)
    ;
    (self.bg_cartList):SetPosY(35)
    ;
    (self.bg_BuyCart):SetPosX(10)
    ;
    (self.bg_BuyCart):SetPosY(430)
    ;
    (self.scroll):SetPosX(170)
    ;
    (self.scroll):SetPosY(40)
    ;
    (self.bg_BuyCart):AddChild(self.bg_BuyCartPearl)
    ;
    (self.bg_BuyCart):AddChild(self.btn_ClearCart)
    ;
    (self.bg_BuyCart):AddChild(self.btn_BuyCartItem)
    Panel_House_InstallationMode_Cart:RemoveControl(self.bg_BuyCartPearl)
    Panel_House_InstallationMode_Cart:RemoveControl(self.btn_ClearCart)
    Panel_House_InstallationMode_Cart:RemoveControl(self.btn_BuyCartItem)
    ;
    (self.bg_BuyCartPearl):SetPosX(5)
    ;
    (self.bg_BuyCartPearl):SetPosY(5)
    ;
    (self.btn_ClearCart):SetPosX(5)
    ;
    (self.btn_ClearCart):SetPosY(40)
    ;
    (self.btn_BuyCartItem):SetPosX(70)
    ;
    (self.btn_BuyCartItem):SetPosY(40)
    ;
    (self.bg_BuyCartPearl):AddChild(self.sum_Title)
    ;
    (self.bg_BuyCartPearl):AddChild(self.sum_PearlIcon)
    ;
    (self.bg_BuyCartPearl):AddChild(self.sum_PearlValue)
    Panel_House_InstallationMode_Cart:RemoveControl(self.sum_Title)
    Panel_House_InstallationMode_Cart:RemoveControl(self.sum_PearlIcon)
    Panel_House_InstallationMode_Cart:RemoveControl(self.sum_PearlValue)
    ;
    (self.sum_Title):SetPosX(10)
    ;
    (self.sum_Title):SetPosY(5)
    ;
    (self.sum_PearlIcon):SetPosX(56)
    ;
    (self.sum_PearlIcon):SetPosY(7)
    ;
    (self.sum_PearlValue):SetPosX(80)
    ;
    (self.sum_PearlValue):SetPosY(5)
  end

  setGroup()
  local SlotStartX = 25
  local SlotStartY = 5
  local SlotGapX = 60
  local SlotGapY = 55
  local SlotCols = 2
  for slot_Idx = 0, self.maxSlotCount - 1 do
    local tempArray = {}
    local col = slot_Idx % SlotCols
    local row = (math.floor)(slot_Idx / SlotCols)
    local posX = SlotStartX + SlotGapX * col
    local posY = SlotStartY + SlotGapY * row
    local created_SlotBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.bg_cartList, "Panel_House_InstallationCart_SlotBG_" .. slot_Idx)
    CopyBaseProperty(Template.cashIconBG, created_SlotBG)
    created_SlotBG:SetShow(false)
    created_SlotBG:SetPosX(posX)
    created_SlotBG:SetPosY(posY)
    tempArray.SlotBG = created_SlotBG
    local slot = {}
    ;
    (SlotItem.new)(slot, "Panel_House_InstallationCart_SlotItem_" .. slot_Idx, slot_Idx, created_SlotBG, self.SlotConfig)
    slot:createChild()
    ;
    (slot.icon):SetPosX(3)
    ;
    (slot.icon):SetPosY(3)
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "HandleClicked_InstallationModeCart_ItemSlot(" .. slot_Idx .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_DownScroll", "_InstallationModeCart_ScrollUpdate( true )")
    ;
    (slot.icon):addInputEvent("Mouse_UpScroll", "_InstallationModeCart_ScrollUpdate( false )")
    tempArray.slotItem = slot
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R18 in 'UnsetPending'

    ;
    (self.slotUIPool)[slot_Idx] = tempArray
  end
end

HouseInstallationCart.SetPosition = function(self)
  -- function num : 0_1
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_House_InstallationMode_Cart:GetSizeX()
  local panelSizeY = Panel_House_InstallationMode_Cart:GetSizeY()
  Panel_House_InstallationMode_Cart:SetPosX(scrSizeX - panelSizeX - 10)
  Panel_House_InstallationMode_Cart:SetPosY(10)
end

HouseInstallationCart.SetCartCount = function(self)
  -- function num : 0_2
  self.hasItemCount = housing_getShoppingBasketItemCount()
end

HouseInstallationCart.SetScroll = function(self)
  -- function num : 0_3
  local dataCount = self.hasItemCount
  local countByline = self.maxSlotCount / 2
  local totalLine = (math.ceil)(dataCount / 2)
  local interval = totalLine
  if self.maxSlotCount < dataCount then
    (self.scroll):SetShow(true)
  else
    ;
    (self.scroll):SetShow(false)
  end
  if interval < 0 then
    interval = 0
  end
  self.maxInterval = interval
  self.nowInterval = 0
  ;
  (self.scroll):SetInterval(self.maxInterval)
  local pagePercent = countByline / totalLine * 100
  local scrollSizeY = (self.scroll):GetSizeY()
  local btn_scrollSizeY = scrollSizeY / 100 * pagePercent
  if btn_scrollSizeY < 20 then
    btn_scrollSizeY = 20
  end
  if scrollSizeY < btn_scrollSizeY then
    btn_scrollSizeY = scrollSizeY
  end
  ;
  (self.scrollCtrlBTN):SetSize((self.scrollCtrlBTN):GetSizeX(), btn_scrollSizeY)
  ;
  (self.scroll):SetInterval(self.maxInterval)
end

_InstallationModeCart_ScrollUpdate = function(isDown)
  -- function num : 0_4 , upvalues : HouseInstallationCart
  local self = HouseInstallationCart
  local interval = self.nowInterval
  if isDown == true then
    if interval < self.maxInterval then
      interval = interval + 1
      ;
      (self.scroll):ControlButtonDown()
    else
      return 
    end
  else
    if interval > 0 then
      interval = interval - 1
      ;
      (self.scroll):ControlButtonUp()
    else
      return 
    end
  end
  self.nowInterval = interval
  self:Update(self.nowInterval)
end

HouseInstallationCart.Update = function(self, nowInterval)
  -- function num : 0_5
  for slot_Idx = 0, self.maxSlotCount - 1 do
    local uiPool = (self.slotUIPool)[slot_Idx]
    ;
    (uiPool.SlotBG):SetShow(false)
    ;
    (uiPool.slotItem):clearItem()
    ;
    ((uiPool.slotItem).icon):addInputEvent("Mouse_On", "")
    ;
    ((uiPool.slotItem).icon):addInputEvent("Mouse_Out", "")
  end
  local s64_havePearls = 0
  local pearlItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getPearlSlotNo())
  if pearlItemWrapper ~= nil then
    s64_havePearls = (pearlItemWrapper:get()):getCount_s64()
  end
  ;
  (self.have_PearlValue):SetText(makeDotMoney(s64_havePearls))
  ;
  (self.sum_PearlValue):SetText("0")
  if self.hasItemCount == 0 then
    return 
  end
  local s64_SumPearls = toInt64(0, 0)
  for idx = 0, self.hasItemCount - 1 do
    local productNoRaw = housing_getShoppingBasketItemByIndex(idx)
    local cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(productNoRaw)
    s64_SumPearls = s64_SumPearls + cPSSW:getPrice()
  end
  ;
  (self.sum_PearlValue):SetText(makeDotMoney(s64_SumPearls))
  local startIdx = nowInterval * 2
  for slot_Idx = startIdx, self.hasItemCount - 1 do
    local uiIdx = slot_Idx - startIdx
    local uiPool = (self.slotUIPool)[uiIdx]
    local productNoRaw = housing_getShoppingBasketItemByIndex(slot_Idx)
    local cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(productNoRaw)
    local itemSSW = cPSSW:getItemByIndex(0)
    ;
    (uiPool.SlotBG):SetShow(true)
    ;
    (uiPool.slotItem):setItemByStaticStatus(itemSSW, 0)
    ;
    ((uiPool.slotItem).icon):SetShow(true)
    ;
    ((uiPool.slotItem).icon):addInputEvent("Mouse_On", "InstallationModeCart_ShowToolTip(" .. productNoRaw .. ", " .. uiIdx .. ")")
    ;
    ((uiPool.slotItem).icon):addInputEvent("Mouse_Out", "InstallationModeCart_HideToolTip()")
    if uiIdx == self.maxSlotCount - 1 then
      return 
    end
  end
end

InstallationModeCart_ShowToolTip = function(productNoRaw, uiIdx)
  -- function num : 0_6 , upvalues : HouseInstallationCart
  local self = HouseInstallationCart
  local cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(productNoRaw)
  local itemSSW = cPSSW:getItemByIndex(0)
  local Uislot = (self.slotUIPool)[uiIdx]
  Panel_Tooltip_Item_Show(itemSSW, (Uislot.slotItem).icon, true, false)
end

InstallationModeCart_HideToolTip = function()
  -- function num : 0_7
  Panel_Tooltip_Item_hideTooltip()
end

FGlobal_House_InstallationModeCart_Update = function()
  -- function num : 0_8 , upvalues : HouseInstallationCart
  HouseInstallationCart:UpdateAll()
end

HouseInstallationCart.UpdateAll = function(self)
  -- function num : 0_9
  self:SetCartCount()
  self:SetScroll()
  self:Update(self.nowInterval)
end

HandleClicked_InstallationModeCart_BuyPearl = function()
  -- function num : 0_10
  FGlobal_IngameCashShop_PearlCharge_Open()
end

HandleClicked_InstallationModeCart_BuyItemAll = function()
  -- function num : 0_11
  local buyCartDo = function()
    -- function num : 0_11_0
    housing_buyShoppinBasketItems()
  end

  local messageBoxMemo = ""
  if ((getSelfPlayer()):get()):isMyHouseVisiting() then
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_CART_BUYITEMALL_MSGMEMO1")
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_CART_BUYITEMALL_MSGMEMO2")
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = buyCartDo, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_InstallationModeCart_Clear = function()
  -- function num : 0_12 , upvalues : HouseInstallationCart
  housing_clearShoppingBasketItems()
  HouseInstallationCart:UpdateAll()
end

FGlobal_House_InstallationModeCart_Update = function()
  -- function num : 0_13 , upvalues : HouseInstallationCart
  HouseInstallationCart:UpdateAll()
end

FGlobal_House_InstallationModeCart_Open = function()
  -- function num : 0_14 , upvalues : HouseInstallationCart
  if getContentsServiceType() ~= (CppEnums.ContentsServiceType).eContentsServiceType_Commercial then
    return 
  end
  HouseInstallationCart:SetPosition()
  HouseInstallationCart:UpdateAll()
  Panel_House_InstallationMode_Cart:SetShow(true)
end

FGlobal_House_InstallationModeCart_Close = function()
  -- function num : 0_15
  Panel_House_InstallationMode_Cart:SetShow(false)
end

HandleClicked_InstallationModeCart_ItemSlot = function(slotIndex)
  -- function num : 0_16 , upvalues : HouseInstallationCart
  housing_clearShoppingBasketItemByIndex(slotIndex)
  HouseInstallationCart:UpdateAll()
end

HouseInstallationCart.registEventHandler = function(self)
  -- function num : 0_17
  (self.btn_BuyPearl):addInputEvent("Mouse_LUp", "HandleClicked_InstallationModeCart_BuyPearl()")
  ;
  (self.btn_BuyCartItem):addInputEvent("Mouse_LUp", "HandleClicked_InstallationModeCart_BuyItemAll()")
  ;
  (self.btn_ClearCart):addInputEvent("Mouse_LUp", "HandleClicked_InstallationModeCart_Clear()")
  ;
  (self.bg_cartList):addInputEvent("Mouse_DownScroll", "_InstallationModeCart_ScrollUpdate( true )")
  ;
  (self.bg_cartList):addInputEvent("Mouse_UpScroll", "_InstallationModeCart_ScrollUpdate( false )")
end

HouseInstallationCart:Initialize()
HouseInstallationCart:registEventHandler()

