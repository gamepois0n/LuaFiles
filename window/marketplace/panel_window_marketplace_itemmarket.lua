local _panel = Panel_Window_MarketPlace_Main
local _mainBg = UI.getChildControl(_panel, "Static_MarketPlace")
local UI_color = Defines.Color
local ItemMarket = {
  _ui = {
    stc_LeftBg = UI.getChildControl(_mainBg, "Static_LeftBg"),
    stc_SearchBg = UI.getChildControl(_mainBg, "Static_SearchBg"),
    stc_MainBg = UI.getChildControl(_mainBg, "Static_Main"),
    txt_NoSerchResult = UI.getChildControl(_panel, "StaticText_NoSearchResult")
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  },
  _itemListType = {
    categoryList = 1,
    detailListByCategory = 2,
    detailListByKey = 3
  },
  _tooltipType = {
    main = 0,
    detail = 1,
    selected = 2
  },
  _categoryIdxMap = {},
  _selectedMainKey = -1,
  _selectedSubKey = -1,
  _currentListType = nil
}
function PaGlobalFunc_ItemMarket_Init()
  local self = ItemMarket
  self:initControl()
  self:initEvent()
end
function ItemMarket:initControl()
  self._ui.stc_WalletStatBg = UI.getChildControl(self._ui.stc_LeftBg, "Static_WalletStatBg")
  self._ui.txt_MarketInvenMoneyValue = UI.getChildControl(self._ui.stc_WalletStatBg, "StaticText_MarketInvenValue")
  self._ui.txt_MarketInvenWeightValue = UI.getChildControl(self._ui.stc_WalletStatBg, "StaticText_MarketWeightValue")
  self._ui.stc_CategoryListBg = UI.getChildControl(self._ui.stc_LeftBg, "Static_CategoryListBg")
  self._ui.list_ItemCategory = UI.getChildControl(self._ui.stc_CategoryListBg, "List2_ItemMarket_Category")
  self._ui.edit_ItemName = UI.getChildControl(self._ui.stc_SearchBg, "Edit_ItemName")
  self._ui.btn_Search = UI.getChildControl(self._ui.edit_ItemName, "Button_Search")
  self._ui.checkBtn_FavoriteOnOff = UI.getChildControl(self._ui.stc_SearchBg, "Button_FavoriteOnOff")
  self._ui.btn_InMarketRegist = UI.getChildControl(self._ui.stc_SearchBg, "Button_InMarketRegist")
  self._ui.checkBtn_SerchType = UI.getChildControl(self._ui.stc_SearchBg, "CheckButton_SearchType")
  self._ui.checkBtn_SortRegistItemCount = UI.getChildControl(self._ui.stc_MainBg, "CheckButton_SortRegistItemCount")
  self._ui.checkBtn_SortAcerageTradePrice = UI.getChildControl(self._ui.stc_MainBg, "CheckButton_SortAverageTradePrice")
  self._ui.list_MarketItemList = UI.getChildControl(self._ui.stc_MainBg, "List2_ItemMarket_Main")
  self._ui.btn_BackPage = UI.getChildControl(self._ui.stc_MainBg, "Button_BackPage")
  self._ui.btn_SetRegistAlarm = UI.getChildControl(self._ui.stc_MainBg, "Button_SetRegistAlarm")
  self._ui.stc_SelectedItemBg = UI.getChildControl(self._ui.stc_MainBg, "Static_SelectedItemBg")
  self._ui.btn_ItemList = UI.getChildControl(self._ui.stc_SelectedItemBg, "Button_ItemList")
  self._ui.stc_SlotBg = UI.getChildControl(self._ui.stc_SelectedItemBg, "Static_SlotBG")
  self._ui.stc_Slot = UI.getChildControl(self._ui.stc_SelectedItemBg, "Static_Slot")
  self._ui.txt_ItemName = UI.getChildControl(self._ui.stc_SelectedItemBg, "Template_StaticText_ItemName")
  self._ui.txt_BasePriceValue = UI.getChildControl(self._ui.stc_SelectedItemBg, "StaticText_BasePriceValue")
  self._ui.txt_CountValue = UI.getChildControl(self._ui.stc_SelectedItemBg, "StaticText_CountValue")
  self._ui.list_MarketItemList_Sub = UI.getChildControl(self._ui.stc_MainBg, "List2_ItemMarket_Sub")
  local list2_Content = UI.getChildControl(self._ui.list_MarketItemList, "List2_1_Content")
  local slot = {}
  local list2_ItemSlot = UI.getChildControl(list2_Content, "Template_Static_Slot")
  SlotItem.new(slot, "ItemList", 0, list2_ItemSlot, self._slotConfig)
  slot:createChild()
  list2_Content = UI.getChildControl(self._ui.list_MarketItemList_Sub, "List2_1_Content")
  slot = {}
  list2_ItemSlot = UI.getChildControl(list2_Content, "Template_Static_Slot")
  SlotItem.new(slot, "ItemListSub", 0, list2_ItemSlot, self._slotConfig)
  slot:createChild()
  slot = {}
  list2_ItemSlot = UI.getChildControl(self._ui.stc_SelectedItemBg, "Static_Slot")
  SlotItem.new(slot, "SelectItem", 0, list2_ItemSlot, self._slotConfig)
  slot:createChild()
