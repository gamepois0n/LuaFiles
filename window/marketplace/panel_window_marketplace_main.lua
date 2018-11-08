local _panel = Panel_Window_MarketPlace_Main
local UI_color = Defines.Color
local MarketPlace = {
  _ui = {
    stc_LeftMenuBg = UI.getChildControl(_panel, "Static_LeftMenuBg"),
    txt_Title = UI.getChildControl(_panel, "StaticText_Title"),
    btn_Close = UI.getChildControl(_panel, "Button_Win_Close"),
    btn_Question = UI.getChildControl(_panel, "Button_Question"),
    checkBtn_PopUp = UI.getChildControl(_panel, "CheckButton_PopUp"),
    stc_MarketPlace = UI.getChildControl(_panel, "Static_MarketPlace"),
    stc_Wallet = UI.getChildControl(_panel, "Static_Wallet")
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  },
  _slotConfigWallet = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  },
  _tabIdx = {itemMarket = 1, wallet = 2},
  _biddingTabIdx = {sell = 1, buy = 2},
  _itemListType = {
    categoryList = 1,
    detailListByCategory = 2,
    detailListByKey = 3
  },
  _categoryIdxMap = {},
  _currentTerritoryKeyRaw = nil,
  _currentTabIdx = nil,
  _selectedMainKey = -1,
  _selectedSubKey = -1,
  _currentListType = nil,
  _prevListCount = 0,
  _selectedBiddingTabIndex = 0,
  _isEsc = false,
  _isOpenFromDialog = false,
  _isOpenByMaid = false,
  _isWorldMapOpen = false
}
function MarketPlace:init()
  self._ui.btn_MarketPlace = UI.getChildControl(self._ui.stc_LeftMenuBg, "RadioButton_MarketPlace")
  self._ui.btn_Wallet = UI.getChildControl(self._ui.stc_LeftMenuBg, "RadioButton_Wallet")
  self:registEvent()
end
function MarketPlace:updateWallet()
  local walletItemCount = getWorldMarketMyWalletListCount()
end
function MarketPlace:registEvent()
  self._ui.btn_MarketPlace:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_OpenItemMarketTab()")
  self._ui.btn_Wallet:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_OpenMyWalletTab()")
  registerEvent("FromClient_notifyItemMarketMessage", "FromClient_MarketPlace_NotifyMessage")
  registerEvent("FromClient_responseGetMyBiddingList", "FromClient_MarketPlace_responseGetMyBiddingList")
  registerEvent("FromClient_responseWithdrawBuyBidding", "FromClient_MarketPlace_responseWithdrawBuyBidding")
  registerEvent("FromClient_responseCalculateBuyBidding", "FromClient_MarketPlace_responseCalculateBuyBidding")
  registerEvent("FromClient_responseWithdrawSellBidding", "FromClient_MarketPlace_responseWithdrawSellBidding")
  registerEvent("FromClient_responseCalculateSellBidding", "FromClient_MarketPlace_responseCalculateSellBidding")
end
function MarketPlace:open(tabIdx)
  self._currentTabIdx = tabIdx
  self._selectedMainKey = -1
  self._selectedSubKey = -1
  self._prevListCount = 0
  self._currentListType = nil
  requestOpenItemMarket()
  ToClient_requestCreateMyWallet()
  ToClient_requestMyWalletList()
  if self._currentTabIdx == self._tabIdx.itemMarket then
    InputMLUp_MarketPlace_OpenItemMarketTab()
  elseif self._currentTabIdx == self._tabIdx.wallet then
    InputMLUp_MarketPlace_OpenMyWalletTab()
    ToClient_requestMyBiddingListByWorldMarket()
  end
  self:update()
  _panel:SetShow(true)
end
function MarketPlace:close()
  _panel:SetShow(false)
end
function MarketPlace:biddingOpen(tabIdx)
  self._selectedBiddingTabIndex = tabIdx
  self:updateMyBiddingItemList()
  self:updateWallet()
end
function MarketPlace:update()
  PaGlobalFunc_ItemMarket_Update()
end
function MarketPlace:updateItemList()
  PaGlobalFunc_ItemMarket_UpdateItemList()
