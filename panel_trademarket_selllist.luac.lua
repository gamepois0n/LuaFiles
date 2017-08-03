-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\trademarket\panel_trademarket_selllist.luac 

-- params : ...
-- function num : 0
local VCK = CppEnums.VirtualKeyCode
local UI_color = Defines.Color
local isNA = isGameTypeEnglish()
Panel_Trade_Market_Sell_ItemList:SetShow(false, false)
Panel_Trade_Market_Sell_ItemList:SetAlpha(1)
Panel_Trade_Market_Sell_ItemList:setGlassBackground(true)
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local _ItemPanel = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "Static_MiniPanel")
local _TradeGamePanel = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "Static_MiniPanel_forTradeGame")
local _SlotBG = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "Static_Slot")
_SlotBG:SetShow(false)
local _ItemIcon = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "Static_Icon")
_ItemIcon:SetShow(false)
local _RemainCount = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_remainCount")
local _NpcRemainCount = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_NpcRemainCount")
local _ItemName = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_itemName")
local _SellPrice = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_sellPrice_Value")
local _QuotationRate = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_MarketPriceRate")
local _AddCard = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "Button_AddCart")
local _sellScroll = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "Frame_Scroll")
local _distanceBonus = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_DistanceBonus")
local _distanceBonusValue = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_DistanceBonusValue")
local _distanceNoBonus = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_NoBonus")
local _desertBuff = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_DesertBuff")
local _profitStatic = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_MySellPrice")
local _profitGold = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_Profit_Value")
local _noLink = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_LinkedExplorationNode")
local _expiration = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_Option")
local _tradePrice = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "StaticText_TradePrice")
local _btnSellAllItem = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "Button_AllTradeItemSell")
local _btnTradeGame = (UI.getChildControl)(Panel_Trade_Market_Sell_ItemList, "Button_TradeGameStart")
_btnSellAllItem:addInputEvent("Mouse_LUp", "HandleClicked_TradeItem_AllSellQuestion()")
_btnTradeGame:addInputEvent("Mouse_LUp", "click_TradeGameStart()")
local e1Percent = 10000
local e100Percent = 1000000
local tradeSellMarket = {maxSellCount = 7, currentItemCount = 0, scrollIndex = 0, itemsStartPosY = 25, intervalPanel = 10, _isNoLinkedNodeOne = false, 
_isLinkedNode = {}
, 
remainItemCount = {}
, 
itemProfit = {}
, 
vehicleItem = {}
, 
vehicleActorKey = {}
, 
expirationDate = {}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = false, createExpiration = true, createCash = true}
, 
ListBody = {}
, 
ListBodyGame = {}
, 
itemSlot_BG = {}
, 
remainCount = {}
, 
npcRemainCount = {}
, 
itemName = {}
, 
sellPrice = {}
, 
Quotation = {}
, 
AddCart = {}
, 
profitStatic = {}
, 
profitGold = {}
, 
noLink = {}
, 
desertBuff = {}
, 
itemEnchantKey = {}
, 
itemIndex = {}
, 
expiration = {}
, 
DistanceBonus = {}
, 
DistanceBonusValue = {}
, 
DistanceNoBonus = {}
, 
tradePrice = {}
, 
icons = {}
, totalProfit = toInt64(0, 0)}
global_tradeSellListExit = function()
  -- function num : 0_0
  if Panel_Trade_Market_Sell_ItemList:IsShow() then
    Panel_Trade_Market_Sell_ItemList:SetShow(false)
  end
  FGlobal_isTradeGameSuccess()
end

global_tradeSellListOpen = function()
  -- function num : 0_1 , upvalues : tradeSellMarket, _sellScroll
  FGlobal_isTradeGameSuccess()
  local talker = dialog_getTalker()
  if talker ~= nil then
    local actorKeyRaw = talker:getActorKey()
    local actorProxyWrapper = getNpcActor(actorKeyRaw)
    local actorProxy = actorProxyWrapper:get()
    local characterStaticStatus = actorProxy:getCharacterStaticStatus()
    if characterStaticStatus:isSmuggleMerchant() == true then
      return 
    end
  end
  do
    Panel_Trade_Market_Sell_ItemList:SetShow(true)
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

    tradeSellMarket.totalProfit = toInt64(0, 0)
    for count = 1, 10 do
      tradeSellMarket:setShowTradeIcon(count, false)
    end
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

    tradeSellMarket._isNoLinkedNodeOne = false
    _sellScroll:SetControlPos(0)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

    tradeSellMarket.scrollIndex = 0
    global_sellItemFromPlayer()
    local talker = dialog_getTalker()
    local npcActorproxy = talker:get()
    local npcPosition = npcActorproxy:getPosition()
    local npcRegionInfo = getRegionInfoByPosition(npcPosition)
    local npcTradeOriginRegion = (npcRegionInfo:get()):getTradeOriginRegion()
    local boolValue = checkSelfplayerNode(npcTradeOriginRegion._waypointKey, false)
    eventResizeSellList()
  end
end

global_refreshScrollIndex = function()
  -- function num : 0_2 , upvalues : tradeSellMarket, _sellScroll
  if global_IsTrading == false then
    return 
  end
  local mySellCount = npcShop_getSellCount()
  local vhicleSellCount = npcShop_getVehicleSellCount()
  local isValidDistance = getDistanceFromVehicle()
  if isValidDistance == false then
    vhicleSellCount = 0
  end
  local sellCount = mySellCount + vhicleSellCount
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R4 in 'UnsetPending'

  if tradeSellMarket.maxSellCount < sellCount and sellCount < tradeSellMarket.scrollIndex + tradeSellMarket.maxSellCount then
    tradeSellMarket.scrollIndex = tradeSellMarket.scrollIndex - 1
    local controlPos = tradeSellMarket.scrollIndex / (sellCount - tradeSellMarket.maxSellCount)
    if controlPos > 1 then
      controlPos = 1
    end
    _sellScroll:SetControlPos(controlPos)
  end
end

