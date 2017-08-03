-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_favorite.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
Panel_Window_ItemMarket_Favorite:SetShow(false)
local ItemMarket_FavoriteItem = {list2 = (UI.getChildControl)(Panel_Window_ItemMarket_Favorite, "List2_FavoriteItemList"), _closeButton = (UI.getChildControl)(Panel_Window_ItemMarket_Favorite, "Button_Win_Close"), _emptyItem = (UI.getChildControl)(Panel_Window_ItemMarket_Favorite, "StaticText_EmptyFavoriteItem"), _notifyBG = (UI.getChildControl)(Panel_Window_ItemMarket_Favorite, "Static_NotifyBG"), _notifyText = (UI.getChildControl)(Panel_Window_ItemMarket_Favorite, "StaticText_Notify"), _registItemButton = (UI.getChildControl)(Panel_Window_ItemMarket_Favorite, "Button_RegistItem"), _allResetButton = (UI.getChildControl)(Panel_Window_ItemMarket_Favorite, "Button_AllReset"), 
uiData = {}
, textCount = 0, searchIndex = 0, isSearchTooltip = false, isDeleteTooltip = false}
;
(ItemMarket_FavoriteItem._emptyItem):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
;
(ItemMarket_FavoriteItem._notifyText):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
FGlobal_ItemMarket_FavoriteItem_Open = function()
  -- function num : 0_0 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  Panel_Window_ItemMarket_Favorite:SetShow(true)
  Panel_Window_ItemMarket_Favorite:SetPosX(Panel_Window_ItemMarket:GetPosX() + Panel_Window_ItemMarket:GetSizeX())
  Panel_Window_ItemMarket_Favorite:SetPosY(Panel_Window_ItemMarket:GetPosY() + 60)
  self.textCount = 0
  ;
  (self._emptyItem):SetShow(false)
  local favoriteWordList = ToClient_getItemMarketFavoritesSearchList()
  for i = 0, #favoriteWordList do
    if favoriteWordList[i] ~= nil then
      self.textCount = self.textCount + 1
    else
      ;
      (self._emptyItem):SetShow(true)
    end
  end
  ;
  ((self.list2):getElementManager()):clearKey()
  for key = 0, self.textCount - 1 do
    ((self.list2):getElementManager()):pushKey(toInt64(0, key))
  end
end

ItemMarket_FavoriteItem_CloseEvent = function()
  -- function num : 0_1
  FGlobal_ItemMarket_FavoriteBtn_CheckOff()
  ItemMarket_FavoriteItem_Close()
end

ItemMarket_FavoriteItem_Close = function()
  -- function num : 0_2 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  ToClient_saveFavoritesSearchListClientData()
  Panel_Window_ItemMarket_Favorite:SetShow(false)
end

FGlobal_ItemMarket_FavoriteItem_Close = function()
  -- function num : 0_3
  ItemMarket_FavoriteItem_Close()
end

