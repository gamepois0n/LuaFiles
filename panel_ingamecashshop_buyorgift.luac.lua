-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_ingamecashshop_buyorgift.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_PLT = CppEnums.CashPurchaseLimitType
local UI_CCC = CppEnums.CashProductCategory
Panel_IngameCashShop_BuyOrGift:SetShow(false)
Panel_IngameCashShop_BuyOrGift:setGlassBackground(true)
Panel_IngameCashShop_BuyOrGift:ActiveMouseEventEffect(true)
local isCouponOpen = ToClient_IsContentsGroupOpen("224")
local isOpenPearlStamp = ToClient_IsContentsGroupOpen("308")
local inGameShopBuy = {
_config = {
_slot = {_startX = 17, _startY = 130, _gapX = 36}
, 
_buy = {_startX = 17, _startY = 130, _gapX = 30}
, _sizeGift = 35, _sizeBG = 30, _sizePanel = 85, _giftTopListMaxCount = 5, _giftTopListCount = 0, _giftTopListStart = 0, _giftBotListMaxCount = 5, _giftBotListCount = 0, _giftBotListStart = 0}
, 
giftTopList = {}
, 
giftBotList = {}
, 
giftUserList = {}
, savedProductCount = 1, savedCouponApply = nil, savedCouponDiscountRate = 0, savedCouponDiscountTextSizeX = 0, _panelTitle = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_Title"), _static_LeftBG = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Static_LeftBG"), _static_PearlBG = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Static_PearlBG"), _static_ItemIconBG = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Static_GoodsSlotBG"), _static_ItemIcon = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Static_GoodsSlot"), _static_ItemName = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_GoodsName"), _static_PearlIcon = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_PearlIcon"), _static_StampIcon = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_PearlStampIcon"), _txt_PearlIconPrice = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_CouponPearlIcon"), _txt_DiscountDirection = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_DiscountDirection"), _static_DiscountPrice = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_DiscountGoodsPrice"), _static_Gift = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_GiftTo"), _edit_Gift = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Edit_GiftTo"), _static_GiftListBG = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Static_GiftListBG"), _static_GiftListTopBG = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Static_GiftListTopBG"), _static_GiftListBotBG = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Static_GiftListBotBG"), _static_GiftList_NonUser = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_NonUser"), _scroll_GiftTopList = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Scroll_GiftTopList"), _scroll_GiftBotList = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Scroll_GiftBotList"), _buttonFriendList = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Button_Friend"), _buttonGuildList = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Button_Guild"), _button_AddUser = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Button_AddUser"), _button_Close = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Button_Win_Close"), _button_Confirm = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Button_Confirm"), _button_Cancle = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Button_Cancle"), _static_selectStampBG = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Static_StampCouponSelectBG"), _slotCount = 20, _slots = (Array.new)(), _needMoneyType = -1, _productNoRaw = nil, _isGift = false, _byCart = false, _easyBuy = false, _usePearlStampCount = 0, _isUsePearl = false}
local contry = {kr = 0, jp = 1, ru = 2, kr2 = 3}
local cashIconType = {cash = 0, pearl = 1, mileage = 2, silver = 3}
local cashIconTexture = {
{267, 479, 286, 498}
, 
{310, 479, 329, 498}
, 
{310, 479, 329, 498}
; 
[0] = {310, 479, 329, 498}
}
local giftSendType = {userNo = 0, characterName = 1}
local eCountryType = CppEnums.CountryType
local gameServiceType = getGameServiceType()
local isKorea = eCountryType.NONE == gameServiceType or eCountryType.DEV == gameServiceType or eCountryType.KOR_ALPHA == gameServiceType or eCountryType.KOR_REAL == gameServiceType or eCountryType.KOR_TEST == gameServiceType
do
  local isNaver = (CppEnums.MembershipType).naver == getMembershipType()
  inGameShopBuy.init = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  local slotConfig = (self._config)._slot
  for ii = 0, self._slotCount - 1 do
    local slot = {}
    slot.iconBG = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Static_SubItemSlotBG", Panel_IngameCashShop_BuyOrGift, "InGameShopBuy_Sub_" .. ii)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Static_SubItemSlot", slot.iconBG, "InGameShopBuy_Sub_Icon_" .. ii)
    ;
    (slot.iconBG):SetPosX(slotConfig._startX + slotConfig._gapX * ii)
    ;
    (slot.iconBG):SetPosY(slotConfig._startY)
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  self._static_BuyLineBG = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Static_BuyLineBG", Panel_IngameCashShop_BuyOrGift, "InGameShopBuy_Buy")
  self._static_PearlIcon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_PearlIcon", self._static_BuyLineBG, "InGameShopBuy_Buy_PearlPrice")
  self._static_Price = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_GoodsPrice", self._static_BuyLineBG, "InGameShopBuy_Buy_Price")
  self._static_BuyCountTitle = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_BuyCount", self._static_BuyLineBG, "InGameShopBuy_Buy_Count")
  self._edit_count = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Edit_BuyCount", self._static_BuyLineBG, "InGameShopBuy_Buy_EditCount")
  self._button_CountUp = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Button_CountPlus", self._static_BuyLineBG, "InGameShopBuy_Buy_ButtonPlus")
  self._button_CountDown = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Button_CountMinus", self._static_BuyLineBG, "InGameShopBuy_Buy_Button_Minus")
  ;
  (self._static_PearlIcon):SetShow(false)
  ;
  (self._static_Price):SetShow(false)
  ;
  (self._txt_PearlIconPrice):SetShow(true)
  ;
  (self._button_CountUp):addInputEvent("Mouse_LUp", "InGameShopBuy_Count( true )")
  ;
  (self._button_CountUp):SetAutoDisableTime(0)
  ;
  (self._button_CountDown):addInputEvent("Mouse_LUp", "InGameShopBuy_Count( false )")
  ;
  (self._button_CountDown):SetAutoDisableTime(0)
  ;
  (self._edit_count):addInputEvent("Mouse_LUp", "_InGameShopBuy_DontChangeCount()")
  ;
  (self._edit_count):SetEnable(false)
  ;
  (self._edit_count):SetNumberMode(true)
  ;
  (self._edit_count):SetEditText(1, false)
  self._static_CouponApplyBG = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_CouponApplyBG", Panel_IngameCashShop_BuyOrGift, "InGameShopBuy_CouponBG")
  self._txt_CouponApplyIcon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_CouponApplyIcon", self._static_CouponApplyBG, "InGameShopBuy_CouponIcon")
  ;
  (self._txt_CouponApplyIcon):SetPosX(0)
  ;
  (self._txt_CouponApplyIcon):SetPosY(0)
  ;
  (self._static_GiftListBG):SetPosY(180)
  ;
  (self._static_GiftListBG):SetSize((self._static_GiftListBG):GetSizeX(), 375)
  ;
  (self._static_GiftListTopBG):SetPosY(185)
  ;
  (self._static_GiftListTopBG):SetSize((self._static_GiftListTopBG):GetSizeX(), 145)
  ;
  (self._static_GiftListTopBG):addInputEvent("Mouse_UpScroll", "Scroll_GiftTopList( true )")
  ;
  (self._static_GiftListTopBG):addInputEvent("Mouse_DownScroll", "Scroll_GiftTopList( false )")
  for giftIdx = 0, (self._config)._giftTopListMaxCount - 1 do
    local slot = {}
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_GiftListName", self._static_GiftListTopBG, "GiftTopListName_" .. giftIdx)
    slot.count = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Edit_GiftListBuyCount", slot.name, "GiftTopListCountBox_" .. giftIdx)
    slot.btnPlus = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Button_GiftListCountPlus", slot.count, "GiftTopList_BtnPlus_" .. giftIdx)
    slot.btnMinus = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Button_GiftListCountMinus", slot.count, "GiftTopList_BtnMinus_" .. giftIdx)
    slot.btnDelete = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Button_GiftListDelete", slot.count, "GiftTopList_BtnDelete_" .. giftIdx)
    ;
    (slot.name):SetSpanSize(10, 5 + (5 + (slot.name):GetSizeY() * giftIdx))
    ;
    (slot.count):SetSpanSize(252, -2)
    ;
    (slot.btnPlus):SetSpanSize((slot.count):GetSizeX() + 3, 5)
    ;
    (slot.btnMinus):SetSpanSize(((slot.btnPlus):GetSpanSize()).x + (slot.btnMinus):GetSizeX() + 2, 5)
    ;
    (slot.btnDelete):SetSpanSize(((slot.btnMinus):GetSpanSize()).x + (slot.btnDelete):GetSizeX() + 2, 5)
    ;
    (slot.btnPlus):SetAutoDisableTime(0)
    ;
    (slot.btnMinus):SetAutoDisableTime(0)
    ;
    (slot.btnDelete):SetAutoDisableTime(0)
    ;
    (slot.count):SetIgnore(true)
    ;
    (slot.name):addInputEvent("Mouse_UpScroll", "Scroll_GiftTopList( true )")
    ;
    (slot.name):addInputEvent("Mouse_DownScroll", "Scroll_GiftTopList( false )")
    ;
    (slot.count):addInputEvent("Mouse_UpScroll", "Scroll_GiftTopList( true )")
    ;
    (slot.count):addInputEvent("Mouse_DownScroll", "Scroll_GiftTopList( false )")
    ;
    (slot.btnPlus):addInputEvent("Mouse_UpScroll", "Scroll_GiftTopList( true )")
    ;
    (slot.btnPlus):addInputEvent("Mouse_DownScroll", "Scroll_GiftTopList( false )")
    ;
    (slot.btnMinus):addInputEvent("Mouse_UpScroll", "Scroll_GiftTopList( true )")
    ;
    (slot.btnMinus):addInputEvent("Mouse_DownScroll", "Scroll_GiftTopList( false )")
    ;
    (slot.btnDelete):addInputEvent("Mouse_UpScroll", "Scroll_GiftTopList( true )")
    ;
    (slot.btnDelete):addInputEvent("Mouse_DownScroll", "Scroll_GiftTopList( false )")
    -- DECOMPILER ERROR at PC375: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self.giftTopList)[giftIdx] = slot
  end
  Panel_IngameCashShop_BuyOrGift:RemoveControl(self._scroll_GiftTopList)
  Panel_IngameCashShop_BuyOrGift:RemoveControl(self._static_GiftList_NonUser)
  ;
  (self._static_GiftListTopBG):AddChild(self._scroll_GiftTopList)
  ;
  (self._static_GiftListTopBG):AddChild(self._static_GiftList_NonUser)
  ;
  (self._static_GiftList_NonUser):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._static_GiftList_NonUser):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_INGAMECASHSHOP_BUYORGIFT_NONUSER"))
  ;
  (self._scroll_GiftTopList):SetSize((self._scroll_GiftTopList):GetSizeX(), (self._static_GiftListTopBG):GetSizeY() - 10)
  ;
  (self._scroll_GiftTopList):ComputePos()
  ;
  (self._static_GiftListBotBG):SetPosY(335)
  ;
  (self._static_GiftListBotBG):SetSize((self._static_GiftListBotBG):GetSizeX(), 175)
  ;
  (self._static_GiftListBotBG):addInputEvent("Mouse_UpScroll", "Scroll_GiftBotList( true )")
  ;
  (self._static_GiftListBotBG):addInputEvent("Mouse_DownScroll", "Scroll_GiftBotList( false )")
  for giftBotIdx = 0, (self._config)._giftBotListMaxCount - 1 do
    local slot = {}
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_GiftListName", self._static_GiftListBotBG, "GiftBotListName_" .. giftBotIdx)
    slot.btnAdd = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop_BuyOrGift, "Button_AddList", slot.name, "GiftBotListAddList_" .. giftBotIdx)
    ;
    (slot.name):SetSpanSize(10, 35 + (5 + (slot.name):GetSizeY() * giftBotIdx))
    ;
    (slot.btnAdd):SetSpanSize(307, -3)
    ;
    (slot.name):addInputEvent("Mouse_UpScroll", "Scroll_GiftBotList( true )")
    ;
    (slot.name):addInputEvent("Mouse_DownScroll", "Scroll_GiftBotList( false )")
    ;
    (slot.btnAdd):addInputEvent("Mouse_UpScroll", "Scroll_GiftBotList( true )")
    ;
    (slot.btnAdd):addInputEvent("Mouse_DownScroll", "Scroll_GiftBotList( false )")
    -- DECOMPILER ERROR at PC503: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self.giftBotList)[giftBotIdx] = slot
  end
  Panel_IngameCashShop_BuyOrGift:RemoveControl(self._buttonFriendList)
  Panel_IngameCashShop_BuyOrGift:RemoveControl(self._buttonGuildList)
  Panel_IngameCashShop_BuyOrGift:RemoveControl(self._scroll_GiftBotList)
  ;
  (self._static_GiftListBotBG):AddChild(self._buttonFriendList)
  ;
  (self._static_GiftListBotBG):AddChild(self._buttonGuildList)
  ;
  (self._static_GiftListBotBG):AddChild(self._scroll_GiftBotList)
  ;
  (self._scroll_GiftBotList):SetSize((self._scroll_GiftBotList):GetSizeX(), (self._static_GiftListBotBG):GetSizeY() - 55)
  ;
  (self._buttonFriendList):ComputePos()
  ;
  (self._buttonGuildList):ComputePos()
  ;
  (self._scroll_GiftBotList):ComputePos()
  ;
  (self._txt_PearlIconPrice):SetPosX(0)
  ;
  (self._txt_PearlIconPrice):SetPosY(0)
  self._radioButtonSelectPearl = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "Radiobutton_InmyPearl")
  self._radioButtonSelectStamp = (UI.getChildControl)(self._static_selectStampBG, "Radiobutton_InmyStampCoupon")
  self._pearlStampCount = (UI.getChildControl)(Panel_IngameCashShop_BuyOrGift, "StaticText_PearlStamp")
  ;
  (self._pearlStampCount):SetShow(false)
  self.savedProductCount = 1
