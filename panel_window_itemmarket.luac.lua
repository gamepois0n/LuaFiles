-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\itemmarket\panel_window_itemmarket.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local ItemClassify = CppEnums.ItemClassifyType
local ItemClassifyName = CppEnums.ItemClassifyTypeName
local IM = CppEnums.EProcessorInputMode
local registMarket = true
local specialStockTic = ToClient_GetSpecialStockTic()
local specialStockRate = ToClient_GetSpecialStockRate()
local isPreBidOpen = ToClient_IsContentsGroupOpen("88")
local _startIndex = 0
Panel_Window_ItemMarket:setGlassBackground(true)
Panel_Window_ItemMarket:ActiveMouseEventEffect(true)
Panel_Window_ItemMarket:SetShow(false)
local shopType = {eShopType_Potion = 1, eShopType_Weapon = 2, eShopType_Jewel = 3, eShopType_Furniture = 4, eShopType_Collect = 5, eShopType_Cook = 9, eShopType_PC = 10}
local ItemMarket = {panelTitle = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_Title"), panelBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_BG"), btn_Close = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_Win_Close"), btn_Search = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_Search"), btn_ResetSearch = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SearchReset"), txt_Sort_Parent = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_SortTitle"), btn_Sort_ItemName = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SortItemName"), btn_Sort_RecentPrice = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SortRecentPrice"), btn_Sort_RegistItemCount = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SortRegistItemCount"), btn_Sort_AverageTradePrice = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SortAverageTradePrice"), btn_Sort_RecentRegistDate = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SortRecentRegistDate"), btn_MyList = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_MyList"), btn_BackPage = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_BackPage"), btn_SetAlarm = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SetAlarm"), btn_SetPreBid = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_SetPreBid"), btn_Refresh = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_Refresh"), btn_RegistItem = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_RegistItem"), selectCategory = 0, selectItemSort = 0, static_ListHeadBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_ListHeadBG"), static_SlotBg = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_Static_SlotBG"), static_Slot = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_Static_Slot"), 
selectSingleSlot = {}
, txt_SpecialGoodsName = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_SpecialGoods_Name"), txt_SpecialGoodsDesc = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_SpecialGoods_Desc"), txt_ItemName = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_ItemName"), txt_ItemNameBackPage = "", averagePrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_AveragePrice_Title"), txt_AveragePrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_AveragePrice_Value"), recentPrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RecentPrice_Title"), txt_RecentPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RecentPrice_Value"), registHighPrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RegistHighPrice_Title"), txt_RegistHighPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RegistHighPrice_Value"), registLowPrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RegistLowPrice_Title"), txt_RegistLowPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RegistLowPrice_Value"), registListCount_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RegistListCount_Title"), txt_RegistListCount_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RegistListCount_Value"), registItemCount_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RegistItemCount_Title"), txt_RegistItemCount_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_RegistItemCount_Value"), _txt_price_dash = (UI.getChildControl)(Panel_Window_ItemMarket, "Selected_StaticText_dash"), static_CategoryBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_CategoryBG"), static_FilterBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_FilterBG"), static_ItemListBG = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_ItemListBG"), edit_ItemName = (UI.getChildControl)(Panel_Window_ItemMarket, "Edit_ItemName"), invenMoney = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_Text_Money"), invenMoneyTit = (UI.getChildControl)(Panel_Window_ItemMarket, "RadioButton_Icon_Money"), warehouseMoney = (UI.getChildControl)(Panel_Window_ItemMarket, "Static_Text_Money2"), warehouseMoneyTit = (UI.getChildControl)(Panel_Window_ItemMarket, "RadioButton_Icon_Money2"), invenDesc = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_Inven"), warehouseDesc = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_Warehouse"), iconTooltip = nil, scroll = (UI.getChildControl)(Panel_Window_ItemMarket, "Scroll_ItemMarket"), nowScrollPos = 0, scrollInverVal = 0, nowStartIdx = 0, curItemClassify = ItemClassify.eItemClassify_Etc, curFilterIndex = -1, curClassType = -1, curServantType = -1, 
categoryUiPool = {}
, 
filterUiPool = {}
, itemList_MaxCount = 7, 
itemGroupUiPool = {}
, 
itemSingleUiPool = {}
, isGrouplist = true, sellInfoItemEnchantKeyRaw = 0, curSummaryItemIndex = 0, curTerritoryKeyRaw = 0, specialItemEnchantKeyRaw = 0, curSpecialItemIndex = 0, isWorldMapOpen = false, itemmarketClassCount = 10, isSort_ItemName = true, isSort_RecentPrice = true, isSort_RegistItemCount = true, isSort_AverageTradePrice = true, isSort_RecentRegistDate = true, isChangeSort = false, curSortTarget = -1, curSortValue = false, isSearch = false, buyItemKeyraw = 0, buyItemSlotidx = 0, 
slotGroupConfing = {createIcon = true, createBorder = true, createCount = false, createEnchant = true, createCash = true, createClassEquipBG = true}
, 
slotSingleConfing = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createClassEquipBG = true}
, _buttonQuestion = (UI.getChildControl)(Panel_Window_ItemMarket, "Button_Question"), escMenuSaveValue = false}
ItemMarket.scrollCtrlBTN = (UI.getChildControl)(ItemMarket.scroll, "Scroll_CtrlButton")
;
(ItemMarket.txt_SpecialGoodsDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(ItemMarket.txt_SpecialGoodsDesc):SetText((ItemMarket.txt_SpecialGoodsDesc):GetText())
local isAsia = (CppEnums.ContryCode).eContryCode_KOR == getContryTypeLua() or (CppEnums.ContryCode).eContryCode_JAP == getContryTypeLua()
local helpIconGapRate = 2
if isAsia == false then
  (ItemMarket.btn_MyList):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
  ;
  (ItemMarket.btn_MyList):SetSize((ItemMarket.btn_MyList):GetSizeX(), (ItemMarket.btn_MyList):GetSizeY() * 1.5)
  helpIconGapRate = 1.5
end
;
(ItemMarket.btn_MyList):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_BTN_MYLIST"))
local helpIcon = {[0] = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_RegistListCount_Help"), [1] = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_RegistHighPrice_Help"), [2] = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_AveragePrice_Help"), [3] = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_RegistItemCount_Help"), [4] = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_RegistLowPrice_Help"), [5] = (UI.getChildControl)(Panel_Window_ItemMarket, "StaticText_RecentPrice_Help")}
;
(helpIcon[0]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_REGISTLISTCOUNT_HELP"))
;
(helpIcon[1]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_REGISTHIGHPRICE_HELP"))
;
(helpIcon[2]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_AVERAGEPRICE_HELP"))
;
(helpIcon[3]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_REGISTITEMCOUNT_HELP"))
;
(helpIcon[4]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_REGISTLOWPRICE_HELP"))
;
(helpIcon[5]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_RECETNPRICE_HELP"))
local langSize = 0
for i = 0, 5 do
  if langSize < (helpIcon[i]):GetTextSizeX() then
    langSize = (helpIcon[i]):GetTextSizeX()
  end
end
for i = 0, 5 do
  if i <= 2 then
    (helpIcon[i]):SetPosX(Panel_Window_ItemMarket:GetSizeX() - langSize * helpIconGapRate * (i + 1))
  else
    (helpIcon[i]):SetPosX(Panel_Window_ItemMarket:GetSizeX() - langSize * helpIconGapRate * (i + 1 - 3))
  end
end
local TemplateItemMarket = {btn_category = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_RadioButton_Category"), btn_Filter = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_RadioButton_Filter"), btn_ItemList = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_Button_ItemList"), static_SlotBg = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_Static_SlotBG"), static_Slot = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_Static_Slot"), static_BiddingMark = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_Static_BiddingMark"), txt_ItemName = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_ItemName"), txt_AveragePrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_AveragePrice_Title"), txt_AveragePrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_AveragePrice_Value"), txt_RecentPrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RecentPrice_Title"), txt_RecentPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RecentPrice_Value"), txt_RegistHighPrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistHighPrice_Title"), txt_RegistHighPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistHighPrice_Value"), txt_RegistLowPrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistLowPrice_Title"), txt_RegistLowPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistLowPrice_Value"), txt_RegistListCount_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistListCount_Title"), txt_RegistListCount_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistListCount_Value"), txt_RegistItemCount_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistItemCount_Title"), txt_RegistItemCount_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistItemCount_Value"), static_Line_1 = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_Static_Line_1"), static_Line_2 = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_Static_Line_2"), static_SingleSlotBg = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_Static_SingleItemBG"), txt_SellPrice_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_SellPrice_Title"), txt_SellPrice_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_SellPrice_Value"), txt_RegistPeriod_Title = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistPeriod_Title"), txt_RegistPeriod_Value = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_StaticText_RegistPeriod_Value"), btn_BuyItem = (UI.getChildControl)(Panel_Window_ItemMarket, "Template_Button_BuyItem"), iconTooltip = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_1")}
local DummyData = {
Category = {PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_13"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_14"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_15"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_16"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_17"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_2"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_3"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_4"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_5"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_6"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_7"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_8"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_9"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_10"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_18"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_11"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_12"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_CATEGORY_1"), [99] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_SPECIALITEM")}
, 
Filter = {PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_2"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_3"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_4"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_5"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_17"), (CppEnums.ClassType2String)[(CppEnums.ClassType).ClassType_BladeMasterWomen], PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_18"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_19"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_20"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_21"), PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_22"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FILTER_1")}
, 
ClassFilter = {4, 8, 12, 16, 20, 21, 24, 25, 28, 31; [0] = 0}
}
local _categoryTexture = {
{
{50, 181, 92, 223}
, 
{50, 227, 92, 269}
; 
[0] = {50, 135, 92, 177}
}
, 
{
{192, 181, 234, 223}
, 
{192, 227, 234, 269}
; 
[0] = {192, 135, 234, 177}
}
, 
{
{3, 181, 45, 223}
, 
{3, 227, 45, 269}
; 
[0] = {3, 135, 45, 177}
}
, 
{
{97, 181, 139, 223}
, 
{97, 227, 139, 269}
; 
[0] = {97, 135, 139, 177}
}
, 
{
{145, 181, 187, 223}
, 
{145, 227, 187, 269}
; 
[0] = {145, 135, 187, 177}
}
, 
{
{321, 147, 363, 189}
, 
{321, 288, 363, 330}
; 
[0] = {321, 6, 363, 48}
}
, 
{
{368, 147, 410, 189}
, 
{368, 288, 410, 330}
; 
[0] = {368, 6, 410, 48}
}
, 
{
{415, 147, 457, 189}
, 
{415, 288, 457, 330}
; 
[0] = {415, 6, 457, 48}
}
, 
{
{463, 147, 505, 189}
, 
{463, 288, 505, 330}
; 
[0] = {463, 6, 505, 48}
}
, 
{
{321, 194, 363, 236}
, 
{321, 335, 363, 377}
; 
[0] = {321, 53, 363, 95}
}
, 
{
{368, 194, 410, 236}
, 
{368, 335, 410, 377}
; 
[0] = {368, 53, 410, 95}
}
, 
{
{415, 194, 457, 236}
, 
{415, 335, 457, 377}
; 
[0] = {415, 53, 457, 95}
}
, 
{
{463, 194, 505, 236}
, 
{463, 335, 505, 377}
; 
[0] = {463, 53, 505, 95}
}
, 
{
{321, 241, 363, 283}
, 
{321, 382, 363, 424}
; 
[0] = {321, 100, 363, 142}
}
, 
{
{50, 320, 92, 362}
, 
{50, 366, 92, 408}
; 
[0] = {50, 274, 92, 316}
}
, 
{
{415, 241, 457, 283}
, 
{415, 382, 457, 424}
; 
[0] = {415, 100, 457, 142}
}
, 
{
{463, 241, 505, 283}
, 
{463, 382, 505, 424}
; 
[0] = {463, 100, 505, 142}
}
; 
[0] = {
{368, 241, 410, 283}
, 
{368, 382, 410, 424}
; 
[0] = {368, 100, 410, 142}
}
, 
[99] = {
{145, 320, 187, 362}
, 
{145, 366, 187, 408}
; 
[0] = {145, 274, 187, 316}
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
convertFilterIndexToClassType = function(filterIndex)
  -- function num : 0_0
  local temp = -1
  if filterIndex == 0 then
    temp = (CppEnums.ClassType).ClassType_Warrior
  else
    if filterIndex == 1 then
      temp = (CppEnums.ClassType).ClassType_Ranger
    else
      if filterIndex == 2 then
        temp = (CppEnums.ClassType).ClassType_Sorcerer
      else
        if filterIndex == 3 then
          temp = (CppEnums.ClassType).ClassType_Giant
        else
          if filterIndex == 4 then
            temp = (CppEnums.ClassType).ClassType_Tamer
          else
            if filterIndex == 5 then
              temp = (CppEnums.ClassType).ClassType_BladeMaster
            else
              if filterIndex == 6 then
                temp = (CppEnums.ClassType).ClassType_BladeMasterWomen
              else
                if filterIndex == 7 then
                  temp = (CppEnums.ClassType).ClassType_Valkyrie
                else
                  if filterIndex == 8 then
                    temp = (CppEnums.ClassType).ClassType_Wizard
                  else
                    if filterIndex == 9 then
                      temp = (CppEnums.ClassType).ClassType_WizardWomen
                    else
                      if filterIndex == 10 then
                        temp = (CppEnums.ClassType).ClassType_Kunoichi
                      else
                        if filterIndex == 11 then
                          temp = (CppEnums.ClassType).ClassType_NinjaMan
                        else
                          _PA_ASSERT(false, "클래�\164 추가되었다면 작업해주세요")
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
  return temp
end

ItemMarketShowAni = function()
  -- function num : 0_1
  Panel_Window_ItemMarket:SetAlpha(0)
  Panel_Window_ItemMarket:ResetVertexAni()
  ;
  (UIAni.AlphaAnimation)(1, Panel_Window_ItemMarket, 0, 0.3)
end

ItemMarketHideAni = function()
  -- function num : 0_2
  Panel_Window_ItemMarket:ResetVertexAni()
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_Window_ItemMarket, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

ItemMarket_ScrollUpdate = function(isDown)
  -- function num : 0_3 , upvalues : ItemMarket
  local self = ItemMarket
  local index = self.nowStartIdx
  if isDown == true then
    if index < self.scrollInverVal then
      (self.scroll):ControlButtonDown()
      index = index + 1
    else
      return 
    end
  else
    if index > 0 then
      (self.scroll):ControlButtonUp()
      index = index - 1
    else
      return 
    end
  end
  self.nowStartIdx = index
  if ((self.categoryUiPool)[99]):IsCheck() then
    self:SpecialGoodsUpdate(index)
    return 
  end
  self:Update(index)
end

ItemMarket.SetScroll = function(self)
  -- function num : 0_4
  local itemCount = 0
  if self.isGrouplist then
    itemCount = getItemMarketSummaryInClientCount()
    ;
    (self.scroll):SetSize((self.scroll):GetSizeX(), 450)
    ;
    (self.static_ItemListBG):SetSize((self.static_ItemListBG):GetSizeX(), 440)
  else
    itemCount = getItemMarketSellInfoInClientCount(self.curTerritoryKeyRaw, self.sellInfoItemEnchantKeyRaw)
    ;
    (self.scroll):SetSize((self.scroll):GetSizeX(), 390)
    ;
    (self.static_ItemListBG):SetSize((self.static_ItemListBG):GetSizeX(), 380)
  end
  if ((self.categoryUiPool)[99]):IsCheck() then
    if self.isGrouplist then
      itemCount = ToClient_requestGetSummaryCount()
    else
      itemCount = ToClient_requestGetItemCountByItemEnchantKeyRaw(self.specialItemEnchantKeyRaw)
    end
  end
  local _itemListMaxCount = self.itemList_MaxCount
  if not self.isGrouplist then
    _itemListMaxCount = self.itemList_MaxCount - 1
  end
  local interval = itemCount - (_itemListMaxCount)
  if interval < 0 then
    interval = 0
    ;
    (self.scroll):SetShow(false)
  else
    ;
    (self.scroll):SetShow(true)
  end
  local dataCount = itemCount
  local viewCount = _itemListMaxCount
  local pagePercent = viewCount / dataCount * 100
  local scrollSizeY = (self.scroll):GetSizeY()
  local btn_scrollSizeY = scrollSizeY / 100 * pagePercent
  if btn_scrollSizeY < 40 then
    btn_scrollSizeY = 65
  end
  if scrollSizeY < btn_scrollSizeY then
    btn_scrollSizeY = scrollSizeY
  end
  ;
  (UIScroll.SetButtonSize)(self.scroll, viewCount, itemCount)
  self.scrollInverVal = interval
  ;
  (self.scroll):SetInterval(self.scrollInverVal)
end

ItemMarket.Initialize = function(self)
  -- function num : 0_5 , upvalues : ItemMarket, specialStockTic, specialStockRate, DummyData, UI_PUCT, ItemClassify, ItemClassifyName, TemplateItemMarket, registMarket, UI_TM, UI_color
  (self.panelBG):setGlassBackground(true)
  ;
  (self.txt_Sort_Parent):AddChild(self.btn_Sort_ItemName)
  ;
  (self.txt_Sort_Parent):AddChild(self.btn_Sort_RecentPrice)
  ;
  (self.txt_Sort_Parent):AddChild(self.btn_Sort_RegistItemCount)
  ;
  (self.txt_Sort_Parent):AddChild(self.btn_Sort_AverageTradePrice)
  ;
  (self.txt_Sort_Parent):AddChild(self.btn_Sort_RecentRegistDate)
  ;
  (self.txt_Sort_Parent):AddChild(self.btn_Search)
  ;
  (self.txt_Sort_Parent):AddChild(self.btn_ResetSearch)
  ;
  (self.txt_Sort_Parent):AddChild(self.edit_ItemName)
  Panel_Window_ItemMarket:RemoveControl(self.btn_Sort_ItemName)
  Panel_Window_ItemMarket:RemoveControl(self.btn_Sort_RecentPrice)
  Panel_Window_ItemMarket:RemoveControl(self.btn_Sort_RegistItemCount)
  Panel_Window_ItemMarket:RemoveControl(self.btn_Sort_AverageTradePrice)
  Panel_Window_ItemMarket:RemoveControl(self.btn_Sort_RecentRegistDate)
  Panel_Window_ItemMarket:RemoveControl(self.btn_Search)
  Panel_Window_ItemMarket:RemoveControl(self.btn_ResetSearch)
  Panel_Window_ItemMarket:RemoveControl(self.edit_ItemName)
  ;
  (self.txt_Sort_Parent):SetShow(true)
  ;
  (self.static_SlotBg):AddChild(self.static_Slot)
  ;
  (self.static_SlotBg):AddChild(self.txt_ItemName)
  ;
  (self.static_SlotBg):AddChild(self.averagePrice_Title)
  ;
  (self.static_SlotBg):AddChild(self.txt_AveragePrice_Value)
  ;
  (self.static_SlotBg):AddChild(self.recentPrice_Title)
  ;
  (self.static_SlotBg):AddChild(self.txt_RecentPrice_Value)
  ;
  (self.static_SlotBg):AddChild(self.registHighPrice_Title)
  ;
  (self.static_SlotBg):AddChild(self.txt_RegistHighPrice_Value)
  ;
  (self.static_SlotBg):AddChild(self.registLowPrice_Title)
  ;
  (self.static_SlotBg):AddChild(self.txt_RegistLowPrice_Value)
  ;
  (self.static_SlotBg):AddChild(self.registListCount_Title)
  ;
  (self.static_SlotBg):AddChild(self.txt_RegistListCount_Value)
  ;
  (self.static_SlotBg):AddChild(self.registItemCount_Title)
  ;
  (self.static_SlotBg):AddChild(self.txt_RegistItemCount_Value)
  ;
  (self.static_SlotBg):AddChild(self._txt_price_dash)
  Panel_Window_ItemMarket:RemoveControl(self.static_Slot)
  Panel_Window_ItemMarket:RemoveControl(self.txt_ItemName)
  Panel_Window_ItemMarket:RemoveControl(self.averagePrice_Title)
  Panel_Window_ItemMarket:RemoveControl(self.txt_AveragePrice_Value)
  Panel_Window_ItemMarket:RemoveControl(self.recentPrice_Title)
  Panel_Window_ItemMarket:RemoveControl(self.txt_RecentPrice_Value)
  Panel_Window_ItemMarket:RemoveControl(self.registHighPrice_Title)
  Panel_Window_ItemMarket:RemoveControl(self.txt_RegistHighPrice_Value)
  Panel_Window_ItemMarket:RemoveControl(self.registLowPrice_Title)
  Panel_Window_ItemMarket:RemoveControl(self.txt_RegistLowPrice_Value)
  Panel_Window_ItemMarket:RemoveControl(self.registListCount_Title)
  Panel_Window_ItemMarket:RemoveControl(self.txt_RegistListCount_Value)
  Panel_Window_ItemMarket:RemoveControl(self.registItemCount_Title)
  Panel_Window_ItemMarket:RemoveControl(self.txt_RegistItemCount_Value)
  Panel_Window_ItemMarket:RemoveControl(self._txt_price_dash)
  ;
  (self.static_SlotBg):SetShow(false)
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (ItemMarket.txt_SpecialGoodsDesc):SetText(PAGetStringParam2(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_SPECIALPRODUCT_DESC", "ticktime", tostring(specialStockTic), "descpercent", tostring(specialStockRate)))
  local createSingleSlot = {}
  ;
  (SlotItem.new)(createSingleSlot, "ItemMarket_ItemSingleSlotItem", 0, self.static_SlotBg, self.slotGroupConfing)
  createSingleSlot:createChild()
  self.selectSingleSlot = createSingleSlot
  local isAblePearlProduct = requestCanRegisterPearlItemOnMarket()
  local btn_Category_PosX = 10
  for category_Idx = 0, #DummyData.Category do
    local CreatedCategoryBTN = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_RADIOBUTTON, self.static_CategoryBG, "ItemMarket_CategoryBTN_" .. category_Idx)
    category_Match_Idx = ItemClassify[ItemClassifyName[category_Idx]]
    CopyBaseProperty(TemplateItemMarket.btn_category, CreatedCategoryBTN)
    CreatedCategoryBTN:SetPosX(btn_Category_PosX)
    CreatedCategoryBTN:SetPosY(4)
    CreatedCategoryBTN:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SelectCategory( " .. category_Match_Idx .. ", 1 ," .. category_Idx .. " )")
    CreatedCategoryBTN:addInputEvent("Mouse_On", "ShowTooltip_ItemMarket_Category( true, " .. category_Idx .. ")")
    CreatedCategoryBTN:addInputEvent("Mouse_Out", "ShowTooltip_ItemMarket_Category( false )")
    CreatedCategoryBTN:setTooltipEventRegistFunc("ShowTooltip_ItemMarket_Category( true, " .. category_Idx .. ")")
    CreatedCategoryBTN:SetShow(true)
    if (category_Match_Idx == 9 or category_Match_Idx == 17) and (not FGlobal_IsCommercialService() or isServerFixedCharge()) then
      CreatedCategoryBTN:SetShow(false)
    else
      if category_Match_Idx == 9 and (isAblePearlProduct == false or isGameTypeEnglish()) then
        CreatedCategoryBTN:SetShow(false)
      else
        btn_Category_PosX = btn_Category_PosX + CreatedCategoryBTN:GetSizeX() + 5
      end
    end
    -- DECOMPILER ERROR at PC333: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self.categoryUiPool)[category_Idx] = CreatedCategoryBTN
    _itemMarket_ChangeTextureByCategory(category_Idx)
  end
  local CreatedSpecialCategoryBTN = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_RADIOBUTTON, self.static_CategoryBG, "ItemMarket_CategoryBTN_" .. 99)
  CopyBaseProperty(TemplateItemMarket.btn_category, CreatedSpecialCategoryBTN)
  CreatedSpecialCategoryBTN:SetPosX(btn_Category_PosX)
  CreatedSpecialCategoryBTN:SetPosY(4)
  -- DECOMPILER ERROR at PC359: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self.categoryUiPool)[99] = CreatedSpecialCategoryBTN
  CreatedSpecialCategoryBTN:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SelectCategory( 99, 1 , 99 )")
  CreatedSpecialCategoryBTN:addInputEvent("Mouse_On", "ShowTooltip_ItemMarket_Category( true, 99 )")
  CreatedSpecialCategoryBTN:addInputEvent("Mouse_Out", "ShowTooltip_ItemMarket_Category( false )")
  CreatedSpecialCategoryBTN:setTooltipEventRegistFunc("ShowTooltip_ItemMarket_Category( true, 99 )")
  CreatedSpecialCategoryBTN:SetShow(registMarket)
  _itemMarket_ChangeTextureByCategory(99)
  local btn_Filter_PosY = 40
  local maxClassCount = getCharacterClassCount()
  for filter_Idx = 0, maxClassCount - 1 do
    local CreatedFilterBTN = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_RADIOBUTTON, self.static_FilterBG, "ItemMarket_FilterBTN_" .. filter_Idx)
    CopyBaseProperty(TemplateItemMarket.btn_Filter, CreatedFilterBTN)
    local classType = getCharacterClassTypeByIndex(filter_Idx)
    local className = getCharacterClassName(classType)
    CreatedFilterBTN:SetPosX(10)
    CreatedFilterBTN:SetPosY(btn_Filter_PosY)
    CreatedFilterBTN:SetText(className)
    CreatedFilterBTN:SetEnableArea(0, 0, 100, CreatedFilterBTN:GetSizeY())
    CreatedFilterBTN:addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SelectFilter( " .. filter_Idx .. " )")
    if className ~= nil and className ~= "" and className ~= " " then
      CreatedFilterBTN:SetShow(true)
      btn_Filter_PosY = btn_Filter_PosY + CreatedFilterBTN:GetSizeY() + 4
    end
    -- DECOMPILER ERROR at PC445: Confused about usage of register: R14 in 'UnsetPending'

    ;
    (self.filterUiPool)[filter_Idx] = CreatedFilterBTN
  end
  local itemList_PosY = 5
  for itemList_Idx = 0, self.itemList_MaxCount - 1 do
    local tempGroupSlot = {}
    local Created_ItemListBTN = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self.static_ItemListBG, "ItemMarket_ItemListBTN_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.btn_ItemList, Created_ItemListBTN)
    Created_ItemListBTN:SetPosX(5)
    Created_ItemListBTN:SetPosY(itemList_PosY)
    Created_ItemListBTN:addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
    Created_ItemListBTN:addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
    Created_ItemListBTN:SetShow(false)
    tempGroupSlot.itemBTN = Created_ItemListBTN
    local Created_ItemSlotBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Created_ItemListBTN, "ItemMarket_ItemListSlotBG_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.static_SlotBg, Created_ItemSlotBG)
    Created_ItemSlotBG:SetPosX(10)
    Created_ItemSlotBG:SetPosY(7)
    Created_ItemSlotBG:SetShow(true)
    tempGroupSlot.itemSlotBG = Created_ItemSlotBG
    local createSlot = {}
    ;
    (SlotItem.new)(createSlot, "ItemMarket_ItemGroupListSlotItem_" .. itemList_Idx, 0, Created_ItemSlotBG, self.slotGroupConfing)
    createSlot:createChild()
    tempGroupSlot.SlotItem = createSlot
    local Created_ItemName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListItemName_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_ItemName, Created_ItemName)
    Created_ItemName:SetPosX(60)
    Created_ItemName:SetPosY(7)
    Created_ItemName:SetTextMode(UI_TM.eTextMode_AutoWrap)
    Created_ItemName:SetShow(true)
    tempGroupSlot.itemName = Created_ItemName
    local Created_AveragePrice_Title = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListAveragePrice_Title_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_AveragePrice_Title, Created_AveragePrice_Title)
    Created_AveragePrice_Title:SetPosX(460)
    Created_AveragePrice_Title:SetPosY(10)
    Created_AveragePrice_Title:SetShow(true)
    Created_AveragePrice_Title:SetEnableArea(0, 0, 100, Created_AveragePrice_Title:GetSizeY())
    Created_AveragePrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 0 .. ", " .. 0 .. ", " .. itemList_Idx .. " )")
    Created_AveragePrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
    tempGroupSlot.averagePrice_Title = Created_AveragePrice_Title
    local Created_AveragePrice_Value = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListAveragePrice_Value_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_AveragePrice_Value, Created_AveragePrice_Value)
    Created_AveragePrice_Value:SetPosX(480)
    Created_AveragePrice_Value:SetPosY(8)
    Created_AveragePrice_Value:SetShow(true)
    tempGroupSlot.averagePrice_Value = Created_AveragePrice_Value
    local Created_RecentPrice_Title = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRecentPrice_Title_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RecentPrice_Title, Created_RecentPrice_Title)
    Created_RecentPrice_Title:SetPosX(460)
    Created_RecentPrice_Title:SetPosY(32)
    Created_RecentPrice_Title:SetShow(true)
    Created_RecentPrice_Title:SetEnableArea(0, 0, 100, Created_RecentPrice_Title:GetSizeY())
    Created_RecentPrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 0 .. ", " .. 1 .. ", " .. itemList_Idx .. " )")
    Created_RecentPrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
    tempGroupSlot.recentPrice_Title = Created_RecentPrice_Title
    local Created_RecentPrice_Value = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRecentPrice_Value_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RecentPrice_Value, Created_RecentPrice_Value)
    Created_RecentPrice_Value:SetPosX(480)
    Created_RecentPrice_Value:SetPosY(30)
    Created_RecentPrice_Value:SetShow(true)
    tempGroupSlot.recentPrice_Value = Created_RecentPrice_Value
    local Created_RegistHighPrice_Title = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRegistHighPrice_Title_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistHighPrice_Title, Created_RegistHighPrice_Title)
    Created_RegistHighPrice_Title:SetPosX(345)
    Created_RegistHighPrice_Title:SetPosY(7)
    Created_RegistHighPrice_Title:SetShow(true)
    Created_RegistHighPrice_Title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_HIGHPRICE"))
    Created_RegistHighPrice_Title:SetTextSpan(30, 0)
    Created_RegistHighPrice_Title:SetEnableArea(0, 0, 70, Created_RegistHighPrice_Title:GetSizeY())
    Created_RegistHighPrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 0 .. ", " .. 2 .. ", " .. itemList_Idx .. " )")
    Created_RegistHighPrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
    tempGroupSlot.registHighPrice_Title = Created_RegistHighPrice_Title
    local Created_RegistHighPrice_Value = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRegistHighPrice_Value_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistHighPrice_Value, Created_RegistHighPrice_Value)
    Created_RegistHighPrice_Value:SetPosX(345)
    Created_RegistHighPrice_Value:SetPosY(30)
    Created_RegistHighPrice_Value:SetShow(true)
    Created_RegistHighPrice_Value:SetTextHorizonCenter()
    tempGroupSlot.registHighPrice_Value = Created_RegistHighPrice_Value
    local Created_RegistLowPrice_Title = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRegistLowPrice_Title_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistLowPrice_Title, Created_RegistLowPrice_Title)
    Created_RegistLowPrice_Title:SetPosX(225)
    Created_RegistLowPrice_Title:SetPosY(7)
    Created_RegistLowPrice_Title:SetShow(true)
    Created_RegistLowPrice_Title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_LOWPRICE"))
    Created_RegistLowPrice_Title:SetTextSpan(30, 0)
    Created_RegistLowPrice_Title:SetEnableArea(0, 0, 70, Created_RegistLowPrice_Title:GetSizeY())
    Created_RegistLowPrice_Title:addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 0 .. ", " .. 3 .. ", " .. itemList_Idx .. " )")
    Created_RegistLowPrice_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
    tempGroupSlot.registLowPrice_Title = Created_RegistLowPrice_Title
    local Created_RegistLowPrice_Value = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRegistLowPrice_Value_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistLowPrice_Value, Created_RegistLowPrice_Value)
    Created_RegistLowPrice_Value:SetPosX(225)
    Created_RegistLowPrice_Value:SetPosY(30)
    Created_RegistLowPrice_Value:SetShow(true)
    Created_RegistLowPrice_Value:SetTextHorizonCenter()
    tempGroupSlot.registLowPrice_Value = Created_RegistLowPrice_Value
    local Created_RegistListCount_Title = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRegistListCount_Title_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistListCount_Title, Created_RegistListCount_Title)
    Created_RegistListCount_Title:SetPosX(580)
    Created_RegistListCount_Title:SetPosY(10)
    Created_RegistListCount_Title:SetShow(true)
    Created_RegistListCount_Title:SetEnableArea(0, 0, 60, Created_RegistListCount_Title:GetSizeY())
    Created_RegistListCount_Title:addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 0 .. ", " .. 4 .. ", " .. itemList_Idx .. " )")
    Created_RegistListCount_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
    tempGroupSlot.registListCount_Title = Created_RegistListCount_Title
    local Created_RegistListCount_Value = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRegistListCount_Value_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistListCount_Value, Created_RegistListCount_Value)
    Created_RegistListCount_Value:SetPosX(585)
    Created_RegistListCount_Value:SetPosY(8)
    Created_RegistListCount_Value:SetShow(true)
    tempGroupSlot.registListCount_Value = Created_RegistListCount_Value
    local Created_RegistItemCount_Title = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRegistItemCount_Title_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistItemCount_Title, Created_RegistItemCount_Title)
    Created_RegistItemCount_Title:SetPosX(580)
    Created_RegistItemCount_Title:SetPosY(32)
    Created_RegistItemCount_Title:SetShow(true)
    Created_RegistItemCount_Title:SetEnableArea(0, 0, 60, Created_RegistItemCount_Title:GetSizeY())
    Created_RegistItemCount_Title:addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 0 .. ", " .. 5 .. ", " .. itemList_Idx .. " )")
    Created_RegistItemCount_Title:addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
    tempGroupSlot.registItemCount_Title = Created_RegistItemCount_Title
    local Created_RegistItemCount_Value = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_ItemListRegistItemCount_Value_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistItemCount_Value, Created_RegistItemCount_Value)
    Created_RegistItemCount_Value:SetPosX(585)
    Created_RegistItemCount_Value:SetPosY(30)
    Created_RegistItemCount_Value:SetShow(true)
    tempGroupSlot.registItemCount_Value = Created_RegistItemCount_Value
    local Created_Static_Line_1 = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Created_ItemListBTN, "ItemMarket_Static_Line_1_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.static_Line_1, Created_Static_Line_1)
    Created_Static_Line_1:SetPosX(445)
    Created_Static_Line_1:SetPosY(10)
    Created_Static_Line_1:SetShow(true)
    tempGroupSlot.registItem_Line_1 = Created_Static_Line_1
    local Created_Static_Line_2 = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Created_ItemListBTN, "ItemMarket_Static_Line_2_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.static_Line_2, Created_Static_Line_2)
    Created_Static_Line_2:SetPosX(572)
    Created_Static_Line_2:SetPosY(10)
    Created_Static_Line_2:SetShow(true)
    tempGroupSlot.registItem_Line_2 = Created_Static_Line_2
    local Created_Static_Dash = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_ItemListBTN, "ItemMarket_Static_Dash_" .. itemList_Idx)
    CopyBaseProperty(ItemMarket._txt_price_dash, Created_Static_Dash)
    Created_Static_Dash:SetPosX(295)
    Created_Static_Dash:SetPosY(30)
    Created_Static_Dash:SetShow(true)
    tempGroupSlot.static_Dash = Created_Static_Dash
    -- DECOMPILER ERROR at PC1071: Confused about usage of register: R32 in 'UnsetPending'

    ;
    (self.itemGroupUiPool)[itemList_Idx] = tempGroupSlot
    local tempSingleSlot = {}
    local Created_SingleItemBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.static_ItemListBG, "ItemMarket_SingleItemBG_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.static_SingleSlotBg, Created_SingleItemBG)
    Created_SingleItemBG:SetPosX(5)
    Created_SingleItemBG:SetPosY(itemList_PosY)
    Created_SingleItemBG:addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
    Created_SingleItemBG:addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
    Created_SingleItemBG:SetShow(false)
    tempSingleSlot.itemBG = Created_SingleItemBG
    local Created_SingleItemSlotBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Created_SingleItemBG, "ItemMarket_SingleItemSlotBG_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.static_SlotBg, Created_SingleItemSlotBG)
    Created_SingleItemSlotBG:SetPosX(10)
    Created_SingleItemSlotBG:SetPosY(7)
    Created_SingleItemSlotBG:SetShow(true)
    tempSingleSlot.itemSlotBG = Created_SingleItemSlotBG
    local createSlot = {}
    ;
    (SlotItem.new)(createSlot, "ItemMarket_ItemSingleListSlotItem_" .. itemList_Idx, 0, Created_SingleItemSlotBG, self.slotSingleConfing)
    createSlot:createChild()
    tempSingleSlot.SlotItem = createSlot
    local Created_SingleItemBiddingMark = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Created_SingleItemBG, "ItemMarket_SingleItemBiddingMark_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.static_BiddingMark, Created_SingleItemBiddingMark)
    Created_SingleItemBiddingMark:SetPosX(5)
    Created_SingleItemBiddingMark:SetPosY(3)
    Created_SingleItemBiddingMark:SetShow(false)
    tempSingleSlot.biddingMark = Created_SingleItemBiddingMark
    local Created_SingleItemName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_SingleItemBG, "ItemMarket_SingleItemName_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_ItemName, Created_SingleItemName)
    Created_SingleItemName:SetPosX(60)
    Created_SingleItemName:SetPosY(7)
    Created_SingleItemName:SetTextMode(UI_TM.eTextMode_AutoWrap)
    Created_SingleItemName:SetShow(true)
    tempSingleSlot.itemName = Created_SingleItemName
    local Created_SingleSellPrice_Title = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_SingleItemBG, "ItemMarket_SingleSellPrice_Title_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_SellPrice_Title, Created_SingleSellPrice_Title)
    Created_SingleSellPrice_Title:SetPosX(240)
    Created_SingleSellPrice_Title:SetPosY(20)
    Created_SingleSellPrice_Title:SetShow(true)
    tempSingleSlot.singleSellPrice_Title = Created_SingleSellPrice_Title
    local Created_SingleSellPrice_Value = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_SingleItemBG, "ItemMarket_SingleSellPrice_Value_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_SellPrice_Value, Created_SingleSellPrice_Value)
    Created_SingleSellPrice_Value:SetPosX(320)
    Created_SingleSellPrice_Value:SetPosY(20)
    Created_SingleSellPrice_Value:SetShow(true)
    tempSingleSlot.singleSellPrice_Value = Created_SingleSellPrice_Value
    local Created_SingleRegistPeriod_Title = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_SingleItemBG, "ItemMarket_SingleRegistPeriod_Title_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistPeriod_Title, Created_SingleRegistPeriod_Title)
    Created_SingleRegistPeriod_Title:SetPosX(430)
    Created_SingleRegistPeriod_Title:SetPosY(20)
    Created_SingleRegistPeriod_Title:SetShow(true)
    tempSingleSlot.singleRegistPeriod_Title = Created_SingleRegistPeriod_Title
    local Created_SingleRegistPeriod_Value = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Created_SingleItemBG, "ItemMarket_SingleRegistPeriod_Value_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.txt_RegistPeriod_Value, Created_SingleRegistPeriod_Value)
    Created_SingleRegistPeriod_Value:SetPosX(500)
    Created_SingleRegistPeriod_Value:SetPosY(20)
    Created_SingleRegistPeriod_Value:SetShow(true)
    tempSingleSlot.singleRegistPeriod_Value = Created_SingleRegistPeriod_Value
    local Created_SingleItemBuyItemBTN = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, Created_SingleItemBG, "ItemMarket_SingleItemBuyItemBTN_" .. itemList_Idx)
    CopyBaseProperty(TemplateItemMarket.btn_BuyItem, Created_SingleItemBuyItemBTN)
    Created_SingleItemBuyItemBTN:SetPosX(620)
    Created_SingleItemBuyItemBTN:SetPosY(10)
    Created_SingleItemBuyItemBTN:SetShow(true)
    tempSingleSlot.buyItemBTN = Created_SingleItemBuyItemBTN
    -- DECOMPILER ERROR at PC1316: Confused about usage of register: R43 in 'UnsetPending'

    ;
    (self.itemSingleUiPool)[itemList_Idx] = tempSingleSlot
    itemList_PosY = itemList_PosY + Created_ItemListBTN:GetSizeY() + 2
  end
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
  self.iconTooltip = iconTooltips
