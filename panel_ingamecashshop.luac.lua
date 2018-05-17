-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\ingamecashshop\panel_ingamecashshop.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_PLT = CppEnums.CashPurchaseLimitType
local UI_CCC = CppEnums.CashProductCategory
local IM = CppEnums.EProcessorInputMode
local UI_SERVICE_RESOURCE = CppEnums.ServiceResourceType
Panel_IngameCashShop:SetShow(false, false)
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_InGameCashShop}, false)
local inGameShop = {
_config = {
_slot = {_startX = 15, _startY = 238, _gapY = 70}
, 
_tab = {_startX = 719, _startY = 0, _gapY = 56, _gapYY = 65}
, 
_item = {_startX = 0, _startY = 25, _gapX = 35}
, 
_relatedItem = {_startX = 0, _startY = 25, _gapX = 35}
, 
_desc = {_startY = 140, _gapY = 25}
, 
_subButton = {_startY = 87, _gapY = 38}
, 
_subButtonSize = {_BigX = 303, _SmallX = 121}
}
, 
_const = {_sortTypeAsc = 1, _sortTypeDesc = 2}
, _static_TopLineBG = (UI.getChildControl)(Panel_IngameCashShop, "Static_TopLineBG"), _static_PromotionBanner = (UI.getChildControl)(Panel_IngameCashShop, "Static_PromotionBanner"), _static_GradationTop = (UI.getChildControl)(Panel_IngameCashShop, "Static_Gradation_Top"), _static_GradationBottom = (UI.getChildControl)(Panel_IngameCashShop, "Static_Gradation_Bottom"), _staticText_CashCount = (UI.getChildControl)(Panel_IngameCashShop, "StaticText_NowCashCount"), _staticText_PearlCount = (UI.getChildControl)(Panel_IngameCashShop, "StaticText_NowPearlCount"), _staticText_SilverCount = (UI.getChildControl)(Panel_IngameCashShop, "StaticText_SilverCount"), _staticText_MileageCount = (UI.getChildControl)(Panel_IngameCashShop, "StaticText_MileageCount"), _static_SideLineLeft = (UI.getChildControl)(Panel_IngameCashShop, "Static_SideLineLeft"), _static_SideLineRight = (UI.getChildControl)(Panel_IngameCashShop, "Static_SideLineRight"), _scroll_IngameCash = (UI.getChildControl)(Panel_IngameCashShop, "Scroll_IngameCash"), _static_ScrollArea = (UI.getChildControl)(Panel_IngameCashShop, "Static_ScrollArea"), _static_ScrollArea1 = (UI.getChildControl)(Panel_IngameCashShop, "Static_ScrollArea_1"), _static_ScrollArea2 = (UI.getChildControl)(Panel_IngameCashShop, "Static_ScrollArea_2"), _static_Construction = (UI.getChildControl)(Panel_IngameCashShop, "Static_Construction"), _edit_Search = (UI.getChildControl)(Panel_IngameCashShop, "Edit_GoodsName"), _button_Search = (UI.getChildControl)(Panel_IngameCashShop, "Button_Search"), _combo_Class = (UI.getChildControl)(Panel_IngameCashShop, "Combobox_ClassSort"), _combo_Sort = (UI.getChildControl)(Panel_IngameCashShop, "Combobox_PriceSort"), _combo_SubFilter = (UI.getChildControl)(Panel_IngameCashShop, "Combobox_SubFilter"), _haveCashBoxBG = (UI.getChildControl)(Panel_IngameCashShop, "Static_HaveCashBoxBG"), _pearlBox = (UI.getChildControl)(Panel_IngameCashShop, "Static_PearlBox"), _nowPearlIcon = (UI.getChildControl)(Panel_IngameCashShop, "Static_NowPearlIcon"), _silverBox = (UI.getChildControl)(Panel_IngameCashShop, "Static_SilverBox"), _silver = (UI.getChildControl)(Panel_IngameCashShop, "Static_SilverIcon"), _mileageBox = (UI.getChildControl)(Panel_IngameCashShop, "Static_MileageBox"), _mileage = (UI.getChildControl)(Panel_IngameCashShop, "Static_MileageIcon"), _cashBox = (UI.getChildControl)(Panel_IngameCashShop, "Static_CashBox"), _nowCash = (UI.getChildControl)(Panel_IngameCashShop, "Static_CashIcon"), _btn_BuyPearl = (UI.getChildControl)(Panel_IngameCashShop, "Button_BuyPearl"), _btn_BuyDaum = (UI.getChildControl)(Panel_IngameCashShop, "Button_BuyDaum"), _btn_RefreshCash = (UI.getChildControl)(Panel_IngameCashShop, "Button_RefreshCash"), _btn_HowUsePearl = (UI.getChildControl)(Panel_IngameCashShop, "Button_PearlHowUse"), 
desc = {_static_ItemNameCombo = nil, _staticText_Title = nil, _static_SlotBG = nil, _static_Slot = nil, _static_Desc = nil, _staticText_ProductInfo_Title = nil, _staticText_PurchaseLimit = nil, _static_VestedDesc = nil, _static_TradeDesc = nil, _static_ClassDesc = nil, _static_WarningDesc = nil, _static_DiscountPeriodDesc = nil, _static_ItemListTitle = nil, _static_RelatedItemTitle = nil, _static_PearlIcon = nil, _static_PearOriginalPrice = nil, _static_PearlPrice = nil, _btn_BigBuy = nil, _btn_BigBuy_M = nil, _btn_BigBuy_C = nil, _btn_BigBuy_Silver = nil, _btn_BigCart = nil, _btn_BigGift = nil, _btn_BigECart = nil}
, _subItemButton = (Array.new)(), _subItemCount = 20, _endSunPositionY = 0, _bigButtonCount = 0, _smallButtonCount = 0, _skipCount = 0, _itemCount = 20, _items = (Array.new)(), _relatedItems = (Array.new)(), _comboList = (Array.new)(), _listComboCount = 1, _listComboIncludeDummyCount = 1, itemDescDetailSize = 0, _chooseProductList = (Array.new)(), _chooseProductListCount = 10, _chooseProductClickList = (Array.new)(), _endChoosePositionY = 0, _openFunction = false, _openProductKeyRaw = -1, _categoryWeb = nil, _promotionWeb = nil, _promotionSizeY = 0, 
_promotionTab = {}
, 
_myCartTab = {}
, _tabCount = getCashMainCategorySize(), _slotCount = 30, _sortCount = 3, _slots = (Array.new)(), _tabs = (Array.new)(), _subTapSelect = nil, _list = (Array.new)(), _listCount = 0, _currentTab = nil, _previousTab = nil, _openByEventAlarm = false, _currentPos = 0, _position = 0, _maxDescSize = 200, _checkTab = false, _pricePosX = 0, _currentIndex = 0, _isClick = false, _isSubItemClick = false, _categoryProductKeyRaw = -1, _currentProductKeyRaw = -1, _cashProductNoData = -1, _cashProductIndex = 1, _ViewingRecommend = false}
inGameShop._scrollBTN_IngameCash = (UI.getChildControl)(inGameShop._scroll_IngameCash, "Scroll_CtrlButton")
inGameShop._combo_ClassList = (UI.getChildControl)(inGameShop._combo_Class, "Combobox_List")
inGameShop._combo_SubFilterList = (UI.getChildControl)(inGameShop._combo_SubFilter, "Combobox_List")
inGameShop._combo_SortList = (UI.getChildControl)(inGameShop._combo_Sort, "Combobox_List")
inGameShop._goodDescBG = (UI.getChildControl)(inGameShop._static_ScrollArea, "Static_GoodsDescBG")
local _AllBG = (UI.getChildControl)(Panel_IngameCashShop, "Static_AllBG")
local tabId = {promotionTab = 0, cart = inGameShop._tabCount + 1}
local tabIndexList = (Array.new)()
local tabIndexInfo = {DisplayOrder = 1, NoRaw = 2, TabImageNo = 3, IconPath = 4, CategoryType = 5}
local tabIconTexture1 = {
{39, 0, 77, 38}
, 
{78, 0, 122, 43}
; 
[0] = {0, 0, 38, 38}
}
local tagTexture = {
{4, 3, 238, 67}
, 
{4, 70, 238, 134}
, 
{278, 246, 512, 310}
, 
{4, 204, 238, 268}
, 
{274, 443, 508, 507}
, 
{4, 137, 238, 201}
; 
[0] = {0, 0, 0, 0}
}
local soldoutTexture = {0, 0, 234, 64}
local contry = {kr = 0, jp = 1, ru = 2, kr2 = 3, tw = 4}
local cashIconType = {cash = 0, pearl = 1, mileage = 2, silver = 3}
local cashIconTexture = {
[cashIconType.cash] = {
{267, 479, 286, 498}
, 
{310, 479, 329, 498}
, 
{310, 479, 329, 498}
, 
{310, 479, 329, 498}
; 
[0] = {310, 479, 329, 498}
}
, 
[cashIconType.pearl] = {
{287, 479, 307, 498}
, 
{287, 479, 307, 498}
, 
{287, 479, 307, 498}
, 
{287, 479, 307, 498}
; 
[0] = {287, 479, 307, 498}
}
, 
[cashIconType.mileage] = {
{333, 479, 351, 498}
, 
{333, 479, 351, 498}
, 
{333, 479, 351, 498}
, 
{333, 479, 351, 498}
; 
[0] = {333, 479, 351, 498}
}
, 
[cashIconType.silver] = {
{0, 0, 30, 30}
, 
{0, 0, 30, 30}
, 
{0, 0, 30, 30}
, 
{0, 0, 30, 30}
; 
[0] = {0, 0, 30, 30}
}
}
local subFilterList = {furnitureSet = 0, furnitureOnePiece = 1, Chandelier = 2, floor = 3, wall = 4, furnitureEtc = 5, avartarSet = 6, avartarOnePiece = 7, underWear = 8, accessoryHead = 9, accessoryEyes = 10, accessoryMouse = 11}
local subFilterCount = 12
local subFilterListReplace = {
[subFilterList.furnitureSet] = {id = 1, str = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SUBFILTER_FURNITURE_FURNITURESET")}
, 
[subFilterList.furnitureOnePiece] = {id = 2, str = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_TAB_4")}
, 
[subFilterList.Chandelier] = {id = 3, str = PAGetString(Defines.StringSheet_GAME, "HOUSINGMODE_OBJECT_CHANDELIER")}
, 
[subFilterList.floor] = {id = 4, str = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SUBFILTER_FURNITURE_FLOOR")}
, 
[subFilterList.wall] = {id = 5, str = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SUBFILTER_FURNITURE_WALL")}
, 
[subFilterList.furnitureEtc] = {id = 6, str = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SUBFILTER_FURNITURE_FURNITUREETC")}
, 
[subFilterList.avartarSet] = {id = 11, str = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SUBFILTER_AVARTAR_AVARTARSET")}
, 
[subFilterList.avartarOnePiece] = {id = 12, str = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SUBFILTER_AVARTAR_AVARTAR_PIECE")}
, 
[subFilterList.underWear] = {id = 13, str = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_UNDERWEAR")}
, 
[subFilterList.accessoryHead] = {id = 14, str = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HEAD")}
, 
[subFilterList.accessoryEyes] = {id = 15, str = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_EYES")}
, 
[subFilterList.accessoryMouse] = {id = 16, str = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MOUSE")}
}
local eCountryType = CppEnums.CountryType
local gameServiceType = getGameServiceType()
local isKorea = eCountryType.NONE == gameServiceType or eCountryType.DEV == gameServiceType or eCountryType.KOR_ALPHA == gameServiceType or eCountryType.KOR_REAL == gameServiceType or eCountryType.KOR_TEST == gameServiceType
local isNaver = (CppEnums.MembershipType).naver == getMembershipType()
local nilIconPath = "New_Icon/03_ETC/item_unknown.dds"
local nilProductIconPath = "New_Icon/09_Cash/03_Product/00021034.dds"
local disCountSetUse = false
local isTaiwanNation = false
InGameShop_GameTypeCheck = function()
  -- function num : 0_0 , upvalues : disCountSetUse, isTaiwanNation
  if isGameTypeEnglish() then
    disCountSetUse = true
  else
    disCountSetUse = false
  end
  if isGameTypeTaiwan() then
    isTaiwanNation = true
  else
    if isGameTypeTR() or isGameTypeTH() or isGameTypeID() then
      isTaiwanNation = true
    else
      if isGameTypeKorea() then
        isTaiwanNation = true
      else
        isTaiwanNation = false
      end
    end
  end
end

local tag_changeTexture = function(slot, tagType)
  -- function num : 0_1 , upvalues : tagTexture
  local control = slot.tag
  control:ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/CashShop_03.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, (tagTexture[tagType])[1], (tagTexture[tagType])[2], (tagTexture[tagType])[3], (tagTexture[tagType])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

local sale_changeTexture = function(slot)
  -- function num : 0_2 , upvalues : soldoutTexture
  local control = slot.soldout
  control:ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/CashShop_SoldOutBanner_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, soldoutTexture[1], soldoutTexture[2], soldoutTexture[3], soldoutTexture[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

cashIcon_changeTexture = function(control, contry)
  -- function num : 0_3 , upvalues : cashIconTexture, cashIconType
  control:ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/CashShop_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, ((cashIconTexture[cashIconType.cash])[contry])[1], ((cashIconTexture[cashIconType.cash])[contry])[2], ((cashIconTexture[cashIconType.cash])[contry])[3], ((cashIconTexture[cashIconType.cash])[contry])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

cashIcon_changeTextureForList = function(control, contry, iconType)
  -- function num : 0_4 , upvalues : cashIconType, cashIconTexture
  local cashIconPath = ""
  if cashIconType.cash == iconType or cashIconType.pearl == iconType or cashIconType.mileage == iconType then
    cashIconPath = "new_ui_common_forlua/window/ingamecashshop/CashShop_01.dds"
  else
    if cashIconType.silver == iconType then
      cashIconPath = "new_ui_common_forlua/window/inventory/silver.dds"
    end
  end
  control:ChangeTextureInfoName(cashIconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control, ((cashIconTexture[iconType])[contry])[1], ((cashIconTexture[iconType])[contry])[2], ((cashIconTexture[iconType])[contry])[3], ((cashIconTexture[iconType])[contry])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

InGameShop_SortTap = function(lhs, rhs)
  -- function num : 0_5
  do return lhs[1] < rhs[1] end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

inGameShop.sortTapData = function(self)
  -- function num : 0_6 , upvalues : tabIndexList
  (table.sort)(tabIndexList, InGameShop_SortTap)
end

inGameShop.init = function(self)
  -- function num : 0_7 , upvalues : subFilterCount, subFilterListReplace, tabIndexList, UI_TM, tabId, UI_color, _AllBG, contry
  local tabConfig = (self._config)._tab
  local slotConfig = (self._config)._slot
  local maxSlotCount = self._slotCount
  local count = 0
  local classCount = getCharacterClassCount()
  ;
  (self._combo_Class):DeleteAllItem()
  ;
  (self._combo_Class):AddItemWithKey(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_CLASSBASE"), getCharacterClassCount())
  for ii = 0, classCount - 1 do
    local classType = getCharacterClassTypeByIndex(ii)
    local className = getCharacterClassName(classType)
    if className ~= nil and className ~= "" and className ~= " " then
      (self._combo_Class):AddItemWithKey(className, classType)
      count = count + 1
    end
  end
  ;
  (self._combo_ClassList):SetSize((self._combo_ClassList):GetSizeX(), (count) * 25)
  ;
  (self._combo_ClassList):SetEnableArea(0, 0, (self._combo_ClassList):GetSizeX(), (count) * 25)
  local classControl = (self._combo_Class):GetListControl()
  classControl:SetItemQuantity(count + 1)
  ;
  (self._combo_SubFilter):DeleteAllItem()
  for idx = 0, subFilterCount - 1 do
    (self._combo_SubFilter):AddItemWithKey((subFilterListReplace[idx]).str, (subFilterListReplace[idx]).id)
  end
  ;
  (self._combo_SubFilterList):SetSize((self._combo_SubFilterList):GetSizeX(), subFilterCount * 20)
  ;
  (self._combo_SubFilterList):SetEnableArea(0, 0, (self._combo_SubFilterList):GetSizeX(), subFilterCount * 20)
  local subFilterControl = (self._combo_SubFilter):GetListControl()
  subFilterControl:SetItemQuantity(subFilterCount)
  ;
  (self._combo_Sort):DeleteAllItem()
  for ii = 0, self._sortCount - 1 do
    (self._combo_Sort):AddItemWithKey(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_SORT_" .. ii), ii)
  end
  ;
  (self._combo_SortList):SetSize((self._combo_SortList):GetSizeX(), self._sortCount * 20)
  ;
  (self._combo_SortList):SetEnableArea(0, 0, (self._combo_SortList):GetSizeX(), self._sortCount * 20)
  local sortControl = (self._combo_Sort):GetListControl()
  sortControl:SetItemQuantity(self._sortCount)
  for dd = 1, getCashMainCategorySize() do
    local mainTabInfo = ToClient_GetMainCategoryStaticStatusWrapperByKeyRaw(dd)
    -- DECOMPILER ERROR at PC177: Confused about usage of register: R14 in 'UnsetPending'

    if mainTabInfo ~= nil then
      tabIndexList[dd] = {mainTabInfo:getDisplayOrder(), mainTabInfo:getNoRaw(), mainTabInfo:getTabImageNo(), mainTabInfo:getIconPath(), mainTabInfo:getCategoryType(), mainTabInfo:getEventKey()}
    end
  end
  self:sortTapData()
  for ii = 1, self._tabCount do
    local tab = {}
    tab.static = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "RadioButton_CategoryTab_" .. tostring(tostring((tabIndexList[ii])[3])), Panel_IngameCashShop, "InGameShop_Tab_" .. ii)
    tab.text = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "StaticText_Category_" .. tostring(tostring((tabIndexList[ii])[3])), tab.static, "InGameShop_Text_" .. ii)
    ;
    (tab.text):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (tab.static):SetText("")
    tab.icon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "Static_ButtonIcon_0", tab.static, "InGameShop_Tab_Icon_" .. ii)
    _ingameCash_SetTabIconTexture(tab.icon, ii, 0)
    ;
    (tab.text):SetText(getCashCategoryName((tabIndexList[ii])[2], CppEnums.CashProductCategoryNo_Undefined))
    ;
    (tab.static):addInputEvent("Mouse_LUp", "InGameShop_TabEvent(" .. ii .. ")")
    ;
    (tab.static):addInputEvent("Mouse_On", "_inGameShop_TabOnOut_ChangeTexture( true, " .. ii .. ")")
    ;
    (tab.static):addInputEvent("Mouse_Out", "_inGameShop_TabOnOut_ChangeTexture( false, " .. ii .. ")")
    ;
    (tab.static):SetShow(true)
    -- DECOMPILER ERROR at PC285: Confused about usage of register: R14 in 'UnsetPending'

    ;
    (self._tabs)[ii] = tab
    -- DECOMPILER ERROR at PC291: Confused about usage of register: R14 in 'UnsetPending'

    ;
    ((self._tabs)[ii])._subTab = (Array.new)()
    local subCategoryCount = getCashMiddleCategorySize((tabIndexList[ii])[2])
    for jj = 1, subCategoryCount do
      local subtab = {}
      subtab.static = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "Static_SubCategory", Panel_IngameCashShop, "InGameShop_SubTab_" .. ii .. "_" .. jj)
      subtab.text = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "StaticText_SubCategoryName", subtab.static, "InGameShop_SubTabText_" .. ii .. "_" .. jj)
      ;
      (subtab.text):SetTextMode(UI_TM.eTextMode_LimitText)
      ;
      (subtab.text):SetText(getCashCategoryName((tabIndexList[ii])[2], jj))
      local isSubTabLimit = (subtab.text):IsLimitText()
      if isSubTabLimit then
        (subtab.text):addInputEvent("Mouse_On", "InGameShop_SubTab_Tooltip(true, " .. ii .. ", " .. jj .. ")")
        ;
        (subtab.text):addInputEvent("Mouse_Out", "InGameShop_SubTab_Tooltip(false)")
      else
        ;
        (subtab.text):addInputEvent("Mouse_On", "")
        ;
        (subtab.text):addInputEvent("Mouse_Out", "")
      end
      ;
      (subtab.text):addInputEvent("Mouse_LUp", "InGameShop_SubTabEvent(" .. ii .. ", " .. jj .. ")")
      ;
      (subtab.static):SetShow(false)
      ;
      (subtab.text):SetShow(false)
      -- DECOMPILER ERROR at PC392: Confused about usage of register: R21 in 'UnsetPending'

      ;
      (((self._tabs)[ii])._subTab)[jj] = subtab
    end
  end
  local subTapSelect = {}
  subTapSelect.static = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "Static_SelectedSubCategory", Panel_IngameCashShop, "InGameShop_SubTabSelect_" .. 1)
  ;
  (subTapSelect.static):SetShow(false)
  self._subTapSelect = subTapSelect
  local promotionTab = {}
  promotionTab.static = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "RadioButton_CategoryTab_0", Panel_IngameCashShop, "InGameShop_PromotionTab")
  promotionTab.icon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "Static_ButtonIcon_0", promotionTab.static, "InGameShop_PromotionTab_Icon")
  ;
  (promotionTab.static):SetPosX(tabConfig._startX)
  ;
  (promotionTab.static):SetPosY(5)
  ;
  (promotionTab.static):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_PROMOTIONTAB_FIRST"))
  _ingameCash_SetTabIconTexture(promotionTab.icon, tabId.promotionTab, 0)
  ;
  (promotionTab.static):SetShow(true)
  self._promotionTab = promotionTab
  for ii = 0, maxSlotCount - 1 do
    local slot = {}
    slot.productNoRaw = nil
    slot.static = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Static_GoodsBG", self._static_ScrollArea, "InGameShop_Slot_" .. ii)
    slot.productIcon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Static_ProductImage", slot.static, "InGameShop_Slot_ProductIcon_" .. ii)
    slot.tag = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Static_GoodsHighlightLine", slot.static, "InGameShop_Slot_Tag_" .. ii)
    slot.soldout = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Static_GoodsSoldout", slot.static, "InGameShop_Slot_Soldout_" .. ii)
    slot.iconBG = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Static_SlotBG", slot.static, "InGameShop_Slot_IconBG_" .. ii)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Static_Slot", slot.iconBG, "InGameShop_Slot_Icon_" .. ii)
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_StaticText_ItemName", slot.static, "InGameShop_Slot_Name_" .. ii)
    slot.discount = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_StaticText_DiscountPeriod", slot.static, "InGameShop_Slot_DiscountPeriod_" .. ii)
    slot.pearlIcon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Static_PearlIcon", slot.static, "InGameShop_Slot_PearlIcon_" .. ii)
    slot.originalPrice = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_StaticText_ItemOriginalPrice", slot.pearlIcon, "InGameShop_Slot_OriginalPrice_" .. ii)
    slot.priceArrow = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_StaticText_ItemPriceArrow", slot.originalPrice, "InGameShop_Slot_PriceArrow_" .. ii)
    slot.price = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_StaticText_ItemPrice", slot.static, "InGameShop_Slot_Price_" .. ii)
    slot.buttonBuy = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Button_Buy", slot.static, "InGameShop_Slot_Buy_" .. ii)
    slot.buttonGift = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Button_Gift", slot.static, "InGameShop_Slot_Gift_" .. ii)
    slot.buttonCart = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "TemplateList_Button_Cart", slot.static, "InGameShop_Slot_Cart_" .. ii)
    ;
    (slot.static):SetPosX(0)
    ;
    (slot.static):SetPosY(slotConfig._gapY * ii)
    ;
    (slot.discount):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    ;
    (slot.name):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    ;
    (slot.productIcon):addInputEvent("Mouse_LUp", "IngameCashShop_SelectedItem(" .. ii .. ", 0" .. ")")
    ;
    (slot.productIcon):addInputEvent("Mouse_UpScroll", "InGameShop_ScrollEvent( true )")
    ;
    (slot.productIcon):addInputEvent("Mouse_DownScroll", "InGameShop_ScrollEvent( false )")
    ;
    (slot.static):addInputEvent("Mouse_UpScroll", "InGameShop_ScrollEvent( true )")
    ;
    (slot.static):addInputEvent("Mouse_DownScroll", "InGameShop_ScrollEvent( false )")
    ;
    (slot.static):addInputEvent("Mouse_LUp", "IngameCashShop_SelectedItem(" .. ii .. ", 0" .. ")")
    ;
    (slot.buttonCart):addInputEvent("Mouse_LUp", "IngameCashShop_CartItem(" .. ii .. ")")
    ;
    (slot.buttonGift):addInputEvent("Mouse_LUp", "IngameCashShop_GiftItem(" .. ii .. ")")
    ;
    (slot.buttonBuy):addInputEvent("Mouse_LUp", "IngameCashShop_BuyItem(" .. ii .. ")")
    ;
    (slot.originalPrice):SetPosX((slot.pearlIcon):GetSizeX() + 3)
    ;
    (slot.originalPrice):SetPosY(1)
    ;
    (slot.originalPrice):SetLineRender(true)
    ;
    (slot.originalPrice):SetFontColor(UI_color.C_FF626262)
    ;
    (slot.price):SetSpanSize(10, 8)
    ;
    (slot.priceArrow):SetPosY((slot.originalPrice):GetPosY() + 7)
    ;
    (slot.tag):SetShow(true)
    ;
    (slot.soldout):SetShow(false)
    ;
    (slot.static):SetShow(false)
    -- DECOMPILER ERROR at PC737: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  self._pricePosX = (((self._slots)[0]).price):GetPosX()
  local myCartTab = {}
  myCartTab.static = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "RadioButton_CartTab", Panel_IngameCashShop, "InGameShop_MyCartTab")
  myCartTab.icon = (UI.createAndCopyBasePropertyControl)(Panel_IngameCashShop, "Static_ButtonIcon_0", myCartTab.static, "InGameShop_MyCartTab_Icon")
  ;
  (myCartTab.static):SetPosX(tabConfig._startX)
  ;
  (myCartTab.static):SetPosY(tabConfig._startY + tabConfig._gapY * (tabId.cart - 1))
  ;
  (myCartTab.static):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_MYCARTTAB"))
  ;
  (myCartTab.static):SetShow(true)
  _ingameCash_SetTabIconTexture(myCartTab.icon, tabId.cart, 0)
  self._myCartTab = myCartTab
  Panel_IngameCashShop:SetChildIndex(self._combo_Class, 9900)
  Panel_IngameCashShop:SetChildIndex(self._combo_Sort, 9900)
  Panel_IngameCashShop:SetChildIndex(self._combo_SubFilter, 9900)
  ;
  (self._static_GradationTop):SetPosX(slotConfig._startX)
  ;
  (self._static_GradationTop):SetPosY(slotConfig._startY)
  ;
  (self._static_GradationBottom):SetPosX(slotConfig._startX)
  ;
  (self._static_GradationBottom):SetPosY((self._static_ScrollArea):GetSizeY() + (self._static_ScrollArea):GetPosY() - (self._static_GradationBottom):GetSizeY())
  FGlobal_Init_IngameCashShop_NewCart(slotConfig._gapY)
  local scrSizeY = getScreenSizeY()
  self._promotionWeb = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_IngameCashShop, "IngameCashShop_PromotionWebLink")
  ;
  (self._promotionWeb):SetShow(true)
  ;
  (self._promotionWeb):SetPosX(0)
  ;
  (self._promotionWeb):SetPosY(0)
  ;
  (self._promotionWeb):SetSize(709, scrSizeY - 95)
  _AllBG:SetSize(_AllBG:GetSizeX(), scrSizeY - 95)
  ;
  (self._promotionWeb):ResetUrl()
  Panel_IngameCashShop:SetChildIndex(self._promotionWeb, 9900)
  self._categoryWeb = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, self._static_PromotionBanner, "IngameCashShop_CategoryWebLink")
  ;
  (self._categoryWeb):SetShow(true)
  ;
  (self._categoryWeb):SetPosX(0)
  ;
  (self._categoryWeb):SetPosY(0)
  ;
  (self._categoryWeb):SetSize(686, 178)
  ;
  (self._categoryWeb):ResetUrl()
  ;
  (self._categoryWeb):addInputEvent("Mouse_Out", "ToClient_CategoryWebFocusOut()")
  ;
  (self._static_PromotionBanner):SetChildIndex(self._categoryWeb, 9900)
  if isGameTypeKorea() then
    cashIcon_changeTexture(self._nowCash, contry.kr)
  else
    if isGameTypeJapan() then
      cashIcon_changeTexture(self._nowCash, contry.jp)
    else
      if isGameTypeRussia() then
        cashIcon_changeTexture(self._nowCash, contry.ru)
      else
        if isGameTypeKR2() then
          cashIcon_changeTexture(self._nowCash, contry.kr2)
          ;
          (self._btn_BuyPearl):SetShow(false)
          ;
          (self._cashBox):SetShow(false)
          ;
          (self._nowCash):SetShow(false)
          ;
          (self._btn_BuyDaum):SetShow(false)
          ;
          (self._btn_RefreshCash):SetShow(false)
          ;
          (self._staticText_CashCount):SetShow(false)
        else
          if isGameTypeTaiwan() or isGameTypeTR() or isGameTypeTH() or isGameTypeID() then
            cashIcon_changeTexture(self._nowCash, contry.tw)
          else
            cashIcon_changeTexture(self._nowCash, contry.kr)
          end
        end
      end
    end
  end
  ;
  (self._nowPearlIcon):addInputEvent("Mouse_On", "InGameShop_MoneyIcon_Tooltip(true,\t\t0)")
  ;
  (self._nowPearlIcon):addInputEvent("Mouse_Out", "InGameShop_MoneyIcon_Tooltip(false,\t0)")
  ;
  (self._mileage):addInputEvent("Mouse_On", "InGameShop_MoneyIcon_Tooltip(true,\t\t1)")
  ;
  (self._mileage):addInputEvent("Mouse_Out", "InGameShop_MoneyIcon_Tooltip(false,\t1)")
  ;
  (self._nowCash):addInputEvent("Mouse_On", "InGameShop_MoneyIcon_Tooltip(true,\t\t2)")
  ;
  (self._nowCash):addInputEvent("Mouse_Out", "InGameShop_MoneyIcon_Tooltip(false,\t2)")
  ;
  (self._btn_HowUsePearl):addInputEvent("Mouse_LUp", "InGameShop_HowUsePearlShop()")
  ;
  (self._staticText_SilverCount):SetShow(false)
  ;
  (self._silverBox):SetShow(false)
  ;
  (self._silver):SetShow(false)
  _AllBG:SetShow(true)
  Panel_IngameCashShop:SetChildIndex(_AllBG, 9800)
  ;
  (self._scroll_IngameCash):SetShow(false)
  FGlobal_ClearCandidate()
end

FGlobal_CashShop_tabInfo_Return = function()
  -- function num : 0_8 , upvalues : tabIndexList
  return tabIndexList
end

inGameShop.RemakeSubFilter = function(self, tabIdx)
  -- function num : 0_9
  local condition = false
  local defaultName = ""
  local settingDefaultName = ""
end

inGameShop.updateMoney = function(self)
  -- function num : 0_10
  local selfProxy = (getSelfPlayer()):get()
  local cash = selfProxy:getCash()
  local pearl = (Defines.s64_const).s64_0
  local mileage = (Defines.s64_const).s64_0
  local pearlItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getPearlSlotNo())
  if pearlItemWrapper ~= nil then
    pearl = (pearlItemWrapper:get()):getCount_s64()
  end
  local mileageItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getMileageSlotNo())
  if mileageItemWrapper ~= nil then
    mileage = (mileageItemWrapper:get()):getCount_s64()
  end
  ;
  (self._staticText_CashCount):SetText(makeDotMoney(cash))
  ;
  (self._staticText_PearlCount):SetText(makeDotMoney(pearl))
  ;
  (self._staticText_MileageCount):SetText(makeDotMoney(mileage))
  return cash, pearl, mileage