end
function MarketPlace:updateMyBiddingItemList()
  local itemListCount = 0
  self._ui.list_MyBiddingList:getElementManager():clearKey()
  if self._selectedBiddingTabIndex == self._biddingTabIdx.sell then
    itemListCount = getWorldMarketSellBiddingListCount()
    self._ui.txt_Text1:SetText("\237\140\144\235\167\164 \235\140\128\234\184\176 " .. tostring(itemListCount) .. "\234\177\180")
    self._ui.txt_Text2:SetText("\237\140\144\235\167\164 \236\153\132\235\163\140 00\234\177\180")
  elseif self._selectedBiddingTabIndex == self._biddingTabIdx.buy then
    itemListCount = getWorldMarketBuyBiddingListCount()
    self._ui.txt_Text1:SetText("\234\181\172\235\167\164 \235\140\128\234\184\176 " .. tostring(itemListCount) .. "\234\177\180")
    self._ui.txt_Text2:SetText("\234\181\172\235\167\164 \236\153\132\235\163\140 00\234\177\180")
  end
  if itemListCount > 0 then
    self._ui.list_MyBiddingList:SetShow(true)
  else
    self._ui.list_MyBiddingList:SetShow(false)
  end
  for idx = 0, itemListCount - 1 do
    self._ui.list_MyBiddingList:getElementManager():pushKey(toInt64(0, idx))
  end
  self._ui.list_MyBiddingList:requestUpdateVisible()
end
function MarketPlace:updateMyInfo()
  PaGlobalFunc_ItemMarket_UpdateMyInfo()
end
function PaGlobalFunc_MarketPlace_UpdateMyInfo()
  MarketPlace:updateMyInfo()
  MarketPlace:updateWallet()
end
function MarketPlace:setNameColor(nameColorGrade)
  local nameColor
  if 0 == nameColorGrade then
    nameColor = UI_color.C_FFFFFFFF
  elseif 1 == nameColorGrade then
    nameColor = 4284350320
  elseif 2 == nameColorGrade then
    nameColor = 4283144191
  elseif 3 == nameColorGrade then
    nameColor = 4294953010
  elseif 4 == nameColorGrade then
    nameColor = 4294929408
  else
    nameColor = UI_color.C_FFFFFFFF
  end
  return nameColor
end
function MarketPlace:setNameAndEnchantLevel(enchantLevel, itemType, itemName, itemClassify)
  local nameStr = ""
  if 1 == itemType and enchantLevel > 15 then
    nameStr = HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
  elseif enchantLevel > 0 and CppEnums.ItemClassifyType.eItemClassify_Accessory == itemClassify then
    nameStr = HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
  else
    nameStr = itemName
  end
  return nameStr
end
function InputMLUp_MarketPlace_SellItem(slotIndex)
  local itemMyWalletInfo = getWorldMarketMyWalletListByIdx(slotIndex)
  if nil ~= itemMyWalletInfo then
    ToClient_requestDetailOneItemByWorldMarket(itemMyWalletInfo:getEnchantKey())
  end
end
function PaGlobalFunc_MarketPlace_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_MarketPlace_IsOpenFromDialog()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  return self._isOpenFromDialog
end
function PaGlobalFunc_MarketPlace_CreateControlCategoryList(contents, key)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  local idx = Int64toInt32(key)
  local indexMap = self._categoryIdxMap[idx]
  local categoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
  local stc_FocusBg = UI.getChildControl(contents, "StaticText_FocusBg")
  local btn_MainCategory = UI.getChildControl(contents, "Button_MainCategory")
  local btn_SubCategory = UI.getChildControl(contents, "Button_SubCategory")
  btn_MainCategory:SetShow(false)
  btn_SubCategory:SetShow(false)
  if true == indexMap._isMain then
    local mainValue = categoryInfo:getMainCategoryValue()
    btn_MainCategory:SetText(mainValue:getCategoryName())
    btn_MainCategory:SetShow(true)
    btn_MainCategory:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_MainCategoryList(" .. idx .. ")")
  elseif false == indexMap._isMain then
    local subValue = categoryInfo:getSubCategoryAt(indexMap._subIndex)
    btn_SubCategory:SetText(subValue:getCategoryName())
    btn_SubCategory:SetShow(true)
    btn_SubCategory:SetFontColor(UI_color.C_FF8B7455)
    btn_SubCategory:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_SubCategoryList(" .. idx .. ")")
  end