end

  inGameShopBuy.registMessageHandler = function(self)
  -- function num : 0_1
  (self._button_Close):addInputEvent("Mouse_LUp", "InGameShopBuy_Close()")
  ;
  (self._button_Confirm):addInputEvent("Mouse_LUp", "InGameShopBuy_ConfirmMSG()")
  ;
  (self._button_Cancle):addInputEvent("Mouse_LUp", "InGameShopBuy_Close()")
  ;
  (self._button_AddUser):addInputEvent("Mouse_LUp", "InGameShopBuy_CheckAddUser()")
  ;
  (self._edit_Gift):addInputEvent("Mouse_LUp", "HandelClicked_InGameShopBuy_SetAddUser()")
  ;
  (self._buttonFriendList):addInputEvent("Mouse_LUp", "HandelClicked_InGameShopBuy_FriendGuild()")
  ;
  (self._buttonGuildList):addInputEvent("Mouse_LUp", "HandelClicked_InGameShopBuy_FriendGuild()")
end

  inGameShopBuy.registEventHandler = function(self)
  -- function num : 0_2
  registerEvent("FromClient_NotifyCompleteBuyProduct", "FromClient_NotifyCompleteBuyProduct")
  registerEvent("FromClient_IncashshopGetUserNickName", "FromClient_IncashshopGetUserNickName")