end

inGameShop.getMaxPosition = function(self)
  -- function num : 0_11
  if self._openProductKeyRaw ~= -1 and self._openProductKeyRaw ~= nil then
    return (self._listCount - 1) * ((self._config)._slot)._gapY + (((self._slots)[0]).static):GetSizeY() - (self._static_ScrollArea):GetSizeY() + (self._goodDescBG):GetSizeY()
  else
    return (self._listCount - 1) * ((self._config)._slot)._gapY + (((self._slots)[0]).static):GetSizeY() - (self._static_ScrollArea):GetSizeY()
  end
end

inGameShop.isSelectProductGroup = function(self, productNoRaw)
  -- function num : 0_12
  if self._openProductKeyRaw == productNoRaw then
    return true
  end
  for key,value in pairs(self._comboList) do
    if value == productNoRaw then
      return true
    end
  end
  return false
end

inGameShop.setElement = function(self, index, productNoRaw, slot)
  -- function num : 0_13 , upvalues : nilProductIconPath, UI_PLT, sale_changeTexture, tag_changeTexture, nilIconPath, disCountSetUse, UI_CCC
  local maxSlotCount = self._slotCount
  if productNoRaw == nil then
    return false
  end
  local subGroup = 0
  do
    if self._openProductKeyRaw ~= -1 then
      local selectSubItem = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._openProductKeyRaw)
      if selectSubItem ~= nil and selectSubItem:getOfferGroup() ~= 0 then
        subGroup = selectSubItem:getOfferGroup()
      end
    end
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
    if cashProduct == nil then
      return false
    end
    slot.productNoRaw = productNoRaw
    local cashGroup = cashProduct:getOfferGroup()
    if cashGroup ~= 0 and subGroup == cashGroup then
      cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._openProductKeyRaw)
      productNoRaw = self._openProductKeyRaw
    end
    if self:isSelectProductGroup(productNoRaw) then
      InGameShop_ProductListContent_ChangeTexture(slot, true)
    else
      InGameShop_ProductListContent_ChangeTexture(slot, false)
    end
    if cashProduct:getPackageIcon() == nil then
      (slot.productIcon):ChangeTextureInfoName(nilProductIconPath)
    else
      ;
      (slot.productIcon):ChangeTextureInfoName(cashProduct:getPackageIcon())
    end
    ;
    (slot.productIcon):SetMonoTone(false)
    ;
    (slot.soldout):SetShow(false)
    local limitType = cashProduct:getCashPurchaseLimitType()
    if UI_PLT.None ~= limitType then
      local limitCount = cashProduct:getCashPurchaseCount()
      local mylimitCount = (getIngameCashMall()):getRemainingLimitCount(cashProduct:getNoRaw())
      if limitCount > 0 and mylimitCount == 0 then
        (slot.soldout):SetShow(true)
        sale_changeTexture(slot)
        ;
        (slot.productIcon):SetMonoTone(true)
      end
    end
    do
      tag_changeTexture(slot, cashProduct:getTag())
      if cashProduct:getIconPath() == nil then
        (slot.icon):ChangeTextureInfoName("Icon/" .. nilIconPath)
      else
        ;
        (slot.icon):ChangeTextureInfoName("Icon/" .. cashProduct:getIconPath())
      end
      ;
      (slot.icon):addInputEvent("Mouse_On", "InGameShop_ProductShowToolTip( " .. cashProduct:getNoRaw() .. ", " .. index .. " )")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "FGlobal_CashShop_GoodsTooltipInfo_Close()")
      ;
      (slot.name):SetText(cashProduct:getDisplayName())
      ;
      (slot.price):SetText(makeDotMoney(cashProduct:getPrice()))
      ;
      (slot.price):SetPosX(self._pricePosX + 3, (slot.price):GetPosY())
      ;
      (slot.originalPrice):SetShow(false)
      ;
      (slot.priceArrow):SetShow(false)
      ;
      (slot.discount):SetText(cashProduct:getDescription())
      if cashProduct:isApplyDiscount() then
        local startDiscountTimeValue = PATime((cashProduct:getStartDiscountTime()):get_s64())
        local endDiscountTimeValue = PATime((cashProduct:getEndDiscountTime()):get_s64())
        local startDiscountTime = tostring(startDiscountTimeValue:GetYear()) .. "." .. tostring(startDiscountTimeValue:GetMonth()) .. "." .. tostring(startDiscountTimeValue:GetDay())
        local endDiscountTime = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTTIME", "GetYear", tostring(endDiscountTimeValue:GetYear()), "GetMonth", tostring(endDiscountTimeValue:GetMonth()), "GetDay", tostring(endDiscountTimeValue:GetDay())) .. " " .. (string.format)("%.02d", endDiscountTimeValue:GetHour()) .. ":" .. (string.format)("%.02d", endDiscountTimeValue:GetMinute())
        local countryKind = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTTIME", "GetYear", tostring(endDiscountTimeValue:GetYear()), "GetMonth", tostring(endDiscountTimeValue:GetMonth()), "GetDay", tostring(endDiscountTimeValue:GetDay())) .. " " .. (string.format)("%.02d", endDiscountTimeValue:GetHour()) .. ":" .. (string.format)("%.02d", endDiscountTimeValue:GetMinute())
        local remainTime = convertStringFromDatetime(cashProduct:getRemainDiscountTime())
        if disCountSetUse == true then
          countryKind = remainTime
        else
          countryKind = endDiscountTime
        end
        ;
        (slot.discount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_DISCOUNT", "endDiscountTime", countryKind))
        ;
        (slot.originalPrice):SetText(makeDotMoney(cashProduct:getOriginalPrice()))
        ;
        (slot.originalPrice):SetShow(true)
        ;
        (slot.priceArrow):SetPosX((slot.originalPrice):GetTextSizeX() + 3)
        ;
        (slot.priceArrow):SetShow(true)
      end
      do
        local tagType = cashProduct:getTag()
        if (tagType == 4 or tagType == 5) and not cashProduct:isApplyDiscount() and cashProduct:isDefinedDiscount() then
          (slot.tag):SetShow(false)
        else
          ;
          (slot.tag):SetShow(true)
        end
        ;
        (slot.buttonBuy):SetShow(false)
        ;
        (slot.buttonGift):SetShow(false)
        ;
        (slot.buttonCart):SetShow(false)
        InGameShop_ProductListContent_ChangeMoneyIconTexture(slot, cashProduct:getMainCategory(), cashProduct:isMoneyPrice(), false)
        local limitType = cashProduct:getCashPurchaseLimitType()
        if UI_CCC.eCashProductCategory_Pearl == cashProduct:getMainCategory() then
          (slot.buttonBuy):SetMonoTone(false)
          ;
          (slot.buttonGift):SetMonoTone(true)
          ;
          (slot.buttonCart):SetMonoTone(true)
          ;
          (slot.buttonBuy):SetEnable(true)
          ;
          (slot.buttonGift):SetEnable(false)
          ;
          (slot.buttonCart):SetEnable(false)
        else
          if UI_CCC.eCashProductCategory_Mileage == cashProduct:getMainCategory() then
            if UI_PLT.None ~= limitType then
              local limitCount = cashProduct:getCashPurchaseCount()
              local mylimitCount = (getIngameCashMall()):getRemainingLimitCount(cashProduct:getNoRaw())
              if limitCount > 0 then
                (slot.buttonBuy):SetMonoTone(false)
                ;
                (slot.buttonGift):SetMonoTone(true)
                ;
                (slot.buttonCart):SetMonoTone(true)
                ;
                (slot.buttonBuy):SetEnable(true)
                ;
                (slot.buttonGift):SetEnable(false)
                ;
                (slot.buttonCart):SetEnable(false)
                if mylimitCount <= 0 then
                  (slot.buttonBuy):SetMonoTone(true)
                  ;
                  (slot.buttonCart):SetMonoTone(true)
                  ;
                  (slot.buttonBuy):SetEnable(false)
                  ;
                  (slot.buttonCart):SetEnable(false)
                end
              else
                ;
                (slot.buttonBuy):SetMonoTone(true)
                ;
                (slot.buttonGift):SetMonoTone(true)
                ;
                (slot.buttonCart):SetMonoTone(true)
                ;
                (slot.buttonBuy):SetEnable(false)
                ;
                (slot.buttonGift):SetEnable(false)
                ;
                (slot.buttonCart):SetEnable(false)
              end
            else
              do
                ;
                (slot.buttonBuy):SetMonoTone(false)
                ;
                (slot.buttonGift):SetMonoTone(true)
                ;
                (slot.buttonCart):SetMonoTone(true)
                ;
                (slot.buttonBuy):SetEnable(true)
                ;
                (slot.buttonGift):SetEnable(false)
                ;
                (slot.buttonCart):SetEnable(false)
                if UI_PLT.None ~= limitType then
                  local limitCount = cashProduct:getCashPurchaseCount()
                  local mylimitCount = (getIngameCashMall()):getRemainingLimitCount(cashProduct:getNoRaw())
                  if limitCount > 0 then
                    (slot.buttonBuy):SetMonoTone(false)
                    ;
                    (slot.buttonGift):SetMonoTone(true)
                    ;
                    (slot.buttonCart):SetMonoTone(false)
                    ;
                    (slot.buttonBuy):SetEnable(true)
                    ;
                    (slot.buttonGift):SetEnable(false)
                    ;
                    (slot.buttonCart):SetEnable(true)
                    if mylimitCount <= 0 then
                      (slot.buttonBuy):SetMonoTone(true)
                      ;
                      (slot.buttonCart):SetMonoTone(true)
                      ;
                      (slot.buttonBuy):SetEnable(false)
                      ;
                      (slot.buttonCart):SetEnable(false)
                    end
                  else
                    ;
                    (slot.buttonBuy):SetMonoTone(true)
                    ;
                    (slot.buttonGift):SetMonoTone(true)
                    ;
                    (slot.buttonCart):SetMonoTone(true)
                    ;
                    (slot.buttonBuy):SetEnable(false)
                    ;
                    (slot.buttonGift):SetEnable(false)
                    ;
                    (slot.buttonCart):SetEnable(false)
                  end
                else
                  do
                    ;
                    (slot.buttonBuy):SetMonoTone(false)
                    ;
                    (slot.buttonGift):SetMonoTone(false)
                    ;
                    (slot.buttonCart):SetMonoTone(false)
                    ;
                    (slot.buttonBuy):SetEnable(true)
                    ;
                    (slot.buttonGift):SetEnable(true)
                    ;
                    (slot.buttonCart):SetEnable(true)
                    ;
                    (slot.static):SetShow(true)
                    if self._currentPos <= 0 then
                      (self._static_GradationTop):SetShow(false)
                    else
                      ;
                      (self._static_GradationTop):SetShow(true)
                    end
                    if self:getMaxPosition() <= self._currentPos then
                      (self._static_GradationBottom):SetShow(false)
                    end
                    return true
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

inGameShop.updateSlot = function(self)
  -- function num : 0_14
  local maxSlotCount = self._slotCount
  local index = 0
  local pos = 0
  local areaSizeY = (self._static_ScrollArea):GetSizeY()
  local slotSize = (((self._slots)[0]).static):GetSizeY()
  local gapBetweenList = ((self._config)._slot)._gapY
  local gap = ((self._config)._slot)._gapY - slotSize
  for _,slot in pairs(self._slots) do
    (slot.static):SetShow(false)
  end
  for ii = 0, self._listCount - 1 do
    local productNoRaw = (self._list)[ii]
    local slot = (self._slots)[index]
    if slot == nil then
      return 
    end
    ;
    (slot.static):SetShow(false)
    if (self._currentPos + areaSizeY >= pos or self._currentPos < pos + slotSize) and self:setElement(index, productNoRaw, slot) then
      (slot.static):SetPosY(pos - self._currentPos)
      index = index + 1
    end
    if self:isSelectProductGroup(productNoRaw) then
      (self._goodDescBG):SetShow(false)
      if (self._goodDescBG):GetSizeY() < self._maxDescSize and self._position + areaSizeY < pos + (slot.static):GetSizeY() + (self._goodDescBG):GetSizeY() and (self._goodDescBG):GetSizeY() > 1 then
        self._position = pos + (slot.static):GetSizeY() + (self._goodDescBG):GetSizeY() - areaSizeY
        ;
        (self._scroll_IngameCash):SetControlPos(self._position / self:getMaxPosition())
      end
      if self._currentPos < pos + (slot.static):GetSizeY() + (self._goodDescBG):GetSizeY() and pos + (slot.static):GetSizeY() < self._currentPos + areaSizeY and (self._goodDescBG):GetSizeY() > 1 then
        (self._goodDescBG):SetPosY(pos - self._currentPos + (slot.static):GetSizeY())
        ;
        (self._goodDescBG):SetShow(true)
        ;
        ((self.desc)._btn_BigGift):SetSpanSize(100, 10)
        ;
        ((self.desc)._btn_BigECart):SetSpanSize(60, 10)
        ;
        ((self.desc)._btn_BigCart):SetSpanSize(60, 10)
        ;
        ((self.desc)._btn_BigBuy):SetSpanSize(20, 10)
        ;
        ((self.desc)._btn_BigBuy_C):SetSpanSize(20, 10)
        ;
        ((self.desc)._btn_BigBuy_M):SetSpanSize(20, 10)
        ;
        ((self.desc)._btn_BigBuy_Silver):SetSpanSize(20, 10)
        ;
        ((self.desc)._static_PearlIcon):SetSpanSize(155, 60)
        ;
        ((self.desc)._static_PearlPrice):SetSpanSize(30, 60)
        ;
        ((self.desc)._static_PearOriginalPrice):SetSpanSize((self._goodDescBG):GetSizeX() - 153, 59)
      end
      pos = pos + (self._goodDescBG):GetSizeY()
    end
    pos = pos + gapBetweenList
  end
end

inGameShop.initTabPos = function(self)
  -- function num : 0_15
  for ii = 1, self._tabCount do
    local tabConfig = (self._config)._tab
    local tab = (self._tabs)[ii]
    ;
    (tab.static):SetPosX(tabConfig._startX)
    ;
    (tab.static):SetPosY(tabConfig._startY + tabConfig._gapY * (ii - 1))
    ;
    (tab.text):SetPosX(40)
    ;
    (tab.text):SetPosY(5)
  end
end

inGameShop.update = function(self)
  -- function num : 0_16
  if Panel_IngameCashShop_NewCart:GetShow() then
    FGlobal_Close_IngameCashShop_NewCart()
  end
  self:updateMoney()
  local initMaxCount = 30
  for ii = 0, initMaxCount - 1 do
    local slot = (self._slots)[ii]
    slot.productNoRaw = nil
    ;
    (slot.static):SetShow(false)
  end
  self:updateSlot()
end

inGameShop.registMessageHandler = function(self)
  -- function num : 0_17 , upvalues : inGameShop
  Panel_IngameCashShop:RegisterUpdateFunc("InGameCashshopUpdatePerFrame")
  ;
  (self._static_ScrollArea):addInputEvent("Mouse_UpScroll", "InGameShop_ScrollEvent( true  )")
  ;
  (self._static_ScrollArea):addInputEvent("Mouse_DownScroll", "InGameShop_ScrollEvent( false )")
  ;
  (self._button_Search):addInputEvent("Mouse_LUp", "InGameShop_Search()")
  ;
  (self._edit_Search):addInputEvent("Mouse_LUp", "InGameShop_ResetSearchText()")
  ;
  (self._edit_Search):RegistReturnKeyEvent("InGameShop_Search()")
  ;
  (self._scrollBTN_IngameCash):addInputEvent("Mouse_LPress", "HandleClicked_InGameShop_SetScrollIndexByLClick()")
  ;
  (self._scrollBTN_IngameCash):addInputEvent("Mouse_LUp", "HandleClicked_InGameShop_SetScrollIndexByLClick()")
  ;
  (self._scroll_IngameCash):addInputEvent("Mouse_LUp", "HandleClicked_InGameShop_SetScrollIndexByLClick()")
  ;
  (self._combo_Class):addInputEvent("Mouse_LUp", "InGameShop_OpenClassList()")
  ;
  (self._combo_Sort):addInputEvent("Mouse_LUp", "InGameShop_OpenSorList()")
  ;
  (self._combo_SubFilter):addInputEvent("Mouse_LUp", "InGameShop_OpenSubFilterList()")
  ;
  ((self._combo_Class):GetListControl()):addInputEvent("Mouse_LUp", "InGameShop_SelectClass()")
  ;
  ((self._combo_Sort):GetListControl()):addInputEvent("Mouse_LUp", "InGameShop_SelectSort()")
  ;
  ((self._combo_SubFilter):GetListControl()):addInputEvent("Mouse_LUp", "InGameShop_SelectSubFilter()")
  ;
  (inGameShop._goodDescBG):addInputEvent("Mouse_UpScroll", "InGameShop_ScrollEvent( true )")
  ;
  (inGameShop._goodDescBG):addInputEvent("Mouse_DownScroll", "InGameShop_ScrollEvent( false )")
  ;
  ((self._promotionTab).static):addInputEvent("Mouse_LUp", "InGameShop_Promotion_Open()")
  ;
  ((self._promotionTab).static):addInputEvent("Mouse_On", "InGameShop_ShowSimpleToolTip( true, " .. 0 .. " )")
  ;
  ((self._promotionTab).static):addInputEvent("Mouse_Out", "InGameShop_ShowSimpleToolTip( false, " .. 0 .. "  )")
  ;
  ((self._myCartTab).static):addInputEvent("Mouse_LUp", "InGameShop_CartToggle()")
  ;
  ((self._myCartTab).static):addInputEvent("Mouse_On", "InGameShop_ShowSimpleToolTip( true, " .. 1 .. " )")
  ;
  ((self._myCartTab).static):addInputEvent("Mouse_Out", "InGameShop_ShowSimpleToolTip( false, " .. 1 .. "  )")
  ;
  (self._btn_BuyDaum):addInputEvent("Mouse_LUp", "InGameShop_BuyDaumCash()")
  ;
  (self._btn_RefreshCash):addInputEvent("Mouse_LUp", "InGameShop_RefreshCash()")
  ;
  (self._btn_BuyPearl):addInputEvent("Mouse_LUp", "InGameShop_BuyPearl()")
end

inGameShop.registEventHandler = function(self)
  -- function num : 0_18
  registerEvent("onScreenResize", "InGameShop_Resize")
  registerEvent("FromClient_UpdateCashShop", "InGameShop_UpdateCashShop")
  registerEvent("FromClient_UpdateCash", "InGameShop_UpdateCash")
  registerEvent("EventSelfPlayerPreDead", "InGameShop_OuterEventForDead")
  registerEvent("ToClient_RequestShowProduct", "ToClient_RequestShowProduct")
  registerEvent("FromClient_InventoryUpdate", "InGameShop_UpdateCash")
  registerEvent("FromClient_ShowRecommendProductByComplete", "FromClient_ShowRecommendProductByComplete")
end

inGameShop.initData = function(self)
  -- function num : 0_19
  self._list = (Array.new)()
  self._listCount = 0
  ;
  (getIngameCashMall()):setCashProductNoRawFilterList()
  self._listCount = (getIngameCashMall()):getCashProductFilterListCount()
  for ii = 0, self._listCount - 1 do
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R5 in 'UnsetPending'

    (self._list)[ii] = (getIngameCashMall()):getCashProductNoRawFromFilterList(ii)
  end
  InGameShop_SetScroll()
end

CheckCashProduct = function(cashProduct)
  -- function num : 0_20
  if not cashProduct:isMallDisplayable() then
    return false
  end
  if not cashProduct:isBuyable() then
    return false
  end
  return true
end

InGameShop_TabEvent = function(tab)
  -- function num : 0_21 , upvalues : inGameShop, tabIndexList, tabId, _AllBG, UI_CCC
  local self = inGameShop
  FGlobal_IngameCashShop_SelectedItemReset()
  if (self._tabs)[tab] then
    Panel_IngameCashShop:SetChildIndex(((self._tabs)[tab]).static, 9900)
  end
  self._previousTab = self._currentTab
  self._currentTab = tab
  if self._currentTab > 0 and self._currentTab <= getCashMainCategorySize() then
    (getIngameCashMall()):setCurrentCategory((tabIndexList[self._currentTab])[2])
  end
  FGlobal_CashShop_SetEquip_BGToggle(tab)
  if tab > 0 and tab <= self._tabCount then
    _inGameShop_TabOnOut_ChangeTexture(false, self._currentTab)
    if self._previousTab > 0 and self._previousTab <= self._tabCount then
      _inGameShop_TabOnOut_ChangeTexture(false, self._previousTab)
    end
    if not ((self._promotionTab).static):IsCheck() then
      _inGameShop_TabOnOut_ChangeTexture(false, tabId.promotionTab)
      InGameShop_Promotion_Close()
    end
    if not ((self._myCartTab).static):IsCheck() then
      _inGameShop_TabOnOut_ChangeTexture(false, tabId.cart)
      FGlobal_Close_IngameCashShop_NewCart()
    end
  end
  ;
  (getIngameCashMall()):setCurrentSubTab(-1)
  _AllBG:SetShow(false)
  ClearFocusEdit()
  makeSubTab(tab)
  self._currentPos = 0
  self._position = 0
  ;
  (self._scroll_IngameCash):SetControlPos(0)
  ;
  (getIngameCashMall()):setSearchText("")
  ;
  (getIngameCashMall()):setCurrentClass(-1)
  ;
  (getIngameCashMall()):setCurrentSort(-1)
  ;
  (getIngameCashMall()):setCurrentSubFilter(-1)
  ;
  (self._combo_Class):SetSelectItemIndex(0)
  ;
  (self._combo_Sort):SetSelectItemIndex(0)
  if UI_CCC.eCashProductCategory_Costumes == (tabIndexList[tab])[5] then
    local classCount = getCharacterClassCount()
    local selfClassType = (getSelfPlayer()):getClassType()
    local myClassIndex = -1
    for ii = 0, classCount - 1 do
      local classType = getCharacterClassTypeByIndex(ii)
      if selfClassType == classType then
        myClassIndex = ii
        break
      end
    end
    do
      do
        if myClassIndex ~= -1 then
          (self._combo_Class):SetSelectItemIndex(myClassIndex + 1)
          ;
          (self._combo_Class):SetText(getCharacterClassName(selfClassType))
          ;
          (getIngameCashMall()):setCurrentClass(selfClassType)
        end
        self:initData()
        self:update()
        if not (self._categoryWeb):GetShow() then
          (self._categoryWeb):SetShow(true)
        end
        if self._currentTab > 0 and self._currentTab <= getCashMainCategorySize() then
          if (tabIndexList[tab])[6] > 0 and FGlobal_IngameCashShopEventCart_IsContentsOpen() == true then
            local eventWrapper = ToClient_GetEventCategoryStaticStatusWrapperByKeyRaw((tabIndexList[tab])[6])
            if eventWrapper ~= nil then
              if self._previousTab ~= self._currentTab then
                IngameCashShopEventCart_Clear()
              end
              IngameCashShopEventCart_Open((tabIndexList[tab])[6])
            end
          else
            do
              IngameCashShopEventCart_Close()
              IngameCashShopEventCart_Close()
              if Panel_Window_RecommandGoods:GetShow() == false and _ContentsGroup_Recommend == true then
                PaGlobal_RecommendGoods:Open()
                ;
                (self._categoryWeb):SetShow(false)
              end
            end
          end
        end
      end
    end
  end
end

makeSubTab = function(tabIndex)
  -- function num : 0_22 , upvalues : inGameShop, tabIndexList
  local self = inGameShop
  setPosCloseSubTab()
  if self._currentTab == self._previousTab and self._checkTab == true then
    self._checkTab = false
    return 
  end
  if tabIndex == nil then
    return 
  end
  if tabIndex <= 0 or tabIndex > getCashMainCategorySize() then
    return 
  end
  local subCategoryCount = getCashMiddleCategorySize((tabIndexList[tabIndex])[2])
  if subCategoryCount == 0 then
    return 
  end
  self._checkTab = true
  setPosOpenSubTab(tabIndex)
end

setPosOpenSubTab = function(tabIndex)
  -- function num : 0_23 , upvalues : inGameShop, tabIndexList, tabId
  local self = inGameShop
  local tabConfig = (self._config)._tab
  local statPosX = (((self._tabs)[tabIndex]).static):GetPosX()
  local statPosY = (((self._tabs)[tabIndex]).static):GetPosY() + tabConfig._gapY + 10
  local subCategoryCount = getCashMiddleCategorySize((tabIndexList[tabIndex])[2])
  local showCountii = 0
  for ii = 1, subCategoryCount do
    if (((self._tabs)[tabIndex])._subTab)[ii] ~= nil then
      (((((self._tabs)[tabIndex])._subTab)[ii]).static):SetPosX(statPosX)
      ;
      (((((self._tabs)[tabIndex])._subTab)[ii]).static):SetPosY(statPosY + showCountii * 25)
      ;
      (((((self._tabs)[tabIndex])._subTab)[ii]).static):SetShow(true)
      ;
      (((((self._tabs)[tabIndex])._subTab)[ii]).text):SetPosX(0)
      ;
      (((((self._tabs)[tabIndex])._subTab)[ii]).text):SetPosY(0)
      ;
      (((((self._tabs)[tabIndex])._subTab)[ii]).text):SetShow(true)
      showCountii = showCountii + 1
    end
  end
  local lastPosY = statPosY + 25 * (showCountii - 1) + 15
  local subTabSize = 25 * (showCountii)
  for jj = tabIndex + 1, self._tabCount do
    local tab = (self._tabs)[jj]
    ;
    (tab.static):SetPosX(tabConfig._startX)
    ;
    (tab.static):SetPosY(lastPosY + tabConfig._gapY * (jj - (tabIndex + 1)))
    ;
    (tab.text):SetPosX(40)
    ;
    (tab.text):SetPosY(5)
  end
  ;
  ((self._myCartTab).static):SetPosX(tabConfig._startX)
  ;
  ((self._myCartTab).static):SetPosY(tabConfig._startY + subTabSize + tabConfig._gapY * (tabId.cart - 1))
end

setPosCloseSubTab = function()
  -- function num : 0_24 , upvalues : inGameShop, tabId, tabIndexList
  local self = inGameShop
  local tabConfig = (self._config)._tab
  self:initTabPos()
  ;
  ((self._myCartTab).static):SetPosX(tabConfig._startX)
  ;
  ((self._myCartTab).static):SetPosY(tabConfig._startY + tabConfig._gapY * (tabId.cart - 1))
  ;
  ((self._subTapSelect).static):SetShow(false)
  local mainCatogorySize = getCashMainCategorySize()
  for jj = 1, mainCatogorySize do
    local subCategoryCount = getCashMiddleCategorySize((tabIndexList[jj])[2])
    for ii = 1, subCategoryCount do
      if (((self._tabs)[jj])._subTab)[ii] ~= nil then
        (((((self._tabs)[jj])._subTab)[ii]).static):SetShow(false)
        ;
        (((((self._tabs)[jj])._subTab)[ii]).text):SetShow(false)
      end
    end
  end
end

InGameShop_SubTabEvent = function(mainTab, subTab)
  -- function num : 0_25 , upvalues : inGameShop
  local self = inGameShop
  FGlobal_IngameCashShop_SelectedItemReset()
  self._currentPos = 0
  self._position = 0
  ;
  (self._scroll_IngameCash):SetControlPos(0)
  local selectPosX = (((((self._tabs)[mainTab])._subTab)[subTab]).static):GetPosX()
  local selectPosY = (((((self._tabs)[mainTab])._subTab)[subTab]).static):GetPosY()
  ;
  ((self._subTapSelect).static):SetPosX(selectPosX)
  ;
  ((self._subTapSelect).static):SetPosY(selectPosY)
  ;
  ((self._subTapSelect).static):SetShow(true)
  ;
  (getIngameCashMall()):setCurrentSubTab(subTab)
  audioPostEvent_SystemUi(0, 0)
  self:initData()
  self:update()
end

InGameShop_SetScroll = function()
  -- function num : 0_26 , upvalues : inGameShop
  local self = inGameShop
  local scrollSizeY = (self._scroll_IngameCash):GetSizeY()
  local pagePercent = self._slotCount / self._listCount * 100
  local btn_scrollSizeY = scrollSizeY / 100 * pagePercent
  if btn_scrollSizeY < 10 then
    btn_scrollSizeY = 10
  end
  if scrollSizeY <= btn_scrollSizeY then
    btn_scrollSizeY = scrollSizeY * 0.99
  end
  if btn_scrollSizeY < 20 then
    btn_scrollSizeY = 50
  end
  if not self._openFunction then
    if self._slotCount < self._listCount then
      (self._scroll_IngameCash):SetShow(true)
    else
      ;
      (self._scroll_IngameCash):SetShow(false)
    end
  end
  self._openFunction = false
  ;
  (self._scrollBTN_IngameCash):SetSize((self._scrollBTN_IngameCash):GetSizeX(), btn_scrollSizeY)
  ;
  (self._scroll_IngameCash):SetInterval(self._listCount - self._slotCount)
  ;
  (self._scroll_IngameCash):SetControlTop()
end

inGameShop.RadioReset = function(self)
  -- function num : 0_27
  ((self._promotionTab).static):SetCheck(false)
  for ii = 1, self._tabCount do
    local tabConfig = (self._config)._tab
    local tab = (self._tabs)[ii]
    ;
    (tab.static):SetCheck(false)
  end
  ;
  ((self._myCartTab).static):SetCheck(false)
end

InGameShop_BuyPearl = function()
  -- function num : 0_28 , upvalues : inGameShop, tabIndexList, UI_CCC
  local self = inGameShop
  local pearlBox = 0
  for ii = 1, self._tabCount do
    if (tabIndexList[ii])[5] == UI_CCC.eCashProductCategory_Pearl then
      pearlBox = ii
    end
  end
  if pearlBox == 0 then
    return 
  end
  self:RadioReset()
  ;
  (((self._tabs)[pearlBox]).static):SetCheck(true)
  InGameShop_TabEvent(pearlBox)
  if (self._promotionWeb):GetShow() then
    InGameShop_Promotion_Close()
  end
  if Panel_IngameCashShop_NewCart:GetShow() then
    FGlobal_Close_IngameCashShop_NewCart()
  end
end

InGameShop_ReShowByHideUI = function()
  -- function num : 0_29 , upvalues : inGameShop
  local self = inGameShop
  self:RadioReset()
  ;
  (((self._tabs)[self._tabCount]).static):SetCheck(true)
  InGameShop_TabEvent(self._tabCount)
end

InGameShop_BuyDaumCash = function()
  -- function num : 0_30
  if ToClient_isXBox() then
    ToClient_XboxShowStore()
  else
    FGlobal_BuyDaumCash()
  end
end

InGameShop_RefreshCash = function()
  -- function num : 0_31 , upvalues : isNaver
  local selfProxy = (getSelfPlayer()):get()
  local cash = selfProxy:setRefreshCash()
  if not isNaver then
    cashShop_requestCash()
  end
end

InGameShop_Search = function()
  -- function num : 0_32 , upvalues : inGameShop
  local self = inGameShop
  local search = (self._edit_Search):GetEditText()
  if search == nil or search == "" or PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_SERACHWORD") == search then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SEARCH_ACK"))
    return 
  end
  ;
  (self._edit_Search):SetEditText(search, true)
  ClearFocusEdit()
  self._currentPos = 0
  self._position = 0
  ;
  (getIngameCashMall()):setSearchText(search)
  FGlobal_IngameCashShop_SelectedItemReset()
  self:initData()
  self:update()