end
function PaGlobalFunc_MarketPlace_CreateControlMarketItemList(contents, key)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  local idx = Int64toInt32(key)
  local bg_ItemSlot = UI.getChildControl(contents, "Static_ItemSlot")
  local slot = {}
  SlotItem.reInclude(slot, "ItemList", 0, bg_ItemSlot, self._slotConfig)
  slot.icon:EraseAllEffect()
  slot.icon:addInputEvent("Mouse_On", "")
  slot.icon:addInputEvent("Mouse_Out", "")
  local txt_ItemName = UI.getChildControl(contents, "StaticText_ItemName")
  local txt_ItemBasePrice = UI.getChildControl(contents, "StaticText_BasePrice")
  local txt_ItemCount = UI.getChildControl(contents, "StaticText_Count")
  local txt_MinPrice = UI.getChildControl(contents, "StaticText_MinPrice")
  local txt_MaxPrice = UI.getChildControl(contents, "StaticText_MaxPrice")
  local btn_ButtonBg = UI.getChildControl(contents, "Button_Bg")
  if self._itemListType.detailListByKey == self._currentListType then
    local itemInfo = getWorldMarketDetailListByIdx(idx)
    if nil == itemInfo then
      _PA_ASSERT(false, "\236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : getWorldMarketListByIdx( idx )")
      return
    end
    local itemSSW = itemInfo:getItemEnchantStaticStatusWrapper()
    local enchantLevel = itemSSW:get()._key:getEnchantLevel()
    local nameColorGrade = itemSSW:getGradeType()
    local itemCount = itemInfo:getItemCount()
    local itemBasePrice = itemInfo:getPricePerOne()
    slot:setItemByStaticStatus(itemSSW, 0, -1, false, nil, false, 0, 0, nil)
    slot.isEmpty = false
    local nameColor = self:setNameColor(nameColorGrade)
    txt_ItemName:SetFontColor(nameColor)
    local itemNameStr = self:setNameAndEnchantLevel(enchantLevel, itemSSW:getItemType(), itemSSW:getName(), itemSSW:getItemClassify())
    txt_ItemName:SetText(itemNameStr)
    txt_ItemBasePrice:SetText("\234\184\176\236\164\128\234\176\128 : " .. makeDotMoney(itemBasePrice))
    txt_ItemCount:SetText("\236\180\157 \235\167\164\235\172\188 : " .. tostring(itemCount) .. "\234\176\156")
    btn_ButtonBg:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_RequestBiddingList(" .. idx .. ")")
  elseif self._itemListType.categoryList == self._currentListType then
    local itemInfo = getWorldMarketListByIdx(idx)
    if nil == itemInfo then
      _PA_ASSERT(false, "\236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : getWorldMarketListByIdx( idx )")
      return
    end
    local itemSSW = itemInfo:getItemEnchantStaticStatusWrapper()
    local enchantLevel = itemSSW:get()._key:getEnchantLevel()
    local nameColorGrade = itemSSW:getGradeType()
    local itemCount = itemInfo:getItemCount()
    local totalTradeCount = itemInfo:getTotalTradeCount()
    slot:setItemByStaticStatus(itemSSW)
    slot.isEmpty = false
    local nameColor = self:setNameColor(nameColorGrade)
    txt_ItemName:SetFontColor(nameColor)
    txt_ItemName:SetText(tostring(itemSSW:getName()))
    txt_ItemBasePrice:SetText("\235\136\132\236\160\129 \234\177\176\235\158\152\235\159\137 : " .. tostring(totalTradeCount))
    txt_ItemCount:SetText("\236\180\157 \235\167\164\235\172\188 : " .. tostring(itemCount) .. "\234\176\156")
    btn_ButtonBg:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_RequestDetailListByKey(" .. itemInfo:getItemKeyRaw() .. ")")
  end
