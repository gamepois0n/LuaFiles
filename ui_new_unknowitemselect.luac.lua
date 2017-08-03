-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap\unknowitemselect\ui_new_unknowitemselect.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local ENT = CppEnums.ExplorationNodeType
local UI_color = Defines.Color
local UI_TYPE = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
local isReserveContentOpen = ToClient_IsContentsGroupOpen("1023")
Panel_Window_UnknownRandomSelect:SetDragEnable(true)
Panel_Window_UnknownRandomSelect:SetDragAll(true)
local _selectSlotNo = -1
local _priceRate = -1
local _itemIcon = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "Static_ItemIcon")
local _itemNameValue = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "StaticText_UnknowItemName")
local _itemValue = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "StaticText_ItemPriceValue")
local _itemButtonReSelect = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "Button_ItemReSelect")
local _itemButtonSelect = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "Button_ItemSelect")
local _myInven = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "StaticText_Money")
local _myWareHouse = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "StaticText_Money2")
local _myInvenBtn = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "RadioButton_Icon_Money")
local _myWareHouseBtn = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "RadioButton_Icon_Money2")
local _iconSilver = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "StaticText_Gold_Icon3")
local _itemPriceBG = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "StaticText_ItemPrice")
local _reserveButton = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "Button_Reserve")
local _reserveAni = (UI.getChildControl)(Panel_Window_UnknownRandomSelect, "Static_SequenceSlotAni")
_reserveAni:SetShow(false)
local _reserveTime = ((UI.getChildControl)(Panel_Window_UnknownRandomSelect, "StaticText_ReservationLeftTime"))
local shopTypeNum = nil
local randomShopItemPrice = 0
randomSelect_ReserveAni = function(isShow)
  -- function num : 0_0 , upvalues : _reserveAni, _reserveTime
  _reserveAni:SetShow(isShow)
  _reserveAni:setUpdateTextureAni(isShow)
  _reserveTime:SetShow(isShow)
  if isShow == false then
    _reserveTime:SetText(nil)
  else
    ToClient_UpdateRandomShopKeepTime()
  end
end

randomShopShow = function(slotNo, priceRate)
  -- function num : 0_1 , upvalues : _priceRate, _selectSlotNo, _itemIcon, randomShopItemPrice, _itemValue, _iconSilver, _itemPriceBG, _itemNameValue, shopTypeNum, _reserveButton, isReserveContentOpen, _itemButtonReSelect, _itemButtonSelect
  _priceRate = priceRate
  local sellCount = npcShop_getBuyCount()
  local selfPlayer = getSelfPlayer()
  local MyWp = selfPlayer:getWp()
  for ii = 0, sellCount - 1 do
    local itemwrapper = npcShop_getItemBuy(ii)
    local shopItem = itemwrapper:get()
    if slotNo == shopItem.shopSlotNo then
      _selectSlotNo = shopItem.shopSlotNo
      itemRandomSS = itemwrapper:getStaticStatus()
      sellPrice_64 = (itemRandomSS:get())._sellPriceToNpc_s64
      sellPrice_32 = Int64toInt32(sellPrice_64)
      if itemRandomSS ~= nil then
        local itemIconPath = itemRandomSS:getIconPath()
        _itemIcon:ChangeTextureInfoName("Icon/" .. itemIconPath)
        _itemIcon:addInputEvent("Mouse_On", "ItemRandomShowToolTip( " .. ii .. ", " .. slotNo .. " )")
        local price32 = Int64toInt32(shopItem.price_s64)
        price32 = price32 * priceRate / 1000000
        randomShopItemPrice = price32
        _itemValue:SetText(makeDotMoney(price32))
        _iconSilver:SetPosX(_itemPriceBG:GetPosX() + 50)
        _itemValue:SetPosX(_iconSilver:GetPosX() + _iconSilver:GetSizeX() + 10)
        _itemNameValue:SetText(itemRandomSS:getName())
      end
    end
  end
  if shopTypeNum == 12 then
    useWp = 50
    _reserveButton:SetShow(isReserveContentOpen)
  else
    if shopTypeNum == 13 then
      useWp = 10
      _reserveButton:SetShow(false)
    end
  end
  if ToClient_IsRandomShopKeepItem() == true and shopTypeNum == 12 then
    randomSelect_ReserveAni(true)
  else
    randomSelect_ReserveAni(false)
  end
  if MyWp < useWp then
    _itemButtonReSelect:SetEnable(false)
    _itemButtonReSelect:SetMonoTone(true)
  else
    if ToClient_isReSelectRandomShopItem() == true then
      _itemButtonReSelect:SetEnable(true)
      _itemButtonReSelect:SetMonoTone(false)
    else
      _itemButtonReSelect:SetEnable(false)
      _itemButtonReSelect:SetMonoTone(true)
    end
  end
  local btnReSelectSizeX = _itemButtonReSelect:GetSizeX() + 23
  local btnReSelectTextPosX = btnReSelectSizeX - btnReSelectSizeX / 2 - _itemButtonReSelect:GetTextSizeX() / 2
  _itemButtonReSelect:SetTextSpan(btnReSelectTextPosX, 5)
  local btnSelectSizeX = _itemButtonSelect:GetSizeX() + 23
  local btnSelectTextPosX = btnSelectSizeX - btnSelectSizeX / 2 - _itemButtonSelect:GetTextSizeX() / 2
  _itemButtonSelect:SetTextSpan(btnSelectTextPosX, 5)
  randomSelectShow()