end

Recommend_CashItem = function(type)
  -- function num : 0_33 , upvalues : inGameShop, UI_CCC, tabIndexList
  local self = inGameShop
  local categoryType = 0
  local tabIndex = 0
  if Recommend_TYPE.TYPE_INVENTORY == type or Recommend_TYPE.TYPE_WEIGHT == type then
    categoryType = UI_CCC.eCashProductCategory_Normal
  else
    if Recommend_TYPE.TYPE_PET == type then
      categoryType = UI_CCC.eCashProductCategory_Pet
    end
  end
  if categoryType == 0 then
    return 
  end
  for ii = 1, self._tabCount do
    if (tabIndexList[ii])[5] == categoryType then
      tabIndex = (tabIndexList[ii])[1]
    end
  end
  if tabIndex == 0 then
    return 
  end
  self:RadioReset()
  ;
  (((self._tabs)[tabIndex]).static):SetCheck(true)
  if Recommend_TYPE.TYPE_INVENTORY == type then
    InGameShop_TabEvent(tabIndex)
    ;
    (self._edit_Search):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_FIND_BAG"), true)
    InGameShop_Search()
  else
    if Recommend_TYPE.TYPE_PET == type then
      InGameShop_TabEvent(tabIndex)
    else
      if Recommend_TYPE.TYPE_WEIGHT then
        InGameShop_TabEvent(tabIndex)
        ;
        (self._edit_Search):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_FIND_WEIGHT"), true)
        InGameShop_Search()
      end
    end
  end
  InGameShop_Promotion_Close()