end
function PaGlobalFunc_MarketPlace_CreateControlMyBiddingList(contents, key)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  local idx = Int64toInt32(key)
  local bg_ItemSlot = UI.getChildControl(contents, "Static_ItemSlot")
  local slot = {}
  SlotItem.reInclude(slot, "ItemBiddingList", 0, bg_ItemSlot, self._slotConfig)
  slot.icon:EraseAllEffect()
  slot.icon:addInputEvent("Mouse_On", "")
  slot.icon:addInputEvent("Mouse_Out", "")
  local txt_ItemName = UI.getChildControl(contents, "StaticText_ItemName")
  local txt_ItemPrice = UI.getChildControl(contents, "StaticText_Price")
  local txt_ItemCount = UI.getChildControl(contents, "StaticText_Count")
  local btn_Calculate = UI.getChildControl(contents, "Button_Calculate")
  local btn_Withdraw = UI.getChildControl(contents, "Button_Withdraw")
  if self._selectedBiddingTabIndex == self._biddingTabIdx.sell then
    local itemInfo = getWorldMarketSellBiddingListByIdx(idx)
    if nil == itemInfo then
      _PA_ASSERT(false, "\236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : getWorldMarketSellBiddingListByIdx( idx )")
      return
    end
    local itemSSW = itemInfo:getItemEnchantStaticStatusWrapper()
    local enchantLevel = itemSSW:get()._key:getEnchantLevel()
    local chooseEnchantLevel = itemInfo:getChooseEnchantLevel()
    local nameColorGrade = itemSSW:getGradeType()
    local pricePerOne = itemInfo:getPricePerOne()
    local leftCount = itemInfo:getLeftCount()
    local sellNo = itemInfo:getSellNo()
    slot:setItemByStaticStatus(itemSSW, 0, -1, false, nil, false, 0, 0, nil)
    slot.isEmpty = false
    local nameColor = self:setNameColor(nameColorGrade)
    txt_ItemName:SetFontColor(nameColor)
    local itemNameStr = self:setNameAndEnchantLevel(chooseEnchantLevel, itemSSW:getItemType(), itemSSW:getName(), itemSSW:getItemClassify())
    txt_ItemName:SetText(itemNameStr)
    txt_ItemPrice:SetText("\237\140\144\235\167\164 \237\157\172\235\167\157 \234\176\128\234\178\169 : " .. makeDotMoney(pricePerOne))
    txt_ItemCount:SetText("\236\136\152\235\159\137 : " .. tostring(leftCount) .. "\234\176\156")
    btn_Calculate:addInputEvent("Mouse_LUp", "PaGlobal_SellBidding_Calculate(" .. idx .. ")")
    btn_Withdraw:addInputEvent("Mouse_LUp", "PaGlobal_SellBidding_WithdrawSetCount(" .. idx .. ")")
  elseif self._selectedBiddingTabIndex == self._biddingTabIdx.buy then
    local itemInfo = getWorldMarketBuyBiddingListByIdx(idx)
    local itemSSW = itemInfo:getItemEnchantStaticStatusWrapper()
    local enchantLevel = itemSSW:get()._key:getEnchantLevel()
    local chooseEnchantLevel = itemInfo:getChooseEnchantLevel()
    local nameColorGrade = itemSSW:getGradeType()
    local pricePerOne = itemInfo:getPricePerOne()
    local leftCount = itemInfo:getLeftCount()
    local buyNo = itemInfo:getBuyNo()
    slot:setItemByStaticStatus(itemSSW, 0, -1, false, nil, false, 0, 0, nil)
    slot.isEmpty = false
    local nameColor = self:setNameColor(nameColorGrade)
    txt_ItemName:SetFontColor(nameColor)
    local itemNameStr = self:setNameAndEnchantLevel(chooseEnchantLevel, itemSSW:getItemType(), itemSSW:getName(), itemSSW:getItemClassify())
    txt_ItemName:SetText(itemNameStr)
    txt_ItemPrice:SetText("\234\181\172\235\167\164 \237\157\172\235\167\157 \234\176\128\234\178\169 : " .. makeDotMoney(pricePerOne))
    txt_ItemCount:SetText("\236\136\152\235\159\137 : " .. tostring(leftCount) .. "\234\176\156")
    btn_Calculate:addInputEvent("Mouse_LUp", "PaGlobal_BuyBidding_Calculate(" .. idx .. ")")
    btn_Withdraw:addInputEvent("Mouse_LUp", "PaGlobal_BuyBidding_WithdrawSetCount(" .. idx .. ")")
  end