end
function ItemMarket:initEvent()
  self._ui.btn_BackPage:addInputEvent("Mouse_LUp", "PaGlobalFunc_ItemMarket_BackPage()")
  self._ui.list_ItemCategory:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_ItemMarket_CreateControlCategoryList")
  self._ui.list_ItemCategory:createChildContent(CppEnums.PAUIList2ElementManagerType.tree)
  self._ui.list_MarketItemList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_ItemMarket_CreateControlMarketItemList")
  self._ui.list_MarketItemList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui.list_MarketItemList_Sub:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_ItemMarket_CreateControlMarketItemSubList")
  self._ui.list_MarketItemList_Sub:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  registerEvent("FromClient_responseListByWorldMarket", "FromClient_ItemMarket_ResponseList")
  registerEvent("FromClient_responseDetailListByWorldMarketByGroupNo", "FromClient_ItemMarket_ResponseDetailListByCategory")
  registerEvent("FromClient_responseDetailListByWorldMarketByItemKey", "FromClient_ItemMarket_ResponseDetailListByKey")
end
function PaGlobalFunc_ItemMarket_BackPage()
  local self = ItemMarket
end
function PaGlobalFunc_ItemMarket_CreateControlMarketItemSubList(contents, key)
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  local idx = Int64toInt32(key)
  local bg_ItemSlot = UI.getChildControl(contents, "Template_Static_Slot")
  local slot = {}
  SlotItem.reInclude(slot, "ItemListSub", 0, bg_ItemSlot, self._slotConfig)
  slot.icon:EraseAllEffect()
  local txt_ItemName = UI.getChildControl(contents, "Template_StaticText_ItemName")
  local btn_ButtonBg = UI.getChildControl(contents, "Template_Button_ItemList")
  local txt_ItemBasePrice = UI.getChildControl(contents, "Template_StaticText_BasePriceValue")
  local txt_ItemCount = UI.getChildControl(contents, "Template_StaticText_CountValue")
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
  local totalTradeCount = itemInfo:getTotalTradeCount()
  slot:setItemByStaticStatus(itemSSW, 0, -1, false, nil, false, 0, 0, nil)
  slot.isEmpty = false
  local nameColor = self:setNameColor(nameColorGrade)
  txt_ItemName:SetFontColor(nameColor)
  local itemNameStr = self:setNameAndEnchantLevel(enchantLevel, itemSSW:getItemType(), itemSSW:getName(), itemSSW:getItemClassify())
  txt_ItemName:SetText(itemNameStr)
  txt_ItemBasePrice:SetText(makeDotMoney(itemBasePrice))
  txt_ItemCount:SetText(tostring(itemCount))
  slot.icon:addInputEvent("Mouse_On", "PaGlobalFunc_ItemMarket_ShowToolTip( " .. idx .. ", 1 )")
  slot.icon:addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
  btn_ButtonBg:addInputEvent("Mouse_LUp", "InputMLUp_ItemMarket_RequestBiddingList(" .. idx .. ")")
