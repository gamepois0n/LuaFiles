local _panel = Panel_Window_MarketPlace
local UI_color = Defines.Color
local MarketPlace = {
  _ui = {
    stc_TopBg = UI.getChildControl(_panel, "Static_TopBg"),
    stc_RadioButtonBg = UI.getChildControl(_panel, "Static_RadioButtonBg"),
    stc_LeftBg = UI.getChildControl(_panel, "Static_LeftBg"),
    stc_MyItemListBg = UI.getChildControl(_panel, "Static_MyItemListBg"),
    stc_MarketItemListBg = UI.getChildControl(_panel, "Static_MarketItemListBg"),
    stc_ItemDetailBg = UI.getChildControl(_panel, "Static_ItemDetailBg"),
    stc_BottomBg = UI.getChildControl(_panel, "Static_BottomBg")
  },
  _tabIdx = {itemMarket = 1, myAsset = 2},
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
  _isEsc = false,
  _isOpenFromDialog = false,
  _isOpenByMaid = false,
  _isWorldMapOpen = false
}
function MarketPlace:init()
  self._ui.btn_MarketPlace = UI.getChildControl(self._ui.stc_RadioButtonBg, "RadioButton_MarketPlace")
  self._ui.btn_MyAsset = UI.getChildControl(self._ui.stc_RadioButtonBg, "RadioButton_MyAsset")
  self._ui.stc_WalletBg = UI.getChildControl(self._ui.stc_LeftBg, "Static_WalletBg")
  self._ui.list_ItemCategory = UI.getChildControl(self._ui.stc_LeftBg, "List2_Category")
  self._ui.stc_AssetBg = UI.getChildControl(self._ui.stc_LeftBg, "Static_MarketInventoryBg")
  self._ui.btn_WalletConsoleUI = UI.getChildControl(self._ui.stc_AssetBg, "Button_X_ConsoleUI")
  self._ui.list_MarketItemList = UI.getChildControl(self._ui.stc_MarketItemListBg, "List2_ItemList")
  self._ui.stc_SortBg = UI.getChildControl(self._ui.stc_MarketItemListBg, "Static_SortBg")
  self._ui.txt_NoResult = UI.getChildControl(self._ui.stc_MarketItemListBg, "StaticText_NoSearchResult")
  self._ui.stc_ItemDetailInfoBg = UI.getChildControl(self._ui.stc_ItemDetailBg, "Static_ItemInfoBg")
  self._ui.list_ItemBiddingList = UI.getChildControl(self._ui.stc_ItemDetailBg, "List2_PriceList")
  self._ui.btn_BConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "Button_B_ConsoleUI")
  self._ui.btn_AConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "Button_A_ConsoleUI")
  self._ui.btn_GiveUpConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "Button_X_ConsoleUI")
  self:registEvent()
end
function MarketPlace:registEvent()
  self._ui.btn_MarketPlace:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_OpenItemMarketTab()")
  self._ui.btn_MyAsset:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_OpenMyAssetTab()")
  self._ui.btn_WalletConsoleUI:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_WalletOpen()")
  self._ui.list_ItemCategory:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_MarketPlace_CreateControlCategoryList")
  self._ui.list_ItemCategory:createChildContent(CppEnums.PAUIList2ElementManagerType.tree)
  self._ui.list_MarketItemList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_MarketPlace_CreateControlMarketItemList")
  self._ui.list_MarketItemList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  registerEvent("FromClient_notifyItemMarketMessage", "FromClient_MarketPlace_NotifyMessage")
  registerEvent("FromClient_responseListByWorldMarket", "FromClient_MarketPlace_ResponseList")
  registerEvent("FromClient_responseDetailListByWorldMarketByGroupNo", "FromClient_MarketPlace_ResponseDetailListByCategory")
  registerEvent("FromClient_responseDetailListByWorldMarketByItemKey", "FromClient_MarketPlace_ResponseDetailListByKey")
  registerEvent("FromClient_responseGetBiddingList", "FromClient_MarketPlace_responseGetBiddingList")
