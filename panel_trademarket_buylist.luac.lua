-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\trademarket\panel_trademarket_buylist.luac 

-- params : ...
-- function num : 0
local VCK = CppEnums.VirtualKeyCode
Panel_Trade_Market_BuyItemList:SetShow(false, false)
Panel_Trade_Market_BuyItemList:SetAlpha(1)
Panel_Trade_Market_BuyItemList:setGlassBackground(true)
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local _ItemPanel = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "Static_Panel")
local _SlotBG = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "Static_Slot")
local _ItemIcon = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "Static_Icon")
local _RemainCount = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_remainCount")
local _ItemName = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_itemName")
local _SellPrice = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_sellPrice")
local _QuotationRate = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_QuotationRate")
local _AddCard = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "Button_AddCart")
local _showTrade = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "Button_TradeInfoShow")
local _expiration = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_Option")
local _TitleName = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_BuyListTitle")
local _buyingCondition = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_BuyingCondition")
local _supply = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_Supply")
local _descBg = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "Static_DescBg")
local _desc = (UI.getChildControl)(Panel_Trade_Market_BuyItemList, "StaticText_Desc")
_ItemPanel:SetShow(false, true)
_SlotBG:SetShow(false, true)
_ItemIcon:SetShow(false, true)
_RemainCount:SetShow(false, true)
_ItemName:SetShow(false, true)
_SellPrice:SetShow(false, true)
_QuotationRate:SetShow(false, true)
_AddCard:SetShow(false, true)
_showTrade:SetShow(false, true)
_buyingCondition:SetShow(false, true)
_supply:SetShow(false)
_ItemName:SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
_desc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
_desc:SetText(_desc:GetText())
_descBg:SetSize(_descBg:GetSizeX(), (math.max)(_descBg:GetSizeY(), _desc:GetTextSizeY() + 10))
local tradeBuyMarket = {isTradeMode = 0, iconSizeCalcX = 260, iconSizeCalcY = 190, maxSellCount = 9, enCommerceIndex = -1, isOpenShop = false, 
slotConfig = {createIcon = true, createBorder = true, createCount = false, createCash = true}
, 
ListBody = {}
, 
itemSlot_BG = {}
, 
remainCount = {}
, 
itemName = {}
, 
sellPrice = {}
, 
Quotation = {}
, 
AddCart = {}
, 
trendShow = {}
, 
expiration = {}
, 
buyingCondition = {}
, 
itemEnchantKey = {}
, 
itemIndex = {}
, 
supply = {}
, 
icons = {}
}
local territoryName = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")), [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")), [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")), [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6"))}
global_buyListExit = function()
  -- function num : 0_0
  if Panel_Trade_Market_BuyItemList:IsShow() then
    Panel_Trade_Market_BuyItemList:SetShow(false)
  end
end

global_isShopOpen = function()
  -- function num : 0_1 , upvalues : tradeBuyMarket
  return tradeBuyMarket.isOpenShop
end

global_buyListOpen = function(enCommerceIndex)
  -- function num : 0_2 , upvalues : tradeBuyMarket
  local rv = npcShop_CheckBuyListByCommerceType(enCommerceIndex)
  if rv == false then
    return 
  end
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  tradeBuyMarket.enCommerceIndex = enCommerceIndex
  Panel_Trade_Market_BuyItemList:SetShow(true)
  for count = 1, tradeBuyMarket.maxSellCount do
    tradeBuyMarket:setShowTradeIcon(count, false)
  end
  global_setBuyList()
end

local tradeBuyMarketList_Position = function()
  -- function num : 0_3
  local basePosX = Panel_Trade_Market_Graph_Window:GetSizeX() + 50
  Panel_Trade_Market_BuyItemList:SetPosX(basePosX)
end