local _sellCount = 0
local showTradeItemList = {}
local _commerceIndex = 1
global_sellItemFromPlayer = function()
  -- function num : 0_3 , upvalues : _sellCount, tradeSellMarket, showTradeItemList, _sellScroll, _commerceIndex
  _sellCount = 0
  local mySellCount = npcShop_getSellCount()
  local vhicleSellCount = npcShop_getVehicleSellCount()
  local isValidDistance = getDistanceFromVehicle()
  if isValidDistance == false then
    vhicleSellCount = 0
  end
  local sellCount = mySellCount + vhicleSellCount
  local talker = dialog_getTalker()
  if talker ~= nil then
    local actorKeyRaw = talker:getActorKey()
    local actorProxyWrapper = getNpcActor(actorKeyRaw)
    local actorProxy = actorProxyWrapper:get()
    local characterStaticStatus = actorProxy:getCharacterStaticStatus()
    if characterStaticStatus:isSmuggleMerchant() == true then
      return 
    end
  end
  do
    if sellCount > 0 then
      Panel_Trade_Market_Sell_ItemList:SetShow(true)
    else
      Panel_Trade_Market_Sell_ItemList:SetShow(false)
    end
    _sellCount = sellCount
    if sellCount <= 0 then
      return 
    end
    for count = 1, 10 do
      tradeSellMarket:setShowTradeIcon(count, false)
    end
    local commerceIndex = 1
    local inventory = ((getSelfPlayer()):get()):getInventory()
    ;
    (table.remove)(showTradeItemList)
    local addScrollIndex = 1
    for ii = 1, tradeSellMarket.maxSellCount do
      addScrollIndex = ii
      local indexNum = tradeSellMarket.scrollIndex + addScrollIndex - 1
      if mySellCount <= indexNum then
        break
      end
      local shopItemWrapper = npcShop_getItemSell(indexNum)
      if shopItemWrapper ~= nil then
        local tradeItemInfo = {_isMyInventory = true, _indexNumber = indexNum, _itemKey = (((shopItemWrapper:getStaticStatus()):get())._key):get()}
        -- DECOMPILER ERROR at PC97: Confused about usage of register: R15 in 'UnsetPending'

        showTradeItemList[commerceIndex] = tradeItemInfo
        commerceIndex = commerceIndex + 1
      else
        break
      end
    end
    do
      local vehicleIndex = 0
      local servertInventorySize = 0
      local temporaryWrapper = getTemporaryInformationWrapper()
      local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
      if servantInfo ~= nil then
        local servertinventory = servantInfo:getInventory()
        if servertinventory ~= nil then
          servertInventorySize = servertinventory:size()
          if isValidDistance == true and commerceIndex <= tradeSellMarket.maxSellCount then
            vehicleIndex = tradeSellMarket.scrollIndex + tradeSellMarket.maxSellCount - mySellCount
            local slotCountIndex = 1
            local clucValue = vehicleIndex - tradeSellMarket.maxSellCount
            if clucValue > 0 then
              slotCountIndex = slotCountIndex + clucValue
            end
            local vehicleTradeItemCount = slotCountIndex
            for slotCount = slotCountIndex, servertInventorySize - 1 do
              if not servertinventory:empty(slotCount) then
                local servertitemWrapper = npcShop_getVehicleSellItem(vehicleTradeItemCount - 1)
                -- DECOMPILER ERROR at PC156: Unhandled construct in 'MakeBoolean' P1

                if servertitemWrapper ~= nil or vhicleSellCount < vehicleTradeItemCount then
                  break
                end
                local itemStaticStaus = servertitemWrapper:getStaticStatus()
                if itemStaticStaus:isForJustTrade() == true then
                  addScrollIndex = addScrollIndex + 1
                  local indexNum = tradeSellMarket.scrollIndex + (addScrollIndex) - 1
                  local tradeItemInfo = {_isMyInventory = false, _indexNumber = vehicleTradeItemCount - 1, _itemKey = ((itemStaticStaus:get())._key):get()}
                  -- DECOMPILER ERROR at PC179: Confused about usage of register: R24 in 'UnsetPending'

                  showTradeItemList[commerceIndex] = tradeItemInfo
                  commerceIndex = commerceIndex + 1
                  vehicleTradeItemCount = vehicleTradeItemCount + 1
                  if tradeSellMarket.maxSellCount < commerceIndex then
                    break
                  end
                end
              end
            end
          end
        end
      end
      do
        local myLandVehicleActorKey, landVehicleActorProxy = nil, nil
        local isLinkedNode = false
        if servantInfo ~= nil then
          myLandVehicleActorKey = servantInfo:getActorKeyRaw()
        end
        if myLandVehicleActorKey ~= nil then
          landVehicleActorProxy = getVehicleActor(myLandVehicleActorKey)
        end
        local selfPlayer = getSelfPlayer()
        local selfPlayerRegion = getRegionInfoByPosition((selfPlayer:get()):getPosition())
        local selfPlayerTradeOriginRegion = (selfPlayerRegion:get()):getTradeOriginRegion()
        local selfPlayerPosition = selfPlayerTradeOriginRegion:getWaypointInGamePosition()
        local tradeBonusPercent = FromClient_getTradeBonusPercent()
        local isExistTradeOrigin = true
        local characterStaticStatusWrapper = npcShop_getCurrentCharacterKeyForTrade()
        local characterStaticStatus = characterStaticStatusWrapper:get()
        local _isSupplyMerchant = characterStaticStatus:isSupplyMerchant()
        local _isFishSupplyMerchant = characterStaticStatus:isFishSupplyMerchant()
        for count = 1, commerceIndex - 1 do
          local tradeItemInfoList = showTradeItemList[count]
          local indexNum = tradeItemInfoList._indexNumber
          -- DECOMPILER ERROR at PC236: Confused about usage of register: R31 in 'UnsetPending'

          ;
          (tradeSellMarket._isLinkedNode)[count] = false
          -- DECOMPILER ERROR at PC240: Confused about usage of register: R31 in 'UnsetPending'

          ;
          (tradeSellMarket.itemEnchantKey)[count] = tradeItemInfoList._itemKey
          -- DECOMPILER ERROR at PC243: Confused about usage of register: R31 in 'UnsetPending'

          ;
          (tradeSellMarket.itemIndex)[count] = indexNum
          local tradeItemWrapper = npcShop_getTradeItem(tradeItemInfoList._itemKey)
          if tradeItemWrapper:get() == nil then
            _PA_LOG("asdf", "tradeItemWrapper ê°\128 nilì´ë‹¤...")
            break
          end
          tradeSellMarket:setShowTradeIcon(count, true)
          local _leftPeriod = nil
          local s64_TradeItemNo = toInt64(0, 0)
          local s64_inventoryItemCount = (toInt64(0, 0))
          local itemValueType = nil
          local f_sellRate = 0
          local profitItemGold = toInt64(0, 0)
          local realPrice = 0
          if tradeItemInfoList._isMyInventory == true then
            s64_TradeItemNo = npcShop_getItemNo(indexNum)
            s64_inventoryItemCount = inventory:getItemCountByItemNo_s64(s64_TradeItemNo)
            itemValueType = inventory:getItemByItemNo(s64_TradeItemNo)
            realPrice = fillSellTradeItemInfo(count, indexNum, itemValueType, tradeItemWrapper, characterStaticStatus, selfPlayerPosition, 0)
            -- DECOMPILER ERROR at PC304: Confused about usage of register: R39 in 'UnsetPending'

            ;
            (tradeSellMarket.vehicleItem)[count] = 0
            -- DECOMPILER ERROR at PC307: Confused about usage of register: R39 in 'UnsetPending'

            ;
            (tradeSellMarket.vehicleActorKey)[count] = 0
            tradeSellMarket:setBuyItemDataInfo(count, (tradeItemWrapper:getStaticStatus()):getName(), s64_inventoryItemCount, realPrice, tradeItemWrapper:getLeftCount())
            local itemWrapper = npcShop_getItemWrapperByShopSlotNo(indexNum)
            ;
            ((tradeSellMarket.noLink)[count]):SetText(itemWrapper:getProductionRegion())
            ;
            ((tradeSellMarket.icons)[count]):setItemByStaticStatus((tradeItemWrapper:getStaticStatus()), nil, (tradeSellMarket.expirationDate)[count])
            ;
            (((tradeSellMarket.icons)[count]).icon):addInputEvent("Mouse_On", "tradeItem_toolTip_Show(" .. indexNum .. ", \"tradeMarket_Sell\" )")
            ;
            (((tradeSellMarket.icons)[count]).icon):addInputEvent("Mouse_Out", "tradeItem_toolTip_Hide()")
            Panel_Tooltip_Item_SetPosition(indexNum, (tradeSellMarket.icons)[count], "tradeMarket_Sell")
            ;
            ((tradeSellMarket.expiration)[count]):SetShow(true)
          else
            do
              s64_TradeItemNo = npcShop_getVehicleInvenItemNoByShopSlotNo(indexNum)
              if landVehicleActorProxy == nil then
                break
              end
              local vehicleInven = (landVehicleActorProxy:get()):getInventory()
              s64_inventoryItemCount = vehicleInven:getItemCountByItemNo_s64(s64_TradeItemNo)
              itemValueType = vehicleInven:getItemByItemNo(s64_TradeItemNo)
              realPrice = fillSellTradeItemInfo(count, indexNum, itemValueType, tradeItemWrapper, characterStaticStatus, selfPlayerPosition, 4)
              -- DECOMPILER ERROR at PC405: Confused about usage of register: R40 in 'UnsetPending'

              ;
              (tradeSellMarket.vehicleItem)[count] = 4
              -- DECOMPILER ERROR at PC408: Confused about usage of register: R40 in 'UnsetPending'

              ;
              (tradeSellMarket.vehicleActorKey)[count] = myLandVehicleActorKey
              tradeSellMarket:setBuyItemDataInfo(count, PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_RIDE", "getName", (tradeItemWrapper:getStaticStatus()):getName()), s64_inventoryItemCount, realPrice, tradeItemWrapper:getLeftCount())
              do
                local vehilcleItemWrapper = npcShop_getVehicleItemWrapper(indexNum)
                ;
                ((tradeSellMarket.noLink)[count]):SetText(vehilcleItemWrapper:getProductionRegion())
                ;
                ((tradeSellMarket.icons)[count]):setItemByStaticStatus((vehilcleItemWrapper:getStaticStatus()), nil, (tradeSellMarket.expirationDate)[count])
                ;
                (((tradeSellMarket.icons)[count]).icon):addInputEvent("Mouse_On", "tradeItem_toolTip_Show(" .. indexNum .. ", \"tradeMarket_VehicleSell\")")
                ;
                (((tradeSellMarket.icons)[count]).icon):addInputEvent("Mouse_Out", "tradeItem_toolTip_Hide()")
                Panel_Tooltip_Item_SetPosition(indexNum, (tradeSellMarket.icons)[count], "tradeMarket_VehicleSell")
                ;
                ((tradeSellMarket.expiration)[count]):SetShow(true)
                -- DECOMPILER ERROR at PC480: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC480: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC480: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        -- DECOMPILER ERROR at PC482: Confused about usage of register: R25 in 'UnsetPending'

        tradeSellMarket.currentItemCount = sellCount
        _sellScroll:SetInterval(commerceIndex)
        if sellCount < commerceIndex then
          _sellScroll:SetShow(false)
        else
          _sellScroll:SetShow(true)
        end
        _commerceIndex = commerceIndex
      end
    end
  end
end

fillSellTradeItemInfo = function(count, indexNum, itemValueType, tradeItemWrapper, characterStaticStatus, selfPlayerPosition, inventoryType)
  -- function num : 0_4 , upvalues : e1Percent, tradeSellMarket, UI_color
  local isSupplyMerchant = characterStaticStatus:isSupplyMerchant()
  local isFishSupplyMerchant = characterStaticStatus:isFishSupplyMerchant()
  local itemExpiration = (itemValueType:getExpirationDate())
  local _displayleftPeriod = nil
  local leftPeriod = FromClient_getTradeItemExpirationDate(itemExpiration, ((tradeItemWrapper:getStaticStatus()):get())._expirationPeriod)
  if isFishSupplyMerchant and leftPeriod > 300000 then
    leftPeriod = 1000000
  end
  _displayleftPeriod = leftPeriod / e1Percent
  local leftPeriodString = _displayleftPeriod .. "%"
  if itemExpiration:isDefined() and itemExpiration:isIndefinite() == false then
    local s64_Time = itemExpiration:get_s64()
    local s64_remainTime = getLeftSecond_s64(itemExpiration)
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R15 in 'UnsetPending'

    if (Defines.s64_const).s64_0 == s64_remainTime then
      (tradeSellMarket.expirationDate)[count] = 1
    else
      -- DECOMPILER ERROR at PC49: Confused about usage of register: R15 in 'UnsetPending'

      ;
      (tradeSellMarket.expirationDate)[count] = 0
    end
  else
    do
      -- DECOMPILER ERROR at PC53: Confused about usage of register: R13 in 'UnsetPending'

      ;
      (tradeSellMarket.expirationDate)[count] = -1
      ;
      ((tradeSellMarket.expiration)[count]):SetText(leftPeriodString)
      local regionInfo = itemValueType:getItemRegionInfo()
      local fromPosition = float3(0, 0, 0)
      if regionInfo._waypointKey ~= 0 then
        fromPosition = regionInfo:getWaypointInGamePosition()
      end
      local f_sellRate = 0
      local isExistTradeOrigin = true
      local profitItemGold = toInt64(0, 0)
      f_sellRate = tradeItemWrapper:getSellPriceRate()
      local bigHand = ((getSelfPlayer()):get()):getlTradeItemCountRate() ~= 1000000
      local realPrice = getCalculateTradeItemPrice(tradeItemWrapper:getTradeSellPrice(), (tradeItemWrapper:getStaticStatus()):getCommerceType(), fromPosition, selfPlayerPosition, tradeItemWrapper:getTradeGroupType(), characterStaticStatus:getTradeGroupType(), leftPeriod, isTradeGameSuccess() or bigHand)
      local fromToDistanceNavi = 0
      if regionInfo._waypointKey ~= 0 then
        fromToDistanceNavi = getFromToDistanceTradeShop()
      else
        isExistTradeOrigin = false
      end
      local desertBuffPercent = ToClient_TradeGroupFromToAddPercent(tradeItemWrapper:getTradeGroupType(), characterStaticStatus:getTradeGroupType())
      local desertBuffDistance = ToClient_TradeGroupFromToDistance(tradeItemWrapper:getTradeGroupType(), characterStaticStatus:getTradeGroupType())
      if desertBuffPercent > 100 and desertBuffDistance <= fromToDistanceNavi then
        ((tradeSellMarket.desertBuff)[count]):SetShow(true)
      else
        ((tradeSellMarket.desertBuff)[count]):SetShow(false)
      end
      local bonusPercent = 0
      bonusPercent = (math.floor)(fromToDistanceNavi / 100 * FromClient_getTradeBonusPercent())
      bonusPercent = (math.min)(bonusPercent, FromClient_getTradeMaxDistancePercent())
      local bonosPercentString = bonusPercent / e1Percent - bonusPercent / e1Percent % 1 .. "%"
      ;
      ((tradeSellMarket.DistanceBonusValue)[count]):SetText(bonosPercentString)
      ;
      ((tradeSellMarket.DistanceNoBonus)[count]):SetShow(false)
      local isLinkedNode = false
      isLinkedNode = npcShop_CheckLinkedItemExplorationNode(indexNum, inventoryType)
      -- DECOMPILER ERROR at PC195: Confused about usage of register: R26 in 'UnsetPending'

      if not isLinkedNode then
        tradeSellMarket._isNoLinkedNodeOne = true
        realPrice = Int64toInt32(((tradeItemWrapper:getStaticStatus()):get())._originalPrice_s64) * getNotLinkNodeSellPercent() / e1Percent / 100
        f_sellRate = getNotLinkNodeSellPercent() / e1Percent
        if isExistTradeOrigin == false then
          realPrice = Int64toInt32(((tradeItemWrapper:getStaticStatus()):get())._originalPrice_s64)
          f_sellRate = 100
        end
        profitItemGold = toInt64(0, realPrice) - itemValueType:getBuyingPrice()
        ;
        ((tradeSellMarket.DistanceNoBonus)[count]):SetShow(true)
        ;
        ((tradeSellMarket.DistanceBonusValue)[count]):SetShow(false)
        ;
        ((tradeSellMarket.DistanceBonus)[count]):SetShow(false)
        -- DECOMPILER ERROR at PC251: Confused about usage of register: R26 in 'UnsetPending'

        ;
        (tradeSellMarket._isLinkedNode)[count] = false
      else
        profitItemGold = realPrice - itemValueType:getBuyingPrice()
        -- DECOMPILER ERROR at PC258: Confused about usage of register: R26 in 'UnsetPending'

        ;
        (tradeSellMarket._isLinkedNode)[count] = true
      end
      local str_sellRate = (string.format)("%.f", f_sellRate)
      do
        local str_sellRate_Value = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketSellList_Percents", "Percent", str_sellRate)
        if tonumber(tostring(str_sellRate)) > 100 then
          str_sellRate_Value = "<PAColor0xFFFFCE22>" .. str_sellRate_Value .. "â–\178<PAOldColor>"
        else
          str_sellRate_Value = "<PAColor0xFFF26A6A>" .. str_sellRate_Value .. "â–\188<PAOldColor>"
        end
        ;
        ((tradeSellMarket.Quotation)[count]):SetText(str_sellRate_Value)
        if profitItemGold < toInt64(0, 0) then
          local profitItemGold_abs = toInt64(0, (math.abs)(Int64toInt32(profitItemGold)))
          ;
          ((tradeSellMarket.profitGold)[count]):SetFontColor(UI_color.C_FFD20000)
          ;
          ((tradeSellMarket.profitGold)[count]):SetText("-" .. makeDotMoney(profitItemGold_abs))
        else
          ((tradeSellMarket.profitGold)[count]):SetFontColor(UI_color.C_FFFFCE22)
          ;
          ((tradeSellMarket.profitGold)[count]):SetText(makeDotMoney(profitItemGold))
        end
        ;
        ((tradeSellMarket.noLink)[count]):SetShow(true)
        ;
        ((tradeSellMarket.AddCart)[count]):SetPosY(((tradeSellMarket.noLink)[count]):GetPosY() + ((tradeSellMarket.noLink)[count]):GetTextSizeY() + 10)
        -- DECOMPILER ERROR at PC366: Confused about usage of register: R28 in 'UnsetPending'

        ;
        (tradeSellMarket.itemProfit)[count] = profitItemGold
        ;
        (((tradeSellMarket.icons)[count]).icon):SetShow(true)
        if isSupplyMerchant == true or isFishSupplyMerchant then
          local profitRate = (string.format)("%.f", tradeItemWrapper:getSellPriceRate())
          if not isLinkedNode and isFishSupplyMerchant then
            profitRate = 30
          end
          local sellPrice = Int64toInt32(((tradeItemWrapper:getStaticStatus()):get())._originalPrice_s64)
          str_sellRate_Value = "<PAColor0xFFFFCE22>" .. profitRate .. "%â–\178<PAOldColor>"
          ;
          ((tradeSellMarket.Quotation)[count]):SetText(str_sellRate_Value)
          ;
          ((tradeSellMarket.profitGold)[count]):SetFontColor(UI_color.C_FFFFCE22)
          ;
          ((tradeSellMarket.profitGold)[count]):SetText(makeDotMoney(sellPrice * profitRate / 100 * (_displayleftPeriod) / 100))
          ;
          ((tradeSellMarket.sellPrice)[count]):SetText(makeDotMoney(sellPrice * profitRate / 100 * (_displayleftPeriod) / 100))
        end
        do return realPrice end
        -- DECOMPILER ERROR: 16 unprocessed JMP targets
      end
    end
  end
end

FGlobal_MySellCount = function()
  -- function num : 0_5 , upvalues : _sellCount
  return _sellCount
end

HandleClicked_TradeItem_AllSellQuestion = function()
  -- function num : 0_6 , upvalues : tradeSellMarket
  local messageBoxMemo = ""
  if tradeSellMarket._isNoLinkedNodeOne == true then
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketSellList_TradeItemAllSellQuestion_NodeLink")
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketSellList_TradeItemAllSellQuestion")
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketSellList_NeedNodeLinkTitle"), content = messageBoxMemo, functionYes = HandleClicked_TradeItem_AllSell, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_TradeItem_AllSell = function()
  -- function num : 0_7 , upvalues : tradeSellMarket
  if Panel_TradeGame:GetShow() then
    Fglobal_TradeGame_Close()
  end
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local s64_inventoryItemCount = toInt64(0, 0)
  local s64_TradeItemNo = toInt64(0, 0)
  local temporaryWrapper = getTemporaryInformationWrapper()
  local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
  local talker = dialog_getTalker()
  if talker ~= nil then
    local actorKeyRaw = talker:getActorKey()
    local actorProxyWrapper = getNpcActor(actorKeyRaw)
    local actorProxy = actorProxyWrapper:get()
    local characterStaticStatus = actorProxy:getCharacterStaticStatus()
    if (characterStaticStatus:isSupplyMerchant() == true or characterStaticStatus:isFishSupplyMerchant() == true) and (math.floor)(Int64toInt32(inventory:getWeight_s64()) / Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())) > 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarket_Not_Enough_Weight"))
      return 
    end
  end
  do
    local myInventortySellAbleCount = npcShop_getSellCount()
    for ii = 0, myInventortySellAbleCount do
      local shopItemWrapper = npcShop_getItemSell(ii)
      if shopItemWrapper ~= nil then
        local tradeType = ((shopItemWrapper:getStaticStatus()):get())._tradeType
        s64_TradeItemNo = npcShop_getItemNo(ii)
        s64_inventoryItemCount = inventory:getItemCountByItemNo_s64(s64_TradeItemNo)
        if tradeType == 5 then
          npcShop_doSellInTradeShop(ii, Int64toInt32(s64_inventoryItemCount), 0, 14)
        else
          npcShop_doSellInTradeShop(ii, Int64toInt32(s64_inventoryItemCount), 0, 0)
        end
      end
    end
    if servantInfo ~= nil then
      local servertinventory = servantInfo:getInventory()
      if servertinventory ~= nil then
        local servertInventorySize = servertinventory:size()
        local emptyCount = 0
        for slotCount = 2, servertInventorySize - 1 do
          if not servertinventory:empty(slotCount) then
            local s64_VehicleItemNo = npcShop_getVehicleInvenItemNoByShopSlotNo(slotCount - 2 - emptyCount)
            if s64_VehicleItemNo ~= nil then
              local vehicleItemCount = Int64toInt32(servertinventory:getItemCountByItemNo_s64(s64_VehicleItemNo))
              local servertitemWrapper = npcShop_getVehicleSellItem(slotCount - 2 - emptyCount)
              if servertitemWrapper ~= nil then
                npcShop_doSellInTradeShop(slotCount - 2 - emptyCount, vehicleItemCount, 4, 0)
              end
            end
          else
            do
              do
                emptyCount = emptyCount + 1
                -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
    do
      PaGlobal_TutorialManager:handleClickedTradeItemAllSell(talker)
      -- DECOMPILER ERROR at PC169: Confused about usage of register: R7 in 'UnsetPending'

      tradeSellMarket._isNoLinkedNodeOne = false
    end
  end