end
function PaGlobal_SellBidding_Calculate(idx)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  local itemInfo = getWorldMarketSellBiddingListByIdx(idx)
  ToClient_requestCalculateSellBiddingToWorldMarket(itemInfo:getSellNo())
end
function PaGlobal_SellBidding_WithdrawSetCount(idx)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  local itemInfo = getWorldMarketSellBiddingListByIdx(idx)
  local leftCount = itemInfo:getLeftCount()
  local sellNo = itemInfo:getSellNo()
  Panel_NumberPad_Show(true, leftCount, sellNo, PaGlobal_SellBidding_Withdraw)
end
function PaGlobal_SellBidding_Withdraw(inputNumber, sellNo)
  ToClient_requestWithdrawSellBiddingToWorldMarket(sellNo, inputNumber)
end
function PaGlobal_BuyBidding_Calculate(idx)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  local itemInfo = getWorldMarketBuyBiddingListByIdx(idx)
  local leftCount = itemInfo:getLeftCount()
  local buyNo = itemInfo:getBuyNo()
  ToClient_requestCalculateBuyBiddingToWorldMarket(buyNo)
end
function PaGlobal_BuyBidding_WithdrawSetCount(idx)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  local itemInfo = getWorldMarketBuyBiddingListByIdx(idx)
  local leftCount = itemInfo:getLeftCount()
  local buyNo = itemInfo:getBuyNo()
  Panel_NumberPad_Show(true, leftCount, buyNo, PaGlobal_BuyBidding_Withdraw)
end
function PaGlobal_BuyBidding_Withdraw(inputNumber, buyNo)
  ToClient_requestWithdrawBuyBiddingToWorldMarket(buyNo, inputNumber)
end
function FGolbal_ItemMarketNew_Close()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  if false == _panel:GetShow() then
    return
  end
  audioPostEvent_SystemUi(1, 1)
  _AudioPostEvent_SystemUiForXBOX(1, 1)
  if true == PaGlobalFunc_MarketWallet_GetShow() then
    PaGlobalFunc_MarketWallet_ForceClose()
  end
  if false == self._isOpenFromDialog and true == self._isOpenByMaid then
    SetUIMode(Defines.UIMode.eUIMode_Default)
    ToClient_CallHandlerMaid("_maidLogOut")
    self._isOpenByMaid = false
  end
  self._isEsc = false
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
  toClient_requestCloseItemMarket()
  self:close()
end
function FGolbal_ItemMarket_Function_Open()
  PaGlobalFunc_MarketPlace_OpenFromDialog()
end
function PaGlobalFunc_MarketPlace_OpenFromDialog()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  SetUIMode(Defines.UIMode.eUIMode_ItemMarket)
  if true == _ContentsGroup_RenewUI_Dailog then
    PaGlobalFunc_MainDialog_Close()
  else
    Panel_Npc_Dialog:SetShow(false)
  end
  self._isOpenFromDialog = true
  PaGlobalFunc_MarketPlace_Open()
end
function FGolbal_ItemMarket_Function_Close()
  PaGlobalFunc_MarketPlace_CloseToDialog()
end
function PaGlobalFunc_MarketPlace_CloseToDialog()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  SetUIMode(Defines.UIMode.eUIMode_NpcDialog)
  if true == _ContentsGroup_RenewUI_Dailog then
    PaGlobalFunc_MainDialog_ReOpen()
  else
    Panel_Npc_Dialog:SetShow(true)
  end
  self._isOpenFromDialog = false
  FGolbal_ItemMarketNew_Close()
end
function PaGlobalFunc_MarketPlace_Open()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  if true == _panel:GetShow() then
    return
  end
  local selfPlayer = getSelfPlayer()
  local regionInfoWrapper = getRegionInfoWrapper(selfPlayer:getRegionKeyRaw())
  if nil == regionInfoWrapper then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGIONINFO_NIL"))
    return
  end
  self._currentTerritoryKeyRaw = regionInfoWrapper:getTerritoryKeyRaw()
  self:open(self._tabIdx.itemMarket)
  _PA_LOG("\235\176\149\234\183\156\235\130\152", "PaGlobalFunc_MarketPlace_Open")
