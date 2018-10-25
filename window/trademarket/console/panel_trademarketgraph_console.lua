local _panel = Panel_TradeMarket_Graph
local TradeMarketGraph = {
  _ui = {
    stc_TitleBg = UI.getChildControl(_panel, "Static_TitleBg"),
    stc_LeftBg = UI.getChildControl(_panel, "Static_LeftBg"),
    list_TradeItem = UI.getChildControl(_panel, "List2_TradeItem"),
    stc_BottomBg = UI.getChildControl(_panel, "Static_BottomBG")
  },
  _itemEnchantKey = {},
  _itemShopIndex = {},
  _itemKeyTable = {},
  _commerceBtnTable = {},
  _enCommerceIndex = -1,
  _isSellPanel = false,
  _byWorldMap = false,
  _currentNPCType = 1,
  _currentCommerceIdx = 1,
  _commerceBtnGapY = 60,
  _graphIntervalValue = 8
}
local _commerceStringTable = {
  [enCommerceType.enCommerceType_Luxury_Miscellaneous] = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_BTN_MISCELL"),
  [enCommerceType.enCommerceType_Luxury] = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_BTN_LUXURY"),
  [enCommerceType.enCommerceType_Grocery] = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_BTN_GROCERY"),
  [enCommerceType.enCommerceType_Cloth] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEMARKET_GRAPH_BTN_CLOTH"),
  [enCommerceType.enCommerceType_ObjectSaint] = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_BTN_OBJECT"),
  [enCommerceType.enCommerceType_MilitarySupplies] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEMARKET_GRAPH_BTN_MILITARYSUPPLIES"),
  [enCommerceType.enCommerceType_Medicine] = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_BTN_MEDICINE"),
  [enCommerceType.enCommerceType_SeaFood] = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_BTN_SEAFOOD"),
  [enCommerceType.enCommerceType_RawMaterial] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEMARKET_GRAPH_BTN_RAWMATERIAL"),
  [enCommerceType.enCommerceType_Max] = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_BTN_ALL")
}
local _dialogSceneIndex = {
  [enCommerceType.enCommerceType_Luxury_Miscellaneous] = 8,
  [enCommerceType.enCommerceType_Luxury] = 7,
  [enCommerceType.enCommerceType_Grocery] = 5,
  [enCommerceType.enCommerceType_Cloth] = 10,
  [enCommerceType.enCommerceType_ObjectSaint] = 11,
  [enCommerceType.enCommerceType_MilitarySupplies] = 12,
  [enCommerceType.enCommerceType_Medicine] = 6,
  [enCommerceType.enCommerceType_SeaFood] = 14,
  [enCommerceType.enCommerceType_RawMaterial] = 13,
  [enCommerceType.enCommerceType_Max] = 0
}
function TradeMarketGraph:init()
  self._ui.txt_AConsole = UI.getChildControl(self._ui.stc_BottomBg, "StaticText_A_ConsoleUI")
  self._ui.txt_YConsole = UI.getChildControl(self._ui.stc_BottomBg, "StaticText_Y_ConsoleUI")
  for idx = 1, enCommerceType.enCommerceType_Max - 1 do
    local commerceBtn = {}
    commerceBtn = UI.createAndCopyBasePropertyControl(self._ui.stc_LeftBg, "RadioButton_Template", self._ui.stc_LeftBg, "CommerceButton_" .. idx)
    commerceBtn:SetText(_commerceStringTable[idx])
    commerceBtn:SetPosY(commerceBtn:GetPosY() + (idx - 1) * self._commerceBtnGapY)
    commerceBtn:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobal_TradeMarketGraph_ShowCommerceType(" .. idx .. ")")
    self._commerceBtnTable[idx] = commerceBtn
  end
  self:registEvent()
  PaGlobal_TradeMarketGraph_OnScreenResize()
end
function TradeMarketGraph:registEvent()
  self._ui.list_TradeItem:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobal_TradeMarketGraph_CreateList")
  self._ui.list_TradeItem:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  registerEvent("onScreenResize", "PaGlobal_TradeMarketGraph_OnScreenResize")
end
function TradeMarketGraph:open()
  PaGlobal_TradeMarketGraph_ShowCommerceType(1)
  _panel:SetShow(true)
end
function TradeMarketGraph:close()
  _panel:SetShow(false)