end
function PaGlobalFunc_ItemMarket_CreateControlMarketItemList(contents, key)
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  local idx = Int64toInt32(key)
  local bg_ItemSlot = UI.getChildControl(contents, "Template_Static_Slot")
  local slot = {}
  SlotItem.reInclude(slot, "ItemList", 0, bg_ItemSlot, self._slotConfig)
  slot.icon:EraseAllEffect()
  local txt_ItemName = UI.getChildControl(contents, "Template_StaticText_ItemName")
  local btn_ButtonBg = UI.getChildControl(contents, "Template_Button_ItemList")
  local txt_ItemBasePrice = UI.getChildControl(contents, "Template_StaticText_BasePriceValue")
  local txt_ItemCount = UI.getChildControl(contents, "Template_StaticText_CountValue")
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
  txt_ItemBasePrice:SetText(tostring(totalTradeCount))
  txt_ItemCount:SetText(tostring(itemCount))
  slot.icon:addInputEvent("Mouse_On", "PaGlobalFunc_ItemMarket_ShowToolTip( " .. idx .. ", 0 )")
  slot.icon:addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
  btn_ButtonBg:addInputEvent("Mouse_LUp", "InputMLUp_ItemMarket_RequestDetailListByKey(" .. idx .. ")")
end
function PaGlobalFunc_ItemMarket_ShowToolTip(idx, tooltipType)
  local self = ItemMarket
  local list, itemInfo, slot, contents
  if self._tooltipType.main == Int64toInt32(tooltipType) then
    list = self._ui.list_MarketItemList
    itemInfo = getWorldMarketListByIdx(idx)
    contents = list:GetContentByKey(toInt64(0, idx))
    slot = UI.getChildControl(contents, "Template_Static_Slot")
  elseif self._tooltipType.detail == Int64toInt32(tooltipType) then
    list = self._ui.list_MarketItemList_Sub
    itemInfo = getWorldMarketDetailListByIdx(idx)
    contents = list:GetContentByKey(toInt64(0, idx))
    slot = UI.getChildControl(contents, "Template_Static_Slot")
  elseif self._tooltipType.selected == Int64toInt32(tooltipType) then
    slot = self._ui.stc_Slot
    itemInfo = getWorldMarketListByIdx(idx)
  end
  if nil == slot or nil == itemInfo then
    return
  end
  local itemSSW = itemInfo:getItemEnchantStaticStatusWrapper()
  Panel_Tooltip_Item_Show(itemSSW, slot, true, false, nil, nil, true)
end
function PaGlobalFunc_ItemMarket_CreateControlCategoryList(contents, key)
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  local idx = Int64toInt32(key)
  local indexMap = self._categoryIdxMap[idx]
  local categoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
  local btn_MainCategory = UI.getChildControl(contents, "Template_RadioButton_CategoryBar")
  local btn_CategoryIcon = UI.getChildControl(contents, "Template_RadioButton_CategoryIcon")
  local btn_SubCategory = UI.getChildControl(contents, "Template_RadioButton_SubCategoryBar")
  local stc_Arrow = UI.getChildControl(btn_SubCategory, "Template_Static_Arrow")
  btn_MainCategory:SetCheck(idx == self._selectedMainKey)
  btn_MainCategory:SetShow(false)
  btn_SubCategory:SetShow(false)
  if true == indexMap._isMain then
    local mainValue = categoryInfo:getMainCategoryValue()
    btn_MainCategory:SetText(mainValue:getCategoryName())
    btn_MainCategory:SetShow(true)
    btn_MainCategory:addInputEvent("Mouse_LUp", "InputMLUp_ItemMarket_MainCategoryList(" .. idx .. ")")
  elseif false == indexMap._isMain then
    local subValue = categoryInfo:getSubCategoryAt(indexMap._subIndex)
    btn_SubCategory:SetText(subValue:getCategoryName())
    btn_SubCategory:SetShow(true)
    btn_SubCategory:SetFontColor(UI_color.C_FF8B7455)
    btn_SubCategory:addInputEvent("Mouse_LUp", "InputMLUp_ItemMarket_SubCategoryList(" .. idx .. ")")
  end
