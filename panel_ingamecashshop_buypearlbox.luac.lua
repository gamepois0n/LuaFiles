-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\ingamecashshop\panel_ingamecashshop_buypearlbox.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_PLT = CppEnums.CashPurchaseLimitType
Panel_IngameCashShop_BuyPearlBox:SetShow(false)
Panel_IngameCashShop_BuyPearlBox:setGlassBackground(true)
Panel_IngameCashShop_BuyPearlBox:ActiveMouseEventEffect(true)
local PearlCharge = {_button_Win_Close = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "Button_Win_Close"), _button_Close = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "Button_Cancel"), _button_Confirm = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "Button_Buy"), _staticText_HaveCash = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "StaticText_NowCashCount"), _static_PearlShopBoxBG = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "Static_PearlShopBoxBG"), _static_CashBG = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "Static_CashBG"), _static_CashBox = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "Static_CashBox"), _staticText_HaveCashTitle = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "StaticText_HaveCashTitle"), _static_TotalCashIcon = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "Static_TotalCashIcon"), _staticText_NowCashCount = (UI.getChildControl)(Panel_IngameCashShop_BuyPearlBox, "StaticText_NowCashCount"), goodsMaxCount = 10, SlotCols = 2, 
goodsListPool = {}
, selected_productNoRaw = -1}
PearlCharge.initialize = function(self)
  -- function num : 0_0
  local slotStartX = 20
  local slotStartY = 50
  local slotGapX = 253
  local slotGapY = 65
  local slotRows = (self.goodsMaxCount - 1) / self.SlotCols
  for goods_Idx = 0, self.goodsMaxCount - 1 do
    local col = goods_Idx % self.SlotCols
    local row = (math.floor)(goods_Idx / self.SlotCols)
    local posX = slotStartX + slotGapX * col
    local posY = slotStartY + slotGapY * row
    local tempSlot = {}
    tempSlot.goodsBG = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyPearlBox, "Template_Static_PearlShopList", Panel_IngameCashShop_BuyPearlBox, "IngameCashShop_PearlCharge_Static_ItemSlotBG_" .. goods_Idx)
    tempSlot.iconBG = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyPearlBox, "Template_Static_IconBG", tempSlot.goodsBG, "IngameCashShop_PearlCharge_iconBG_" .. goods_Idx)
    tempSlot.icon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyPearlBox, "Template_Static_Icon", tempSlot.goodsBG, "IngameCashShop_PearlCharge_icon_" .. goods_Idx)
    tempSlot.name = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyPearlBox, "Template_StaticText_ItemTitle", tempSlot.goodsBG, "IngameCashShop_PearlCharge_itemName_" .. goods_Idx)
    tempSlot.pearlIcon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyPearlBox, "Template_Static_PerItemCashIcon", tempSlot.goodsBG, "IngameCashShop_PearlCharge_CashlIcon_" .. goods_Idx)
    tempSlot.price = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyPearlBox, "Template_StaticText_Price", tempSlot.goodsBG, "IngameCashShop_PearlCharge_Price_" .. goods_Idx)
    ;
    (tempSlot.goodsBG):SetPosX(posX)
    ;
    (tempSlot.goodsBG):SetPosY(posY)
    ;
    (tempSlot.goodsBG):SetShow(false)
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self.goodsListPool)[goods_Idx] = tempSlot
  end
end

PearlCharge.update = function(self)
  -- function num : 0_1
  for goods_Idx = 0, self.goodsMaxCount - 1 do
    (((self.goodsListPool)[goods_Idx]).goodsBG):SetShow(false)
  end
  local productCount = ((getIngameCashMall()):getCashProductListCountByCategory((CppEnums.CashProductCategory).eCashProductCategory_Pearl, 0))
  local product = nil
  for productIdx = 0, productCount - 1 do
    product = (getIngameCashMall()):getCashProductStaticStatusByCategory((CppEnums.CashProductCategory).eCashProductCategory_Pearl, 0, productIdx)
    if product ~= nil then
      local slot = (self.goodsListPool)[productIdx]
      ;
      (slot.icon):ChangeTextureInfoName("Icon/" .. product:getIconPath())
      ;
      (slot.name):SetText(product:getName())
      ;
      (slot.price):SetText(makeDotMoney(product:getCashPrice()))
      ;
      (slot.goodsBG):SetShow(true)
      ;
      (slot.goodsBG):addInputEvent("Mouse_LUp", "HandleClicked_PearlCharge_SelectedProduct( " .. productIdx .. " )")
    end
  end
  local selfProxy = (getSelfPlayer()):get()
  local cash = selfProxy:getCash()
  ;
  (self._staticText_HaveCash):SetText(makeDotMoney(cash))
end

PearlCharge.SetPosition = function(self)
  -- function num : 0_2
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_IngameCashShop_BuyPearlBox:GetSizeX()
  local panelSizeY = Panel_IngameCashShop_BuyPearlBox:GetSizeY()
  Panel_IngameCashShop_BuyPearlBox:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_IngameCashShop_BuyPearlBox:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