end

  inGameShopBuy.update = function(self, isCouponApply)
  -- function num : 0_3 , upvalues : UI_color, UI_TM, inGameShopBuy
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  if cashProduct == nil then
    return 
  end
  ;
  (self._static_Price):SetLineRender(false)
  ;
  (self._txt_PearlIconPrice):SetLineRender(false)
  ;
  (self._static_DiscountPrice):SetShow(false)
  ;
  (self._txt_DiscountDirection):SetShow(false)
  ;
  (self._static_CouponApplyBG):SetShow(false)
  ;
  (self._txt_CouponApplyIcon):SetShow(false)
  ;
  (self._txt_PearlIconPrice):SetFontColor(UI_color.C_FFEFEFEF)
  self.savedCouponApply = isCouponApply
  ;
  (self._static_ItemIcon):ChangeTextureInfoName("Icon/" .. cashProduct:getIconPath())
  ;
  (self._static_ItemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
  local sumPrice = cashProduct:getPrice() * toInt64(0, self.savedProductCount)
  ;
  (self._static_ItemName):SetText(cashProduct:getName())
  ;
  (self._static_Price):SetText(makeDotMoney(sumPrice))
  ;
  (self._txt_PearlIconPrice):SetText(makeDotMoney(sumPrice))
  InGameShopBuy_ChangeMoneyIconTexture(cashProduct:getMainCategory(), cashProduct:isMoneyPrice())
  for ii = 0, self._slotCount - 1 do
    local slot = (self._slots)[ii]
    ;
    (slot.iconBG):SetShow(false)
  end
  local itemListCount = cashProduct:getItemListCount()
  for ii = 0, itemListCount - 1 do
    local slot = (self._slots)[ii]
    local item = cashProduct:getItemByIndex(ii)
    local itemCount = cashProduct:getItemCountByIndex(ii)
    local itemGrade = item:getGradeType()
    ;
    (slot.icon):ChangeTextureInfoName("icon/" .. item:getIconPath())
    ;
    (slot.icon):addInputEvent("Mouse_On", "InGameShopBuy_ShowItemToolTip( true, " .. ii .. " )")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "InGameShopBuy_ShowItemToolTip( false, " .. ii .. " )")
    ;
    (slot.icon):SetText(tostring(itemCount))
    ;
    (slot.iconBG):SetShow(true)
  end
  local subItemListCount = itemListCount + cashProduct:getSubItemListCount()
  for ii = itemListCount, subItemListCount - 1 do
    local slot = (self._slots)[ii]
    local item = cashProduct:getSubItemByIndex(ii - itemListCount)
    local itemCount = cashProduct:getSubItemCountByIndex(ii - itemListCount)
    local itemGrade = item:getGradeType()
    ;
    (slot.icon):ChangeTextureInfoName("icon/" .. item:getIconPath())
    ;
    (slot.icon):addInputEvent("Mouse_On", "InGameShopBuy_ShowSubItemToolTip( true, " .. ii - itemListCount .. " )")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "InGameShopBuy_ShowSubItemToolTip( false, " .. ii - itemListCount .. " )")
    ;
    (slot.icon):SetText(tostring(itemCount))
    ;
    (slot.iconBG):SetShow(true)
  end
  local giftGap = 0
  ;
  (self._static_Gift):SetShow(false)
  ;
  (self._edit_Gift):SetShow(false)
  if self._isGift then
    (self._static_Gift):SetShow(true)
    ;
    (self._edit_Gift):SetShow(true)
    ;
    (self._edit_Gift):SetIgnore(false)
    ;
    (self._edit_Gift):SetEnable(true)
    ;
    (self._edit_Gift):SetDisableColor(false)
    giftGap = (self._config)._sizeGift
  end
  local buyConfig = (self._config)._buy
  ;
  (self._static_BuyLineBG):SetPosX(buyConfig._startX)
  ;
  (self._static_BuyLineBG):SetPosY(buyConfig._startY + buyConfig._gapX + 10)
  if self._isGift then
    (self._static_BuyLineBG):SetShow(false)
    ;
    (self._static_LeftBG):SetSize((self._static_LeftBG):GetSizeX(), 130)
    Panel_IngameCashShop_BuyOrGift:SetSize(Panel_IngameCashShop_BuyOrGift:GetSizeX(), 600)
    ;
    (self._static_GiftListBG):SetShow(true)
    ;
    (self._static_GiftListTopBG):SetShow(true)
    ;
    (self._static_GiftListBotBG):SetShow(true)
    ;
    (self._button_AddUser):SetShow(true)
    ;
    (self._static_PearlBG):SetShow(false)
    ;
    (self._txt_PearlIconPrice):SetShow(false)
    ;
    (self._static_PearlIcon):SetShow(false)
    ;
    (self._static_selectStampBG):SetShow(false)
    inGameShopBuy:AddedListUpdate()
    inGameShopBuy:UserListUpdate()
  else
    ;
    (self._static_BuyLineBG):SetShow(true)
    ;
    (self._static_LeftBG):SetSize((self._static_LeftBG):GetSizeX(), buyConfig._startY + buyConfig._gapX)
    ;
    (self._static_PearlBG):SetPosY(210)
    if isCouponApply then
      (self._static_PearlBG):SetSize((self._static_GiftListBG):GetSizeX(), 70)
    else
      ;
      (self._static_PearlBG):SetSize((self._static_GiftListBG):GetSizeX(), 30)
    end
    ;
    (self._static_CouponApplyBG):SetPosY((self._static_PearlBG):GetPosY() + 10)
    ;
    (self._txt_CouponApplyIcon):ComputePos()
    local couponBGSizeX = (self._static_CouponApplyBG):GetSizeX()
    Panel_IngameCashShop_BuyOrGift:SetSize(Panel_IngameCashShop_BuyOrGift:GetSizeX(), buyConfig._startY + buyConfig._gapX + (self._config)._sizePanel + (self._static_PearlBG):GetSizeY() + giftGap + 20)
    local pearlIconPriceByCoupon = (self._static_PearlBG):GetPosY() + (self._static_PearlBG):GetSizeY() / 2 - (self._txt_PearlIconPrice):GetSizeY() / 2
    ;
    (self._static_PearlBG):SetShow(true)
    ;
    (self._static_GiftListBG):SetShow(false)
    ;
    (self._static_GiftListTopBG):SetShow(false)
    ;
    (self._static_GiftListBotBG):SetShow(false)
    ;
    (self._button_AddUser):SetShow(false)
    ;
    (self._txt_PearlIconPrice):SetShow(true)
    self.savedCouponDiscountTextSizeX = 0
    if isCouponApply and isCouponApply ~= nil then
      local couponIndex = FGlobal_IngameCashShopCoupon_ReturnValue()
      local couponWrapper = ToClient_GetCouponInfoWrapper(couponIndex)
      if couponWrapper == nil then
        return 
      end
      local couponName = couponWrapper:getCouponName()
      local couponDiscountRate = couponWrapper:getCouponDisCountRate()
      local couponDiscountPearl = couponWrapper:getCouponDisCountPearl()
      local couponState = couponWrapper:getCouponState()
      local couponCategoryCheck = couponWrapper:checkCategory(cashProduct:getMainCategory(), cashProduct:getMiddleCategory(), cashProduct:getSmallCategory())
      local couponMaxDiscount = couponWrapper:getCouponMaxDisCountPearl()
      local couponMinProductPearl = couponWrapper:getCouponMinProductPearl()
      local isDiscountPearl = couponWrapper:isDisCountPearl()
      if not couponCategoryCheck and Panel_IngameCashShop_BuyOrGift:GetShow() then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_UNABLECOUPON"))
        ;
        (self._static_PearlBG):SetSize((self._static_GiftListBG):GetSizeX(), 30)
        Panel_IngameCashShop_BuyOrGift:SetSize(Panel_IngameCashShop_BuyOrGift:GetSizeX(), buyConfig._startY + buyConfig._gapX + (self._config)._sizePanel + (self._static_PearlBG):GetSizeY() + giftGap + 20)
        local pearIconTextPosX = couponBGSizeX - couponBGSizeX / 2 - (self._txt_PearlIconPrice):GetTextSizeX() / 2
        ;
        (self._txt_PearlIconPrice):SetPosX(pearIconTextPosX)
        local couponCheckPearlIcon = (self._static_PearlBG):GetPosY() + (self._static_PearlBG):GetSizeY() / 2 - (self._txt_PearlIconPrice):GetSizeY() / 2
        ;
        (self._txt_PearlIconPrice):SetPosY(couponCheckPearlIcon)
        ;
        (self._button_Confirm):ComputePos()
        ;
        (self._button_Cancle):ComputePos()
        return 
      end
      do
        self.savedCouponDiscountRate = couponDiscountRate
        ;
        (self._static_Price):SetLineRender(couponState == 0 or couponState == 1)
        ;
        (self._txt_PearlIconPrice):SetLineRender(couponState == 0 or couponState == 1)
        ;
        (self._txt_PearlIconPrice):SetFontColor(UI_color.C_FFC4BEBE)
        ;
        (self._static_DiscountPrice):SetShow(true)
        ;
        (self._txt_DiscountDirection):SetShow(true)
        do
          local couponDiscountValue = nil
          if isDiscountPearl == false then
            self.savedProductCount = 1
            couponDiscountValue = cashProduct:getPrice() * toInt64(0, couponDiscountRate / 10000) / toInt64(0, 100)
            if toInt64(0, 0) < couponMaxDiscount then
              if couponMaxDiscount < couponDiscountValue then
                (self._static_DiscountPrice):SetText(tostring(cashProduct:getPrice() - couponMaxDiscount))
                ;
                (self._txt_CouponApplyIcon):SetText(tostring(couponName) .. PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_LIMITMAXSALE"))
              else
                (self._static_DiscountPrice):SetText(tostring(cashProduct:getPrice() - cashProduct:getPrice() * toInt64(0, couponDiscountRate / 10000) / toInt64(0, 100)))
                ;
                (self._txt_CouponApplyIcon):SetText(tostring(couponName))
              end
            else
              (self._static_DiscountPrice):SetText(tostring(cashProduct:getPrice() - cashProduct:getPrice() * toInt64(0, couponDiscountRate / 10000) / toInt64(0, 100)))
              ;
              (self._txt_CouponApplyIcon):SetText(tostring(couponName))
            end
            ;
            (self._static_Price):SetText(makeDotMoney(cashProduct:getPrice()))
            ;
            (self._txt_PearlIconPrice):SetText(makeDotMoney(cashProduct:getPrice()))
            ;
            (self._edit_count):SetEditText(1, false)
          else
            local productPrice = cashProduct:getPrice() * toInt64(0, self.savedProductCount)
            couponDiscountValue = productPrice - couponDiscountPearl
            if couponDiscountValue <= toInt64(0, 0) then
              couponDiscountValue = ToClient_MinCashProductPriceCoupon()
            end
            ;
            (self._static_DiscountPrice):SetText(tostring(couponDiscountValue))
            ;
            (self._txt_CouponApplyIcon):SetText(tostring(couponName))
          end
          ;
          (self._txt_CouponApplyIcon):SetShow(true)
          ;
          (self._static_CouponApplyBG):SetShow(true)
          self.savedCouponDiscountTextSizeX = (self._static_DiscountPrice):GetTextSizeX() + 30
          pearlIconPriceByCoupon = (self._static_CouponApplyBG):GetPosY() + (self._static_CouponApplyBG):GetSizeY() / 2 + (self._txt_PearlIconPrice):GetSizeY()
          local couponIconTextPosX = couponBGSizeX - couponBGSizeX / 2 - (self._txt_CouponApplyIcon):GetTextSizeX() / 2 - 25
          ;
          (self._txt_CouponApplyIcon):SetPosX(couponIconTextPosX)
          ;
          (self._txt_DiscountDirection):SetPosY(pearlIconPriceByCoupon + 7)
          do
            do
              local pearIconTextPosX = couponBGSizeX - couponBGSizeX / 2 - (self._txt_PearlIconPrice):GetTextSizeX() / 2 - self.savedCouponDiscountTextSizeX
              ;
              (self._txt_PearlIconPrice):SetPosX(pearIconTextPosX)
              ;
              (self._txt_PearlIconPrice):SetPosY(pearlIconPriceByCoupon)
              ;
              (self._static_DiscountPrice):SetPosX((self._txt_PearlIconPrice):GetPosX() + (self._txt_PearlIconPrice):GetTextSizeX() + (self._static_DiscountPrice):GetTextSizeX() + 60)
              ;
              (self._static_DiscountPrice):SetPosY(pearlIconPriceByCoupon)
              ;
              (self._static_selectStampBG):SetShow(true)
              FGlobal_IngameCashShop_BuyOrGift_SetPearlStampValue(cashProduct:getPrice(), cashProduct:getMainCategory())
              ;
              (self._static_Gift):ComputePos()
              ;
              (self._edit_Gift):ComputePos()
              ;
              (self._button_AddUser):ComputePos()
              ;
              (self._button_Confirm):ComputePos()
              ;
              (self._button_Cancle):ComputePos()
              -- DECOMPILER ERROR: 10 unprocessed JMP targets
            end
          end
        end
      end
    end
  end
end

  FGlobal_IngameCashShop_BuyOrGift_SetPearlStampValue = function(price, moneyType)
  -- function num : 0_4 , upvalues : inGameShopBuy, isOpenPearlStamp, UI_CCC
  local self = inGameShopBuy
  local stampCount = ToClient_GetUsealbeStampCount(price)
  local userStampCount = ToClient_GetPearlStampCount()
  local buyConfig = (self._config)._buy
  if self._isGift == true then
    (self._radioButtonSelectPearl):SetCheck(false)
    ;
    (self._radioButtonSelectStamp):SetCheck(false)
    ;
    (self._static_selectStampBG):SetShow(false)
    ;
    (self._pearlStampCount):SetShow(false)
    Panel_IngameCashShop_BuyOrGift:SetSize(Panel_IngameCashShop_BuyOrGift:GetSizeX(), buyConfig._startY + buyConfig._gapX + (self._config)._sizePanel + (self._static_PearlBG):GetSizeY() + giftGap + 20)
    return 
  end
  if (self._static_CouponApplyBG):GetShow() == false and stampCount <= userStampCount and isOpenPearlStamp == true and moneyType ~= UI_CCC.eCashProductCategory_Pearl and moneyType ~= UI_CCC.eCashProductCategory_Mileage then
    (self._static_selectStampBG):SetShow(true)
    local pearlIconPriceByCoupon = (self._static_PearlBG):GetPosY() + (self._static_PearlBG):GetSizeY() / 2 - (self._txt_PearlIconPrice):GetSizeY() / 2
    local stampBgPosY = pearlIconPriceByCoupon + (self._static_selectStampBG):GetSizeY()
    ;
    (self._static_selectStampBG):SetPosY(pearlIconPriceByCoupon)
    local selectpearlPos = (self._radioButtonSelectPearl):GetPosY()
    ;
    (self._static_selectStampBG):SetPosY(stampBgPosY)
    ;
    (self._radioButtonSelectPearl):SetShow(true)
    ;
    (self._radioButtonSelectPearl):SetCheck(true)
    ;
    (self._radioButtonSelectPearl):SetPosY((self._txt_PearlIconPrice):GetPosY())
    ;
    (self._radioButtonSelectPearl):SetPosX(20)
    ;
    (self._radioButtonSelectStamp):SetPosX(10)
    ;
    (self._radioButtonSelectStamp):SetCheck(false)
    ;
    (self._pearlStampCount):SetShow(true)
    ;
    (self._pearlStampCount):SetPosX((self._txt_PearlIconPrice):GetPosX() + (self._static_StampIcon):GetSizeX() + 10)
    ;
    (self._pearlStampCount):SetPosY(stampBgPosY + 7)
    ;
    (self._pearlStampCount):SetText(tostring(stampCount))
    ;
    (self._static_StampIcon):SetShow(true)
    ;
    (self._static_StampIcon):SetPosY(stampBgPosY + 7)
    ;
    (self._static_StampIcon):SetPosX((self._txt_PearlIconPrice):GetPosX())
    Panel_IngameCashShop_BuyOrGift:SetSize(Panel_IngameCashShop_BuyOrGift:GetSizeX(), buyConfig._startY + buyConfig._gapX + (self._config)._sizePanel + (self._static_PearlBG):GetSizeY() + 20 + (self._static_selectStampBG):GetSizeY())
    self._usePearlStampCount = stampCount
  else
    do
      ;
      (self._static_StampIcon):SetShow(false)
      ;
      (self._static_selectStampBG):SetShow(false)
      ;
      (self._radioButtonSelectPearl):SetShow(false)
      ;
      (self._pearlStampCount):SetShow(false)
      ;
      (self._radioButtonSelectPearl):SetCheck(false)
      ;
      (self._radioButtonSelectStamp):SetCheck(false)
      Panel_IngameCashShop_BuyOrGift:SetSize(Panel_IngameCashShop_BuyOrGift:GetSizeX(), buyConfig._startY + buyConfig._gapX + (self._config)._sizePanel + (self._static_PearlBG):GetSizeY() + 20)
      self._usePearlStampCount = -1
      ;
      (self._static_Gift):ComputePos()
      ;
      (self._edit_Gift):ComputePos()
      ;
      (self._button_AddUser):ComputePos()
      ;
      (self._button_Confirm):ComputePos()
      ;
      (self._button_Cancle):ComputePos()
    end
  end
end

  FGlobal_IngameCashShop_BuyOrGift_ReturnCategoryValue = function()
  -- function num : 0_5 , upvalues : inGameShopBuy
  local self = inGameShopBuy
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  if cashProduct == nil then
    return 
  end
  return cashProduct:getMainCategory()
end

  FGlobal_IngameShopBuy_Update = function(isCouponApply)
  -- function num : 0_6
  InGameShopBuy_ResetCount(isCouponApply)
end

  inGameShopBuy.AddedListUpdate = function(self)
  -- function num : 0_7
  for giftIdx = 0, (self._config)._giftTopListMaxCount - 1 do
    local slot = (self.giftTopList)[giftIdx]
    ;
    (slot.name):SetShow(false)
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._config)._giftTopListCount = (getIngameCashMall()):getGiftListCount()
  local uiIdx = 0
  for idx = (self._config)._giftTopListStart, (self._config)._giftTopListCount - 1 do
    if uiIdx <= (self._config)._giftTopListMaxCount - 1 then
      local slot = (self.giftTopList)[uiIdx]
      local data = (getIngameCashMall()):getGiftList(idx)
      ;
      (slot.name):SetShow(true)
      ;
      (slot.name):SetText(data:getName())
      ;
      (slot.count):SetEditText(data:getCount(), true)
      ;
      (slot.btnPlus):addInputEvent("Mouse_LUp", "HandleClicked_InGameShop_ChangeGiftCount( true, " .. idx .. " )")
      ;
      (slot.btnMinus):addInputEvent("Mouse_LUp", "HandleClicked_InGameShop_ChangeGiftCount( false, " .. idx .. " )")
      ;
      (slot.btnDelete):addInputEvent("Mouse_LUp", "HandleClicked_InGameShop_DeleteGiftList( " .. idx .. " )")
      uiIdx = uiIdx + 1
    end
    do
      do
        ;
        (UIScroll.SetButtonSize)(self._scroll_GiftTopList, (self._config)._giftTopListMaxCount, (self._config)._giftTopListCount)
        -- DECOMPILER ERROR at PC87: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  ;
  (self._static_GiftList_NonUser):SetShow(false)
  if (self._config)._giftTopListCount <= 0 then
    (self._static_GiftList_NonUser):SetShow(true)
  end
  if (self._config)._giftBotListMaxCount < (self._config)._giftTopListCount then
    (self._scroll_GiftTopList):SetShow(true)
  else
    ;
    (self._scroll_GiftTopList):SetShow(false)
  end