end

click_TradeGameStart = function()
  -- function num : 0_8
  local talker = dialog_getTalker()
  if talker == nil then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = (selfPlayer:get()):getInventorySlotCount(true)
  local inventory = (selfPlayer:get()):getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local invenMaxSize = inventory:sizeXXX()
  local freeCount = inventory:getFreeCount()
  if invenUseSize - useStartSlot <= invenUseSize - freeCount - useStartSlot then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_DONTPLAYGAME"))
    return 
  end
  -- DECOMPILER ERROR at PC51: Unhandled construct in 'MakeBoolean' P1

  if Panel_TradeGame:GetShow() and isTradeGameFinish() == true then
    Fglobal_TradeGame_Close()
  end
  do return  end
  local wp = selfPlayer:getWp()
  if FGlobal_MySellCount() <= 0 then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_2")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_1"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    if wp < 5 then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_3")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_1"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      return 
    end
    do
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_4") .. " " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_NOWWP", "getWp", wp)
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_1"), content = messageBoxMemo, functionYes = TradeGameStart, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  end
end

TradeGameStart = function()
  -- function num : 0_9
  local talker = dialog_getTalker()
  if talker == nil then
    return 
  end
  ToClient_TradeGameStart(talker:getActorKey())
end

tradeSellMarket.setBuyItemDataInfo = function(self, index, itemName, leftCount, price, possibleCount)
  -- function num : 0_10 , upvalues : tradeSellMarket, _btnTradeGame, UI_TM, isNA, _btnSellAllItem
  ((tradeSellMarket.ListBody)[index]):EraseAllEffect()
  _btnTradeGame:EraseAllEffect()
  ;
  ((tradeSellMarket.itemName)[index]):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
  ;
  ((tradeSellMarket.itemName)[index]):setLineCountByLimitAutoWrap(2)
  local characterStaticStatusWrapper = npcShop_getCurrentCharacterKeyForTrade()
  local characterStaticStatus = characterStaticStatusWrapper:get()
  local wp = (getSelfPlayer()):getWp()
  local bigHand = (((getSelfPlayer()):get()):getlTradeItemCountRate() ~= 1000000 and not characterStaticStatus:isSupplyMerchant() and not characterStaticStatus:isFishSupplyMerchant())
  do
    local sellPrice = Int64toInt32(price)
    if isTradeGameSuccess() == true or bigHand then
      _btnTradeGame:SetIgnore(true)
      _btnTradeGame:SetMonoTone(true)
      if isNA then
        _btnTradeGame:AddEffect("UI_TradeMarket_Scale", true, -95, -1)
      else
        _btnTradeGame:AddEffect("UI_TradeMarket_Scale", true, -41, -1)
      end
      if checkLinkedNode(index) == true then
        ((tradeSellMarket.ListBody)[index]):AddEffect("UI_Trade_SellRing", true, 0, 0)
        ;
        ((tradeSellMarket.itemName)[index]):SetText(tostring(itemName) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_TRADEGAME"))
      else
        ((tradeSellMarket.itemName)[index]):SetText(tostring(itemName))
      end
    elseif wp < 5 then
      _btnTradeGame:SetIgnore(true)
      _btnTradeGame:SetMonoTone(true)
      if isNA then
        _btnTradeGame:AddEffect("UI_TradeMarket_Scale", true, -95, -1)
      else
        _btnTradeGame:AddEffect("UI_TradeMarket_Scale", true, -41, -1)
      end
      ;
      ((tradeSellMarket.itemName)[index]):SetText(tostring(itemName))
    else
      _btnTradeGame:SetIgnore(false)
      _btnTradeGame:SetMonoTone(false)
      if isNA then
        _btnTradeGame:AddEffect("UI_TradeMarket_Scale", true, -95, -1)
      else
        _btnTradeGame:AddEffect("UI_TradeMarket_ScaleButton", true, 0, -1)
        _btnTradeGame:AddEffect("UI_TradeMarket_Scale", true, -41, -1)
      end
      ;
      ((tradeSellMarket.itemName)[index]):SetText(tostring(itemName))
    end
    ;
    ((tradeSellMarket.sellPrice)[index]):SetText(makeDotMoney(sellPrice))
    -- DECOMPILER ERROR at PC209: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (tradeSellMarket.remainItemCount)[index] = leftCount
    ;
    ((tradeSellMarket.remainCount)[index]):SetText(tostring(leftCount))
    if possibleCount == (Defines.s64_const).toInt64 then
      ((tradeSellMarket.npcRemainCount)[index]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_NPCREMAINCOUNT", "possibleCount", tostring(possibleCount)))
    else
      ((tradeSellMarket.npcRemainCount)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_REMAININFINITY"))
    end
    if characterStaticStatus:isTerritorySupplyMerchant() == true then
      ((tradeSellMarket.AddCart)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_SELLMARKET"))
      _btnSellAllItem:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_SELLALLITEM"))
    else
      ((tradeSellMarket.AddCart)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_TRADLESELLMARKET"))
      _btnSellAllItem:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_TRADLESELLMARKETALL"))
    end
    if characterStaticStatus:isSupplyMerchant() == true or characterStaticStatus:isFishSupplyMerchant() then
      _btnTradeGame:SetShow(false)
      ;
      ((tradeSellMarket.DistanceBonusValue)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_NOTAPPLY"))
    else
      _btnTradeGame:SetShow(true)
    end
    -- DECOMPILER ERROR: 20 unprocessed JMP targets
  end
end

checkLinkedNode = function(index)
  -- function num : 0_11 , upvalues : tradeSellMarket
  return (tradeSellMarket._isLinkedNode)[index]
end

NpcTradeSell_ScrollEvent = function(isUpscroll)
  -- function num : 0_12 , upvalues : tradeSellMarket, _sellScroll
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  tradeSellMarket.scrollIndex = (UIScroll.ScrollEvent)(_sellScroll, isUpscroll, tradeSellMarket.maxSellCount, tradeSellMarket.currentItemCount, tradeSellMarket.scrollIndex, 1)
  global_sellItemFromPlayer()
  tradeItem_toolTip_Hide()
end

NpcTradeSell_LupEvent = function(index)
  -- function num : 0_13 , upvalues : showTradeItemList
  if index < 0 then
    return 
  end
  local tradeItemInfo = showTradeItemList[index]
  local tradeItemWrapper = npcShop_getTradeItem(tradeItemInfo._itemKey)
  local itemSS = tradeItemWrapper:getStaticStatus()
  global_SellPanel_Refresh(itemSS)
end

createSellItemList = function()
  -- function num : 0_14 , upvalues : _sellScroll
  for index = 1, 10 do
    getItemList(index)
  end
  ;
  (UIScroll.InputEvent)(_sellScroll, "NpcTradeSell_ScrollEvent")
  _sellScroll:SetControlPos(0)
  Panel_Trade_Market_Sell_ItemList:addInputEvent("Mouse_UpScroll", "NpcTradeSell_ScrollEvent(true)")
  Panel_Trade_Market_Sell_ItemList:addInputEvent("Mouse_DownScroll", "NpcTradeSell_ScrollEvent(false)")
end

getItemList = function(index)
  -- function num : 0_15 , upvalues : _ItemPanel, tradeSellMarket, _TradeGamePanel, _SlotBG, _RemainCount, _NpcRemainCount, _ItemName, _SellPrice, _QuotationRate, _expiration, _tradePrice, _distanceBonus, _distanceBonusValue, _distanceNoBonus, _AddCard, _profitStatic, _profitGold, _noLink, _desertBuff
  local tempListBody = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Trade_Market_Sell_ItemList, "Static_SellMiniPanel_" .. index)
  CopyBaseProperty(_ItemPanel, tempListBody)
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (tradeSellMarket.ListBody)[index] = tempListBody
  ;
  ((tradeSellMarket.ListBody)[index]):addInputEvent("Mouse_UpScroll", "NpcTradeSell_ScrollEvent(true)")
  ;
  ((tradeSellMarket.ListBody)[index]):addInputEvent("Mouse_DownScroll", "NpcTradeSell_ScrollEvent(false)")
  ;
  ((tradeSellMarket.ListBody)[index]):addInputEvent("Mouse_LUp", "NpcTradeSell_LupEvent(" .. index .. ")")
  local tempListBodyGame = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempListBody, "Static_TradeGameMiniPanel_" .. index)
  CopyBaseProperty(_TradeGamePanel, tempListBodyGame)
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (tradeSellMarket.ListBodyGame)[index] = tempListBodyGame
  ;
  ((tradeSellMarket.ListBodyGame)[index]):addInputEvent("Mouse_UpScroll", "NpcTradeSell_ScrollEvent(true)")
  ;
  ((tradeSellMarket.ListBodyGame)[index]):addInputEvent("Mouse_DownScroll", "NpcTradeSell_ScrollEvent(false)")
  ;
  ((tradeSellMarket.ListBodyGame)[index]):addInputEvent("Mouse_LUp", "NpcTradeSell_LupEvent(" .. index .. ")")
  local tempItemSlotBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempListBody, "Static_Slot_" .. index)
  CopyBaseProperty(_SlotBG, tempItemSlotBG)
  -- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (tradeSellMarket.itemSlot_BG)[index] = tempItemSlotBG
  ;
  ((tradeSellMarket.itemSlot_BG)[index]):addInputEvent("Mouse_LUp", "NpcTradeSell_LupEvent(" .. index .. ")")
  tempItemSlotBG:SetIgnore(false)
  local slot = {}
  ;
  (SlotItem.new)(slot, "TradeShopItem_" .. index, index, tempListBody, tradeSellMarket.slotConfig)
  slot:createChild()
  ;
  (slot.icon):SetPosY(tempItemSlotBG:GetPosY() + 4)
  ;
  (slot.icon):SetPosX(tempItemSlotBG:GetPosX() + 4)
  ;
  (slot.icon):addInputEvent("Mouse_UpScroll", "NpcTradeSell_ScrollEvent(true)")
  ;
  (slot.icon):addInputEvent("Mouse_DownScroll", "NpcTradeSell_ScrollEvent(false)")
  ;
  (slot.icon):addInputEvent("Mouse_LUp", "NpcTradeSell_LupEvent(" .. index .. ")")
  local tempRemainCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_remainCount_" .. index)
  CopyBaseProperty(_RemainCount, tempRemainCount)
  -- DECOMPILER ERROR at PC172: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (tradeSellMarket.remainCount)[index] = tempRemainCount
  local tempNpcRemainCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_npcRemainCount_" .. index)
  CopyBaseProperty(_NpcRemainCount, tempNpcRemainCount)
  -- DECOMPILER ERROR at PC189: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (tradeSellMarket.npcRemainCount)[index] = tempNpcRemainCount
  local tempItemName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_itemName_" .. index)
  CopyBaseProperty(_ItemName, tempItemName)
  tempItemName:SetAutoResize(true)
  tempItemName:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  -- DECOMPILER ERROR at PC214: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (tradeSellMarket.itemName)[index] = tempItemName
  local tempSellPrice = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_sellPrice_" .. index)
  CopyBaseProperty(_SellPrice, tempSellPrice)
  -- DECOMPILER ERROR at PC231: Confused about usage of register: R9 in 'UnsetPending'

  ;
  (tradeSellMarket.sellPrice)[index] = tempSellPrice
  local tempQuotation = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_QuotationRate_" .. index)
  CopyBaseProperty(_QuotationRate, tempQuotation)
  -- DECOMPILER ERROR at PC248: Confused about usage of register: R10 in 'UnsetPending'

  ;
  (tradeSellMarket.Quotation)[index] = tempQuotation
  ;
  ((tradeSellMarket.Quotation)[index]):addInputEvent("Mouse_On", "TradeMarketSellList_SimpleToolTips( true, 2, " .. index .. " )")
  ;
  ((tradeSellMarket.Quotation)[index]):addInputEvent("Mouse_Out", "TradeMarketSellList_SimpleToolTips(false)")
  ;
  ((tradeSellMarket.Quotation)[index]):setTooltipEventRegistFunc("TradeMarketSellList_SimpleToolTips( true, 2, " .. index .. " )")
  local tempExpiration = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_Expiration_" .. index)
  CopyBaseProperty(_expiration, tempExpiration)
  -- DECOMPILER ERROR at PC291: Confused about usage of register: R11 in 'UnsetPending'

  ;
  (tradeSellMarket.expiration)[index] = tempExpiration
  ;
  ((tradeSellMarket.expiration)[index]):addInputEvent("Mouse_On", "TradeMarketSellList_SimpleToolTips( true, 5, " .. index .. " )")
  ;
  ((tradeSellMarket.expiration)[index]):addInputEvent("Mouse_Out", "TradeMarketSellList_SimpleToolTips(false)")
  ;
  ((tradeSellMarket.expiration)[index]):setTooltipEventRegistFunc("TradeMarketSellList_SimpleToolTips( true, 5, " .. index .. " )")
  local tempTradePrice = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_TradePrice_" .. index)
  CopyBaseProperty(_tradePrice, tempTradePrice)
  -- DECOMPILER ERROR at PC334: Confused about usage of register: R12 in 'UnsetPending'

  ;
  (tradeSellMarket.tradePrice)[index] = tempTradePrice
  ;
  ((tradeSellMarket.tradePrice)[index]):addInputEvent("Mouse_On", "TradeMarketSellList_SimpleToolTips( true, 0, " .. index .. " )")
  ;
  ((tradeSellMarket.tradePrice)[index]):addInputEvent("Mouse_Out", "TradeMarketSellList_SimpleToolTips(false)")
  ;
  ((tradeSellMarket.tradePrice)[index]):setTooltipEventRegistFunc("TradeMarketSellList_SimpleToolTips( true, 0, " .. index .. " )")
  local tempDistanceBouns = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_Distance_" .. index)
  CopyBaseProperty(_distanceBonus, tempDistanceBouns)
  -- DECOMPILER ERROR at PC377: Confused about usage of register: R13 in 'UnsetPending'

  ;
  (tradeSellMarket.DistanceBonus)[index] = tempDistanceBouns
  ;
  ((tradeSellMarket.DistanceBonus)[index]):addInputEvent("Mouse_On", "TradeMarketSellList_SimpleToolTips( true, 3, " .. index .. " )")
  ;
  ((tradeSellMarket.DistanceBonus)[index]):addInputEvent("Mouse_Out", "TradeMarketSellList_SimpleToolTips(false)")
  ;
  ((tradeSellMarket.DistanceBonus)[index]):setTooltipEventRegistFunc("TradeMarketSellList_SimpleToolTips( true, 3, " .. index .. " )")
  local tempDistanceBonusValue = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_DistanceValue_" .. index)
  CopyBaseProperty(_distanceBonusValue, tempDistanceBonusValue)
  -- DECOMPILER ERROR at PC420: Confused about usage of register: R14 in 'UnsetPending'

  ;
  (tradeSellMarket.DistanceBonusValue)[index] = tempDistanceBonusValue
  local tempDistanceNoBonus = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_DistanceNoBonus_" .. index)
  CopyBaseProperty(_distanceNoBonus, tempDistanceNoBonus)
  -- DECOMPILER ERROR at PC437: Confused about usage of register: R15 in 'UnsetPending'

  ;
  (tradeSellMarket.DistanceNoBonus)[index] = tempDistanceNoBonus
  ;
  ((tradeSellMarket.DistanceNoBonus)[index]):addInputEvent("Mouse_On", "TradeMarketSellList_SimpleToolTips( true, 6, " .. index .. " )")
  ;
  ((tradeSellMarket.DistanceNoBonus)[index]):addInputEvent("Mouse_Out", "TradeMarketSellList_SimpleToolTips(false)")
  ;
  ((tradeSellMarket.DistanceNoBonus)[index]):setTooltipEventRegistFunc("TradeMarketSellList_SimpleToolTips( true, 6, " .. index .. " )")
  local tempAddCart = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, tempListBody, "Button_AddCart_" .. index)
  tempAddCart:addInputEvent("Mouse_LUp", "click_tradeSellMarket_SellItem(" .. index .. ")")
  CopyBaseProperty(_AddCard, tempAddCart)
  -- DECOMPILER ERROR at PC487: Confused about usage of register: R16 in 'UnsetPending'

  ;
  (tradeSellMarket.AddCart)[index] = tempAddCart
  ;
  ((tradeSellMarket.AddCart)[index]):addInputEvent("Mouse_UpScroll", "NpcTradeSell_ScrollEvent(true)")
  ;
  ((tradeSellMarket.AddCart)[index]):addInputEvent("Mouse_DownScroll", "NpcTradeSell_ScrollEvent(false)")
  local tempProfitStatic = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "Static_Profit_" .. index)
  CopyBaseProperty(_profitStatic, tempProfitStatic)
  -- DECOMPILER ERROR at PC518: Confused about usage of register: R17 in 'UnsetPending'

  ;
  (tradeSellMarket.profitStatic)[index] = tempProfitStatic
  ;
  ((tradeSellMarket.profitStatic)[index]):addInputEvent("Mouse_On", "TradeMarketSellList_SimpleToolTips( true, 1, " .. index .. " )")
  ;
  ((tradeSellMarket.profitStatic)[index]):addInputEvent("Mouse_Out", "TradeMarketSellList_SimpleToolTips(false)")
  ;
  ((tradeSellMarket.profitStatic)[index]):setTooltipEventRegistFunc("TradeMarketSellList_SimpleToolTips( true, 1, " .. index .. " )")
  local tempProfitGold = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_ProfitGold_" .. index)
  CopyBaseProperty(_profitGold, tempProfitGold)
  -- DECOMPILER ERROR at PC561: Confused about usage of register: R18 in 'UnsetPending'

  ;
  (tradeSellMarket.profitGold)[index] = tempProfitGold
  local tempNoLinked = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_NoLinked_" .. index)
  CopyBaseProperty(_noLink, tempNoLinked)
  -- DECOMPILER ERROR at PC578: Confused about usage of register: R19 in 'UnsetPending'

  ;
  (tradeSellMarket.noLink)[index] = tempNoLinked
  ;
  ((tradeSellMarket.noLink)[index]):addInputEvent("Mouse_On", "TradeMarketSellList_SimpleToolTips( true, 4, " .. index .. " )")
  ;
  ((tradeSellMarket.noLink)[index]):addInputEvent("Mouse_Out", "TradeMarketSellList_SimpleToolTips(false)")
  ;
  ((tradeSellMarket.noLink)[index]):setTooltipEventRegistFunc("TradeMarketSellList_SimpleToolTips( true, 4, " .. index .. " )")
  local tempDesertBuff = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempListBody, "StaticText_DesertBuff_" .. index)
  CopyBaseProperty(_desertBuff, tempDesertBuff)
  -- DECOMPILER ERROR at PC621: Confused about usage of register: R20 in 'UnsetPending'

  ;
  (tradeSellMarket.desertBuff)[index] = tempDesertBuff
  ;
  ((tradeSellMarket.desertBuff)[index]):addInputEvent("Mouse_On", "TradeMarketSellList_SimpleToolTips( true, 7, " .. index .. " )")
  ;
  ((tradeSellMarket.desertBuff)[index]):addInputEvent("Mouse_Out", "TradeMarketSellList_SimpleToolTips(false)")
  ;
  ((tradeSellMarket.desertBuff)[index]):setTooltipEventRegistFunc("TradeMarketSellList_SimpleToolTips( true, 7, " .. index .. " )")
  -- DECOMPILER ERROR at PC650: Confused about usage of register: R20 in 'UnsetPending'

  ;
  (tradeSellMarket.icons)[index] = slot
  local sizeY = tempListBody:GetSizeY()
  local posY = tradeSellMarket.itemsStartPosY + (index - 1) * sizeY + tradeSellMarket.intervalPanel * index
  ;
  ((tradeSellMarket.ListBody)[index]):SetPosY(posY)