PearlCharge.SetWindowSize = function(self)
  -- function num : 0_3
  local productCount = (getIngameCashMall()):getCashProductListCountByCategory((CppEnums.CashProductCategory).eCashProductCategory_Pearl, 0)
  local slotGapY = 60
  local BGGapY = 36
  local boxGapY = 15
  local controlGapY = 18
  local iconGapY = 20
  local btnGapY = 36
  local cartListYPanelSize = 430
  local cartListYSlotBGSize = 275
  local startSlotCount = (math.ceil)(productCount / 2)
  local lastSlotCount = (math.ceil)((productCount - 8) / 2)
  if productCount <= 8 then
    Panel_IngameCashShop_BuyPearlBox:SetSize(Panel_IngameCashShop_BuyPearlBox:GetSizeX(), cartListYPanelSize)
    ;
    (self._static_PearlShopBoxBG):SetSize((self._static_PearlShopBoxBG):GetSizeX(), cartListYSlotBGSize)
  else
    for i = 0, lastSlotCount do
      Panel_IngameCashShop_BuyPearlBox:SetSize(Panel_IngameCashShop_BuyPearlBox:GetSizeX(), cartListYPanelSize)
      ;
      (self._static_PearlShopBoxBG):SetSize((self._static_PearlShopBoxBG):GetSizeX(), cartListYSlotBGSize)
      cartListYPanelSize = cartListYPanelSize + slotGapY
      cartListYSlotBGSize = cartListYSlotBGSize + slotGapY
    end
  end
  do
    ;
    (self._static_CashBG):SetPosY((self._static_PearlShopBoxBG):GetSizeY() + BGGapY)
    ;
    (self._static_CashBox):SetPosY((self._static_CashBG):GetPosY() + boxGapY)
    ;
    (self._staticText_HaveCashTitle):SetPosY((self._static_CashBG):GetPosY() + controlGapY)
    ;
    (self._static_TotalCashIcon):SetPosY((self._static_CashBG):GetPosY() + iconGapY)
    ;
    (self._staticText_NowCashCount):SetPosY((self._static_CashBG):GetPosY() + controlGapY)
    ;
    (self._button_Close):SetPosY((self._static_CashBG):GetPosY() + btnGapY)
    ;
    (self._button_Confirm):SetPosY((self._static_CashBG):GetPosY() + btnGapY)
    ;
    (self._static_CashBG):ComputePos()
    ;
    (self._static_CashBox):ComputePos()
    ;
    (self._staticText_HaveCashTitle):ComputePos()
    ;
    (self._static_TotalCashIcon):ComputePos()
    ;
    (self._staticText_NowCashCount):ComputePos()
    ;
    (self._button_Close):ComputePos()
    ;
    (self._button_Confirm):ComputePos()
  end
end

PearlCharge.registMessageHandler = function(self)
  -- function num : 0_4
  (self._button_Win_Close):addInputEvent("Mouse_LUp", "HandleClicked_PearlCharge_Close()")
  ;
  (self._button_Close):addInputEvent("Mouse_LUp", "HandleClicked_PearlCharge_Close()")
  ;
  (self._button_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_PearlCharge_Confirm()")
end

PearlCharge.Close = function(self)
  -- function num : 0_5
  Panel_IngameCashShop_BuyPearlBox:SetShow(false)
end

HandleClicked_PearlCharge_SelectedProduct = function(productIndex)
  -- function num : 0_6 , upvalues : PearlCharge
  local self = PearlCharge
  local product = (getIngameCashMall()):getCashProductStaticStatusByCategory((CppEnums.CashProductCategory).eCashProductCategory_Pearl, 0, productIndex)
  self.selected_productNoRaw = product:getNoRaw()
end

HandleClicked_PearlCharge_Close = function()
  -- function num : 0_7 , upvalues : PearlCharge
  PearlCharge:Close()
end

HandleClicked_PearlCharge_Confirm = function()
  -- function num : 0_8 , upvalues : PearlCharge
  local self = PearlCharge
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self.selected_productNoRaw)
  local msgTitle = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYPEARLBOX_CONFIRM")
  local addPearlComment = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_PURCHASELIMIT")
  local msgContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYPEARLBOX_BUYCONFIRM", "getName", cashProduct:getName())
  local messageboxData = {title = msgTitle, content = msgContent .. addPearlComment, functionYes = _IngameCashShop_PearlCharge_ConfirmDO, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

_IngameCashShop_PearlCharge_ConfirmDO = function()
  -- function num : 0_9 , upvalues : PearlCharge
  local self = PearlCharge
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self.selected_productNoRaw)
  ;
  (getIngameCashMall()):requestBuyItem(self.selected_productNoRaw, 1, cashProduct:getCashPrice(), (CppEnums.BuyItemReqTrType).eBuyItemReqTrType_UiUpdate, toInt64(0, -1), 0)
end

FGlobal_IngameCashShop_PearlCharge_Open = function()
  -- function num : 0_10
  local msgTitle = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYPEARLBOX_CONFIRM")
  local msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYPEARLBOX_PEARLCHARGE_MSG")
  local messageboxData = {title = msgTitle, content = msgContent, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

FGlobal_IngameCashShop_PearlCharge_Close = function()
  -- function num : 0_11 , upvalues : PearlCharge
  PearlCharge:Close()
end

PearlCharge:initialize()
PearlCharge:registMessageHandler()