end

InGameShop_ResetSearchText = function()
  -- function num : 0_34 , upvalues : inGameShop
  local self = inGameShop
  local search = (self._edit_Search):GetEditText()
  if search == nil or PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_SERACHWORD") == search then
    (self._edit_Search):SetEditText("", true)
  end
end

InGameShop_CartToggle = function()
  -- function num : 0_35 , upvalues : inGameShop, tabId
  local self = inGameShop
  self._previousTab = self._currentTab
  self._currentTab = tabId.cart
  if not FGlobal_IsShow_IngameCashShop_NewCart() or (self._promotionWeb):GetShow() then
    (self._promotionWeb):SetShow(false)
  end
  if Panel_IngameCashShop_GoodsDetailInfo:GetShow() then
    InGameShopDetailInfo_Close()
  end
  if not (self._categoryWeb):GetShow() then
    (self._categoryWeb):SetShow(true)
  end
  for ii = 1, self._tabCount do
    _ingameCash_SetTabIconTexture(((self._tabs)[ii]).icon, ii, 0)
  end
  if not ((self._promotionTab).static):IsCheck() then
    _ingameCash_SetTabIconTexture((self._promotionTab).icon, tabId.promotionTab, 0)
  end
  if not ((self._myCartTab).static):IsCheck() then
    _ingameCash_SetTabIconTexture((self._myCartTab).icon, tabId.cart, 0)
  else
    _ingameCash_SetTabIconTexture((self._myCartTab).icon, tabId.cart, 2)
  end
  FGlobal_Open_IngameCashShop_NewCart()
  Panel_IngameCashShop:SetChildIndex((self._myCartTab).static, 9900)
  ;
  (self._scroll_IngameCash):SetShow(false)
  IngameCashShopEventCart_Close()
  makeSubTab(tabId.cart)
end

InGameShop_ScrollEvent = function(isUp)
  -- function num : 0_36 , upvalues : inGameShop
  local self = inGameShop
  local maxCount = self._listCount
  if isUp then
    self._position = self._position - ((self._config)._slot)._gapY
    if self._position < 0 then
      self._position = 0
    end
  else
    local listSize = self:getMaxPosition()
    if listSize < 0 then
      return 
    end
    self._position = self._position + ((self._config)._slot)._gapY
    if listSize < self._position then
      self._position = listSize
    end
  end
  do
    ;
    (self._scroll_IngameCash):SetControlPos(self._position / self:getMaxPosition())
    self:update()
  end
end

InGameShop_ProductShowToolTip = function(productKeyRaw, uiIdx, isChoose)
  -- function num : 0_37 , upvalues : inGameShop
  local self = inGameShop
  local slotIcon = ((self._slots)[uiIdx]).icon
  local scrollArea = self._static_ScrollArea
  FGlobal_CashShop_GoodsTooltipInfo_Open(productKeyRaw, slotIcon, isChoose, scrollArea)
end

InGameShop_ShowSimpleToolTip = function(isShow, buttonType)
  -- function num : 0_38 , upvalues : inGameShop, tabId
  local self = inGameShop
  local name = ""
  local desc = ""
  local uiControl, tabIdx = nil, nil
  if buttonType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_TOOLTIPS_PROMOTION")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_TOOLTIPS_PROMOTION_DESC")
    uiControl = (self._promotionTab).static
    tabIdx = tabId.promotionTab
  else
    if buttonType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_TOOLTIPS_MYCART")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_TOOLTIPS_MYCART_DESC")
      uiControl = (self._myCartTab).static
      tabIdx = tabId.cart
    end
  end
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
    _inGameShop_TabOnOut_ChangeTexture(true, tabIdx)
  else
    TooltipSimple_Hide()
    _inGameShop_TabOnOut_ChangeTexture(false, tabIdx)
  end
end

InGameShop_Promotion_Open = function()
  -- function num : 0_39 , upvalues : inGameShop, tabId
  local self = inGameShop
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  self._previousTab = self._currentTab
  self._currentTab = tabId.promotionTab
  Panel_IngameCashShop:SetChildIndex((self._promotionTab).static, 9900)
  Panel_IngameCashShop:SetChildIndex((self._promotionTab).icon, 9900)
  ;
  (self._promotionWeb):SetPosX(5)
  ;
  (self._promotionWeb):SetPosY(5)
  ;
  (self._promotionWeb):SetSize((self._promotionWeb):GetSizeX(), self._promotionSizeY)
  ;
  (self._promotionWeb):SetShow(true)
  ;
  (self._scroll_IngameCash):SetShow(false)
  for ii = 1, self._tabCount do
    _ingameCash_SetTabIconTexture(((self._tabs)[ii]).icon, ii, 0)
  end
  ;
  ((self._myCartTab).static):SetCheck(false)
  FGlobal_Close_IngameCashShop_NewCart()
  _ingameCash_SetTabIconTexture((self._myCartTab).icon, tabId.cart, 0)
  _ingameCash_SetTabIconTexture((self._promotionTab).icon, tabId.promotionTab, 2)
  IngameCashShopEventCart_Close()
  makeSubTab(tabId.promotionTab)
  PaGlobal_RecommendGoods:Close()
end

InGameShop_Promotion_Close = function()
  -- function num : 0_40 , upvalues : inGameShop
  local self = inGameShop
  ;
  (self._promotionWeb):SetShow(false)
  self._openFunction = false
end

