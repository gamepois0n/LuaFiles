-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_ingamecashshop_easypayment.luac 

-- params : ...
-- function num : 0
local UI_PLT = CppEnums.CashPurchaseLimitType
Panel_IngameCashShop_EasyPayment:SetShow(false, false)
PaGlobal_EasyBuy = {
_ui = {_btn_Close = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "Button_Cancel"), _btn_WinClose = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "Button_Win_Close"), _itemBG = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "Template_Static_ItemSlotBG"), _txt_InmyPearlCount = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "StaticText_GoodsTotalPearlIcon"), _mainBG = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "Static_LeftBG"), _bottom_LineBG = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "Static_BuyLineBG"), _bottom_HavePearl = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "StaticText_TotalPrice"), _list2 = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "List2_EasyBuy"), SlotBG = nil, Slot = nil, ItemName = nil, ItemPrice = nil, ItemCount = nil, ItemBuy = nil, _list2_Content = nil}
, _listCount = 20, 
_itemListPool = {}
, savedMainCategory = nil, savedMiddleCategory = nil, savedSmallCategory = -1, savedWayPointKey = -1, slotStartX = 15, slotStartY = 50, slotGapX = 335, slotGapY = 60, 
slotConfing = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createClassEquipBG = true}
}
EasybuyShowAni = function()
  -- function num : 0_0
  local ImageMoveAni = Panel_IngameCashShop_EasyPayment:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni:SetStartPosition(getScreenSizeX() / 2 - Panel_IngameCashShop_EasyPayment:GetSizeX() / 2, 0 - Panel_IngameCashShop_EasyPayment:GetSizeY())
  ImageMoveAni:SetEndPosition(getScreenSizeX() / 2 - Panel_IngameCashShop_EasyPayment:GetSizeX() / 2, getScreenSizeY() - getScreenSizeY() / 2 - Panel_IngameCashShop_EasyPayment:GetSizeY() / 2)
  ImageMoveAni.IsChangeChild = true
  Panel_IngameCashShop_EasyPayment:CalcUIAniPos(ImageMoveAni)
  ImageMoveAni:SetDisableWhileAni(true)
end

EasybuyHideAni = function()
  -- function num : 0_1
  local ImageMoveAni = Panel_IngameCashShop_EasyPayment:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni:SetStartPosition(getScreenSizeX() / 2 - Panel_IngameCashShop_EasyPayment:GetSizeX() / 2, getScreenSizeY() - getScreenSizeY() / 2 - Panel_IngameCashShop_EasyPayment:GetSizeY() / 2)
  ImageMoveAni:SetEndPosition(getScreenSizeX() / 2 - Panel_IngameCashShop_EasyPayment:GetSizeX() / 2, 0 - Panel_IngameCashShop_EasyPayment:GetSizeY())
  ImageMoveAni.IsChangeChild = true
  Panel_IngameCashShop_EasyPayment:CalcUIAniPos(ImageMoveAni)
  ImageMoveAni:SetDisableWhileAni(true)
  ImageMoveAni:SetHideAtEnd(true)
  ImageMoveAni:SetDisableWhileAni(true)
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_EasyBuy.Init = function(self)
  -- function num : 0_2
  local list2Control = (UI.getChildControl)(Panel_IngameCashShop_EasyPayment, "List2_EasyBuy")
  local list2Content = (UI.getChildControl)(list2Control, "List2_1_Content")
  local createSlot = {}
  local itemlist_Slot = (UI.getChildControl)(list2Content, "Template_Static_GoodsSlot")
  ;
  (SlotItem.new)(createSlot, "EasyBuy_ItemSlot", 0, itemlist_Slot, self.slotConfing)
  createSlot:createChild()
  ;
  ((self._ui)._list2):changeAnimationSpeed(10)
  ;
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobal_EasyBuy_Update")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_EasyBuy_Close()")
  ;
  ((self._ui)._btn_WinClose):addInputEvent("Mouse_LUp", "PaGlobal_EasyBuy_Close()")
end