end

_getIsClassTypeByFilter = function(idx)
  -- function num : 0_6
  local maxClassCount = getCharacterClassCount()
  if maxClassCount - 1 < idx then
    return false
  end
  local classType = getCharacterClassTypeByIndex(idx)
  local className = getCharacterClassName(classType)
  if className ~= nil and className ~= "" and className ~= " " then
    return true
  end
  return false
end

ItemMarket.Update = function(self, startIndex)
  -- function num : 0_7 , upvalues : DummyData, registMarket, UI_TM, ItemMarket, _startIndex
  if Panel_Window_ItemMarket:GetShow() == false then
    return 
  end
  if ((self.categoryUiPool)[99]):IsCheck() then
    self:SpecialGoodsUpdate(startIndex)
    return 
  end
  if startIndex == nil then
    startIndex = 0
  end
  if self.isGrouplist == true then
    (self.txt_Sort_Parent):SetShow(true)
    ;
    (self.static_SlotBg):SetShow(false)
  else
    ;
    (self.txt_Sort_Parent):SetShow(false)
    ;
    (self.static_SlotBg):SetShow(true)
  end
  for category_Idx = 0, #DummyData.Category do
    local categoryButton = (self.categoryUiPool)[category_Idx]
    categoryButton:SetShow(true)
    categoryButton:SetCheck(false)
  end
  local categoryButton = (self.categoryUiPool)[99]
  categoryButton:SetShow(registMarket)
  categoryButton:SetCheck(false)
  ;
  ((self.categoryUiPool)[self.curItemClassify]):SetCheck(true)
  for idx = 0, self.itemList_MaxCount - 1 do
    (((self.itemGroupUiPool)[idx]).SlotItem):clearItem()
    ;
    (((self.itemSingleUiPool)[idx]).SlotItem):clearItem()
    ;
    (((self.itemGroupUiPool)[idx]).itemBTN):SetShow(false)
    ;
    (((self.itemSingleUiPool)[idx]).itemBG):SetShow(false)
  end
  local itemInfoCount = 0
  if self.isGrouplist then
    itemInfoCount = getItemMarketSummaryInClientCount(self.curItemClassify)
  else
    itemInfoCount = getItemMarketSellInfoInClientCount(self.curTerritoryKeyRaw, self.sellInfoItemEnchantKeyRaw)
  end
  do
    local replaceCount = function(num)
    -- function num : 0_7_0
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
      local uiPoolIdx = 0
      for ui_Idx = 0, self.itemList_MaxCount - 1 do
        local item_idx = startIndex + ui_Idx
        local itemMarketSummaryInfo = getItemMarketSummaryInClientByIndex(self.curItemClassify, item_idx)
        if itemMarketSummaryInfo ~= nil then
          local UiBase = (self.itemGroupUiPool)[uiPoolIdx]
          local iess = itemMarketSummaryInfo:getItemEnchantStaticStatusWrapper()
          _PA_ASSERT(iess ~= nil, "itemMarketSummaryInfo 아이�\156 고정정보�\128 �\173 있어야합니다")
          local enchantLevel = ((iess:get())._key):getEnchantLevel()
          local itemEnchantKeyRaw = ((iess:get())._key):get()
          local nameColorGrade = iess:getGradeType()
          local nameColor = self:SetNameColor(nameColorGrade)
          ;
          (UiBase.itemName):SetFontColor(nameColor)
          local enchantLevel = ((iess:get())._key):getEnchantLevel()
          local itemNameStr = self:SetNameAndEnchantLevel(enchantLevel, iess:getItemType(), iess:getName(), iess:getItemClassify())
          ;
          (UiBase.itemName):SetText(itemNameStr)
          ;
          (UiBase.SlotItem):setItemByStaticStatus(iess, 1, -1, false)
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_GroupItem( " .. item_idx .. "," .. itemEnchantKeyRaw .. " )")
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_On", "_itemMarket_ShowToolTip( " .. item_idx .. ", " .. ui_Idx .. "  )")
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          ;
          (UiBase.averagePrice_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          (UiBase.averagePrice_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          ;
          (UiBase.registHighPrice_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          (UiBase.registHighPrice_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          ;
          (UiBase.registLowPrice_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          (UiBase.registLowPrice_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          ;
          (UiBase.registListCount_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          (UiBase.registListCount_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          ;
          (UiBase.registItemCount_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          (UiBase.registItemCount_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          ;
          (UiBase.recentPrice_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          (UiBase.recentPrice_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          ;
          (UiBase.averagePrice_Title):SetShow(true)
          ;
          (UiBase.averagePrice_Value):SetShow(true)
          ;
          (UiBase.registListCount_Title):SetShow(true)
          ;
          (UiBase.registListCount_Value):SetShow(true)
          ;
          (UiBase.recentPrice_Title):SetShow(true)
          ;
          (UiBase.recentPrice_Value):SetShow(true)
          ;
          (UiBase.registItem_Line_1):SetShow(true)
          ;
          (UiBase.registItem_Line_2):SetShow(true)
          ;
          (UiBase.registItemCount_Title):SetPosY(32)
          ;
          (UiBase.registItemCount_Value):SetPosY(30)
          ;
          (UiBase.registHighPrice_Value):SetText(replaceCount(itemMarketSummaryInfo:getDisplayedHighestOnePrice()))
          ;
          (UiBase.registLowPrice_Value):SetText(replaceCount(itemMarketSummaryInfo:getDisplayedLowestOnePrice()))
          local masterInfo = getItemMarketMasterByItemEnchantKey(itemEnchantKeyRaw)
          local marketConditions = (masterInfo:getMinPrice() + masterInfo:getMaxPrice()) / toInt64(0, 2)
          ;
          (UiBase.averagePrice_Value):SetText(replaceCount(marketConditions))
          ;
          (UiBase.recentPrice_Value):SetText(replaceCount(itemMarketSummaryInfo:getLastTradedOnePrice()))
          ;
          (UiBase.registListCount_Value):SetText(replaceCount(itemMarketSummaryInfo:getTradedTotalAmount()))
          ;
          (UiBase.registItemCount_Value):SetText(replaceCount(itemMarketSummaryInfo:getDisplayedTotalAmount()))
          ;
          (UiBase.itemBTN):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SetScrollIndexByLClick(); HandleClicked_ItemMarket_GroupItem( " .. item_idx .. "," .. itemEnchantKeyRaw .. " )")
          ;
          (UiBase.itemBTN):SetShow(true)
          if Int64toInt32(itemMarketSummaryInfo:getDisplayedTotalAmount()) == 0 then
            (UiBase.itemBTN):SetMonoTone(true)
          else
            (UiBase.itemBTN):SetMonoTone(false)
          end
          uiPoolIdx = uiPoolIdx + 1
        end
        ;
        (self.btn_Sort_ItemName):SetShow(true)
        ;
        (self.btn_Sort_RecentPrice):SetShow(true)
        ;
        (self.btn_Sort_RegistItemCount):SetShow(true)
        ;
        (self.btn_Sort_AverageTradePrice):SetShow(true)
        ;
        (self.btn_Sort_RecentRegistDate):SetShow(true)
        ;
        (self.btn_Search):SetShow(true)
        ;
        (self.btn_ResetSearch):SetShow(true)
        ;
        (self.edit_ItemName):SetShow(true)
      end
      self:SetScroll()
      if itemInfoCount <= self.itemList_MaxCount then
        (self.scroll):SetShow(false)
      else
        (self.scroll):SetShow(true)
      end
    else
      local summaryInfo = getItemMarketSummaryInClientByItemEnchantKey(self.sellInfoItemEnchantKeyRaw)
      if summaryInfo == nil then
        _PA_ASSERT(false, "summaryInfo 아이�\156 종합정보�\128 �\173 있어야합니다")
        return 
      end
      local summaryIess = summaryInfo:getItemEnchantStaticStatusWrapper()
      _PA_ASSERT(summaryIess ~= nil, "summaryInfo 아이�\156 고정정보�\128 �\173 있어야합니다")
      local enchantLevel = ((summaryIess:get())._key):getEnchantLevel()
      local itemEnchantKeyRaw = ((summaryIess:get())._key):get()
      local nameColorGrade = summaryIess:getGradeType()
      local nameColor = self:SetNameColor(nameColorGrade)
      ;
      (self.txt_ItemName):SetFontColor(nameColor)
      local enchantLevel = ((summaryIess:get())._key):getEnchantLevel()
      local itemNameStr = self:SetNameAndEnchantLevel(enchantLevel, summaryIess:getItemType(), summaryIess:getName(), summaryIess:getItemClassify())
      ;
      (self.txt_ItemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (self.txt_ItemName):SetText(itemNameStr)
      ;
      (self.selectSingleSlot):setItemByStaticStatus(summaryIess, 1, -1, false)
      ;
      ((self.selectSingleSlot).icon):addInputEvent("Mouse_On", "_itemMarket_ShowToolTip( " .. 0 .. ", " .. 0 .. ", true )")
      ;
      ((self.selectSingleSlot).icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
      ;
      (self.averagePrice_Title):SetShow(true)
      ;
      (self.recentPrice_Title):SetShow(true)
      ;
      (self.registListCount_Title):SetShow(true)
      ;
      (self.registItemCount_Title):SetShow(true)
      ;
      (self.txt_AveragePrice_Value):SetShow(true)
      ;
      (self.txt_RecentPrice_Value):SetShow(true)
      ;
      (self.txt_RegistListCount_Value):SetShow(true)
      ;
      (self.txt_RegistItemCount_Value):SetShow(true)
      local masterInfo = getItemMarketMasterByItemEnchantKey(itemEnchantKeyRaw)
      local marketConditions = (masterInfo:getMinPrice() + masterInfo:getMaxPrice()) / toInt64(0, 2)
      ;
      (self.txt_AveragePrice_Value):SetText(replaceCount(marketConditions))
      ;
      (self.txt_RecentPrice_Value):SetText(replaceCount(summaryInfo:getLastTradedOnePrice()))
      ;
      (self.txt_RegistHighPrice_Value):SetText(replaceCount(summaryInfo:getDisplayedHighestOnePrice()))
      ;
      (self.txt_RegistLowPrice_Value):SetText(replaceCount(summaryInfo:getDisplayedLowestOnePrice()))
      ;
      (self.txt_RegistListCount_Value):SetText(replaceCount(summaryInfo:getTradedTotalAmount()))
      ;
      (self.txt_RegistItemCount_Value):SetText(replaceCount(summaryInfo:getDisplayedTotalAmount()))
      for ui_Idx = 0, self.itemList_MaxCount - 2 do
        local item_idx = startIndex + ui_Idx
        local sellInfo = getItemMarketSellInfoInClientByIndex(self.curTerritoryKeyRaw, self.sellInfoItemEnchantKeyRaw, item_idx)
        local itemAmount = summaryInfo:getDisplayedTotalAmount()
        if sellInfo ~= nil then
          local UiBase = (self.itemSingleUiPool)[ui_Idx]
          local iess = sellInfo:getItemEnchantStaticStatusWrapper()
          _PA_ASSERT(iess ~= nil, "sellInfo 아이�\156 고정정보�\128 �\173 있어야합니다")
          local enchantLevel = ((iess:get())._key):getEnchantLevel()
          ;
          (UiBase.itemName):SetFontColor(nameColor)
          local isBiddingItem = sellInfo:isBiddingItem()
          local isBuyItem = sellInfo:isBuyItem()
          if isBiddingItem then
            (UiBase.biddingMark):SetShow(true)
          else
            (UiBase.biddingMark):SetShow(false)
          end
          local itemNameStr = self:SetNameAndEnchantLevel(enchantLevel, iess:getItemType(), iess:getName(), iess:getItemClassify())
          ;
          (UiBase.itemName):SetText(itemNameStr)
          ;
          (UiBase.SlotItem):setItemByStaticStatus(iess, sellInfo:getCount(), -1, false)
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_On", "_itemMarket_ShowToolTip( " .. item_idx .. ", " .. R34_PC713 .. ", false  )")
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          ((UiBase.SlotItem).icon):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          local itemEnchantKeyRaw = ((iess:get())._key):get()
          local sumSinglePrice = sellInfo:getTotalPrice() / sellInfo:getCount()
          ;
          (UiBase.singleSellPrice_Value):SetText(makeDotMoney(sumSinglePrice))
          ;
          (UiBase.singleRegistPeriod_Value):SetText(converStringFromLeftDateTime(sellInfo:getDisplayedEndDate()))
          ;
          (UiBase.singleRegistPeriod_Title):SetShow(true)
          ;
          (UiBase.singleRegistPeriod_Value):SetShow(true)
          if ToClient_WorldMapIsShow() == true or ItemMarket.escMenuSaveValue then
            (UiBase.buyItemBTN):SetShow(false)
          else
            (UiBase.buyItemBTN):SetShow(true)
            if isBuyItem == true then
              (UiBase.buyItemBTN):SetEnable(true)
              ;
              (UiBase.buyItemBTN):SetMonoTone(false)
              ;
              (UiBase.buyItemBTN):SetFontColor((Defines.Color).C_FFEFEFEF)
            else
              (UiBase.buyItemBTN):SetEnable(false)
              ;
              (UiBase.buyItemBTN):SetMonoTone(true)
              ;
              (UiBase.buyItemBTN):SetFontColor((Defines.Color).C_FF626262)
            end
            ;
            (UiBase.buyItemBTN):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SingleItem( " .. item_idx .. "," .. self.sellInfoItemEnchantKeyRaw .. ")")
          end
          ;
          (UiBase.buyItemBTN):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
          ;
          (UiBase.buyItemBTN):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
          ;
          (UiBase.itemBG):SetShow(true)
        end
      end
      if itemInfoCount <= self.itemList_MaxCount - 1 then
        (self.scroll):SetShow(false)
      else
        (self.scroll):SetShow(true)
      end
    end
    _startIndex = startIndex
    -- DECOMPILER ERROR: 19 unprocessed JMP targets
  end
end

ItemMarket.SetNameColor = function(self, nameColorGrade)
  -- function num : 0_8 , upvalues : UI_color
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
  -- function num : 0_9
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

ItemMarket.SpecialGoodsUpdate = function(self, startIndex)
  -- function num : 0_10 , upvalues : DummyData, registMarket, UI_color, UI_TM, ItemMarket, _startIndex
  if Panel_Window_ItemMarket:GetShow() == false then
    return 
  end
  if not ((self.categoryUiPool)[99]):IsCheck() then
    return 
  end
  if startIndex == nil then
    startIndex = 0
  end
  if self.isGrouplist then
    (self.txt_Sort_Parent):SetShow(true)
    ;
    (self.static_SlotBg):SetShow(false)
  else
    ;
    (self.txt_Sort_Parent):SetShow(false)
    ;
    (self.static_SlotBg):SetShow(true)
  end
  for category_Idx = 0, #DummyData.Category do
    local categoryButton = (self.categoryUiPool)[category_Idx]
    categoryButton:SetShow(true)
    categoryButton:SetCheck(false)
  end
  local categorySpecialButton = (self.categoryUiPool)[99]
  categorySpecialButton:SetShow(registMarket)
  categorySpecialButton:SetCheck(false)
  ;
  ((self.categoryUiPool)[99]):SetCheck(true)
  for idx = 0, self.itemList_MaxCount - 1 do
    (((self.itemGroupUiPool)[idx]).SlotItem):clearItem()
    ;
    (((self.itemSingleUiPool)[idx]).SlotItem):clearItem()
    ;
    (((self.itemGroupUiPool)[idx]).itemBTN):SetShow(false)
    ;
    (((self.itemSingleUiPool)[idx]).itemBG):SetShow(false)
  end
  local itemCount = ToClient_requestGetSummaryCount()
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

  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  if self.isGrouplist then
    (self.btn_BackPage):SetShow(false)
    local uiPoolIdx = 0
    for ui_Idx = 0, self.itemList_MaxCount - 1 do
      local item_idx = startIndex + ui_Idx
      local itemMarketSummaryInfo = ToClient_requestGetItemEnchantStaticStatusWrapperByIndex(item_idx)
      if itemMarketSummaryInfo ~= nil then
        local UiBase = (self.itemGroupUiPool)[uiPoolIdx]
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
        ;
        (UiBase.itemName):SetFontColor(nameColor)
        local enchantLevel = ((itemMarketSummaryInfo:get())._key):getEnchantLevel()
        if itemMarketSummaryInfo:getItemType() == 1 and enchantLevel > 15 then
          (UiBase.itemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemMarketSummaryInfo:getName())
        else
          if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemMarketSummaryInfo:getItemClassify() then
            (UiBase.itemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemMarketSummaryInfo:getName())
          else
            ;
            (UiBase.itemName):SetText(itemMarketSummaryInfo:getName())
          end
        end
        ;
        (UiBase.SlotItem):setItemByStaticStatus(itemMarketSummaryInfo, 1, -1, false)
        ;
        ((UiBase.SlotItem).icon):addInputEvent("Mouse_LUp", "HandleClicked_SpecialGoods_GroupItem( " .. item_idx .. "," .. itemEnchantKeyRaw .. " )")
        ;
        ((UiBase.SlotItem).icon):addInputEvent("Mouse_On", "_specialGoods_ShowToolTip( " .. item_idx .. ", " .. ui_Idx .. "  )")
        ;
        ((UiBase.SlotItem).icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
        ;
        ((UiBase.SlotItem).icon):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
        ;
        ((UiBase.SlotItem).icon):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
        ;
        (UiBase.registHighPrice_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
        ;
        (UiBase.registHighPrice_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
        ;
        (UiBase.registLowPrice_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
        ;
        (UiBase.registLowPrice_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
        ;
        (UiBase.registItemCount_Title):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
        ;
        (UiBase.registItemCount_Title):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
        ;
        (UiBase.registHighPrice_Value):SetText(replaceCount(ToClient_requestGetDisplayedHighestOnePriceByItemEnchantKeyRaw(itemEnchantKeyRaw)))
        ;
        (UiBase.registLowPrice_Value):SetText(replaceCount(ToClient_requestGetDisplayedLowestOnePriceByItemEnchantKeyRaw(itemEnchantKeyRaw)))
        ;
        (UiBase.averagePrice_Title):SetShow(false)
        ;
        (UiBase.averagePrice_Value):SetShow(false)
        ;
        (UiBase.registListCount_Title):SetShow(false)
        ;
        (UiBase.registListCount_Value):SetShow(false)
        ;
        (UiBase.recentPrice_Title):SetShow(false)
        ;
        (UiBase.recentPrice_Value):SetShow(false)
        ;
        (UiBase.registItem_Line_1):SetShow(false)
        ;
        (UiBase.registItem_Line_2):SetShow(false)
        ;
        (UiBase.registItemCount_Value):SetText(replaceCount(ToClient_requestGetItemCountByItemEnchantKeyRaw(itemEnchantKeyRaw)))
        ;
        (UiBase.itemBTN):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SetScrollIndexByLClick(); HandleClicked_SpecialGoods_GroupItem( " .. item_idx .. "," .. itemEnchantKeyRaw .. " )")
        ;
        (UiBase.itemBTN):SetShow(true)
        ;
        (UiBase.registItemCount_Title):SetPosY(22)
        ;
        (UiBase.registItemCount_Value):SetPosY(20)
        if ToClient_requestGetItemCountByItemEnchantKeyRaw(itemEnchantKeyRaw) == 0 then
          (UiBase.itemBTN):SetMonoTone(true)
        else
          ;
          (UiBase.itemBTN):SetMonoTone(false)
        end
        uiPoolIdx = uiPoolIdx + 1
      end
      do
        do
          ;
          (self.btn_Sort_ItemName):SetShow(false)
          ;
          (self.btn_Sort_RecentPrice):SetShow(false)
          ;
          (self.btn_Sort_RegistItemCount):SetShow(false)
          ;
          (self.btn_Sort_AverageTradePrice):SetShow(false)
          ;
          (self.btn_Sort_RecentRegistDate):SetShow(false)
          ;
          (self.btn_Search):SetShow(false)
          ;
          (self.btn_ResetSearch):SetShow(false)
          ;
          (self.edit_ItemName):SetShow(false)
          -- DECOMPILER ERROR at PC417: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
    self:SetScroll()
    ;
    (self.txt_SpecialGoodsName):SetShow(true)
    ;
    (self.txt_SpecialGoodsDesc):SetShow(true)
  else
    do
      local itemMarketSummaryInfo = getItemEnchantStaticStatus(ItemEnchantKey(self.specialItemEnchantKeyRaw))
      local itemEnchantKeyRaw = ((itemMarketSummaryInfo:get())._key):get()
      local enchantLevel = ((itemMarketSummaryInfo:get())._key):getEnchantLevel()
      itemCount = ToClient_requestGetItemCountByItemEnchantKeyRaw(itemEnchantKeyRaw)
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
      (self.txt_ItemName):SetFontColor(nameColor)
      local enchantLevel = ((itemMarketSummaryInfo:get())._key):getEnchantLevel()
      ;
      (self.txt_ItemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
      if itemMarketSummaryInfo:getItemType() == 1 and enchantLevel > 15 then
        (self.txt_ItemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemMarketSummaryInfo:getName())
      else
        if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemMarketSummaryInfo:getItemClassify() then
          (self.txt_ItemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemMarketSummaryInfo:getName())
        else
          ;
          (self.txt_ItemName):SetText(itemMarketSummaryInfo:getName())
        end
      end
      ;
      (self.selectSingleSlot):setItemByStaticStatus(itemMarketSummaryInfo, 1, -1, false)
      ;
      (self.txt_RegistHighPrice_Value):SetText(replaceCount(ToClient_requestGetDisplayedHighestOnePriceByItemEnchantKeyRaw(itemEnchantKeyRaw)))
      ;
      (self.txt_RegistLowPrice_Value):SetText(replaceCount(ToClient_requestGetDisplayedLowestOnePriceByItemEnchantKeyRaw(itemEnchantKeyRaw)))
      ;
      (self.averagePrice_Title):SetShow(false)
      ;
      (self.recentPrice_Title):SetShow(false)
      ;
      (self.registListCount_Title):SetShow(false)
      ;
      (self.registItemCount_Title):SetShow(false)
      ;
      (self.txt_AveragePrice_Value):SetShow(false)
      ;
      (self.txt_RecentPrice_Value):SetShow(false)
      ;
      (self.txt_RegistListCount_Value):SetShow(false)
      ;
      (self.txt_RegistItemCount_Value):SetShow(false)
      ;
      ((self.selectSingleSlot).icon):addInputEvent("Mouse_On", "_specialGoodsSingle_ShowToolTip( " .. itemEnchantKeyRaw .. ")")
      ;
      ((self.selectSingleSlot).icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
      do
        local maxCount = (math.min)(itemCount - 1, self.itemList_MaxCount - 2)
        for ui_Idx = 0, maxCount do
          local item_idx = startIndex + ui_Idx
          if itemMarketSummaryInfo ~= nil then
            local UiBase = (self.itemSingleUiPool)[ui_Idx]
            ;
            (UiBase.itemName):SetFontColor(nameColor)
            if itemMarketSummaryInfo:getItemType() == 1 and enchantLevel > 15 then
              (UiBase.itemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemMarketSummaryInfo:getName())
            else
              if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemMarketSummaryInfo:getItemClassify() then
                (UiBase.itemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemMarketSummaryInfo:getName())
              else
                ;
                (UiBase.itemName):SetText(itemMarketSummaryInfo:getName())
              end
            end
            ;
            (UiBase.SlotItem):setItemByStaticStatus(itemMarketSummaryInfo, 1, -1, false)
            ;
            ((UiBase.SlotItem).icon):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
            ;
            ((UiBase.SlotItem).icon):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
            ;
            ((UiBase.SlotItem).icon):addInputEvent("Mouse_On", "_specialGoodsSingle_ShowToolTip( " .. itemEnchantKeyRaw .. ", " .. ui_Idx .. "  )")
            ;
            ((UiBase.SlotItem).icon):addInputEvent("Mouse_Out", "_itemMarket_HideToolTip()")
            ;
            (UiBase.singleSellPrice_Value):SetText(makeDotMoney(ToClient_requestGetItemPrice(itemEnchantKeyRaw, item_idx)))
            ;
            (UiBase.singleRegistPeriod_Title):SetShow(false)
            ;
            (UiBase.singleRegistPeriod_Value):SetShow(false)
            if ToClient_WorldMapIsShow() == true or ItemMarket.escMenuSaveValue then
              (UiBase.buyItemBTN):SetShow(false)
            else
              ;
              (UiBase.buyItemBTN):SetShow(true)
              ;
              (UiBase.buyItemBTN):SetEnable(true)
              ;
              (UiBase.buyItemBTN):SetMonoTone(false)
              ;
              (UiBase.buyItemBTN):SetFontColor((Defines.Color).C_FFEFEFEF)
              ;
              (UiBase.buyItemBTN):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SpecialItem( " .. item_idx .. "," .. itemEnchantKeyRaw .. ")")
            end
            ;
            (UiBase.buyItemBTN):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
            ;
            (UiBase.buyItemBTN):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
            ;
            (UiBase.itemBG):SetShow(true)
          end
        end
        ;
        (self.txt_SpecialGoodsName):SetShow(false)
        ;
        (self.txt_SpecialGoodsDesc):SetShow(false)
        _startIndex = startIndex
      end
    end
  end
end

ItemMarket.ResetFilterBtn = function(self)
  -- function num : 0_11 , upvalues : ItemMarket
  self.curFilterIndex = -1
  if isGameTypeJapan() then
    self.itemmarketClassCount = 11
  else
    if isGameTypeRussia() then
      self.itemmarketClassCount = 10
    else
      if isGameTypeEnglish() then
        self.itemmarketClassCount = 8
      end
    end
  end
  for filter_Idx = 0, self.itemmarketClassCount - 1 do
    ((ItemMarket.filterUiPool)[filter_Idx]):SetCheck(false)
  end
end

ItemMarket.SetPosition = function(self)
  -- function num : 0_12
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_ItemMarket:GetSizeX()
  local panelSizeY = Panel_Window_ItemMarket:GetSizeY()
  Panel_Window_ItemMarket:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_ItemMarket:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end

_itemMarket_doSortList = function(sortTarget, sortValue, isResetScroll)
  -- function num : 0_13 , upvalues : ItemMarket
  local self = ItemMarket
  local isNum = 0
  if sortValue == true then
    isNum = 1
  end
  selectSort(sortTarget, isNum)
  if isResetScroll == nil or isResetScroll then
    self.nowStartIdx = 0
    ;
    (self.scroll):SetControlTop()
  end
  self:SetScroll()
  self:Update(self.nowStartIdx)
end

_itemMarket_ChangeTextureByCategory = function(categoryIdx)
  -- function num : 0_14 , upvalues : ItemMarket, _categoryTexture
  local self = ItemMarket
  local control = (self.categoryUiPool)[categoryIdx]
  control:ChangeTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/ItemMarket_02.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, ((_categoryTexture[categoryIdx])[0])[1], ((_categoryTexture[categoryIdx])[0])[2], ((_categoryTexture[categoryIdx])[0])[3], ((_categoryTexture[categoryIdx])[0])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
  local x1, y1, x2, y2 = setTextureUV_Func(control, ((_categoryTexture[categoryIdx])[1])[1], ((_categoryTexture[categoryIdx])[1])[2], ((_categoryTexture[categoryIdx])[1])[3], ((_categoryTexture[categoryIdx])[1])[4])
  ;
  (control:getOnTexture()):setUV(x1, y1, x2, y2)
  local x1, y1, x2, y2 = setTextureUV_Func(control, ((_categoryTexture[categoryIdx])[2])[1], ((_categoryTexture[categoryIdx])[2])[2], ((_categoryTexture[categoryIdx])[2])[3], ((_categoryTexture[categoryIdx])[2])[4])
  ;
  (control:getClickTexture()):setUV(x1, y1, x2, y2)
end

_itemMarket_ChangeTextureBySort = function(control, sortTarget, sortValue)
  -- function num : 0_15 , upvalues : ItemMarket, _sortTexture
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

_itemMarket_ShowToolTip = function(item_idx, ui_Idx, isSelected)
  -- function num : 0_16 , upvalues : ItemMarket
  local self = ItemMarket
  local itemStaticStatus, UiBase = nil, nil
  if isSelected == nil then
    local itemMarketSummaryInfo = getItemMarketSummaryInClientByIndex(self.curItemClassify, item_idx)
    itemStaticStatus = itemMarketSummaryInfo:getItemEnchantStaticStatusWrapper()
    UiBase = (((self.itemGroupUiPool)[ui_Idx]).SlotItem).icon
    Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil)
  else
    do
      if isSelected == true then
        local summaryInfo = getItemMarketSummaryInClientByIndex(self.curItemClassify, self.curSummaryItemIndex)
        itemStaticStatus = summaryInfo:getItemEnchantStaticStatusWrapper()
        UiBase = (self.selectSingleSlot).icon
        Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil)
      else
        do
          if isSelected == false then
            local sellInfo = getItemMarketSellInfoInClientByIndex(self.curTerritoryKeyRaw, self.sellInfoItemEnchantKeyRaw, item_idx)
            itemWrapper = sellInfo:getItemWrapper()
            UiBase = (((self.itemSingleUiPool)[ui_Idx]).SlotItem).icon
            Panel_Tooltip_Item_Show(itemWrapper, UiBase, false, true, nil, nil, true)
          end
        end
      end
    end
  end
end

_specialGoods_ShowToolTip = function(item_idx, ui_Idx)
  -- function num : 0_17 , upvalues : ItemMarket
  local self = ItemMarket
  local itemStaticStatus, UiBase = nil, nil
  itemStaticStatus = ToClient_requestGetItemEnchantStaticStatusWrapperByIndex(item_idx)
  UiBase = (((self.itemGroupUiPool)[ui_Idx]).SlotItem).icon
  Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil)
end

_specialGoodsSingle_ShowToolTip = function(enchantKey, ui_Idx)
  -- function num : 0_18 , upvalues : ItemMarket
  local self = ItemMarket
  local itemStaticStatus = (getItemEnchantStaticStatus(ItemEnchantKey(enchantKey)))
  local UiBase = nil
  if itemStaticStatus ~= nil then
    if ui_Idx == nil then
      UiBase = (self.selectSingleSlot).icon
    else
      UiBase = (((self.itemGroupUiPool)[ui_Idx]).SlotItem).icon
    end
    Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil)
  end
end

_itemMarket_HideToolTip = function()
  -- function num : 0_19
  Panel_Tooltip_Item_hideTooltip()
end

_itemMarket_ShowIconToolTip = function(isShow, listType, iconType, uiIdx)
  -- function num : 0_20 , upvalues : ItemMarket, _startIndex
  local self = ItemMarket
  local UiBase = nil
  if listType == 0 then
    UiBase = (self.itemGroupUiPool)[uiIdx]
  else
    UiBase = self
  end
  if iconType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_AVG_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_AVG_DESC")
    uiControl = UiBase.averagePrice_Title
  else
    if iconType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_RECENT_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_RECENT_DESC")
      uiControl = UiBase.recentPrice_Title
      local itemMarketSummaryInfo = nil
      if uiIdx == nil then
        itemMarketSummaryInfo = getItemMarketSummaryInClientByItemEnchantKey(self.sellInfoItemEnchantKeyRaw)
      else
        itemMarketSummaryInfo = getItemMarketSummaryInClientByIndex(self.curItemClassify, uiIdx + _startIndex)
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
          uiControl = UiBase.registHighPrice_Title
        else
          if iconType == 3 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLOWPRICE_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLOWPRICE_DESC")
            uiControl = UiBase.registLowPrice_Title
          else
            if iconType == 4 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLISTCOUNT_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTLISTCOUNT_DESC")
              uiControl = UiBase.registListCount_Title
            else
              if iconType == 5 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTITEMCOUNT_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_REGISTITEMCOUNT_DESC")
                uiControl = UiBase.registItemCount_Title
              else
                if iconType == 10 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_ITEMNAME_NAME")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_ITEMNAME_DESC")
                  uiControl = self.btn_Sort_ItemName
                else
                  if iconType == 11 then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_RECENTPRICE_NAME")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_RECENTPRICE_DESC")
                    uiControl = self.btn_Sort_RecentPrice
                  else
                    if iconType == 12 then
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_REGISTITEMCOUNT_NAME")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_SORT_REGISTITEMCOUNT_DESC")
                      uiControl = self.btn_Sort_RegistItemCount
                    else
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
                    end
                  end
                end
              end
            end
          end
        end
        if isShow == true then
          registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
          TooltipSimple_Show(uiControl, name, desc)
        else
          TooltipSimple_Hide()
        end
      end
    end
  end
end

_itemMarket_MoneyToolTip = function(isShow, tipType)
  -- function num : 0_21 , upvalues : ItemMarket
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

_itemMarket_Search = function(bScrollReset)
  -- function num : 0_22 , upvalues : ItemMarket
  local self = ItemMarket
  local text = (self.edit_ItemName):GetEditText()
  if text == nil or text == "" or PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") == text then
    return 
  end
  self.txt_ItemNameBackPage = text
  searchFilteredVector(self.curItemClassify, text)
  self:SetScroll()
  self.isSearch = true
  if bScrollReset == nil or bScrollReset then
    self.nowStartIdx = 0
    ;
    (self.scroll):SetControlTop()
  end
  self:Update(self.nowStartIdx)
end

HandleClicked_ItemMarket_SetAlarm = function(itemEnchantKeyRaw)
  -- function num : 0_23
  local totalItemCount = toClient_GetItemMarketFavoriteItemListSize()
  if itemEnchantKeyRaw ~= nil then
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
    toClient_AddItemMarketFavoriteItem(itemEnchantKeyRaw)
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
        enchantString = "I"
      else
        if enchantLevel == 17 then
          enchantString = "II"
        else
          if enchantLevel == 18 then
            enchantString = "III"
          else
            if enchantLevel == 19 then
              enchantString = "IV"
            else
              if enchantLevel == 20 then
                enchantString = "V"
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
              enchantString = "I"
            else
              if enchantLevel == 2 then
                enchantString = "II"
              else
                if enchantLevel == 3 then
                  enchantString = "III"
                else
                  if enchantLevel == 4 then
                    enchantString = "IV"
                  else
                    if enchantLevel == 5 then
                      enchantString = "V"
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
  -- function num : 0_24 , upvalues : ItemMarket, isPreBidOpen
  do
    local self = ItemMarket
    if ToClient_WorldMapIsShow() or ToClient_CheckExistSummonMaid() or ItemMarket.escMenuSaveValue then
      requestItemMarketSellInfo(self.curTerritoryKeyRaw, itemEnchantKeyRaw, true)
    else
      requestItemMarketSellInfo(self.curTerritoryKeyRaw, itemEnchantKeyRaw, false)
    end
    self.isGrouplist = false
    self.nowStartIdx = 0
    self.sellInfoItemEnchantKeyRaw = itemEnchantKeyRaw
    self.curSummaryItemIndex = itemIdx
    self:SetScroll()
    ;
    (self.scroll):SetControlTop()
    self:Update(self.nowStartIdx)
    ;
    (self.btn_BackPage):SetShow(true)
    ;
    (self.btn_BackPage):addInputEvent("Mouse_LUp", "FGlobal_HandleClicked_ItemMarketBackPage()")
    ;
    (self.btn_SetAlarm):SetShow(true)
    ;
    (self.btn_SetPreBid):SetShow((not self.isWorldMapOpen and isPreBidOpen))
    ;
    (self.btn_Refresh):SetShow(true)
    if isGameTypeRussia() then
      (self.btn_SetAlarm):SetSize(235, 32)
      ;
      (self.btn_SetAlarm):SetPosX(640)
      ;
      (self.btn_SetPreBid):SetSize(135, 32)
      ;
      (self.btn_SetPreBid):SetPosX(500)
      ;
      (self.btn_Refresh):SetSize(135, 32)
      if (self.btn_SetPreBid):GetShow() then
        (self.btn_Refresh):SetPosX(365)
      else
        (self.btn_Refresh):SetPosX(500)
      end
    else
      (self.btn_SetAlarm):SetSize(135, 32)
      ;
      (self.btn_SetAlarm):SetPosX(730)
      ;
      (self.btn_SetPreBid):SetSize(135, 32)
      ;
      (self.btn_SetPreBid):SetPosX(595)
      ;
      (self.btn_Refresh):SetSize(135, 32)
      if (self.btn_SetPreBid):GetShow() then
        (self.btn_Refresh):SetPosX(460)
      else
        (self.btn_Refresh):SetPosX(595)
      end
    end
    ;
    (self.btn_SetAlarm):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SetAlarm( " .. itemEnchantKeyRaw .. " )")
    ;
    (self.btn_SetPreBid):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketPreBid_Open( " .. itemEnchantKeyRaw .. ", 0 )")
    if Panel_Tooltip_Item:GetShow() or Panel_Tooltip_Item_equipped:GetShow() then
      Panel_Tooltip_Item_hideTooltip()
    end
    -- DECOMPILER ERROR: 8 unprocessed JMP targets
  end
end

HandleClicked_SpecialGoods_GroupItem = function(itemIdx, itemEnchantKeyRaw)
  -- function num : 0_25 , upvalues : ItemMarket
  local self = ItemMarket
  if not ToClient_WorldMapIsShow() and not ToClient_CheckExistSummonMaid() then
    local isIgnoreNpc = ItemMarket.escMenuSaveValue
  end
  ToClient_requestListSellInfo(isIgnoreNpc)
  self.isGrouplist = false
  self.nowStartIdx = 0
  self.specialItemEnchantKeyRaw = itemEnchantKeyRaw
  self.curSpecialItemIndex = itemIdx
  self:SetScroll()
  ;
  (self.scroll):SetControlTop()
  self:SpecialGoodsUpdate(self.nowStartIdx)
  ;
  (self.btn_BackPage):SetShow(true)
  ;
  (self.btn_BackPage):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SelectCategory( 99, 1 , 99 )")
  if isGameTypeRussia() then
    (self.btn_SetAlarm):SetSize(235, 32)
    ;
    (self.btn_SetPreBid):SetSize(135, 32)
    ;
    (self.btn_Refresh):SetSize(135, 32)
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
  if Panel_Tooltip_Item:GetShow() or Panel_Tooltip_Item_equipped:GetShow() then
    Panel_Tooltip_Item_hideTooltip()
  end
end

HandleClicked_ItemMarket_SingleItem = function(slotidx, itemEnchantKeyRaw)
  -- function num : 0_26 , upvalues : ItemMarket
  local self = ItemMarket
  local itemCount = self._registerCount
  self.buyItemKeyraw = itemEnchantKeyRaw
  self.buyItemSlotidx = slotidx
  local sellInfo = getItemMarketSellInfoInClientByIndex(self.curTerritoryKeyRaw, self.sellInfoItemEnchantKeyRaw, slotidx)
  local masterInfo = getItemMarketMasterByItemEnchantKey(itemEnchantKeyRaw)
  local itemName = ""
  local itemBuyCount = sellInfo:getCount()
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
  -- function num : 0_27
  FGlobal_HandleClicked_ItemMarket_SingleItem_Do(1)
end

local isOpenByMaid = false
ItemMarket_UpdateMoneyByWarehouse = function()
  -- function num : 0_28 , upvalues : ItemMarket, isOpenByMaid
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
  -- function num : 0_29 , upvalues : ItemMarket
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

do
  local _specialGoodsIndex, _specialGoodsEnchantKeyRaw = nil, nil
  HandleClicked_ItemMarket_SpecialItem = function(index, enchantKeyRaw)
  -- function num : 0_30 , upvalues : ItemMarket, _specialGoodsIndex, _specialGoodsEnchantKeyRaw
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
      _specialGoodsIndex = self.curSpecialItemIndex
      _specialGoodsEnchantKeyRaw = enchantKeyRaw
    end
  end
end

  FromClient_notifyItemMarketMessage = function(msgType, strParam1, param1, param2, param3, param4)
  -- function num : 0_31 , upvalues : ItemMarket
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
          enchantString = "I"
        else
          if enchantLevel == 17 then
            enchantString = "II"
          else
            if enchantLevel == 18 then
              enchantString = "III"
            else
              if enchantLevel == 19 then
                enchantString = "IV"
              else
                if enchantLevel == 20 then
                  enchantString = "V"
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
                enchantString = "I"
              else
                if enchantLevel == 2 then
                  enchantString = "II"
                else
                  if enchantLevel == 3 then
                    enchantString = "III"
                  else
                    if enchantLevel == 4 then
                      enchantString = "IV"
                    else
                      if enchantLevel == 5 then
                        enchantString = "V"
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
                                    enchantString = "I"
                                  else
                                    if enchantLevel == 17 then
                                      enchantString = "II"
                                    else
                                      if enchantLevel == 18 then
                                        enchantString = "III"
                                      else
                                        if enchantLevel == 19 then
                                          enchantString = "IV"
                                        else
                                          if enchantLevel == 20 then
                                            enchantString = "V"
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
                                          enchantString = "I"
                                        else
                                          if enchantLevel == 2 then
                                            enchantString = "II"
                                          else
                                            if enchantLevel == 3 then
                                              enchantString = "III"
                                            else
                                              if enchantLevel == 4 then
                                                enchantString = "IV"
                                              else
                                                if enchantLevel == 5 then
                                                  enchantString = "V"
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
                                                        enchantString = "I"
                                                      else
                                                        if enchantLevel == 17 then
                                                          enchantString = "II"
                                                        else
                                                          if enchantLevel == 18 then
                                                            enchantString = "III"
                                                          else
                                                            if enchantLevel == 19 then
                                                              enchantString = "IV"
                                                            else
                                                              if enchantLevel == 20 then
                                                                enchantString = "V"
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
                                                              enchantString = "I"
                                                            else
                                                              if enchantLevel == 2 then
                                                                enchantString = "II"
                                                              else
                                                                if enchantLevel == 3 then
                                                                  enchantString = "III"
                                                                else
                                                                  if enchantLevel == 4 then
                                                                    enchantString = "IV"
                                                                  else
                                                                    if enchantLevel == 5 then
                                                                      enchantString = "V"
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
  -- function num : 0_32 , upvalues : ItemMarket
  local self = ItemMarket
  if not (self.static_SlotBg):GetShow() then
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
  self.nowStartIdx = 0
  self:SetScroll()
  ;
  (self.scroll):SetControlTop()
  self:Update(self.nowStartIdx)
  if Panel_Tooltip_Item:GetShow() or Panel_Tooltip_Item_equipped:GetShow() then
    Panel_Tooltip_Item_hideTooltip()
  end
end

  HandleClicked_ItemMarket_SelectCategory = function(categoryIdx, isBackPage, realCategory_Idx)
  -- function num : 0_33 , upvalues : ItemMarket
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
  self.selectCategory = categoryIdx
  _itemMarket_ResetTextureBySort(self)
  if categoryIdx == 99 then
    if not self.isWorldMapOpen then
      ToClient_requestListSellInfo(ToClient_CheckExistSummonMaid())
      requestItemMarketSummaryInfo(self.curTerritoryKeyRaw, self.isWorldMapOpen, true)
      self.curItemClassify = realCategory_Idx
      self.isGrouplist = true
      self.curClassType = -1
      self.curServantType = -1
      if self.curFilterIndex > -1 then
        local maxClassCount = getCharacterClassCount()
        for filter_Idx = 0, maxClassCount - 1 do
          local classType = getCharacterClassTypeByIndex(filter_Idx)
          local className = getCharacterClassName(classType)
          if className ~= nil and className ~= "" and className ~= " " then
            self.curClassType = classType
          end
        end
      end
      do
        if categoryIdx ~= 99 then
          selectCategory(categoryIdx)
        end
        self:SetScroll()
        ;
        (self.scroll):SetControlTop()
        self:ResetFilterBtn()
        self.nowStartIdx = 0
        ;
        (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
        if isBackPage == 1 then
          self.txt_ItemNameBackPage = ""
        end
        if categoryIdx == 99 then
          ItemMarket:SpecialGoodsUpdate()
        else
          self:Update(self.nowStartIdx)
        end
      end
    end
  end
end

  ShowTooltip_ItemMarket_Category = function(isShow, index)
  -- function num : 0_34 , upvalues : ItemMarket, DummyData
  local self = ItemMarket
  name = (DummyData.Category)[index]
  desc = nil
  uiControl = (self.categoryUiPool)[index]
  if isShow == true then
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

  HandleClicked_ItemMarket_SelectFilter = function(filterIdx)
  -- function num : 0_35 , upvalues : ItemMarket
  local self = ItemMarket
  if ((self.categoryUiPool)[99]):IsCheck() then
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
  if self.curFilterIndex == filterIdx then
    ((ItemMarket.filterUiPool)[filterIdx]):SetCheck(false)
    self.curFilterIndex = -1
  else
    self.curFilterIndex = filterIdx
  end
  local classType = -1
  local servantType = -1
  if self.curFilterIndex > -1 then
    local getClassType = getCharacterClassTypeByIndex(filterIdx)
    local className = getCharacterClassName(getClassType)
    if className ~= nil and className ~= "" and className ~= " " then
      classType = getClassType
    end
  end
  do
    self.isGrouplist = true
    selectFilter(classType, servantType)
    ;
    (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
    self.txt_ItemNameBackPage = ""
    self:SetScroll()
    ;
    (self.scroll):SetControlTop()
    self.nowStartIdx = 0
    self:Update(self.nowStartIdx)
  end
end

  HandleClicked_ItemMarket_ItemSort = function(sortTarget)
  -- function num : 0_36 , upvalues : ItemMarket
  local self = ItemMarket
  self.selectItemSort = sortTarget
  _itemMarket_ChangeTextureBySort(self.btn_Sort_ItemName, 0, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_RecentPrice, 1, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_RegistItemCount, 2, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_AverageTradePrice, 3, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_RecentRegistDate, 4, true)
  local sortValue = false
  local control = nil
  if sortTarget == 0 then
    self.isSort_ItemName = not self.isSort_ItemName
    self.isSort_RecentPrice = true
    self.isSort_RegistItemCount = true
    self.isSort_AverageTradePrice = true
    self.isSort_RecentRegistDate = true
    sortValue = self.isSort_ItemName
    control = self.btn_Sort_ItemName
  else
    if sortTarget == 1 then
      self.isSort_ItemName = true
      self.isSort_RecentPrice = not self.isSort_RecentPrice
      self.isSort_RegistItemCount = true
      self.isSort_AverageTradePrice = true
      self.isSort_RecentRegistDate = true
      sortValue = self.isSort_RecentPrice
      control = self.btn_Sort_RecentPrice
    else
      if sortTarget == 2 then
        self.isSort_ItemName = true
        self.isSort_RecentPrice = true
        self.isSort_RegistItemCount = not self.isSort_RegistItemCount
        self.isSort_AverageTradePrice = true
        self.isSort_RecentRegistDate = true
        sortValue = self.isSort_RegistItemCount
        control = self.btn_Sort_RegistItemCount
      else
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
      end
    end
  end
  self.isChangeSort = true
  self.curSortTarget = sortTarget
  self.curSortValue = sortValue
  _itemMarket_doSortList(sortTarget, sortValue)
  _itemMarket_ChangeTextureBySort(control, sortTarget, sortValue)
end

  _itemMarket_ResetTextureBySort = function(control)
  -- function num : 0_37
  local self = control
  self.curSortValue = false
  self.isSort_ItemName = true
  self.isSort_RecentPrice = true
  self.isSort_RegistItemCount = true
  self.isSort_AverageTradePrice = true
  self.isSort_RecentRegistDate = true
  _itemMarket_ChangeTextureBySort(self.btn_Sort_ItemName, 0, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_RecentPrice, 1, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_RegistItemCount, 2, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_AverageTradePrice, 3, true)
  _itemMarket_ChangeTextureBySort(self.btn_Sort_RecentRegistDate, 4, true)
end

  HandleClicked_ItemMarket_Close = function()
  -- function num : 0_38
  if isNewItemmarket_chk() then
    FGolbal_ItemMarketNew_Close()
  else
    FGolbal_ItemMarket_Close()
  end
end

  HandleClicked_ItemMarket_Search = function()
  -- function num : 0_39
  _itemMarket_Search()
end

  HandleClicked_ItemMarket_ResetSearch = function()
  -- function num : 0_40 , upvalues : ItemMarket
  toClient_ResetSearch()
  ;
  (ItemMarket.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), true)
  ClearFocusEdit()
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  ItemMarket.txt_ItemNameBackPage = ""
  ItemMarket:Update(ItemMarket.nowStartIdx)
end

  HandleClicked_ItemMarket_RefreshList = function()
  -- function num : 0_41 , upvalues : ItemMarket
  HandleClicked_ItemMarket_GroupItem(ItemMarket.curSummaryItemIndex, ItemMarket.sellInfoItemEnchantKeyRaw)
end

  HandleClicked_ItemMarket_SetScrollIndexByLClick = function()
  -- function num : 0_42 , upvalues : ItemMarket
  local self = ItemMarket
  local maxInterval = self.scrollInverVal
  local posByInterval = 1 / maxInterval
  local currentInterval = (math.floor)((self.scroll):GetControlPos() / posByInterval + 0.5)
  self.nowStartIdx = currentInterval
  self:Update(self.nowStartIdx)
  self.nowScrollPos = (self.scroll):GetControlPos(0)
end

  HandleClicked_ItemMarket_EditText = function()
  -- function num : 0_43 , upvalues : ItemMarket, IM
  local self = ItemMarket
  ;
  (self.edit_ItemName):SetEditText("", true)
  SetFocusEdit(self.edit_ItemName)
  if ToClient_WorldMapIsShow() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
    SetUIMode((Defines.UIMode).eUIMode_WoldMapSearch)
  else
    if ItemMarket.escMenuSaveValue then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
      SetUIMode((Defines.UIMode).eUIMode_WoldMapSearch)
    end
  end
end

  FGolbal_ItemMarket_Search = function()
  -- function num : 0_44 , upvalues : IM, ItemMarket
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

  HandleClicked_ItemMarket_RegistItem = function()
  -- function num : 0_45
  Warehouse_OpenPanelFromMaid()
  HandleClicked_WhItemMarketRegistItem_Open(true)
  Panel_Window_ItemMarket:SetShow(false)
end

  FGlobal_ItemMarket_Open = function()
  -- function num : 0_46 , upvalues : ItemMarket, IM, ItemClassify
  local self = ItemMarket
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
  self.curTerritoryKeyRaw = regionInfoWrapper:getTerritoryKeyRaw()
  ;
  (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NAMING"))
  self.curItemClassify = ItemClassify.eItemClassify_Etc
  self.curClassType = -1
  self.curServantType = -1
  self.curFilterIndex = -1
  self.isGrouplist = true
  self.nowStartIdx = 0
  self.isWorldMapOpen = false
  self.isChangeSort = false
  self.curSortTarget = -1
  self.curSortValue = false
  self.isSearch = false
  requestOpenItemMarket()
  requestItemMarketSummaryInfo(self.curTerritoryKeyRaw, false, false)
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  self.txt_ItemNameBackPage = ""
  ClearFocusEdit()
  self:ResetFilterBtn()
  self:SetPosition()
  self:SetScroll()
  ;
  (self.scroll):SetControlTop()
  self:Update(self.nowStartIdx)
  _itemMarket_ResetTextureBySort(self)
  ;
  (self.btn_RegistItem):SetShow(false)
end

  FGlobal_ItemMarket_Open_ForWorldMap = function(territoryKeyRaw, escMenu)
  -- function num : 0_47 , upvalues : ItemMarket, ItemClassify
  local self = ItemMarket
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R3 in 'UnsetPending'

  ItemMarket.escMenuSaveValue = escMenu
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
  self.curItemClassify = ItemClassify.eItemClassify_Etc
  self.curClassType = -1
  self.curServantType = -1
  self.curFilterIndex = -1
  self.isGrouplist = true
  self.nowStartIdx = 0
  self.isChangeSort = false
  self.curSortTarget = -1
  self.curSortValue = false
  self.isSearch = false
  requestOpenItemMarket()
  ClearFocusEdit()
  self.txt_ItemNameBackPage = ""
  ;
  (self.btn_MyList):SetShow(true)
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  ;
  (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_NAMING"))
  Panel_Window_ItemMarket:SetShow(true)
  self:ResetFilterBtn()
  self:SetPosition()
  self:SetScroll()
  ;
  (self.scroll):SetControlTop()
  ;
  (self.btn_BackPage):SetShow(false)
  ;
  (self.btn_SetAlarm):SetShow(false)
  ;
  (self.btn_SetPreBid):SetShow(false)
  ;
  (self.btn_Refresh):SetShow(false)
  self:Update(self.nowStartIdx)
  ;
  (self.btn_RegistItem):SetShow(false)
end

  FGlobal_ItemMarket_OpenByMaid = function()
  -- function num : 0_48 , upvalues : ItemMarket, isOpenByMaid, ItemClassify
  local self = ItemMarket
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
  self.curItemClassify = ItemClassify.eItemClassify_Etc
  self.curClassType = -1
  self.curServantType = -1
  self.curFilterIndex = -1
  self.isGrouplist = true
  self.nowStartIdx = 0
  self.isWorldMapOpen = false
  self.isChangeSort = false
  self.curSortTarget = -1
  self.curSortValue = false
  self.isSearch = false
  requestOpenItemMarket()
  requestItemMarketSummaryInfo(self.curTerritoryKeyRaw, false, false)
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  self.txt_ItemNameBackPage = ""
  ClearFocusEdit()
  self:ResetFilterBtn()
  self:SetPosition()
  self:SetScroll()
  ;
  (self.scroll):SetControlTop()
  self:Update(self.nowStartIdx)
  _itemMarket_ResetTextureBySort(self)
  ;
  (self.btn_RegistItem):SetShow(true)
end

  FGolbal_ItemMarket_Close = function()
  -- function num : 0_49 , upvalues : IM, isOpenByMaid, ItemMarket
  if Panel_Window_ItemMarket:IsShow() == false then
    return 
  end
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
  if not Panel_Window_ItemMarket_Function:GetShow() and ItemMarket.escMenuSaveValue == true then
    SetUIMode((Defines.UIMode).eUIMode_Default)
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

    ItemMarket.escMenuSaveValue = false
  end
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
end

  Update_ItemMarketMasterInfo = function()
  -- function num : 0_50 , upvalues : ItemMarket
  local self = ItemMarket
  if ((self.categoryUiPool)[99]):IsCheck() then
    self:SpecialGoodsUpdate(self.nowStartIdx)
    return 
  end
  ItemMarket:Update(self.nowStartIdx)
end

  Update_ItemMarketSummaryInfo = function()
  -- function num : 0_51 , upvalues : ItemMarket
  local self = ItemMarket
  if ((self.categoryUiPool)[99]):IsCheck() then
    self:SpecialGoodsUpdate(self.nowStartIdx)
    return 
  end
  local text = self.txt_ItemNameBackPage
  if text ~= nil or text ~= "" or PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") ~= text then
    searchFilteredVector(self.curItemClassify, text)
    self:SetScroll()
  end
  ItemMarket:Update(self.nowStartIdx)
end

  Update_ItemMarketSellInfo = function()
  -- function num : 0_52 , upvalues : ItemMarket
  local self = ItemMarket
  self.nowStartIdx = 0
  self:SetScroll()
  ;
  (self.scroll):SetControlTop()
  if ((self.categoryUiPool)[99]):IsCheck() then
    self:SpecialGoodsUpdate(self.nowStartIdx)
    return 
  end
  self:Update(self.nowStartIdx)
end

  FromClient_NotifyItemMarketByParty = function(notifyType, param0, param1)
  -- function num : 0_53 , upvalues : ItemMarket, _specialGoodsIndex, _specialGoodsEnchantKeyRaw
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

  ItemMarket_SimpleToolTips = function(isShow, sortType)
  -- function num : 0_54
  local name, desc, uiControl = nil, nil, nil
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

  FGlobal_HandleClicked_ItemMarketBackPage = function()
  -- function num : 0_55 , upvalues : ItemMarket
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
  local text = self.txt_ItemNameBackPage
  if text ~= nil and text ~= "" and PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") ~= text then
    ClearFocusEdit()
    SetFocusEdit(self.edit_ItemName)
    searchFilteredVector(self.curItemClassify, text)
    self:SetScroll()
  end
  self:Update(self.nowStartIdx)
  ;
  (self.scroll):SetControlPos(self.nowScrollPos)
  HandleClicked_ItemMarket_SetScrollIndexByLClick()
end

  FGlobal_isOpenItemMarketBackPage = function()
  -- function num : 0_56 , upvalues : ItemMarket
  local self = ItemMarket
  return (self.btn_BackPage):GetShow()
end

  ItemMarket.registEventHandler = function(self)
  -- function num : 0_57
  (self.static_ItemListBG):addInputEvent("Mouse_DownScroll", "ItemMarket_ScrollUpdate( true )")
  ;
  (self.static_ItemListBG):addInputEvent("Mouse_UpScroll", "ItemMarket_ScrollUpdate( false )")
  ;
  ((self.selectSingleSlot).icon):addInputEvent("Mouse_RUp", "HandleClicked_ItemMarket_UnSetGroupItem()")
  ;
  (self.static_ListHeadBG):addInputEvent("Mouse_RUp", "HandleClicked_ItemMarket_UnSetGroupItem()")
  ;
  (self.edit_ItemName):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_EditText()")
  ;
  (self.edit_ItemName):RegistReturnKeyEvent("FGolbal_ItemMarket_Search()")
  ;
  (self.btn_Sort_ItemName):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_ItemSort( " .. 0 .. " )")
  ;
  (self.btn_Sort_RecentPrice):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_ItemSort( " .. 1 .. " )")
  ;
  (self.btn_Sort_RegistItemCount):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_ItemSort( " .. 2 .. " )")
  ;
  (self.btn_Sort_AverageTradePrice):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_ItemSort( " .. 3 .. " )")
  ;
  (self.btn_Sort_RecentRegistDate):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_ItemSort( " .. 4 .. " )")
  ;
  (self.btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_Close()")
  ;
  (self.btn_Search):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_Search()")
  ;
  (self.btn_ResetSearch):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_ResetSearch()")
  ;
  (self.btn_Refresh):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_RefreshList()")
  ;
  (self.averagePrice_Title):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 0 .. ")")
  ;
  (self.averagePrice_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.recentPrice_Title):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 1 .. ")")
  ;
  (self.recentPrice_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.registHighPrice_Title):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 2 .. ")")
  ;
  (self.registHighPrice_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.registLowPrice_Title):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 3 .. ")")
  ;
  (self.registLowPrice_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.registListCount_Title):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 4 .. ")")
  ;
  (self.registListCount_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.registItemCount_Title):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 5 .. ")")
  ;
  (self.registItemCount_Title):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.averagePrice_Title):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 0 .. ")")
  ;
  (self.recentPrice_Title):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 1 .. ")")
  ;
  (self.registHighPrice_Title):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 2 .. ")")
  ;
  (self.registLowPrice_Title):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 3 .. ")")
  ;
  (self.registListCount_Title):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 4 .. ")")
  ;
  (self.registItemCount_Title):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 5 .. ")")
  ;
  (self.scrollCtrlBTN):addInputEvent("Mouse_LPress", "HandleClicked_ItemMarket_SetScrollIndexByLClick()")
  ;
  (self.scroll):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_SetScrollIndexByLClick()")
  ;
  (self.scroll):addInputEvent("Mouse_DownScroll", "HandleClicked_ItemMarket_SetScrollIndexByLClick()")
  ;
  (self.scroll):addInputEvent("Mouse_UpScroll", "HandleClicked_ItemMarket_SetScrollIndexByLClick()")
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
  (self.btn_Sort_ItemName):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 10 .. " )")
  ;
  (self.btn_Sort_ItemName):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.btn_Sort_RecentPrice):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 11 .. " )")
  ;
  (self.btn_Sort_RecentPrice):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.btn_Sort_RegistItemCount):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 12 .. " )")
  ;
  (self.btn_Sort_RegistItemCount):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.btn_Sort_AverageTradePrice):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 13 .. " )")
  ;
  (self.btn_Sort_AverageTradePrice):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.btn_Sort_RecentRegistDate):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 14 .. " )")
  ;
  (self.btn_Sort_RecentRegistDate):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.btn_BackPage):addInputEvent("Mouse_On", "_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 15 .. " )")
  ;
  (self.btn_BackPage):addInputEvent("Mouse_Out", "_itemMarket_ShowIconToolTip( false )")
  ;
  (self.invenMoneyTit):addInputEvent("Mouse_On", "_itemMarket_MoneyToolTip( true, 0 )")
  ;
  (self.invenMoneyTit):addInputEvent("Mouse_Out", "_itemMarket_MoneyToolTip( false )")
  ;
  (self.warehouseMoneyTit):addInputEvent("Mouse_On", "_itemMarket_MoneyToolTip( true, 1 )")
  ;
  (self.warehouseMoneyTit):addInputEvent("Mouse_Out", "_itemMarket_MoneyToolTip( false )")
  ;
  (self.btn_Sort_ItemName):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 10 .. " )")
  ;
  (self.btn_Sort_RecentPrice):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 11 .. " )")
  ;
  (self.btn_Sort_RegistItemCount):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 12 .. " )")
  ;
  (self.btn_Sort_AverageTradePrice):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 13 .. " )")
  ;
  (self.btn_Sort_RecentRegistDate):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 14 .. " )")
  ;
  (self.btn_BackPage):setTooltipEventRegistFunc("_itemMarket_ShowIconToolTip( true, " .. 1 .. ", " .. 15 .. " )")
end

  ItemMarket.registMessageHandler = function(self)
  -- function num : 0_58
  registerEvent("FromClient_notifyItemMarketMessage", "FromClient_notifyItemMarketMessage")
  registerEvent("FromClient_InventoryUpdate", "ItemMarket_UpdateMoneyByWarehouse")
  registerEvent("EventWarehouseUpdate", "ItemMarket_UpdateMoneyByWarehouse")
  registerEvent("FromClient_NotifyItemMarketByParty", "FromClient_NotifyItemMarketByParty")
end

  ItemMarket:Initialize()
  ItemMarket:registEventHandler()
  ItemMarket:registMessageHandler()
  -- DECOMPILER ERROR: 5 unprocessed JMP targets
end