end

  inGameShopBuy.UserListUpdate = function(self)
  -- function num : 0_8 , upvalues : giftSendType
  for giftBotIdx = 0, (self._config)._giftBotListMaxCount - 1 do
    local slot = (self.giftBotList)[giftBotIdx]
    ;
    (slot.name):SetShow(false)
  end
  self.giftUserList = {}
  local userCount = 0
  local isFriend = (self._buttonFriendList):IsCheck()
  if isFriend then
    local friendGroupCount = nil
    friendGroupCount = RequestFriends_getFriendGroupCount()
    for groupIndex = 0, friendGroupCount - 1 do
      local friendGroup = nil
      friendGroup = RequestFriends_getFriendGroupAt(groupIndex)
      local friendCount = friendGroup:getFriendCount()
      for friendIndex = 0, friendCount - 1 do
        local friendInfo = friendGroup:getFriendAt(friendIndex)
        local friendName = friendInfo:getName()
        if friendInfo:isOnline() then
          do
            do
              local s64_lastLogoutTime = friendInfo:getLastLogoutTime_s64()
              friendName = friendName .. "(" .. convertStringFromDatetimeOverHour(s64_lastLogoutTime) .. ")"
              -- DECOMPILER ERROR at PC70: Confused about usage of register: R16 in 'UnsetPending'

              ;
              (self.giftUserList)[userCount] = {name = friendInfo:getName(), userNo = friendInfo:getUserNo(), sendType = giftSendType.userNo}
              userCount = userCount + 1
              -- DECOMPILER ERROR at PC72: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC72: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC72: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  else
    do
      local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
      do
        if myGuildListInfo ~= nil then
          local memberCount = myGuildListInfo:getMemberCount()
          for index = 0, memberCount - 1 do
            local myGuildMemberInfo = myGuildListInfo:getMember(index)
            if myGuildMemberInfo ~= nil and not myGuildMemberInfo:isSelf() then
              local guildMemberName = ""
              if myGuildMemberInfo:isOnline() == true then
                guildMemberName = myGuildMemberInfo:getName()
              else
                local s64_lastLogoutTime = myGuildMemberInfo:getElapsedTimeAfterLogOut_s64()
                guildMemberName = myGuildMemberInfo:getName() .. "(" .. convertStringFromDatetimeOverHour(s64_lastLogoutTime) .. ")"
              end
              do
                do
                  -- DECOMPILER ERROR at PC124: Confused about usage of register: R11 in 'UnsetPending'

                  ;
                  (self.giftUserList)[userCount] = {name = myGuildMemberInfo:getName(), userNo = myGuildMemberInfo:getUserNo(), sendType = giftSendType.userNo}
                  userCount = userCount + 1
                  -- DECOMPILER ERROR at PC126: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC126: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC126: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
        -- DECOMPILER ERROR at PC128: Confused about usage of register: R3 in 'UnsetPending'

        ;
        (self._config)._giftBotListCount = userCount
        local uiIdx = 0
        for idx = (self._config)._giftBotListStart, (self._config)._giftBotListCount - 1 do
          if uiIdx <= (self._config)._giftBotListMaxCount - 1 then
            local slot = (self.giftBotList)[uiIdx]
            local data = (self.giftUserList)[idx]
            ;
            (slot.name):SetShow(true)
            ;
            (slot.name):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PANEL_INGAMECASHSHOP_BUYORGIFT_NAME_HAEDKEYWORD", "name", data.name))
            ;
            (slot.btnAdd):addInputEvent("Mouse_LUp", "HandleClicked_AddGiftTopList( " .. idx .. " )")
            uiIdx = uiIdx + 1
          end
          do
            do
              ;
              (UIScroll.SetButtonSize)(self._scroll_GiftBotList, (self._config)._giftBotListMaxCount, (self._config)._giftBotListCount)
              -- DECOMPILER ERROR at PC177: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
        if (self._config)._giftBotListMaxCount - 1 < #self.giftUserList then
          (self._scroll_GiftBotList):SetShow(true)
        else
          ;
          (self._scroll_GiftBotList):SetShow(false)
        end
      end
    end
  end
