-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarketnew.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local ItemClassify = CppEnums.ItemClassifyType
local ItemClassifyName = CppEnums.ItemClassifyTypeName
local ItemMainCategory = CppEnums.ItemMarketMainCategoryType
local ItemMainCategoryName = CppEnums.ItemMarketMainCategoryTypeName
local IM = CppEnums.EProcessorInputMode
local registMarket = true
local specialStockTic = ToClient_GetSpecialStockTic()
local specialStockRate = ToClient_GetSpecialStockRate()
local isPreBidOpen = ToClient_IsContentsGroupOpen("88")
local isWakenWeaponOpen = ToClient_IsContentsGroupOpen("901")
local isAlchemyStoneOpen = ToClient_IsContentsGroupOpen("35")
Panel_Window_ItemMarket:setGlassBackground(true)
Panel_Window_ItemMarket:ActiveMouseEventEffect(true)
Panel_Window_ItemMarket:SetShow(false)
local splitWindow = ToClient_IsContentsGroupOpen("240")
local shopType = {eShopType_Potion = 1, eShopType_Weapon = 2, eShopType_Jewel = 3, eShopType_Furniture = 4, eShopType_Collect = 5, eShopType_Cook = 9, eShopType_PC = 10}
local ItemMarket = {panelTitle = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_Title"), panelBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_BG"), btn_Close = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_Win_Close"), checkPopUp = (UI.getChildControl)(Panel_Window_ItemMarket, "CheckButton_PopUp"), btn_MyList = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_MyList"), btn_BackPage = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_BackPage"), btn_SetAlarm = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SetAlarm"), btn_SetPreBid = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SetPreBid"), btn_Refresh = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_Refresh"), btn_RegistItem = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_RegistItem"), btn_BidDesc = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_BidDesc"), btn_InMarketRegist = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_InMarketRegist"), selectCategory = 0, selectItemSort = 0, static_ListHeadBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_ListHeadSmallBG"), specialListHeadBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_SpecialListHeadBG"), 
selectSingleSlot = {}
, txt_SpecialGoodsName = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_SpecialGoods_Name"), txt_SpecialGoodsDesc = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_SpecialGoods_Desc"), txt_ItemNameBackPage = "", txt_SpecialItemNameBackPage = "", static_FilterBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_FilterBG"), static_ItemListBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_ItemListBG"), invenMoney = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_Text_Money"), invenMoneyTit = (UI.getChildControl)(Panel_Window_ItemMarket, "RadioButton_Icon_Money"), warehouseMoney = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_Text_Money2"), warehouseMoneyTit = (UI.getChildControl)(Panel_Window_ItemMarket, "RadioButton_Icon_Money2"), invenDesc = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_Inven"), warehouseDesc = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_Warehouse"), iconTooltip = nil, _list2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket"), _list2_Inside = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Inside"), _list2_SpecialList = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_SpecialList"), _list2_SpecialList_Inside = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_SpecialList_Inside"), _btn_CategoryAll = (UI.getChildControl)(Panel_Window_ItemMarket, "RadioButton_MainCategoryAll"), selectedListHeadBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_SelectedListHeadBG"), noSearchResult = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_NoSearchResult"), nowScrollPos = 0, scrollInverVal = 0, curItemClassify = 1, curFilterIndex = -1, curClassType = -1, curServantType = -1, 
categoryUiPool = {}
, 
filterUiPool = {}
, itemList_MaxCount = 7, 
itemGroupUiPool = {}
, 
itemSingleUiPool = {}
, isGrouplist = true, isSpecialCategory = false, isSpecialInside = false, savedListUpdate_idx = nil, sellInfoItemEnchantKeyRaw = 0, curSummaryItemIndex = 0, curTerritoryKeyRaw = 0, specialItemEnchantKeyRaw = 0, curSpecialItemIndex = 0, isWorldMapOpen = false, itemmarketClassCount = 10, isSort_ItemName = true, isSort_RecentPrice = true, isSort_RegistItemCount = true, isSort_AverageTradePrice = true, isSort_RecentRegistDate = true, isChangeSort = false, curSortTarget = -1, curSortValue = false, isSearch = false, buyItemKeyraw = 0, buyItemSlotidx = 0, 
slotGroupConfing = {createIcon = true, createBorder = true, createCount = false, createEnchant = true, createCash = true, createClassEquipBG = true}
, 
slotSingleConfing = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createClassEquipBG = true}
, _buttonQuestion = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_Question"), escMenuSaveValue = false, isSelectItem = false}
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
if splitWindow then
  (ItemMarket.checkPopUp):SetShow(isPopUpContentsEnable)
else
  ;
  (ItemMarket.checkPopUp):SetShow(false)
end
local textAddSize = 20
ItemMarket.edit_ItemName = (UI.getChildControl)(ItemMarket.static_ListHeadBG, "Edit_ItemName")
ItemMarket.btn_Search = (UI.getChildControl)(ItemMarket.static_ListHeadBG, "Button_Search")
ItemMarket.edit_SpecialItemName = (UI.getChildControl)(ItemMarket.specialListHeadBG, "Edit_ItemName")
ItemMarket.btn_SpecialSearch = (UI.getChildControl)(ItemMarket.specialListHeadBG, "Button_Search")
ItemMarket.btn_Sort_AverageTradePrice = (UI.getChildControl)(ItemMarket.static_ListHeadBG, "Button_SortAverageTradePrice")
ItemMarket.btn_Sort_RecentRegistDate = (UI.getChildControl)(ItemMarket.static_ListHeadBG, "Button_SortRecentRegistDate")
ItemMarket.btn_FavoriteOnOff = (UI.getChildControl)(ItemMarket.static_ListHeadBG, "Button_FavoriteOnOff")
;
(ItemMarket.btn_Sort_AverageTradePrice):setNotImpactScrollEvent(true)
;
(ItemMarket.btn_Sort_RecentRegistDate):setNotImpactScrollEvent(true)
ItemMarket.combobox_Filter_Sort1 = (UI.getChildControl)(ItemMarket.static_ListHeadBG, "Combobox_Sort1")
;
(ItemMarket.combobox_Filter_Sort1):addInputEvent("Mouse_LUp", "Itemmarket_Sort_ShowComboBox()")
;
((ItemMarket.combobox_Filter_Sort1):GetListControl()):addInputEvent("Mouse_LUp", "Itemmarket_Sort_SetSort()")
Panel_Window_ItemMarket:SetChildIndex(ItemMarket.static_ListHeadBG, 9999)
;
(ItemMarket.static_ListHeadBG):SetChildIndex(ItemMarket.combobox_Filter_Sort1, 9999)
ItemMarket.Selected_ItemName = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_ItemName")
ItemMarket.Selected_ItemSlotBG = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_Static_SlotBG")
ItemMarket.Selected_ItemSlot = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_Static_Slot")
ItemMarket.Selected_HighPrice = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_RegistHighPrice_Title")
ItemMarket.Selected_LowPrice = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_RegistLowPrice_Title")
ItemMarket.Selected_AveragePrice_Title = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_AveragePrice_Title")
ItemMarket.Selected_AveragePrice_Value = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_AveragePrice_Value")
ItemMarket.Selected_RecentPrice_Title = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_RecentPrice_Title")
ItemMarket.Selected_RecentPrice_Value = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_RecentPrice_Value")
ItemMarket.Selected_RegistListCount_Title = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_RegistListCount_Title")
ItemMarket.Selected_RegistListCount_Value = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_RegistListCount_Value")
ItemMarket.Selected_RegistItemCount_Title = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_RegistItemCount_Title")
ItemMarket.Selected_RegistItemCount_Value = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_RegistItemCount_Value")
ItemMarket.Selected_dash = (UI.getChildControl)(ItemMarket.selectedListHeadBG, "Selected_StaticText_dash")
;
(ItemMarket.txt_SpecialGoodsDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(ItemMarket.txt_SpecialGoodsDesc):SetText((ItemMarket.txt_SpecialGoodsDesc):GetText())
;
(ItemMarket.Selected_ItemName):SetTextMode(UI_TM.eTextMode_LimitText)
local TemplateItemMarket = {iconTooltip = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_1")}
local itemMarketBidDesc = {_btn_Close = (UI.getChildControl)(Panel_ItemMarket_BidDesc, "Button_Close"), _btn_Exit = (UI.getChildControl)(Panel_ItemMarket_BidDesc, "Button_Exit"), _DescMainBG = (UI.getChildControl)(Panel_ItemMarket_BidDesc, "Static_AllBG"), _txt_Desc = (UI.getChildControl)(Panel_ItemMarket_BidDesc, "StaticText_Desc")}
local _categoryTexture = {
{
[0] = {226, 162, 244, 180}
}
, 
{
[0] = {226, 267, 244, 285}
}
, 
{
[0] = {247, 162, 265, 180}
}
, 
{
[0] = {268, 162, 286, 180}
}
, 
{
[0] = {247, 267, 265, 285}
}
, 
{
[0] = {204, 183, 222, 201}
}
, 
{
[0] = {247, 183, 265, 201}
}
, 
{
[0] = {247, 288, 265, 306}
}
, 
{
[0] = {226, 288, 244, 306}
}
, 
{
[0] = {226, 183, 244, 201}
}
, 
{
[0] = {204, 204, 222, 222}
}
, 
{
[0] = {247, 246, 265, 264}
}
, 
{
[0] = {268, 204, 286, 222}
}
, 
{
[0] = {204, 288, 222, 306}
}
, 
{
[0] = {268, 267, 286, 285}
}
, 
{
[0] = {247, 204, 265, 222}
}
; 
[0] = {
[0] = {204, 162, 222, 180}
}
, 
[999] = {
[0] = {204, 267, 222, 285}
}
}
local _sortTexture = {
{
{
{1, 35, 55, 67}
, 
{1, 1, 55, 33}
; 
[0] = {1, 1, 55, 33}
}
; 
[0] = {
{57, 35, 111, 67}
, 
{57, 1, 111, 33}
; 
[0] = {57, 1, 111, 33}
}
}
, 
{
{
{113, 35, 167, 67}
, 
{113, 1, 167, 33}
; 
[0] = {113, 1, 167, 33}
}
; 
[0] = {
{169, 35, 223, 67}
, 
{169, 1, 223, 33}
; 
[0] = {169, 1, 223, 33}
}
}
, 
{
{
{1, 103, 55, 135}
, 
{1, 69, 55, 101}
; 
[0] = {1, 69, 55, 101}
}
; 
[0] = {
{57, 103, 111, 135}
, 
{57, 69, 111, 101}
; 
[0] = {57, 69, 111, 101}
}
}
, 
{
{
{113, 103, 167, 135}
, 
{113, 69, 167, 101}
; 
[0] = {113, 69, 167, 101}
}
; 
[0] = {
{169, 103, 223, 135}
, 
{169, 69, 223, 101}
; 
[0] = {169, 69, 223, 101}
}
}
; 
[0] = {
{
{1, 171, 55, 203}
, 
{1, 137, 55, 169}
; 
[0] = {1, 137, 55, 169}
}
; 
[0] = {
{57, 171, 111, 203}
, 
{57, 137, 111, 169}
; 
[0] = {57, 137, 111, 169}
}
}
}
local territoryKey = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")), [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")), [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")), [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6"))}
ItemMarketShowAni = function()
  -- function num : 0_0
  Panel_Window_ItemMarket:SetAlpha(0)
  Panel_Window_ItemMarket:ResetVertexAni()
  ;
  (UIAni.AlphaAnimation)(1, Panel_Window_ItemMarket, 0, 0.3)
end

ItemMarketHideAni = function()
  -- function num : 0_1
  Panel_Window_ItemMarket:ResetVertexAni()
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_Window_ItemMarket, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