end
function ItemMarket:setSelectSlot(itemIdx)
  local itemInfo = getWorldMarketListByIdx(itemIdx)
  if nil == itemInfo then
    _PA_ASSERT(false, "\236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : getWorldMarketListByIdx( itemIdx )")
    return
  end
  local itemSSW = itemInfo:getItemEnchantStaticStatusWrapper()
  local nameColorGrade = itemSSW:getGradeType()
  local itemCount = itemInfo:getItemCount()
  local totalTradeCount = itemInfo:getTotalTradeCount()
  local bg_ItemSlot = self._ui.stc_Slot
  local slot = {}
  SlotItem.reInclude(slot, "SelectItem", 0, bg_ItemSlot, self._slotConfig)
  slot.icon:EraseAllEffect()
  slot:setItemByStaticStatus(itemSSW)
  slot.isEmpty = false
  local nameColor = self:setNameColor(nameColorGrade)
  self._ui.txt_ItemName:SetFontColor(nameColor)
  self._ui.txt_ItemName:SetText(tostring(itemSSW:getName()))
  self._ui.txt_BasePriceValue:SetText(tostring(totalTradeCount))
  self._ui.txt_CountValue:SetText(tostring(itemCount))
  slot.icon:addInputEvent("Mouse_On", "PaGlobalFunc_ItemMarket_ShowToolTip( " .. itemIdx .. ", 2 )")
  slot.icon:addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
end
function ItemMarket:setNameAndEnchantLevel(enchantLevel, itemType, itemName, itemClassify)
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
function ItemMarket:setNameColor(nameColorGrade)
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
function InputMLUp_ItemMarket_MainCategoryList(index)
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  for key, value in pairs(self._categoryIdxMap) do
    if true == value._isMain then
      local keyElement = self._ui.list_ItemCategory:getElementManager():getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  self._selectedSubKey = -1
  if self._selectedMainKey ~= index then
    self._selectedMainKey = index
    self._ui.list_ItemCategory:getElementManager():toggle(toInt64(0, index))
  else
    self._selectedMainKey = -1
  end
  self._ui.list_ItemCategory:getElementManager():refillKeyList()
  local heightIndex = self._ui.list_ItemCategory:getIndexByKey(toInt64(0, index))
  self._ui.list_ItemCategory:moveIndex(heightIndex)
  local indexMap = self._categoryIdxMap[index]
  local categoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
  local categoryValue = categoryInfo:getMainCategoryValue()
  local filterLineCount = categoryInfo:getFilterListCount(0)
  selectMarketCategory(categoryValue:getCategoryNo(), -1)
  self._ui.list_ItemCategory:requestUpdateByKey(toInt64(0, index))
end
function InputMLUp_ItemMarket_SubCategoryList(index)
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  self._ui.list_MarketItemList:moveTopIndex()
  local indexMap = self._categoryIdxMap[index]
  local categoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
  local filterLineCount = categoryInfo:getFilterListCount(0)
  local prevSelectedSubKey = self._selectedSubKey
  local mainCategoryValue = categoryInfo:getMainCategoryValue()
  local subCategoryValue = categoryInfo:getSubCategoryAt(indexMap._subIndex)
  if self._selectedSubKey ~= index then
    self._selectedSubKey = index
  else
    self._selectedSubKey = -1
  end
  if 0 == filterLineCount then
  else
  end
  ToClient_requestListByWorldMarket(mainCategoryValue, subCategoryValue)
  if -1 ~= prevSelectedSubKey then
    self._ui.list_ItemCategory:requestUpdateByKey(toInt64(0, prevSelectedSubKey))
  end
  self._ui.list_ItemCategory:requestUpdateByKey(toInt64(0, index))