end
function FGlobal_ItemMarket_Open_ForWorldMap(territoryKeyRaw, isEscMenu)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  if true == _panel:GetShow() then
    return
  end
  if true == ToClient_WorldMapIsShow() and true == _ContentsGroup_RenewUI_WorldMap then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(_panel, true)
  end
  self._currentTerritoryKeyRaw = territoryKeyRaw
  local rv = requestItemMarketSummaryInfo(self._currentTerritoryKeyRaw, true, false)
  if 0 ~= rv then
    return
  end
  self._isEsc = isEscMenu
  self._isWorldMapOpen = true
  self:open(self._tabIdx.itemMarket)
  _PA_LOG("\235\176\149\234\183\156\235\130\152", "FGlobal_ItemMarket_Open_ForWorldMap")
end
function FGlobal_ItemMarket_OpenByMaid()
  _PA_ASSERT(false, "\237\149\180\235\139\185 \237\149\168\236\136\152\234\176\128 \236\149\132\236\167\129 \234\181\172\237\152\132\235\144\152\236\167\128 \236\149\138\236\149\152\236\138\181\235\139\136\235\139\164!! : FGlobal_ItemMarket_OpenByMaid")
  self:open(self._tabIdx.itemMarket)
  _PA_LOG("\235\176\149\234\183\156\235\130\152", "FGlobal_ItemMarket_OpenByMaid")
end
function FGlobal_ItemMarket_IsOpenByMaid()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return false
  end
  return self._isOpenByMaid
end
function PaGlobalFunc_MarketPlace_UpdateWalletInfo()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:updateMyInfo()
end
function PaGlobalFunc_MarketPlace_UpdateWalletList()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:updateMyInfo()
  self:updateWallet()
end
function PaGlobalFunc_MarketPlace_Init()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:init()
  PaGlobalFunc_ItemMarket_Init()
  PaGlobalFunc_MarketWallet_Init()
end
function InputMLUp_MarketPlace_OpenItemMarketTab()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  _PA_LOG("\235\176\149\234\183\156\235\130\152", "InputMLUp_MarketPlace_OpenItemMarketTab")
  self._ui.txt_Title:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_FUNCTION_MARKET"))
  PaGlobalFunc_Wallet_Close()
  PaGlobalFunc_ItemMarket_Open()
end
function InputMLUp_MarketPlace_OpenMyWalletTab()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self._ui.txt_Title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_INVEN_NAME"))
  PaGlobalFunc_ItemMarket_Close()
  PaGlobalFunc_Wallet_Open()
  _PA_LOG("\235\176\149\234\183\156\235\130\152", "InputMLUp_MarketPlace_OpenMyWalletTab")
end
function InputMLUp_MarketPlace_OpenMySellTab()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:biddingOpen(self._biddingTabIdx.sell)
end
function InputMLUp_MarketPlace_OpenMyBuyTab()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:biddingOpen(self._biddingTabIdx.buy)
end
function InputMLUp_MarketPlace_WalletOpen()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  if true ~= self._isOpenFromDialog then
    return
  end
  PaGlobalFunc_MarketWallet_Open()
  _panel:SetShow(false)
end
function InputMLUp_MarketPlace_RequestDetailListByKey(itemKey)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  ToClient_requestDetailListByWorldMarketByItemKey(itemKey)
end
function InputMLUp_MarketPlace_RequestBiddingList(idx)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  local itemInfo = getWorldMarketDetailListByIdx(idx)
  if nil == itemInfo then
    _PA_ASSERT(false, "\236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : getWorldMarketListByIdx( idx )")
    return
  end
  local itemEnchantKey = itemInfo:getEnchantKey()
  ToClient_requestGetBiddingList(itemEnchantKey, true)
end
function FromClient_MarketPlace_ResponseList()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self._currentListType = 1
  self:updateItemList()
end
function FromClient_MarketPlace_ResponseDetailListByCategory()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self._currentListType = 2
  self:updateItemList()