InGameShop_ProductListContent_ChangeTexture = function(slot, isSelected)
  -- function num : 0_41
  (slot.static):ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/cashshop_01.dds")
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if isSelected == true then
    x1 = setTextureUV_Func(slot.static, 193, 410, 268, 476)
  else
    -- DECOMPILER ERROR at PC29: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC30: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

    x1 = setTextureUV_Func(slot.static, 47, 5, 122, 71)
  end
  ;
  ((slot.static):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (slot.static):setRenderTexture((slot.static):getBaseTexture())
end

InGameShop_ProductListContent_ChangeMoneyIconTexture = function(slot, categoryIdx, isEnableSilver, isDesc)
  -- function num : 0_42 , upvalues : contry, UI_CCC, cashIconType, eCountryType, gameServiceType
  local serviceContry, iconType = nil, nil
  if isGameTypeKorea() then
    serviceContry = contry.kr
  else
    if isGameTypeJapan() then
      serviceContry = contry.jp
    else
      if isGameTypeRussia() then
        serviceContry = contry.ru
      else
        if isGameTypeKR2() then
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
  if isEnableSilver then
    iconType = cashIconType.silver
  end
  if isDesc then
    cashIcon_changeTextureForList(slot, serviceContry, iconType)
  else
    cashIcon_changeTextureForList(slot.pearlIcon, serviceContry, iconType)
  end
  -- DECOMPILER ERROR: 8 unprocessed JMP targets
end

HandleClicked_InGameShop_SetScrollIndexByLClick = function()
  -- function num : 0_43 , upvalues : inGameShop
  local self = inGameShop
  self._position = (self._scroll_IngameCash):GetControlPos() * self:getMaxPosition()
  self:update()
end

FGlobal_InGameShop_IsSelectedSearchName = function()
  -- function num : 0_44 , upvalues : inGameShop
  local self = inGameShop
  do
    local selectedEditControll = (UI.getFocusEdit)()
    do return selectedEditControll ~= nil and selectedEditControll:GetKey() == (self._edit_Search):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

FGlobal_InGameCashShop_GetSearchEdit = function()
  -- function num : 0_45 , upvalues : inGameShop
  return inGameShop._edit_Search
end

_ingameCash_SetTabIconTexture = function(control, tabIdx, status)
  -- function num : 0_46 , upvalues : inGameShop, tabIndexList, tabId, tabIconTexture1
  local self = inGameShop
  local categorySize = getCashMainCategorySize()
  if tabIdx >= 1 and tabIdx <= categorySize then
    control:ChangeTextureInfoName((tabIndexList[tabIdx])[4])
  else
    if tabId.promotionTab == tabIdx then
      control:ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/cashshopmenu/CashShopMenu_00.dds")
    else
      if tabId.cart == tabIdx then
        control:ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/cashshopmenu/CashShopMenu_10.dds")
      end
    end
  end
  local x1, y1, x2, y2 = setTextureUV_Func(control, (tabIconTexture1[status])[1], (tabIconTexture1[status])[2], (tabIconTexture1[status])[3], (tabIconTexture1[status])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

_inGameShop_TabOnOut_ChangeTexture = function(isOn, tabIdx)
  -- function num : 0_47 , upvalues : inGameShop, tabId
  local self = inGameShop
  local control = nil
  if tabIdx > 0 and tabIdx < self._tabCount + 1 then
    control = (self._tabs)[tabIdx]
  else
    if tabId.promotionTab == tabIdx then
      control = self._promotionTab
    else
      if tabId.cart == tabIdx then
        control = self._myCartTab
      else
        return 
      end
    end
  end
  local controlBeforState = not (control.static):IsCheck()
  if isOn then
    _ingameCash_SetTabIconTexture(control.icon, tabIdx, 1)
  else
    if controlBeforState then
      _ingameCash_SetTabIconTexture(control.icon, tabIdx, 0)
    else
      _ingameCash_SetTabIconTexture(control.icon, tabIdx, 2)
    end
  end
end

FGlobal_InGameShop_UpdateByBuy = function()
  -- function num : 0_48 , upvalues : inGameShop
  inGameShop:update()
end

FGlobal_InGameShop_OpenByEventAlarm = function()
  -- function num : 0_49 , upvalues : isNaver, renderMode, inGameShop, UI_SERVICE_RESOURCE, isTaiwanNation, _AllBG
  ToClient_SaveUiInfo(false)
  if isFlushedUI() then
    return 
  end
  if not FGlobal_IsCommercialService() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_NOTUSE"))
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_CASHSHOP"))
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
  if not (getIngameCashMall()):show() then
    return 
  end
  audioPostEvent_SystemUi(1, 39)
  if not isNaver then
    cashShop_requestCash()
  end
  cashShop_requestCashShopList()
  PaymentPassword_Close()
  SetUIMode((Defines.UIMode).eUIMode_InGameCashShop)
  renderMode:set()
  ;
  (getIngameCashMall()):clearEquipViewList()
  ;
  (getIngameCashMall()):changeViewMyCharacter()
  local self = inGameShop
  _ingameCashShop_SetViewListCount()
  cashShop_Controller_Open()
  FGlobal_CashShop_SetEquip_Open()
  for ii = 1, self._tabCount do
    (((self._tabs)[ii]).static):SetCheck(false)
  end
  self._openFunction = true
  ;
  (self._static_Construction):ComputePos()
  ;
  (self._static_Construction):SetShow(false)
  Panel_IngameCashShop:SetShow(true)
  ;
  (self._scroll_IngameCash):SetShow(false)
  local SALangType = "pt"
  if UI_SERVICE_RESOURCE.eServiceResourceType_ES == getGameServiceResType() then
    SALangType = "es"
  else
    if UI_SERVICE_RESOURCE.eServiceResourceType_PT == getGameServiceResType() then
      SALangType = "pt"
    end
  end
  local scrSizeY = getScreenSizeY()
  local categoryUrl = ""
  local promotionUrl = ""
  if isServerFixedCharge() then
    promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_P2P")
    categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_P2P")
  else
    if isGameTypeKorea() then
      promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL")
      categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL")
    else
      if isGameTypeTaiwan() then
        if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
          promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TW_ALPHA")
          categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TW_ALPHA")
        else
          if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
            promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TW")
            categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TW")
          end
        end
      else
        if isGameTypeKR2() then
          promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_KR2")
          categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_KR2")
        else
          if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
            promotionUrl = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_SA_ALPHA", "lang", SALangType)
            categoryUrl = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_SA_ALPHA", "lang", SALangType)
          else
            if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
              promotionUrl = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_SA", "lang", SALangType)
              categoryUrl = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_SA", "lang", SALangType)
            else
              if (CppEnums.CountryType).TR_ALPHA == getGameServiceType() then
                promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TR_ALPHA")
                categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TR_ALPHA")
              else
                if (CppEnums.CountryType).TR_REAL == getGameServiceType() then
                  promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TR")
                  categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TR")
                else
                  if (CppEnums.CountryType).TH_ALPHA == getGameServiceType() then
                    promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TH_ALPHA")
                    categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TH_ALPHA")
                  else
                    if (CppEnums.CountryType).TH_REAL == getGameServiceType() then
                      promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TH")
                      categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TH")
                    else
                      if (CppEnums.CountryType).ID_ALPHA == getGameServiceType() then
                        promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_ID_ALPHA")
                        categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_ID_ALPHA")
                      else
                        if (CppEnums.CountryType).ID_REAL == getGameServiceType() then
                          promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_ID")
                          categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_ID")
                        else
                          promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL")
                          categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL")
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  FGlobal_SetCandidate()
  ;
  (self._categoryWeb):SetUrl((self._categoryWeb):GetSizeX(), (self._categoryWeb):GetSizeY(), categoryUrl, false, isTaiwanNation)
  ;
  (self._categoryWeb):SetShow(true)
  ;
  (self._categoryWeb):SetIME()
  ;
  (self._promotionWeb):SetUrl((self._promotionWeb):GetSizeX(), self._promotionSizeY, promotionUrl, false, isTaiwanNation)
  _AllBG:SetSize(_AllBG:GetSizeX(), self._promotionSizeY)
  ;
  (self._promotionWeb):SetIME()
  self._openByEventAlarm = true
end

FGlobal_InGameShop_OpenInventory = function()
  -- function num : 0_50
  Inventory_SetFunctor(IngameCashShop_PearlBoxFilter, IngameCashShop_PearlBox_Open, nil, nil)
  InventoryWindow_Show(true, true)
end

IngameCashShop_PearlBoxFilter = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_51
  if (itemWrapper:getStaticStatus()):isPearlBox() then
    return false
  else
    return true
  end
end

IngameCashShop_PearlBox_Open = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_52
  local doOpen = function()
    -- function num : 0_52_0 , upvalues : inventoryType, slotNo
    Inventory_UseItemTargetSelf(inventoryType, slotNo, nil)
  end

  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_OPEN_PEARLBOX")
  local messageBoxData = {title = messageTitle, content = messageBoxMemo, functionYes = doOpen, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

IngameCashShop_Descinit = function()
  -- function num : 0_53 , upvalues : inGameShop, UI_TM, UI_color
  local self = inGameShop.desc
  self._staticText_Title = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_GoodsTitle")
  self._static_SlotBG = (UI.getChildControl)(inGameShop._goodDescBG, "Static_GoodsSlotBG")
  self._static_Slot = (UI.getChildControl)(inGameShop._goodDescBG, "Static_GoodsSlot")
  self._static_Desc = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_GoodsDesc")
  self._staticText_ProductInfo_Title = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_ProductInfo_Title")
  self._staticText_PurchaseLimit = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_PurchaseLimit")
  self._static_VestedDesc = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_VestedDesc")
  self._static_TradeDesc = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_TradeDesc")
  self._static_ClassDesc = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_ClassDesc")
  self._static_WarningDesc = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_WarningDesc")
  self._static_DiscountPeriodDesc = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_DiscountPeriod")
  self._static_ItemListTitle = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_ItemListTitle")
  self._static_RelatedItemTitle = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_RelatedItemTitle")
  self._static_PearlIcon = (UI.getChildControl)(inGameShop._goodDescBG, "Static_DescPearlIcon")
  self._static_PearlPrice = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_DescItemPrice")
  self._static_PearOriginalPrice = (UI.getChildControl)(inGameShop._goodDescBG, "StaticText_DescItemOriginalPrice")
  self._btn_BigBuy = (UI.getChildControl)(inGameShop._goodDescBG, "Button_BigBuy")
  self._btn_BigBuy_M = (UI.getChildControl)(inGameShop._goodDescBG, "Button_BigBuy_M")
  self._btn_BigBuy_C = (UI.getChildControl)(inGameShop._goodDescBG, "Button_BigBuy_C")
  self._btn_BigBuy_Silver = (UI.getChildControl)(inGameShop._goodDescBG, "Button_BigBuy_Silver")
  self._btn_BigCart = (UI.getChildControl)(inGameShop._goodDescBG, "Button_BigCart")
  self._btn_BigGift = (UI.getChildControl)(inGameShop._goodDescBG, "Button_BigGift")
  self._btn_BigECart = (UI.getChildControl)(inGameShop._goodDescBG, "Button_BigECart")
  ;
  (self._staticText_Title):SetAutoResize(true)
  ;
  (self._static_Desc):SetAutoResize(true)
  ;
  (self._staticText_Title):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._static_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._static_Desc):SetFontColor(UI_color.C_FFC4A68A)
  ;
  (self._staticText_PurchaseLimit):SetFontColor(UI_color.C_FF748CAB)
  ;
  (self._static_VestedDesc):SetFontColor(UI_color.C_FF748CAB)
  ;
  (self._static_TradeDesc):SetFontColor(UI_color.C_FFF26A6A)
  ;
  (self._static_ClassDesc):SetFontColor(UI_color.C_FF999999)
  ;
  (self._static_WarningDesc):SetFontColor(UI_color.C_FFF26A6A)
  ;
  (self._static_DiscountPeriodDesc):SetFontColor(UI_color.C_FF748CAB)
  local itemConfig = (inGameShop._config)._item
  for ii = 0, inGameShop._itemCount - 1 do
    local slot = {}
    slot.iconBG = (UI.createAndCopyBasePropertyControl)(inGameShop._goodDescBG, "Static_ItemSlotBG", self._static_ItemListTitle, "InGameShopDetailInfo_Item_" .. ii)
    slot.icon = (UI.createAndCopyBasePropertyControl)(inGameShop._goodDescBG, "Static_ItemSlot", slot.iconBG, "InGameShopDetailInfo_Item_Icon_" .. ii)
    ;
    (slot.iconBG):SetPosX(itemConfig._startX + itemConfig._gapX * ii)
    ;
    (slot.iconBG):SetPosY(itemConfig._startY)
    -- DECOMPILER ERROR at PC261: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (inGameShop._items)[ii] = slot
  end
  local selfPanel = inGameShop
  local subItemCount = selfPanel._subItemCount
  selfPanel._endSunPositionY = 0
  selfPanel._bigButtonCount = 0
  selfPanel._smallButtonCount = 0
  selfPanel._skipCount = 0
  for kk = 1, subItemCount do
    local subitem = {}
    subitem.productNo = 0
    subitem.static = (UI.createAndCopyBasePropertyControl)(inGameShop._goodDescBG, "RadioButton_Category", inGameShop._goodDescBG, "InGameShop_subItem_" .. kk)
    ;
    (subitem.static):SetText("-")
    ;
    (subitem.static):SetShow(false)
    ;
    (subitem.static):SetIgnore(true)
    ;
    (subitem.static):addInputEvent("Mouse_LUp", "InGameShop_subItemEvent(" .. kk .. ")")
    -- DECOMPILER ERROR at PC308: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (selfPanel._subItemButton)[kk] = subitem
  end
  local chooseProductListCount = inGameShop._chooseProductListCount
  for jj = 0, chooseProductListCount - 1 do
    local chooseProduct = {}
    chooseProduct.staticBG = (UI.createAndCopyBasePropertyControl)(inGameShop._goodDescBG, "RadioButton_Banner", inGameShop._goodDescBG, "InGameShop_ChooseCashBG_" .. jj)
    ;
    (chooseProduct.staticBG):SetShow(false)
    ;
    (chooseProduct.staticBG):addInputEvent("Mouse_UpScroll", "InGameShop_ScrollEvent( true )")
    ;
    (chooseProduct.staticBG):addInputEvent("Mouse_DownScroll", "InGameShop_ScrollEvent( false )")
    chooseProduct.staticAddPlusBtn = (UI.createAndCopyBasePropertyControl)(inGameShop._goodDescBG, "Button_ChooseCountPlus", inGameShop._goodDescBG, "InGameShop_ChooseCountPlus_" .. jj)
    ;
    (chooseProduct.staticAddPlusBtn):SetShow(false)
    ;
    (chooseProduct.staticAddPlusBtn):addInputEvent("Mouse_LUp", "InGameShop_ChooseCashClickEvent(" .. jj .. ", true )")
    chooseProduct.staticAddMinusBtn = (UI.createAndCopyBasePropertyControl)(inGameShop._goodDescBG, "Button_ChooseCountMinus", inGameShop._goodDescBG, "InGameShop_ChooseCountMinus_" .. jj)
    ;
    (chooseProduct.staticAddMinusBtn):SetShow(false)
    ;
    (chooseProduct.staticAddMinusBtn):addInputEvent("Mouse_LUp", "InGameShop_ChooseCashClickEvent(" .. jj .. ", false )")
    chooseProduct.staticEditCount = (UI.createAndCopyBasePropertyControl)(inGameShop._goodDescBG, "Edit_ChooseCount", inGameShop._goodDescBG, "InGameShop_ChooseCount_" .. jj)
    ;
    (chooseProduct.staticEditCount):SetShow(false)
    ;
    (chooseProduct.staticEditCount):SetIgnore(true)
    -- DECOMPILER ERROR at PC412: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (selfPanel._chooseProductList)[jj] = chooseProduct
  end
end

IngameCashShop_DescUpdate = function()
  -- function num : 0_54 , upvalues : inGameShop, UI_color, UI_PLT, disCountSetUse, UI_CCC, tabIndexList
  local self = inGameShop.desc
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(inGameShop._openProductKeyRaw)
  if cashProduct == nil then
    return 
  end
  for ii = 0, inGameShop._itemCount - 1 do
    local slot = (inGameShop._items)[ii]
    ;
    (slot.iconBG):SetShow(false)
  end
  local itemListCount = cashProduct:getItemListCount()
  local itemConfig = (inGameShop._config)._relatedItem
  if itemListCount < 10 then
    itemConfig._startX = 0
    itemConfig._gapX = 35
  else
    itemConfig._startX = -7
    itemConfig._gapX = 33
  end
  for ii = 0, itemListCount - 1 do
    local slot = (inGameShop._items)[ii]
    local item = cashProduct:getItemByIndex(ii)
    local itemCount = cashProduct:getItemCountByIndex(ii)
    local itemGrade = item:getGradeType()
    ;
    (slot.iconBG):SetPosX(itemConfig._startX + itemConfig._gapX * ii)
    ;
    (slot.iconBG):SetPosY(itemConfig._startY)
    ;
    (slot.icon):ChangeTextureInfoName("icon/" .. item:getIconPath())
    ;
    (slot.icon):SetText(tostring(itemCount))
    ;
    (slot.icon):addInputEvent("Mouse_On", "InGameShop_ShowItemToolTip( true, " .. ii .. " )")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "InGameShop_ShowItemToolTip( false, " .. ii .. " )")
    ;
    (slot.iconBG):SetShow(true)
  end
  local subItemListCount = itemListCount + cashProduct:getSubItemListCount()
  for ii = itemListCount, subItemListCount - 1 do
    local slot = (inGameShop._items)[ii]
    local item = cashProduct:getSubItemByIndex(ii - itemListCount)
    local itemCount = cashProduct:getSubItemCountByIndex(ii - itemListCount)
    local itemGrade = item:getGradeType()
    ;
    (slot.iconBG):SetPosX(itemConfig._startX + itemConfig._gapX * ii)
    ;
    (slot.iconBG):SetPosY(itemConfig._startY)
    ;
    (slot.icon):ChangeTextureInfoName("icon/" .. item:getIconPath())
    ;
    (slot.icon):SetText(tostring(itemCount))
    ;
    (slot.icon):addInputEvent("Mouse_On", "InGameShop_ShowSubItemToolTip( true, " .. ii - itemListCount .. " )")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "InGameShop_ShowSubItemToolTip( false, " .. ii - itemListCount .. " )")
    ;
    (slot.iconBG):SetShow(true)
  end
  ;
  (self._static_RelatedItemTitle):SetShow(false)
  local descCount = 0
  local descConfig = (inGameShop._config)._desc
  local subConfig = (inGameShop._config)._subButton
  ;
  (self._static_VestedDesc):SetText("")
  ;
  (self._static_TradeDesc):SetText("")
  ;
  (self._static_ClassDesc):SetText("")
  ;
  (self._static_WarningDesc):SetText("")
  ;
  (self._static_DiscountPeriodDesc):SetText("")
  ;
  (self._static_PearOriginalPrice):SetText("")
  ;
  (self._static_Slot):ChangeTextureInfoName("Icon/" .. cashProduct:getIconPath())
  ;
  (self._staticText_Title):SetText(cashProduct:getDisplayName())
  if cashProduct:isApplyDiscount() then
    (self._static_PearOriginalPrice):SetFontColor(UI_color.C_FF626262)
    ;
    (self._static_PearOriginalPrice):SetText(makeDotMoney(cashProduct:getOriginalPrice()) .. " <PAColor0xffefefef>" .. PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_ARROW") .. "<PAOldColor> ")
  end
  ;
  (self._static_PearlPrice):SetText(makeDotMoney(cashProduct:getPrice()))
  ;
  (self._static_Desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_STATIC_DESC", "getDes", cashProduct:getDescription()))
  InGameShop_ProductListContent_ChangeMoneyIconTexture(self._static_PearlIcon, cashProduct:getMainCategory(), cashProduct:isMoneyPrice(), true)
  InGameShop_ProductInfo_ChangeMoneyIconTexture(cashProduct:getMainCategory(), cashProduct:isMoneyPrice())
  local buttonSizeY = subConfig._gapY * (inGameShop._endSunPositionY + 1)
  if inGameShop._listComboCount == 1 then
    buttonSizeY = 0
  end
  local optionDesc_PosY = subConfig._startY + buttonSizeY
  if cashProduct:isChooseCash() then
    optionDesc_PosY = optionDesc_PosY + inGameShop._endChoosePositionY
  end
  ;
  (self._staticText_ProductInfo_Title):SetPosY(optionDesc_PosY - 35)
  ;
  (self._static_SlotBG):SetPosY(optionDesc_PosY - 10)
  ;
  (self._static_Slot):SetPosY(optionDesc_PosY - 10)
  ;
  (self._static_Desc):SetPosY(optionDesc_PosY - 10)
  optionDesc_PosY = optionDesc_PosY + (self._static_Desc):GetTextSizeY() + 35
  ;
  (self._staticText_PurchaseLimit):SetText("")
  local limitType = cashProduct:getCashPurchaseLimitType()
  if UI_PLT.None ~= limitType then
    local limitCount = cashProduct:getCashPurchaseCount()
    local mylimitCount = (getIngameCashMall()):getRemainingLimitCount(inGameShop._openProductKeyRaw)
    local typeString = ""
    if UI_PLT.AtCharacter == limitType then
      typeString = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_CHARACTER")
    else
      if UI_PLT.AtAccount == limitType then
        typeString = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_FAMILY")
      end
    end
    if cashProduct:getLimitedType() > 0 then
      (self._staticText_PurchaseLimit):SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_PURCHASELIMIT", "typeString", typeString, "limitCount", limitCount, "mylimitCount", mylimitCount) .. " (" .. cashProduct:getLimitedTypeDesc() .. ")")
    else
      ;
      (self._staticText_PurchaseLimit):SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_PURCHASELIMIT", "typeString", typeString, "limitCount", limitCount, "mylimitCount", mylimitCount))
    end
    ;
    (self._staticText_PurchaseLimit):SetFontColor(UI_color.C_FFF26A6A)
    ;
    (self._staticText_PurchaseLimit):SetPosY(optionDesc_PosY + descConfig._gapY * descCount)
    descCount = descCount + 1
  end
  do
    local vestedDesc = IngameShopDetailInfo_ConvertFromCategoryToVestedDesc(cashProduct)
    if vestedDesc ~= nil then
      (self._static_VestedDesc):SetText(vestedDesc)
      ;
      (self._static_VestedDesc):SetPosY(optionDesc_PosY + descConfig._gapY * (descCount))
      descCount = descCount + 1
    end
    local tradeDesc = IngameShopDetailInfo_ConvertFromCategoryToTradeDesc(cashProduct)
    if tradeDesc ~= nil then
      (self._static_TradeDesc):SetText(tradeDesc)
      ;
      (self._static_TradeDesc):SetPosY(optionDesc_PosY + descConfig._gapY * (descCount))
      descCount = descCount + 1
    end
    local classDesc = IngameShopDetailInfo_ConvertFromCategoryToClassDesc(cashProduct)
    if classDesc ~= nil then
      (self._static_ClassDesc):SetText(classDesc)
      ;
      (self._static_ClassDesc):SetPosY(optionDesc_PosY + descConfig._gapY * (descCount))
      descCount = descCount + 1
    end
    if cashProduct:isApplyDiscount() then
      local startDiscountTimeValue = PATime((cashProduct:getStartDiscountTime()):get_s64())
      local endDiscountTimeValue = PATime((cashProduct:getEndDiscountTime()):get_s64())
      local startDiscountTime = tostring(startDiscountTimeValue:GetYear()) .. "." .. tostring(startDiscountTimeValue:GetMonth()) .. "." .. tostring(startDiscountTimeValue:GetDay())
      local endDiscountTime = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTTIME", "GetYear", tostring(endDiscountTimeValue:GetYear()), "GetMonth", tostring(endDiscountTimeValue:GetMonth()), "GetDay", tostring(endDiscountTimeValue:GetDay())) .. " " .. (string.format)("%.02d", endDiscountTimeValue:GetHour()) .. ":" .. (string.format)("%.02d", endDiscountTimeValue:GetMinute())
      if disCountSetUse == true then
        endDiscountTime = convertStringFromDatetime(cashProduct:getRemainDiscountTime())
      else
        endDiscountTime = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTTIME", "GetYear", tostring(endDiscountTimeValue:GetYear()), "GetMonth", tostring(endDiscountTimeValue:GetMonth()), "GetDay", tostring(endDiscountTimeValue:GetDay())) .. " " .. (string.format)("%.02d", endDiscountTimeValue:GetHour()) .. ":" .. (string.format)("%.02d", endDiscountTimeValue:GetMinute())
      end
      ;
      (self._static_DiscountPeriodDesc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTPERIODDESC", "endDiscountTime", endDiscountTime))
      ;
      (self._static_DiscountPeriodDesc):SetPosY(optionDesc_PosY + descConfig._gapY * (descCount))
      descCount = descCount + 1
    end
    do
      ;
      (self._static_ItemListTitle):SetPosY(optionDesc_PosY + descConfig._gapY * (descCount))
      descCount = descCount + 1
      optionDesc_PosY = optionDesc_PosY + (((inGameShop._items)[0]).iconBG):GetSizeY() + 20
      -- DECOMPILER ERROR at PC587: Confused about usage of register: R14 in 'UnsetPending'

      inGameShop.itemDescDetailSize = optionDesc_PosY + descConfig._gapY * (descCount)
      -- DECOMPILER ERROR at PC591: Confused about usage of register: R14 in 'UnsetPending'

      inGameShop._maxDescSize = inGameShop.itemDescDetailSize
      local limitType = cashProduct:getCashPurchaseLimitType()
      if UI_CCC.eCashProductCategory_Pearl == cashProduct:getMainCategory() then
        (self._btn_BigBuy_C):SetMonoTone(false)
        ;
        (self._btn_BigGift):SetMonoTone(true)
        ;
        (self._btn_BigCart):SetMonoTone(true)
        ;
        (self._btn_BigBuy_C):SetEnable(true)
        ;
        (self._btn_BigBuy):SetShow(false)
        ;
        (self._btn_BigBuy_M):SetShow(false)
        ;
        (self._btn_BigBuy_C):SetShow(true)
        ;
        (self._btn_BigBuy_Silver):SetShow(false)
        ;
        (self._btn_BigGift):SetEnable(false)
        ;
        (self._btn_BigCart):SetEnable(false)
        ;
        (self._btn_BigBuy_C):SetSpanSize(20, 10)
        ;
        (self._btn_BigBuy_M):SetSpanSize(20, 10)
      else
        if UI_CCC.eCashProductCategory_Mileage == cashProduct:getMainCategory() then
          (self._btn_BigBuy):SetShow(false)
          ;
          (self._btn_BigBuy_M):SetShow(true)
          ;
          (self._btn_BigBuy_C):SetShow(false)
          ;
          (self._btn_BigBuy_Silver):SetShow(false)
          if UI_PLT.AtCharacter == limitType or UI_PLT.AtAccount == limitType then
            local limitCount = cashProduct:getCashPurchaseCount()
            local mylimitCount = (getIngameCashMall()):getRemainingLimitCount(cashProduct:getNoRaw())
            if limitCount > 0 then
              (self._btn_BigBuy_M):SetMonoTone(false)
              ;
              (self._btn_BigGift):SetMonoTone(true)
              ;
              (self._btn_BigCart):SetMonoTone(true)
              ;
              (self._btn_BigBuy_M):SetEnable(true)
              ;
              (self._btn_BigGift):SetEnable(false)
              ;
              (self._btn_BigCart):SetEnable(false)
              if mylimitCount <= 0 then
                (self._btn_BigBuy_M):SetMonoTone(true)
                ;
                (self._btn_BigBuy_M):SetEnable(false)
              end
            else
              ;
              (self._btn_BigBuy_M):SetMonoTone(true)
              ;
              (self._btn_BigGift):SetMonoTone(true)
              ;
              (self._btn_BigCart):SetMonoTone(true)
              ;
              (self._btn_BigBuy_M):SetEnable(false)
              ;
              (self._btn_BigGift):SetEnable(false)
              ;
              (self._btn_BigCart):SetEnable(false)
            end
          else
            do
              ;
              (self._btn_BigBuy_M):SetMonoTone(false)
              ;
              (self._btn_BigGift):SetMonoTone(true)
              ;
              (self._btn_BigCart):SetMonoTone(true)
              ;
              (self._btn_BigBuy_M):SetEnable(true)
              ;
              (self._btn_BigGift):SetEnable(false)
              ;
              (self._btn_BigCart):SetEnable(false)
              ;
              (self._btn_BigGift):SetSpanSize(100, 10)
              ;
              (self._btn_BigCart):SetSpanSize(60, 10)
              ;
              (self._btn_BigBuy):SetSpanSize(20, 10)
              ;
              (self._btn_BigBuy_C):SetSpanSize(20, 10)
              ;
              (self._btn_BigBuy_M):SetSpanSize(20, 10)
              if UI_PLT.AtCharacter == limitType or UI_PLT.AtAccount == limitType then
                local limitCount = cashProduct:getCashPurchaseCount()
                local mylimitCount = (getIngameCashMall()):getRemainingLimitCount(cashProduct:getNoRaw())
                if limitCount > 0 then
                  (self._btn_BigBuy):SetMonoTone(false)
                  ;
                  (self._btn_BigGift):SetMonoTone(true)
                  ;
                  (self._btn_BigCart):SetMonoTone(false)
                  ;
                  (self._btn_BigBuy):SetEnable(true)
                  ;
                  (self._btn_BigGift):SetEnable(false)
                  ;
                  (self._btn_BigCart):SetEnable(true)
                  if mylimitCount <= 0 then
                    (self._btn_BigBuy):SetMonoTone(true)
                    ;
                    (self._btn_BigCart):SetMonoTone(true)
                    ;
                    (self._btn_BigBuy):SetEnable(false)
                    ;
                    (self._btn_BigCart):SetEnable(false)
                  end
                else
                  ;
                  (self._btn_BigBuy):SetMonoTone(true)
                  ;
                  (self._btn_BigGift):SetMonoTone(true)
                  ;
                  (self._btn_BigCart):SetMonoTone(true)
                  ;
                  (self._btn_BigBuy):SetEnable(false)
                  ;
                  (self._btn_BigGift):SetEnable(false)
                  ;
                  (self._btn_BigCart):SetEnable(false)
                end
              else
                do
                  ;
                  (self._btn_BigBuy):SetMonoTone(false)
                  ;
                  (self._btn_BigGift):SetMonoTone(false)
                  ;
                  (self._btn_BigCart):SetMonoTone(false)
                  ;
                  (self._btn_BigBuy):SetEnable(true)
                  ;
                  (self._btn_BigGift):SetEnable(true)
                  ;
                  (self._btn_BigCart):SetEnable(true)
                  ;
                  (self._btn_BigGift):SetSpanSize(100, 10)
                  ;
                  (self._btn_BigCart):SetSpanSize(60, 10)
                  ;
                  (self._btn_BigBuy):SetSpanSize(20, 10)
                  ;
                  (self._btn_BigBuy_C):SetSpanSize(20, 10)
                  ;
                  (self._btn_BigBuy_M):SetSpanSize(20, 10)
                  ;
                  (self._btn_BigBuy_M):SetShow(false)
                  ;
                  (self._btn_BigBuy_C):SetShow(false)
                  if cashProduct:isMoneyPrice() then
                    (self._btn_BigBuy):SetShow(false)
                    ;
                    (self._btn_BigBuy_Silver):SetShow(true)
                    if (self._btn_BigBuy):IsEnable() == true then
                      (self._btn_BigBuy_Silver):SetEnable(true)
                      ;
                      (self._btn_BigBuy_Silver):SetMonoTone(false)
                    else
                      ;
                      (self._btn_BigBuy_Silver):SetEnable(false)
                      ;
                      (self._btn_BigBuy_Silver):SetMonoTone(true)
                    end
                    ;
                    (self._btn_BigCart):SetEnable(false)
                    ;
                    (self._btn_BigCart):SetMonoTone(true)
                  else
                    ;
                    (self._btn_BigBuy_Silver):SetShow(false)
                  end
                  if cashProduct:isChooseCash() then
                    (self._btn_BigGift):SetMonoTone(true)
                    ;
                    (self._btn_BigCart):SetMonoTone(true)
                    ;
                    (self._btn_BigGift):SetEnable(false)
                    ;
                    (self._btn_BigCart):SetEnable(false)
                  end
                  ;
                  (self._btn_BigCart):SetShow(true)
                  ;
                  (self._btn_BigECart):SetShow(false)
                  if inGameShop._currentTab > 0 and inGameShop._currentTab <= getCashMainCategorySize() and (tabIndexList[inGameShop._currentTab])[6] > 0 and FGlobal_IngameCashShopEventCart_IsContentsOpen() == true then
                    (self._btn_BigECart):SetShow(true)
                    ;
                    (self._btn_BigCart):SetShow(false)
                  end
                  ;
                  (self._btn_BigGift):addInputEvent("Mouse_LUp", "IngameCashShop_DescSelectedGiftItem(" .. inGameShop._openProductKeyRaw .. ")")
                  ;
                  (self._btn_BigCart):addInputEvent("Mouse_LUp", "IngameCashShop_DescSelectedCartItem(" .. inGameShop._openProductKeyRaw .. ")")
                  ;
                  (self._btn_BigBuy):addInputEvent("Mouse_LUp", "IngameCashShop_DescSelectedBuyItem(" .. inGameShop._openProductKeyRaw .. ")")
                  ;
                  (self._btn_BigBuy_C):addInputEvent("Mouse_LUp", "IngameCashShop_DescSelectedBuyItem(" .. inGameShop._openProductKeyRaw .. ")")
                  ;
                  (self._btn_BigBuy_M):addInputEvent("Mouse_LUp", "IngameCashShop_DescSelectedBuyItem(" .. inGameShop._openProductKeyRaw .. ")")
                  ;
                  (self._btn_BigECart):addInputEvent("Mouse_LUp", "IngameCashShop_DescSelectedEcartItem(" .. inGameShop._openProductKeyRaw .. ")")
                  ;
                  (self._btn_BigBuy_Silver):addInputEvent("Mouse_LUp", "IngameCashShop_DescSelectedBuyItem(" .. inGameShop._openProductKeyRaw .. ")")
                end
              end
            end
          end
        end
      end
    end
  end
end

IngameCashShop_initSubItemButton = function()
  -- function num : 0_55 , upvalues : inGameShop
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  inGameShop._comboList = (Array.new)()
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  inGameShop._endSunPositionY = 0
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  inGameShop._bigButtonCount = 0
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  inGameShop._smallButtonCount = 0
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  inGameShop._skipCount = 0
  for ii = 1, inGameShop._subItemCount do
    (((inGameShop._subItemButton)[ii]).static):SetText("-")
    if ii == 1 then
      (((inGameShop._subItemButton)[ii]).static):SetCheck(true)
    else
      ;
      (((inGameShop._subItemButton)[ii]).static):SetCheck(false)
    end
    ;
    (((inGameShop._subItemButton)[ii]).static):SetIgnore(true)
    ;
    (((inGameShop._subItemButton)[ii]).static):SetShow(false)
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R4 in 'UnsetPending'

    ;
    ((inGameShop._subItemButton)[ii]).productNo = 0
    ;
    (((inGameShop._subItemButton)[ii]).static):SetSize(131, 38)
    ;
    (((inGameShop._subItemButton)[ii]).static):SetPosX(30)
    ;
    (((inGameShop._subItemButton)[ii]).static):SetPosY(40)
  end
end

IngameCashShop_initDescData = function(cashProduct)
  -- function num : 0_56 , upvalues : inGameShop
  if cashProduct == nil then
    return 
  end
  IngameCashShop_initSubItemButton()
  local self = inGameShop.desc
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  inGameShop._comboList = (Array.new)()
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  inGameShop._listComboCount = 1
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

  inGameShop._listComboIncludeDummyCount = 1
  local offergroup = cashProduct:getOfferGroup()
  local count = 0
  if offergroup ~= 0 then
    count = (getIngameCashMall()):getCashProductStaticStatusGroupListCount(offergroup)
  end
  for ii = 0, count - 1 do
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusGroupByIndex(offergroup, ii)
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R9 in 'UnsetPending'

    if cashProduct ~= nil and IngameCashShop_filterData(cashProduct) then
      (inGameShop._comboList)[inGameShop._listComboCount] = cashProduct:getNoRaw()
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R9 in 'UnsetPending'

      inGameShop._listComboCount = inGameShop._listComboCount + 1
      -- DECOMPILER ERROR at PC68: Confused about usage of register: R9 in 'UnsetPending'

      if cashProduct:getDisplayFilterKey() == 1 or cashProduct:getDisplayFilterKey() == 11 then
        inGameShop._bigButtonCount = inGameShop._bigButtonCount + 1
      else
        -- DECOMPILER ERROR at PC74: Confused about usage of register: R9 in 'UnsetPending'

        inGameShop._smallButtonCount = inGameShop._smallButtonCount + 1
      end
    end
  end
  IngameCashShop_sortData()
  local configButton = inGameShop._config
  local positionBX = 0
  local positionBY = 0
  local positionSX = 0
  local positionSY = 0
  local nextY = 0
  local divide = 0
  local sizeX = 0
  local gapXpos = 0
  -- DECOMPILER ERROR at PC96: Confused about usage of register: R13 in 'UnsetPending'

  if inGameShop._bigButtonCount ~= 0 then
    inGameShop._skipCount = inGameShop._bigButtonCount % 2
  end
  for ii = 1, inGameShop._listComboCount do
    if (inGameShop._comboList)[ii] ~= nil then
      local subProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw((inGameShop._comboList)[ii])
      if subProduct ~= nil then
        if ii == inGameShop._bigButtonCount + 1 and inGameShop._bigButtonCount ~= 0 then
          nextY = positionBY + 1
        end
        if subProduct:getDisplayFilterKey() == 1 or subProduct:getDisplayFilterKey() == 11 then
          local productName = subProduct:getDisplaySubName()
          if subProduct:isApplyDiscount() then
            productName = "<PAColor0xfface400>" .. productName
          else
            if subProduct:getTag() == 5 then
              productName = "<PAColor0xff33c5b3>" .. productName
            end
          end
          ;
          (((inGameShop._subItemButton)[ii]).static):SetText(productName)
          ;
          (((inGameShop._subItemButton)[ii]).static):SetShow(true)
          ;
          (((inGameShop._subItemButton)[ii]).static):SetIgnore(false)
          -- DECOMPILER ERROR at PC178: Confused about usage of register: R19 in 'UnsetPending'

          ;
          ((inGameShop._subItemButton)[ii]).productNo = (inGameShop._comboList)[ii]
          -- DECOMPILER ERROR at PC188: Confused about usage of register: R19 in 'UnsetPending'

          if inGameShop._cashProductNoData == ((inGameShop._subItemButton)[ii]).productNo then
            inGameShop._cashProductIndex = ii
          end
          sizeX = (configButton._subButtonSize)._BigX
          divide = 2
          ;
          (((inGameShop._subItemButton)[ii]).static):SetSize(sizeX, (configButton._subButton)._gapY)
          if (ii - 1) % divide == 0 then
            positionBX = ii - 1
            positionBY = (math.floor)(ii / divide)
            gapXpos = 0
          else
            gapXpos = 1
          end
          ;
          (((inGameShop._subItemButton)[ii]).static):SetPosX(30 + (ii - 1 - (positionBX)) * sizeX - gapXpos)
          ;
          (((inGameShop._subItemButton)[ii]).static):SetPosY(40 + positionBY * (configButton._subButton)._gapY)
        else
          do
            local productName = subProduct:getDisplaySubName()
            if subProduct:isApplyDiscount() then
              productName = "<PAColor0xfface400>" .. productName
            else
              if subProduct:getTag() == 5 then
                productName = "<PAColor0xff33c5b3>" .. productName
              end
            end
            ;
            (((inGameShop._subItemButton)[ii + inGameShop._skipCount]).static):SetText(productName)
            ;
            (((inGameShop._subItemButton)[ii + inGameShop._skipCount]).static):SetShow(true)
            ;
            (((inGameShop._subItemButton)[ii + inGameShop._skipCount]).static):SetIgnore(false)
            -- DECOMPILER ERROR at PC292: Confused about usage of register: R19 in 'UnsetPending'

            ;
            ((inGameShop._subItemButton)[ii + inGameShop._skipCount]).productNo = (inGameShop._comboList)[ii]
            sizeX = (configButton._subButtonSize)._SmallX
            divide = 5
            ;
            (((inGameShop._subItemButton)[ii + inGameShop._skipCount]).static):SetSize(sizeX, (configButton._subButton)._gapY)
            do
              local realCount = ii - inGameShop._bigButtonCount
              if (realCount - 1) % divide == 0 then
                positionSX = realCount - 1
                positionSY = nextY + (math.floor)(realCount / divide)
              end
              ;
              (((inGameShop._subItemButton)[ii + inGameShop._skipCount]).static):SetPosX(30 + (realCount - 1 - (positionSX)) * sizeX)
              ;
              (((inGameShop._subItemButton)[ii + inGameShop._skipCount]).static):SetPosY(40 + (positionSY) * (configButton._subButton)._gapY)
              -- DECOMPILER ERROR at PC347: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC347: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC347: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC347: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC347: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC347: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC347: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC349: Confused about usage of register: R13 in 'UnsetPending'

  inGameShop._endSunPositionY = positionSY
  -- DECOMPILER ERROR at PC355: Confused about usage of register: R13 in 'UnsetPending'

  if inGameShop._smallButtonCount == 0 then
    inGameShop._endSunPositionY = positionBY
  end
  if inGameShop._bigButtonCount > 0 then
    divide = 2
    local subButtonCount = (math.ceil)(inGameShop._bigButtonCount / divide) * divide
    for ii = inGameShop._bigButtonCount + 1, subButtonCount do
      (((inGameShop._subItemButton)[ii]).static):SetShow(true)
      sizeX = (configButton._subButtonSize)._BigX
      ;
      (((inGameShop._subItemButton)[ii]).static):SetSize(sizeX, (configButton._subButton)._gapY)
      ;
      (((inGameShop._subItemButton)[ii]).static):SetPosX(30 + (ii - 1 - (positionBX)) * sizeX - 1)
      ;
      (((inGameShop._subItemButton)[ii]).static):SetPosY(40 + positionBY * (configButton._subButton)._gapY)
    end
    -- DECOMPILER ERROR at PC415: Confused about usage of register: R14 in 'UnsetPending'

    inGameShop._listComboIncludeDummyCount = subButtonCount
  end
  do
    if inGameShop._smallButtonCount > 0 then
      divide = 5
      local subButtonCount = (math.ceil)(inGameShop._smallButtonCount / divide) * divide
      for ii = inGameShop._smallButtonCount + 1 + inGameShop._bigButtonCount + inGameShop._skipCount, subButtonCount + inGameShop._bigButtonCount + inGameShop._skipCount do
        (((inGameShop._subItemButton)[ii]).static):SetShow(true)
        sizeX = (configButton._subButtonSize)._SmallX
        ;
        (((inGameShop._subItemButton)[ii]).static):SetSize(sizeX, (configButton._subButton)._gapY)
        realCount = ii - (inGameShop._bigButtonCount + inGameShop._skipCount)
        ;
        (((inGameShop._subItemButton)[ii]).static):SetPosX(30 + (realCount - 1 - (positionSX)) * sizeX)
        ;
        (((inGameShop._subItemButton)[ii]).static):SetPosY(40 + (positionSY) * (configButton._subButton)._gapY)
      end
      -- DECOMPILER ERROR at PC499: Confused about usage of register: R14 in 'UnsetPending'

      inGameShop._listComboIncludeDummyCount = subButtonCount + inGameShop._bigButtonCount + inGameShop._skipCount
    end
    do
      local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(inGameShop._openProductKeyRaw)
      if cashProduct == nil then
        return 
      end
      -- DECOMPILER ERROR at PC510: Confused about usage of register: R14 in 'UnsetPending'

      inGameShop._endChoosePositionY = 0
      -- DECOMPILER ERROR at PC512: Confused about usage of register: R14 in 'UnsetPending'

      inGameShop._chooseProductClickList = nil
      ;
      (getIngameCashMall()):clearChooseProductCount()
      if cashProduct:isChooseCash() then
        local validChooseCashProduct = cashProduct:chooseCashCount()
        local nextLine = -1
        -- DECOMPILER ERROR at PC528: Confused about usage of register: R16 in 'UnsetPending'

        inGameShop._chooseProductClickList = (Array.new)()
        for ii = 0, inGameShop._chooseProductListCount - 1 do
          local radioBenner = (inGameShop._chooseProductList)[ii]
          if ii < validChooseCashProduct then
            local chooseCashProduct = cashProduct:getChooseCashByIndex(ii)
            if chooseCashProduct == nil then
              return 
            end
            if ii % 3 == 0 then
              nextLine = nextLine + 1
            end
            ;
            (radioBenner.staticAddPlusBtn):SetShow(true)
            ;
            (radioBenner.staticAddPlusBtn):SetIgnore(false)
            ;
            (radioBenner.staticAddPlusBtn):SetPosX(200 + 220 * (ii % 3))
            ;
            (radioBenner.staticAddPlusBtn):SetPosY(60 + 59 * (nextLine))
            ;
            (radioBenner.staticAddMinusBtn):SetShow(true)
            ;
            (radioBenner.staticAddMinusBtn):SetIgnore(false)
            ;
            (radioBenner.staticAddMinusBtn):SetPosX(200 + 220 * (ii % 3))
            ;
            (radioBenner.staticAddMinusBtn):SetPosY(77 + 59 * (nextLine))
            ;
            (radioBenner.staticEditCount):SetShow(true)
            ;
            (radioBenner.staticEditCount):SetText("0")
            ;
            (radioBenner.staticEditCount):SetPosX(165 + 220 * (ii % 3))
            ;
            (radioBenner.staticEditCount):SetPosY(59 + 59 * (nextLine))
            ;
            (radioBenner.staticBG):SetShow(true)
            ;
            (radioBenner.staticBG):ChangeTextureInfoName(chooseCashProduct:getPackageIcon())
            ;
            (radioBenner.staticBG):SetIgnore(false)
            ;
            (radioBenner.staticBG):SetPosX(10 + 220 * (ii % 3))
            ;
            (radioBenner.staticBG):SetPosY(50 + 59 * (nextLine))
            ;
            (radioBenner.staticBG):addInputEvent("Mouse_On", "InGameShop_ProductShowToolTip( " .. chooseCashProduct:getNoRaw() .. ", " .. ii .. ", true )")
            ;
            (radioBenner.staticBG):addInputEvent("Mouse_Out", "FGlobal_CashShop_GoodsTooltipInfo_Close()")
            ;
            (radioBenner.staticBG):addInputEvent("Mouse_LUp", "InGameShop_ChooseCashView(" .. chooseCashProduct:getNoRaw() .. ")")
          else
            do
              do
                ;
                (radioBenner.staticBG):SetShow(false)
                ;
                (radioBenner.staticBG):SetIgnore(true)
                ;
                (radioBenner.staticAddPlusBtn):SetShow(false)
                ;
                (radioBenner.staticAddPlusBtn):SetIgnore(true)
                ;
                (radioBenner.staticAddMinusBtn):SetShow(false)
                ;
                (radioBenner.staticAddMinusBtn):SetIgnore(true)
                ;
                (radioBenner.staticEditCount):SetShow(false)
                ;
                (radioBenner.staticEditCount):SetText("0")
                -- DECOMPILER ERROR at PC691: Confused about usage of register: R21 in 'UnsetPending'

                ;
                (inGameShop._chooseProductClickList)[ii] = 0
                -- DECOMPILER ERROR at PC692: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC692: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC692: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        -- DECOMPILER ERROR at PC699: Confused about usage of register: R16 in 'UnsetPending'

        inGameShop._endChoosePositionY = inGameShop._endChoosePositionY + 59 * (nextLine + 1)
      else
        do
          for ii = 0, inGameShop._chooseProductListCount - 1 do
            local radioBenner = (inGameShop._chooseProductList)[ii]
            ;
            (radioBenner.staticBG):SetShow(false)
            ;
            (radioBenner.staticBG):SetIgnore(true)
            ;
            (radioBenner.staticAddPlusBtn):SetShow(false)
            ;
            (radioBenner.staticAddPlusBtn):SetIgnore(true)
            ;
            (radioBenner.staticAddMinusBtn):SetShow(false)
            ;
            (radioBenner.staticAddMinusBtn):SetIgnore(true)
            ;
            (radioBenner.staticEditCount):SetShow(false)
            ;
            (radioBenner.staticEditCount):SetText("0")
          end
        end
      end
    end
  end
end

IngameCashShop_filterData = function(cashProduct)
  -- function num : 0_57 , upvalues : inGameShop
  local self = inGameShop
  if not CheckCashProduct(cashProduct) then
    return false
  end
  return true
end

IngameCashShop_SortCash = function(lhs, rhs)
  -- function num : 0_58 , upvalues : inGameShop
  local self = inGameShop
  local lhsNo, rhsNo, lhsOrder, rhsOrder, lhsFilter, rhsFilter = nil, nil, nil, nil, nil, nil
  local lhsWrapper = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(lhs)
  if lhsWrapper ~= nil then
    lhsNo = lhsWrapper:getNoRaw()
    lhsOrder = lhsWrapper:getOrder()
    lhsFilter = lhsWrapper:getDisplayFilterKey()
  end
  local rhsWrapper = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(rhs)
  if rhsWrapper ~= nil then
    rhsNo = rhsWrapper:getNoRaw()
    rhsOrder = rhsWrapper:getOrder()
    rhsFilter = rhsWrapper:getDisplayFilterKey()
  end
  if lhsOrder == rhsOrder then
    if lhsNo >= rhsNo then
      do
        do return lhsFilter ~= rhsFilter end
        do return lhsOrder < rhsOrder end
        do return lhsFilter < rhsFilter end
        -- DECOMPILER ERROR: 6 unprocessed JMP targets
      end
    end
  end
end

IngameCashShop_sortData = function()
  -- function num : 0_59 , upvalues : inGameShop
  local self = inGameShop
  ;
  (table.sort)(self._comboList, IngameCashShop_SortCash)
end

HandleClicked_IngameCashShop_ShowSubList = function()
  -- function num : 0_60 , upvalues : inGameShop
  local self = inGameShop.desc
end

HandleClicked_IngameCashShop_SelectedSubList = function()
  -- function num : 0_61 , upvalues : inGameShop
  local self = inGameShop.desc
  IngameCashShop_DescUpdate()
end

InGameShop_ShowItemToolTip = function(isShow, index)
  -- function num : 0_62 , upvalues : inGameShop
  local self = inGameShop
  if isShow == true then
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._openProductKeyRaw)
    local itemWrapper = cashProduct:getItemByIndex(index)
    local slotIcon = ((self._items)[index]).icon
    Panel_Tooltip_Item_Show(itemWrapper, slotIcon, true, false, nil)
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

InGameShop_ShowSubItemToolTip = function(isShow, index)
  -- function num : 0_63 , upvalues : inGameShop
  local self = inGameShop
  if isShow == true then
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._openProductKeyRaw)
    local itemWrapper = cashProduct:getSubItemByIndex(index)
    local slotIcon = ((self._items)[index + cashProduct:getSubItemListCount()]).icon
    Panel_Tooltip_Item_Show(itemWrapper, slotIcon, true, false, nil)
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

IngameCashShop_SelectedItem = function(index, bValue)
  -- function num : 0_64 , upvalues : inGameShop
  local self = inGameShop
  local slot = (self._slots)[index]
  self._currentProductKeyRaw = slot.productNoRaw
  local prevIndex = -1
  if self._openProductKeyRaw == slot.productNoRaw and index == self._currentIndex then
    self._isClick = true
  else
    if self._isSubItemClick and self._currentProductKeyRaw == self._categoryProductKeyRaw then
      self._isClick = true
    else
      self._isClick = false
    end
  end
  if self._currentProductKeyRaw ~= self._categoryProductKeyRaw then
    self._isSubItemClick = false
  end
  self._currentIndex = index
  if self._openProductKeyRaw == slot.productNoRaw or self._isSubItemClick then
    return 
  end
  audioPostEvent_SystemUi(1, 0)
  FGlobal_SpecialMoveSettingCheck()
  IngameCashShop_SelectedItemXXX(slot.productNoRaw, nil, bValue)
  local tempSaveProductKeyRaw = slot.productNoRaw
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(tempSaveProductKeyRaw)
  if cashProduct ~= nil and cashProduct:isMoneyPrice() then
    warehouse_requestInfo(getCurrentWaypointKey())
  end
end

IngameCashShop_SelectedItemXXX = function(productNoRaw, isForcePositionSet, bValue)
  -- function num : 0_65 , upvalues : inGameShop, UI_CCC, tabIndexList
  local self = inGameShop
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
  if cashProduct == nil then
    return 
  end
  local prevPos = 0
  local prevKeyRaw = self._openProductKeyRaw
  for ii = 0, self._listCount - 1 do
    local productNoRawInList = (self._list)[ii]
    if self:isSelectProductGroup(productNoRaw) or productNoRawInList == productNoRaw then
      prevPos = prevPos - self._position
      break
    end
    if self:isSelectProductGroup(productNoRawInList) then
      prevPos = prevPos + (self._goodDescBG):GetSizeY()
    end
    prevPos = prevPos + ((self._config)._slot)._gapY
  end
  do
    self._openProductKeyRaw = productNoRaw
    ;
    (self._goodDescBG):SetShow(true)
    IngameCashShop_initDescData(cashProduct)
    if isForcePositionSet then
      local pos = 0
      for ii = 0, self._listCount - 1 do
        local productNoRaw = (self._list)[ii]
        if self:isSelectProductGroup(productNoRaw) then
          if pos > 100 then
            pos = pos - 100
          end
          if prevPos < pos then
            pos = pos - (self._goodDescBG):GetSizeY()
          end
          self._position = pos
          self._currentPos = self._position
          ;
          (self._scroll_IngameCash):SetControlPos(self._position / self:getMaxPosition())
          break
        end
        pos = pos + ((self._config)._slot)._gapY
      end
    else
      do
        do
          local pos = 0
          for ii = 0, self._listCount - 1 do
            local productNoRaw = (self._list)[ii]
            if self:isSelectProductGroup(productNoRaw) then
              if prevKeyRaw == -1 then
                break
              end
              pos = pos - (prevPos)
              local listSize = self:getMaxPosition()
              if listSize < 0 or pos < 0 then
                self._position = 0
                break
              end
              self._position = pos
              if listSize < self._position then
                self._position = listSize
              end
              self._currentPos = self._position
              ;
              (self._scroll_IngameCash):SetControlPos(self._position / self:getMaxPosition())
              break
            end
            do
              do
                pos = pos + ((self._config)._slot)._gapY
                -- DECOMPILER ERROR at PC135: LeaveBlock: unexpected jumping out DO_STMT

              end
            end
          end
          ;
          (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), 1)
          IngameCashShop_DescUpdate()
          -- DECOMPILER ERROR at PC163: Unhandled construct in 'MakeBoolean' P1

          if UI_CCC.eCashProductCategory_Costumes == (tabIndexList[self._currentTab])[5] and (Return_CashShopController_FirstIgnore() == false or inGameShop._listComboCount == 1) then
            FGlobal_CashShop_SetEquip_Update(productNoRaw)
            FGlobal_CashShop_SetEquip_SelectedItem(productNoRaw)
          end
          FGlobal_CashShop_SetEquip_Update(productNoRaw)
          FGlobal_CashShop_SetEquip_SelectedItem(productNoRaw)
          PaGlobal_RecommendEngine_CashVeiw(productNoRaw, bValue)
          self._ViewingRecommend = bValue
          self:update()
        end
      end
    end
  end