end

  inGameShopBuy.defaultPosition = function(self)
  -- function num : 0_9
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_IngameCashShop_BuyOrGift:GetSizeX()
  local panelSizeY = Panel_IngameCashShop_BuyOrGift:GetSizeY()
  Panel_IngameCashShop_BuyOrGift:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_IngameCashShop_BuyOrGift:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

  InGameShopBuy_ConfirmMSG = function()
  -- function num : 0_10 , upvalues : inGameShopBuy
  if not inGameShopBuy._isGift then
    InGameShopBuy_CouponCheck_BeforeConfirm()
    return 
  end
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(inGameShopBuy._productNoRaw)
  if cashProduct == nil then
    return 
  end
  local userCount = (inGameShopBuy._config)._giftTopListCount
  do
    if userCount <= 0 then
      local msg = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_INGAMECASHSHOP_BUYORGIFT_MUST_SELECT_USER")
      Proc_ShowMessage_Ack(msg)
      return 
    end
    local messageBoxtitle = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
    local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_PANEL_INGAMECASHSHOP_BUYORGIFT_GIFT_CONFIRM", "countUser", userCount, "itemName", cashProduct:getName())
    local messageBoxData = {title = messageBoxtitle, content = messageBoxMemo, functionYes = InGameShopBuy_Confirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "middle")
  end