end

randomSelectShow = function()
  -- function num : 0_2 , upvalues : _myInvenBtn, _myWareHouseBtn, _myInven, _myWareHouse
  Panel_Window_UnknownRandomSelect:SetShow(true)
  if ToClient_HasWareHouseFromNpc() then
    if toInt64(0, 0) == warehouse_moneyFromNpcShop_s64() then
      _myInvenBtn:SetCheck(true)
      _myWareHouseBtn:SetCheck(false)
    else
      _myInvenBtn:SetCheck(false)
      _myWareHouseBtn:SetCheck(true)
    end
  else
    _myInvenBtn:SetCheck(true)
    _myWareHouseBtn:SetCheck(false)
  end
  _myInven:SetPosX(_myInvenBtn:GetPosX() + _myInvenBtn:GetTextSizeX() + 35)
  _myWareHouse:SetPosX(_myWareHouseBtn:GetPosX() + _myWareHouseBtn:GetTextSizeX() + 35)
end

randomSelectHide = function()
  -- function num : 0_3
  Panel_Window_UnknownRandomSelect:SetShow(false)
end

click_ItemReSelect = function()
  -- function num : 0_4 , upvalues : shopTypeNum
  messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_UNKNOWITEMSELECT_RESELECT_TITLE")
  if shopTypeNum == 12 then
    contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UNKNOWITEMSELECT_RESELECT_STRING", "getWp", (getSelfPlayer()):getWp())
  else
    if shopTypeNum == 13 then
      contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UNKNOWITEMSELECT_RESELECT_STRING2", "getWp", (getSelfPlayer()):getWp())
    end
  end
  local messageboxData = {title = messageTitle, content = contentString, functionYes = Item_RequestShopList, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

click_ReserveKeepItem = function()
  -- function num : 0_5 , upvalues : _selectSlotNo, _priceRate
  ToClient_ReserveRandomShopItem(_selectSlotNo, _priceRate)
end

Item_RequestShopList = function()
  -- function num : 0_6 , upvalues : shopTypeNum, _itemButtonReSelect
  local myWp = (getSelfPlayer()):getWp()
  if shopTypeNum == 12 then
    useWp = 50
  else
    if shopTypeNum == 13 then
      useWp = 10
    end
  end
  if myWp < useWp then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UNKNOWITEMSELECT_WP_SHORTAGE_ACK"))
    randomSelectHide()
  else
    npcShop_requestList((CppEnums.ContentsType).Contents_Shop, true)
    if myWp < useWp then
      _itemButtonReSelect:SetEnable(false)
      _itemButtonReSelect:SetMonoTone(true)
    else
      _itemButtonReSelect:SetEnable(true)
      _itemButtonReSelect:SetMonoTone(false)
    end
  end
end

click_ItemSelect = function()
  -- function num : 0_7
  messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_UNKNOWITEMSELECT_RESELECT_TITLE")
  messageMemo = PAGetString(Defines.StringSheet_GAME, "LUA_UNKNOWITEMSELECT_BUYITEMCONFIRM")
  local messageboxData = {title = messageTitle, content = messageMemo, functionYes = Item_RequestDoBuy, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Item_RequestDoBuy = function()
  -- function num : 0_8 , upvalues : _myInvenBtn, randomShopItemPrice, _selectSlotNo, _priceRate
  local invenCheck = _myInvenBtn:IsCheck()
  local wareHouseMoney = warehouse_moneyFromNpcShop_s64()
  local moneyWhereType = (CppEnums.ItemWhereType).eInventory
  if invenCheck then
    moneyWhereType = (CppEnums.ItemWhereType).eInventory
    if (((getSelfPlayer()):get()):getInventory()):getMoney_s64() < toInt64(0, randomShopItemPrice) then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarket_Not_Enough_Money"))
    end
  else
    moneyWhereType = (CppEnums.ItemWhereType).eWarehouse
    if wareHouseMoney < toInt64(0, randomShopItemPrice) then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RANDOMITEM_WAREHOUSEMONEY"))
      return 
    end
  end
  npcShop_doBuyInRandomShop(_selectSlotNo, 1, moneyWhereType, 0, _priceRate)
  _priceRate = -1
  _selectSlotNo = -1
  Panel_Window_UnknownRandomSelect:SetShow(false)
end

FGlobal_ItemRandom_Money_Update = function()
  -- function num : 0_9 , upvalues : _myInven, _myWareHouse
  _myInven:SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  _myWareHouse:SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
end

ItemRandomShowToolTip = function(ii, slotNo)
  -- function num : 0_10 , upvalues : _itemIcon
  local itemwrapper = npcShop_getItemBuy(ii)
  if itemwrapper ~= nil then
    local itemRandomSS = itemwrapper:getStaticStatus()
    Panel_Tooltip_Item_Show(itemRandomSS, _itemIcon, true, false, nil)
  end
end

ItemRandomHideToolTip = function()
  -- function num : 0_11
  Panel_Tooltip_Item_hideTooltip()
end

itemShop_registEventHandler = function()
  -- function num : 0_12 , upvalues : _itemButtonReSelect, _itemButtonSelect, _itemIcon, _reserveButton
  _itemButtonReSelect:addInputEvent("Mouse_LUp", "click_ItemReSelect()")
  _itemButtonSelect:addInputEvent("Mouse_LUp", "click_ItemSelect()")
  _itemIcon:addInputEvent("Mouse_Out", "ItemRandomHideToolTip()")
  _reserveButton:addInputEvent("Mouse_LUp", "click_ReserveKeepItem()")
end

FromClient_EventRandomShopShow_Random = function(shopType, slotNo, priceRate)
  -- function num : 0_13 , upvalues : shopTypeNum
  shopTypeNum = shopType
  if shopType == 12 or shopType == 13 then
    randomShopShow(slotNo, priceRate)
  end
end

FromClient_NotifyRandomShop = function(notifyType)
  -- function num : 0_14
  if notifyType == 2 then
    randomSelect_ReserveAni(false)
  else
    if notifyType == 3 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RESERVED_RANDOMSHOPITEM"))
      randomSelect_ReserveAni(true)
    else
      if notifyType == 4 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CLEAR_RANDOMSHOPITEM"))
        randomSelect_ReserveAni(false)
      else
        if notifyType == 5 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PURCHASE_RANDOMSHOPITEM"))
          randomSelect_ReserveAni(false)
        end
      end
    end
  end
end

FromClient_UpdateRandomShopKeepTime = function(u16_year, u16_month, u16_day, u16_hour, u16_minute)
  -- function num : 0_15 , upvalues : _reserveTime
  local tempStr = {[0] = tostring(u16_minute) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE"), [1] = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_HOUR", "hour", tostring(u16_hour)), [2] = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_DAY", "day", tostring(u16_day)), [3] = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_MONTH", "month", tostring(u16_month)), [4] = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_YEAR", "year", tostring(u16_year))}
  local resultString = tempStr[4] .. "" .. tempStr[3] .. "" .. tempStr[2] .. "" .. tempStr[1] .. "" .. tempStr[0]
  _reserveTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENDTIME_RANDOMSHOPITEM") .. resultString)
end

registerEvent("FromClient_UpdateRandomShopKeepTime", "FromClient_UpdateRandomShopKeepTime")
registerEvent("FromClient_NotifyRandomShop", "FromClient_NotifyRandomShop")
registerEvent("FromClient_EventRandomShopShow", "FromClient_EventRandomShopShow_Random")
registerEvent("EventWarehouseUpdate", "FGlobal_ItemRandom_Money_Update")
itemShop_registEventHandler()
FGlobal_ItemRandom_Money_Update()