end

InGameShop_subItemEvent = function(index)
  -- function num : 0_66 , upvalues : inGameShop
  local self = inGameShop
  self._isSubItemClick = true
  self._categoryProductKeyRaw = self._currentProductKeyRaw
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

  if index > 0 and index < self._listComboCount + self._skipCount and ((inGameShop._subItemButton)[index]).productNo ~= 0 then
    inGameShop._openProductKeyRaw = ((inGameShop._subItemButton)[index]).productNo
    IngameCashShop_DescUpdate()
    FGlobal_CashShop_SetEquip_Update(((inGameShop._subItemButton)[index]).productNo)
    PaGlobal_RecommendEngine_CashVeiw(((inGameShop._subItemButton)[index]).productNo, self._ViewingRecommend)
    self:update()
  end
end

FGlobal_IngameCashShop_SelectedItemReset = function()
  -- function num : 0_67 , upvalues : inGameShop
  local self = inGameShop
  self._openProductKeyRaw = -1
  ;
  (self._goodDescBG):SetShow(false)
  ;
  (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), 1)
  local listSize = self:getMaxPosition()
  if (self._static_ScrollArea):GetSizeY() <= listSize and listSize < self._currentPos then
    self._position = self:getMaxPosition()
    ;
    (self._scroll_IngameCash):SetControlPos(1)
  end
  self:update()
  ;
  (self._goodDescBG):SetShow(false)
  IngameCashShop_initSubItemButton()
end

InGameShop_ChooseCashClickEvent = function(index, isUp)
  -- function num : 0_68 , upvalues : inGameShop
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(inGameShop._openProductKeyRaw)
  if cashProduct == nil then
    return 
  end
  local validChooseCount = cashProduct:chooseCashCount()
  local mustChooseCount = cashProduct:mustChooseCount()
  local isChooseDuplicate = cashProduct:isChooseDuplicaite()
  local checkCount = 0
  local isEnable = false
  for ii = 0, validChooseCount - 1 do
    checkCount = checkCount + (inGameShop._chooseProductClickList)[ii]
  end
  if checkCount == mustChooseCount and isUp == true then
    local radioBenner = (inGameShop._chooseProductList)[index]
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOP_CHOOSECOUNTOVER"))
    return 
  else
    do
      if isUp == true then
        if isChooseDuplicate == false then
          if (inGameShop._chooseProductClickList)[index] == 1 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOP_CHOOSECOUNTDUPLICATE"))
            return 
          else
            -- DECOMPILER ERROR at PC66: Confused about usage of register: R8 in 'UnsetPending'

            ;
            (inGameShop._chooseProductClickList)[index] = (inGameShop._chooseProductClickList)[index] + 1
          end
        else
          -- DECOMPILER ERROR at PC74: Confused about usage of register: R8 in 'UnsetPending'

          ;
          (inGameShop._chooseProductClickList)[index] = (inGameShop._chooseProductClickList)[index] + 1
        end
      else
        if (inGameShop._chooseProductClickList)[index] == 0 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOP_CHOOSECOUNTMINIMUM"))
          return 
        end
        -- DECOMPILER ERROR at PC95: Confused about usage of register: R8 in 'UnsetPending'

        ;
        (inGameShop._chooseProductClickList)[index] = (inGameShop._chooseProductClickList)[index] - 1
      end
      do
        local radioBenner = (inGameShop._chooseProductList)[index]
        ;
        (radioBenner.staticEditCount):SetText((inGameShop._chooseProductClickList)[index])
        ;
        (getIngameCashMall()):setChooseProductCount(index, isUp)
      end
    end
  end