end

local selectIndex = 0
local sellStackCount = 0
local tempTradeType = 0
click_tradeSellMarket_SellItem = function(index)
  -- function num : 0_16 , upvalues : selectIndex, tradeSellMarket
  selectIndex = index
  local isLinkedNode = npcShop_CheckLinkedItemExplorationNode((tradeSellMarket.itemIndex)[index], (tradeSellMarket.vehicleItem)[index])
  param = {[0] = (tradeSellMarket.itemIndex)[index], [1] = (tradeSellMarket.itemProfit)[index], [2] = (tradeSellMarket.vehicleItem)[index], [3] = (tradeSellMarket.vehicleActorKey)[index], [4] = (tradeSellMarket.expirationDate)[index], [5] = isLinkedNode}
  Panel_NumberPad_Show(true, (tradeSellMarket.remainItemCount)[index], param, TradeMarket_SellSome_ConfirmFunction)
end

TradeMarket_SellSome_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_17 , upvalues : tempTradeType, sellStackCount, e1Percent, tradeSellMarket
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local s64_TradeItemNo = toInt64(0, 0)
  local s64_inventoryItemCount = (toInt64(0, 0))
  local itemValueType, regionInfo = nil, nil
  local talker = dialog_getTalker()
  if talker ~= nil then
    local actorKeyRaw = talker:getActorKey()
    local actorProxyWrapper = getNpcActor(actorKeyRaw)
    local actorProxy = actorProxyWrapper:get()
    local characterStaticStatus = actorProxy:getCharacterStaticStatus()
    if (characterStaticStatus:isSupplyMerchant() == true or characterStaticStatus:isFishSupplyMerchant() == true) and (math.floor)(Int64toInt32(inventory:getWeight_s64()) / Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())) > 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarket_Not_Enough_Weight"))
      return 
    end
  end
  do
    if param[2] == 0 then
      s64_TradeItemNo = npcShop_getItemNo(param[0])
      s64_inventoryItemCount = inventory:getItemCountByItemNo_s64(s64_TradeItemNo)
      itemValueType = inventory:getItemByItemNo(s64_TradeItemNo)
      regionInfo = itemValueType:getItemRegionInfo()
      itemWrapper = npcShop_getItemSell(param[0])
    else
      if param[2] == 4 then
        local myLandVehicleActorKey, landVehicleActorProxy = nil, nil
        local temporaryWrapper = getTemporaryInformationWrapper()
        local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
        if servantInfo ~= nil then
          local servertinventory = servantInfo:getInventory()
          s64_TradeItemNo = npcShop_getVehicleInvenItemNoByShopSlotNo(param[0])
          myLandVehicleActorKey = servantInfo:getActorKeyRaw()
          if myLandVehicleActorKey ~= nil then
            landVehicleActorProxy = getVehicleActor(myLandVehicleActorKey)
          end
          local vehicleInven = (landVehicleActorProxy:get()):getInventory()
          s64_inventoryItemCount = vehicleInven:getItemCountByItemNo_s64(s64_TradeItemNo)
          itemValueType = vehicleInven:getItemByItemNo(s64_TradeItemNo)
          regionInfo = itemValueType:getItemRegionInfo()
        end
        do
          do
            itemWrapper = npcShop_getVehicleSellItem(param[0])
            if itemWrapper == nil then
              return 
            end
            PaGlobal_TutorialManager:handleTradeMarketSellSomeConfirm((((itemWrapper:getStaticStatus()):get())._key):getItemKey())
            local tradeType = ((itemWrapper:getStaticStatus()):get())._tradeType
            tempTradeType = tradeType
            sellStackCount = inputNumber
            if param[5] == false and regionInfo._waypointKey ~= 0 then
              local itemData = nil
              if param[2] == 0 then
                itemData = npcShop_getItemWrapperByShopSlotNo(param[0])
              else
                if param[2] == 4 then
                  itemData = npcShop_getVehicleItemWrapper(param[0])
                end
              end
              if itemData ~= nil then
                local characterStaticStatusWrapper = npcShop_getCurrentCharacterKeyForTrade()
                local characterStaticStatus = characterStaticStatusWrapper:get()
                if characterStaticStatus:isSupplyMerchant() == true then
                  TradeMarket_CheckNodeLink_SellSome()
                  return 
                end
                local talker = dialog_getTalker()
                local nodeString = PAGetStringParam3(Defines.StringSheet_GAME, "Lua_TradeMarketSellList_NeedNodeLink", "exploreNode1", talker:getExplorationNodeName(), "exploreNode2", itemData:getProductionRegion(), "sellPercent", getNotLinkNodeSellPercent() / e1Percent)
                local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketSellList_NeedNodeLinkTitle"), content = nodeString, functionYes = TradeMarket_CheckNodeLink_SellSome, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                ;
                (MessageBox.showMessageBox)(messageboxData)
              end
            else
              do
                local rv = nil
                if tradeType == 5 then
                  rv = npcShop_doSellInTradeShop(param[0], Int64toInt32(sellStackCount), param[2], 14)
                else
                  rv = npcShop_doSellInTradeShop(param[0], Int64toInt32(sellStackCount), param[2], 0)
                end
                -- DECOMPILER ERROR at PC259: Confused about usage of register: R10 in 'UnsetPending'

                if rv == 0 then
                  tradeSellMarket.totalProfit = tradeSellMarket.totalProfit + param[1] * inputNumber
                end
              end
            end
          end
        end
      end
    end
  end