ItemMarket_FavoriteItem_Init = function()
  -- function num : 0_4 , upvalues : ItemMarket_FavoriteItem
  ToClient_loadFavoritesSearchListClientData()
  local self = ItemMarket_FavoriteItem
  ;
  ((self.list2):getElementManager()):clearKey()
  for key = 0, self.textCount - 1 do
    ((self.list2):getElementManager()):pushKey(toInt64(0, key))
  end
  ;
  (self._emptyItem):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_EMPTYITEM"))
  ;
  (self._notifyText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_NOTIFY"))
  do
    if (self._notifyBG):GetSizeY() < (self._notifyText):GetTextSizeY() + 10 then
      local sizeY = (self._notifyText):GetTextSizeY() - (self._notifyBG):GetSizeY() + 10
      Panel_Window_ItemMarket_Favorite:SetSize(Panel_Window_ItemMarket_Favorite:GetSizeX(), Panel_Window_ItemMarket_Favorite:GetSizeY() + sizeY)
      ;
      (self._notifyBG):SetSize((self._notifyBG):GetSizeX(), (self._notifyBG):GetSizeY() + sizeY)
      ;
      (self._notifyText):SetPosY((self._notifyText):GetPosY() + sizeY / 2)
      ;
      (self._allResetButton):SetPosY((self._allResetButton):GetPosY() + sizeY)
      ;
      (self._registItemButton):SetPosY((self._registItemButton):GetPosY() + sizeY)
    end
    ;
    (self._closeButton):addInputEvent("Mouse_LUp", "ItemMarket_FavoriteItem_CloseEvent()")
    ;
    (self._allResetButton):addInputEvent("Mouse_LUp", "ItemMarket_FavoriteItem_AllReset()")
    ;
    (self._registItemButton):addInputEvent("Mouse_LUp", "ItemMarket_FavoriteItem_RegistItem()")
  end
end

FGlobal_ItemMarket_FavoriteItem_Regist = function(text, enchantKey)
  -- function num : 0_5 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  if self.textCount == 10 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_NOTREGIST"))
    return 
  end
  local favoriteWordList = ToClient_getItemMarketFavoritesSearchList()
  for i = 0, #favoriteWordList do
    if favoriteWordList[i] ~= nil and text == (favoriteWordList[i]):getItemName() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_ALREADYREGIST"))
      return 
    end
  end
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_REGISTITEM"))
  ToClient_addItemMarketFavoritesItem(text, enchantKey)
  ToClient_saveFavoritesSearchListClientData()
  local favoriteWordList = ToClient_getItemMarketFavoritesSearchList()
  ;
  ((self.list2):getElementManager()):clearKey()
  self.textCount = self.textCount + 1
  ;
  (self._emptyItem):SetShow(false)
  for key = 0, self.textCount - 1 do
    ((self.list2):getElementManager()):pushKey(toInt64(0, key))
  end
end

FavoriteItem_ListControlCreate = function(content, key)
  -- function num : 0_6 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  local itemBg = (UI.getChildControl)(content, "List2_ItemBG")
  local itemName = (UI.getChildControl)(content, "List2_ItemName")
  local searchBtn = (UI.getChildControl)(content, "List2_ItemSearch")
  local deleteBtn = (UI.getChildControl)(content, "List2_ItemDelete")
  itemName:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  itemBg:SetIgnore(false)
  local favoriteWordList = ToClient_getItemMarketFavoritesSearchList()
  local _key = Int64toInt32(key)
  if (favoriteWordList[_key]):getItemName() ~= nil then
    itemName:SetText(_key + 1 .. ". " .. (favoriteWordList[_key]):getItemName())
  end
  local name = ""
  local desc = ""
  if self.isSearchTooltip then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_SEARCH_TOOLTIP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_SEARCH_TOOLTIP_DESC")
    TooltipSimple_Show(searchBtn, name, desc)
  else
    if self.isDeleteTooltip then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_DELETE_TOOLTIP_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_DELETE_TOOLTIP_DESC")
      TooltipSimple_Show(deleteBtn, name, desc)
    else
      TooltipSimple_Hide()
    end
  end
  itemBg:addInputEvent("Mouse_LUp", "FavoriteItem_ListControlMouseClick( " .. _key .. " ) ")
  searchBtn:addInputEvent("Mouse_On", "ItemMarket_FavoriteItem_SearchOn( true, " .. _key .. ")")
  searchBtn:addInputEvent("Mouse_Out", "ItemMarket_FavoriteItem_SearchOn( false, " .. _key .. ")")
  searchBtn:addInputEvent("Mouse_LUp", "ItemMarket_FavoriteItem_Search( " .. _key .. ")")
  deleteBtn:addInputEvent("Mouse_On", "ItemMarket_FavoriteItem_DeleteOn( true, " .. _key .. ")")
  deleteBtn:addInputEvent("Mouse_Out", "ItemMarket_FavoriteItem_DeleteOn( false, " .. _key .. ")")
  deleteBtn:addInputEvent("Mouse_LUp", "ItemMarket_FavoriteItem_Delete( " .. _key .. ")")
end

ItemMarket_FavoriteItem_SearchOn = function(isOn, index)
  -- function num : 0_7 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  self.isSearchTooltip = isOn
  ;
  (self.list2):requestUpdateByKey(toInt64(0, index))
end

ItemMarket_FavoriteItem_DeleteOn = function(isOn, index)
  -- function num : 0_8 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  self.isDeleteTooltip = isOn
  ;
  (self.list2):requestUpdateByKey(toInt64(0, index))
end

ItemMarket_FavoriteItem_Search = function(index)
  -- function num : 0_9 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  self.searchIndex = index
  local favoriteWordList = ToClient_getItemMarketFavoritesSearchList()
  FGlobal_FavoriteItem_Search((favoriteWordList[index]):getItemName(), (favoriteWordList[index]):getEnchantKey())
end

ItemMarket_FavoriteItem_Delete = function(index)
  -- function num : 0_10 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  self.searchIndex = index
  local contentStr = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_DELETEITEM")
  local messageboxData = {title = "", content = contentStr, functionYes = ItemMarket_FavoriteItem_Delete_Yes, functionCancel = MessageBox_Empty_function, priority = CppEnums.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

ItemMarket_FavoriteItem_Delete_Yes = function()
  -- function num : 0_11 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  local favoriteWordList = ToClient_getItemMarketFavoritesSearchList()
  ToClient_deleteItemMarketFavoritesItem((favoriteWordList[self.searchIndex]):getItemName())
  self.textCount = self.textCount - 1
  ;
  ((self.list2):getElementManager()):clearKey()
  for key = 0, self.textCount - 1 do
    ((self.list2):getElementManager()):pushKey(toInt64(0, key))
  end
  if self.textCount == 0 then
    (self._emptyItem):SetShow(true)
  end
  ToClient_saveFavoritesSearchListClientData()
end

ItemMarket_FavoriteItem_AllReset = function()
  -- function num : 0_12 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  self.searchIndex = index
  local contentStr = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_FAVORITE_ALLRESET")
  local messageboxData = {title = "", content = contentStr, functionYes = ItemMarket_FavoriteItem_Reset_Yes, functionCancel = MessageBox_Empty_function, priority = CppEnums.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

ItemMarket_FavoriteItem_RegistItem = function()
  -- function num : 0_13
  FGlobal_ItemMarket_FavoriteItemRegiste()
end

ItemMarket_FavoriteItem_Reset_Yes = function()
  -- function num : 0_14 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  for i = 0, self.textCount - 1 do
    local favoriteWordList = ToClient_getItemMarketFavoritesSearchList()
    ToClient_deleteItemMarketFavoritesItem((favoriteWordList[self.textCount - i - 1]):getItemName())
  end
  self.textCount = 0
  ;
  ((self.list2):getElementManager()):clearKey()
  for key = 0, self.textCount - 1 do
    ((self.list2):getElementManager()):pushKey(toInt64(0, key))
  end
  ;
  (self._emptyItem):SetShow(true)
  ToClient_saveFavoritesSearchListClientData()
end

FavoriteItem_ListControlMouseClick = function(index)
  -- function num : 0_15
  ItemMarket_FavoriteItem_Search(index)
end

ItemMarket_registEventHandler = function()
  -- function num : 0_16 , upvalues : ItemMarket_FavoriteItem
  local self = ItemMarket_FavoriteItem
  ;
  (self.list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FavoriteItem_ListControlCreate")
  ;
  (self.list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

ItemMarket_registEventHandler()
ItemMarket_FavoriteItem_Init()