local tree2IndexMap = {}
ItemMarket.Initialize = function(self)
  -- function num : 0_2 , upvalues : ItemMarket, specialStockTic, specialStockRate, UI_PUCT, TemplateItemMarket, UI_color, UI_TM, tree2IndexMap
  local minSize = float2()
  minSize.x = 100
  minSize.y = 50
  ;
  (self.panelBG):setGlassBackground(true)
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.edit_SpecialItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (ItemMarket.txt_SpecialGoodsDesc):SetShow(false)
  ;
  (ItemMarket.txt_SpecialGoodsDesc):SetText(PAGetStringParam2(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_SPECIALPRODUCT_DESC", "ticktime", tostring(specialStockTic), "descpercent", tostring(specialStockRate)))
  local createSingleSlot = {}
  ;
  (SlotItem.new)(createSingleSlot, "ItemMarket_ItemSingleSlotItem", 0, self.Selected_ItemSlot, self.slotGroupConfing)
  createSingleSlot:createChild()
  self.selectSingleSlot = createSingleSlot
  local isAblePearlProduct = requestCanRegisterPearlItemOnMarket()
  local iconTooltips = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_Window_ItemMarket, "ItemMarket_PriceTitleToolTip")
  CopyBaseProperty(TemplateItemMarket.iconTooltip, iconTooltips)
  iconTooltips:SetColor(UI_color.C_FFFFFFFF)
  iconTooltips:SetAlpha(1)
  iconTooltips:SetFontColor(UI_color.C_FFC4BEBE)
  iconTooltips:SetAutoResize(true)
  iconTooltips:SetSize(120, iconTooltips:GetSizeY())
  iconTooltips:SetTextMode(UI_TM.eTextMode_AutoWrap)
  iconTooltips:SetTextHorizonCenter()
  iconTooltips:SetShow(false)
  ;
  (self.combobox_Filter_Sort1):DeleteAllItem()
  ;
  (self.combobox_Filter_Sort1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_NONE"))
  ;
  (self._btn_CategoryAll):SetCheck(true)
  local list2Control = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket")
  local list2Content = (UI.getChildControl)(list2Control, "List2_1_Content")
  local createSlot = {}
  local createSelectedSlot = {}
  list2Control:setMinScrollBtnSize(minSize)
  local itemlistBG = (UI.getChildControl)(list2Content, "Template_Button_ItemList")
  itemlistBG:SetShow(false)
  local itemlist_SlotBG = (UI.getChildControl)(list2Content, "Template_Static_SlotBG")
  itemlist_SlotBG:SetPosX(10)
  itemlist_SlotBG:SetPosY(8)
  itemlist_SlotBG:SetShow(true)
  local itemlist_Slot = (UI.getChildControl)(list2Content, "Template_Static_Slot")
  ;
  (SlotItem.new)(createSlot, "ItemMarket_ItemGroupListSlotItem", 0, itemlist_Slot, self.slotGroupConfing)
  createSlot:createChild()
  ;
  (createSlot.icon):SetPosX(4)
  ;
  (createSlot.icon):SetPosY(1)
  local itemlist_ItemName = (UI.getChildControl)(list2Content, "Template_StaticText_ItemName")
  itemlist_ItemName:SetTextMode(UI_TM.eTextMode_AutoWrap)
  itemlist_ItemName:SetShow(true)
  local itemlist_AveragePrice_Title = (UI.getChildControl)(list2Content, "Template_StaticText_AveragePrice_Title")
  itemlist_AveragePrice_Title:SetShow(true)
  itemlist_AveragePrice_Title:SetEnableArea(0, 0, 100, itemlist_AveragePrice_Title:GetSizeY())
  local itemlist_AveragePrice_Value = (UI.getChildControl)(list2Content, "Template_StaticText_AveragePrice_Value")
  itemlist_AveragePrice_Value:SetShow(true)
  local list2Control_Inside = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Inside")
  local list2Content_Inside = (UI.getChildControl)(list2Control_Inside, "List2_1_Content")
  list2Control_Inside:SetShow(false)
  local itemSelectedlist_Slot = (UI.getChildControl)(list2Content_Inside, "Template_Static_Slot")
  ;
  (SlotItem.new)(createSelectedSlot, "ItemMarket_ItemSelectedListSlotItem", 0, itemSelectedlist_Slot, self.slotSingleConfing)
  createSelectedSlot:createChild()
  ;
  (createSelectedSlot.icon):SetPosX(5)
  ;
  (createSelectedSlot.icon):SetPosY(5)
  self.iconTooltip = iconTooltips
  ;
  (self._list2):changeAnimationSpeed(10)
  ;
  (self._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Itemmarket_ListUpdate")
  ;
  (self._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self._list2_Inside):changeAnimationSpeed(10)
  ;
  (self._list2_Inside):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Itemmarket_ListUpdate_Inside")
  ;
  (self._list2_Inside):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  local list2SpecialControl = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_SpecialList")
  local list2SpecialContent = (UI.getChildControl)(list2SpecialControl, "List2_1_Content")
  local createSpecialSlot = {}
  list2SpecialControl:setMinScrollBtnSize(minSize)
  local specialItemlist_Slot = (UI.getChildControl)(list2SpecialContent, "Template_Static_Slot")
  ;
  (SlotItem.new)(createSpecialSlot, "ItemMarket_ItemSpecialGroupListSlotItem", 0, specialItemlist_Slot, self.slotGroupConfing)
  createSpecialSlot:createChild()
  ;
  (createSpecialSlot.icon):SetPosX(5)
  ;
  (createSpecialSlot.icon):SetPosY(5)
  ;
  (self._list2_SpecialList):changeAnimationSpeed(10)
  ;
  (self._list2_SpecialList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Itemmarket_SpecialListUpdate")
  ;
  (self._list2_SpecialList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  local list2SpecialInsideControl = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_SpecialList_Inside")
  local list2SpecialInsideContent = (UI.getChildControl)(list2SpecialInsideControl, "List2_1_Content")
  list2SpecialInsideControl:setMinScrollBtnSize(minSize)
  local createSpecialListSlot = {}
  local specialItemInsidelist_Slot = (UI.getChildControl)(list2SpecialInsideContent, "Template_Static_Slot")
  ;
  (SlotItem.new)(createSpecialListSlot, "ItemMarket_ItemSpecialListSlotItem", 0, specialItemInsidelist_Slot, self.slotGroupConfing)
  createSpecialListSlot:createChild()
  ;
  (createSpecialListSlot.icon):SetPosX(5)
  ;
  (createSpecialListSlot.icon):SetPosY(5)
  ;
  (self._list2_SpecialList_Inside):changeAnimationSpeed(10)
  ;
  (self._list2_SpecialList_Inside):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Itemmarket_SpecialListUpdate_Inside")
  ;
  (self._list2_SpecialList_Inside):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.static_ItemListBG):SetPosY(115)
  ;
  (self.selectedListHeadBG):addInputEvent("Mouse_RUp", "HandleClicked_ItemMarket_UnSetGroupItem()")
  local tree2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Category")
  tree2:changeAnimationSpeed(11)
  tree2:registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Itemmarket_CategoryUpdate")
  tree2:createChildContent((CppEnums.PAUIList2ElementManagerType).tree)
  ;
  (tree2:getElementManager()):clearKey()
  local mainElement = (tree2:getElementManager()):getMainElement()
  local UIMarketCategoryListCount = ToClient_GetItemMarketCategoryListCount()
  local keyIndex = 0
  local isAblePearlProduct = requestCanRegisterPearlItemOnMarket()
  for i = 0, UIMarketCategoryListCount - 1 do
    local UIMarektCategoryInfo = ToClient_GetItemMarketCategoryAt(i)
    -- DECOMPILER ERROR at PC443: Confused about usage of register: R36 in 'UnsetPending'

    tree2IndexMap[keyIndex] = {_isMain = true, _index = i}
    local treeElement = mainElement:createChild(toInt64(0, keyIndex))
    treeElement:setIsOpen(false)
    keyIndex = keyIndex + 1
    local SubCategoryListCount = UIMarektCategoryInfo:getSubCategoryListCount()
    for j = 0, SubCategoryListCount - 1 do
      -- DECOMPILER ERROR at PC465: Confused about usage of register: R42 in 'UnsetPending'

      tree2IndexMap[keyIndex] = {_isMain = false, _index = i, _subIndex = j}
      local subTreeElement = treeElement:createChild(toInt64(0, keyIndex))
      keyIndex = keyIndex + 1
    end
  end
  mainElement:createChild(toInt64(0, 999))
  -- DECOMPILER ERROR at PC485: Confused about usage of register: R31 in 'UnsetPending'

  tree2IndexMap[999] = {_isMain = true, _index = 999}
  ;
  (tree2:getElementManager()):refillKeyList()
  ;
  (self._btn_CategoryAll):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_AllCategory()")
  ;
  (self.btn_BidDesc):SetSize(135, 32)
  ;
  (self.btn_BidDesc):SetPosX(830)
  ;
  (self.btn_BidDesc):SetPosY(635)
  ;
  (self.btn_BidDesc):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_BidDesc_Open()")
  ;
  (self.btn_InMarketRegist):SetSize(135, 32)
  ;
  (self.btn_InMarketRegist):SetPosX(840)
  ;
  (self.btn_InMarketRegist):SetPosY(635)
  ;
  (self.btn_InMarketRegist):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketRegistItem_Open()")
  ;
  (self.btn_FavoriteOnOff):SetCheck(true)
  ;
  (self.btn_FavoriteOnOff):addInputEvent("Mouse_On", "ItemMarket_FavoriteItemTooltip(true)")
  ;
  (self.btn_FavoriteOnOff):addInputEvent("Mouse_Out", "ItemMarket_FavoriteItemTooltip(false)")
end

local selectedKey = -1
local selectedSubKey = -1
HandleClicked_ItemMarket_AllCategory = function()
  -- function num : 0_3 , upvalues : ItemMarket, selectedKey, selectedSubKey, tree2IndexMap
  local self = ItemMarket
  ;
  (self.combobox_Filter_Sort1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_NONE"))
  self.txt_ItemNameBackPage = ""
  self.txt_SpecialItemNameBackPage = ""
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.edit_SpecialItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  self.isGrouplist = true
  self.isSpecialCategory = false
  self.isSpecialInside = false
  ;
  (self.static_ListHeadBG):SetShow(true)
  ;
  (self.specialListHeadBG):SetShow(false)
  ;
  (self.selectedListHeadBG):SetShow(false)
  ;
  (self._list2):SetShow(true)
  ;
  (self._list2_Inside):SetShow(false)
  ;
  (self._list2_SpecialList):SetShow(false)
  ;
  (self._list2_SpecialList_Inside):SetShow(false)
  selectedKey = -1
  selectedSubKey = -1
  selectMarketCategory(0, -1)
  ItemMarket:Update()
  local tree2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Category")
  for key,value in pairs(tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  tree2:moveTopIndex()
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
end

HandleClicked_ItemMarket_MainCategory = function(index)
  -- function num : 0_4 , upvalues : ItemMarket, tree2IndexMap, selectedSubKey, selectedKey
  local self = ItemMarket
  local tree2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Category")
  for key,value in pairs(tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  selectedSubKey = -1
  if selectedKey ~= index then
    selectedKey = index
    ;
    (tree2:getElementManager()):toggle(toInt64(0, index))
  else
    selectedKey = -1
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  local heightIndex = tree2:getIndexByKey(toInt64(0, index))
  tree2:moveIndex(heightIndex)
  local indexMap = tree2IndexMap[index]
  local UIMarektCategoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
  local UICategoryValue = UIMarektCategoryInfo:getMainCategoryValue()
  local filterLineCount = UIMarektCategoryInfo:getFilterListCount(0)
  if filterLineCount == 0 then
    (ItemMarket.combobox_Filter_Sort1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_NONE"))
  else
    ;
    (ItemMarket.combobox_Filter_Sort1):SetText(UICategoryValue:getCategoryName() .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_ALL"))
  end
  selectMarketCategory(UICategoryValue:getCategoryNo(), -1)
  self.isGrouplist = true
  if index == 999 then
    self.isSpecialCategory = true
    ;
    (self.SpecialGoodsUpdate)()
  else
    self.isSpecialCategory = false
    self.isSpecialInside = false
    ItemMarket:Update()
  end
  self.txt_ItemNameBackPage = ""
  self.txt_SpecialItemNameBackPage = ""
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.edit_SpecialItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  tree2:requestUpdateByKey(toInt64(0, index))
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
end

HandleClicked_ItemMarket_SubCategory = function(index)
  -- function num : 0_5 , upvalues : ItemMarket, tree2IndexMap, selectedSubKey
  local self = ItemMarket
  local indexMap = tree2IndexMap[index]
  local UIMarektCategoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
  local UICategoryValue = UIMarektCategoryInfo:getMainCategoryValue()
  local filterLineCount = UIMarektCategoryInfo:getFilterListCount(0)
  local tree2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Category")
  local prevSelectedSubKey = selectedSubKey
  if selectedSubKey ~= index then
    selectedSubKey = index
  else
    selectedSubKey = -1
  end
  if filterLineCount == 0 then
    (ItemMarket.combobox_Filter_Sort1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_NONE"))
  else
    ;
    (ItemMarket.combobox_Filter_Sort1):SetText(UICategoryValue:getCategoryName() .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_ALL"))
  end
  local UISubCategoryValue = UIMarektCategoryInfo:getSubCategoryAt(indexMap._subIndex)
  selectMarketCategory(UICategoryValue:getCategoryNo(), UISubCategoryValue:getCategoryNo())
  self.isGrouplist = true
  self.isSpecialCategory = false
  ItemMarket:Update()
  if prevSelectedSubKey ~= -1 then
    tree2:requestUpdateByKey(toInt64(0, prevSelectedSubKey))
  end
  tree2:requestUpdateByKey(toInt64(0, index))
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
end

HandleClicked_ItemMarket_SpecialCategory = function(index)
  -- function num : 0_6 , upvalues : ItemMarket, tree2IndexMap, selectedKey, selectedSubKey
  local self = ItemMarket
  local tree2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Category")
  for key,value in pairs(tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  self.isSpecialCategory = true
  self.isSpecialInside = false
  if index == 999 then
    selectedKey = 999
    selectedSubKey = -1
    if not self.isWorldMapOpen then
      ToClient_requestListSellInfo(ToClient_CheckExistSummonMaid())
      ;
      (self._list2_SpecialList):SetShow(true)
      ;
      (self._list2_SpecialList_Inside):SetShow(true)
      ;
      (self._list2):SetShow(false)
      ;
      (self._list2_Inside):SetShow(false)
      Itemmarket_SelectedListHeadBGUpdate()
      self:SpecialGoodsUpdate()
      self.isGrouplist = true
      self.txt_SpecialItemNameBackPage = ""
      ;
      (self.edit_SpecialItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
      ;
      (self._list2):moveTopIndex()
      ;
      (self._list2_Inside):moveTopIndex()
      ;
      (self._list2_SpecialList):moveTopIndex()
      ;
      (self._list2_SpecialList_Inside):moveTopIndex()
      ;
      (self.btn_BackPage):SetShow(false)
    end
  end
end

Itemmarket_CategoryUpdate = function(contents, key)
  -- function num : 0_7 , upvalues : ItemMarket, tree2IndexMap, isWakenWeaponOpen, isAlchemyStoneOpen, _categoryTexture, UI_color, selectedKey, selectedSubKey
  local self = ItemMarket
  local idx = Int64toInt32(key)
  local indexMap = tree2IndexMap[idx]
  ;
  (self.combobox_Filter_Sort1):DeleteAllItem()
  local categoryBar = (UI.getChildControl)(contents, "Template_RadioButton_CategoryBar")
  categoryBar:SetShow(false)
  categoryBar:setNotImpactScrollEvent(true)
  local categoryIcon = (UI.getChildControl)(contents, "Template_RadioButton_CategoryIcon")
  if not isWakenWeaponOpen then
    if not isAlchemyStoneOpen then
      _categoryTexture = {
{
[0] = {226, 162, 244, 180}
}
, 
{
[0] = {247, 162, 265, 180}
}
, 
{
[0] = {268, 162, 286, 180}
}
, 
{
[0] = {247, 267, 265, 285}
}
, 
{
[0] = {204, 183, 222, 201}
}
, 
{
[0] = {247, 183, 265, 201}
}
, 
{
[0] = {247, 288, 265, 306}
}
, 
{
[0] = {226, 183, 244, 201}
}
, 
{
[0] = {204, 204, 222, 222}
}
, 
{
[0] = {247, 246, 265, 264}
}
, 
{
[0] = {268, 204, 286, 222}
}
, 
{
[0] = {204, 288, 222, 306}
}
, 
{
[0] = {268, 267, 286, 285}
}
, 
{
[0] = {247, 204, 265, 222}
}
; 
[0] = {
[0] = {204, 162, 222, 180}
}
, 
[999] = {
[0] = {204, 267, 222, 285}
}
}
    else
      _categoryTexture = {
{
[0] = {226, 162, 244, 180}
}
, 
{
[0] = {247, 162, 265, 180}
}
, 
{
[0] = {268, 162, 286, 180}
}
, 
{
[0] = {247, 267, 265, 285}
}
, 
{
[0] = {204, 183, 222, 201}
}
, 
{
[0] = {247, 183, 265, 201}
}
, 
{
[0] = {247, 288, 265, 306}
}
, 
{
[0] = {226, 288, 244, 306}
}
, 
{
[0] = {226, 183, 244, 201}
}
, 
{
[0] = {204, 204, 222, 222}
}
, 
{
[0] = {247, 246, 265, 264}
}
, 
{
[0] = {268, 204, 286, 222}
}
, 
{
[0] = {204, 288, 222, 306}
}
, 
{
[0] = {268, 267, 286, 285}
}
, 
{
[0] = {247, 204, 265, 222}
}
; 
[0] = {
[0] = {204, 162, 222, 180}
}
, 
[999] = {
[0] = {204, 267, 222, 285}
}
}
    end
  end
  if indexMap._isMain then
    categoryIcon:ChangeTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/ItemMarket_03.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(categoryIcon, ((_categoryTexture[indexMap._index])[0])[1], ((_categoryTexture[indexMap._index])[0])[2], ((_categoryTexture[indexMap._index])[0])[3], ((_categoryTexture[indexMap._index])[0])[4])
    ;
    (categoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    categoryIcon:setRenderTexture(categoryIcon:getBaseTexture())
    if indexMap._index == 999 then
      categoryIcon:ChangeTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/ItemMarket_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(categoryIcon, ((_categoryTexture[999])[0])[1], ((_categoryTexture[999])[0])[2], ((_categoryTexture[999])[0])[3], ((_categoryTexture[999])[0])[4])
      ;
      (categoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      categoryIcon:setRenderTexture(categoryIcon:getBaseTexture())
    end
  end
  do
    categoryIcon:SetShow(false)
    categoryIcon:SetPosX(10)
    categoryIcon:SetPosY(11)
    local categorySubBar = (UI.getChildControl)(contents, "Template_RadioButton_SubCategoryBar")
    local categorySubIcon = (UI.getChildControl)(categorySubBar, "Template_Static_Arrow")
    categorySubBar:SetFontColor(UI_color.C_FF8B7455)
    categorySubIcon:SetColor(UI_color.C_FF8B7455)
    categorySubBar:SetShow(false)
    if indexMap._isMain then
      if indexMap._index ~= 999 then
        categoryBar:SetShow(true)
        categoryIcon:SetShow(true)
        local UIMarektCategoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
        local UICategoryValue = UIMarektCategoryInfo:getMainCategoryValue()
        categoryBar:SetText(UICategoryValue:getCategoryName())
        categoryBar:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_MainCategory(" .. idx .. ")")
      else
        do
          categoryBar:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SPECIALITEM"))
          categoryBar:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SpecialCategory(" .. idx .. ")")
          categoryBar:SetShow(true)
          categoryIcon:SetShow(true)
          categoryBar:SetCheck(selectedKey == idx)
          categorySubBar:SetShow(true)
          local UIMarektCategoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
          do
            local UISubCategoryValue = UIMarektCategoryInfo:getSubCategoryAt(indexMap._subIndex)
            categorySubBar:SetText(UISubCategoryValue:getCategoryName())
            categorySubBar:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SubCategory(" .. idx .. ")")
            categorySubBar:SetFontColor(UI_color.C_FF8B7455)
            categorySubIcon:SetColor(UI_color.C_FF8B7455)
            if selectedSubKey == idx then
              categorySubIcon:SetColor(UI_color.C_FF07C1E3)
              categorySubBar:SetFontColor(UI_color.C_FF07C1E3)
            else
              categorySubIcon:SetColor(UI_color.C_FF8B7455)
              categorySubBar:SetFontColor(UI_color.C_FF8B7455)
            end
            -- DECOMPILER ERROR: 4 unprocessed JMP targets
          end
        end
      end
    end
  end
end

Itemmarket_ListUpdate = function(contents, key)
  -- function num : 0_8 , upvalues : ItemMarket, UI_TM
  local self = ItemMarket
  local idx = Int64toInt32(key)
  self.savedListUpdate_idx = idx
  local replaceCount = function(num)
    -- function num : 0_8_0
    local count = Int64toInt32(num)
    if count == 0 then
      count = "-"
    else
      count = makeDotMoney(num)
    end
    return count
  end

  local itemList_PosY = 5
  if self.isGrouplist == true then
    local itemlistBG = (UI.getChildControl)(contents, "Template_Button_ItemList")
    itemlistBG:SetShow(true)
    itemlistBG:setNotImpactScrollEvent(true)
    local itemlist_SlotBG = (UI.getChildControl)(contents, "Template_Static_SlotBG")
    itemlist_SlotBG:SetShow(true)
    local createSlot = {}
    local itemlist_Slot = (UI.getChildControl)(contents, "Template_Static_Slot")
    itemlist_Slot:SetShow(true)
    ;
    (SlotItem.reInclude)(createSlot, "ItemMarket_ItemGroupListSlotItem", 0, itemlist_Slot, self.slotGroupConfing)
    ;
    (createSlot.icon):SetSize(40, 40)
    ;
    (createSlot.border):SetSize(41, 41)
    ;
    (createSlot.border):SetPosX(0)
    local itemlist_ItemName = (UI.getChildControl)(contents, "Template_StaticText_ItemName")
    itemlist_ItemName:SetTextMode(UI_TM.eTextMode_LimitText)
    itemlist_ItemName:SetShow(true)
    local itemlist_AveragePrice_Title = (UI.getChildControl)(contents, "Template_StaticText_AveragePrice_Title")
    itemlist_AveragePrice_Title:SetPosX(430)
    itemlist_AveragePrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowListOutSideTooltip( true, " .. 0 .. ", " .. idx .. " )")
    itemlist_AveragePrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowListOutSideTooltip( false )")
    local itemlist_AveragePrice_Value = (UI.getChildControl)(contents, "Template_StaticText_AveragePrice_Value")
    itemlist_AveragePrice_Value:SetPosX(500)
    itemlist_AveragePrice_Value:SetShow(true)
    local itemlist_RecentPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RecentPrice_Title")
    itemlist_RecentPrice_Title:SetPosX(430)
    itemlist_RecentPrice_Title:SetPosY(32)
    itemlist_RecentPrice_Title:SetShow(true)
    itemlist_RecentPrice_Title:SetEnableArea(0, 0, 100, itemlist_RecentPrice_Title:GetSizeY())
    itemlist_RecentPrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowListOutSideTooltip( true, " .. 1 .. ", " .. idx .. " )")
    itemlist_RecentPrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowListOutSideTooltip( false )")
    local itemlist_RecentPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_RecentPrice_Value")
    itemlist_RecentPrice_Value:SetPosX(500)
    itemlist_RecentPrice_Value:SetPosY(30)
    itemlist_RecentPrice_Value:SetShow(true)
    local itemlist_RegistHighPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistHighPrice_Title")
    itemlist_RegistHighPrice_Title:SetPosX(250)
    itemlist_RegistHighPrice_Title:SetPosY(30)
    itemlist_RegistHighPrice_Title:SetShow(true)
    itemlist_RegistHighPrice_Title:SetTextSpan(30, -3)
    itemlist_RegistHighPrice_Title:SetEnableArea(0, 0, 70, itemlist_RegistHighPrice_Title:GetSizeY())
    itemlist_RegistHighPrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowListOutSideTooltip( true, " .. 2 .. ", " .. idx .. " )")
    itemlist_RegistHighPrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowListOutSideTooltip( false )")
    itemlist_RegistHighPrice_Title:setNotImpactScrollEvent(true)
    local itemlist_RegistHighPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistHighPrice_Value")
    itemlist_RegistHighPrice_Value:SetPosX(345)
    itemlist_RegistHighPrice_Value:SetPosY(30)
    itemlist_RegistHighPrice_Value:SetShow(false)
    itemlist_RegistHighPrice_Value:SetTextHorizonCenter()
    local itemlist_RegistLowPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistLowPrice_Title")
    itemlist_RegistLowPrice_Title:SetPosX(60)
    itemlist_RegistLowPrice_Title:SetPosY(30)
    itemlist_RegistLowPrice_Title:SetShow(true)
    itemlist_RegistLowPrice_Title:SetTextSpan(30, -3)
    itemlist_RegistLowPrice_Title:SetEnableArea(0, 0, 70, itemlist_RegistLowPrice_Title:GetSizeY())
    itemlist_RegistLowPrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowListOutSideTooltip( true, " .. 3 .. ", " .. idx .. " )")
    itemlist_RegistLowPrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowListOutSideTooltip( false )")
    itemlist_RegistLowPrice_Title:setNotImpactScrollEvent(true)
    local itemlist_RegistLowPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistLowPrice_Value")
    itemlist_RegistLowPrice_Value:SetPosX(225)
    itemlist_RegistLowPrice_Value:SetPosY(30)
    itemlist_RegistLowPrice_Value:SetShow(false)
    itemlist_RegistLowPrice_Value:SetTextHorizonCenter()
    local itemlist_RegistListCount_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistListCount_Title")
    itemlist_RegistListCount_Title:SetPosX(610)
    itemlist_RegistListCount_Title:SetPosY(10)
    itemlist_RegistListCount_Title:SetShow(true)
    itemlist_RegistListCount_Title:SetEnableArea(0, 0, 60, itemlist_RegistListCount_Title:GetSizeY())
    itemlist_RegistListCount_Title:addInputEvent("Mouse_On", "_itemMarket_ShowListOutSideTooltip( true, " .. 4 .. ", " .. idx .. " )")
    itemlist_RegistListCount_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowListOutSideTooltip( false )")
    local itemlist_RegistListCount_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistListCount_Value")
    itemlist_RegistListCount_Value:SetPosX(660)
    itemlist_RegistListCount_Value:SetPosY(8)
    itemlist_RegistListCount_Value:SetShow(true)
    local itemlist_RegistItemCount_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistItemCount_Title")
    itemlist_RegistItemCount_Title:SetPosX(610)
    itemlist_RegistItemCount_Title:SetPosY(32)
    itemlist_RegistItemCount_Title:SetShow(true)
    itemlist_RegistItemCount_Title:SetEnableArea(0, 0, 60, itemlist_RegistItemCount_Title:GetSizeY())
    itemlist_RegistItemCount_Title:addInputEvent("Mouse_On", "_itemMarket_ShowListOutSideTooltip( true, " .. 5 .. ", " .. idx .. " )")
    itemlist_RegistItemCount_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowListOutSideTooltip( false )")
    local itemlist_RegistItemCount_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistItemCount_Value")
    itemlist_RegistItemCount_Value:SetPosX(660)
    itemlist_RegistItemCount_Value:SetPosY(30)
    itemlist_RegistItemCount_Value:SetShow(true)
    local itemlist_Line1 = (UI.getChildControl)(contents, "Template_Static_Line_1")
    itemlist_Line1:SetPosX(410)
    itemlist_Line1:SetPosY(10)
    itemlist_Line1:SetShow(true)
    local itemlist_Line2 = (UI.getChildControl)(contents, "Template_Static_Line_2")
    itemlist_Line2:SetPosX(600)
    itemlist_Line2:SetPosY(10)
    itemlist_Line2:SetShow(true)
    local itemlist_Line3 = (UI.getChildControl)(contents, "Template_Static_Line_3")
    itemlist_Line3:SetPosX(590)
    itemlist_Line3:SetPosY(10)
    itemlist_Line3:SetShow(false)
    local itemlist_Dash = (UI.getChildControl)(contents, "Selected_StaticText_dash")
    itemlist_Dash:SetPosX(205)
    itemlist_Dash:SetPosY(30)
    itemlist_Dash:SetShow(true)
    local itemlist_RegistAlarm_Chk = (UI.getChildControl)(contents, "Template_CheckButton_RegistAlarm")
    itemlist_RegistAlarm_Chk:SetPosX(610)
    itemlist_RegistAlarm_Chk:SetPosY(23)
    itemlist_RegistAlarm_Chk:SetShow(false)
    local itemMarketSummaryInfo = getItemMarketCategorySummaryInClientByIndex(idx)
    if itemMarketSummaryInfo ~= nil then
      local iess = itemMarketSummaryInfo:getItemEnchantStaticStatusWrapper()
      local enchantLevel = ((iess:get())._key):getEnchantLevel()
      local itemEnchantKeyRaw = ((iess:get())._key):get()
      local nameColorGrade = iess:getGradeType()
      local nameColor = self:SetNameColor(nameColorGrade)
      itemlist_ItemName:SetFontColor(nameColor)
      local itemNameStr = self:SetNameAndEnchantLevel(enchantLevel, iess:getItemType(), iess:getName(), iess:getItemClassify())
      itemlist_ItemName:SetText(itemNameStr)
      if itemlist_ItemName:IsLimitText() then
        itemlist_ItemName:addInputEvent("Mouse_On", "ItemMarket_SelectedItemNameTooltip( true, \"" .. itemNameStr .. "\", " .. idx .. ", 0 )")
        itemlist_ItemName:addInputEvent("Mouse_Out", "ItemMarket_SelectedItemNameTooltip( false )")
        itemlist_ItemName:SetIgnore(false)
      else
        itemlist_ItemName:addInputEvent("Mouse_On", "")
        itemlist_ItemName:addInputEvent("Mouse_Out", "")
        itemlist_ItemName:SetIgnore(true)
      end
      createSlot:setItemByStaticStatus(iess, 1, -1, false)
      ;
      (createSlot.icon):addInputEvent("Mouse_On", "_itemMarket_ShowListOutsideItemSlotToolTip( " .. idx .. ", " .. tostring(nil) .. " )")
      ;
      (createSlot.icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
      ;
      (createSlot.icon):SetShow(true)
      itemlist_RegistHighPrice_Title:SetText(replaceCount(itemMarketSummaryInfo:getDisplayedHighestOnePrice()))
      itemlist_RegistLowPrice_Title:SetText(replaceCount(itemMarketSummaryInfo:getDisplayedLowestOnePrice()))
      local masterInfo = getItemMarketMasterByItemEnchantKey(itemEnchantKeyRaw)
      local marketConditions = (masterInfo:getMinPrice() + masterInfo:getMaxPrice()) / toInt64(0, 2)
      itemlist_AveragePrice_Value:SetText(replaceCount(marketConditions))
      itemlist_RecentPrice_Value:SetText(replaceCount(itemMarketSummaryInfo:getLastTradedOnePrice()))
      itemlist_RegistListCount_Value:SetText(replaceCount(itemMarketSummaryInfo:getTradedTotalAmount()))
      itemlist_RegistItemCount_Value:SetText(replaceCount(itemMarketSummaryInfo:getDisplayedTotalAmount()))
      if Int64toInt32(itemMarketSummaryInfo:getDisplayedTotalAmount()) == 0 then
        itemlistBG:SetMonoTone(true)
        itemlist_SlotBG:SetMonoTone(true)
        itemlist_ItemName:SetMonoTone(true)
        itemlist_AveragePrice_Title:SetMonoTone(true)
        itemlist_AveragePrice_Value:SetMonoTone(true)
        itemlist_RecentPrice_Title:SetMonoTone(true)
        itemlist_RecentPrice_Value:SetMonoTone(true)
        itemlist_RegistHighPrice_Title:SetMonoTone(true)
        itemlist_RegistHighPrice_Value:SetMonoTone(true)
        itemlist_RegistLowPrice_Title:SetMonoTone(true)
        itemlist_RegistLowPrice_Value:SetMonoTone(true)
        itemlist_RegistListCount_Title:SetMonoTone(true)
        itemlist_RegistListCount_Value:SetMonoTone(true)
        itemlist_RegistItemCount_Title:SetMonoTone(true)
        itemlist_RegistItemCount_Value:SetMonoTone(true)
        itemlist_Line1:SetMonoTone(true)
        itemlist_Line2:SetMonoTone(true)
        itemlist_Line3:SetMonoTone(true)
        itemlist_Dash:SetMonoTone(true)
        ;
        (createSlot.icon):SetMonoTone(true)
      else
        itemlistBG:SetMonoTone(false)
        itemlist_SlotBG:SetMonoTone(false)
        itemlist_ItemName:SetMonoTone(false)
        itemlist_AveragePrice_Title:SetMonoTone(false)
        itemlist_AveragePrice_Value:SetMonoTone(false)
        itemlist_RecentPrice_Title:SetMonoTone(false)
        itemlist_RecentPrice_Value:SetMonoTone(false)
        itemlist_RegistHighPrice_Title:SetMonoTone(false)
        itemlist_RegistHighPrice_Value:SetMonoTone(false)
        itemlist_RegistLowPrice_Title:SetMonoTone(false)
        itemlist_RegistLowPrice_Value:SetMonoTone(false)
        itemlist_RegistListCount_Title:SetMonoTone(false)
        itemlist_RegistListCount_Value:SetMonoTone(false)
        itemlist_RegistItemCount_Title:SetMonoTone(false)
        itemlist_RegistItemCount_Value:SetMonoTone(false)
        itemlist_Line1:SetMonoTone(false)
        itemlist_Line2:SetMonoTone(false)
        itemlist_Line3:SetMonoTone(false)
        itemlist_Dash:SetMonoTone(false)
        ;
        (createSlot.icon):SetMonoTone(false)
      end
      itemlistBG:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_ItemName:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_AveragePrice_Title:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_AveragePrice_Value:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RecentPrice_Title:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RecentPrice_Value:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RegistHighPrice_Title:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RegistHighPrice_Value:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RegistLowPrice_Title:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RegistLowPrice_Value:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RegistListCount_Title:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RegistListCount_Value:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RegistItemCount_Title:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlist_RegistItemCount_Value:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
    end
    do
      do
        itemlistBG:SetShow(true)
        ;
        (self.selectedListHeadBG):SetShow(false)
        ;
        (self.static_ListHeadBG):SetShow(true)
        ;
        (self.specialListHeadBG):SetShow(false)
        ;
        (self.btn_BackPage):SetShow(false)
        ;
        (self.btn_SetAlarm):SetShow(false)
        ;
        (self.btn_SetPreBid):SetShow(false)
        ;
        (self.btn_Refresh):SetShow(false)
        ;
        (self.txt_SpecialGoodsName):SetShow(false)
        ;
        (self.txt_SpecialGoodsDesc):SetShow(false)
      end
    end
  end
end

Itemmarket_ListUpdate_Inside = function(contents, key)
  -- function num : 0_9 , upvalues : ItemMarket, UI_TM, textAddSize
  local self = ItemMarket
  local idx = Int64toInt32(key)
  local replaceCount = function(num)
    -- function num : 0_9_0
    local count = Int64toInt32(num)
    if count == 0 then
      count = "-"
    else
      count = makeDotMoney(num)
    end
    return count
  end

  local itemlist_SingleItemBG = (UI.getChildControl)(contents, "Template_Static_SingleItemBG")
  local itemlist_SingleItemSlotBG = (UI.getChildControl)(contents, "Template_Static_SlotBG")
  local createSelectedSlot = {}
  local itemlist_SingleItemSlot = (UI.getChildControl)(contents, "Template_Static_Slot")
  itemlist_SingleItemSlot:SetShow(true)
  ;
  (SlotItem.reInclude)(createSelectedSlot, "ItemMarket_ItemSelectedListSlotItem", 0, itemlist_SingleItemSlot, self.slotSingleConfing)
  ;
  (createSelectedSlot.icon):SetSize(40, 40)
  ;
  (createSelectedSlot.border):SetSize(40, 41)
  local itemlist_SingleItemName = (UI.getChildControl)(contents, "Template_StaticText_SingleItemName")
  itemlist_SingleItemName:SetShow(true)
  itemlist_SingleItemName:SetPosX(60)
  itemlist_SingleItemName:SetPosY(10)
  local itemlist_SingleBiddingMark = (UI.getChildControl)(contents, "Template_Static_BiddingMark")
  itemlist_SingleBiddingMark:SetPosX(7)
  itemlist_SingleBiddingMark:SetPosY(10)
  local itemlist_SellPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_SellPrice_Title")
  itemlist_SellPrice_Title:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_SELLPRICE_TITLE"))
  itemlist_SellPrice_Title:SetPosX(60)
  itemlist_SellPrice_Title:SetPosY(35)
  itemlist_SellPrice_Title:SetShow(true)
  local itemlist_SellPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_SellPrice_Value")
  itemlist_SellPrice_Value:SetPosX(itemlist_SellPrice_Title:GetPosX() + itemlist_SellPrice_Title:GetTextSizeX() + 10)
  itemlist_SellPrice_Value:SetPosY(35)
  itemlist_SellPrice_Value:SetShow(true)
  local itemlist_RegistPeriod_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistPeriod_Title")
  itemlist_RegistPeriod_Title:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_REGISTPERIOD_TITLE"))
  itemlist_RegistPeriod_Title:SetPosX(400)
  itemlist_RegistPeriod_Title:SetPosY(25)
  itemlist_RegistPeriod_Title:SetShow(true)
  local itemlist_RegistPeriod_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistPeriod_Value")
  itemlist_RegistPeriod_Value:SetPosX(itemlist_RegistPeriod_Title:GetPosX() + itemlist_RegistPeriod_Title:GetTextSizeX() + 10)
  itemlist_RegistPeriod_Value:SetPosY(25)
  itemlist_RegistPeriod_Value:SetShow(true)
  local itemlist_BuyItem = (UI.getChildControl)(contents, "Template_Button_BuyItem")
  itemlist_BuyItem:SetPosX(680)
  itemlist_BuyItem:SetPosY(10)
  itemlist_BuyItem:SetShow(true)
  ;
  (self.txt_SpecialGoodsName):SetShow(false)
  ;
  (self.txt_SpecialGoodsDesc):SetShow(false)
  local summaryInfo = getItemMarketSummaryInClientByItemEnchantKey(self.sellInfoItemEnchantKeyRaw)
  if summaryInfo == nil then
    _PA_ASSERT(false, "summaryInfo 아이�\156 종합정보�\128 �\173 있어야합니다")
    return 
  end
  local summaryIess = summaryInfo:getItemEnchantStaticStatusWrapper()
  _PA_ASSERT(summaryIess ~= nil, "summaryInfo 아이�\156 고정정보�\128 �\173 있어야합니다")
  local nameColorGrade = summaryIess:getGradeType()
  local sellInfo = getItemMarketSellInfoInClientByIndex(self.curTerritoryKeyRaw, self.sellInfoItemEnchantKeyRaw, idx)
  if sellInfo ~= nil then
    local iess = sellInfo:getItemEnchantStaticStatusWrapper()
    _PA_ASSERT(iess ~= nil, "sellInfo 아이�\156 고정정보�\128 �\173 있어야합니다")
    local enchantLevel = ((iess:get())._key):getEnchantLevel()
    local nameColor = self:SetNameColor(nameColorGrade)
    itemlist_SingleItemName:SetTextMode(UI_TM.eTextMode_LimitText)
    itemlist_SingleItemName:SetFontColor(nameColor)
    local isBiddingTime = sellInfo:isBiddingItem()
    local isBiddingJoinTime = sellInfo:isBiddingJoinTime()
    local isBiddingJoinItem = isBiddingJoinItem(sellInfo:getItemMarketNo())
    if isBiddingTime then
      itemlist_SingleBiddingMark:SetShow(true)
    else
      itemlist_SingleBiddingMark:SetShow(false)
    end
    local itemNameStr = self:SetNameAndEnchantLevel(enchantLevel, iess:getItemType(), iess:getName(), iess:getItemClassify())
    itemlist_SingleItemName:SetText(itemNameStr)
    if itemlist_SingleItemName:GetSizeX() < itemlist_SingleItemName:GetTextSizeX() + textAddSize then
      itemlist_SingleItemName:addInputEvent("Mouse_On", "ItemMarket_SelectedItemNameTooltip( true, \"" .. itemNameStr .. "\", " .. idx .. ", 1 )")
      itemlist_SingleItemName:addInputEvent("Mouse_Out", "ItemMarket_SelectedItemNameTooltip( false )")
      itemlist_SingleItemName:SetIgnore(false)
    else
      itemlist_SingleItemName:addInputEvent("Mouse_On", " ")
      itemlist_SingleItemName:addInputEvent("Mouse_Out", " ")
      itemlist_SingleItemName:SetIgnore(true)
    end
    createSelectedSlot:setItemByStaticStatus(iess, sellInfo:getCount(), -1, false)
    ;
    (createSelectedSlot.icon):addInputEvent("Mouse_On", "_itemMarket_ShowListOutsideItemSlotToolTip( " .. idx .. ", false )")
    ;
    (createSelectedSlot.icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
    local itemEnchantKeyRaw = ((iess:get())._key):get()
    local sumSinglePrice = sellInfo:getTotalPrice() / sellInfo:getCount()
    itemlist_SellPrice_Value:SetText(makeDotMoney(sumSinglePrice))
    itemlist_RegistPeriod_Value:SetText(converStringFromLeftDateTime(sellInfo:getDisplayedEndDate()))
    itemlist_RegistPeriod_Title:SetShow(true)
    itemlist_RegistPeriod_Value:SetShow(true)
    if ToClient_WorldMapIsShow() == true or ItemMarket.escMenuSaveValue then
      itemlist_BuyItem:SetShow(false)
    else
      itemlist_BuyItem:SetShow(true)
      if isBiddingTime == true then
        if isBiddingJoinTime == true then
          if isBiddingJoinItem == true then
            itemlist_BuyItem:SetEnable(false)
            itemlist_BuyItem:SetMonoTone(true)
            itemlist_BuyItem:SetFontColor((Defines.Color).C_FF626262)
            itemlist_BuyItem:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BTN_BIDDINGJOINITEM"))
          else
            itemlist_BuyItem:SetEnable(true)
            itemlist_BuyItem:SetMonoTone(false)
            itemlist_BuyItem:SetFontColor((Defines.Color).C_FFEFEFEF)
            itemlist_BuyItem:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BTN_BIDDING"))
            itemlist_BuyItem:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SingleItem( " .. idx .. "," .. self.sellInfoItemEnchantKeyRaw .. ", true)")
          end
        elseif isBiddingJoinItem == true then
          itemlist_BuyItem:SetEnable(true)
          itemlist_BuyItem:SetMonoTone(false)
          itemlist_BuyItem:SetFontColor((Defines.Color).C_FFEFEFEF)
          itemlist_BuyItem:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BTN_BIDDING_RESEULT"))
          itemlist_BuyItem:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SingleItem( " .. idx .. "," .. self.sellInfoItemEnchantKeyRaw .. ", false)")
        else
          itemlist_BuyItem:SetEnable(false)
          itemlist_BuyItem:SetMonoTone(true)
          itemlist_BuyItem:SetFontColor((Defines.Color).C_FF626262)
          itemlist_BuyItem:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BTN_BIDDING_END"))
        end
      else
        itemlist_BuyItem:SetEnable(true)
        itemlist_BuyItem:SetMonoTone(false)
        itemlist_BuyItem:SetFontColor((Defines.Color).C_FFEFEFEF)
        itemlist_BuyItem:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BTN_BUY"))
        itemlist_BuyItem:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SingleItem( " .. idx .. "," .. self.sellInfoItemEnchantKeyRaw .. ", false)")
      end
    end
    itemlist_SingleItemBG:SetShow(true)
  end
  -- DECOMPILER ERROR: 14 unprocessed JMP targets
end

Itemmarket_SpecialListUpdate = function(contents, key)
  -- function num : 0_10 , upvalues : ItemMarket, UI_TM, UI_color
  local self = ItemMarket
  local idx = Int64toInt32(key)
  local replaceCount = function(num)
    -- function num : 0_10_0
    local count = Int64toInt32(num)
    if count == 0 then
      count = "-"
    else
      count = makeDotMoney(num)
    end
    return count
  end

  if self.isGrouplist == true then
    local itemlistBG = (UI.getChildControl)(contents, "Template_Button_ItemList")
    itemlistBG:SetShow(true)
    itemlistBG:setNotImpactScrollEvent(true)
    local itemlist_SlotBG = (UI.getChildControl)(contents, "Template_Static_SlotBG")
    itemlist_SlotBG:SetShow(true)
    local createSpecialSlot = {}
    local specialItemlist_Slot = (UI.getChildControl)(contents, "Template_Static_Slot")
    specialItemlist_Slot:SetShow(true)
    ;
    (SlotItem.reInclude)(createSpecialSlot, "ItemMarket_ItemSpecialGroupListSlotItem", 0, specialItemlist_Slot, self.slotGroupConfing)
    ;
    (createSpecialSlot.icon):SetSize(40, 40)
    ;
    (createSpecialSlot.border):SetSize(40, 41)
    local itemlist_ItemName = (UI.getChildControl)(contents, "Template_StaticText_ItemName")
    itemlist_ItemName:SetTextMode(UI_TM.eTextMode_AutoWrap)
    itemlist_ItemName:SetShow(true)
    local itemlist_RegistHighPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistHighPrice_Title")
    itemlist_RegistHighPrice_Title:SetPosX(225)
    itemlist_RegistHighPrice_Title:SetPosY(30)
    itemlist_RegistHighPrice_Title:SetShow(true)
    itemlist_RegistHighPrice_Title:SetTextSpan(30, -3)
    itemlist_RegistHighPrice_Title:SetEnableArea(0, 0, 70, itemlist_RegistHighPrice_Title:GetSizeY())
    itemlist_RegistHighPrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowSpecialListOutSideTooltip( true, " .. 2 .. ", " .. idx .. " )")
    itemlist_RegistHighPrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowSpecialListOutSideTooltip( false )")
    local itemlist_RegistHighPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistHighPrice_Value")
    itemlist_RegistHighPrice_Value:SetPosX(345)
    itemlist_RegistHighPrice_Value:SetPosY(30)
    itemlist_RegistHighPrice_Value:SetShow(false)
    itemlist_RegistHighPrice_Value:SetTextHorizonCenter()
    local itemlist_RegistLowPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistLowPrice_Title")
    itemlist_RegistLowPrice_Title:SetPosX(60)
    itemlist_RegistLowPrice_Title:SetPosY(30)
    itemlist_RegistLowPrice_Title:SetShow(true)
    itemlist_RegistLowPrice_Title:SetTextSpan(30, -3)
    itemlist_RegistLowPrice_Title:SetEnableArea(0, 0, 70, itemlist_RegistLowPrice_Title:GetSizeY())
    itemlist_RegistLowPrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowSpecialListOutSideTooltip( true, " .. 3 .. ", " .. idx .. " )")
    itemlist_RegistLowPrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowSpecialListOutSideTooltip( false )")
    local itemlist_RegistLowPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistLowPrice_Value")
    itemlist_RegistLowPrice_Value:SetPosX(225)
    itemlist_RegistLowPrice_Value:SetPosY(30)
    itemlist_RegistLowPrice_Value:SetShow(false)
    itemlist_RegistLowPrice_Value:SetTextHorizonCenter()
    local itemlist_RegistListCount_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistListCount_Title")
    itemlist_RegistListCount_Title:SetPosX(490)
    itemlist_RegistListCount_Title:SetPosY(10)
    itemlist_RegistListCount_Title:SetShow(true)
    itemlist_RegistListCount_Title:SetEnableArea(0, 0, 60, itemlist_RegistListCount_Title:GetSizeY())
    itemlist_RegistListCount_Title:addInputEvent("Mouse_On", "_itemMarket_ShowSpecialListOutSideTooltip( true, " .. 4 .. ", " .. idx .. " )")
    itemlist_RegistListCount_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowSpecialListOutSideTooltip( false )")
    local itemlist_RegistListCount_Value = (UI.getChildControl)(contents, "Template_StaticText_RegistListCount_Value")
    itemlist_RegistListCount_Value:SetPosX(495)
    itemlist_RegistListCount_Value:SetPosY(8)
    itemlist_RegistListCount_Value:SetShow(true)
    local itemlist_Dash = (UI.getChildControl)(contents, "Selected_StaticText_dash")
    itemlist_Dash:SetPosX(180)
    itemlist_Dash:SetPosY(30)
    itemlist_Dash:SetShow(true)
    local itemMarketSummaryInfo = ToClient_requestGetItemEnchantStaticStatusWrapperByIndex(idx)
    if itemMarketSummaryInfo ~= nil then
      local enchantLevel = ((itemMarketSummaryInfo:get())._key):getEnchantLevel()
      local itemEnchantKeyRaw = ((itemMarketSummaryInfo:get())._key):get()
      local nameColorGrade = (itemMarketSummaryInfo:getGradeType())
      local nameColor = nil
      if nameColorGrade == 0 then
        nameColor = UI_color.C_FFFFFFFF
      else
        if nameColorGrade == 1 then
          nameColor = 4284350320
        else
          if nameColorGrade == 2 then
            nameColor = 4283144191
          else
            if nameColorGrade == 3 then
              nameColor = 4294953010
            else
              if nameColorGrade == 4 then
                nameColor = 4294929408
              else
                nameColor = UI_color.C_FFFFFFFF
              end
            end
          end
        end
      end
      itemlist_ItemName:SetFontColor(nameColor)
      local enchantLevel = ((itemMarketSummaryInfo:get())._key):getEnchantLevel()
      if itemMarketSummaryInfo:getItemType() == 1 and enchantLevel > 15 then
        itemlist_ItemName:SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemMarketSummaryInfo:getName())
      else
        if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemMarketSummaryInfo:getItemClassify() then
          itemlist_ItemName:SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemMarketSummaryInfo:getName())
        else
          itemlist_ItemName:SetText(itemMarketSummaryInfo:getName())
        end
      end
      createSpecialSlot:setItemByStaticStatus(itemMarketSummaryInfo, 1, -1, false)
      ;
      (createSpecialSlot.icon):addInputEvent("Mouse_On", "_specialGoods_ShowToolTip( " .. idx .. " )")
      ;
      (createSpecialSlot.icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
      itemlist_RegistHighPrice_Title:SetText(replaceCount(ToClient_requestGetDisplayedHighestOnePriceByItemEnchantKeyRaw(itemEnchantKeyRaw)))
      itemlist_RegistLowPrice_Title:SetText(replaceCount(ToClient_requestGetDisplayedLowestOnePriceByItemEnchantKeyRaw(itemEnchantKeyRaw)))
      itemlist_RegistListCount_Value:SetText(replaceCount(ToClient_requestGetItemCountByItemEnchantKeyRaw(itemEnchantKeyRaw)))
      itemlistBG:addInputEvent("Mouse_LUp", "HandleClicked_SpecialGoods_GroupItem( " .. idx .. "," .. itemEnchantKeyRaw .. " )")
      itemlistBG:SetShow(true)
      itemlist_RegistListCount_Title:SetPosY(22)
      itemlist_RegistListCount_Value:SetPosY(20)
      if ToClient_requestGetItemCountByItemEnchantKeyRaw(itemEnchantKeyRaw) == 0 then
        itemlistBG:SetMonoTone(true)
      else
        itemlistBG:SetMonoTone(false)
      end
    end
    do
      ;
      (self.txt_SpecialGoodsName):SetShow(true)
      ;
      (self.txt_SpecialGoodsDesc):SetShow(true)
      ;
      (self.btn_BackPage):SetShow(false)
      ;
      (self._list2_SpecialList_Inside):SetShow(false)
      ;
      (self._list2):SetShow(false)
      ;
      (self._list2_Inside):SetShow(false)
    end
  end
end

Itemmarket_SpecialListUpdate_Inside = function(contents, key)
  -- function num : 0_11 , upvalues : ItemMarket, UI_color
  local self = ItemMarket
  local idx = Int64toInt32(key)
  local replaceCount = function(num)
    -- function num : 0_11_0
    local count = Int64toInt32(num)
    if count == 0 then
      count = "-"
    else
      count = makeDotMoney(num)
    end
    return count
  end

  local itemlist_SingleItemBG = (UI.getChildControl)(contents, "Template_Static_SingleItemBG")
  local itemlist_SingleItemSlotBG = (UI.getChildControl)(contents, "Template_Static_SlotBG")
  local createSpecialListSlot = {}
  local specialItemInsidelist_Slot = (UI.getChildControl)(contents, "Template_Static_Slot")
  specialItemInsidelist_Slot:SetShow(true)
  ;
  (SlotItem.reInclude)(createSpecialListSlot, "ItemMarket_ItemSpecialListSlotItem", 0, specialItemInsidelist_Slot, self.slotGroupConfing)
  ;
  (createSpecialListSlot.icon):SetSize(40, 40)
  ;
  (createSpecialListSlot.border):SetSize(40, 41)
  local itemlist_SingleItemName = (UI.getChildControl)(contents, "Template_StaticText_SingleItemName")
  itemlist_SingleItemName:SetShow(true)
  itemlist_SingleItemName:SetPosX(60)
  itemlist_SingleItemName:SetPosY(10)
  local itemlist_SellPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_SellPrice_Title")
  itemlist_SellPrice_Title:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_SELLPRICE_TITLE"))
  itemlist_SellPrice_Title:SetPosX(60)
  itemlist_SellPrice_Title:SetPosY(35)
  itemlist_SellPrice_Title:SetShow(true)
  local itemlist_SellPrice_Value = (UI.getChildControl)(contents, "Template_StaticText_SellPrice_Value")
  itemlist_SellPrice_Value:SetPosX(itemlist_SellPrice_Title:GetPosX() + itemlist_SellPrice_Title:GetTextSizeX() + 10)
  itemlist_SellPrice_Value:SetPosY(35)
  itemlist_SellPrice_Value:SetShow(true)
  local itemlist_BuyItem = (UI.getChildControl)(contents, "Template_Button_BuyItem")
  itemlist_BuyItem:SetPosX(680)
  itemlist_BuyItem:SetPosY(10)
  itemlist_BuyItem:SetShow(true)
  local itemMarketSummaryInfo = getItemEnchantStaticStatus(ItemEnchantKey(self.specialItemEnchantKeyRaw))
  if itemMarketSummaryInfo ~= nil then
    local itemEnchantKeyRaw = ((itemMarketSummaryInfo:get())._key):get()
    local enchantLevel = ((itemMarketSummaryInfo:get())._key):getEnchantLevel()
    local nameColorGrade = (itemMarketSummaryInfo:getGradeType())
    local nameColor = nil
    if nameColorGrade == 0 then
      nameColor = UI_color.C_FFFFFFFF
    else
      if nameColorGrade == 1 then
        nameColor = 4284350320
      else
        if nameColorGrade == 2 then
          nameColor = 4283144191
        else
          if nameColorGrade == 3 then
            nameColor = 4294953010
          else
            if nameColorGrade == 4 then
              nameColor = 4294929408
            else
              nameColor = UI_color.C_FFFFFFFF
            end
          end
        end
      end
    end
    if itemMarketSummaryInfo ~= nil then
      itemlist_SingleItemName:SetFontColor(nameColor)
      if itemMarketSummaryInfo:getItemType() == 1 and enchantLevel > 15 then
        itemlist_SingleItemName:SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemMarketSummaryInfo:getName())
      else
        if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemMarketSummaryInfo:getItemClassify() then
          itemlist_SingleItemName:SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemMarketSummaryInfo:getName())
        else
          itemlist_SingleItemName:SetText(itemMarketSummaryInfo:getName())
        end
      end
      createSpecialListSlot:setItemByStaticStatus(itemMarketSummaryInfo, 1, -1, false)
      ;
      (createSpecialListSlot.icon):addInputEvent("Mouse_On", "_specialGoodsSingle_ShowToolTip( " .. itemEnchantKeyRaw .. ", " .. idx .. " )")
      ;
      (createSpecialListSlot.icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
      itemlist_SellPrice_Value:SetText(makeDotMoney(ToClient_requestGetItemPrice(itemEnchantKeyRaw, idx)))
      if ToClient_WorldMapIsShow() == true or ItemMarket.escMenuSaveValue then
        itemlist_BuyItem:SetShow(false)
      else
        itemlist_BuyItem:SetShow(true)
        itemlist_BuyItem:SetEnable(true)
        itemlist_BuyItem:SetMonoTone(false)
        itemlist_BuyItem:SetFontColor((Defines.Color).C_FFEFEFEF)
        itemlist_BuyItem:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SpecialItem( " .. idx .. "," .. itemEnchantKeyRaw .. ")")
      end
      itemlist_SingleItemBG:SetShow(true)
    end
  end
  do
    ;
    (self.txt_SpecialGoodsName):SetShow(false)
    ;
    (self.txt_SpecialGoodsDesc):SetShow(false)
  end
end

Itemmarket_SelectedListHeadBGUpdate = function()
  -- function num : 0_12 , upvalues : ItemMarket, UI_color, UI_TM, textAddSize
  local self = ItemMarket
  local replaceCount = function(num)
    -- function num : 0_12_0
    local count = Int64toInt32(num)
    if count == 0 then
      count = "-"
    else
      count = makeDotMoney(num)
    end
    return count
  end

  if self.isSpecialInside then
    local itemMarketSummaryInfo = getItemEnchantStaticStatus(ItemEnchantKey(self.specialItemEnchantKeyRaw))
    if itemMarketSummaryInfo ~= nil then
      local itemEnchantKeyRaw = ((itemMarketSummaryInfo:get())._key):get()
      local enchantLevel = ((itemMarketSummaryInfo:get())._key):getEnchantLevel()
      local nameColorGrade = (itemMarketSummaryInfo:getGradeType())
      local nameColor = nil
      if nameColorGrade == 0 then
        nameColor = UI_color.C_FFFFFFFF
      else
        if nameColorGrade == 1 then
          nameColor = 4284350320
        else
          if nameColorGrade == 2 then
            nameColor = 4283144191
          else
            if nameColorGrade == 3 then
              nameColor = 4294953010
            else
              if nameColorGrade == 4 then
                nameColor = 4294929408
              else
                nameColor = UI_color.C_FFFFFFFF
              end
            end
          end
        end
      end
      ;
      (self.Selected_ItemName):SetFontColor(nameColor)
      ;
      (self.Selected_ItemName):addInputEvent("Mouse_RUp", "HandleClicked_ItemMarket_UnSetGroupItem()")
      local enchantLevel = ((itemMarketSummaryInfo:get())._key):getEnchantLevel()
      ;
      (self.Selected_ItemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
      if itemMarketSummaryInfo:getItemType() == 1 and enchantLevel > 15 then
        (self.Selected_ItemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemMarketSummaryInfo:getName())
      else
        if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemMarketSummaryInfo:getItemClassify() then
          (self.Selected_ItemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemMarketSummaryInfo:getName())
        else
          ;
          (self.Selected_ItemName):SetText(itemMarketSummaryInfo:getName())
        end
      end
      if (self.Selected_ItemName):GetSizeX() < (self.Selected_ItemName):GetTextSizeX() + textAddSize then
        (self.Selected_ItemName):addInputEvent("Mouse_On", "ItemMarket_SelectedItemNameTooltip( true, " .. tostring(itemMarketSummaryInfo:getName()) .. ", " .. tostring(nil) .. " )")
        ;
        (self.Selected_ItemName):addInputEvent("Mouse_Out", "ItemMarket_SelectedItemNameTooltip( false )")
        ;
        (self.Selected_ItemName):SetIgnore(false)
      else
        ;
        (self.Selected_ItemName):addInputEvent("Mouse_On", " ")
        ;
        (self.Selected_ItemName):addInputEvent("Mouse_Out", " ")
        ;
        (self.Selected_ItemName):SetIgnore(true)
      end
      ;
      (self.selectSingleSlot):setItemByStaticStatus(itemMarketSummaryInfo, 1, -1, false)
      ;
      (self.Selected_HighPrice):SetText(replaceCount(ToClient_requestGetDisplayedHighestOnePriceByItemEnchantKeyRaw(itemEnchantKeyRaw)))
      ;
      (self.Selected_LowPrice):SetText(replaceCount(ToClient_requestGetDisplayedLowestOnePriceByItemEnchantKeyRaw(itemEnchantKeyRaw)))
      ;
      (self.Selected_AveragePrice_Value):SetShow(false)
      ;
      (self.Selected_RecentPrice_Value):SetShow(false)
      ;
      (self.Selected_RegistListCount_Value):SetShow(false)
      ;
      (self.Selected_RegistItemCount_Value):SetShow(false)
      ;
      ((self.selectSingleSlot).icon):addInputEvent("Mouse_On", "_specialGoodsSingle_ShowToolTip( " .. itemEnchantKeyRaw .. ", " .. tostring(nil) .. " )")
      ;
      ((self.selectSingleSlot).icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
    end
  else
    do
      local sellInfo = getItemMarketSummaryInClientByItemEnchantKey(self.sellInfoItemEnchantKeyRaw)
      if sellInfo ~= nil then
        local iess = sellInfo:getItemEnchantStaticStatusWrapper()
        _PA_ASSERT(iess ~= nil, "sellInfo 아이�\156 고정정보�\128 �\173 있어야합니다")
        local itemEnchantKeyRaw = ((iess:get())._key):get()
        local enchantLevel = ((iess:get())._key):getEnchantLevel()
        local nameColorGrade = iess:getGradeType()
        local nameColor = self:SetNameColor(nameColorGrade)
        ;
        (self.Selected_ItemName):SetFontColor(nameColor)
        local itemNameStr = self:SetNameAndEnchantLevel(enchantLevel, iess:getItemType(), iess:getName(), iess:getItemClassify())
        ;
        (self.Selected_ItemName):SetText(itemNameStr)
        if (self.Selected_ItemName):GetSizeX() < (self.Selected_ItemName):GetTextSizeX() + textAddSize then
          (self.Selected_ItemName):addInputEvent("Mouse_On", "ItemMarket_SelectedItemNameTooltip( true, \"" .. itemNameStr .. "\", " .. tostring(nil) .. " )")
          ;
          (self.Selected_ItemName):addInputEvent("Mouse_Out", "ItemMarket_SelectedItemNameTooltip( false )")
          ;
          (self.Selected_ItemName):SetIgnore(false)
        else
          (self.Selected_ItemName):addInputEvent("Mouse_On", " ")
          ;
          (self.Selected_ItemName):addInputEvent("Mouse_Out", " ")
          ;
          (self.Selected_ItemName):SetIgnore(true)
        end
        ;
        (self.selectSingleSlot):setItemByStaticStatus(iess, 1, -1, false)
        ;
        ((self.selectSingleSlot).icon):addInputEvent("Mouse_On", "_itemMarket_ShowListOutsideItemSlotToolTip( " .. self.sellInfoItemEnchantKeyRaw .. ", true )")
        ;
        ((self.selectSingleSlot).icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
        local masterInfo = getItemMarketMasterByItemEnchantKey(itemEnchantKeyRaw)
        local marketConditions = (masterInfo:getMinPrice() + masterInfo:getMaxPrice()) / toInt64(0, 2)
        ;
        (ItemMarket.Selected_HighPrice):SetText(replaceCount(sellInfo:getDisplayedHighestOnePrice()))
        ;
        (ItemMarket.Selected_LowPrice):SetText(replaceCount(sellInfo:getDisplayedLowestOnePrice()))
        ;
        (ItemMarket.Selected_AveragePrice_Value):SetText(replaceCount(marketConditions))
        ;
        (ItemMarket.Selected_RecentPrice_Value):SetText(replaceCount(sellInfo:getLastTradedOnePrice()))
        ;
        (ItemMarket.Selected_RegistListCount_Value):SetText(replaceCount(sellInfo:getTradedTotalAmount()))
        ;
        (ItemMarket.Selected_RegistItemCount_Value):SetText(replaceCount(sellInfo:getDisplayedTotalAmount()))
        ;
        (ItemMarket.Selected_HighPrice):addInputEvent("Mouse_On", "_itemMarket_ShowListInSideTooltip( true, 2 )")
        ;
        (ItemMarket.Selected_HighPrice):addInputEvent("Mouse_Out", "_itemMarket_ShowListInSideTooltip( false )")
        ;
        (ItemMarket.Selected_LowPrice):addInputEvent("Mouse_On", "_itemMarket_ShowListInSideTooltip( true, 3 )")
        ;
        (ItemMarket.Selected_LowPrice):addInputEvent("Mouse_Out", "_itemMarket_ShowListInSideTooltip( false )")
        ;
        (ItemMarket.Selected_AveragePrice_Title):addInputEvent("Mouse_On", "_itemMarket_ShowListInSideTooltip( true, 0 )")
        ;
        (ItemMarket.Selected_AveragePrice_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowListInSideTooltip( false )")
        ;
        (ItemMarket.Selected_RecentPrice_Title):addInputEvent("Mouse_On", "_itemMarket_ShowListInSideTooltip( true, 1 )")
        ;
        (ItemMarket.Selected_RecentPrice_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowListInSideTooltip( false )")
        ;
        (ItemMarket.Selected_RegistListCount_Title):addInputEvent("Mouse_On", "_itemMarket_ShowListInSideTooltip( true, 4 )")
        ;
        (ItemMarket.Selected_RegistListCount_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowListInSideTooltip( false )")
        ;
        (ItemMarket.Selected_RegistItemCount_Title):addInputEvent("Mouse_On", "_itemMarket_ShowListInSideTooltip( true, 5 )")
        ;
        (ItemMarket.Selected_RegistItemCount_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowListInSideTooltip( false )")
      end
      -- DECOMPILER ERROR: 4 unprocessed JMP targets
    end
  end
end

local itemMarketSummaryCountCache = 0
local itemInsideItemCountCache = 0
ItemMarket.Update = function(self)
  -- function num : 0_13 , upvalues : itemMarketSummaryCountCache, itemInsideItemCountCache
  if Panel_Window_ItemMarket:GetShow() == false then
    return 
  end
  if self.isSpecialCategory then
    self:SpecialGoodsUpdate()
    return 
  end
  ;
  (self.selectSingleSlot):clearItem()
  for idx = 0, self.itemList_MaxCount - 1 do
  end
  ;
  (self.static_ItemListBG):SetSize(765, 505)
  local itemInfoCount = 0
  local replaceCount = function(num)
    -- function num : 0_13_0
    local count = Int64toInt32(num)
    if count == 0 then
      count = "-"
    else
      count = makeDotMoney(num)
    end
    return count
  end

  ;
  (self.txt_SpecialGoodsName):SetShow(false)
  ;
  (self.txt_SpecialGoodsDesc):SetShow(false)
  if self.isGrouplist then
    local itemMarketSummaryCount = getItemMarketCategorySummaryInClientCount()
    if itemMarketSummaryCount > 0 then
      (self.noSearchResult):SetShow(false)
    else
      ;
      (self.noSearchResult):SetShow(true)
    end
    if itemMarketSummaryCountCache < itemMarketSummaryCount then
      for idx = itemMarketSummaryCountCache, itemMarketSummaryCount - 1 do
        ((self._list2):getElementManager()):pushKey(toInt64(0, idx))
      end
    else
      do
        for idx = itemMarketSummaryCount, itemMarketSummaryCountCache - 1 do
          ((self._list2):getElementManager()):removeKey(toInt64(0, idx))
        end
        do
          do
            itemMarketSummaryCountCache = itemMarketSummaryCount
            ;
            (self._list2):requestUpdateVisible()
            ;
            (self.static_ItemListBG):SetPosY(115)
            ;
            (self._list2):SetShow(true)
            ;
            (self._list2_Inside):SetShow(false)
            ;
            (self._list2_SpecialList):SetShow(false)
            ;
            (self._list2_SpecialList_Inside):SetShow(false)
            ;
            (self.selectedListHeadBG):SetShow(false)
            ;
            (self.static_ListHeadBG):SetShow(true)
            ;
            (self.specialListHeadBG):SetShow(false)
            local selfPlayer = getSelfPlayer()
            local regionInfoWrapper = getRegionInfoWrapper(selfPlayer:getRegionKeyRaw())
            local inMyTerritoryKey = regionInfoWrapper:getTerritoryKeyRaw()
            local itemInsideItemCount = getItemMarketSellInfoInClientCount(inMyTerritoryKey, self.sellInfoItemEnchantKeyRaw)
            Itemmarket_SelectedListHeadBGUpdate()
            if itemInsideItemCountCache < itemInsideItemCount then
              for idx = itemInsideItemCountCache, itemInsideItemCount - 1 do
                ((self._list2_Inside):getElementManager()):pushKey(toInt64(0, idx))
              end
            else
              do
                for idx = itemInsideItemCount, itemInsideItemCountCache - 1 do
                  ((self._list2_Inside):getElementManager()):removeKey(toInt64(0, idx))
                end
                do
                  itemInsideItemCountCache = itemInsideItemCount
                  ;
                  (self._list2_Inside):requestUpdateVisible()
                  ;
                  (self.static_ItemListBG):SetSize(765, 445)
                  ;
                  (self.static_ItemListBG):SetPosY(115)
                  ;
                  (self._list2):SetShow(false)
                  ;
                  (self._list2_Inside):SetShow(true)
                  ;
                  (self._list2_SpecialList):SetShow(false)
                  ;
                  (self._list2_SpecialList_Inside):SetShow(false)
                  ;
                  (self.selectedListHeadBG):SetShow(true)
                  ;
                  (self.static_ListHeadBG):SetShow(false)
                  ;
                  (self.specialListHeadBG):SetShow(false)
                  ;
                  (self.Selected_ItemName):SetShow(true)
                  ;
                  (self.Selected_ItemSlotBG):SetShow(true)
                  ;
                  (self.Selected_ItemSlot):SetShow(true)
                  ;
                  (self.Selected_HighPrice):SetShow(true)
                  ;
                  (self.Selected_LowPrice):SetShow(true)
                  ;
                  (self.Selected_AveragePrice_Title):SetShow(true)
                  ;
                  (self.Selected_AveragePrice_Value):SetShow(true)
                  ;
                  (self.Selected_RecentPrice_Title):SetShow(true)
                  ;
                  (self.Selected_RecentPrice_Value):SetShow(true)
                  ;
                  (self.Selected_RegistListCount_Title):SetShow(true)
                  ;
                  (self.Selected_RegistListCount_Value):SetShow(true)
                  ;
                  (self.Selected_RegistItemCount_Title):SetShow(true)
                  ;
                  (self.Selected_RegistItemCount_Value):SetShow(true)
                end
              end
            end
          end
        end
      end
    end
  end
end

ItemMarket.SetNameColor = function(self, nameColorGrade)
  -- function num : 0_14 , upvalues : UI_color
  local nameColor = nil
  if nameColorGrade == 0 then
    nameColor = UI_color.C_FFFFFFFF
  else
    if nameColorGrade == 1 then
      nameColor = 4284350320
    else
      if nameColorGrade == 2 then
        nameColor = 4283144191
      else
        if nameColorGrade == 3 then
          nameColor = 4294953010
        else
          if nameColorGrade == 4 then
            nameColor = 4294929408
          else
            nameColor = UI_color.C_FFFFFFFF
          end
        end
      end
    end
  end
  return nameColor
end

ItemMarket.SetNameAndEnchantLevel = function(self, enchantLevel, itemType, itemName, itemClassify)
  -- function num : 0_15
  local nameStr = ""
  if itemType == 1 and enchantLevel > 15 then
    nameStr = HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
  else
    if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemClassify then
      nameStr = HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
    else
      nameStr = itemName
    end
  end
  return nameStr
end

local specialCategoryCountCache = 0
local specialInsideCategoryCountCache = 0
ItemMarket.SpecialGoodsUpdate = function(self)
  -- function num : 0_16 , upvalues : specialCategoryCountCache, specialInsideCategoryCountCache
  if Panel_Window_ItemMarket:GetShow() == false then
    return 
  end
  if not self.isSpecialCategory then
    return 
  end
  local replaceCount = function(num)
    -- function num : 0_16_0
    local count = Int64toInt32(num)
    if count == 0 then
      count = "-"
    else
      count = makeDotMoney(num)
    end
    return count
  end

  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  ;
  (self._list2):SetShow(false)
  ;
  (self._list2_Inside):SetShow(false)
  ;
  (self.static_ListHeadBG):SetShow(false)
  ;
  (self.selectedListHeadBG):SetShow(false)
  ;
  (self.specialListHeadBG):SetShow(true)
  if self.isGrouplist then
    self.isSpecialInside = false
    local specialCategoryCount = ToClient_requestGetSummaryCount()
    if specialCategoryCount > 0 then
      (self.noSearchResult):SetShow(false)
    else
      ;
      (self.noSearchResult):SetShow(true)
    end
    if specialCategoryCountCache < specialCategoryCount then
      for idx = specialCategoryCountCache, specialCategoryCount - 1 do
        ((self._list2_SpecialList):getElementManager()):pushKey(toInt64(0, idx))
      end
    else
      do
        for idx = specialCategoryCount, specialCategoryCountCache - 1 do
          ((self._list2_SpecialList):getElementManager()):removeKey(toInt64(0, idx))
        end
        do
          do
            specialCategoryCountCache = specialCategoryCount
            ;
            (self._list2_SpecialList):requestUpdateVisible()
            ;
            (self._list2_SpecialList):SetShow(true)
            ;
            (self._list2_SpecialList_Inside):SetShow(false)
            ;
            (self.static_ItemListBG):SetPosY(173)
            ;
            (self.static_ItemListBG):SetSize(765, 445)
            self.isSpecialInside = true
            local specialInsideCategoryCount = ToClient_requestGetItemCountByItemEnchantKeyRaw(self.specialItemEnchantKeyRaw)
            if specialInsideCategoryCountCache < specialInsideCategoryCount then
              for idx = specialInsideCategoryCountCache, specialInsideCategoryCount - 1 do
                ((self._list2_SpecialList_Inside):getElementManager()):pushKey(toInt64(0, idx))
              end
            else
              do
                for idx = specialInsideCategoryCount, specialInsideCategoryCountCache - 1 do
                  ((self._list2_SpecialList_Inside):getElementManager()):removeKey(toInt64(0, idx))
                end
                do
                  do
                    specialInsideCategoryCountCache = specialInsideCategoryCount
                    ;
                    (self._list2_SpecialList_Inside):requestUpdateVisible()
                    ;
                    (self._list2_SpecialList):SetShow(false)
                    ;
                    (self._list2_SpecialList_Inside):SetShow(true)
                    ;
                    (self.static_ItemListBG):SetPosY(120)
                    ;
                    (self.static_ItemListBG):SetSize(765, 440)
                    if self.isSpecialInside then
                      (self.selectedListHeadBG):SetShow(true)
                      ;
                      (self.specialListHeadBG):SetShow(false)
                      ;
                      (self.Selected_ItemName):SetShow(true)
                      ;
                      (self.Selected_ItemSlotBG):SetShow(true)
                      ;
                      (self.Selected_ItemSlot):SetShow(true)
                      ;
                      (self.Selected_HighPrice):SetShow(true)
                      ;
                      (self.Selected_LowPrice):SetShow(true)
                      ;
                      (self.Selected_dash):SetShow(true)
                      ;
                      (self.Selected_AveragePrice_Title):SetShow(false)
                      ;
                      (self.Selected_AveragePrice_Value):SetShow(false)
                      ;
                      (self.Selected_RecentPrice_Title):SetShow(false)
                      ;
                      (self.Selected_RecentPrice_Value):SetShow(false)
                      ;
                      (self.Selected_RegistListCount_Title):SetShow(false)
                      ;
                      (self.Selected_RegistListCount_Value):SetShow(false)
                      ;
                      (self.Selected_RegistItemCount_Title):SetShow(false)
                      ;
                      (self.Selected_RegistItemCount_Value):SetShow(false)
                    else
                      ;
                      (self.specialListHeadBG):SetShow(true)
                      ;
                      (self.Selected_ItemName):SetShow(false)
                      ;
                      (self.Selected_ItemSlotBG):SetShow(false)
                      ;
                      (self.Selected_ItemSlot):SetShow(false)
                      ;
                      (self.Selected_HighPrice):SetShow(false)
                      ;
                      (self.Selected_LowPrice):SetShow(false)
                      ;
                      (self.Selected_dash):SetShow(false)
                      ;
                      (self.Selected_AveragePrice_Title):SetShow(false)
                      ;
                      (self.Selected_AveragePrice_Value):SetShow(false)
                      ;
                      (self.Selected_RecentPrice_Title):SetShow(false)
                      ;
                      (self.Selected_RecentPrice_Value):SetShow(false)
                      ;
                      (self.Selected_RegistListCount_Title):SetShow(false)
                      ;
                      (self.Selected_RegistListCount_Value):SetShow(false)
                      ;
                      (self.Selected_RegistItemCount_Title):SetShow(false)
                      ;
                      (self.Selected_RegistItemCount_Value):SetShow(false)
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

ItemMarket.SetPosition = function(self)
  -- function num : 0_17
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_ItemMarket:GetSizeX()
  local panelSizeY = Panel_Window_ItemMarket:GetSizeY()
  Panel_Window_ItemMarket:SetPosX(scrSizeX / 2 - panelSizeX / 2 - 80)
  Panel_Window_ItemMarket:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

_itemMarket_doSortList = function(sortTarget, sortValue, isResetScroll)
  -- function num : 0_18 , upvalues : ItemMarket
  local self = ItemMarket
  local isNum = 0
  if sortValue == true then
    isNum = 1
  end
  selectSort(sortTarget, isNum)
  self:Update()
end

_itemMarket_ChangeTextureBySort = function(control, sortTarget, sortValue)
  -- function num : 0_19 , upvalues : ItemMarket, _sortTexture
  local self = ItemMarket
  if sortValue == true then
    sortValue = 0
  else
    sortValue = 1
  end
  control:ChangeTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/ItemMarket_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, (((_sortTexture[sortTarget])[sortValue])[0])[1], (((_sortTexture[sortTarget])[sortValue])[0])[2], (((_sortTexture[sortTarget])[sortValue])[0])[3], (((_sortTexture[sortTarget])[sortValue])[0])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
  local x1, y1, x2, y2 = setTextureUV_Func(control, (((_sortTexture[sortTarget])[sortValue])[1])[1], (((_sortTexture[sortTarget])[sortValue])[1])[2], (((_sortTexture[sortTarget])[sortValue])[1])[3], (((_sortTexture[sortTarget])[sortValue])[1])[4])
  ;
  (control:getOnTexture()):setUV(x1, y1, x2, y2)
  local x1, y1, x2, y2 = setTextureUV_Func(control, (((_sortTexture[sortTarget])[sortValue])[2])[1], (((_sortTexture[sortTarget])[sortValue])[2])[2], (((_sortTexture[sortTarget])[sortValue])[2])[3], (((_sortTexture[sortTarget])[sortValue])[2])[4])
  ;
  (control:getClickTexture()):setUV(x1, y1, x2, y2)
end

_itemMarket_ShowListOutsideItemSlotToolTip = function(idx, isSelected)
  -- function num : 0_20 , upvalues : ItemMarket
  local self = ItemMarket
  local itemStaticStatus = nil
  if idx == nil then
    _itemMarket_HideToolTip()
    return 
  end
  local control = self._list2
  local contents = control:GetContentByKey(toInt64(0, idx))
  if contents ~= nil then
    local itemIcon = (UI.getChildControl)(contents, "Template_Static_Slot")
    if isSelected == nil then
      local itemMarketSummaryInfo = getItemMarketCategorySummaryInClientByIndex(idx)
      itemStaticStatus = itemMarketSummaryInfo:getItemEnchantStaticStatusWrapper()
      UiBase = itemIcon
      Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil, nil, true)
    end
  end
  do
    do
      if isSelected == true then
        local summaryInfo = getItemMarketSummaryInClientByItemEnchantKey(self.sellInfoItemEnchantKeyRaw)
        itemStaticStatus = summaryInfo:getItemEnchantStaticStatusWrapper()
        UiBase = (self.selectSingleSlot).icon
        Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil, nil, true)
      end
      local controlInside = self._list2_Inside
      local contentsInside = controlInside:GetContentByKey(toInt64(0, idx))
      if contentsInside ~= nil then
        local itemIcon = (UI.getChildControl)(contentsInside, "Template_Static_Slot")
        if isSelected == false then
          local sellInfo = getItemMarketSellInfoInClientByIndex(self.curTerritoryKeyRaw, self.sellInfoItemEnchantKeyRaw, idx)
          itemWrapper = sellInfo:getItemWrapper()
          UiBase = itemIcon
          Panel_Tooltip_Item_Show(itemWrapper, UiBase, false, true, nil, nil, true)
        end
      end
    end
  end
end

_specialGoods_ShowToolTip = function(idx)
  -- function num : 0_21 , upvalues : ItemMarket
  local self = ItemMarket
  if idx == nil then
    return 
  end
  local itemStaticStatus = (ToClient_requestGetItemEnchantStaticStatusWrapperByIndex(idx))
  local UiBase = nil
  local controlSpecial = self._list2_SpecialList
  local contentsSpecial = controlSpecial:GetContentByKey(toInt64(0, idx))
  if contentsSpecial ~= nil and itemStaticStatus ~= nil then
    local itemIcon = (UI.getChildControl)(contentsSpecial, "Template_Static_Slot")
    UiBase = itemIcon
    Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil, nil, true)
  end
end

_specialGoodsSingle_ShowToolTip = function(enchantKey, idx)
  -- function num : 0_22 , upvalues : ItemMarket
  local self = ItemMarket
  if enchantKey == nil then
    return 
  end
  local itemStaticStatus = (getItemEnchantStaticStatus(ItemEnchantKey(enchantKey)))
  local UiBase = nil
  if idx ~= nil then
    local controlSpecial_Inside = self._list2_SpecialList_Inside
    local contentsSpecial_Inside = controlSpecial_Inside:GetContentByKey(toInt64(0, idx))
    if contentsSpecial_Inside ~= nil then
      local itemIcon = (UI.getChildControl)(contentsSpecial_Inside, "Template_Static_Slot")
      if itemStaticStatus ~= nil then
        UiBase = itemIcon
        Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil, nil, true)
      end
    end
  else
    do
      if itemStaticStatus ~= nil then
        UiBase = (self.selectSingleSlot).icon
        Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil, nil, true)
      end
    end
  end
end

_itemMarket_HideToolTip = function()
  -- function num : 0_23
  Panel_Tooltip_Item_hideTooltip()
end

ItemMarket_SelectedItemNameTooltip = function(isShow, itemName, idx, tipType)
  -- function num : 0_24 , upvalues : ItemMarket
  local self = ItemMarket
  local name, desc, control = nil, nil, nil
  if itemName == nil then
    TooltipSimple_Hide()
    return 
  end
  if tipType == nil then
    name = itemName
    control = self.Selected_ItemName
  else
    if tipType == 0 then
      local contents = (self._list2):GetContentByKey(toInt64(0, idx))
      if contents ~= nil then
        local _txt_itemName = (UI.getChildControl)(contents, "Template_StaticText_ItemName")
        name = itemName
        control = _txt_itemName
      end
    else
      do
        if tipType == 1 then
          local contents = (self._list2_Inside):GetContentByKey(toInt64(0, idx))
          if contents ~= nil then
            local _txt_itemName = (UI.getChildControl)(contents, "Template_StaticText_SingleItemName")
            name = itemName
            control = _txt_itemName
          end
        end
        do
          if isShow == true then
            TooltipSimple_Show(control, name, desc)
          else
            TooltipSimple_Hide()
          end
        end
      end
    end
  end
end

_itemMarket_ShowListOutSideTooltip = function(isShow, iconType, uiIdx)
  -- function num : 0_25 , upvalues : ItemMarket
  local self = ItemMarket
  if uiIdx == nil then
    TooltipSimple_Hide()
    return 
  end
  local control = self._list2
  local contents = control:GetContentByKey(toInt64(0, uiIdx))
  if contents ~= nil then
    local itemlist_AveragePrice_Title = (UI.getChildControl)(contents, "Template_StaticText_AveragePrice_Title")
    local itemlist_RecentPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RecentPrice_Title")
    local itemlist_RegistHighPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistHighPrice_Title")
    local itemlist_RegistLowPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistLowPrice_Title")
    local itemlist_RegistListCount_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistListCount_Title")
    local itemlist_RegistItemCount_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistItemCount_Title")
    if iconType == 0 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_AVG_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_AVG_DESC")
      uiControl = itemlist_AveragePrice_Title
    else
      if iconType == 1 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_RECENT_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_RECENT_DESC")
        uiControl = itemlist_RecentPrice_Title
        local itemMarketSummaryInfo = nil
        if uiIdx == nil then
          itemMarketSummaryInfo = getItemMarketSummaryInClientByItemEnchantKey(self.sellInfoItemEnchantKeyRaw)
        else
          itemMarketSummaryInfo = getItemMarketSummaryInClientByIndex(self.curItemClassify, uiIdx)
        end
        if itemMarketSummaryInfo ~= nil and Int64toInt32(itemMarketSummaryInfo:getLastTradedUtc()) > 0 then
          local lastTradeTime = getTimeYearMonthDayHourMinSecByTTime64(itemMarketSummaryInfo:getLastTradedUtc())
          desc = desc .. "\n" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_RECENT_TRADETIME", "time", tostring(lastTradeTime))
        end
      else
        do
          if iconType == 2 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTHIGHPRICE_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTHIGHPRICE_DESC")
            uiControl = itemlist_RegistHighPrice_Title
          else
            if iconType == 3 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLOWPRICE_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLOWPRICE_DESC")
              uiControl = itemlist_RegistLowPrice_Title
            else
              if iconType == 4 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLISTCOUNT_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLISTCOUNT_DESC")
                uiControl = itemlist_RegistListCount_Title
              else
                if iconType == 5 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTITEMCOUNT_NAME")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTITEMCOUNT_DESC")
                  uiControl = itemlist_RegistItemCount_Title
                end
              end
            end
          end
          if isShow == true then
            TooltipSimple_Show(uiControl, name, desc)
          else
            TooltipSimple_Hide()
          end
        end
      end
    end
  end
end

ItemMarket_FavoriteItemTooltip = function(isShow)
  -- function num : 0_26 , upvalues : ItemMarket
  local self = ItemMarket
  if isShow then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_FAVORITEBTN_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_FAVORITEBTN_DESC")
    TooltipSimple_Show(self.btn_FavoriteOnOff, name, desc)
  else
    TooltipSimple_Hide()
  end
end

_itemMarket_ShowSpecialListOutSideTooltip = function(isShow, iconType, uiIdx)
  -- function num : 0_27 , upvalues : ItemMarket
  local self = ItemMarket
  if uiIdx == nil then
    TooltipSimple_Hide()
    return 
  end
  local control = self._list2_SpecialList
  local contents = control:GetContentByKey(toInt64(0, uiIdx))
  if contents ~= nil then
    local itemlist_RegistHighPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistHighPrice_Title")
    local itemlist_RegistLowPrice_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistLowPrice_Title")
    local itemlist_RegistListCount_Title = (UI.getChildControl)(contents, "Template_StaticText_RegistListCount_Title")
    if iconType == 2 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTHIGHPRICE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTHIGHPRICE_DESC")
      uiControl = itemlist_RegistHighPrice_Title
    else
      if iconType == 3 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLOWPRICE_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLOWPRICE_DESC")
        uiControl = itemlist_RegistLowPrice_Title
      else
        if iconType == 4 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTITEMCOUNT_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTITEMCOUNT_DESC")
          uiControl = itemlist_RegistListCount_Title
        end
      end
    end
    if isShow == true then
      TooltipSimple_Show(uiControl, name, desc)
    else
      TooltipSimple_Hide()
    end
  end
end

_itemMarket_ShowListInSideTooltip = function(isShow, iconType)
  -- function num : 0_28 , upvalues : ItemMarket
  local self = ItemMarket
  if iconType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_AVG_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_AVG_DESC")
    uiControl = self.Selected_AveragePrice_Title
  else
    if iconType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_RECENT_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_RECENT_DESC")
      uiControl = self.Selected_RecentPrice_Title
      local itemMarketSummaryInfo = nil
      itemMarketSummaryInfo = getItemMarketSummaryInClientByItemEnchantKey(self.sellInfoItemEnchantKeyRaw)
      if itemMarketSummaryInfo ~= nil and Int64toInt32(itemMarketSummaryInfo:getLastTradedUtc()) > 0 then
        local lastTradeTime = getTimeYearMonthDayHourMinSecByTTime64(itemMarketSummaryInfo:getLastTradedUtc())
        desc = desc .. "\n" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_RECENT_TRADETIME", "time", tostring(lastTradeTime))
      end
    else
      do
        if iconType == 2 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTHIGHPRICE_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTHIGHPRICE_DESC")
          uiControl = self.Selected_HighPrice
        else
          if iconType == 3 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLOWPRICE_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLOWPRICE_DESC")
            uiControl = self.Selected_LowPrice
          else
            if iconType == 4 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLISTCOUNT_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLISTCOUNT_DESC")
              uiControl = self.Selected_RegistListCount_Title
            else
              if iconType == 5 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTITEMCOUNT_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTITEMCOUNT_DESC")
                uiControl = self.Selected_RegistItemCount_Title
              end
            end
          end
        end
        if isShow == true then
          TooltipSimple_Show(uiControl, name, desc)
        else
          TooltipSimple_Hide()
        end
      end
    end
  end
end

_itemMarket_ShowIconToolTip = function(isShow, iconType)
  -- function num : 0_29 , upvalues : ItemMarket
  local self = ItemMarket
  if iconType == 13 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_AVGTRADEITEM_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_AVGTRADEITEM_DESC")
    uiControl = self.btn_Sort_AverageTradePrice
  else
    if iconType == 14 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_RECENTREGISTDATE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_RECENTREGISTDATE_DESC")
      uiControl = self.btn_Sort_RecentRegistDate
    else
      if iconType == 15 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_BACKPAGE_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_BACKPAGE_DESC")
        uiControl = self.btn_BackPage
      end
    end
  end
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

_itemMarket_MoneyToolTip = function(isShow, tipType)
  -- function num : 0_30 , upvalues : ItemMarket
  local self = ItemMarket
  if isShow == true then
    if tipType == 0 then
      (self.invenDesc):SetShow(true)
    else
      if tipType == 1 then
        (self.warehouseDesc):SetShow(true)
      end
    end
  else
    ;
    (self.invenDesc):SetShow(false)
    ;
    (self.warehouseDesc):SetShow(false)
  end
end

_itemMarket_Search = function()
  -- function num : 0_31 , upvalues : ItemMarket
  local self = ItemMarket
  local text = (self.edit_ItemName):GetEditText()
  if text == nil or text == "" or PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") == text then
    return 
  end
  self.txt_ItemNameBackPage = text
  searchFilteredVectorByName(text)
  self.isSearch = true
  self:Update()
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
end

FGlobal_FavoriteItem_Search = function(text, enchantKey)
  -- function num : 0_32 , upvalues : ItemMarket
  local self = ItemMarket
  self.isSelectItem = false
  if ((string.find)(text, PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_16")) ~= nil or (string.find)(text, PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_17")) ~= nil or (string.find)(text, PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_18")) ~= nil or (string.find)(text, PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_19")) ~= nil or (string.find)(text, PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_20")) ~= nil) and enchantKey ~= 0 then
    HandleClicked_ItemMarket_GroupItem(0, enchantKey)
    ;
    (self.edit_ItemName):SetEditText("")
    return 
  end
  self.txt_ItemNameBackPage = text
  HandleClicked_ItemMarket_AllCategory()
  searchFilteredVectorByName(text)
  self.isSearch = true
  self:Update()
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
  ;
  (self.edit_ItemName):SetEditText(text, false)
end

_itemMarket_FavoriteItemRegist = function()
  -- function num : 0_33 , upvalues : ItemMarket
  local self = ItemMarket
  local text = ""
  if self.isSpecialCategory then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_SPECIALITEMNOTREGIST"))
    return 
  end
  if self.isSelectItem then
    text = (self.Selected_ItemName):GetText()
    ;
    (self.edit_ItemName):SetEditText(text)
    FGlobal_ItemMarket_FavoriteItem_Regist(text, self.sellInfoItemEnchantKeyRaw)
    self.isSelectItem = false
    return 
  else
    if (self.Selected_ItemName):GetShow() then
      text = (self.edit_ItemName):GetEditText()
    end
  end
  if text == nil or text == "" or PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") == text then
    return 
  end
  local itemMarketSummaryCount = getItemMarketCategorySummaryInClientCount()
  if itemMarketSummaryCount > 0 then
    FGlobal_ItemMarket_FavoriteItem_Regist(text, nil)
    self.isSelectItem = false
  end
end

_itemMarket_SpecialSearch = function()
  -- function num : 0_34 , upvalues : ItemMarket
  local self = ItemMarket
  local text = (self.edit_SpecialItemName):GetEditText()
  if text == nil or text == "" or PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") == text then
    return 
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.self).txt_SpecialItemNameBackPage = text
  ToClient_requestSearchByName(text)
  self.isSearch = true
  self:SpecialGoodsUpdate()
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
end

HandleClicked_ItemMarket_SetAlarm = function(itemEnchantKeyRaw, uiPoolIdx)
  -- function num : 0_35 , upvalues : ItemMarket
  local self = ItemMarket
  local totalItemCount = toClient_GetItemMarketFavoriteItemListSize()
  if itemEnchantKeyRaw ~= nil then
    local UiBase = (self.itemGroupUiPool)[uiPoolIdx]
    local clickItem_SSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKeyRaw))
    if clickItem_SSW == nil then
      return 
    end
    local clickItem_enchantLevel = ((clickItem_SSW:get())._key):getEnchantLevel()
    for index = 0, totalItemCount - 1 do
      local enchantItemKey = toClient_GetItemMarketFavoriteItem(index)
      local itemSSW = getItemEnchantStaticStatus(enchantItemKey)
      local itemkey = ((itemSSW:get())._key):getItemKey()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      if itemEnchantKeyRaw == enchantItemKey:get() and enchantLevel == clickItem_enchantLevel then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ALREADYREGIST"))
        return 
      end
    end
    if uiPoolIdx ~= nil and (UiBase.icon_RegistAlarm):IsCheck() then
      toClient_EraseItemMarketFavoriteItem(itemEnchantKeyRaw)
    else
      toClient_AddItemMarketFavoriteItem(itemEnchantKeyRaw)
    end
    toClient_SaveItemMarketFavoriteItem()
    local clickItem_SSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKeyRaw))
    if clickItem_SSW == nil then
      return 
    end
    local itemName = clickItem_SSW:getName()
    local enchantLevel = ((clickItem_SSW:get())._key):getEnchantLevel()
    local isCash = (clickItem_SSW:get()):isCash()
    local strParam1 = ""
    if enchantLevel > 0 and clickItem_SSW:getItemClassify() ~= 4 then
      strParam1 = "+" .. enchantLevel .. " " .. itemName
    end
    if enchantLevel >= 16 then
      local enchantString = ""
      if enchantLevel == 16 then
        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
      else
        if enchantLevel == 17 then
          enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
        else
          if enchantLevel == 18 then
            enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
          else
            if enchantLevel == 19 then
              enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
            else
              if enchantLevel == 20 then
                enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
              end
            end
          end
        end
      end
      strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
    else
      do
        if enchantLevel > 0 and enchantLevel < 16 and clickItem_SSW:getItemClassify() ~= 4 then
          if isCash == true then
            strParam1 = itemName
          else
            strParam1 = "+" .. enchantLevel .. " " .. itemName
          end
        else
          if clickItem_SSW:getItemClassify() == 4 then
            local enchantString = ""
            if enchantLevel == 1 then
              enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
            else
              if enchantLevel == 2 then
                enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
              else
                if enchantLevel == 3 then
                  enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
                else
                  if enchantLevel == 4 then
                    enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
                  else
                    if enchantLevel == 5 then
                      enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                    end
                  end
                end
              end
            end
            if enchantLevel == 0 then
              strParam1 = itemName
            else
              strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
            end
          else
            do
              strParam1 = itemName
              Proc_ShowMessage_Ack(strParam1 .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ALARMREGISTCOMPLETE"))
            end
          end
        end
      end
    end
  end
end

HandleClicked_ItemMarket_GroupItem = function(itemIdx, itemEnchantKeyRaw)
  -- function num : 0_36 , upvalues : ItemMarket, isPreBidOpen
  do
    local self = ItemMarket
    if ToClient_WorldMapIsShow() or ToClient_CheckExistSummonMaid() or ItemMarket.escMenuSaveValue then
      requestItemMarketSellInfo(self.curTerritoryKeyRaw, itemEnchantKeyRaw, true)
    else
      requestItemMarketSellInfo(self.curTerritoryKeyRaw, itemEnchantKeyRaw, false)
    end
    self.isGrouplist = false
    self.sellInfoItemEnchantKeyRaw = itemEnchantKeyRaw
    self.curSummaryItemIndex = itemIdx
    self:Update()
    ;
    (self.btn_BackPage):SetShow(true)
    ;
    (self.btn_BackPage):SetPosX(210)
    ;
    (self.btn_BackPage):SetPosY(564)
    ;
    (self.btn_BackPage):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_ItemMarketBackPage()")
    ;
    (self.btn_SetAlarm):SetShow(true)
    ;
    (self.btn_SetPreBid):SetShow((not self.isWorldMapOpen and isPreBidOpen))
    ;
    (self.btn_Refresh):SetShow(true)
    ;
    (self.btn_BidDesc):SetSize(135, 32)
    ;
    (self.btn_InMarketRegist):SetShow(false)
    if isGameTypeRussia() then
      (self.btn_SetAlarm):SetSize(235, 32)
      ;
      (self.btn_SetAlarm):SetPosX(740)
      ;
      (self.btn_SetAlarm):SetPosY(564)
      ;
      (self.btn_SetPreBid):SetSize(235, 32)
      ;
      (self.btn_SetPreBid):SetPosX(740)
      ;
      (self.btn_SetPreBid):SetPosY(600)
      ;
      (self.btn_Refresh):SetSize(135, 32)
      ;
      (self.btn_BidDesc):SetSize(235, 32)
      ;
      (self.btn_BidDesc):SetPosX(740)
      ;
      (self.btn_Refresh):SetPosX((self.btn_BackPage):GetPosX() + (self.btn_BackPage):GetSizeX() + 5)
      ;
      (self.btn_Refresh):SetPosY(564)
    else
      (self.btn_SetAlarm):SetSize(135, 32)
      ;
      (self.btn_SetAlarm):SetPosX(830)
      ;
      (self.btn_SetAlarm):SetPosY(564)
      ;
      (self.btn_SetPreBid):SetSize(135, 32)
      ;
      (self.btn_SetPreBid):SetPosX(830)
      ;
      (self.btn_SetPreBid):SetPosY(600)
      ;
      (self.btn_Refresh):SetSize(135, 32)
      ;
      (self.btn_BidDesc):SetSize(135, 32)
      ;
      (self.btn_BidDesc):SetPosX(830)
      ;
      (self.btn_BidDesc):SetPosY(635)
      ;
      (self.btn_Refresh):SetPosX((self.btn_BackPage):GetPosX() + (self.btn_BackPage):GetSizeX() + 5)
      ;
      (self.btn_Refresh):SetPosY(564)
    end
    ;
    (self.btn_SetAlarm):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SetAlarm( " .. itemEnchantKeyRaw .. " )")
    ;
    (self.btn_SetPreBid):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketPreBid_Open( " .. itemEnchantKeyRaw .. ", 0 )")
    if Panel_Tooltip_Item:GetShow() or Panel_Tooltip_Item_equipped:GetShow() or Panel_Tooltip_SimpleText:GetShow() then
      Panel_Tooltip_Item_hideTooltip()
      TooltipSimple_Hide()
    end
    self.isSelectItem = true
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

HandleClicked_SpecialGoods_GroupItem = function(itemIdx, itemEnchantKeyRaw)
  -- function num : 0_37 , upvalues : ItemMarket
  local self = ItemMarket
  if not ToClient_WorldMapIsShow() and not ToClient_CheckExistSummonMaid() then
    local isIgnoreNpc = ItemMarket.escMenuSaveValue
  end
  ToClient_requestListSellInfo(isIgnoreNpc)
  self.isGrouplist = false
  self.isSpecialInside = true
  self.specialItemEnchantKeyRaw = itemEnchantKeyRaw
  self.curSpecialItemIndex = itemIdx
  self:SpecialGoodsUpdate()
  Itemmarket_SelectedListHeadBGUpdate()
  ;
  (self.btn_BackPage):SetShow(true)
  if isGameTypeRussia() then
    (self.btn_SetAlarm):SetSize(235, 32)
    ;
    (self.btn_SetPreBid):SetSize(135, 32)
    ;
    (self.btn_Refresh):SetSize(135, 32)
    ;
    (self.btn_BidDesc):SetSize(235, 32)
  else
    ;
    (self.btn_SetAlarm):SetSize(135, 32)
    ;
    (self.btn_SetPreBid):SetSize(135, 32)
    ;
    (self.btn_Refresh):SetSize(135, 32)
  end
  ;
  (self.btn_SetAlarm):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SetAlarm( " .. itemEnchantKeyRaw .. " )")
  ;
  (self.btn_SetPreBid):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketPreBid_Open( " .. itemEnchantKeyRaw .. ", 0 )")
  if Panel_Tooltip_Item:GetShow() or Panel_Tooltip_Item_equipped:GetShow() or Panel_Tooltip_SimpleText:GetShow() then
    Panel_Tooltip_Item_hideTooltip()
    TooltipSimple_Hide()
  end
end

HandleClicked_ItemMarket_SingleItem = function(slotidx, itemEnchantKeyRaw, isBidding)
  -- function num : 0_38 , upvalues : ItemMarket
  local self = ItemMarket
  local itemCount = self._registerCount
  self.buyItemKeyraw = itemEnchantKeyRaw
  self.buyItemSlotidx = slotidx
  local sellInfo = getItemMarketSellInfoInClientByIndex(self.curTerritoryKeyRaw, self.sellInfoItemEnchantKeyRaw, slotidx)
  local masterInfo = getItemMarketMasterByItemEnchantKey(itemEnchantKeyRaw)
  local itemName = ""
  local itemBuyCount = sellInfo:getCount()
  if isBidding == true then
    itemBuyCount = 1
  end
  local sumSinglePrice = sellInfo:getTotalPrice() / sellInfo:getCount()
  if masterInfo ~= nil then
    itemName = (masterInfo:getItemEnchantStaticStatusWrapper()):getName()
  end
  if Int64toInt32(itemBuyCount) == 1 then
    if isItemMarketSecureCode() == true then
      FGlobal_ItemMarket_BuyConfirm_Open(itemName, itemBuyCount, true, sumSinglePrice)
    else
      local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_MESSAGEBOX_ALERT")
      local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_MESSAGEBOX_BUYCONFIRM", "itemName", itemName)
      local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = ItemMarket_SingleItemBuy, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  else
    do
      FGlobal_ItemMarket_BuyConfirm_Open(itemName, itemBuyCount, false, sumSinglePrice)
    end
  end
end

ItemMarket_SingleItemBuy = function()
  -- function num : 0_39
  FGlobal_HandleClicked_ItemMarket_SingleItem_Do(1)
end

local isOpenByMaid = false
ItemMarket_UpdateMoneyByWarehouse = function()
  -- function num : 0_40 , upvalues : ItemMarket, isOpenByMaid
  local self = ItemMarket
  ;
  (self.invenMoney):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  (self.warehouseMoney):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_WAREHOUSE_HAVE_MONEY"))
  ;
  (self.warehouseMoney):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  if isOpenByMaid then
    local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    if regionInfo == nil then
      return 
    end
    local myAffiliatedTownRegionKey = regionInfo:getAffiliatedTownRegionKey()
    ;
    (self.warehouseMoney):SetText(makeDotMoney(warehouse_moneyFromRegionKey_s64(myAffiliatedTownRegionKey)))
  end
end

FGlobal_HandleClicked_ItemMarket_SingleItem_Do = function(itemCount)
  -- function num : 0_41 , upvalues : ItemMarket
  local self = ItemMarket
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  if (self.warehouseMoneyTit):IsCheck() then
    fromWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  if dialog_isTalking() == false then
    local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    if regionInfo == nil then
      return 
    end
    if checkMaid_SubmitMarket(true) then
      requestBuyItemForItemMarketByMaid(fromWhereType, self.buyItemKeyraw, self.buyItemSlotidx, itemCount)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_COOLTIME"))
      return 
    end
  else
    do
      requestBuyItemForItemMarket(fromWhereType, self.buyItemKeyraw, self.buyItemSlotidx, itemCount)
      if Panel_Window_ItemMarket_BuyConfirm:IsShow() then
        FGlobal_ItemMarket_BuyConfirm_Close()
      end
    end
  end
end

local _specialGoodsIndex, _specialGoodsEnchantKeyRaw = nil, nil
HandleClicked_ItemMarket_SpecialItem = function(index, enchantKeyRaw)
  -- function num : 0_42 , upvalues : ItemMarket, _specialGoodsIndex, _specialGoodsEnchantKeyRaw
  local self = ItemMarket
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  if (self.warehouseMoneyTit):IsCheck() then
    fromWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  if ToClient_CheckExistSummonMaid() then
    local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    if regionInfo == nil then
      return 
    end
    if checkMaid_SubmitMarket(true) then
      ToClient_requestBuyItemAtItemMarketByPartyByMaid(fromWhereType, enchantKeyRaw, index)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_COOLTIME"))
      return 
    end
  else
    do
      ToClient_requestBuyItemAtItemMarketByParty(fromWhereType, enchantKeyRaw, index)
      self.isSpecialInside = true
      ;
      (self._list2_SpecialList):SetShow(false)
      ;
      (self._list2_SpecialList_Inside):SetShow(true)
      _specialGoodsIndex = self.curSpecialItemIndex
      _specialGoodsEnchantKeyRaw = enchantKeyRaw
    end
  end
end

FromClient_notifyItemMarketMessage = function(msgType, strParam1, param1, param2, param3, param4)
  -- function num : 0_43 , upvalues : ItemMarket
  local self = ItemMarket
  if msgType == 0 then
    if param1 == 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCOMPLETEITEM"))
    else
      if param1 == 1 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYBIDDINGITEM"))
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCOMPLETEITEM"))
      end
    end
  else
    if msgType == 1 then
      local territoryNameArray = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")), [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")), [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")), [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6"))}
      if param2 < 0 or param2 > 6 then
        return 
      end
      local territoryName = territoryNameArray[param2]
      local issw = getItemEnchantStaticStatus(ItemEnchantKey(param1))
      if issw == nil then
        return 
      end
      local itemName = issw:getName()
      local enchantLevel = ((issw:get())._key):getEnchantLevel()
      local isCash = (issw:get()):isCash()
      if enchantLevel > 0 and issw:getItemClassify() ~= 4 then
        strParam1 = "+" .. enchantLevel .. " " .. itemName
      end
      if enchantLevel >= 16 then
        local enchantString = ""
        if enchantLevel == 16 then
          enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
        else
          if enchantLevel == 17 then
            enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
          else
            if enchantLevel == 18 then
              enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
            else
              if enchantLevel == 19 then
                enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
              else
                if enchantLevel == 20 then
                  enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                end
              end
            end
          end
        end
        strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
      else
        do
          if enchantLevel > 0 and enchantLevel < 16 and issw:getItemClassify() ~= 4 then
            if isCash == true then
              strParam1 = itemName
            else
              strParam1 = "+" .. enchantLevel .. " " .. itemName
            end
          else
            if issw:getItemClassify() == 4 then
              local enchantString = ""
              if enchantLevel == 1 then
                enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
              else
                if enchantLevel == 2 then
                  enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
                else
                  if enchantLevel == 3 then
                    enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
                  else
                    if enchantLevel == 4 then
                      enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
                    else
                      if enchantLevel == 5 then
                        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                      end
                    end
                  end
                end
              end
              if enchantLevel == 0 then
                strParam1 = itemName
              else
                strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
              end
            else
              do
                strParam1 = itemName
                local subStr = nil
                if param4 then
                  subStr = "LUA_ITEMMARKET_REGIST_ITEMMARKET"
                else
                  subStr = "LUA_ITEMMARKET_STANDBY_ITEMMARKET"
                end
                do
                  local message = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NOTIFYITEMMARKETMSG_MAIN", "strParam1", strParam1, "param3", makeDotMoney(param3)), sub = PAGetString(Defines.StringSheet_GAME, subStr)}
                  Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 19)
                  if msgType == 2 then
                    local message = ""
                    if param2 == 1 then
                      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLITEM", "strParam1", strParam1, "param1", param1)
                    else
                      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLITEMONE", "strParam1", strParam1)
                    end
                    Proc_ShowMessage_Ack(message)
                  else
                    do
                      if msgType == 3 then
                        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_AFTERREGIST_ACK"))
                      else
                        if msgType == 4 then
                          self:Update()
                        else
                          if msgType == 5 then
                            local issw = getItemEnchantStaticStatus(ItemEnchantKey(param1))
                            if issw == nil then
                              return 
                            end
                            local itemName = issw:getName()
                            local enchantLevel = ((issw:get())._key):getEnchantLevel()
                            FGlobal_ItemMarketAlarm_Open(ItemEnchantKey(param1))
                            _PA_LOG("유흥�\160", " ItemMarket �\128�\172 아이�\156 메세�\128 응답 처리 " .. itemName .. " " .. tostring(enchantLevel))
                          else
                            do
                              if msgType == 6 then
                                local issw = getItemEnchantStaticStatus(ItemEnchantKey(param1))
                                if issw == nil then
                                  return 
                                end
                                local itemName = issw:getName()
                                local enchantLevel = ((issw:get())._key):getEnchantLevel()
                                local isCash = (issw:get()):isCash()
                                if enchantLevel > 0 and issw:getItemClassify() ~= 4 then
                                  strParam1 = "+" .. enchantLevel .. " " .. itemName
                                end
                                if enchantLevel >= 16 then
                                  local enchantString = ""
                                  if enchantLevel == 16 then
                                    enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
                                  else
                                    if enchantLevel == 17 then
                                      enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
                                    else
                                      if enchantLevel == 18 then
                                        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
                                      else
                                        if enchantLevel == 19 then
                                          enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
                                        else
                                          if enchantLevel == 20 then
                                            enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                                          end
                                        end
                                      end
                                    end
                                  end
                                  strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
                                else
                                  do
                                    if enchantLevel > 0 and enchantLevel < 16 and issw:getItemClassify() ~= 4 then
                                      if isCash == true then
                                        strParam1 = itemName
                                      else
                                        strParam1 = "+" .. enchantLevel .. " " .. itemName
                                      end
                                    else
                                      if issw:getItemClassify() == 4 then
                                        local enchantString = ""
                                        if enchantLevel == 1 then
                                          enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
                                        else
                                          if enchantLevel == 2 then
                                            enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
                                          else
                                            if enchantLevel == 3 then
                                              enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
                                            else
                                              if enchantLevel == 4 then
                                                enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
                                              else
                                                if enchantLevel == 5 then
                                                  enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                                                end
                                              end
                                            end
                                          end
                                        end
                                        if enchantLevel == 0 then
                                          strParam1 = itemName
                                        else
                                          strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
                                        end
                                      else
                                        do
                                          strParam1 = itemName
                                          do
                                            local message = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NOTIFYITEMMARKETMSG_MAIN", "strParam1", strParam1, "param3", makeDotMoney(param3)), sub = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_STANDBY_ITEMMARKETBYPARTY")}
                                            Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 19)
                                            if msgType == 7 then
                                              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLCOMPLETEBYRESERVATION"))
                                            else
                                              if msgType == 8 then
                                                Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_RESERVATIONSUCCESS"))
                                                FGlobal_ItemMarketPreBid_Close()
                                              else
                                                if msgType == 9 then
                                                  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CANCELRESERVATIONSUCCESS"))
                                                else
                                                  if msgType == 10 then
                                                    local territoryNameArray = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")), [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")), [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")), [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6"))}
                                                    if param2 < 0 or param2 > 6 then
                                                      return 
                                                    end
                                                    local territoryName = territoryNameArray[param2]
                                                    local issw = getItemEnchantStaticStatus(ItemEnchantKey(param1))
                                                    if issw == nil then
                                                      return 
                                                    end
                                                    local itemName = issw:getName()
                                                    local enchantLevel = ((issw:get())._key):getEnchantLevel()
                                                    local isCash = (issw:get()):isCash()
                                                    if enchantLevel > 0 and issw:getItemClassify() ~= 4 then
                                                      strParam1 = "+" .. enchantLevel .. " " .. itemName
                                                    end
                                                    if enchantLevel >= 16 then
                                                      local enchantString = ""
                                                      if enchantLevel == 16 then
                                                        enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
                                                      else
                                                        if enchantLevel == 17 then
                                                          enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
                                                        else
                                                          if enchantLevel == 18 then
                                                            enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
                                                          else
                                                            if enchantLevel == 19 then
                                                              enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
                                                            else
                                                              if enchantLevel == 20 then
                                                                enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                      strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
                                                    else
                                                      do
                                                        if enchantLevel > 0 and enchantLevel < 16 and issw:getItemClassify() ~= 4 then
                                                          if isCash == true then
                                                            strParam1 = itemName
                                                          else
                                                            strParam1 = "+" .. enchantLevel .. " " .. itemName
                                                          end
                                                        else
                                                          if issw:getItemClassify() == 4 then
                                                            local enchantString = ""
                                                            if enchantLevel == 1 then
                                                              enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
                                                            else
                                                              if enchantLevel == 2 then
                                                                enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
                                                              else
                                                                if enchantLevel == 3 then
                                                                  enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
                                                                else
                                                                  if enchantLevel == 4 then
                                                                    enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
                                                                  else
                                                                    if enchantLevel == 5 then
                                                                      enchantString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                            if enchantLevel == 0 then
                                                              strParam1 = itemName
                                                            else
                                                              strParam1 = enchantString .. " " .. HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
                                                            end
                                                          else
                                                            do
                                                              strParam1 = itemName
                                                              local message = {main = strParam1, sub = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SELLCOMPLETEBYRESERVATION")}
                                                              Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 19)
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
            end
          end
        end
      end
    end
  end