end

  InGameShopBuy_CouponCheck_BeforeConfirm = function()
  -- function num : 0_11
  if FGlobal_IngameCashShopCoupon_ReturnValue() == nil and Panel_IngameCashShop_Coupon:GetShow() == true then
    local messageBoxtitle = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_INGAMECASHSHOP_ALERTCOUPON")
    local messageBoxData = {title = messageBoxtitle, content = messageBoxMemo, functionYes = InGameShopBuy_Confirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "middle")
    return 
  end
  do
    InGameShopBuy_Confirm()
  end
end

  InGameShopBuy_Confirm = function()
  -- function num : 0_12 , upvalues : inGameShopBuy, UI_CCC
  local self = inGameShopBuy
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  if cashProduct == nil then
    return 
  end
  local count = (self._edit_count):GetEditText()
  if not self._isGift then
    local pearStampCount = -1
    if (self._radioButtonSelectStamp):IsCheck() and self._usePearlStampCount > 0 then
      pearStampCount = self._usePearlStampCount
    end
    local haveCash, havePearl, haveMileage, money = InGameShop_UpdateCash()
    local isEnoughMoney = false
    if cashProduct:getPrice() * toInt64(0, count) > haveCash then
      isEnoughMoney = UI_CCC.eCashProductCategory_Pearl ~= cashProduct:getMainCategory()
      if cashProduct:getPrice() * toInt64(0, count) > haveMileage then
        do
          do
            isEnoughMoney = UI_CCC.eCashProductCategory_Mileage ~= cashProduct:getMainCategory()
            isEnoughMoney = true
            _InGameShopBuy_Confirm_EnoughMoney(pearStampCount)
            _InGameShopBuy_Confirm_EnoughMoneyForGift()
            InGameShopDetailInfo_Close()
            InGameShopBuy_Close(true)
            -- DECOMPILER ERROR: 7 unprocessed JMP targets
          end
        end
      end
    end
  end
end

  InGameShopBuy_GiftMyFriend = function()
  -- function num : 0_13
  PaymentPassword(FGlobal_InGameShopBuy_Gift)
end

  _InGameShopBuy_Confirm_LackMoney = function(category)
  -- function num : 0_14 , upvalues : inGameShopBuy, isNaver
  local self = inGameShopBuy
  if (CppEnums.CashProductCategory).eCashProductCategory_Mileage == category then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_LACKMONEY_ACK"))
    return 
  end
  self._needMoneyType = category
  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_ALERT")
  local messageBoxMemo = ""
  local moneyType = ""
  if (CppEnums.CashProductCategory).eCashProductCategory_Pearl == category then
    moneyType = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_DAUMCASH")
    if isNaver then
      moneyType = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_INGAMECASHSHOP_NAVERCASH")
    end
    if isGameTypeTR() then
      moneyType = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_DAUMCASH_TR")
    else
      if isGameTypeTH() then
        moneyType = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_DAUMCASH_TH")
      else
        if isGameTypeID() then
          moneyType = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_DAUMCASH_ID")
        end
      end
    end
  else
    if (CppEnums.CashProductCategory).eCashProductCategory_Mileage == category then
      moneyType = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_MILEAGE")
    else
      moneyType = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_PEARL")
    end
  end
  messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_MSGBOX", "moneyType", moneyType, "moneyType2", moneyType)
  local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = _InGameShopBuy_BuyMoney, functionNo = _InGameShopBuy_Confirm_Cancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

  _InGameShopBuy_BuyMoney = function()
  -- function num : 0_15 , upvalues : inGameShopBuy
  local self = inGameShopBuy
  local category = self._needMoneyType
  if (CppEnums.CashProductCategory).eCashProductCategory_Pearl == category then
    InGameShop_BuyDaumCash()
  else
    if (CppEnums.CashProductCategory).eCashProductCategory_Mileage == category then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_MILEAGE"))
    else
      InGameShop_BuyPearl()
    end
  end