end

TradeMarket_CheckNodeLink_SellSome = function()
  -- function num : 0_18 , upvalues : tempTradeType, tradeSellMarket, selectIndex, sellStackCount
  if tempTradeType == nil then
    tempTradeType = 0
  end
  if tempTradeType == 5 then
    npcShop_doSellInTradeShop((tradeSellMarket.itemIndex)[selectIndex], Int64toInt32(sellStackCount), (tradeSellMarket.vehicleItem)[selectIndex], 14)
  else
    npcShop_doSellInTradeShop((tradeSellMarket.itemIndex)[selectIndex], Int64toInt32(sellStackCount), (tradeSellMarket.vehicleItem)[selectIndex], 0)
  end
end

tradeSellMarket.setShowTradeIcon = function(self, index, isShow)
  -- function num : 0_19 , upvalues : tradeSellMarket
  ((tradeSellMarket.ListBody)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.itemSlot_BG)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.remainCount)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.npcRemainCount)[index]):SetShow(false)
  ;
  (((tradeSellMarket.icons)[index]).icon):SetShow(isShow)
  ;
  ((tradeSellMarket.itemName)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.sellPrice)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.Quotation)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.profitStatic)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.profitGold)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.noLink)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.AddCart)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.DistanceBonus)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.DistanceBonusValue)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.DistanceNoBonus)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.tradePrice)[index]):SetShow(isShow)
  ;
  ((tradeSellMarket.expiration)[index]):SetShow(false)
  ;
  ((tradeSellMarket.ListBodyGame)[index]):SetShow(false)