end

HandleClicked_ItemMarket_UnSetGroupItem = function()
  -- function num : 0_44 , upvalues : ItemMarket, isOpenByMaid
  local self = ItemMarket
  if not (self.selectedListHeadBG):GetShow() then
    return 
  end
  ;
  (self.btn_BackPage):SetShow(false)
  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  self.isGrouplist = true
  self.isSpecialInside = false
  if self.isSpecialCategory then
    self:SpecialGoodsUpdate()
  else
    self:Update()
  end
  if not ItemMarket.escMenuSaveValue and not isOpenByMaid then
    (self.btn_InMarketRegist):SetShow(true)
    ;
    (self.btn_BidDesc):SetPosX(700)
  end
  if Panel_Tooltip_Item:GetShow() or Panel_Tooltip_Item_equipped:GetShow() or Panel_Tooltip_SimpleText:GetShow() then
    Panel_Tooltip_Item_hideTooltip()
    TooltipSimple_Hide()
  end
end

HandleClicked_ItemMarketNew_SelectCategory = function(isBackPage, realCategory_Idx)
  -- function num : 0_45 , upvalues : ItemMarket, selectedKey
  TooltipSimple_Hide()
  local self = ItemMarket
  if (self.btn_BackPage):GetShow() == true then
    (self.btn_BackPage):SetShow(false)
    ;
    (self.btn_SetAlarm):SetShow(false)
    ;
    (self.btn_SetPreBid):SetShow(false)
    ;
    (self.btn_Refresh):SetShow(false)
  end
  FGlobal_ItemMarket_BuyConfirm_Close()
  self.selectCategory = realCategory_Idx
  _itemMarket_ResetTextureBySort(self)
  requestItemMarketSummaryInfo(self.curTerritoryKeyRaw, self.isWorldMapOpen, true)
  self.curItemClassify = realCategory_Idx
  self.isGrouplist = true
  if selectedKey ~= 999 then
    selectMarketCategory(realCategory_Idx, -1)
  end
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.edit_SpecialItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  if isBackPage == 1 then
    self.txt_ItemNameBackPage = ""
  end
  if self.isSpecialCategory then
    self:SpecialGoodsUpdate()
  else
    self:Update()
  end