end
function TradeMarketGraph:update()
  for idx = 1, enCommerceType.enCommerceType_Max - 1 do
    if nil ~= self._commerceBtnTable[idx] then
      self._commerceBtnTable[idx]:SetCheck(idx == self._currentCommerceIdx)
    end
  end
  local commerceCount = 0
  if 1 == self._currentNPCType then
    commerceCount = PaGlobal_TradeMarketGraph_CheckEmptyData(self._currentCommerceIdx)
    self._ui.txt_AConsole:SetShow(true)
    self._ui.txt_YConsole:SetShow(true)
  else
    commerceCount = npcShop_getCommerceItemSize(self._currentCommerceIdx)
    self._ui.txt_AConsole:SetShow(false)
    self._ui.txt_YConsole:SetShow(false)
  end
  self._ui.list_TradeItem:getElementManager():clearKey()
  for itemIdx = 0, commerceCount - 1 do
    local itemKey = npcShop_GetCommerceItemByIndexAndSellOrBuy(self._currentCommerceIdx, self._currentNPCType, itemIdx)
    self._itemKeyTable[itemIdx] = itemKey
    if 0 ~= itemKey then
      self._ui.list_TradeItem:getElementManager():pushKey(toInt64(0, itemIdx))
    end
  end
end
function TradeMarketGraph:updateShopIndex()
  local sellCount = npcShop_getBuyCount()
  local commerceIndex = 0
  local itemOrderIndex = 0
  for index = 1, sellCount do
    if -1 ~= self._currentCommerceIdx then
      itemOrderIndex = index - 1
      local itemwrapper = npcShop_getItemBuy(itemOrderIndex)
      local itemStatus = itemwrapper:getStaticStatus()
      local itemCommerceType = itemStatus:getCommerceType()
      if itemCommerceType == self._currentCommerceIdx or enCommerceType.enCommerceType_Max == self._currentCommerceIdx then
        if commerceIndex > 8 then
          return
        end
        self._itemShopIndex[commerceIndex] = itemOrderIndex
        commerceIndex = commerceIndex + 1
      end
    end
  end
end
function InputMLUp_TradeMarketGraph_BasketItem(index)
  local self = TradeMarketGraph
  local param = {
    [0] = self._itemKeyTable[index],
    [1] = self._itemShopIndex[index],
    [2] = true,
    [3] = self._currentCommerceIdx
  }
  local tradeItemWrapper = npcShop_getTradeItem(param[0])
  local buyableStack = tradeItemWrapper:get():calculateRemainCount()
  if true == PaGlobal_TradeMarketBasket_CheckBasketItem(param[0]) then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketBuyList_Already_Exist_In_Barket"))
    return
  end
  Panel_NumberPad_Show(true, buyableStack, param, PaGlobal_TradeMarketBasket_AddConfirm)
end
function PaGlobal_TradeMarketGraph_OnScreenResize()
  local self = TradeMarketGraph
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  local panelSizeX = _panel:GetSizeX()
  local panelSizeY = _panel:GetSizeY()
  _panel:SetSize(panelSizeX, screenSizeY)
  _panel:ComputePos()
  self._ui.stc_TitleBg:ComputePos()
  self._ui.stc_BottomBg:ComputePos()
end
function PaGlobal_TradeMarketGraph_Open(isSellPanel)
  local self = TradeMarketGraph
  if true == isSellPanel then
    self._currentNPCType = 2
  else
    self._currentNPCType = 1
  end
  self._byWorldMap = false
  self:open()
end
function PaGlobal_TradeMarketGraph_OpenByWorldMap()
  local self = TradeMarketGraph
  self._byWorldMap = true
  self:open()
end
function PaGlobal_TradeMarketGraph_Close()
  local self = TradeMarketGraph
  self:close()
end
function PaGlobal_TradeMarketGraph_Init()
  local self = TradeMarketGraph
  self:init()