end
function FromClient_MarketPlace_ResponseDetailListByKey()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self._currentListType = 3
  self:updateItemList()
end
function FromClient_MarketPlace_responseGetMyBiddingList()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:biddingOpen(self._biddingTabIdx.sell)
end
function FromClient_MarketPlace_responseCalculateBuyBidding()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:biddingOpen(self._biddingTabIdx.buy)
  self:updateWallet()
  self:updateMyInfo()
  Proc_ShowMessage_Ack("\234\181\172\235\167\164 \236\160\149\236\130\176\236\151\144 \236\132\177\234\179\181\237\150\136\236\138\181\235\139\136\235\139\164.")
end
function FromClient_MarketPlace_responseWithdrawBuyBidding()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:biddingOpen(self._biddingTabIdx.buy)
  self:updateWallet()
  self:updateMyInfo()
  Proc_ShowMessage_Ack("\234\181\172\235\167\164 \237\154\140\236\136\152\236\151\144 \236\132\177\234\179\181\237\150\136\236\138\181\235\139\136\235\139\164.")
end
function FromClient_MarketPlace_responseCalculateSellBidding()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:biddingOpen(self._biddingTabIdx.sell)
  self:updateWallet()
  self:updateMyInfo()
  Proc_ShowMessage_Ack("\237\140\144\235\167\164 \236\160\149\236\130\176\236\151\144 \236\132\177\234\179\181\237\150\136\236\138\181\235\139\136\235\139\164.")
end
function FromClient_MarketPlace_responseWithdrawSellBidding()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:biddingOpen(self._biddingTabIdx.sell)
  self:updateWallet()
  self:updateMyInfo()
  Proc_ShowMessage_Ack("\237\140\144\235\167\164 \237\154\140\236\136\152\236\151\144 \236\132\177\234\179\181\237\150\136\236\138\181\235\139\136\235\139\164.")