global_setBuyList = function()
  -- function num : 0_4 , upvalues : tradeBuyMarketList_Position, tradeBuyMarket, territoryName
  tradeBuyMarketList_Position()
  local sellCount = npcShop_getBuyCount()
  local commerceIndex = 1
  local itemOrderIndex = nil
  for index = 1, sellCount do
    if tradeBuyMarket.enCommerceIndex ~= -1 then
      itemOrderIndex = index - 1
      local itemwrapper = npcShop_getItemBuy(itemOrderIndex)
      local itemSell = itemwrapper:get()
      local itemStatus = itemwrapper:getStaticStatus()
      local itemCommerceType = itemStatus:getCommerceType()
      if itemCommerceType == tradeBuyMarket.enCommerceIndex or enCommerceType.enCommerceType_Max == tradeBuyMarket.enCommerceIndex then
        if tradeBuyMarket.maxSellCount < commerceIndex then
          return 
        end
        tradeBuyMarket:setShowTradeIcon(commerceIndex, true)
        local itemSS = itemStatus:get()
        -- DECOMPILER ERROR at PC51: Confused about usage of register: R12 in 'UnsetPending'

        ;
        (tradeBuyMarket.itemEnchantKey)[commerceIndex] = (itemSS._key):get()
        -- DECOMPILER ERROR at PC54: Confused about usage of register: R12 in 'UnsetPending'

        ;
        (tradeBuyMarket.itemIndex)[commerceIndex] = itemOrderIndex
        local originalPrice = itemStatus:getOriginalPriceByInt64()
        local tradeItemWrapper = npcShop_getTradeItem((tradeBuyMarket.itemEnchantKey)[commerceIndex])
        local sellRate = (string.format)("%.f", npcShop_GetTradeGraphRateOfPrice((itemSS._key):get()))
        local buyableStack = (tradeItemWrapper:get()):calculateRemainCount()
        tradeBuyMarket:setBuyItemDataInfo(commerceIndex, itemStatus:getName(), itemSell.leftCount_s64, tradeItemWrapper, buyableStack, sellRate)
        ;
        ((tradeBuyMarket.icons)[commerceIndex]):setItemByStaticStatus(itemwrapper:getStaticStatus())
        ;
        (((tradeBuyMarket.icons)[commerceIndex]).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. itemOrderIndex .. ", \"tradeMarket_Buy\", true)")
        ;
        (((tradeBuyMarket.icons)[commerceIndex]).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. itemOrderIndex .. ", \"tradeMarket_Buy\", false)")
        Panel_Tooltip_Item_SetPosition(itemOrderIndex, (tradeBuyMarket.icons)[commerceIndex], "tradeMarket_Buy")
        if (itemStatus:get())._expirationPeriod == 0 then
          ((tradeBuyMarket.expiration)[commerceIndex]):SetShow(false)
        end
        ;
        ((tradeBuyMarket.expiration)[commerceIndex]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_WARRANTY", "expirationPeriod", tostring(((tradeItemWrapper:getStaticStatus()):get())._expirationPeriod / 60)))
        ;
        ((tradeBuyMarket.expiration)[commerceIndex]):addInputEvent("Mouse_On", "TradeBuyMarket_SimpleTooltip( true, " .. commerceIndex .. ", 0 )")
        ;
        ((tradeBuyMarket.expiration)[commerceIndex]):addInputEvent("Mouse_Out", "TradeBuyMarket_SimpleTooltip( false, " .. commerceIndex .. ", 0 )")
        local territorySupplyKey = FGlobal_TradeSupplyItemInfo_Compare((tradeBuyMarket.itemEnchantKey)[commerceIndex])
        if territorySupplyKey ~= nil then
          ((tradeBuyMarket.supply)[commerceIndex]):SetShow(true)
          local supplyText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_SUPPLY", "territoryName", territoryName[territorySupplyKey])
          ;
          ((tradeBuyMarket.supply)[commerceIndex]):SetText("")
          ;
          ((tradeBuyMarket.supply)[commerceIndex]):addInputEvent("Mouse_On", "TradeBuyMarket_SimpleTooltip( true, " .. commerceIndex .. ", 1, " .. territorySupplyKey .. " )")
          ;
          ((tradeBuyMarket.supply)[commerceIndex]):addInputEvent("Mouse_Out", "TradeBuyMarket_SimpleTooltip( false, " .. commerceIndex .. ", 1, " .. territorySupplyKey .. " )")
        else
          do
            ;
            ((tradeBuyMarket.supply)[commerceIndex]):SetShow(false)
            ;
            (((tradeBuyMarket.icons)[commerceIndex]).icon):SetShow(true)
            local iconPosX = ((tradeBuyMarket.ListBody)[commerceIndex]):GetPosX()
            do
              local iconPosY = ((tradeBuyMarket.ListBody)[commerceIndex]):GetPosY()
              ;
              (((tradeBuyMarket.icons)[commerceIndex]).icon):SetPosX(14)
              ;
              (((tradeBuyMarket.icons)[commerceIndex]).icon):SetPosY(11)
              commerceIndex = commerceIndex + 1
              -- DECOMPILER ERROR at PC261: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC261: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC261: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC261: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC261: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC261: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC261: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

tradeBuyMarket.setBuyItemDataInfo = function(self, index, itemName, leftCount, tradeItemWrapper, buyableStackCount, sellRate)
  -- function num : 0_5 , upvalues : tradeBuyMarket, UI_TM, _descBg, _desc
  ((tradeBuyMarket.itemName)[index]):SetAutoResize(true)
  ;
  ((tradeBuyMarket.itemName)[index]):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
  ;
  ((tradeBuyMarket.itemName)[index]):setLineCountByLimitAutoWrap(2)
  ;
  ((tradeBuyMarket.itemName)[index]):SetText(tostring(itemName))
  if tradeItemWrapper:isTradableItem() == true then
    ((tradeBuyMarket.remainCount)[index]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketBuyList_RemainCount", "Count", tostring(buyableStackCount)))
    ;
    ((tradeBuyMarket.sellPrice)[index]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_PRICE_ONEPIECE", "price", makeDotMoney(tradeItemWrapper:getTradeSellPrice())))
    ;
    ((tradeBuyMarket.sellPrice)[index]):SetPosX(((tradeBuyMarket.sellPrice)[index]):GetTextSizeX() + 13)
    ;
    ((tradeBuyMarket.Quotation)[index]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketBuyList_Percents", "Percent", tostring(sellRate)))
    ;
    ((tradeBuyMarket.AddCart)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketBuyList_AddtoCart"))
    local needLifeType = (tradeItemWrapper:get()):getNeedLifeType()
    local needLifeLevel = (tradeItemWrapper:get()):getNeedLifeLevel()
    local conditionLevel = FGlobal_CraftLevel_Replace(needLifeLevel + 1, needLifeType)
    local conditionTypeName = FGlobal_CraftType_ReplaceName(needLifeType)
    local buyingConditionValue = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_BUYING_CONDITIONTITLE") .. " "
    if needLifeLevel == 0 or needLifeLevel == nil then
      buyingConditionValue = buyingConditionValue .. PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_BUYING_CONDITION_NIL")
      ;
      ((tradeBuyMarket.buyingCondition)[index]):SetText(buyingConditionValue)
      ;
      ((tradeBuyMarket.buyingCondition)[index]):SetFontColor((Defines.Color).C_FFC4BEBE)
      ;
      ((tradeBuyMarket.AddCart)[index]):SetEnable(true)
      ;
      ((tradeBuyMarket.AddCart)[index]):SetMonoTone(false)
      ;
      ((tradeBuyMarket.trendShow)[index]):SetEnable(true)
      ;
      ((tradeBuyMarket.trendShow)[index]):SetMonoTone(false)
    else
      local player = getSelfPlayer()
      local playerGet = player:get()
      local playerThisCraftLevel = playerGet:getLifeExperienceLevel(needLifeType)
      if needLifeLevel < playerThisCraftLevel then
        ((tradeBuyMarket.AddCart)[index]):SetEnable(true)
        ;
        ((tradeBuyMarket.AddCart)[index]):SetMonoTone(false)
        ;
        ((tradeBuyMarket.trendShow)[index]):SetEnable(true)
        ;
        ((tradeBuyMarket.trendShow)[index]):SetMonoTone(false)
        ;
        ((tradeBuyMarket.buyingCondition)[index]):SetFontColor((Defines.Color).C_FFC4BEBE)
        buyingConditionValue = "<PAColor0xFFC4BEBE>" .. buyingConditionValue .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_BUYING_CONDITION", "craftName", conditionTypeName, "craftLevel", conditionLevel) .. "<PAOldColor>"
      else
        ;
        ((tradeBuyMarket.AddCart)[index]):SetEnable(false)
        ;
        ((tradeBuyMarket.AddCart)[index]):SetMonoTone(true)
        ;
        ((tradeBuyMarket.AddCart)[index]):SetShow(false)
        ;
        ((tradeBuyMarket.trendShow)[index]):SetEnable(false)
        ;
        ((tradeBuyMarket.trendShow)[index]):SetMonoTone(true)
        ;
        ((tradeBuyMarket.trendShow)[index]):SetShow(false)
        buyingConditionValue = "<PAColor0xFFa91000>" .. buyingConditionValue .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_BUYING_CONDITION", "craftName", conditionTypeName, "craftLevel", conditionLevel) .. "<PAOldColor>"
        ;
        ((tradeBuyMarket.buyingCondition)[index]):SetFontColor((Defines.Color).C_FF775555)
      end
      ;
      ((tradeBuyMarket.buyingCondition)[index]):SetText(buyingConditionValue)
    end
    do
      do
        ;
        ((tradeBuyMarket.buyingCondition)[index]):addInputEvent("Mouse_On", "TradeMarket_BuyList_SimpleTooltip( true, " .. index .. ", " .. needLifeType .. ", " .. needLifeLevel .. ")")
        ;
        ((tradeBuyMarket.buyingCondition)[index]):addInputEvent("Mouse_Out", "TradeMarket_BuyList_SimpleTooltip( false, " .. index .. ", " .. needLifeType .. ", " .. needLifeLevel .. ")")
        if Int64toInt32(buyableStackCount) > 0 then
          ((tradeBuyMarket.AddCart)[index]):SetEnable(true)
        else
          ;
          ((tradeBuyMarket.AddCart)[index]):SetEnable(false)
        end
        ;
        ((tradeBuyMarket.remainCount)[index]):SetShow(false)
        ;
        ((tradeBuyMarket.sellPrice)[index]):SetShow(false)
        ;
        ((tradeBuyMarket.Quotation)[index]):SetShow(false)
        ;
        ((tradeBuyMarket.AddCart)[index]):SetShow(false)
        ;
        ((tradeBuyMarket.trendShow)[index]):SetShow(false)
        _descBg:SetPosY(getScreenSizeY() - Panel_Npc_Trade_Market:GetSizeY() - _descBg:GetSizeY() - 100)
        _desc:SetPosY(_descBg:GetPosY() + 20)
        _descBg:SetShow(false)
        _desc:SetShow(false)
        local talker = dialog_getTalker()
        if talker ~= nil then
          local actorKeyRaw = talker:getActorKey()
          local actorProxyWrapper = getNpcActor(actorKeyRaw)
          local actorProxy = actorProxyWrapper:get()
          local characterStaticStatus = actorProxy:getCharacterStaticStatus()
          if not characterStaticStatus:isTerritorySupplyMerchant() and not characterStaticStatus:isTerritoryTradeMerchant() and ((getSelfPlayer()):get()):getlTradeItemCountRate() ~= 1000000 then
            _descBg:SetShow(true)
            _desc:SetShow(true)
          end
        end
      end
    end
  end
end

FGlobal_RemainItemDesc_Hide = function()
  -- function num : 0_6 , upvalues : _descBg, _desc
  _descBg:SetShow(false)
  _desc:SetShow(false)
end

createBuyItemList = function()
  -- function num : 0_7 , upvalues : tradeBuyMarket, _TitleName
  local index = 1
  for col = 1, 3 do
    for row = 1, 3 do
      createItemList(index, row, col - 1)
      index = index + 1
    end
  end
  local posX = ((tradeBuyMarket.ListBody)[1]):GetPosX()
  local posY = ((tradeBuyMarket.ListBody)[1]):GetPosY()
  _TitleName:SetPosX(posX)
  _TitleName:SetPosY(posY - 50)
end

updateMarketList = function()
  -- function num : 0_8 , upvalues : VCK
  if Panel_Trade_Market_BuyItemList:GetShow() == false then
    return 
  end
  if isKeyDown_Once(VCK.KeyCode_LBUTTON) == false then
    return 
  end
  local eventControl = getEventControl()
  do
    if eventControl ~= nil then
      local parentControl = eventControl:getParent()
      if parentControl ~= nil and parentControl:GetKey() == Panel_Window_Exchange_Number:GetKey() then
        return 
      end
    end
    local mousePosX = getMousePosX()
    local mousePosY = getMousePosY()
    local enableStart = Panel_Trade_Market_BuyItemList:getEnableStart()
    local enableEnd = Panel_Trade_Market_BuyItemList:getEnableEnd()
    local checkStartPosX = Panel_Trade_Market_BuyItemList:GetParentPosX() + enableStart.x
    local checkStartPosY = Panel_Trade_Market_BuyItemList:GetParentPosY() + enableStart.y
    local checkEndPosX = Panel_Trade_Market_BuyItemList:GetParentPosX() + enableEnd.x
    do
      local checkEndPosY = Panel_Trade_Market_BuyItemList:GetParentPosY() + enableEnd.y
      if checkStartPosX < mousePosX and mousePosX < checkEndPosX and checkStartPosY < mousePosY and mousePosY < checkEndPosY == false then
        Panel_Window_Exchange_Number:SetShow(false)
      end
      -- DECOMPILER ERROR: 2 unprocessed JMP targets
    end
  end
end

createItemList = function(index, row, col)
  -- function num : 0_9 , upvalues : _ItemPanel, tradeBuyMarket, _SlotBG, _RemainCount, _ItemName, _SellPrice, _QuotationRate, _AddCard, _showTrade, _expiration, _buyingCondition, UI_TM, _supply
  local tempListBody = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Trade_Market_BuyItemList, "Static_Panel_" .. index)
  CopyBaseProperty(_ItemPanel, tempListBody)
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (tradeBuyMarket.ListBody)[index] = tempListBody
  local tempItemSlotBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempListBody, "Static_Slot_" .. index)
  CopyBaseProperty(_SlotBG, tempItemSlotBG)
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (tradeBuyMarket.itemSlot_BG)[index] = tempItemSlotBG
  local icon = {}
  ;
  (SlotItem.new)(icon, "TradeShopItem_" .. index, index, tempListBody, tradeBuyMarket.slotConfig)
  icon:createChild()
  local tempRemainCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_remainCount_" .. index)
  CopyBaseProperty(_RemainCount, tempRemainCount)
  -- DECOMPILER ERROR at PC64: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (tradeBuyMarket.remainCount)[index] = tempRemainCount
  local tempItemName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_itemName_" .. index)
  CopyBaseProperty(_ItemName, tempItemName)
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (tradeBuyMarket.itemName)[index] = tempItemName
  local tempSellPrice = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_sellPrice_" .. index)
  CopyBaseProperty(_SellPrice, tempSellPrice)
  -- DECOMPILER ERROR at PC98: Confused about usage of register: R9 in 'UnsetPending'

  ;
  (tradeBuyMarket.sellPrice)[index] = tempSellPrice
  local tempQuotation = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_QuotationRate_" .. index)
  CopyBaseProperty(_QuotationRate, tempQuotation)
  -- DECOMPILER ERROR at PC115: Confused about usage of register: R10 in 'UnsetPending'

  ;
  (tradeBuyMarket.Quotation)[index] = tempQuotation
  local tempAddCart = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, tempListBody, "Button_AddCart_" .. index)
  tempAddCart:addInputEvent("Mouse_LUp", "click_tradeBuyMarket_BuyItemAddCart(" .. index .. ")")
  CopyBaseProperty(_AddCard, tempAddCart)
  -- DECOMPILER ERROR at PC139: Confused about usage of register: R11 in 'UnsetPending'

  ;
  (tradeBuyMarket.AddCart)[index] = tempAddCart
  local tempTrendShow = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, tempListBody, "Button_TrendShow" .. index)
  tempTrendShow:addInputEvent("Mouse_LUp", "click_tradeBuyMarket_BuyItemTrendShow(" .. index .. ")")
  CopyBaseProperty(_showTrade, tempTrendShow)
  -- DECOMPILER ERROR at PC163: Confused about usage of register: R12 in 'UnsetPending'

  ;
  (tradeBuyMarket.trendShow)[index] = tempTrendShow
  local tempExpiration = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_Expiration" .. index)
  CopyBaseProperty(_expiration, tempExpiration)
  -- DECOMPILER ERROR at PC180: Confused about usage of register: R13 in 'UnsetPending'

  ;
  (tradeBuyMarket.expiration)[index] = tempExpiration
  local tempBuyingCondition = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_BuyingCondition" .. index)
  CopyBaseProperty(_buyingCondition, tempBuyingCondition)
  tempBuyingCondition:SetTextMode(UI_TM.eTextMode_LimitText)
  -- DECOMPILER ERROR at PC201: Confused about usage of register: R14 in 'UnsetPending'

  ;
  (tradeBuyMarket.buyingCondition)[index] = tempBuyingCondition
  local tempSupply = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_Supply_" .. index)
  CopyBaseProperty(_supply, tempSupply)
  -- DECOMPILER ERROR at PC218: Confused about usage of register: R15 in 'UnsetPending'

  ;
  (tradeBuyMarket.supply)[index] = tempSupply
  -- DECOMPILER ERROR at PC221: Confused about usage of register: R15 in 'UnsetPending'

  ;
  (tradeBuyMarket.icons)[index] = icon
  tradeBuyMarket:setShowTradeIcon(index, true)
  posX = (row - 1) * tradeBuyMarket.iconSizeCalcX
  posY = col * tradeBuyMarket.iconSizeCalcY
  tempListBody:SetPosX(posX)
  tempListBody:SetPosY(posY)
end

click_tradeBuyMarket_BuyItemAddCart = function(index)
  -- function num : 0_10 , upvalues : tradeBuyMarket
  param = {[0] = (tradeBuyMarket.itemEnchantKey)[index], [1] = (tradeBuyMarket.itemIndex)[index], [2] = true, [3] = tradeBuyMarket.enCommerceIndex}
  local tradeItemWrapper = npcShop_getTradeItem(param[0])
  local buyableStack = (tradeItemWrapper:get()):calculateRemainCount()
  if global_CheckItem_From_Cart(param[0]) then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketBuyList_Already_Exist_In_Barket"))
    return 
  end
  Panel_NumberPad_Show(true, buyableStack, param, TradeMarket_BuySome_ConfirmFunction)
end

local _trendIndex = nil
click_tradeBuyMarket_BuyItemTrendShow = function(index)
  -- function num : 0_11 , upvalues : _trendIndex
  local talker = dialog_getTalker()
  if talker == nil then
    return 
  end
  local actorProxyWrapper = getNpcActor(talker:getActorKey())
  local actorProxy = actorProxyWrapper:get()
  local characterStaticStatus = actorProxy:getCharacterStaticStatus()
  if characterStaticStatus:isTerritorySupplyMerchant() or characterStaticStatus:isTerritoryTradeMerchant() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_TERRITORYSUPPLY_MEMO")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_TERRITORYSUPPLY_TITLE"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    if (getSelfPlayer()):getWp() < 1 then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_WPCHECK_MEMO")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_TERRITORYSUPPLY_TITLE"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      return 
    end
    do
      _trendIndex = index
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_WPUSE_MEMO")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_TERRITORYSUPPLY_TITLE"), content = messageBoxMemo, functionYes = Show_OtherRegion_Trend, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  end
end