end
function PaGlobal_TradeMarketGraph_CreateList(content, key)
  local self = TradeMarketGraph
  local itemIdx = Int64toInt32(key)
  local stc_Bg = UI.getChildControl(content, "Static_Bg")
  local txt_ItemName = UI.getChildControl(content, "StaticText_ItemName")
  local stc_ItemSlotBg = UI.getChildControl(content, "Static_ItmeSlotBg")
  local stc_ItemIcon = UI.getChildControl(stc_ItemSlotBg, "Static_ItemIcon")
  local txt_CurrentPrice = UI.getChildControl(content, "StaticText_CurrentPrice")
  local txt_LeftCount = UI.getChildControl(content, "StaticText_LeftCount")
  local txt_Price = UI.getChildControl(content, "StaticText_Price")
  local txt_Rate = UI.getChildControl(content, "StaticText_Rate")
  local txt_LeftTime = UI.getChildControl(content, "StaticText_LeftTime")
  local txt_Condition = UI.getChildControl(content, "StaticText_Condition")
  local graph_Panel = UI.getChildControl(content, "graph_panel")
  local graph_CurrentPoint = UI.getChildControl(content, "graph_currentPoint")
  local graph_LowestPoint = UI.getChildControl(content, "graph_LowestPoint")
  local graph_HighestPoint = UI.getChildControl(content, "graph_highestPoint")
  local graph_BaseLine = UI.getChildControl(content, "graph_baseline")
  local itemKey = self._itemKeyTable[itemIdx]
  local itemESSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
  local sellRate = string.format("%.f", npcShop_GetTradeGraphRateOfPrice(itemKey))
  local tradeItemWrapper = npcShop_getTradeItem(itemKey)
  local sellPrice = tradeItemWrapper:getTradeSellPrice()
  local needLifeLevel = tradeItemWrapper:get():getNeedLifeLevel()
  local needLifeType = tradeItemWrapper:get():getNeedLifeType()
  local originalPrice = itemESSW:getOriginalPriceByInt64()
  local buyableStack = tradeItemWrapper:getRemainStackCount()
  local priceRate_Value = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_SellRate", "Percent", tostring(sellRate))
  if 100 < tonumber(tostring(sellRate)) then
    priceRate_Value = "<PAColor0xFFFFCE22>" .. priceRate_Value .. "\226\150\178"
  else
    priceRate_Value = "<PAColor0xFFF26A6A>" .. priceRate_Value .. "\226\150\188"
  end
  local conditionLevel = PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(needLifeLevel + 1)
  local conditionTypeName = CppEnums.LifeExperienceString[needLifeType]
  local buyingConditionValue = ""
  if 0 == needLifeLevel or nil == needLifeLevel then
    buyingConditionValue = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_NOPE")
    txt_Condition:SetFontColor(Defines.Color.C_FFC4BEBE)
  else
    local playerThisCraftLevel = getSelfPlayer():get():getLifeExperienceLevel(needLifeType)
    if needLifeLevel < playerThisCraftLevel then
      txt_Condition:SetFontColor(Defines.Color.C_FFC4BEBE)
    else
      txt_Condition:SetFontColor(Defines.Color.C_FF775555)
    end
    buyingConditionValue = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_BUYINGCONDITION", "conditionTypeName", conditionTypeName, "conditionLevel", conditionLevel)
  end
  txt_ItemName:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  txt_ItemName:SetText(itemESSW:getName())
  txt_Rate:SetText(priceRate_Value)
  txt_Price:SetText(makeDotMoney(sellPrice))
  stc_ItemIcon:ChangeTextureInfoNameAsync("Icon/" .. itemESSW:getIconPath())
  if 1 == self._currentNPCType then
    txt_Condition:SetText(buyingConditionValue)
    txt_Condition:SetShow(true)
    txt_LeftCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_BUYABLESTACK", "buyableStack", tostring(buyableStack)))
    txt_LeftCount:SetShow(true)
    txt_LeftTime:SetShow(false)
  else
    txt_LeftCount:SetShow(false)
    txt_Condition:SetShow(false)
    txt_LeftTime:SetShow(false)
  end
  local intervalPosY = graph_Panel:GetSizeY() / 2
  local priceCountSize = tradeItemWrapper:getGraphSize()
  local checkMinPos = 9999999
  local checkMaxPos = 0
  local maxPosition = self._graphIntervalValue
  local minPosition = self._graphIntervalValue
  local drawPos = tradeItemWrapper:getGraphPosAt(0)
  if nil == drawPos then
    return
  end
  graph_Panel:ClearGraphList()
  graph_Panel:setGraphBasePos(intervalPosY)
  graph_Panel:SetGraphMode(true)
  for count = 1, priceCountSize do
    drawPos = tradeItemWrapper:getGraphPosAt(count - 1)
    if 100 < drawPos.y then
      drawPos.y = 100
    end
    if drawPos.y < -100 then
      drawPos.y = -100
    end
    drawPos.x = 12 * count
    local yPos = drawPos.y * intervalPosY / 100
    drawPos.y = PaGlobal_TradeMarketGraph_CalculateY(intervalPosY, yPos)
    graph_Panel:AddGraphPos(drawPos)
    if checkMaxPos <= drawPos.y then
      maxPosition = drawPos.x
      checkMaxPos = drawPos.y
    end
    if checkMinPos > drawPos.y then
      minPosition = drawPos.x
      checkMinPos = drawPos.y
    end
  end
  graph_Panel:interpolationGraph()
  graph_BaseLine:SetPosX(graph_Panel:GetPosX())
  graph_BaseLine:SetPosY(graph_Panel:GetPosY() + graph_Panel:GetSizeY() / 2)
  graph_BaseLine:SetShow(true)
  graph_CurrentPoint:SetPosX(graph_Panel:GetPosX() + drawPos.x - graph_CurrentPoint:GetSizeX() / 2)
  graph_CurrentPoint:SetPosY(graph_Panel:GetPosY() + drawPos.y - graph_CurrentPoint:GetSizeX() / 2)
  graph_CurrentPoint:SetShow(tradeItemWrapper:isTradableItem())
  graph_LowestPoint:SetShow(false)
  graph_HighestPoint:SetShow(false)
  if priceCountSize > 2 then
    if drawPos.y ~= checkMinPos then
      local graphPosY = graph_Panel:getinterpolationGraphValue(minPosition)
      graph_LowestPoint:SetPosX(graph_Panel:GetPosX() + minPosition - graph_LowestPoint:GetSizeX() / 2)
      graph_LowestPoint:SetPosY(graph_Panel:GetPosY() + graphPosY - graph_LowestPoint:GetSizeY() / 2)
      graph_LowestPoint:SetShow(true)
    end
    if drawPos.y ~= checkMaxPos then
      local graphPosY = graph_Panel:getinterpolationGraphValue(maxPosition)
      graph_HighestPoint:SetPosX(graph_Panel:GetPosX() + maxPosition - graph_HighestPoint:GetSizeX() / 2)
      graph_HighestPoint:SetPosY(graph_Panel:GetPosY() + graphPosY - graph_HighestPoint:GetSizeY() / 2)
      graph_HighestPoint:SetShow(true)
    end
  end
  if 1 == self._currentNPCType and Int64toInt32(buyableStack) > 0 then
    stc_Bg:registerPadEvent(__eConsoleUIPadEvent_Up_A, "InputMLUp_TradeMarketGraph_BasketItem(" .. itemIdx .. ")")
  else
    stc_Bg:registerPadEvent(__eConsoleUIPadEvent_Up_A, "")
  end