end
function PaGlobalFunc_ItemMarket_Update()
  local self = ItemMarket
  self._ui.list_ItemCategory:getElementManager():clearKey()
  self._ui.list_MarketItemList:getElementManager():clearKey()
  self._ui.list_MarketItemList_Sub:getElementManager():clearKey()
  self._ui.stc_SelectedItemBg:SetShow(false)
  self._ui.btn_BackPage:SetShow(false)
  self._ui.btn_SetRegistAlarm:SetShow(false)
  self._ui.checkBtn_SortAcerageTradePrice:SetShow(false)
  self._ui.checkBtn_SortRegistItemCount:SetShow(false)
  self._ui.txt_NoSerchResult:SetShow(true)
  self._ui.txt_NoSerchResult:ComputePos()
  local mainElement = self._ui.list_ItemCategory:getElementManager():getMainElement()
  local categoryCount = ToClient_GetItemMarketCategoryListCount()
  local keyIdx = 0
  for mainIdx = 0, categoryCount - 1 do
    local categoryInfo = ToClient_GetItemMarketCategoryAt(mainIdx)
    self._categoryIdxMap[keyIdx] = {_isMain = true, _index = mainIdx}
    local treeElement = mainElement:createChild(toInt64(0, keyIdx))
    treeElement:setIsOpen(false)
    keyIdx = keyIdx + 1
    local subCategoryCount = categoryInfo:getSubCategoryListCount()
    for subIdx = 0, subCategoryCount - 1 do
      self._categoryIdxMap[keyIdx] = {
        _isMain = false,
        _index = mainIdx,
        _subIndex = subIdx
      }
      local subTreeElement = treeElement:createChild(toInt64(0, keyIdx))
      keyIdx = keyIdx + 1
    end
  end
  self._ui.list_ItemCategory:getElementManager():refillKeyList()