PaGlobal_EasyBuy_Update = function(contents, key)
  -- function num : 0_3 , upvalues : UI_PLT
  local idx = Int64toInt32(key)
  local self = PaGlobal_EasyBuy
  local baseSlot = (UI.getChildControl)(contents, "Template_Static_ItemSlotBG")
  local itemSlotBG = (UI.getChildControl)(contents, "Template_Static_GoodsSlotBG")
  local createSlot = {}
  local itemSlot = (UI.getChildControl)(contents, "Template_Static_GoodsSlot")
  ;
  (SlotItem.reInclude)(createSlot, "EasyBuy_ItemSlot", 0, itemSlot, self.slotConfing)
  local itemName = (UI.getChildControl)(contents, "Template_StaticText_GoodsName")
  local itemPrice = (UI.getChildControl)(contents, "Template_StaticText_GoodsPearlIcon")
  local itemBuyCount = (UI.getChildControl)(contents, "Template_StaticText_BuyCount")
  local itemBuy = (UI.getChildControl)(contents, "Button_Buy")
  local productInfo = (getIngameCashMall()):getByCategoryLevel4(self.savedMainCategory, self.savedMiddleCategory, self.savedSmallCategory, self.savedWayPointKey, idx)
  if productInfo ~= nil then
    local mylimitCount = (getIngameCashMall()):getRemainingLimitCount(productInfo:getNoRaw())
    local productItemCount = productInfo:getInnerItemListCount()
    local productSSW = productInfo:getInnerItemByIndex(0)
    local limitType = productInfo:getCashPurchaseLimitType()
    if productSSW ~= nil then
      baseSlot:SetShow(true)
      itemSlotBG:SetShow(true)
      itemSlot:SetShow(true)
      createSlot:setItemByStaticStatus(productSSW, 1, -1, false)
      ;
      (createSlot.icon):SetShow(true)
      ;
      (createSlot.icon):addInputEvent("Mouse_On", "PaGlobal_EasyBuy_ItemTooltip(true, " .. productInfo:getNoRaw() .. ", " .. idx .. ")")
      ;
      (createSlot.icon):addInputEvent("Mouse_Out", "PaGlobal_EasyBuy_ItemTooltip(false)")
      itemName:SetShow(true)
      itemName:SetText(productInfo:getName())
      itemPrice:SetShow(true)
      if productInfo:isApplyDiscount() then
        itemPrice:SetText(makeDotMoney(productInfo:getOriginalPrice()) .. " -> <PAColor0xfface400>" .. makeDotMoney(productInfo:getPrice()) .. "<PAOldColor>")
      else
        itemPrice:SetText(makeDotMoney(productInfo:getOriginalPrice()))
      end
      itemBuyCount:SetShow(false)
      itemBuy:SetShow(true)
      if UI_PLT.AtCharacter == limitType or UI_PLT.AtAccount == limitType then
        if mylimitCount <= 0 then
          itemBuy:SetFontColor(4294077034)
          itemBuy:SetEnable(false)
        else
          itemBuy:SetFontColor(4278239447)
          itemBuy:SetEnable(true)
        end
      else
        itemBuy:SetFontColor(4278239447)
        itemBuy:SetEnable(true)
      end
      itemBuy:addInputEvent("Mouse_LUp", "PaGlobal_EasyBuy_BuyItem( " .. productInfo:getNoRaw() .. " )")
    end
  end
end

local easyBuyCountCache = 0
-- DECOMPILER ERROR at PC99: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_EasyBuy.Update = function(self)
  -- function num : 0_4 , upvalues : easyBuyCountCache
  local productCount = (getIngameCashMall()):getListCountByCategoryLevel4(self.savedMainCategory, self.savedMiddleCategory, self.savedSmallCategory, self.savedWayPointKey)
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  if easyBuyCountCache < productCount then
    for idx = easyBuyCountCache, productCount - 1 do
      local productInfo = (getIngameCashMall()):getByCategoryLevel4(self.savedMainCategory, self.savedMiddleCategory, self.savedSmallCategory, self.savedWayPointKey, idx)
      if CheckCashProduct(productInfo) then
        (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, idx))
      end
    end
  else
    do
      for idx = productCount, easyBuyCountCache - 1 do
        local productInfo = (getIngameCashMall()):getByCategoryLevel4(self.savedMainCategory, self.savedMiddleCategory, self.savedSmallCategory, self.savedWayPointKey, idx)
        if CheckCashProduct(productInfo) then
          (((self._ui)._list2):getElementManager()):removeKey(toInt64(0, idx))
        end
      end
      do
        PaGlobal_EasyBuy:WindowResize()
      end
    end
  end
end

PaGlobal_EasyBuy_BuyItem = function(productRaw)
  -- function num : 0_5
  FGlobal_InGameShopBuy_Open(productRaw, false, false, true)
  IngameCashShopCoupon_Open(0, productRaw)
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_EasyBuy.MyPearlUpdate = function(self)
  -- function num : 0_6
  local pearlItemWrapper = (getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getPearlSlotNo()))
  local pearl = nil
  if pearlItemWrapper ~= nil then
    pearl = (pearlItemWrapper:get()):getCount_s64()
  end
  ;
  ((self._ui)._txt_InmyPearlCount):SetText(makeDotMoney(pearl))
end