end

local filter1 = 0
Itemmarket_Sort_ShowComboBox = function()
  -- function num : 0_46 , upvalues : ItemMarket, tree2IndexMap, selectedKey, filter1
  local self = ItemMarket
  ;
  (self.combobox_Filter_Sort1):DeleteAllItem()
  local comboList = (self.combobox_Filter_Sort1):GetListControl()
  local indexMap = tree2IndexMap[selectedKey]
  if indexMap == nil then
    (self.combobox_Filter_Sort1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_NONE"))
    return 
  end
  local UIMarektCategoryInfo = ToClient_GetItemMarketCategoryAt(indexMap._index)
  if UIMarektCategoryInfo == nil then
    return 
  end
  local filterLineCount = UIMarektCategoryInfo:getFilterListCount(filter1)
  if filterLineCount == 0 then
    return 
  end
  ;
  (self.combobox_Filter_Sort1):AddItemWithKey(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_ALL"), 0)
  local count = 0
  for idx = 0, filterLineCount - 1 do
    local UIFilterValue = UIMarektCategoryInfo:getFilterAt(filter1, idx)
    ;
    (self.combobox_Filter_Sort1):AddItemWithKey(UIFilterValue:getFilterName(), UIFilterValue:getFilterNo())
    count = count + 1
  end
  comboList:SetSize((self.combobox_Filter_Sort1):GetSizeX(), (count) * 20)
  comboList:SetItemQuantity(count + 1)
  ;
  (self.combobox_Filter_Sort1):ToggleListbox()
  ;
  (self.combobox_Filter_Sort1):SetShow(true)
end

Itemmarket_Sort_SetSort = function()
  -- function num : 0_47 , upvalues : ItemMarket, filter1
  local self = ItemMarket
  ;
  (self.combobox_Filter_Sort1):SetSelectItemIndex((self.combobox_Filter_Sort1):GetSelectIndex())
  ToClient_SelectMarketCategoryFilter(filter1, (self.combobox_Filter_Sort1):GetSelectKey())
  ;
  (self.combobox_Filter_Sort1):ToggleListbox()
  self:Update()
end

HandleClicked_ItemMarket_ItemSort = function(sortTarget)
  -- function num : 0_48 , upvalues : ItemMarket
  local self = ItemMarket
  self.selectItemSort = sortTarget
  _itemMarket_ChangeTextureBySort(self.btn_Sort_AverageTradePrice, 3, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_RecentRegistDate, 4, true)
  local sortValue = false
  local control = nil
  if sortTarget == 3 then
    self.isSort_ItemName = true
    self.isSort_RecentPrice = true
    self.isSort_RegistItemCount = true
    self.isSort_AverageTradePrice = not self.isSort_AverageTradePrice
    self.isSort_RecentRegistDate = true
    sortValue = self.isSort_AverageTradePrice
    control = self.btn_Sort_AverageTradePrice
  else
    if sortTarget == 4 then
      self.isSort_ItemName = true
      self.isSort_RecentPrice = true
      self.isSort_RegistItemCount = true
      self.isSort_AverageTradePrice = true
      self.isSort_RecentRegistDate = not self.isSort_RecentRegistDate
      sortValue = self.isSort_RecentRegistDate
      control = self.btn_Sort_RecentRegistDate
    end
  end
  self.isChangeSort = true
  self.curSortTarget = sortTarget
  self.curSortValue = sortValue
  _itemMarket_doSortList(sortTarget, sortValue)
  _itemMarket_ChangeTextureBySort(control, sortTarget, sortValue)
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
end

_itemMarket_ResetTextureBySort = function(control)
  -- function num : 0_49
  local self = control
  self.curSortValue = false
  self.isSort_ItemName = true
  self.isSort_RecentPrice = true
  self.isSort_RegistItemCount = true
  self.isSort_AverageTradePrice = true
  self.isSort_RecentRegistDate = true
  _itemMarket_ChangeTextureBySort(self.btn_Sort_AverageTradePrice, 3, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_RecentRegistDate, 4, true)
end

HandleClicked_ItemMarket_Close = function()
  -- function num : 0_50 , upvalues : ItemMarket
  Panel_Window_ItemMarket:CloseUISubApp()
  ;
  (ItemMarket.checkPopUp):SetCheck(false)
  FGolbal_ItemMarketNew_Close()
end

HandleClicked_ItemMarket_PopUp = function()
  -- function num : 0_51 , upvalues : ItemMarket
  if (ItemMarket.checkPopUp):IsCheck() then
    Panel_Window_ItemMarket:OpenUISubApp()
  else
    Panel_Window_ItemMarket:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

ItemMarketPopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_52 , upvalues : ItemMarket
  if isShow then
    local self = ItemMarket
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if (self.checkPopUp):IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(self.checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

HandleClicked_ItemMarket_Search = function()
  -- function num : 0_53
  _itemMarket_Search()
end

FGlobal_ItemMarket_FavoriteItemRegiste = function()
  -- function num : 0_54
  _itemMarket_FavoriteItemRegist()
end

HandleClicked_ItemMarket_SpecialSearch = function()
  -- function num : 0_55
  _itemMarket_SpecialSearch()
end

HandleClicked_ItemMarket_RefreshList = function()
  -- function num : 0_56 , upvalues : ItemMarket
  HandleClicked_ItemMarket_GroupItem(ItemMarket.curSummaryItemIndex, ItemMarket.sellInfoItemEnchantKeyRaw)
end

FGlobal_ItemMarket_FavoriteBtn_CheckOff = function()
  -- function num : 0_57 , upvalues : ItemMarket
  local self = ItemMarket
  ;
  (self.btn_FavoriteOnOff):SetCheck(false)
end

HandleClicked_ItemMarket_FavoriteCheckOnOff = function()
  -- function num : 0_58 , upvalues : ItemMarket
  local self = ItemMarket
  if (self.btn_FavoriteOnOff):IsCheck() then
    FGlobal_ItemMarket_FavoriteItem_Open()
  else
    FGlobal_ItemMarket_FavoriteItem_Close()
  end
end

HandleClicked_ItemMarket_EditText = function()
  -- function num : 0_59 , upvalues : ItemMarket
  local self = ItemMarket
  ;
  (self.edit_ItemName):SetEditText("", true)
  SetFocusEdit(self.edit_ItemName)
  if ToClient_WorldMapIsShow() then
    SetUIMode((Defines.UIMode).eUIMode_WoldMapSearch)
  else
    if ItemMarket.escMenuSaveValue then
      SetUIMode((Defines.UIMode).eUIMode_WoldMapSearch)
    end
  end
  self.isSelectItem = false
end

HandleClicked_ItemMarket_SpecialEditText = function()
  -- function num : 0_60 , upvalues : ItemMarket
  local self = ItemMarket
  ;
  (self.edit_SpecialItemName):SetEditText("", true)
  SetFocusEdit(self.edit_SpecialItemName)
  if ToClient_WorldMapIsShow() then
    SetUIMode((Defines.UIMode).eUIMode_WoldMapSearch)
  else
    if ItemMarket.escMenuSaveValue then
      SetUIMode((Defines.UIMode).eUIMode_WoldMapSearch)
    end
  end
end

FGolbal_ItemMarketNew_Search = function()
  -- function num : 0_61 , upvalues : IM, ItemMarket
  _itemMarket_Search()
  ClearFocusEdit()
  if ToClient_WorldMapIsShow() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    SetUIMode((Defines.UIMode).eUIMode_WorldMap)
  else
    if ItemMarket.escMenuSaveValue then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      SetUIMode((Defines.UIMode).eUIMode_Default)
    end
  end
end

FGolbal_ItemMarketNew_SpecialSearch = function()
  -- function num : 0_62 , upvalues : IM, ItemMarket
  _itemMarket_SpecialSearch()
  ClearFocusEdit()
  if ToClient_WorldMapIsShow() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    SetUIMode((Defines.UIMode).eUIMode_WorldMap)
  else
    if ItemMarket.escMenuSaveValue then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      SetUIMode((Defines.UIMode).eUIMode_Default)
    end
  end
end

HandleClicked_ItemMarket_ClearEdit = function()
  -- function num : 0_63 , upvalues : IM, ItemMarket
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  (ItemMarket.edit_ItemName):SetEditText("", true)
  SetFocusEdit(ItemMarket.edit_ItemName)
end

HandleClicked_ItemMarket_RegistItem = function()
  -- function num : 0_64 , upvalues : ItemMarket
  Warehouse_OpenPanelFromMaid()
  HandleClicked_WhItemMarketRegistItem_Open(true)
  Panel_Window_ItemMarket:SetShow(false)
  if Panel_Window_ItemMarket:IsUISubApp() then
    Panel_Window_ItemMarket:CloseUISubApp()
    ;
    (ItemMarket.checkPopUp):SetCheck(false)
  end
  FGlobal_ItemMarket_FavoriteItem_Close()
end

FGlobal_ItemMarketNew_Open = function()
  -- function num : 0_65 , upvalues : ItemMarket, IM, selectedKey, tree2IndexMap
  local self = ItemMarket
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  if (ItemMarket.checkPopUp):IsCheck() then
    ItemMarket.escMenuSaveValue = false
    ;
    (ItemMarket.checkPopUp):SetCheck(false)
  end
  ;
  (ItemMarket.checkPopUp):SetShow(false)
  if Panel_Window_ItemMarket:GetShow() == true then
    return 
  end
  if Panel_Window_ItemMarket_ItemSet:GetShow() then
    FGlobal_ItemMarketItemSet_Close()
  end
  if Panel_Window_ItemMarket_BuyConfirm:GetShow() then
    FGlobal_ItemMarket_BuyConfirm_Close()
  end
  if Panel_ItemMarket_AlarmList:GetShow() then
    FGlobal_ItemMarketAlarmList_Close()
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  if Panel_ItemMarket_PreBid_Manager:GetShow() then
    FGlobal_ItemMarketPreBid_Manager_Close()
  end
  warehouse_requestInfoFromNpc()
  ;
  (self.invenMoney):SetShow(true)
  ;
  (self.invenMoneyTit):SetShow(true)
  ;
  (self.invenMoneyTit):SetEnableArea(0, 0, 200, (self.invenMoneyTit):GetSizeY())
  ;
  (self.warehouseMoney):SetShow(true)
  ;
  (self.warehouseMoneyTit):SetShow(true)
  ;
  (self.warehouseMoneyTit):SetEnableArea(0, 0, 200, (self.warehouseMoneyTit):GetSizeY())
  ;
  (self.invenMoneyTit):SetCheck(false)
  ;
  (self.warehouseMoneyTit):SetCheck(true)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  (self.btn_MyList):SetShow(false)
  ;
  (self.btn_BackPage):SetShow(false)
  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  Panel_Window_ItemMarket:SetShow(true)
  local selfPlayer = getSelfPlayer()
  local regionInfoWrapper = getRegionInfoWrapper(selfPlayer:getRegionKeyRaw())
  if regionInfoWrapper == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGIONINFO_NIL"))
    return 
  end
  ;
  (self.btn_InMarketRegist):SetShow(true)
  ;
  (self.btn_BidDesc):SetPosX(700)
  self.curTerritoryKeyRaw = regionInfoWrapper:getTerritoryKeyRaw()
  ;
  (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NAMING"))
  self.curItemClassify = 1
  self.curClassType = -1
  self.curServantType = -1
  self.curFilterIndex = -1
  self.isGrouplist = true
  self.isWorldMapOpen = false
  self.isChangeSort = false
  self.curSortTarget = -1
  self.curSortValue = false
  self.isSearch = false
  selectedKey = -1
  self.isGrouplist = true
  self.isSpecialCategory = false
  self.isSpecialInside = false
  ;
  (self.static_ListHeadBG):SetShow(true)
  ;
  (self.specialListHeadBG):SetShow(false)
  ;
  (self.selectedListHeadBG):SetShow(false)
  ;
  (self._list2):SetShow(true)
  ;
  (self._list2_Inside):SetShow(false)
  ;
  (self._list2_SpecialList):SetShow(false)
  ;
  (self._list2_SpecialList_Inside):SetShow(false)
  requestOpenItemMarket()
  requestItemMarketSummaryInfo(self.curTerritoryKeyRaw, false, false)
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.edit_SpecialItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  self.txt_ItemNameBackPage = ""
  self.txt_SpecialItemNameBackPage = ""
  ClearFocusEdit()
  self:SetPosition()
  selectMarketCategory(0, -1)
  self:Update()
  ;
  (self.combobox_Filter_Sort1):DeleteAllItem()
  ;
  (self.combobox_Filter_Sort1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_NONE"))
  ;
  (self._btn_CategoryAll):SetCheck(true)
  local tree2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Category")
  for key,value in pairs(tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  tree2:moveTopIndex()
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
  _itemMarket_ResetTextureBySort(self)
  ;
  (self.btn_RegistItem):SetShow(false)
  if (self.btn_FavoriteOnOff):IsCheck() then
    FGlobal_ItemMarket_FavoriteItem_Open()
  end
end

FGlobal_ItemMarket_Open_ForWorldMap = function(territoryKeyRaw, escMenu)
  -- function num : 0_66 , upvalues : ItemMarket, isPopUpContentsEnable, selectedKey, tree2IndexMap
  local self = ItemMarket
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R3 in 'UnsetPending'

  ItemMarket.escMenuSaveValue = escMenu
  if Panel_Window_ItemMarket:GetShow() == true then
    return 
  end
  local bCheck = Panel_Window_ItemMarket:IsUISubApp()
  ;
  (ItemMarket.checkPopUp):SetCheck(bCheck)
  if not (ItemMarket.checkPopUp):GetShow() then
    (ItemMarket.checkPopUp):SetShow(isPopUpContentsEnable)
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R4 in 'UnsetPending'

  if bCheck == true then
    ItemMarket.escMenuSaveValue = false
  end
  if Panel_Window_ItemMarket_ItemSet:GetShow() == true then
    FGlobal_ItemMarketItemSet_Close()
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_Window_ItemMarket, true)
  end
  ;
  (self.btn_InMarketRegist):SetShow(false)
  ;
  (self.btn_BidDesc):SetPosX(830)
  ;
  (self.invenMoney):SetShow(false)
  ;
  (self.invenMoneyTit):SetShow(false)
  ;
  (self.warehouseMoney):SetShow(false)
  ;
  (self.warehouseMoneyTit):SetShow(false)
  self.curTerritoryKeyRaw = territoryKeyRaw
  self.isWorldMapOpen = true
  local rv = requestItemMarketSummaryInfo(self.curTerritoryKeyRaw, true, false)
  if rv ~= 0 then
    return 
  end
  self.isGrouplist = true
  self.isChangeSort = false
  self.curSortTarget = -1
  self.curSortValue = false
  self.isSearch = false
  selectedKey = -1
  self.isGrouplist = true
  self.isSpecialCategory = false
  self.isSpecialInside = false
  ;
  (self.static_ListHeadBG):SetShow(true)
  ;
  (self.specialListHeadBG):SetShow(false)
  ;
  (self.selectedListHeadBG):SetShow(false)
  ;
  (self._list2):SetShow(true)
  ;
  (self._list2_Inside):SetShow(false)
  ;
  (self._list2_SpecialList):SetShow(false)
  ;
  (self._list2_SpecialList_Inside):SetShow(false)
  requestOpenItemMarket()
  ClearFocusEdit()
  ;
  (self.combobox_Filter_Sort1):DeleteAllItem()
  ;
  (self.combobox_Filter_Sort1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_NONE"))
  self.txt_ItemNameBackPage = ""
  self.txt_SpecialItemNameBackPage = ""
  ;
  (self.btn_MyList):SetShow(true)
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.edit_SpecialItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NAMING"))
  Panel_Window_ItemMarket:SetShow(true)
  self:SetPosition()
  ;
  (self.btn_BackPage):SetShow(false)
  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  selectMarketCategory(0, -1)
  self:Update()
  ;
  (self._btn_CategoryAll):SetCheck(true)
  local tree2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Category")
  for key,value in pairs(tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  tree2:moveTopIndex()
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
  ;
  (self.btn_RegistItem):SetShow(false)
  if (self.btn_FavoriteOnOff):IsCheck() then
    FGlobal_ItemMarket_FavoriteItem_Open()
  end
end

FGlobal_ItemMarket_OpenByMaid = function()
  -- function num : 0_67 , upvalues : ItemMarket, isOpenByMaid, selectedKey, tree2IndexMap
  local self = ItemMarket
  if Panel_Window_ItemMarket:IsUISubApp() then
    Panel_Window_ItemMarket:CloseUISubApp()
    Panel_Window_ItemMarket:SetShow(false)
    ;
    (ItemMarket.checkPopUp):SetCheck(false)
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

    ItemMarket.escMenuSaveValue = false
  end
  ;
  (ItemMarket.checkPopUp):SetShow(false)
  if Panel_Window_ItemMarket:GetShow() == true then
    return 
  end
  if Panel_Window_ItemMarket_ItemSet:IsShow() == true then
    FGlobal_ItemMarketItemSet_Close()
  end
  if Panel_Window_ItemMarket_RegistItem:IsShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  SetUIMode((Defines.UIMode).eUIMode_ItemMarket)
  isOpenByMaid = true
  ;
  (self.btn_InMarketRegist):SetShow(false)
  ;
  (self.btn_BidDesc):SetPosX(830)
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if regionInfo == nil then
    return 
  end
  local myAffiliatedTownRegionKey = regionInfo:getAffiliatedTownRegionKey()
  local regionInfoWrapper = getRegionInfoWrapper(myAffiliatedTownRegionKey)
  local wayPointKey = (regionInfoWrapper:getPlantKeyByWaypointKey()):getWaypointKey()
  warehouse_requestInfo(wayPointKey)
  ;
  (self.invenMoney):SetShow(true)
  ;
  (self.invenMoneyTit):SetShow(true)
  ;
  (self.invenMoneyTit):SetEnableArea(0, 0, 200, (self.invenMoneyTit):GetSizeY())
  ;
  (self.warehouseMoney):SetShow(true)
  ;
  (self.warehouseMoneyTit):SetShow(true)
  ;
  (self.warehouseMoneyTit):SetEnableArea(0, 0, 200, (self.warehouseMoneyTit):GetSizeY())
  ;
  (self.invenMoneyTit):SetCheck(true)
  ;
  (self.warehouseMoneyTit):SetCheck(false)
  ;
  (self.btn_MyList):SetShow(false)
  ;
  (self.btn_BackPage):SetShow(false)
  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  Panel_Window_ItemMarket:SetShow(true)
  local selfPlayer = getSelfPlayer()
  local regionInfoWrapper = getRegionInfoWrapper(selfPlayer:getRegionKeyRaw())
  if regionInfoWrapper == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGIONINFO_NIL"))
    return 
  end
  self.curTerritoryKeyRaw = regionInfoWrapper:getTerritoryKeyRaw()
  ;
  (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NAMING"))
  self.curItemClassify = 1
  self.curClassType = -1
  self.curServantType = -1
  self.curFilterIndex = -1
  self.isGrouplist = true
  self.isWorldMapOpen = false
  self.isChangeSort = false
  self.curSortTarget = -1
  self.curSortValue = false
  self.isSearch = false
  selectedKey = -1
  self.isGrouplist = true
  self.isSpecialCategory = false
  self.isSpecialInside = false
  ;
  (self.static_ListHeadBG):SetShow(true)
  ;
  (self.specialListHeadBG):SetShow(false)
  ;
  (self.selectedListHeadBG):SetShow(false)
  ;
  (self._list2):SetShow(true)
  ;
  (self._list2_Inside):SetShow(false)
  ;
  (self._list2_SpecialList):SetShow(false)
  ;
  (self._list2_SpecialList_Inside):SetShow(false)
  ;
  (self.combobox_Filter_Sort1):DeleteAllItem()
  ;
  (self.combobox_Filter_Sort1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_FILTER_NONE"))
  requestOpenItemMarket()
  requestItemMarketSummaryInfo(self.curTerritoryKeyRaw, false, false)
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.edit_SpecialItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  self.txt_ItemNameBackPage = ""
  self.txt_SpecialItemNameBackPage = ""
  ClearFocusEdit()
  self:SetPosition()
  selectMarketCategory(0, -1)
  self:Update()
  ;
  (self._btn_CategoryAll):SetCheck(true)
  local tree2 = (UI.getChildControl)(Panel_Window_ItemMarket, "List2_ItemMarket_Category")
  for key,value in pairs(tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  tree2:moveTopIndex()
  ;
  (self._list2):moveTopIndex()
  ;
  (self._list2_Inside):moveTopIndex()
  ;
  (self._list2_SpecialList):moveTopIndex()
  ;
  (self._list2_SpecialList_Inside):moveTopIndex()
  _itemMarket_ResetTextureBySort(self)
  ;
  (self.btn_RegistItem):SetShow(true)
  if (self.btn_FavoriteOnOff):IsCheck() then
    FGlobal_ItemMarket_FavoriteItem_Open()
  end
end

FGolbal_ItemMarketNew_Close = function()
  -- function num : 0_68 , upvalues : selectedKey, IM, isOpenByMaid, ItemMarket
  if Panel_Window_ItemMarket:IsShow() == false or Panel_Window_ItemMarket:IsUISubApp() == true then
    return 
  end
  selectedKey = -1
  _itemMarket_ShowIconToolTip(false)
  ClearFocusEdit()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  _itemMarket_HideToolTip()
  Panel_Window_ItemMarket:SetShow(false)
  if not Panel_Window_ItemMarket_Function:GetShow() and isOpenByMaid == true then
    SetUIMode((Defines.UIMode).eUIMode_Default)
    ToClient_CallHandlerMaid("_maidLogOut")
    isOpenByMaid = false
    ;
    (ItemMarket.btn_RegistItem):SetShow(false)
    FGlobal_ReturnIsByMaid()
  end
  -- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

  if not Panel_Window_ItemMarket_Function:GetShow() and ItemMarket.escMenuSaveValue == true then
    ItemMarket.escMenuSaveValue = false
  end
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
  Panel_ItemMarket_BidDesc_Hide()
  FGlobal_ItemMarket_FavoriteItem_Close()
  toClient_requestCloseItemMarket()
end

Update_ItemMarketMasterInfo = function()
  -- function num : 0_69 , upvalues : ItemMarket
  local self = ItemMarket
  if self.isSpecialCategory then
    self:SpecialGoodsUpdate()
    return 
  end
  ItemMarket:Update()
end

Update_ItemMarketSummaryInfo = function()
  -- function num : 0_70 , upvalues : ItemMarket
  local self = ItemMarket
  if self.isSpecialCategory then
    self:SpecialGoodsUpdate()
    return 
  end
  ItemMarket:Update()
end

Update_ItemMarketSellInfo = function()
  -- function num : 0_71 , upvalues : ItemMarket
  local self = ItemMarket
  if self.isSpecialCategory then
    self:SpecialGoodsUpdate()
    return 
  end
  self:Update()
end

FromClient_NotifyItemMarketByParty = function(notifyType, param0, param1)
  -- function num : 0_72 , upvalues : ItemMarket, _specialGoodsIndex, _specialGoodsEnchantKeyRaw
  if notifyType == 0 and Panel_Window_ItemMarket:GetShow() then
    ItemMarket:SpecialGoodsUpdate()
  end
  if notifyType == 1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYBIDDINGITEM"))
    if Panel_Window_ItemMarket:GetShow() then
      if param0 then
        HandleClicked_SpecialGoods_GroupItem(_specialGoodsIndex, _specialGoodsEnchantKeyRaw)
      else
        -- DECOMPILER ERROR at PC33: Confused about usage of register: R3 in 'UnsetPending'

        ItemMarket.isGrouplist = true
        ItemMarket:SpecialGoodsUpdate()
      end
    end
  else
    if notifyType == 2 and Panel_Window_ItemMarket:GetShow() then
      if param0 then
        HandleClicked_SpecialGoods_GroupItem(_specialGoodsIndex, _specialGoodsEnchantKeyRaw)
      else
        -- DECOMPILER ERROR at PC53: Confused about usage of register: R3 in 'UnsetPending'

        ItemMarket.isGrouplist = true
        ItemMarket:SpecialGoodsUpdate()
      end
    end
  end
  if notifyType ~= 3 or notifyType == 4 then
    local itemEnchantKeyRaw = param0
    local count = param1
    local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKeyRaw))
    if itemSSW ~= nil then
      Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SPECIALITEM_REGIST_MSG", "getName", tostring(itemSSW:getName()), "count", tostring(count)))
    end
  else
  end
  do
    if (notifyType ~= 5 or notifyType == 6) then
      FGlobal_PartyItemList_Update()
    end
  end
end

FGlobal_HandleClicked_ItemMarketBackPage = function()
  -- function num : 0_73 , upvalues : ItemMarket, isOpenByMaid
  local self = ItemMarket
  TooltipSimple_Hide()
  ;
  (self.btn_BackPage):SetShow(false)
  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  self.isGrouplist = true
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  if self.edit_ItemName == GetFocusEdit() then
    ClearFocusEdit()
  end
  if not ItemMarket.escMenuSaveValue and not isOpenByMaid then
    (self.btn_InMarketRegist):SetShow(true)
    ;
    (self.btn_BidDesc):SetPosX(700)
    if isGameTypeRussia() then
      (self.btn_BidDesc):SetSize(135, 32)
    end
  end
  local text = self.txt_ItemNameBackPage
  if text ~= nil and text ~= "" and PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") ~= text then
    searchFilteredVectorByName(text)
  end
  self:Update()
end

FGlobal_HandleClicked_SpecialItemMarketBackPage = function()
  -- function num : 0_74 , upvalues : ItemMarket
  local self = ItemMarket
  TooltipSimple_Hide()
  ;
  (self.btn_BackPage):SetShow(false)
  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  self.isGrouplist = true
  if self.edit_SpecialItemName == GetFocusEdit() then
    ClearFocusEdit()
  end
  local text = self.txt_SpecialItemNameBackPage
  if text ~= nil and text ~= "" and PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") ~= text then
    ToClient_requestSearchByName(text)
  end
  self:SpecialGoodsUpdate()
end

FGlobal_isOpenItemMarketBackPage = function()
  -- function num : 0_75 , upvalues : ItemMarket
  local self = ItemMarket
  return (self.btn_BackPage):GetShow()
end

FGlobal_SpecialListPage = function()
  -- function num : 0_76 , upvalues : ItemMarket
  local self = ItemMarket
  return self.isSpecialInside
end

FGlobal_ItemmarketNew_OpenInventory = function()
  -- function num : 0_77
  Inventory_SetFunctor(nil, nil, nil, nil)
  InventoryWindow_Show(true, false, true)
end

Panel_ItemMarket_BidDesc_Init = function()
  -- function num : 0_78 , upvalues : itemMarketBidDesc, UI_TM
  local self = itemMarketBidDesc
  ;
  (self._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKETNEW_BID_DESC"))
  ;
  (self._DescMainBG):SetSize((self._DescMainBG):GetSizeX(), (self._txt_Desc):GetTextSizeY() + 30)
  Panel_ItemMarket_BidDesc:SetSize(Panel_ItemMarket_BidDesc:GetSizeX(), (self._txt_Desc):GetTextSizeY() + (self._btn_Exit):GetSizeY() + 110)
  ;
  (self._btn_Close):addInputEvent("Mouse_LUp", "Panel_ItemMarket_BidDesc_Hide()")
  ;
  (self._btn_Exit):addInputEvent("Mouse_LUp", "Panel_ItemMarket_BidDesc_Hide()")
  ;
  (self._btn_Exit):ComputePos()
end

HandleClicked_ItemMarket_BidDesc_Open = function()
  -- function num : 0_79 , upvalues : itemMarketBidDesc
  local self = itemMarketBidDesc
  Panel_ItemMarket_BidDesc_Show()
end

Panel_ItemMarket_BidDesc_Show = function()
  -- function num : 0_80
  Panel_ItemMarket_BidDesc:SetShow(true)
end

Panel_ItemMarket_BidDesc_Hide = function()
  -- function num : 0_81
  Panel_ItemMarket_BidDesc:SetShow(false)
end

ItemMarket.registEventHandler = function(self)
  -- function num : 0_82
  (self.edit_ItemName):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_EditText()")
  ;
  (self.edit_ItemName):RegistReturnKeyEvent("FGolbal_ItemMarketNew_Search()")
  ;
  (self.edit_SpecialItemName):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SpecialEditText()")
  ;
  (self.btn_SpecialSearch):addInputEvent("Mouse_LUp", "FGolbal_ItemMarketNew_SpecialSearch()")
  ;
  (self.edit_SpecialItemName):RegistReturnKeyEvent("FGolbal_ItemMarketNew_SpecialSearch()")
  ;
  (self.btn_Sort_AverageTradePrice):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_ItemSort( " .. 3 .. " )")
  ;
  (self.btn_Sort_RecentRegistDate):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_ItemSort( " .. 4 .. " )")
  ;
  (self.btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_Close()")
  ;
  (self.checkPopUp):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_PopUp()")
  ;
  (self.checkPopUp):addInputEvent("Mouse_On", "ItemMarketPopUp_ShowIconToolTip(true)")
  ;
  (self.checkPopUp):addInputEvent("Mouse_Out", "ItemMarketPopUp_ShowIconToolTip(false)")
  ;
  (self.btn_Search):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_Search()")
  ;
  (self.btn_Refresh):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_RefreshList()")
  ;
  (self.btn_FavoriteOnOff):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_FavoriteCheckOnOff()")
  ;
  (self.btn_MyList):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketItemSet_Open_ForWorldMap( true )")
  ;
  (self.btn_BackPage):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_ItemMarketBackPage()")
  ;
  (self.btn_RegistItem):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_RegistItem()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"ItemMarket\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"ItemMarket\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"ItemMarket\", \"false\")")
  ;
  (self.btn_Sort_AverageTradePrice):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 13 .. " )")
  ;
  (self.btn_Sort_AverageTradePrice):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.btn_Sort_RecentRegistDate):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 14 .. " )")
  ;
  (self.btn_Sort_RecentRegistDate):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.btn_BackPage):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 15 .. " )")
  ;
  (self.btn_BackPage):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
end

ItemMarket.registMessageHandler = function(self)
  -- function num : 0_83
  registerEvent("FromClient_notifyItemMarketMessage", "FromClient_notifyItemMarketMessage")
  registerEvent("FromClient_NotifyItemMarketByParty", "FromClient_NotifyItemMarketByParty")
  registerEvent("FromClient_InventoryUpdate", "ItemMarket_UpdateMoneyByWarehouse")
  registerEvent("EventWarehouseUpdate", "ItemMarket_UpdateMoneyByWarehouse")
end

ItemMarket:Initialize()
Panel_ItemMarket_BidDesc_Init()
ItemMarket:registEventHandler()
ItemMarket:registMessageHandler()