end

InGameShop_ChooseCashView = function(productNoRaw)
  -- function num : 0_69
  FGlobal_CashShop_SetEquip_Update(productNoRaw)
  FGlobal_CashShop_SetEquip_SelectedItem(productNoRaw)
end

FGlobal_IngameCashShopCashCheckList_ReturnValue = function()
  -- function num : 0_70 , upvalues : inGameShop
  return inGameShop._chooseProductClickList
end

FGlobal_Update_IngameCashShop_CartEffect = function()
  -- function num : 0_71 , upvalues : inGameShop
  local self = inGameShop
  ;
  ((self._myCartTab).static):EraseAllEffect()
  ;
  ((self._myCartTab).static):AddEffect("fUI_CashShop_BasketButton", false, 0, 0)
end

IngameCashShop_CartItem = function(index)
  -- function num : 0_72 , upvalues : inGameShop
  local self = inGameShop
  local slot = (self._slots)[index]
  local tempSaveProductKeyRaw = slot.productNoRaw
  if inGameShop._openProductKeyRaw ~= -1 then
    if inGameShop._openProductKeyRaw == slot.productNoRaw then
      tempSaveProductKeyRaw = slot.productNoRaw
    else
      if self:isSelectProductGroup(slot.productNoRaw) then
        tempSaveProductKeyRaw = self._openProductKeyRaw
      else
        tempSaveProductKeyRaw = slot.productNoRaw
      end
    end
  else
    tempSaveProductKeyRaw = slot.productNoRaw
  end
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(tempSaveProductKeyRaw)
  if cashProduct == nil then
    return 
  end
  if (getIngameCashMall()):checkPushableInCart(tempSaveProductKeyRaw, 1) == false then
    return 
  end
  local doAnotherClassItem = function()
    -- function num : 0_72_0 , upvalues : slot, tempSaveProductKeyRaw
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(slot.productNoRaw)
    if cashProduct == nil then
      return 
    end
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CARTITEM_ACK", "getName", cashProduct:getName()))
    FGlobal_PushCart_IngameCashShop_NewCart(tempSaveProductKeyRaw, 1)
    return 
  end

  if cashProduct:doHaveDisplayClass() and not cashProduct:isClassTypeUsable((getSelfPlayer()):getClassType()) then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_ALERT")
    local messageBoxMemo = "<PAColor0xffd0ee68>[" .. PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_MATHCLASS") .. "]\n" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CARTITEM_MSGMEMO", "getName", productName) .. "<PAOldColor>"
    messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = doAnotherClassItem, functionNo = _InGameShopBuy_Confirm_Cancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CARTITEM_ACK", "getName", cashProduct:getName()))
      FGlobal_PushCart_IngameCashShop_NewCart(tempSaveProductKeyRaw, 1)
    end
  end
end

IngameCashShop_DescSelectedCartItem = function(productKeyRaw)
  -- function num : 0_73 , upvalues : inGameShop
  local self = inGameShop
  local tempSaveProductKeyRaw = productKeyRaw
  if inGameShop._openProductKeyRaw ~= -1 then
    if inGameShop._openProductKeyRaw == productKeyRaw then
      tempSaveProductKeyRaw = productKeyRaw
    else
      if self:isSelectProductGroup(productKeyRaw) then
        tempSaveProductKeyRaw = self._openProductKeyRaw
      else
        tempSaveProductKeyRaw = productKeyRaw
      end
    end
  else
    tempSaveProductKeyRaw = productKeyRaw
  end
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(tempSaveProductKeyRaw)
  if cashProduct == nil then
    return 
  end
  if (getIngameCashMall()):checkPushableInCart(tempSaveProductKeyRaw, 1) == false then
    return 
  end
  local doAnotherClassItem = function()
    -- function num : 0_73_0 , upvalues : productKeyRaw, tempSaveProductKeyRaw
    local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productKeyRaw)
    if cashProduct == nil then
      return 
    end
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CARTITEM_ACK", "getName", cashProduct:getName()))
    FGlobal_PushCart_IngameCashShop_NewCart(tempSaveProductKeyRaw, 1)
    return 
  end

  if cashProduct:doHaveDisplayClass() and not cashProduct:isClassTypeUsable((getSelfPlayer()):getClassType()) then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_ALERT")
    local messageBoxMemo = "<PAColor0xffd0ee68>[" .. PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_MATHCLASS") .. "]\n" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CARTITEM_MSGMEMO", "getName", productName) .. "<PAOldColor>"
    messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = doAnotherClassItem, functionNo = _InGameShopBuy_Confirm_Cancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_CARTITEM_ACK", "getName", cashProduct:getName()))
      FGlobal_PushCart_IngameCashShop_NewCart(tempSaveProductKeyRaw, 1)
      ToClient_RequestRecommendList(productKeyRaw)
    end
  end
end

IngameCashShop_GiftItem = function(index)
  -- function num : 0_74 , upvalues : inGameShop
  local self = inGameShop
  local slot = (self._slots)[index]
  local selfplayer = getSelfPlayer()
  if selfplayer == nil then
    return 
  end
  local limitLevel = 50
  local myLevel = (selfplayer:get()):getLevel()
  if myLevel < 50 and (isGameTypeEnglish() or isGameTypeTH() or isGameTypeID()) then
    limitLevel = 50
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_LIMIT_20LEVEL", "level", limitLevel))
    return 
  end
  if myLevel < 56 and (isGameTypeSA() or isGameTypeTR()) then
    limitLevel = 56
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_LIMIT_20LEVEL", "level", limitLevel))
    return 
  end
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(slot.productNoRaw)
  if cashProduct == nil then
    return 
  end
  local tempSaveProductKeyRaw = slot.productNoRaw
  if inGameShop._openProductKeyRaw ~= -1 then
    if inGameShop._openProductKeyRaw == slot.productNoRaw then
      tempSaveProductKeyRaw = slot.productNoRaw
    else
      if self:isSelectProductGroup(slot.productNoRaw) then
        tempSaveProductKeyRaw = self._openProductKeyRaw
      else
        tempSaveProductKeyRaw = slot.productNoRaw
      end
    end
  else
    tempSaveProductKeyRaw = slot.productNoRaw
  end
  FGlobal_InGameShopBuy_Open(tempSaveProductKeyRaw, true)
  IngameCashShopCoupon_Close()
end

IngameCashShop_DescSelectedGiftItem = function(productNoRaw)
  -- function num : 0_75 , upvalues : inGameShop
  local self = inGameShop
  local selfplayer = getSelfPlayer()
  if selfplayer == nil then
    return 
  end
  local limitLevel = 50
  local myLevel = (selfplayer:get()):getLevel()
  if myLevel < 50 and (isGameTypeEnglish() or isGameTypeTH() or isGameTypeID()) then
    limitLevel = 50
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_LIMIT_20LEVEL", "level", limitLevel))
    return 
  end
  if myLevel < 56 and (isGameTypeSA() or isGameTypeTR()) then
    limitLevel = 56
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_LIMIT_20LEVEL", "level", limitLevel))
    return 
  end
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
  if cashProduct == nil then
    return 
  end
  local tempSaveProductKeyRaw = productNoRaw
  if inGameShop._openProductKeyRaw ~= -1 then
    if inGameShop._openProductKeyRaw == productNoRaw then
      tempSaveProductKeyRaw = productNoRaw
    else
      if self:isSelectProductGroup(productNoRaw) then
        tempSaveProductKeyRaw = self._openProductKeyRaw
      else
        tempSaveProductKeyRaw = productNoRaw
      end
    end
  else
    tempSaveProductKeyRaw = productNoRaw
  end
  FGlobal_InGameShopBuy_Open(tempSaveProductKeyRaw, true)
end

IngameCashShop_DescSelectedEcartItem = function(productNoRaw)
  -- function num : 0_76
  IngameCashShopEventCart_Update(productNoRaw)
  ToClient_RequestRecommendList(productNoRaw)
end

IngameCashShop_BuyItem = function(index)
  -- function num : 0_77 , upvalues : inGameShop, tabIndexList, UI_CCC, isKorea, isNaver
  local self = inGameShop
  local slot = (self._slots)[index]
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(slot.productNoRaw)
  if cashProduct == nil then
    return 
  end
  local tempSaveProductKeyRaw = slot.productNoRaw
  if inGameShop._openProductKeyRaw ~= -1 then
    if inGameShop._openProductKeyRaw == slot.productNoRaw then
      tempSaveProductKeyRaw = slot.productNoRaw
    else
      if self:isSelectProductGroup(slot.productNoRaw) then
        tempSaveProductKeyRaw = self._openProductKeyRaw
      else
        tempSaveProductKeyRaw = slot.productNoRaw
      end
    end
  else
    tempSaveProductKeyRaw = slot.productNoRaw
  end
  local mainCategory = cashProduct:getMainCategory()
  local categoryType = 0
  for ii = 1, self._tabCount do
    if (tabIndexList[ii])[2] == mainCategory then
      categoryType = (tabIndexList[ii])[5]
    end
  end
  local isCouponOpen = false
  do
    local isPearlTab = UI_CCC.eCashProductCategory_Pearl == categoryType
    if isPearlTab == true and isKorea == true and isNaver == true then
      local naverLink = "http://black.game.naver.com/black/billing/shop/index.daum"
      ToClient_OpenChargeWebPage(naverLink, true)
    else
      isCouponOpen = FGlobal_InGameShopBuy_Open(tempSaveProductKeyRaw, false)
    end
    if UI_CCC.eCashProductCategory_Pearl == categoryType or UI_CCC.eCashProductCategory_Mileage == categoryType then
      IngameCashShopCoupon_Close()
    elseif isCouponOpen == true then
      IngameCashShopCoupon_Open(0)
    end
    ToClient_RequestRecommendList(productNoRaw)
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

IngameCashShop_DescSelectedBuyItem = function(productNoRaw)
  -- function num : 0_78 , upvalues : inGameShop, tabIndexList, UI_CCC, isKorea, isNaver
  local self = inGameShop
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
  if cashProduct == nil then
    return 
  end
  local tempSaveProductKeyRaw = productNoRaw
  if inGameShop._openProductKeyRaw ~= -1 then
    if inGameShop._openProductKeyRaw == productNoRaw then
      tempSaveProductKeyRaw = productNoRaw
    else
      if self:isSelectProductGroup(productNoRaw) then
        tempSaveProductKeyRaw = self._openProductKeyRaw
      else
        tempSaveProductKeyRaw = productNoRaw
      end
    end
  else
    tempSaveProductKeyRaw = productNoRaw
  end
  local mainCategory = cashProduct:getMainCategory()
  local categoryType = 0
  for ii = 1, self._tabCount do
    if (tabIndexList[ii])[2] == mainCategory then
      categoryType = (tabIndexList[ii])[5]
    end
  end
  local isCouponOpen = false
  do
    local isPearlTab = UI_CCC.eCashProductCategory_Pearl == categoryType
    if isPearlTab == true and isKorea == true and isNaver == true then
      local naverLink = "http://black.game.naver.com/black/billing/shop/index.daum"
      ToClient_OpenChargeWebPage(naverLink, true)
    else
      isCouponOpen = FGlobal_InGameShopBuy_Open(tempSaveProductKeyRaw, false)
    end
    if UI_CCC.eCashProductCategory_Pearl == categoryType or UI_CCC.eCashProductCategory_Mileage == categoryType then
      IngameCashShopCoupon_Close()
    elseif isCouponOpen == true then
      IngameCashShopCoupon_Open(0, productNoRaw)
    end
    ToClient_RequestRecommendList(productNoRaw)
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

InGameShop_OpenClassList = function()
  -- function num : 0_79 , upvalues : inGameShop
  local self = inGameShop
  local list = (self._combo_Class):GetListControl()
  audioPostEvent_SystemUi(0, 0)
  ;
  (self._combo_Class):ToggleListbox()
end

InGameShop_SelectClass = function()
  -- function num : 0_80 , upvalues : inGameShop
  local self = inGameShop
  local selectIndex = (self._combo_Class):GetSelectIndex()
  if selectIndex == -1 then
    return 
  end
  ;
  (self._goodDescBG):SetShow(false)
  if getCharacterClassCount() == (self._combo_Class):GetSelectKey() and (self._combo_Class):GetSelectIndex() == 0 then
    (getIngameCashMall()):setCurrentClass(-1)
  else
    ;
    (getIngameCashMall()):setCurrentClass((self._combo_Class):GetSelectKey())
  end
  audioPostEvent_SystemUi(0, 0)
  ;
  (self._combo_Class):SetSelectItemIndex(selectIndex)
  self._currentPos = 0
  self._position = 0
  ;
  (self._scroll_IngameCash):SetControlPos(0)
  ;
  (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), 1)
  self:initData()
  self:update()
end

InGameShop_OpenSorList = function()
  -- function num : 0_81 , upvalues : inGameShop
  local self = inGameShop
  local list = (self._combo_Sort):GetListControl()
  audioPostEvent_SystemUi(0, 0)
  ;
  (self._combo_Sort):ToggleListbox()
end

InGameShop_SelectSort = function()
  -- function num : 0_82 , upvalues : inGameShop
  local self = inGameShop
  local selectIndex = (self._combo_Sort):GetSelectIndex()
  if selectIndex == -1 then
    return 
  end
  ;
  (self._goodDescBG):SetShow(false)
  audioPostEvent_SystemUi(0, 0)
  ;
  (self._combo_Sort):SetSelectItemIndex(selectIndex)
  if (self._combo_Sort):GetSelectKey() == 0 then
    (getIngameCashMall()):setCurrentSort(-1)
  else
    ;
    (getIngameCashMall()):setCurrentSort((self._combo_Sort):GetSelectKey())
  end
  self._currentPos = 0
  self._position = 0
  ;
  (self._scroll_IngameCash):SetControlPos(0)
  ;
  (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), 1)
  self:initData()
  self:update()
end

InGameShop_OpenSubFilterList = function()
  -- function num : 0_83 , upvalues : inGameShop
  local self = inGameShop
  local list = (self._combo_SubFilter):GetListControl()
  audioPostEvent_SystemUi(0, 0)
  ;
  (self._combo_SubFilter):ToggleListbox()
end

InGameShop_SelectSubFilter = function()
  -- function num : 0_84 , upvalues : inGameShop
  local self = inGameShop
  local selectIndex = (self._combo_SubFilter):GetSelectIndex()
  if selectIndex == -1 then
    return 
  end
  ;
  (self._goodDescBG):SetShow(false)
  audioPostEvent_SystemUi(0, 0)
  ;
  (self._combo_SubFilter):SetSelectItemIndex(selectIndex)
  if (self._combo_SubFilter):GetSelectKey() == 0 then
    (getIngameCashMall()):setCurrentSubFilter(-1)
  else
    ;
    (getIngameCashMall()):setCurrentSubFilter((self._combo_SubFilter):GetSelectKey())
  end
  self._currentPos = 0
  self._position = 0
  ;
  (self._scroll_IngameCash):SetControlPos(0)
  ;
  (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), 1)
  self:initData()
  self:update()
end

local isFirstRespone = true
InGameShop_UpdateCashShop = function()
  -- function num : 0_85 , upvalues : inGameShop
  local self = inGameShop
  ;
  (self._static_Construction):SetShow(false)
  if PaGlobal_RecommendManager:isFromRecommend() then
    PaGlobal_RecommendManager:UsedFromRecommend()
    return 
  end
  if self._openByEventAlarm then
    self:RadioReset()
    ;
    (((self._tabs)[1]).static):SetCheck(true)
    InGameShop_TabEvent(1)
  else
    Panel_IngameCashShop:SetChildIndex((self._promotionTab).static, 9900)
  end
end

InGameShop_UpdateCash = function()
  -- function num : 0_86 , upvalues : inGameShop
  local self = inGameShop
  local cash, pearl, mileage = self:updateMoney()
  return cash, pearl, mileage
end

InGameShop_OuterEventByAttacked = function()
  -- function num : 0_87
  if Panel_IngameCashShop:GetShow() then
    InGameShop_Close()
  end
end

InGameShop_OuterEventForDead = function()
  -- function num : 0_88
  InGameShop_Close()
end

InGameShop_Resize = function()
  -- function num : 0_89 , upvalues : inGameShop, isKorea, isNaver, tabId, _AllBG
  local self = inGameShop
  local slotConfig = (self._config)._slot
  local tabConfig = (self._config)._tab
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_IngameCashShop:GetSizeX()
  local panelSizeY = Panel_IngameCashShop:GetSizeY()
  Panel_IngameCashShop:SetPosX(40)
  Panel_IngameCashShop:SetPosY(0)
  Panel_IngameCashShop:SetSize(Panel_IngameCashShop:GetSizeX(), scrSizeY)
  ;
  (self._static_SideLineLeft):SetSize((self._static_SideLineLeft):GetSizeX(), scrSizeY)
  ;
  (self._static_SideLineRight):SetSize((self._static_SideLineRight):GetSizeX(), scrSizeY)
  ;
  (self._staticText_CashCount):ComputePos()
  ;
  (self._staticText_PearlCount):ComputePos()
  ;
  (self._staticText_SilverCount):ComputePos()
  ;
  (self._staticText_MileageCount):ComputePos()
  ;
  (self._haveCashBoxBG):ComputePos()
  ;
  (self._pearlBox):ComputePos()
  ;
  (self._nowPearlIcon):ComputePos()
  ;
  (self._btn_BuyPearl):ComputePos()
  ;
  (self._silverBox):ComputePos()
  ;
  (self._silver):ComputePos()
  ;
  (self._mileageBox):ComputePos()
  ;
  (self._mileage):ComputePos()
  ;
  (self._cashBox):ComputePos()
  ;
  (self._nowCash):ComputePos()
  ;
  (self._btn_BuyDaum):ComputePos()
  ;
  (self._btn_RefreshCash):ComputePos()
  ;
  (self._btn_HowUsePearl):ComputePos()
  if isKorea == true and isNaver == true then
    (self._staticText_CashCount):SetShow(false)
    ;
    (self._cashBox):SetShow(false)
    ;
    (self._nowCash):SetShow(false)
    ;
    (self._btn_BuyDaum):SetShow(false)
    ;
    (self._btn_RefreshCash):SetShow(false)
  end
  tabConfig._startY = ((self._promotionTab).static):GetPosY() + ((self._promotionTab).static):GetSizeY() - 20
  ;
  ((self._myCartTab).static):SetPosY(tabConfig._startY + tabConfig._gapY * (tabId.cart - 1))
  self:initTabPos()
  local remainingSizeY = _ingameCashShop_SetViewListCount()
  ;
  (self._static_GradationBottom):SetPosX(slotConfig._startX)
  ;
  (self._static_GradationBottom):SetPosY((self._static_ScrollArea):GetSizeY() + (self._static_ScrollArea):GetPosY() - 50)
  ;
  (self._scroll_IngameCash):SetSize((self._scroll_IngameCash):GetSizeX(), remainingSizeY * 0.98)
  ;
  (self._static_ScrollArea):SetSize((self._static_ScrollArea):GetSizeX(), remainingSizeY * 0.98)
  ;
  (self._static_ScrollArea1):SetPosY(0)
  ;
  (self._static_ScrollArea1):SetSize((self._static_ScrollArea1):GetSizeX(), (self._static_ScrollArea):GetPosY())
  ;
  (self._static_ScrollArea2):SetPosY((self._static_ScrollArea):GetPosY() + (self._static_ScrollArea):GetSizeY())
  ;
  (self._static_ScrollArea2):SetSize((self._static_ScrollArea2):GetSizeX(), 1000)
  local cartPosX = Panel_IngameCashShop:GetPosX() + slotConfig._startX
  local cartPosY = Panel_IngameCashShop:GetPosY() + slotConfig._startY
  FGlobal_InitPos_IngameCashShop_NewCart(cartPosX, cartPosY, remainingSizeY, (self._static_TopLineBG):GetSizeY() + ((self._haveCashBoxBG):GetSpanSize()).y)
  ;
  (self._promotionWeb):SetSize((self._promotionWeb):GetSizeX(), self._promotionSizeY)
  ;
  (self._static_GradationTop):SetPosX(slotConfig._startX)
  ;
  (self._static_GradationTop):SetPosY(slotConfig._startY)
  ;
  (self._static_GradationBottom):SetPosX(slotConfig._startX)
  ;
  (self._static_GradationBottom):SetPosY((self._static_ScrollArea):GetSizeY() + (self._static_ScrollArea):GetPosY() - (self._static_GradationBottom):GetSizeY())
  Panel_IngameCashShop:SetChildIndex(self._promotionWeb, 9900)
  _AllBG:SetSize(_AllBG:GetSizeX(), getScreenSizeY() - 95)
  local _btn_SizeX = (self._btn_HowUsePearl):GetSizeX() + 23
  local _btn_TextSizeX = _btn_SizeX - _btn_SizeX / 2 - (self._btn_HowUsePearl):GetTextSizeX() / 2
  ;
  (self._btn_HowUsePearl):SetTextSpan(_btn_TextSizeX, 4)