end

  _InGameShopBuy_Confirm_EnoughMoneyForGift = function()
  -- function num : 0_16
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local isCreatePasword = selfPlayer:isPaymentPassword()
  if isCreatePasword == false then
    InGameShopBuy_GiftMyFriend()
  else
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_GIFTMYFRIEND")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionApply = InGameShopBuy_GiftMyFriend, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

  _InGameShopBuy_Confirm_EnoughMoney = function(pearlStampCount)
  -- function num : 0_17 , upvalues : inGameShopBuy, UI_PLT, UI_CCC
  local self = inGameShopBuy
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  if cashProduct == nil then
    return 
  end
  local limitType = cashProduct:getCashPurchaseLimitType()
  do
    if UI_PLT.None ~= limitType then
      local mylimitCount = (getIngameCashMall()):getRemainingLimitCount(self._productNoRaw)
      if mylimitCount < 1 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_PURCHASELIMIT"))
        return 
      end
    end
    local count = (self._edit_count):GetEditText()
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_ALERT")
    local messageBoxMemo = ""
    local messageBoxData = nil
    local addPearlComment = (PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_PURCHASELIMIT"))
    local mathClass = nil
    local addmathClassString = ""
    if cashProduct:doHaveDisplayClass() and not cashProduct:isClassTypeUsable((getSelfPlayer()):getClassType()) then
      mathClass = false
    else
      mathClass = true
    end
    if mathClass == false then
      addmathClassString = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_MATHCLASS")
    end
    local addpearlMsg = ""
    if pearlStampCount > -1 then
      self._isUsePearl = true
      addpearlMsg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_USE_PEARLSTAMP_DESC", "pearlCount", pearlStampCount)
    else
      self._isUsePearl = false
      self._usePearlStampCount = 0
    end
    if UI_CCC.eCashProductCategory_Pearl == cashProduct:getMainCategory() then
      messageBoxMemo = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_REALBUY", "addmathClassString", addmathClassString, "getName", cashProduct:getName(), "count", count) .. addPearlComment .. addpearlMsg
    else
      if self._easyBuy == true then
        messageBoxMemo = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_REALBUY", "addmathClassString", addmathClassString, "getName", cashProduct:getName(), "count", count) .. "\n\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_BUYORGIFT_EASYBUY") .. addpearlMsg
      else
        messageBoxMemo = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_REALBUY", "addmathClassString", addmathClassString, "getName", cashProduct:getName(), "count", count) .. "\n" .. addpearlMsg
      end
    end
    messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = InGameShopBuy_ConfirmDo, functionNo = _InGameShopBuy_Confirm_Cancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

  InGameShopBuy_ConfirmDo = function()
  -- function num : 0_18 , upvalues : inGameShopBuy
  audioPostEvent_SystemUi(16, 0)
  local self = inGameShopBuy
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  if cashProduct == nil then
    return 
  end
  local count = (self._edit_count):GetEditText()
  local couponIndex = FGlobal_IngameCashShopCoupon_ReturnValue()
  local couponKey = 0
  local couponNo = toInt64(0, -1)
  if couponIndex ~= nil then
    local couponWrapper = ToClient_GetCouponInfoWrapper(couponIndex)
    local isPossibleCouponAPply = couponWrapper:checkCategory(cashProduct:getMainCategory(), cashProduct:getMiddleCategory(), cashProduct:getSmallCategory())
    if couponWrapper ~= nil then
      couponKey = couponWrapper:getCouponKey()
      couponNo = couponWrapper:getCouponNo()
    end
  end
  do
    local isImmediatelyUse = false
    if self._easyBuy == true then
      isImmediatelyUse = (CppEnums.BuyItemReqTrType).eBuyItemReqTrType_ImmediatelyUse
      count = 1
    else
      isImmediatelyUse = (CppEnums.BuyItemReqTrType).eBuyItemReqTrType_None
    end
    local pearlCount = 0
    if self._isUsePearl == true then
      pearlCount = self._usePearlStampCount
      self._isUsePearl = false
    end
    ;
    (getIngameCashMall()):requestBuyItem(self._productNoRaw, count, cashProduct:getPrice(), isImmediatelyUse, couponNo, couponKey, pearlCount)
  end
end

  _InGameShopBuy_Confirm_Cancel = function()
  -- function num : 0_19
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_BUYCANCEL"))
  InGameShopBuy_Close()
end

  FGlobal_InGameShopBuy_Gift = function()
  -- function num : 0_20 , upvalues : inGameShopBuy
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(inGameShopBuy._productNoRaw)
  if cashProduct == nil then
    return 
  end
  ;
  (getIngameCashMall()):requestBuyGiftForList(inGameShopBuy._productNoRaw)
  ;
  (inGameShopBuy._scroll_GiftTopList):SetControlTop()
  inGameShopBuy:AddedListUpdate()
end

  InGameShopBuy_Count = function(isUp)
  -- function num : 0_21 , upvalues : inGameShopBuy, UI_color
  local self = inGameShopBuy
  local count = tonumber((self._edit_count):GetEditText())
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  if cashProduct == nil then
    return 
  end
  local price = cashProduct:getPrice()
  if not isUp then
    if count <= 1 then
      return 
    end
    count = count - 1
  else
    if count >= 20 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_OVER20"))
      return 
    end
    count = count + 1
  end
  self.savedProductCount = count
  local sumPrice = Int64toInt32(price) * (count)
  ;
  (self._static_PearlBG):SetSize((self._static_GiftListBG):GetSizeX(), 30)
  Panel_IngameCashShop_BuyOrGift:SetSize(Panel_IngameCashShop_BuyOrGift:GetSizeX(), ((self._config)._buy)._startY + ((self._config)._buy)._gapX + (self._config)._sizePanel + (self._static_PearlBG):GetSizeY() + 20)
  ;
  (self._static_Price):SetLineRender(false)
  ;
  (self._txt_PearlIconPrice):SetLineRender(false)
  ;
  (self._txt_PearlIconPrice):SetFontColor(UI_color.C_FFEFEFEF)
  ;
  (self._static_DiscountPrice):SetShow(false)
  ;
  (self._txt_DiscountDirection):SetShow(false)
  ;
  (self._static_CouponApplyBG):SetShow(false)
  ;
  (self._txt_CouponApplyIcon):SetShow(false)
  local couponBGSizeX = (self._static_CouponApplyBG):GetSizeX()
  local pearIconTextPosX = couponBGSizeX - couponBGSizeX / 2 - (self._txt_PearlIconPrice):GetTextSizeX() / 2
  ;
  (self._txt_PearlIconPrice):SetPosX(pearIconTextPosX)
  ;
  (self._txt_PearlIconPrice):SetPosY((self._static_PearlBG):GetPosY() + (self._static_PearlBG):GetSizeY() / 2 - (self._txt_PearlIconPrice):GetSizeY() / 2)
  ;
  (self._txt_PearlIconPrice):SetText(makeDotMoney(sumPrice))
  if Panel_IngameCashShop_Coupon:GetShow() == false then
    IngameCashShopCoupon_Open(0, self._productNoRaw, count)
  else
    FGlobal_IngameCashShopCoupon_RefreshList(self._productNoRaw, count)
    FGlobal_IngameCashShopCoupon_ReturnValueCancel()
  end
  FGlobal_IngameCashShop_BuyOrGift_SetPearlStampValue(sumPrice, cashProduct:getMainCategory())
  ;
  (self._static_Price):SetText(makeDotMoney(sumPrice))
  ;
  (self._edit_count):SetEditText(tostring(count), false)
  ;
  (self._button_Confirm):ComputePos()
  ;
  (self._button_Cancle):ComputePos()
  self:update()
end

  InGameShopBuy_ResetCount = function(isCouponApply)
  -- function num : 0_22 , upvalues : inGameShopBuy
  local self = inGameShopBuy
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
  if cashProduct == nil then
    return 
  end
  local couponIndex = FGlobal_IngameCashShopCoupon_ReturnValue()
  if couponIndex ~= nil and couponIndex > 0 then
    local count = 1
    local isDiscountPearl = false
    local couponWrapper = ToClient_GetCouponInfoWrapper(couponIndex)
    if couponWrapper ~= nil then
      isDiscountPearl = couponWrapper:isDisCountPearl()
      if isDiscountPearl == false then
        self.savedProductCount = count
        local sumPrice = Int64toInt32(price) * count
        FGlobal_IngameCashShopCoupon_RefreshList_KeepSelect(self._productNoRaw, count)
        FGlobal_IngameCashShop_BuyOrGift_SetPearlStampValue(sumPrice, cashProduct:getMainCategory())
      end
    end
  end
  do
    self:update(isCouponApply)
  end
end

  InGameShopBuy_ChangeMoneyIconTexture = function(categoryIdx, isEnableSilver)
  -- function num : 0_23 , upvalues : inGameShopBuy, contry, UI_CCC, cashIconType
  local self = inGameShopBuy
  local icon = self._static_PearlIcon
  icon = self._txt_PearlIconPrice
  local serviceContry, iconType = nil, nil
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
    cashIcon_changeTextureForList(icon, serviceContry, iconType)
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

  FromClient_NotifyCompleteBuyProduct = function(productNoRaw, isGift, toCharacterName)
  -- function num : 0_24
  local isPearlBox = false
  if isGift then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_NOTIFYCOMPLETEBUYPRODUCT_GIFT", "toCharacterName", toCharacterName))
  else
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
    local itemWrapper = cashProduct:getItemByIndex(0)
    isPearlBox = cashProduct:isPearlBox()
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_NOTIFYCOMPLETE_ACK"))
    FGlobal_CashShop_SetEquip_CouponEffectCheck()
    if (itemWrapper:get()):isCash() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_PEARLBAG"))
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CONFIRM_NORMALBAG"))
    end
  end
  do
    InGameShop_UpdateCash()
    FGlobal_InGameShop_UpdateByBuy()
    InGameShopBuy_Close()
    if isPearlBox then
      local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
      local pearlBoxName = cashProduct:getName()
      local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_BUYPEARLBOX", "pearlBoxName", pearlBoxName)
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_BUYPEARLBOX_TITLE"), content = messageBoxMemo, functionApply = FGlobal_InGameShop_OpenInventory, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  end
end

  _InGameShopBuy_DontChangeCount = function()
  -- function num : 0_25
  ClearFocusEdit()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_DONTCHANGECOUNT"))
  return 
end

  Scroll_GiftTopList = function(isUp)
  -- function num : 0_26 , upvalues : inGameShopBuy
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  (inGameShopBuy._config)._giftTopListStart = (UIScroll.ScrollEvent)(inGameShopBuy._scroll_GiftTopList, isUp, (inGameShopBuy._config)._giftTopListMaxCount, (inGameShopBuy._config)._giftTopListCount, (inGameShopBuy._config)._giftTopListStart, 1)
  inGameShopBuy:AddedListUpdate()
end

  Scroll_GiftBotList = function(isUp)
  -- function num : 0_27 , upvalues : inGameShopBuy
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  (inGameShopBuy._config)._giftBotListStart = (UIScroll.ScrollEvent)(inGameShopBuy._scroll_GiftBotList, isUp, (inGameShopBuy._config)._giftBotListMaxCount, (inGameShopBuy._config)._giftBotListCount, (inGameShopBuy._config)._giftBotListStart, 1)
  inGameShopBuy:UserListUpdate()
end

  HandleClicked_AddGiftTopList = function(botIdx)
  -- function num : 0_28 , upvalues : inGameShopBuy
  local botName = ((inGameShopBuy.giftUserList)[botIdx]).name
  local botUserNo = ((inGameShopBuy.giftUserList)[botIdx]).userNo
  local botSendType = ((inGameShopBuy.giftUserList)[botIdx]).sendType
  if botName ~= "" or botName ~= nil then
    (getIngameCashMall()):pushGiftToUser(botName, botUserNo)
  else
    _PA_ASSERT(false, "데이터가 비정상입니다. giftUserList 배열�\144 해당하는 idx 혹은 name 값이 없습니다.")
  end
  inGameShopBuy:update()
end

  HandleClicked_InGameShop_ChangeGiftCount = function(isPlus, dataIdx)
  -- function num : 0_29 , upvalues : inGameShopBuy
  local beforCount = ((getIngameCashMall()):getGiftList(dataIdx)):getCount()
  if isPlus then
    if beforCount >= 20 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_INGAMECASHSHOP_BUYORGIFT_MUST_LESS20"))
      return 
    end
    ;
    (getIngameCashMall()):setGiftCount(dataIdx, beforCount + 1)
  else
    if beforCount <= 1 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_INGAMECASHSHOP_BUYORGIFT_MUST_BIG1"))
      return 
    end
    ;
    (getIngameCashMall()):setGiftCount(dataIdx, beforCount - 1)
  end
  inGameShopBuy:AddedListUpdate()
end

  HandleClicked_InGameShop_DeleteGiftList = function(dataIdx)
  -- function num : 0_30 , upvalues : inGameShopBuy
  (getIngameCashMall()):popGift(dataIdx)
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (inGameShopBuy._config)._giftTopListStart = 0
  ;
  (inGameShopBuy._scroll_GiftTopList):SetControlTop()
  inGameShopBuy:AddedListUpdate()
end

  HandelClicked_InGameShopBuy_FriendGuild = function()
  -- function num : 0_31 , upvalues : inGameShopBuy
  inGameShopBuy:update()
end

  HandelClicked_InGameShopBuy_SetAddUser = function()
  -- function num : 0_32 , upvalues : inGameShopBuy
  (inGameShopBuy._edit_Gift):SetEditText("", true)
end

  HandelClicked_InGameShopBuy_AddUser = function()
  -- function num : 0_33 , upvalues : inGameShopBuy
  local userName = (inGameShopBuy._edit_Gift):GetEditText()
  ;
  (getIngameCashMall()):pushGiftToCharacter(userName)
  inGameShopBuy:AddedListUpdate()
  ;
  (inGameShopBuy._edit_Gift):SetEditText("", true)
  ClearFocusEdit()
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
end

  InGameShopBuy_ShowItemToolTip = function(isShow, index)
  -- function num : 0_34 , upvalues : inGameShopBuy
  local self = inGameShopBuy
  if isShow == true then
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
    local itemWrapper = cashProduct:getItemByIndex(index)
    local slotIcon = ((self._slots)[index]).icon
    Panel_Tooltip_Item_Show(itemWrapper, slotIcon, true, false, nil)
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

  InGameShopBuy_ShowSubItemToolTip = function(isShow, index)
  -- function num : 0_35 , upvalues : inGameShopBuy
  local self = inGameShopBuy
  if isShow == true then
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._productNoRaw)
    local itemWrapper = cashProduct:getSubItemByIndex(index)
    local slotIcon = ((self._slots)[index + cashProduct:getSubItemListCount()]).icon
    Panel_Tooltip_Item_Show(itemWrapper, slotIcon, true, false, nil)
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

  FGlobal_InGameShopBuy_Open = function(productNoRaw, isGift, byCart, isEasy)
  -- function num : 0_36 , upvalues : inGameShopBuy
  local self = inGameShopBuy
  self._productNoRaw = productNoRaw
  self._isGift = isGift
  self._byCart = byCart
  self._easyBuy = isEasy
  ;
  (self._edit_count):SetEditText(1, false)
  self.savedProductCount = 1
  if isGift == true then
    (self._panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_DOGIFT"))
    ;
    (self._button_Confirm):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_GIFT"))
    ;
    (self._edit_Gift):SetEditText("", true)
    ;
    (self._buttonFriendList):SetCheck(true)
    ;
    (self._buttonGuildList):SetCheck(false)
    ;
    (self._radioButtonSelectPearl):SetShow(false)
  else
    ;
    (self._panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_BUYPRODUCT"))
    ;
    (self._button_Confirm):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_BUY"))
  end
  self.giftUserList = {}
  -- DECOMPILER ERROR at PC66: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._config)._giftTopListCount = 0
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._config)._giftBotListCount = 0
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._config)._giftTopListStart = 0
  -- DECOMPILER ERROR at PC72: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._config)._giftBotListStart = 0
  ;
  (self._scroll_GiftTopList):SetControlTop()
  ;
  (self._scroll_GiftBotList):SetControlTop()
  RequestFriendList_getFriendList()
  ;
  (getIngameCashMall()):clearGift()
  self:update()
  self:defaultPosition()
  if isEasy == true then
    (self._button_CountUp):SetShow(false)
    ;
    (self._button_CountDown):SetShow(false)
  else
    ;
    (self._button_CountUp):SetShow(true)
    ;
    (self._button_CountDown):SetShow(true)
  end
  InGameShopBuy_Open()