Show_OtherRegion_Trend = function()
  -- function num : 0_12 , upvalues : tradeBuyMarket
  local talker = dialog_getTalker()
  if talker == nil then
    return 
  end
  ToClient_SendTrendInfo(talker:getActorKey(), (tradeBuyMarket.itemEnchantKey)[trendIndex()])
end

trendIndex = function()
  -- function num : 0_13 , upvalues : _trendIndex
  return _trendIndex
end

TradeBuyMarket_SimpleTooltip = function(isShow, index, tipType, territoryKey)
  -- function num : 0_14 , upvalues : tradeBuyMarket, territoryName
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  if tipType == 1 and territoryKey == nil then
    return 
  end
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_TOOLTIP_PRICEENSURE")
    control = (tradeBuyMarket.expiration)[index]
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEMARKET_EVENTINFO_SUBTITLE_2")
      desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_SUPPLY", "territoryName", territoryName[territoryKey])
      control = (tradeBuyMarket.supply)[index]
    end
  end
  TooltipSimple_Show(control, name, desc)
end

tradeBuyMarket.setShowTradeIcon = function(self, index, isShow)
  -- function num : 0_15 , upvalues : tradeBuyMarket
  ((tradeBuyMarket.ListBody)[index]):SetShow(isShow)
  ;
  ((tradeBuyMarket.itemSlot_BG)[index]):SetShow(isShow)
  ;
  ((tradeBuyMarket.remainCount)[index]):SetShow(isShow)
  ;
  (((tradeBuyMarket.icons)[index]).icon):SetShow(isShow)
  ;
  ((tradeBuyMarket.itemName)[index]):SetShow(isShow)
  ;
  ((tradeBuyMarket.sellPrice)[index]):SetShow(isShow)
  ;
  ((tradeBuyMarket.Quotation)[index]):SetShow(isShow)
  ;
  ((tradeBuyMarket.AddCart)[index]):SetShow(isShow)
  ;
  ((tradeBuyMarket.trendShow)[index]):SetShow(isShow)
  ;
  ((tradeBuyMarket.expiration)[index]):SetShow(isShow)
  ;
  ((tradeBuyMarket.buyingCondition)[index]):SetShow(isShow)