end
function PaGlobal_TradeMarketGraph_CalculateY(src, dest)
  if src <= dest then
    dest = dest - src
  elseif src >= dest then
    dest = src - dest
  else
    dest = src
  end
  return dest
end
function PaGlobal_TradeMarketGraph_ShowCommerceType(commerceIdx)
  local self = TradeMarketGraph
  self._currentCommerceIdx = commerceIdx
  self:updateShopIndex()
  self:update()
end
function PaGlobal_TradeMarketGraph_CheckEmptyData(commerceType)
  local commerceItemSize = npcShop_getCommerceItemSize(commerceType)
  local uiCount = 0
  for idx = 1, commerceItemSize do
    local boolValue = npcShop_luaGetCommerceItemByIndexAndCheckSellOrBuy(commerceType, idx)
    if true == boolValue then
      uiCount = uiCount + 1
    end
  end
  return uiCount
end
function npcShop_luaGetCommerceItemByIndexAndCheckSellOrBuy(commerceType, index)
  local self = TradeMarketGraph
  local itemKey = npcShop_GetCommerceItemByIndex(commerceType, index - 1)
  local checkResult = false
  if 0 ~= itemKey then
    if 1 == self._currentNPCType then
      checkResult = npcShop_CheckBuyFromNPCItem(itemKey)
    elseif 2 == self._currentNPCType then
      checkResult = npcShop_CheckSellToNPCItem(itemKey)
    elseif 3 == self._currentNPCType then
      checkResult = true
    else
      UI.ASSERT(false, "\235\185\132\236\160\149\236\131\129\236\160\129\236\157\184 \234\176\146\236\158\133\235\139\136\235\139\164.")
    end
  end
  return checkResult
end
registerEvent("FromClient_luaLoadComplete", "PaGlobal_TradeMarketGraph_Init")