end
function FromClient_MarketPlace_NotifyMessage(msgType, strParam1, param1, param2, param3, param4)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  if 0 == msgType then
    if 0 == param1 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCOMPLETEITEM"))
    elseif 1 == param1 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYBIDDINGITEM"))
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCOMPLETEITEM"))
    end
  elseif 1 == msgType then
    local territoryNameArray = {
      [0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")),
      [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")),
      [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")),
      [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")),
      [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")),
      [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")),
      [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6")),
      [7] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_7"))
    }
    if param2 < 0 or param2 > 6 then
      return
    end
    local territoryName = territoryNameArray[param2]
    local issw = getItemEnchantStaticStatus(ItemEnchantKey(param1))
    if issw == nil then
      return
    end
    local itemName = issw:getName()
    local enchantLevel = issw:get()._key:getEnchantLevel()
    local isCash = issw:get():isCash()
    if enchantLevel > 0 and 4 ~= issw:getItemClassify() then
      strParam1 = "+" .. enchantLevel .. " " .. itemName
    end
    if enchantLevel >= 16 then
      local enchantString = ""
      if 16 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
      elseif 17 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
      elseif 18 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
      elseif 19 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
      elseif 20 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
      end
      strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
    elseif enchantLevel > 0 and enchantLevel < 16 and 4 ~= issw:getItemClassify() then
      if true == isCash then
        strParam1 = itemName
      else
        strParam1 = "+" .. enchantLevel .. " " .. itemName
      end
    elseif 4 == issw:getItemClassify() then
      local enchantString = ""
      if 1 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
      elseif 2 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
      elseif 3 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
      elseif 4 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
      elseif 5 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
      end
      if 0 == enchantLevel then
        strParam1 = itemName
      else
        strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
      end
    else
      strParam1 = itemName
    end
    local subStr
    if param4 then
      subStr = "LUA_ITEMMARKET_REGIST_ITEMMARKET"
    else
      subStr = "LUA_ITEMMARKET_STANDBY_ITEMMARKET"
    end
    local message = {
      main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NOTIFYITEMMARKETMSG_MAIN", "strParam1", strParam1, "param3", makeDotMoney(param3)),
      sub = PAGetString(Defines.StringSheet_GAME, subStr)
    }
    Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 19)
  elseif 2 == msgType then
    local message = ""
    if param2 == 1 then
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLITEM", "strParam1", strParam1, "param1", param1)
    else
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLITEMONE", "strParam1", strParam1)
    end
    Proc_ShowMessage_Ack(message)
  elseif 3 == msgType then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_AFTERREGIST_ACK"))
  elseif 4 == msgType then
    self:update()
  elseif 5 == msgType then
  elseif 6 == msgType then
    local issw = getItemEnchantStaticStatus(ItemEnchantKey(param1))
    if issw == nil then
      return
    end
    local itemName = issw:getName()
    local enchantLevel = issw:get()._key:getEnchantLevel()
    local isCash = issw:get():isCash()
    if enchantLevel > 0 and 4 ~= issw:getItemClassify() then
      strParam1 = "+" .. enchantLevel .. " " .. itemName
    end
    if enchantLevel >= 16 then
      local enchantString = ""
      if 16 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
      elseif 17 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
      elseif 18 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
      elseif 19 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
      elseif 20 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
      end
      strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
    elseif enchantLevel > 0 and enchantLevel < 16 and 4 ~= issw:getItemClassify() then
      if true == isCash then
        strParam1 = itemName
      else
        strParam1 = "+" .. enchantLevel .. " " .. itemName
      end
    elseif 4 == issw:getItemClassify() then
      local enchantString = ""
      if 1 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
      elseif 2 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
      elseif 3 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
      elseif 4 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
      elseif 5 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
      end
      if 0 == enchantLevel then
        strParam1 = itemName
      else
        strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
      end
    else
      strParam1 = itemName
    end
    local message = {
      main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NOTIFYITEMMARKETMSG_MAIN", "strParam1", strParam1, "param3", makeDotMoney(param3)),
      sub = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_STANDBY_ITEMMARKETBYPARTY")
    }
    Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 19)
  elseif 7 == msgType then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLCOMPLETEBYRESERVATION"))
  elseif 8 == msgType then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_RESERVATIONSUCCESS"))
  elseif 9 == msgType then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CANCELRESERVATIONSUCCESS"))
  elseif 10 == msgType then
    local territoryNameArray = {
      [0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")),
      [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")),
      [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")),
      [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")),
      [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")),
      [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")),
      [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6")),
      [7] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_7"))
    }
    if param2 < 0 or param2 > 6 then
      return
    end
    local territoryName = territoryNameArray[param2]
    local issw = getItemEnchantStaticStatus(ItemEnchantKey(param1))
    if issw == nil then
      return
    end
    local itemName = issw:getName()
    local enchantLevel = issw:get()._key:getEnchantLevel()
    local isCash = issw:get():isCash()
    if enchantLevel > 0 and 4 ~= issw:getItemClassify() then
      strParam1 = "+" .. enchantLevel .. " " .. itemName
    end
    if enchantLevel >= 16 then
      local enchantString = ""
      if 16 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
      elseif 17 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
      elseif 18 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
      elseif 19 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
      elseif 20 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
      end
      strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
    elseif enchantLevel > 0 and enchantLevel < 16 and 4 ~= issw:getItemClassify() then
      if true == isCash then
        strParam1 = itemName
      else
        strParam1 = "+" .. enchantLevel .. " " .. itemName
      end
    elseif 4 == issw:getItemClassify() then
      local enchantString = ""
      if 1 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
      elseif 2 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
      elseif 3 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
      elseif 4 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
      elseif 5 == enchantLevel then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
      end
      if 0 == enchantLevel then
        strParam1 = itemName
      else
        strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
      end
    else
      strParam1 = itemName
    end
    local message = {
      main = strParam1,
      sub = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLCOMPLETEBYRESERVATION")
    }
    Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 19)
  end
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MarketPlace_Init")
function FGlobal_ItemMarketRegistItem_RegistDO()
end
function FGlobal_ItemMarketItemSet_Close()
end
function Panel_ItemMarket_BidDesc_Hide()
end
function FGlobal_ItemMarketRegistItem_Close()
end
function FGlobal_isOpenItemMarketBackPage()
  return false
end
function FGlobal_isItemMarketBuyConfirm()
  return false
end
function ItemMarket_getIsMarketItem()
  return false
end