end

local temp_InvenSlotNum, temp_ToolTipType = nil, nil
tradeItem_toolTip_Show = function(InvenSlotNum, toolTiptype)
  -- function num : 0_20 , upvalues : temp_InvenSlotNum, temp_ToolTipType
  temp_InvenSlotNum = InvenSlotNum
  temp_ToolTipType = toolTiptype
  Panel_Tooltip_Item_Show_GeneralNormal(InvenSlotNum, toolTiptype, true)
end

tradeItem_toolTip_Hide = function()
  -- function num : 0_21 , upvalues : temp_InvenSlotNum, temp_ToolTipType
  if temp_InvenSlotNum == nil then
    return 
  end
  Panel_Tooltip_Item_Show_GeneralNormal(temp_InvenSlotNum, temp_ToolTipType, false)
  temp_InvenSlotNum = nil
  temp_ToolTipType = nil
end

eventSellToNpcListRefresh = function()
  -- function num : 0_22 , upvalues : tradeSellMarket
  if global_IsTrading == false then
    return 
  end
  for count = 1, tradeSellMarket.maxSellCount do
    tradeSellMarket:setShowTradeIcon(count, false)
  end
  global_sellItemFromPlayer()
end

eventResizeSellList = function()
  -- function num : 0_23 , upvalues : _ItemPanel, tradeSellMarket, _btnSellAllItem, _btnTradeGame, isNA, _sellScroll
  local bodySizeY = _ItemPanel:GetSizeY()
  local sellPanelSizeY = getScreenSizeY() - Panel_Npc_Trade_Market:GetSizeY() - 80
  local showCount = 0
  local maxCount = 10
  local itemsSizeY = 0
  for count = 1, maxCount do
    if bodySizeY * count + (count - 1) * tradeSellMarket.intervalPanel < sellPanelSizeY then
      showCount = showCount + 1
      if maxCount == count then
        itemsSizeY = bodySizeY * count + (count - 1) * tradeSellMarket.intervalPanel
        break
      end
    else
      itemsSizeY = bodySizeY * (count - 1) + (count - 2) * tradeSellMarket.intervalPanel
      break
    end
  end
  do
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R5 in 'UnsetPending'

    tradeSellMarket.maxSellCount = showCount
    Panel_Trade_Market_Sell_ItemList:SetSize(Panel_Trade_Market_Sell_ItemList:GetSizeX(), itemsSizeY + tradeSellMarket.itemsStartPosY + 50)
    _btnSellAllItem:SetPosY(itemsSizeY + tradeSellMarket.itemsStartPosY + 50 + 5)
    _btnTradeGame:SetPosY(itemsSizeY + tradeSellMarket.itemsStartPosY + 50 + 5)
    if isNA then
      _btnTradeGame:SetSize(220, _btnTradeGame:GetSizeY())
      _btnSellAllItem:SetSize(220, _btnTradeGame:GetSizeY())
      _btnSellAllItem:SetPosX(_btnTradeGame:GetPosX())
      _btnSellAllItem:SetPosY(itemsSizeY + tradeSellMarket.itemsStartPosY + 50 + 5 + _btnTradeGame:GetSizeY())
    end
    _sellScroll:SetPosX(((tradeSellMarket.ListBody)[1]):GetPosX() + ((tradeSellMarket.ListBody)[1]):GetSizeX() + 2)
    _sellScroll:SetPosY(tradeSellMarket.itemsStartPosY)
    _sellScroll:SetSize(_sellScroll:GetSizeX(), itemsSizeY)
  end