end

_ingameCashShop_SetViewListCount = function()
  -- function num : 0_90 , upvalues : inGameShop
  local self = inGameShop
  local scrSizeY = getScreenSizeY()
  local areaPosY = (self._static_ScrollArea):GetPosY()
  local banner = (self._static_PromotionBanner):GetPosY() + (self._static_PromotionBanner):GetSizeY()
  local bannerEndGap = (self._static_TopLineBG):GetPosY() - ((self._static_PromotionBanner):GetPosY() + (self._static_PromotionBanner):GetSizeY())
  local filterFize = (self._static_TopLineBG):GetSizeY() + ((self._static_TopLineBG):GetPosY() - ((self._static_PromotionBanner):GetPosY() + (self._static_PromotionBanner):GetSizeY()))
  local endGap = areaPosY - ((self._static_TopLineBG):GetPosY() + (self._static_TopLineBG):GetSizeY())
  local chargeSize = ((self._haveCashBoxBG):GetSpanSize()).y + (self._haveCashBoxBG):GetSizeY()
  local fixedHeight = banner + bannerEndGap + filterFize + endGap + chargeSize
  self._promotionSizeY = scrSizeY - endGap - chargeSize - (self._static_PromotionBanner):GetPosY()
  local gapBetweenList = ((self._config)._slot)._gapY
  local remainingSizeY = scrSizeY - fixedHeight
  local possiableList = (math.floor)(remainingSizeY / gapBetweenList)
  self._slotCount = possiableList + 1
  return remainingSizeY
end

do
  local cumulatedTime = 0
  InGameCashshopUpdatePerFrame = function(deltaTime)
  -- function num : 0_91 , upvalues : disCountSetUse, cumulatedTime
  if disCountSetUse == true then
    cumulatedTime = cumulatedTime + deltaTime
    if cumulatedTime > 1 then
      cumulatedTime = 0
      CashShopUpdateRamainedTimePerSecond()
    end
  end
  InGameCashshopDescUpdate(deltaTime)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  if PaGlobal_Recommend_PopUp._isRequestShow == true then
    if Panel_Window_RecommandGoods_PopUp:GetShow() then
      PaGlobal_Recommend_PopUp._isRequestShow = false
    else
      PaGlobal_Recommend_PopUp:Open()
    end
  end
end

  CashShopUpdateRamainedTimePerSecond = function()
  -- function num : 0_92 , upvalues : inGameShop
  local self = inGameShop
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(self._openProductKeyRaw)
  if cashProduct == nil then
    return 
  end
  local itemCount = cashProduct:getItemListCount()
  for ii = 0, itemCount - 1 do
    local remainTime = cashProduct:getRemainDiscountTime()
    if cashProduct:isApplyDiscount() then
      ((self.desc)._static_DiscountPeriodDesc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_GOODSDETAILINFO_DISCOUNTPERIODDESC", "endDiscountTime", convertStringFromDatetime(remainTime)))
    end
  end
end

  InGameCashshopDescUpdate = function(deltaTime)
  -- function num : 0_93 , upvalues : inGameShop
  local self = inGameShop
  if self._position == self._currentPos and self._maxDescSize == (self._goodDescBG):GetSizeY() and self:getMaxPosition() < self._position + 2 then
    (self._static_GradationBottom):SetShow(false)
  else
    ;
    (self._static_GradationBottom):SetShow(true)
  end
  self._currentPos = self._currentPos + (self._position - self._currentPos) * deltaTime * 15
  if (math.abs)(self._position - self._currentPos) < 1 then
    self._currentPos = self._position
  end
  -- DECOMPILER ERROR at PC66: Unhandled construct in 'MakeBoolean' P1

  if self._isClick == false and self._openProductKeyRaw ~= -1 then
    (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), (self._goodDescBG):GetSizeY() + (self._maxDescSize - (self._goodDescBG):GetSizeY()) * deltaTime * 3)
    if self._maxDescSize - (self._goodDescBG):GetSizeY() < 1 then
      (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), self._maxDescSize)
    end
  end
  if self._isClick then
    if (self._goodDescBG):GetSizeY() > 1.5 then
      (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), (self._goodDescBG):GetSizeY() - (self._goodDescBG):GetSizeY() * deltaTime * 3)
      if self:getMaxPosition() - self._position < ((self._config)._slot)._gapY and (self._scroll_IngameCash):GetShow() then
        self._position = self._position - (self._goodDescBG):GetSizeY() * deltaTime * 3
      end
    else
      ;
      (self._goodDescBG):SetSize((self._goodDescBG):GetSizeX(), 1)
      if self._isSubItemClick then
        InGameShop_subItemEvent(1)
        self._isSubItemClick = false
        for ii = 1, inGameShop._subItemCount do
          if ii == 1 then
            (((inGameShop._subItemButton)[ii]).static):SetCheck(true)
          else
            ;
            (((inGameShop._subItemButton)[ii]).static):SetCheck(false)
          end
        end
      end
    end
    do
      self._currentIndex = nil
      for _,control in pairs(inGameShop.desc) do
        control:SetShow(control:GetPosY() + control:GetSizeY() > 0 and control:GetPosY() + control:GetSizeY() < (self._goodDescBG):GetSizeY())
        IngameCashShop_DescUpdate()
      end
      if inGameShop._listComboIncludeDummyCount > 1 then
        for ii = 1, inGameShop._listComboIncludeDummyCount do
          local sunItem = ((inGameShop._subItemButton)[ii]).static
          sunItem:SetShow(sunItem:GetPosY() + sunItem:GetSizeY() > 0 and sunItem:GetPosY() + sunItem:GetSizeY() < (self._goodDescBG):GetSizeY())
        end
      end
      do
        local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(inGameShop._openProductKeyRaw)
        if cashProduct ~= nil and cashProduct:isChooseCash() then
          local validChooseCashProduct = cashProduct:chooseCashCount()
          for ii = 0, validChooseCashProduct - 1 do
            local chooseProduct = (inGameShop._chooseProductList)[ii]
            ;
            (chooseProduct.staticBG):SetShow((chooseProduct.staticBG):GetPosY() + (chooseProduct.staticBG):GetSizeY() > 0 and (chooseProduct.staticBG):GetPosY() + (chooseProduct.staticBG):GetSizeY() < (self._goodDescBG):GetSizeY())
            ;
            (chooseProduct.staticAddPlusBtn):SetShow((chooseProduct.staticAddPlusBtn):GetPosY() + (chooseProduct.staticAddPlusBtn):GetSizeY() > 0 and (chooseProduct.staticAddPlusBtn):GetPosY() + (chooseProduct.staticAddPlusBtn):GetSizeY() < (self._goodDescBG):GetSizeY())
            ;
            (chooseProduct.staticAddMinusBtn):SetShow((chooseProduct.staticAddMinusBtn):GetPosY() + (chooseProduct.staticAddMinusBtn):GetSizeY() > 0 and (chooseProduct.staticAddMinusBtn):GetPosY() + (chooseProduct.staticAddMinusBtn):GetSizeY() < (self._goodDescBG):GetSizeY())
            ;
            (chooseProduct.staticEditCount):SetShow((chooseProduct.staticEditCount):GetPosY() + (chooseProduct.staticEditCount):GetSizeY() > 0 and (chooseProduct.staticEditCount):GetPosY() + (chooseProduct.staticEditCount):GetSizeY() < (self._goodDescBG):GetSizeY())
          end
        end
        IngameCashShop_DescUpdate()
        self:updateSlot()
        -- DECOMPILER ERROR: 14 unprocessed JMP targets
      end
    end
  end
end

  InGameShop_Open = function()
  -- function num : 0_94 , upvalues : isNaver, renderMode, inGameShop, UI_SERVICE_RESOURCE, isTaiwanNation, _AllBG, isFirstRespone, tabIndexList
  if Panel_IngameCashShop_EasyPayment:IsShow() then
    Panel_IngameCashShop_EasyPayment:SetShow(false, false)
  end
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPOPENALERT_INDEAD"))
    return 
  end
  if ToClient_getJoinGuildBattle() == true then
    return 
  end
  if ToClient_getJoinGuildBattle() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CASHSHOPOPENALERT_INDEAD"))
    return 
  end
  ToClient_SaveUiInfo(false)
  if isFlushedUI() then
    return 
  end
  if ToClient_IsConferenceMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_NOTUSE"))
    return 
  end
  FGlobal_WebHelper_ForceClose()
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
  if not (getIngameCashMall()):show() then
    return 
  end
  if Panel_IngameCashShop_Coupon:GetShow() then
    IngameCashShopCoupon_Close(false)
  end
  if Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  audioPostEvent_SystemUi(1, 39)
  if not isNaver then
    cashShop_requestCash()
  end
  cashShop_requestCashShopList()
  PaymentPassword_Close()
  SetUIMode((Defines.UIMode).eUIMode_InGameCashShop)
  renderMode:set()
  FGlobal_CashShop_SetEquip_CouponEffectCheck()
  ;
  (getIngameCashMall()):clearEquipViewList()
  ;
  (getIngameCashMall()):changeViewMyCharacter()
  local self = inGameShop
  _ingameCashShop_SetViewListCount()
  cashShop_Controller_Open()
  FGlobal_CashShop_SetEquip_Open()
  for ii = 1, self._tabCount do
    (((self._tabs)[ii]).static):SetCheck(false)
  end
  FGlobal_HideWorkerTooltip()
  TooltipSimple_Hide()
  self._openFunction = true
  ;
  (self._static_Construction):ComputePos()
  ;
  (self._static_Construction):SetShow(false)
  Panel_IngameCashShop:SetShow(true)
  InventoryWindow_Close()
  Panel_Tooltip_Item_hideTooltip()
  Panel_Tooltip_Item_chattingLinkedItemClick_hideTooltip()
  InGameShopBuy_Close()
  ;
  ((self._promotionTab).static):SetCheck(true)
  ;
  (self._scroll_IngameCash):SetShow(false)
  local scrSizeY = getScreenSizeY()
  local SALangType = "pt"
  if UI_SERVICE_RESOURCE.eServiceResourceType_ES == getGameServiceResType() then
    SALangType = "es"
  else
    if UI_SERVICE_RESOURCE.eServiceResourceType_PT == getGameServiceResType() then
      SALangType = "pt"
    end
  end
  local categoryUrl = ""
  local promotionUrl = ""
  if isServerFixedCharge() then
    promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_P2P")
    categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_P2P")
  else
    if isGameTypeKorea() then
      promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL")
      categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL")
    else
      if isGameTypeTaiwan() then
        if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
          promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TW_ALPHA")
          categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TW_ALPHA")
        else
          if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
            promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TW")
            categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TW")
          end
        end
      else
        if isGameTypeKR2() then
          promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_KR2")
          categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_KR2")
        else
          if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
            promotionUrl = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_SA_ALPHA", "lang", SALangType)
            categoryUrl = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_SA_ALPHA", "lang", SALangType)
          else
            if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
              promotionUrl = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_SA", "lang", SALangType)
              categoryUrl = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_SA", "lang", SALangType)
            else
              if (CppEnums.CountryType).TR_ALPHA == getGameServiceType() then
                promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TR_ALPHA")
                categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TR_ALPHA")
              else
                if (CppEnums.CountryType).TR_REAL == getGameServiceType() then
                  promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TR")
                  categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TR")
                else
                  if (CppEnums.CountryType).TH_ALPHA == getGameServiceType() then
                    promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TH_ALPHA")
                    categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TH_ALPHA")
                  else
                    if (CppEnums.CountryType).TH_REAL == getGameServiceType() then
                      promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TH")
                      categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_TH")
                    else
                      if (CppEnums.CountryType).ID_ALPHA == getGameServiceType() then
                        promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_ID_ALPHA")
                        categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_ID_ALPHA")
                      else
                        if (CppEnums.CountryType).ID_REAL == getGameServiceType() then
                          promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_ID")
                          categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL_ID")
                        else
                          promotionUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL")
                          categoryUrl = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_CATEGORYURL")
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  FGlobal_SetCandidate()
  ;
  (self._categoryWeb):SetUrl((self._categoryWeb):GetSizeX(), (self._categoryWeb):GetSizeY(), categoryUrl, false, isTaiwanNation)
  ;
  (self._categoryWeb):SetShow(false)
  ;
  (self._categoryWeb):SetIME()
  ;
  (self._promotionWeb):SetUrl((self._promotionWeb):GetSizeX(), self._promotionSizeY, promotionUrl, false, isTaiwanNation)
  _AllBG:SetSize(_AllBG:GetSizeX(), self._promotionSizeY)
  ;
  (self._promotionWeb):SetIME()
  InGameShop_Promotion_Open()
  FGlobal_SpecialMoveSettingCheck()
  FGlobal_BuffTooltipOff()
  self._ViewingRecommend = false
  PaGlobal_RecommendGoods:Close()
  PaGlobal_Recommend_PopUp:Close()
  if isFirstRespone == true then
    for ii = 1, self._tabCount do
      (getIngameCashMall()):setCurrentCategory((tabIndexList[ii])[2])
      local subCategoryCount = getCashMiddleCategorySize((tabIndexList[ii])[2])
      for jj = 1, subCategoryCount do
        (getIngameCashMall()):setSearchText("")
        ;
        (getIngameCashMall()):setCurrentClass(-1)
        ;
        (getIngameCashMall()):setCurrentSort(-1)
        ;
        (getIngameCashMall()):setCurrentSubFilter(-1)
        ;
        (getIngameCashMall()):setCurrentSubTab(jj)
        ;
        (getIngameCashMall()):setCashProductNoRawFilterList()
        -- DECOMPILER ERROR at PC606: Confused about usage of register: R14 in 'UnsetPending'

        if (getIngameCashMall()):getCashProductFilterListCount() <= 0 then
          (((self._tabs)[ii])._subTab)[jj] = nil
        end
      end
    end
    isFirstRespone = false
  end
end

  FGlobal_CheckPromotionTab = function()
  -- function num : 0_95 , upvalues : inGameShop
  local self = inGameShop
  ;
  ((self._promotionTab).static):SetCheck(true)
end

  InGameShop_Close = function()
  -- function num : 0_96 , upvalues : inGameShop, renderMode, _AllBG
  local self = inGameShop
  if getIngameCashMall() ~= nil then
    (getIngameCashMall()):clearEquipViewList()
    ;
    (getIngameCashMall()):changeViewMyCharacter()
    ;
    (getIngameCashMall()):hide()
  end
  if not Panel_IngameCashShop:GetShow() and not Panel_IngameCashShop_BuyOrGift:GetShow() and not Panel_IngameCashShop_NewCart:GetShow() and not Panel_IngameCashShop_GoodsDetailInfo:GetShow() and not Panel_IngameCashShop_Password:GetShow() and not Panel_IngameCashShop_SetEquip:GetShow() and not Panel_IngameCashShop_Controller:GetShow() then
    return 
  end
  FGlobal_CashShop_SetEquip_Close()
  cashShop_Controller_Close()
  SetUIMode((Defines.UIMode).eUIMode_Default)
  renderMode:reset()
  if Panel_QnAWebLink:GetShow() then
    FGlobal_QnAWebLink_Close()
  end
  if Panel_Window_Inventory:GetShow() then
    InventoryWindow_Close()
    Inventory_SetFunctor(nil, nil, nil, nil)
    if not _ContentsGroup_RenewUI and Panel_Equipment:GetShow() then
      EquipmentWindow_Close()
    end
  end
  Panel_Tooltip_Item_hideTooltip()
  Panel_Tooltip_Item_chattingLinkedItemClick_hideTooltip()
  if Panel_IngameCashShop_Coupon:GetShow() then
    IngameCashShopCoupon_Close()
  end
  if Panel_IngameCashShop_EventCart:GetShow() then
    IngameCashShopEventCart_Close()
  end
  if Panel_Window_RecommandGoods_PopUp:GetShow() then
    Panel_Window_RecommandGoods_PopUp:Close()
  end
  if Panel_ChangeWeapon:GetShow() then
    WeaponChange_Close()
  end
  if Panel_IngameCashShop_NewCart:GetShow() then
    FGlobal_Close_IngameCashShop_NewCart()
  end
  FGlobal_RightBottomIconReposition()
  ;
  (self._promotionWeb):ResetUrl()
  ;
  (self._promotionWeb):SetShow(false)
  ;
  (self._categoryWeb):ResetUrl()
  ;
  (self._categoryWeb):SetShow(false)
  self._openProductKeyRaw = -1
  ;
  (self._goodDescBG):SetShow(false)
  _AllBG:SetShow(true)
  self._openFunction = false
  self._openByEventAlarm = false
  ClearFocusEdit()
  Panel_IngameCashShop:SetShow(false)
  FGlobal_ClearCandidate()
  FGlobal_CashShop_GoodsTooltipInfo_Close()
  Panel_IngameCashShop_HowUsePearlShop_Close()
  reloadGameUI()
end

  InGameShop_UpdateCartButton = function()
  -- function num : 0_97 , upvalues : inGameShop
  local cartListCount = (getIngameCashMall()):getCartListCount()
  ;
  ((inGameShop._myCartTab).static):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_UPDATECART", "cartListCount", cartListCount))
end

  ToClient_RequestShowProduct = function(productNo, price, bValue)
  -- function num : 0_98 , upvalues : inGameShop, tabIndexList
  local self = inGameShop
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNo)
  if cashProduct ~= nil then
    local isAdultPeople = ToClient_isAdultUser()
    local isAdultProduct = cashProduct:isAdultProduct()
    if not isAdultPeople and isAdultProduct then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_TEENWORLD_DONTBUY"))
      return 
    end
    local category = cashProduct:getMainCategory()
    local tabIndex = 0
    for ii = 1, self._tabCount do
      if category == (tabIndexList[ii])[2] then
        tabIndex = ii
      end
    end
    if tabIndex == 0 then
      return 
    end
    self:RadioReset()
    ;
    (((self._tabs)[tabIndex]).static):SetCheck(true)
    InGameShop_TabEvent(tabIndex)
    ;
    (self._promotionWeb):SetShow(false)
    ;
    (self._combo_Class):SetSelectItemIndex(0)
    ;
    (getIngameCashMall()):setCurrentClass(-1)
    InGameShop_SelectClass()
    self:RadioReset()
    if (self._tabs)[tabIndex] ~= nil then
      (((self._tabs)[tabIndex]).static):SetCheck(true)
    end
    -- DECOMPILER ERROR at PC80: Confused about usage of register: R9 in 'UnsetPending'

    inGameShop._cashProductNoData = productNo
    IngameCashShop_SelectedItemXXX(productNo, true, bValue)
    ;
    (((inGameShop._subItemButton)[1]).static):SetCheck(false)
    ;
    (((inGameShop._subItemButton)[inGameShop._cashProductIndex]).static):SetCheck(true)
    InGameShop_subItemEvent(inGameShop._cashProductIndex)
  end
end

  ToClient_CategoryWebFocusOut = function()
  -- function num : 0_99 , upvalues : inGameShop
  local self = inGameShop
  ;
  (self._categoryWeb):FocusOut()
end

  InGameShop_HowUsePearlShop = function()
  -- function num : 0_100
  Panel_IngameCashShop_HowUsePearlShop_Open()
end

  FGlobal_CheckEditBox_IngameCashShop = function(uiEditBox)
  -- function num : 0_101 , upvalues : inGameShop
  do
    local self = inGameShop
    do return (uiEditBox ~= nil and self._edit_Search ~= nil and uiEditBox:GetKey() == (self._edit_Search):GetKey() and Panel_IngameCashShop:GetShow()) end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

  FGlobal_EscapeEditBox_IngameCashShop = function()
  -- function num : 0_102 , upvalues : inGameShop
  local self = inGameShop
  ClearFocusEdit(self._edit_Search)
end

  InGameShop_MoneyIcon_Tooltip = function(isShow, tipType)
  -- function num : 0_103 , upvalues : inGameShop
  local self = inGameShop
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_PEARL_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_PEARL_DESC")
    control = self._nowPearlIcon
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_MILEAGE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_MILEAGE_DESC")
      control = self._mileage
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_DAUMCASH_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_DAUMCASH_DESC")
        if isGameTypeTR() then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_DAUMCASH_NAME_TR")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_DAUMCASH_DESC_TR")
        else
          if isGameTypeTH() then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_DAUMCASH_NAME_TH")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_DAUMCASH_DESC_TH")
          else
            if isGameTypeID() then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_DAUMCASH_NAME_ID")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMESHOP_MONEYICON_TOOLTIP_DAUMCASH_DESC_ID")
            end
          end
        end
        control = self._nowCash
      end
    end
  end
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

  InGameShop_SubTab_Tooltip = function(isShow, ii, jj)
  -- function num : 0_104 , upvalues : inGameShop, tabIndexList
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local self = inGameShop
  local name, desc, control = nil, nil, nil
  name = getCashCategoryName((tabIndexList[ii])[2], jj)
  control = ((((self._tabs)[ii])._subTab)[jj]).text
  TooltipSimple_Show(control, name, desc)
end

  inGameShop:init()
  InGameShop_GameTypeCheck()
  IngameCashShop_Descinit()
  inGameShop:registEventHandler()
  inGameShop:registMessageHandler()
  inGameShop:initTabPos()
  renderMode:setClosefunctor(renderMode, InGameShop_Close)
  FromClient_ShowRecommendProductByComplete = function()
  -- function num : 0_105
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Recommend_PopUp._isRequestShow = true
end

  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