end
function PaGlobalFunc_ItemMarket_UpdateMyInfo()
  local self = ItemMarket
  local currentWeight = getWorldMarketCurrentWeight()
  local maxWeight = getWorldMarketMaxWeight()
  local silverInfo = getWorldMarketSilverInfo()
  local walletItemCount = getWorldMarketMyWalletListCount()
  local _const = Defines.s64_const
  local s64_allWeight_div = toInt64(0, currentWeight) / _const.s64_100
  local s64_maxWeight_div = toInt64(0, maxWeight) / _const.s64_100
  local str_AllWeight = string.format("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local str_MaxWeight = string.format("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  self._ui.txt_MarketInvenMoneyValue:SetText(makeDotMoney(silverInfo:getItemCount()))
  self._ui.txt_MarketInvenWeightValue:SetText(str_AllWeight .. " / " .. str_MaxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end
function PaGlobalFunc_ItemMarket_UpdateItemList()
  local self = ItemMarket
  local itemListCount = 0
  local list
  self:buttonSetShow()
  if self._itemListType.categoryList == self._currentListType then
    itemListCount = getWorldMarketListCount()
    list = self._ui.list_MarketItemList
  elseif self._itemListType.detailListByKey == self._currentListType then
    itemListCount = getWorldMarketDetailListCount()
    list = self._ui.list_MarketItemList_Sub
  elseif self._itemListType.detailListByCategory == self._currentListType then
    list = self._ui.list_MarketItemList
  end
  if nil == list then
    _PA_ASSERT(false, "\237\131\128\236\158\133\236\151\144 \235\167\158\235\138\148 \235\166\172\236\138\164\237\138\184\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
    return
  end
  if itemListCount > 0 then
    list:SetShow(true)
    self._ui.txt_NoSerchResult:SetShow(false)
  else
    list:SetShow(false)
    self._ui.txt_NoSerchResult:SetShow(true)
    self._ui.txt_NoSerchResult:ComputePos()
  end
  list:getElementManager():clearKey()
  for idx = 0, itemListCount - 1 do
    list:getElementManager():pushKey(toInt64(0, idx))
  end
  list:requestUpdateVisible()
end
function ItemMarket:buttonSetShow()
  self._ui.list_MarketItemList:SetShow(false)
  self._ui.list_MarketItemList_Sub:SetShow(false)
  self._ui.stc_SelectedItemBg:SetShow(false)
  self._ui.btn_BackPage:SetShow(false)
  self._ui.btn_SetRegistAlarm:SetShow(false)
  self._ui.checkBtn_SortRegistItemCount:SetShow(false)
  self._ui.checkBtn_SortAcerageTradePrice:SetShow(false)
  if self._itemListType.categoryList == self._currentListType then
    self._ui.checkBtn_SortRegistItemCount:SetShow(true)
    self._ui.checkBtn_SortAcerageTradePrice:SetShow(true)
  elseif self._itemListType.detailListByKey == self._currentListType then
    self._ui.stc_SelectedItemBg:SetShow(true)
    self._ui.btn_BackPage:SetShow(true)
    self._ui.btn_SetRegistAlarm:SetShow(true)
  elseif self._itemListType.detailListByCategory == self._currentListType then
  end
end
function FromClient_ItemMarket_ResponseList()
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  self._currentListType = 1
  PaGlobalFunc_ItemMarket_UpdateItemList()
end
function FromClient_ItemMarket_ResponseDetailListByCategory()
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  self._currentListType = 2
  PaGlobalFunc_ItemMarket_UpdateItemList()
end
function FromClient_ItemMarket_ResponseDetailListByKey()
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  self._currentListType = 3
  PaGlobalFunc_ItemMarket_UpdateItemList()
end
function InputMLUp_ItemMarket_RequestDetailListByKey(itemIdx)
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
    return
  end
  local itemInfo = getWorldMarketListByIdx(idx)
  if nil == itemInfo then
    _PA_ASSERT(false, "\236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : getWorldMarketListByIdx( idx )")
    return
  end
  self:setSelectSlot(itemIdx)
  ToClient_requestDetailListByWorldMarketByItemKey(itemInfo:getItemKeyRaw())
end
function InputMLUp_ItemMarket_RequestBiddingList(idx)
  local self = ItemMarket
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ItemMarket")
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
function ItemMarket:itemSubListOpen()
  PaGlobalFunc_ItemMarket_UpdateItemList()
end
function ItemMarket:itemSubListClose()
end
function ItemMarket:itemListOpen()
  PaGlobalFunc_ItemMarket_UpdateItemList()
end
function ItemMarket:itemListClose()
end
function PaGlobalFunc_ItemMarket_Open()
  local self = ItemMarket
  if false == _panel:GetShow() then
    _PA_ASSERT(false, "\235\169\148\236\157\184 \237\140\168\235\132\144\236\157\180 \236\151\180\235\160\164\236\158\136\236\167\128 \236\149\138\236\157\128\235\141\176 \236\149\132\236\157\180\237\133\156 \235\167\136\236\188\147\236\157\132 \236\151\180\235\160\164\234\179\160 \237\150\136\236\138\181\235\139\136\235\139\164. : \237\140\168\235\132\144 : Panel_Window_MarketPlace_Main")
    return
  end
  self:open()
end
function PaGlobalFunc_ItemMarket_Close()
  local self = ItemMarket
  if false == _panel:GetShow() then
    _PA_ASSERT(false, "\235\169\148\236\157\184 \237\140\168\235\132\144\236\157\180 \236\151\180\235\160\164\236\158\136\236\167\128 \236\149\138\236\157\128\235\141\176 \236\149\132\236\157\180\237\133\156 \235\167\136\236\188\147\236\157\132 \236\151\180\235\160\164\234\179\160 \237\150\136\236\138\181\235\139\136\235\139\164. : \237\140\168\235\132\144 : Panel_Window_MarketPlace_Main")
    return
  end
  self:close()
end
function ItemMarket:open()
  self._selectedMainKey = -1
  self._selectedSubKey = -1
  self._currentListType = nil
  _mainBg:SetShow(true)
  PaGlobalFunc_ItemMarket_Update()
end
function ItemMarket:close()
  _mainBg:SetShow(false)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MarketPlace_Init")