end

TradeMarketSellList_SimpleToolTips = function(isShow, tipType, index)
  -- function num : 0_24 , upvalues : tradeSellMarket
  local name, desc, control = nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TOOLTIP_TRADEPRICE")
    control = (tradeSellMarket.tradePrice)[index]
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TOOLTIP_PROFITSTATIC")
      control = (tradeSellMarket.profitStatic)[index]
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_MARKETPRICE")
        control = (tradeSellMarket.Quotation)[index]
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TOOLTIP_DISTANCEBONUS")
          control = (tradeSellMarket.DistanceBonus)[index]
        else
          if tipType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TOOLTIP_NOLINK")
            control = (tradeSellMarket.noLink)[index]
          else
            if tipType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TOOLTIP_EXPIRATION")
              control = (tradeSellMarket.expiration)[index]
            else
              if tipType == 6 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_NOTDISTANCEBONUS")
                control = (tradeSellMarket.DistanceNoBonus)[index]
              else
                if tipType == 7 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_DESERTBUFF")
                  control = (tradeSellMarket.desertBuff)[index]
                end
              end
            end
          end
        end
      end
    end
  end
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

createSellItemList()
registerEvent("EventNpcShopUpdate", "eventSellToNpcListRefresh")
registerEvent("onScreenResize", "eventResizeSellList")