end

eventBuyFromNpcListRefesh = function()
  -- function num : 0_16 , upvalues : tradeBuyMarket
  if global_IsTrading == false then
    return 
  end
  for count = 1, tradeBuyMarket.maxSellCount do
    tradeBuyMarket:setShowTradeIcon(count, false)
  end
  global_setBuyList()
end

TradeMarket_BuyList_SimpleTooltip = function(isShow, index, lifeType, lifeLevel)
  -- function num : 0_17 , upvalues : tradeBuyMarket
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  if lifeLevel == 0 or lifeLevel == nil then
    return 
  end
  local player = getSelfPlayer()
  local playerGet = player:get()
  local playerThisCraftLevel = (playerGet:getLifeExperienceLevel(lifeType))
  local name, desc, control = nil, nil, nil
  local conditionLevel = FGlobal_CraftLevel_Replace(lifeLevel + 1, lifeType)
  local conditionTypeName = FGlobal_CraftType_ReplaceName(lifeType)
  if lifeLevel < playerThisCraftLevel then
    name = "<PAColor0xFFC4BEBE>" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_BUYING_CONDITION", "craftName", conditionTypeName, "craftLevel", conditionLevel) .. "<PAOldColor>"
  else
    name = "<PAColor0xFFa91000>" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYLIST_BUYING_CONDITION", "craftName", conditionTypeName, "craftLevel", conditionLevel) .. "<PAOldColor>"
  end
  control = (tradeBuyMarket.buyingCondition)[index]
  TooltipSimple_Show(control, name, desc)
end

createBuyItemList()
Panel_Trade_Market_BuyItemList:RegisterUpdateFunc("updateMarketList")
registerEvent("EventNpcShopUpdate", "eventBuyFromNpcListRefesh")
registerEvent("ToClient_SendTrendInfo", "ToClient_SendTrendInfo")