end

  InGameShopBuy_Open = function()
  -- function num : 0_37 , upvalues : inGameShopBuy
  if Panel_IngameCashShop_BuyOrGift:GetShow() then
    return 
  end
  ;
  (inGameShopBuy._edit_Gift):SetEditText("", true)
  Panel_IngameCashShop_BuyOrGift:SetShow(true)
  FGlobal_IngameCashShopCoupon_ReturnValueCancel()
end

  InGameShopBuy_Close = function(isCouponCheck)
  -- function num : 0_38 , upvalues : inGameShopBuy
  if not Panel_IngameCashShop_BuyOrGift:GetShow() then
    return 
  end
  ClearFocusEdit()
  Panel_IngameCashShop_BuyOrGift:SetShow(false)
  IngameCashShopCoupon_Close(isCouponCheck)
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  inGameShopBuy.savedCouponDiscountTextSizeX = 0
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
end

  InGameShopBuy_CheckAddUser = function()
  -- function num : 0_39 , upvalues : inGameShopBuy
  if Panel_Win_System:GetShow() then
    return 
  end
  local checkUserNickName = (inGameShopBuy._edit_Gift):GetEditText()
  ;
  (getIngameCashMall()):requestUserNickNameByCharacterName(checkUserNickName)
end

  FromClient_IncashshopGetUserNickName = function(outUserNickName, isSearched)
  -- function num : 0_40 , upvalues : inGameShopBuy
  local checkCharacterName = (inGameShopBuy._edit_Gift):GetEditText()
  if isSearched == true then
    local messageBoxtitle = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
    local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CHECK_TOUSERNAME", "userNickName", outUserNickName, "characterName", checkCharacterName)
    local messageBoxData = {title = messageBoxtitle, content = messageBoxMemo, functionYes = HandelClicked_InGameShopBuy_AddUser, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_HIGH}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "middle")
  else
    do
      local messageBoxtitle2 = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
      local messageBoxMemo2 = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_CHECK_TOUSERNAME_NORESULT")
      local messageBoxData2 = {title = messageBoxtitle2, content = messageBoxMemo2, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_HIGH}
      ;
      (MessageBox.showMessageBox)(messageBoxData2, "middle")
    end
  end
end

  inGameShopBuy:init()
  inGameShopBuy:registEventHandler()
  inGameShopBuy:registMessageHandler()
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