PaGlobal_EasyBuy_ItemTooltip = function(isShow, productKeyRaw, index)
  -- function num : 0_7
  local self = PaGlobal_EasyBuy
  if isShow == true then
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productKeyRaw)
    local itemWrapper = cashProduct:getItemByIndex(0)
    local contents = ((self._ui)._list2):GetContentByKey(toInt64(0, index))
    local control = (UI.getChildControl)(contents, "Template_Static_GoodsSlot")
    Panel_Tooltip_Item_Show(itemWrapper, control, true, false, nil)
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_EasyBuy.WindowResize = function(self)
  -- function num : 0_8
  local cartListCount = (getIngameCashMall()):getListCountByCategoryLevel4(self.savedMainCategory, self.savedMiddleCategory, self.savedSmallCategory, self.savedWayPointKey)
  local slotGapY = 60
  local BGGapY = 50
  local controlGapY = 5
  local btnGapY = 36
  local cartListYPanelSize = 440
  local cartListYSlotBGSize = 305
  local startSlotCount = (math.ceil)(cartListCount / 2)
  local lastSlotCount = (math.ceil)((cartListCount - 8) / 2)
  if cartListCount <= 8 then
    Panel_IngameCashShop_EasyPayment:SetSize(Panel_IngameCashShop_EasyPayment:GetSizeX(), cartListYPanelSize)
    ;
    ((self._ui)._mainBG):SetSize(((self._ui)._mainBG):GetSizeX(), cartListYSlotBGSize)
  else
    Panel_IngameCashShop_EasyPayment:SetSize(Panel_IngameCashShop_EasyPayment:GetSizeX(), cartListYPanelSize)
    ;
    ((self._ui)._mainBG):SetSize(((self._ui)._mainBG):GetSizeX(), cartListYSlotBGSize)
    cartListYPanelSize = cartListYPanelSize + slotGapY
    cartListYSlotBGSize = cartListYSlotBGSize + slotGapY
  end
  ;
  ((self._ui)._btn_Close):ComputePos()
  ;
  ((self._ui)._txt_InmyPearlCount):ComputePos()
  ;
  ((self._ui)._bottom_LineBG):ComputePos()
  ;
  ((self._ui)._bottom_HavePearl):ComputePos()
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_EasyBuy.Open = function(self, mainCategory, middleCategory, smallCategory, waypointKey)
  -- function num : 0_9
  if Panel_IngameCashShop_EasyPayment:GetShow() then
    PaGlobal_EasyBuy:Close()
    return 
  end
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPOPENALERT_INDEAD"))
    return 
  end
  if ToClient_IsConferenceMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_NOTUSE"))
    return 
  end
  if not FGlobal_IsCommercialService() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_NOTUSE"))
    return 
  end
  if Panel_IngameCashShop:GetShow() then
    return 
  end
  if getIngameCashMall() == nil then
    return false
  end
  if (getIngameCashMall()):isShow() then
    return 
  end
  if Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  cashShop_requestCash()
  cashShop_requestCashShopList()
  PaymentPassword_Close()
  if smallCategory == nil then
    smallCategory = -1
  end
  if waypointKey == nil then
    waypointKey = -1
  end
  self.savedMainCategory = mainCategory
  self.savedMiddleCategory = middleCategory
  self.savedSmallCategory = smallCategory
  self.savedWayPointKey = waypointKey
  PaGlobal_EasyBuy:Update()
  PaGlobal_EasyBuy:MyPearlUpdate()
  Panel_IngameCashShop_EasyPayment:SetShow(true, true)
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_EasyBuy.Close = function(self)
  -- function num : 0_10
  Panel_IngameCashShop_EasyPayment:SetShow(false, true)
  ;
  (getIngameCashMall()):hide()
  FGlobal_HideWorkerTooltip()
  TooltipSimple_Hide()
  Panel_Tooltip_Item_hideTooltip()
  Panel_Tooltip_Item_chattingLinkedItemClick_hideTooltip()
end

PaGlobal_EasyBuy_Open = function()
  -- function num : 0_11
  PaGlobal_EasyBuy:Open()
end

PaGlobal_EasyBuy_Close = function()
  -- function num : 0_12
  PaGlobal_EasyBuy:Close()
end

-- DECOMPILER ERROR at PC122: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_EasyBuy.Event = function(self)
  -- function num : 0_13
  Panel_IngameCashShop_EasyPayment:RegisterShowEventFunc(true, "EasybuyShowAni()")
  Panel_IngameCashShop_EasyPayment:RegisterShowEventFunc(false, "EasybuyHideAni()")
end

PaGlobal_EasyBuy:Init()
PaGlobal_EasyBuy:Event()