end
function MarketPlace:open(tabIdx)
  self._currentTabIdx = tabIdx
  self._selectedMainKey = -1
  self._selectedSubKey = -1
  self._prevListCount = 0
  self._currentListType = nil
  requestOpenItemMarket()
  ToClient_requestCreateMyWallet()
  self._ui.list_ItemCategory:SetShow(false)
  self._ui.stc_AssetBg:SetShow(false)
  self._ui.stc_MarketItemListBg:SetShow(false)
  self._ui.stc_MyItemListBg:SetShow(false)
  self._ui.btn_WalletConsoleUI:SetShow(false)
  self._ui.list_MarketItemList:SetShow(false)
  if self._currentTabIdx == self._tabIdx.itemMarket then
    self._ui.list_ItemCategory:SetShow(true)
    self._ui.stc_MarketItemListBg:SetShow(true)
  elseif self._currentTabIdx == self._tabIdx.myAsset then
    self._ui.stc_AssetBg:SetShow(true)
    self._ui.stc_MyItemListBg:SetShow(true)
  end
  if true == self._isOpenFromDialog then
    self._ui.btn_WalletConsoleUI:SetShow(true)
    self._ui.btn_BConsoleUI:addInputEvent("Mouse_LUp", "PaGlobalFunc_MarketPlace_CloseToDialog()")
  elseif false == self._isOpenFromDialog then
    self._ui.btn_BConsoleUI:addInputEvent("Mouse_LUp", "FGolbal_ItemMarketNew_Close()")
  end
  self:update()
  _panel:SetShow(true)
end
function MarketPlace:close()
  _panel:SetShow(false)
end
function MarketPlace:update()
  self._ui.list_ItemCategory:getElementManager():clearKey()
  self._ui.list_MarketItemList:getElementManager():clearKey()
  self._ui.txt_NoResult:SetShow(true)
  self._ui.txt_NoResult:ComputePos()
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
function MarketPlace:updateItemList()
  local itemListCount = 0
  if self._itemListType.categoryList == self._currentListType then
    itemListCount = getWorldMarketListCount()
  elseif self._itemListType.detailListByKey == self._currentListType then
    itemListCount = getWorldMarketDetailListCount()
  end
  if itemListCount > 0 then
    self._ui.list_MarketItemList:SetShow(true)
    self._ui.txt_NoResult:SetShow(false)
  else
    self._ui.list_MarketItemList:SetShow(false)
    self._ui.txt_NoResult:SetShow(true)
    self._ui.txt_NoResult:ComputePos()
  end
  if itemListCount > self._prevListCount then
    for idx = self._prevListCount, itemListCount - 1 do
      self._ui.list_MarketItemList:getElementManager():pushKey(toInt64(0, idx))
    end
  else
    for idx = itemListCount, self._prevListCount - 1 do
      self._ui.list_MarketItemList:getElementManager():removeKey(toInt64(0, idx))
    end
  end
  self._prevListCount = itemListCount
  self._ui.list_MarketItemList:requestUpdateVisible()
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
  local itemInfo
  local txt_ItemName = UI.getChildControl(contents, "StaticText_ItemName")
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
    local nameColor = self:setNameColor(nameColorGrade)
    txt_ItemName:SetFontColor(nameColor)
    local itemNameStr = self:setNameAndEnchantLevel(enchantLevel, itemSSW:getItemType(), itemSSW:getName(), itemSSW:getItemClassify())
    txt_ItemName:SetText(itemNameStr)
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
    local nameColor = self:setNameColor(nameColorGrade)
    txt_ItemName:SetFontColor(nameColor)
    txt_ItemName:SetText(tostring(itemSSW:getName()))
    btn_ButtonBg:addInputEvent("Mouse_LUp", "InputMLUp_MarketPlace_RequestDetailListByKey(" .. itemInfo:getItemKeyRaw() .. ")")
  end
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
end
function FGlobal_ItemMarket_OpenByMaid()
  _PA_ASSERT(false, "\237\149\180\235\139\185 \237\149\168\236\136\152\234\176\128 \236\149\132\236\167\129 \234\181\172\237\152\132\235\144\152\236\167\128 \236\149\138\236\149\152\236\138\181\235\139\136\235\139\164!! : FGlobal_ItemMarket_OpenByMaid")
  self:open(self._tabIdx.itemMarket)
end
function PaGlobalFunc_MarketPlace_Init()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:init()
end
function InputMLUp_MarketPlace_OpenItemMarketTab()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:open(self._tabIdx.itemMarket)
end
function InputMLUp_MarketPlace_OpenMyAssetTab()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  self:open(self._tabIdx.myAsset)
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
function InputMLUp_MarketPlace_MainCategoryList(index)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
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
function InputMLUp_MarketPlace_SubCategoryList(index)
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
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
  ToClient_requestGetBiddingList(itemEnchantKey)
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
function FromClient_MarketPlace_responseGetBiddingList()
  local self = MarketPlace
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketPlace")
    return
  end
  _PA_LOG("\236\162\133\237\152\132", "FromClient_MarketPlace_responseGetBiddingList")
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
