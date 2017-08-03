-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\trademarket\panel_window_trademarket_graph.luac 

-- params : ...
-- function num : 0
local debugValue = 0
local last_Tooltip = nil
local index_Tooltip = {}
Panel_Trade_Market_Graph_Window:setGlassBackground(true)
local tradeGraphMode = {eGraphMode_NormalShopGraph = 0, eGraphMode_TendGraph = 1}
local tradeGraph = {_currentBar; 
slotConfig = {createIcon = true, createBorder = true, createCount = false, createCash = true}
, _itemMaxCount = 9, _isNodeLinked = false, _isRefreshData = false, _commerceGraph_Max = 2, _currentCommerceIndex = 1, _currentCommerceSize = 1, _buyFromNPCOrSellToNPCOrAll = 3, _currentScrollIndex = 0, _commerceItemCount = 0, _commerceFirstSelct = 1, 
_graphDisplayIndex = {}
, _graphBackSizeY = 0, _intervalValue = 60, _graphIntervalValue = 8, _graphMode = tradeGraphMode.eGraphMode_NormalShopGraph, _isMouseOn = false, _mouseOnIndex = 0, 
_mouseOnCommerceIndexForAll = {}
, 
_mouseOnOrderIndexForAll = {}
, _buttonExit = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_Question"), 
_buttonTradeList = {[enCommerceType.enCommerceType_Luxury_Miscellaneous] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_miscellaneous"), [enCommerceType.enCommerceType_Luxury] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_luxury"), [enCommerceType.enCommerceType_Grocery] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_grocery"), [enCommerceType.enCommerceType_Cloth] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_cloth"), [enCommerceType.enCommerceType_ObjectSaint] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_objetSaint"), [enCommerceType.enCommerceType_MilitarySupplies] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_militarySupplies"), [enCommerceType.enCommerceType_Medicine] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_medicine"), [enCommerceType.enCommerceType_SeaFood] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_SeaFood"), [enCommerceType.enCommerceType_RawMaterial] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_RawMaterial"), [enCommerceType.enCommerceType_Max] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_all")}
, 
_dialogSceneIndex = {[enCommerceType.enCommerceType_Luxury_Miscellaneous] = 8, [enCommerceType.enCommerceType_Luxury] = 7, [enCommerceType.enCommerceType_Grocery] = 5, [enCommerceType.enCommerceType_Cloth] = 10, [enCommerceType.enCommerceType_ObjectSaint] = 11, [enCommerceType.enCommerceType_MilitarySupplies] = 12, [enCommerceType.enCommerceType_Medicine] = 6, [enCommerceType.enCommerceType_SeaFood] = 14, [enCommerceType.enCommerceType_RawMaterial] = 13, [enCommerceType.enCommerceType_Max] = 0}
, 
_buttonTradePosition = {}
, 
_staticLines = {[enCommerceType.enCommerceType_Luxury_Miscellaneous] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_miscellaneous"), [enCommerceType.enCommerceType_Luxury] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_luxury"), [enCommerceType.enCommerceType_Grocery] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_grocery"), [enCommerceType.enCommerceType_Cloth] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_cloth"), [enCommerceType.enCommerceType_ObjectSaint] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_objetSaint"), [enCommerceType.enCommerceType_MilitarySupplies] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_militarySupplies"), [enCommerceType.enCommerceType_Medicine] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_medicine"), [enCommerceType.enCommerceType_SeaFood] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_seaFood"), [enCommerceType.enCommerceType_RawMaterial] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_rawMaterial"), [enCommerceType.enCommerceType_Max] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Line_category_All")}
, 
_graphMiniPanel = {}
, 
_staticCommerceGraphs = {}
, 
_staticCurrentPoint = {}
, 
_staticHighPoint = {}
, 
_staticLowPoint = {}
, 
_staticCommceName = {}
, 
_staticText_PermissionMsg = {}
, 
_staticPriceRate = {}
, 
_static_PriceIcon = {}
, 
_static_OriginalPrice = {}
, 
_static_SupplyCount = {}
, 
_static_Condition = {}
, 
_static_GraphBaseLine = {}
, 
_icons = {}
, _graphInfoText = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "StaticText_GraphInfo"), _staticTitle = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Panel_Title"), _staticRectangle = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "graphFrame"), _staticMiniPanel = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Static_MiniPanel"), _staticGraph = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "graph_panel"), _staticBaseCurrentPoint = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "graph_currentPoint"), _staticBaseHighPoint = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "graph_LowestPoint"), _staticBaseLowPoint = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "graph_highestPoint"), _staticBaseCommerceName = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "item_name"), _staticTextPermission = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "StaticText_Permission"), _staticBasePriceRate = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "item_quotationRate"), _static_BasePriceIcon = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "item_sellPrice_goldIcon"), _static_OriginalPriceIcon = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "item_originalPrice_goldIcon"), _static_SupplyCountText = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "item_supply_count"), _static_ConditionText = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "StaticText_ConditionValue"), _static_BaseLine = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Static_BasePosition"), _scroll = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Scroll_Slot_List"), _currentBar = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "graph_currentPosition"), _button_BuyFromNPC = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_BuyFromNPC"), _button_SellToNPC = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_SellToNPC"), _staticTradeItemName = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "StaticText_TradeItemName"), _staticText_EnableSupplyCount = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "StaticText_EnableSupplyCount"), _selectTerritory = 0, _territoryCount = 0, 
_buttonTerritory = {}
, _buttonGoBackGraph = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_Back"), _supplyCountPosX = 0}
;
(tradeGraph._staticBaseCommerceName):SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
;
(tradeGraph._staticText_EnableSupplyCount):SetIgnore(false)
;
(tradeGraph._staticText_EnableSupplyCount):addInputEvent("Mouse_On", "TradeSupply_EnableCount_Tooltip(true)")
;
(tradeGraph._staticText_EnableSupplyCount):addInputEvent("Mouse_Out", "TradeSupply_EnableCount_Tooltip(false)")
TradeSupply_EnableCount_Tooltip = function(isShow)
  -- function num : 0_0 , upvalues : tradeGraph
  local uiControl = tradeGraph._staticText_EnableSupplyCount
  local name = ""
  local desc = PAGetString(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_DailySupplyCountDesc")
  if isShow then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

local territoryCount = 5
for countIndex = 1, territoryCount do
  -- DECOMPILER ERROR at PC459: Confused about usage of register: R10 in 'UnsetPending'

  (tradeGraph._buttonTerritory)[countIndex] = (UI.getChildControl)(Panel_Trade_Market_Graph_Window, "Button_category_Territory_" .. countIndex - 1)
  ;
  ((tradeGraph._buttonTerritory)[countIndex]):addInputEvent("Mouse_LUp", "buttonLupTradeGraph_Territory(" .. countIndex .. ")")
  ;
  ((tradeGraph._buttonTerritory)[countIndex]):SetSize(200, 32)
end
;
(tradeGraph._buttonGoBackGraph):addInputEvent("Mouse_LUp", "buttonLupGoBackTradeGraph()")
;
(tradeGraph._buttonGoBackGraph):AddEffect("UI_Trade_Button", true, 0, 0)
;
(tradeGraph._buttonGoBackGraph):SetShow(false)
local _miniPanel = {}
local _byWorldmapForGraph = false
local miniPanelPosY = 0
local _graphPosY = 0
tradeGraph.registUIControl = function(self)
  -- function num : 0_1 , upvalues : tradeGraph, _miniPanel, miniPanelPosY, _graphPosY
  local sizeRow = (tradeGraph._staticGraph):GetSizeX()
  local sizeCol = (tradeGraph._staticGraph):GetSizeY()
  local graphPanelPosX = (tradeGraph._staticGraph):GetPosX() - (tradeGraph._staticMiniPanel):GetPosX()
  local graphPanelPosY = (tradeGraph._staticGraph):GetPosY() - (tradeGraph._staticMiniPanel):GetPosY()
  local itemNamePosX = (tradeGraph._staticBaseCommerceName):GetPosX() - (tradeGraph._staticMiniPanel):GetPosX()
  local itemNamePosY = (tradeGraph._staticBaseCommerceName):GetPosY() - (tradeGraph._staticMiniPanel):GetPosY()
  local ratePosX = (tradeGraph._staticBasePriceRate):GetPosX() - (tradeGraph._staticMiniPanel):GetPosX()
  local ratePosY = (tradeGraph._staticBasePriceRate):GetPosY() - (tradeGraph._staticMiniPanel):GetPosY()
  local currentPricePosX = (tradeGraph._static_BasePriceIcon):GetPosX() - (tradeGraph._staticMiniPanel):GetPosX()
  local currentPricePosY = (tradeGraph._static_BasePriceIcon):GetPosY() - (tradeGraph._staticMiniPanel):GetPosY()
  local OriginalPricePosX = (tradeGraph._static_OriginalPriceIcon):GetPosX() - (tradeGraph._staticMiniPanel):GetPosX()
  local OriginalPricePosY = (tradeGraph._static_OriginalPriceIcon):GetPosY() - (tradeGraph._staticMiniPanel):GetPosY()
  local permissionMsgPosX = graphPanelPosX
  local permissionMsgPosY = graphPanelPosY + sizeCol / 2 - 15
  for count = 1, tradeGraph._itemMaxCount do
    local miniPanel = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Trade_Market_Graph_Window, "static_MiniPanel_" .. count)
    CopyBaseProperty(tradeGraph._staticMiniPanel, miniPanel)
    -- DECOMPILER ERROR at PC123: Confused about usage of register: R20 in 'UnsetPending'

    _miniPanel[count] = miniPanel
    miniPanel:SetPosX((tradeGraph._staticRectangle):GetPosX() + 3)
    local staticSizeInterval = (tradeGraph._staticRectangle):GetPosY() + sizeCol * (count - 1)
    local posY = staticSizeInterval + tradeGraph._intervalValue * (count - 1)
    miniPanel:SetPosY(posY + 3)
    miniPanel:SetShow(false)
    -- DECOMPILER ERROR at PC151: Confused about usage of register: R22 in 'UnsetPending'

    ;
    (tradeGraph._graphMiniPanel)[count] = miniPanel
    basePosX = miniPanel:GetPosX()
    basePosY = miniPanel:GetPosY()
    local staticGraph = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, miniPanel, "static_Graph" .. count)
    CopyBaseProperty(tradeGraph._staticGraph, staticGraph)
    -- DECOMPILER ERROR at PC175: Confused about usage of register: R23 in 'UnsetPending'

    ;
    (tradeGraph._staticCommerceGraphs)[count] = staticGraph
    ;
    ((tradeGraph._staticCommerceGraphs)[count]):addInputEvent("Mouse_On", "NpcTradeGraph_StaticMouseOn(" .. count .. ")")
    ;
    ((tradeGraph._staticCommerceGraphs)[count]):addInputEvent("Mouse_Out", "NpcTradeGraph_StaticMouseOut(" .. count .. ")")
    ;
    ((tradeGraph._staticCommerceGraphs)[count]):addInputEvent("Mouse_UpScroll", "NpcTradeGraph_ScrollEvent(true)")
    ;
    ((tradeGraph._staticCommerceGraphs)[count]):addInputEvent("Mouse_DownScroll", "NpcTradeGraph_ScrollEvent(false)")
    staticGraph:SetPosX(graphPanelPosX)
    staticGraph:SetPosY(graphPanelPosY)
    local slot = {}
    slot.icon = {}
    ;
    (SlotItem.new)(slot.icon, "GraphItem_" .. count, count, miniPanel, tradeGraph.slotConfig)
    ;
    (slot.icon):createChild()
    ;
    ((slot.icon).icon):addInputEvent("Mouse_On", "Tooltip_Item_Show_TradeMarket(" .. count .. ", true)")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_Out", "Tooltip_Item_Show_TradeMarket(" .. count .. ", false)")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_UpScroll", "NpcTradeGraph_ScrollEvent(true)")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_DownScroll", "NpcTradeGraph_ScrollEvent(false)")
    -- DECOMPILER ERROR at PC265: Confused about usage of register: R24 in 'UnsetPending'

    ;
    (tradeGraph._icons)[count] = slot
    ;
    ((slot.icon).icon):SetPosX(3)
    ;
    ((slot.icon).icon):SetPosY(3)
    local staticCommerceName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, miniPanel, "static_ItemName" .. count)
    CopyBaseProperty(tradeGraph._staticBaseCommerceName, staticCommerceName)
    -- DECOMPILER ERROR at PC293: Confused about usage of register: R25 in 'UnsetPending'

    ;
    (tradeGraph._staticCommceName)[count] = staticCommerceName
    staticCommerceName:SetPosX(((slot.icon).icon):GetPosX() + ((slot.icon).icon):GetSizeX() + 3)
    staticCommerceName:SetPosY(-4)
    local staticTextPermission = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, miniPanel, "StaticText_Permission" .. count)
    CopyBaseProperty(tradeGraph._staticTextPermission, staticTextPermission)
    -- DECOMPILER ERROR at PC326: Confused about usage of register: R26 in 'UnsetPending'

    ;
    (tradeGraph._staticText_PermissionMsg)[count] = staticTextPermission
    staticTextPermission:SetPosX(permissionMsgPosX)
    staticTextPermission:SetPosY(permissionMsgPosY)
    staticTextPermission:SetShow(false)
    local staticPriceRate = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, miniPanel, "item_quotationRate" .. count)
    CopyBaseProperty(tradeGraph._staticBasePriceRate, staticPriceRate)
    -- DECOMPILER ERROR at PC353: Confused about usage of register: R27 in 'UnsetPending'

    ;
    (tradeGraph._staticPriceRate)[count] = staticPriceRate
    staticPriceRate:SetPosX(ratePosX + 30)
    staticPriceRate:SetPosY(ratePosY - 3)
    staticPriceRate:SetShow(false)
    staticPriceRate:SetIgnore(false)
    local static_PriceIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, miniPanel, "item_sellPrice_goldIcon_" .. count)
    CopyBaseProperty(tradeGraph._static_BasePriceIcon, static_PriceIcon)
    -- DECOMPILER ERROR at PC383: Confused about usage of register: R28 in 'UnsetPending'

    ;
    (tradeGraph._static_PriceIcon)[count] = static_PriceIcon
    static_PriceIcon:SetPosX(ratePosX - 10)
    static_PriceIcon:SetPosY(ratePosY - 5)
    static_PriceIcon:SetShow(false)
    local static_OriginalPrice = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, miniPanel, "item_Original_goldIcon_" .. count)
    CopyBaseProperty(tradeGraph._static_OriginalPriceIcon, static_OriginalPrice)
    -- DECOMPILER ERROR at PC410: Confused about usage of register: R29 in 'UnsetPending'

    ;
    (tradeGraph._static_OriginalPrice)[count] = static_OriginalPrice
    static_OriginalPrice:SetPosX(OriginalPricePosX)
    static_OriginalPrice:SetPosY(OriginalPricePosY - 3)
    static_OriginalPrice:SetShow(false)
    local static_SupplyCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, miniPanel, "item_Supply_count_" .. count)
    CopyBaseProperty(tradeGraph._static_SupplyCountText, static_SupplyCount)
    -- DECOMPILER ERROR at PC437: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (tradeGraph._static_SupplyCount)[count] = static_SupplyCount
    static_SupplyCount:SetPosX(OriginalPricePosX + static_OriginalPrice:GetSizeX())
    static_SupplyCount:SetPosY(OriginalPricePosY + 14)
    static_SupplyCount:SetShow(false)
    local static_ConditionText = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, miniPanel, "item_Condition_" .. count)
    CopyBaseProperty(tradeGraph._static_ConditionText, static_ConditionText)
    -- DECOMPILER ERROR at PC466: Confused about usage of register: R31 in 'UnsetPending'

    ;
    (tradeGraph._static_Condition)[count] = static_ConditionText
    static_ConditionText:SetPosX(ratePosX - 30)
    static_ConditionText:SetPosY(OriginalPricePosY + 14)
    static_ConditionText:SetShow(false)
    local staticCurrentPoint = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, miniPanel, "static_CurrentPoint" .. count)
    CopyBaseProperty(tradeGraph._staticBaseCurrentPoint, staticCurrentPoint)
    -- DECOMPILER ERROR at PC493: Confused about usage of register: R32 in 'UnsetPending'

    ;
    (tradeGraph._staticCurrentPoint)[count] = staticCurrentPoint
    local staticHighPoint = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, miniPanel, "static_HigePoint" .. count)
    CopyBaseProperty(tradeGraph._staticBaseHighPoint, staticHighPoint)
    -- DECOMPILER ERROR at PC511: Confused about usage of register: R33 in 'UnsetPending'

    ;
    (tradeGraph._staticHighPoint)[count] = staticHighPoint
    local staticLowPoint = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, miniPanel, "static_LowPoint" .. count)
    CopyBaseProperty(tradeGraph._staticBaseLowPoint, staticLowPoint)
    -- DECOMPILER ERROR at PC529: Confused about usage of register: R34 in 'UnsetPending'

    ;
    (tradeGraph._staticLowPoint)[count] = staticLowPoint
    local staticBaseLine = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, miniPanel, "static_BaseLine" .. count)
    CopyBaseProperty(tradeGraph._static_BaseLine, staticBaseLine)
    -- DECOMPILER ERROR at PC547: Confused about usage of register: R35 in 'UnsetPending'

    ;
    (tradeGraph._static_GraphBaseLine)[count] = staticBaseLine
  end
  -- DECOMPILER ERROR at PC555: Confused about usage of register: R15 in 'UnsetPending'

  tradeGraph._supplyCountPosX = ((tradeGraph._static_SupplyCount)[1]):GetPosX()
  -- DECOMPILER ERROR at PC562: Confused about usage of register: R15 in 'UnsetPending'

  tradeGraph._graphBackSizeY = ((tradeGraph._staticCommerceGraphs)[1]):GetSizeY()
  miniPanelPosY = (_miniPanel[1]):GetPosY()
  _graphPosY = ((tradeGraph._staticCommerceGraphs)[1]):GetPosY()
  for btnIndex = 1, enCommerceType.enCommerceType_Max - 1 do
    local position = {x = 0, y = 0}
    position.x = ((tradeGraph._buttonTradeList)[btnIndex]):GetPosX()
    position.y = ((tradeGraph._buttonTradeList)[btnIndex]):GetPosY()
    -- DECOMPILER ERROR at PC597: Confused about usage of register: R20 in 'UnsetPending'

    ;
    (tradeGraph._buttonTradePosition)[btnIndex] = position
  end
  ;
  (tradeGraph._scroll):SetPosX((tradeGraph._staticRectangle):GetPosX() + (tradeGraph._staticRectangle):GetSizeX())
  ;
  (tradeGraph._scroll):SetPosY((tradeGraph._staticRectangle):GetPosY())
  ;
  (tradeGraph._scroll):SetControlPos(0)
  ;
  (tradeGraph._staticGraph):SetShow(false)
  ;
  (tradeGraph._button_SellToNPC):AddEffect("UI_Trade_Button", true, 0, 0)
  ;
  (tradeGraph._button_BuyFromNPC):EraseAllEffect()
  Panel_Trade_Market_Graph_Window:SetChildIndex(tradeGraph._graphInfoText, 9999)
end

local setGraphMiniPanel = function(index, isShow)
  -- function num : 0_2 , upvalues : tradeGraph
  ((tradeGraph._graphMiniPanel)[index]):SetShow(isShow)
  local staticGraph = (tradeGraph._staticCommerceGraphs)[index]
  staticGraph:SetShow(isShow)
  staticGraph:SetGraphMode(isShow)
  ;
  ((((tradeGraph._icons)[index]).icon).icon):SetShow(isShow)
  ;
  ((tradeGraph._staticCurrentPoint)[index]):SetShow(isShow)
  ;
  ((tradeGraph._staticLowPoint)[index]):SetShow(isShow)
  ;
  ((tradeGraph._staticHighPoint)[index]):SetShow(isShow)
  ;
  ((tradeGraph._staticCommceName)[index]):SetShow(isShow)
  ;
  ((tradeGraph._staticText_PermissionMsg)[index]):SetShow(isShow)
  ;
  ((tradeGraph._staticPriceRate)[index]):SetShow(isShow)
  ;
  ((tradeGraph._static_PriceIcon)[index]):SetShow(isShow)
  ;
  ((tradeGraph._static_OriginalPrice)[index]):SetShow(isShow)
  ;
  ((tradeGraph._static_GraphBaseLine)[index]):SetShow(isShow)
end

NpcTradeGraph_StaticMouseOn = function(index)
  -- function num : 0_3 , upvalues : tradeGraphMode, tradeGraph
  if isGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph) == false then
    return 
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  tradeGraph._isMouseOn = true
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  tradeGraph._mouseOnIndex = index
  ;
  (tradeGraph._currentBar):SetShow(true)
  ;
  (tradeGraph._graphInfoText):SetShow(true)
end

NpcTradeGraph_StaticMouseOut = function(index)
  -- function num : 0_4 , upvalues : tradeGraphMode, tradeGraph
  if isGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph) == false then
    return 
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  tradeGraph._isMouseOn = false
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  tradeGraph._mouseOnIndex = 0
  ;
  (tradeGraph._currentBar):SetShow(false)
  ;
  (tradeGraph._graphInfoText):SetShow(false)
end

setChangeGraphMode = function(graphMode)
  -- function num : 0_5 , upvalues : tradeGraph
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  tradeGraph._graphMode = graphMode
end

isGraphMode = function(graphMode)
  -- function num : 0_6 , upvalues : tradeGraph
  if tradeGraph._graphMode == graphMode then
    return true
  end
  return false
end

updateTradeMarketGraphData = function(deltaTime)
  -- function num : 0_7 , upvalues : tradeGraph, tradeGraphMode, debugValue
  if tradeGraph._isMouseOn == false then
    return 
  end
  if isGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph) == false then
    return 
  end
  ;
  (tradeGraph._staticTradeItemName):SetShow(false)
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  local commerceUI = (tradeGraph._staticCommerceGraphs)[tradeGraph._mouseOnIndex]
  if commerceUI == nil then
    return 
  end
  local mousePosXInUI = commerceUI:GetPosX() + mousePosX - commerceUI:GetParentPosX() - 3
  local mousePosYInUI = commerceUI:GetPosY()
  ;
  (tradeGraph._currentBar):SetPosX(commerceUI:GetParentPosX() + mousePosXInUI)
  ;
  (tradeGraph._currentBar):SetPosY(commerceUI:GetParentPosY())
  ;
  (tradeGraph._graphInfoText):SetPosX(commerceUI:GetParentPosX() + mousePosXInUI + 8)
  ;
  (tradeGraph._graphInfoText):SetPosY(commerceUI:GetParentPosY() + (tradeGraph._currentBar):GetSizeY() / 2)
  local posIndex = (math.floor)(mousePosXInUI / tradeGraph._graphIntervalValue)
  if posIndex < 0 or posIndex > 30 then
    return 
  end
  local findCommercetType = -1
  local findOrderIndex = -1
  if (tradeGraph._graphDisplayIndex)[tradeGraph._mouseOnIndex] == nil then
    return 
  end
  findOrderIndex = (tradeGraph._graphDisplayIndex)[tradeGraph._mouseOnIndex]
  findCommercetType = tradeGraph._currentCommerceIndex
  if findOrderIndex == nil then
    return 
  end
  local itemKey = npcShop_GetCommerceItemByIndexAndSellOrBuy(findCommercetType, tradeGraph._buyFromNPCOrSellToNPCOrAll, findOrderIndex - 1)
  if itemKey ~= 0 then
    local currentPosPrice = npcShop_getTadePastPrice(itemKey, posIndex)
    local itemESSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
    if currentPosPrice == -1 then
      if debugValue == 1 then
        local sellPrice = npcShop_getTradeItem(itemKey)
        ;
        (tradeGraph._graphInfoText):SetText("PositionX : " .. mousePosXInUI .. "\n  posIndex : " .. posIndex .. "\n  Price : " .. tostring(sellPrice))
      else
        do
          ;
          (tradeGraph._graphInfoText):SetText("")
          do return  end
          if debugValue == 1 then
            (tradeGraph._graphInfoText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_NAME") .. itemESSW:getName() .. "(" .. itemKey .. ")" .. "\n PositionX : " .. mousePosXInUI .. "\n  posIndex : " .. posIndex .. "\n  Price : " .. currentPosPrice .. "\n commerceType : " .. findCommercetType .. "\n index : " .. findOrderIndex)
          else
            ;
            (tradeGraph._graphInfoText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_currentPrice", "currentPosPrice", currentPosPrice))
          end
        end
      end
    end
  end
end

local commerceGraphInitialize = function()
  -- function num : 0_8 , upvalues : tradeGraph, setGraphMiniPanel
  for count = 1, tradeGraph._itemMaxCount do
    setGraphMiniPanel(count, false)
  end
  ;
  (tradeGraph._currentBar):SetShow(false)
end

global_updateCommerceInfoByType = function(commerceIndex, isSellorBuy)
  -- function num : 0_9 , upvalues : tradeGraph
  Panel_Trade_Market_Graph_Window:ResetRadiobutton(((tradeGraph._buttonTradeList)[1]):GetGroupNumber())
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  if isSellorBuy == 1 then
    tradeGraph._currentScrollIndex = 0
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  tradeGraph._buyFromNPCOrSellToNPCOrAll = isSellorBuy
  for lineCount = 1, enCommerceType.enCommerceType_Max - 1 do
    ((tradeGraph._staticLines)[lineCount]):SetShow(false)
  end
  check_Empty_CommerceDataALL()
  ;
  (tradeGraph.updateCommerceInfo)(commerceIndex)
  local commerceCount = check_Empty_CommerceData(commerceIndex)
  if commerceCount == 0 then
    ((tradeGraph._staticLines)[tradeGraph._currentCommerceIndex]):SetShow(false)
  end
  setBuySellButtonClick()
end

tradeGraph.updateCommerceInfo = function(commerceIndex)
  -- function num : 0_10 , upvalues : commerceGraphInitialize, tradeGraph
  commerceGraphInitialize()
  local commerceItemSize = npcShop_getCommerceItemSize(commerceIndex)
  if commerceItemSize <= 0 then
    return 
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  tradeGraph._currentCommerceIndex = commerceIndex
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  tradeGraph._currentCommerceSize = commerceItemSize
  setCommerceButtonClick(tradeGraph._currentCommerceIndex)
  ;
  ((tradeGraph._staticLines)[tradeGraph._currentCommerceIndex]):SetShow(true)
  ;
  (tradeGraph.updateTradeProduct)()
end

local territorySupplyCheck = false
local _byWorldmap = false
global_CommerceGraphDataInit = function(byWorldmap)
  -- function num : 0_11 , upvalues : tradeGraph, tradeGraphMode, territorySupplyCheck, territoryCount, _byWorldmap
  local characterStaticStatusWrapper = npcShop_getCurrentCharacterKeyForTrade()
  local characterStaticStatus = characterStaticStatusWrapper:get()
  local talker = dialog_getTalker()
  if talker ~= nil then
    local npcActorproxy = talker:get()
    if npcActorproxy ~= nil then
      local npcPosition = npcActorproxy:getPosition()
      local npcRegionInfo = getRegionInfoByPosition(npcPosition)
      local npcTradeNodeName = npcRegionInfo:getTradeExplorationNodeName()
      local npcTradeOriginRegion = (npcRegionInfo:get()):getTradeOriginRegion()
      -- DECOMPILER ERROR at PC28: Confused about usage of register: R9 in 'UnsetPending'

      tradeGraph._isNodeLinked = checkSelfplayerNode(npcTradeOriginRegion._waypointKey, true)
    end
  end
  do
    setChangeGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph)
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

    if characterStaticStatus:isTerritorySupplyMerchant() then
      tradeGraph._buyFromNPCOrSellToNPCOrAll = 2
      ;
      (tradeGraph._button_SellToNPC):SetShow(false)
      ;
      (tradeGraph._button_BuyFromNPC):SetShow(false)
      Panel_Trade_Market_BuyItemList:SetShow(false)
      territorySupplyCheck = true
      eventResetScreenSizeTrade(true)
    else
      -- DECOMPILER ERROR at PC64: Confused about usage of register: R4 in 'UnsetPending'

      if characterStaticStatus:isTerritoryTradeMerchant() then
        tradeGraph._buyFromNPCOrSellToNPCOrAll = 1
        ;
        (tradeGraph._button_SellToNPC):SetShow(true)
        ;
        (tradeGraph._button_BuyFromNPC):SetShow(true)
        territorySupplyCheck = false
        eventResetScreenSizeTrade(false)
      else
        -- DECOMPILER ERROR at PC94: Confused about usage of register: R4 in 'UnsetPending'

        if characterStaticStatus:isSupplyMerchant() or characterStaticStatus:isFishSupplyMerchant() or characterStaticStatus:isGuildSupplyShopMerchant() then
          tradeGraph._buyFromNPCOrSellToNPCOrAll = 3
          ;
          (tradeGraph._button_SellToNPC):SetShow(false)
          ;
          (tradeGraph._button_BuyFromNPC):SetShow(false)
          Panel_Trade_Market_BuyItemList:SetShow(false)
          territorySupplyCheck = true
          if characterStaticStatus:isGuildSupplyShopMerchant() then
            territorySupplyCheck = false
          end
          eventResetScreenSizeTrade(true)
          FGlobal_RemainItemDesc_Hide()
        else
          -- DECOMPILER ERROR at PC124: Confused about usage of register: R4 in 'UnsetPending'

          tradeGraph._buyFromNPCOrSellToNPCOrAll = 1
          ;
          (tradeGraph._button_SellToNPC):SetShow(true)
          ;
          (tradeGraph._button_BuyFromNPC):SetShow(true)
          territorySupplyCheck = false
          eventResetScreenSizeTrade(false)
        end
      end
    end
    if byWorldmap == nil then
      byWorldmap = false
    end
    if byWorldmap == true then
      Panel_Trade_Market_Graph_Window:SetPosX(getScreenSizeX() - Panel_Trade_Market_Graph_Window:GetSizeX())
      Panel_Trade_Market_Graph_Window:SetPosY(50)
    else
      Panel_Trade_Market_Graph_Window:SetPosX(0)
      Panel_Trade_Market_Graph_Window:SetPosY(0)
    end
    refreshGraphData()
    for countIndex = 1, territoryCount do
      local trendItemSizeInTerritory = ToClient_TrendTradeItemSize(countIndex - 1)
      ;
      ((tradeGraph._buttonTerritory)[countIndex]):SetShow(false)
    end
    if isGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph) then
      Panel_Trade_Market_Graph_Window:SetEnableArea(0, 0, Panel_Trade_Market_Graph_Window:GetSizeX(), Panel_Trade_Market_Graph_Window:GetSizeY())
      if characterStaticStatus:isNormalTradeMerchant() then
        resetTrendGraphButton(false)
        ;
        (tradeGraph._buttonGoBackGraph):SetShow(false)
      end
    end
    _byWorldmap = byWorldmap
    ;
    (tradeGraph.updateTradeProduct)()
    Panel_Trade_Market_Graph_Window:ResetRadiobutton(((tradeGraph._buttonTradeList)[1]):GetGroupNumber())
    Panel_Trade_Market_Graph_Window:ResetRadiobutton((tradeGraph._button_BuyFromNPC):GetGroupNumber())
    setCommerceButtonClick(tradeGraph._currentCommerceIndex)
    ;
    ((tradeGraph._staticLines)[tradeGraph._currentCommerceIndex]):SetShow(true)
    setBuySellButtonClick()
    local typeIndex = (tradeGraph._dialogSceneIndex)[tradeGraph._currentCommerceIndex]
    if typeIndex ~= 0 and byWorldmap == false and tradeGraph._isNodeLinked == true and not characterStaticStatus:isTerritorySupplyMerchant() then
      global_buyListOpen((commerceCategory[typeIndex]).Type)
    end
  end
end

tradeGraph.updateTradeProduct = function()
  -- function num : 0_12 , upvalues : tradeGraph, index_Tooltip
  (tradeGraph._scroll):SetShow(true)
  local commerceCount = 0
  if tradeGraph._buyFromNPCOrSellToNPCOrAll == 1 then
    commerceCount = check_Empty_CommerceData(tradeGraph._currentCommerceIndex)
  else
    commerceCount = npcShop_getCommerceItemSize(tradeGraph._currentCommerceIndex)
  end
  local showCount = 0
  local scrollIndex = tradeGraph._currentScrollIndex
  index_Tooltip = {}
  for count = 1, commerceCount do
    if showCount == tradeGraph._commerceGraph_Max then
      break
    end
    local itemKey = npcShop_GetCommerceItemByIndexAndSellOrBuy(tradeGraph._currentCommerceIndex, tradeGraph._buyFromNPCOrSellToNPCOrAll, scrollIndex + count - 1)
    if itemKey ~= 0 then
      showCount = showCount + 1
      ;
      (tradeGraph.tradeMarket_DrawGraph)(tradeGraph._currentCommerceIndex, itemKey, showCount, scrollIndex + count)
      -- DECOMPILER ERROR at PC57: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (tradeGraph._graphDisplayIndex)[showCount] = scrollIndex + count
    end
  end
  do
    -- DECOMPILER ERROR at PC60: Confused about usage of register: R3 in 'UnsetPending'

    tradeGraph._commerceItemCount = commerceCount
    ;
    (UIScroll.SetButtonSize)(tradeGraph._scroll, tradeGraph._commerceGraph_Max, commerceCount)
    tradeGraph:registTradeGraphEvent()
    local characterStaticStatusWrapper = npcShop_getCurrentCharacterKeyForTrade()
    local characterStaticStatus = characterStaticStatusWrapper:get()
    if characterStaticStatus ~= nil then
      if characterStaticStatus:isSupplyMerchant() then
        local territoryKeyRaw = getDefaultTerritoryKey()
        local explorePoint = getExplorePointByTerritoryRaw(territoryKeyRaw)
        local maxExpPoint = explorePoint:getAquiredPoint()
        local leftCount = tostring(((getSelfPlayer()):get()):getTradeSupplyCount()) .. " / " .. tostring((math.floor)(maxExpPoint / FromClient_getTradeSupplyCount()))
        ;
        (tradeGraph._staticText_EnableSupplyCount):SetShow(true)
        ;
        (tradeGraph._staticText_EnableSupplyCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_DailySupplyCount", "count", tostring(leftCount)))
      else
        do
          ;
          (tradeGraph._staticText_EnableSupplyCount):SetShow(false)
          ;
          (tradeGraph._staticText_EnableSupplyCount):SetShow(false)
        end
      end
    end
  end
end

local itemset = {}
local itemsetIndex = 0
global_TradeMarketGraph_StaticStatus = function(index)
  -- function num : 0_13 , upvalues : itemset, tradeGraph
  local itemKey = npcShop_GetCommerceItemByIndexAndSellOrBuy((itemset[index]).commerceIndex, tradeGraph._buyFromNPCOrSellToNPCOrAll, (itemset[index]).index)
  if itemKey == 0 then
    return 
  end
  return getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
end

local calcuateY = function(src, dest)
  -- function num : 0_14
  if src <= dest then
    dest = dest - src
  else
    if dest <= src then
      dest = src - (dest)
    else
      dest = src
    end
  end
  return dest
end

local miniPanelSizeY = (tradeGraph._staticMiniPanel):GetSizeY()
tradeGraph.tradeMarket_DrawGraph = function(commerceIndexForGraph, itemKey, UIIndex, itemOrderIndex)
  -- function num : 0_15 , upvalues : tradeGraph, itemset, itemsetIndex, index_Tooltip, territorySupplyCheck, _miniPanel, miniPanelSizeY, miniPanelPosY, _graphPosY, _byWorldmap, debugValue
  local commerceUI = (tradeGraph._staticCommerceGraphs)[UIIndex]
  commerceUI:ClearGraphList()
  local intervalPosY = tradeGraph._graphBackSizeY / 2
  commerceUI:setGraphBasePos(intervalPosY)
  ;
  ((tradeGraph._graphMiniPanel)[UIIndex]):SetShow(true)
  local itemESSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
  local itemStatus = itemESSW:get()
  ;
  (((tradeGraph._icons)[UIIndex]).icon):setItemByStaticStatus(itemESSW)
  ;
  ((((tradeGraph._icons)[UIIndex]).icon).icon):SetShow(true)
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R8 in 'UnsetPending'

  itemset[itemsetIndex] = {commerceIndex = commerceIndexForGraph, index = itemOrderIndex - 1}
  Panel_Tooltip_Item_SetPosition(itemsetIndex, ((tradeGraph._icons)[UIIndex]).icon, "tradeMarket")
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R8 in 'UnsetPending'

  index_Tooltip[UIIndex] = itemsetIndex
  itemsetIndex = itemsetIndex + 1
  local originalPrice = itemESSW:getOriginalPriceByInt64()
  ;
  ((tradeGraph._static_OriginalPrice)[UIIndex]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_OriginalPrice", "OriginalPrice", makeDotMoney(originalPrice)))
  local tradeItemWrapper = npcShop_getTradeItem(itemKey)
  local sellPrice = tradeItemWrapper:getTradeSellPrice()
  ;
  ((tradeGraph._static_PriceIcon)[UIIndex]):SetText(makeDotMoney(sellPrice))
  ;
  ((tradeGraph._static_PriceIcon)[UIIndex]):SetPosX((tradeGraph._staticBasePriceRate):GetPosX() - (tradeGraph._staticMiniPanel):GetPosX() + ((tradeGraph._static_PriceIcon)[UIIndex]):GetTextSizeX() - 2)
  if territorySupplyCheck == true then
    local _s64_leftCount = tradeItemWrapper:getLeftCount()
    if (Defines.s64_const).s64_0 == _s64_leftCount then
      ((tradeGraph._static_SupplyCount)[UIIndex]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_5"))
    else
      local _leftCount = Int64toInt32(_s64_leftCount)
      ;
      ((tradeGraph._static_SupplyCount)[UIIndex]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_SUPPLYCOUNT", "leftCount", _leftCount))
    end
    do
      ;
      ((tradeGraph._static_SupplyCount)[UIIndex]):SetShow(true)
      do
        local _gap = ((tradeGraph._static_SupplyCount)[UIIndex]):GetSizeY() + ((tradeGraph._static_SupplyCount)[UIIndex]):GetPosY() - ((tradeGraph._static_OriginalPrice)[UIIndex]):GetPosY()
        ;
        (_miniPanel[UIIndex]):SetSize((_miniPanel[UIIndex]):GetSizeX(), miniPanelSizeY + _gap)
        ;
        (_miniPanel[UIIndex]):SetPosY(miniPanelPosY + (UIIndex - 1) * (miniPanelSizeY + _gap))
        commerceUI:SetPosY(_graphPosY + _gap)
        ;
        (tradeGraph._staticTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_7"))
        ;
        (tradeGraph._staticTradeItemName):SetShow(false)
        ;
        ((tradeGraph._static_Condition)[UIIndex]):SetShow(false)
        if tradeGraph._buyFromNPCOrSellToNPCOrAll == 1 and _byWorldmap == true then
          local buyableStack = tradeItemWrapper:getRemainStackCount()
          ;
          ((tradeGraph._static_SupplyCount)[UIIndex]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_BUYABLESTACK", "buyableStack", tostring(buyableStack)))
          ;
          ((tradeGraph._static_SupplyCount)[UIIndex]):SetShow(true)
          local needLifeType = (tradeItemWrapper:get()):getNeedLifeType()
          local needLifeLevel = (tradeItemWrapper:get()):getNeedLifeLevel()
          local conditionLevel = FGlobal_CraftLevel_Replace(needLifeLevel + 1, needLifeType)
          local conditionTypeName = FGlobal_CraftType_ReplaceName(needLifeType)
          local buyingConditionValue = ""
          if needLifeLevel == 0 or needLifeLevel == nil then
            buyingConditionValue = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_NOPE")
            ;
            ((tradeGraph._static_Condition)[UIIndex]):SetText(buyingConditionValue)
            ;
            ((tradeGraph._static_Condition)[UIIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
          else
            local player = getSelfPlayer()
            local playerGet = player:get()
            local playerThisCraftLevel = playerGet:getLifeExperienceLevel(needLifeType)
            if needLifeLevel < playerThisCraftLevel then
              ((tradeGraph._static_Condition)[UIIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
              buyingConditionValue = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_BUYINGCONDITION", "conditionTypeName", conditionTypeName, "conditionLevel", conditionLevel)
            else
              buyingConditionValue = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_BUYINGCONDITION", "conditionTypeName", conditionTypeName, "conditionLevel", conditionLevel)
              ;
              ((tradeGraph._static_Condition)[UIIndex]):SetFontColor((Defines.Color).C_FF775555)
            end
            ;
            ((tradeGraph._static_Condition)[UIIndex]):SetText(buyingConditionValue)
          end
          do
            local conditionSizeX = ((tradeGraph._static_Condition)[UIIndex]):GetTextSizeX()
            local conditionPosX = ((tradeGraph._static_Condition)[UIIndex]):GetPosX()
            local supplySizeX = ((tradeGraph._static_SupplyCount)[UIIndex]):GetTextSizeX()
            local supplyPosX = ((tradeGraph._static_SupplyCount)[UIIndex]):GetPosX()
            if tradeGraph._supplyCountPosX < conditionSizeX + conditionPosX + 80 then
              ((tradeGraph._static_SupplyCount)[UIIndex]):SetPosX(tradeGraph._supplyCountPosX + 10)
            else
              ;
              ((tradeGraph._static_SupplyCount)[UIIndex]):SetPosX(tradeGraph._supplyCountPosX)
            end
            ;
            ((tradeGraph._static_Condition)[UIIndex]):SetShow(true)
            do
              local _gap = ((tradeGraph._static_SupplyCount)[UIIndex]):GetSizeY()
              ;
              (_miniPanel[UIIndex]):SetSize((_miniPanel[UIIndex]):GetSizeX(), miniPanelSizeY + _gap)
              ;
              (_miniPanel[UIIndex]):SetPosY(miniPanelPosY + (UIIndex - 1) * (miniPanelSizeY + _gap))
              commerceUI:SetPosY(_graphPosY + _gap)
              ;
              ((tradeGraph._static_SupplyCount)[UIIndex]):SetShow(false)
              ;
              ((tradeGraph._static_Condition)[UIIndex]):SetShow(false)
              ;
              (_miniPanel[UIIndex]):SetSize((tradeGraph._staticMiniPanel):GetSizeX(), miniPanelSizeY)
              ;
              (_miniPanel[UIIndex]):SetPosY(miniPanelPosY + (UIIndex - 1) * miniPanelSizeY)
              commerceUI:SetPosY(_graphPosY)
              ;
              (tradeGraph._staticTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_8"))
              local sellRate = (string.format)("%.f", npcShop_GetTradeGraphRateOfPrice(itemKey))
              if debugValue == 1 then
                ((tradeGraph._staticPriceRate)[UIIndex]):SetText("[ " .. tostring(sellRate) .. "% ]" .. "(" .. itemKey .. ")" .. commerceIndexForGraph .. " " .. itemOrderIndex)
                ;
                ((tradeGraph._staticPriceRate)[UIIndex]):SetText("[ " .. tostring(sellRate) .. "% ]" .. "(" .. tostring(sellPrice) .. ")" .. tostring(originalPrice))
              else
                local priceRate_Value = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_SellRate", "Percent", tostring(sellRate))
                if tonumber(tostring(sellRate)) > 100 then
                  priceRate_Value = "(<PAColor0xFFFFCE22>" .. priceRate_Value .. "�\178<PAOldColor>/" .. makeDotMoney(sellPrice) .. ")"
                else
                  priceRate_Value = "(<PAColor0xFFF26A6A>" .. priceRate_Value .. "�\188<PAOldColor>/" .. makeDotMoney(sellPrice) .. ")"
                end
                ;
                ((tradeGraph._staticPriceRate)[UIIndex]):addInputEvent("Mouse_On", "NpcTradeGraph_SimpleToolTip( true, " .. UIIndex .. " )")
                ;
                ((tradeGraph._staticPriceRate)[UIIndex]):addInputEvent("Mouse_Out", "NpcTradeGraph_SimpleToolTip( false, " .. UIIndex .. " )")
                ;
                ((tradeGraph._staticPriceRate)[UIIndex]):SetText(priceRate_Value)
                ;
                ((tradeGraph._staticPriceRate)[UIIndex]):SetPosX(((tradeGraph._static_PriceIcon)[UIIndex]):GetPosX() + 15)
              end
              do
                ;
                ((tradeGraph._static_GraphBaseLine)[UIIndex]):SetPosX(commerceUI:GetPosX())
                ;
                ((tradeGraph._static_GraphBaseLine)[UIIndex]):SetPosY(commerceUI:GetPosY() + commerceUI:GetSizeY() / 2)
                ;
                ((tradeGraph._static_GraphBaseLine)[UIIndex]):SetShow(true)
                commerceUI:SetGraphMode(true)
                commerceUI:SetShow(true)
                if debugValue == 1 then
                  ((tradeGraph._staticCommceName)[UIIndex]):SetText(itemESSW:getName() .. "(" .. itemKey .. ")")
                else
                  ;
                  ((tradeGraph._staticCommceName)[UIIndex]):SetText(itemESSW:getName())
                end
                if itemStatus._tradeType == 1 then
                  ((tradeGraph._staticCommceName)[UIIndex]):SetFontColor((Defines.Color).C_FFB75EDD)
                else
                  ;
                  ((tradeGraph._staticCommceName)[UIIndex]):SetFontColor((Defines.Color).C_FFE7E7E7)
                end
                ;
                ((tradeGraph._staticCommceName)[UIIndex]):SetShow(true)
                ;
                ((tradeGraph._static_OriginalPrice)[UIIndex]):SetShow(false)
                if tradeItemWrapper:isTradableItem() == true and (tradeGraph._isNodeLinked == true or _byWorldmap == true) then
                  ((tradeGraph._staticPriceRate)[UIIndex]):SetShow(true)
                  ;
                  ((tradeGraph._static_PriceIcon)[UIIndex]):SetShow(true)
                else
                  if itemStatus._tradeType == 1 then
                    ((tradeGraph._staticText_PermissionMsg)[UIIndex]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_TXT_PERMISSION2"))
                  else
                    ;
                    ((tradeGraph._staticText_PermissionMsg)[UIIndex]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_TXT_PERMISSION"))
                  end
                  ;
                  ((tradeGraph._staticText_PermissionMsg)[UIIndex]):SetShow(true)
                end
                ;
                (tradeGraph.tradeMarket_DrawGraphXX)(commerceUI, itemKey, UIIndex, tradeItemWrapper, intervalPosY)
              end
            end
          end
        end
      end
    end
  end
end

tradeGraph.tradeMarket_DrawGraphXX = function(commerceUI, itemKey, UIIndex, tradeItemWrapper, intervalPosY)
  -- function num : 0_16 , upvalues : _byWorldmap, tradeGraph, calcuateY
  local priceCountSize = tradeItemWrapper:getGraphSize()
  local minPosition = -1
  local checkMinPos = 9999999
  local maxPosition = -1
  local checkMaxPos = 0
  drawPos = tradeItemWrapper:getGraphPosAt(0)
  if drawPos == nil then
    return 
  end
  if _byWorldmap == false and tradeGraph._isNodeLinked == false then
    return 
  end
  minPosition = tradeGraph._graphIntervalValue
  maxPosition = tradeGraph._graphIntervalValue
  local value1 = 0
  local value2 = 0
  local value3 = 0
  for count = 1, priceCountSize do
    drawPos = tradeItemWrapper:getGraphPosAt(count - 1)
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R17 in 'UnsetPending'

    if drawPos.y > 100 then
      drawPos.y = 100
    end
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R17 in 'UnsetPending'

    if drawPos.y < -100 then
      drawPos.y = -100
    end
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R17 in 'UnsetPending'

    drawPos.x = tradeGraph._graphIntervalValue * count
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R17 in 'UnsetPending'

    drawPos.y = drawPos.y * intervalPosY
    -- DECOMPILER ERROR at PC63: Confused about usage of register: R17 in 'UnsetPending'

    drawPos.y = drawPos.y / 100
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R17 in 'UnsetPending'

    drawPos.y = calcuateY(intervalPosY, drawPos.y)
    commerceUI:AddGraphPos(drawPos)
    if checkMaxPos <= drawPos.y then
      maxPosition = drawPos.x
      checkMaxPos = drawPos.y
    end
    if drawPos.y < checkMinPos then
      minPosition = drawPos.x
      checkMinPos = drawPos.y
    end
  end
  commerceUI:interpolationGraph()
  local curPostionUI = (tradeGraph._staticCurrentPoint)[UIIndex]
  curPostionUI:SetPosX(commerceUI:GetPosX() + drawPos.x - curPostionUI:GetSizeX() / 2)
  curPostionUI:SetPosY(commerceUI:GetPosY() + drawPos.y - curPostionUI:GetSizeX() / 2)
  curPostionUI:SetShow(tradeItemWrapper:isTradableItem())
  if priceCountSize > 2 then
    if drawPos.y ~= checkMinPos then
      local lowPostionUI = (tradeGraph._staticLowPoint)[UIIndex]
      local graphPosY = commerceUI:getinterpolationGraphValue(minPosition)
      lowPostionUI:SetPosX(commerceUI:GetPosX() + minPosition - lowPostionUI:GetSizeX() / 2)
      lowPostionUI:SetPosY(commerceUI:GetPosY() + graphPosY - lowPostionUI:GetSizeY() / 2)
      lowPostionUI:SetShow(true)
    end
    do
      if drawPos.y ~= checkMaxPos then
        local highPostionUI = (tradeGraph._staticHighPoint)[UIIndex]
        graphPosY = commerceUI:getinterpolationGraphValue(maxPosition)
        highPostionUI:SetPosX(commerceUI:GetPosX() + maxPosition - highPostionUI:GetSizeX() / 2)
        highPostionUI:SetPosY(commerceUI:GetPosY() + graphPosY - highPostionUI:GetSizeY() / 2)
        highPostionUI:SetShow(true)
      end
    end
  end
end

tradeGraph.CommerceDataShowAll = function()
  -- function num : 0_17 , upvalues : commerceGraphInitialize, tradeGraph
  commerceGraphInitialize()
  ;
  (table.remove)(tradeGraph._mouseOnCommerceIndexForAll)
  ;
  (table.remove)(tradeGraph._mouseOnOrderIndexForAll)
  local uiIndexAll = 1
  for commerceIndex = 1, enCommerceType.enCommerceType_Max - 1 do
    local commerceItemSize = npcShop_getCommerceItemSize(commerceIndex)
    for commerceItemCount = 1, commerceItemSize do
      local itemKey = npcShop_GetCommerceItemByIndexAndSellOrBuy(commerceIndex, tradeGraph._buyFromNPCOrSellToNPCOrAll, commerceItemCount - 1)
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R11 in 'UnsetPending'

      if itemKey ~= 0 then
        (tradeGraph._mouseOnCommerceIndexForAll)[uiIndexAll] = commerceIndex
        -- DECOMPILER ERROR at PC39: Confused about usage of register: R11 in 'UnsetPending'

        ;
        (tradeGraph._mouseOnOrderIndexForAll)[uiIndexAll] = commerceItemCount
        uiIndexAll = uiIndexAll + 1
      end
    end
  end
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  tradeGraph._currentCommerceSize = uiIndexAll
  local npcKey = dialog_getTalkNpcKey()
  if npcKey ~= 0 then
    (tradeGraph.updateTradeProduct)()
  end
end

npcShop_luaGetCommerceItemByIndexAndCheckSellOrBuy = function(commerceType, index)
  -- function num : 0_18 , upvalues : tradeGraph
  local itemKey = npcShop_GetCommerceItemByIndex(commerceType, index - 1)
  local checkResult = false
  if itemKey ~= 0 then
    if tradeGraph._buyFromNPCOrSellToNPCOrAll == 1 then
      checkResult = npcShop_CheckBuyFromNPCItem(itemKey)
    else
      if tradeGraph._buyFromNPCOrSellToNPCOrAll == 2 then
        checkResult = npcShop_CheckSellToNPCItem(itemKey)
      else
        if tradeGraph._buyFromNPCOrSellToNPCOrAll == 3 then
          checkResult = true
        else
          ;
          (UI.ASSERT)(false, "비정상적�\184 값입니다.")
        end
      end
    end
  end
  return checkResult
end

check_Empty_CommerceData = function(commerceType)
  -- function num : 0_19
  local commerceItemSize = npcShop_getCommerceItemSize(commerceType)
  local UICount = 0
  for ii = 1, commerceItemSize do
    local boolValue = npcShop_luaGetCommerceItemByIndexAndCheckSellOrBuy(commerceType, ii)
    if boolValue == true then
      UICount = UICount + 1
    end
  end
  return UICount
end

check_Empty_CommerceDataALL = function()
  -- function num : 0_20 , upvalues : tradeGraph
  local commerceButtonIndex = 1
  local bFirstCommerceType = false
  for commerceIndex = 1, enCommerceType.enCommerceType_Max - 1 do
    local UICount = check_Empty_CommerceData(commerceIndex)
    local lineUI = (tradeGraph._buttonTradeList)[commerceIndex]
    if UICount == 0 then
      lineUI:SetShow(false)
    else
      if bFirstCommerceType == false then
        bFirstCommerceType = true
        -- DECOMPILER ERROR at PC24: Confused about usage of register: R8 in 'UnsetPending'

        tradeGraph._currentCommerceIndex = commerceIndex
      end
      lineUI:SetShow(true)
      lineUI:SetPosX(((tradeGraph._buttonTradePosition)[commerceButtonIndex]).x)
      lineUI:SetPosY(((tradeGraph._buttonTradePosition)[commerceButtonIndex]).y)
      ;
      ((tradeGraph._staticLines)[commerceIndex]):SetPosX(((tradeGraph._buttonTradePosition)[commerceButtonIndex]).x + lineUI:GetSizeX() - 5)
      ;
      ((tradeGraph._staticLines)[commerceIndex]):SetPosY(((tradeGraph._buttonTradePosition)[commerceButtonIndex]).y + 7)
      commerceButtonIndex = commerceButtonIndex + 1
    end
  end
end

buttonLupTradeGraph_CommerceType = function(commerceIndex)
  -- function num : 0_21 , upvalues : tradeGraph, _byWorldmap
  if commerceIndex == tradeGraph._currentCommerceIndex then
    do
      if tradeGraph._buyFromNPCOrSellToNPCOrAll == 1 then
        local typeIndex = (tradeGraph._dialogSceneIndex)[commerceIndex]
        if typeIndex ~= 0 and _byWorldmap == false and tradeGraph._isNodeLinked == true then
          global_buyListOpen((commerceCategory[typeIndex]).Type)
        end
      end
      do return  end
      ;
      (tradeGraph._scroll):SetControlPos(0)
      -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

      tradeGraph._currentScrollIndex = 0
      for lineCount = 1, enCommerceType.enCommerceType_Max - 1 do
        ((tradeGraph._staticLines)[lineCount]):SetShow(false)
      end
      -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

      tradeGraph._currentCommerceIndex = commerceIndex
      local characterStaticStatusWrapper = npcShop_getCurrentCharacterKeyForTrade()
      if characterStaticStatusWrapper ~= 0 then
        (tradeGraph.updateCommerceInfo)(commerceIndex)
      end
      if tradeGraph._buyFromNPCOrSellToNPCOrAll == 1 then
        local typeIndex = (tradeGraph._dialogSceneIndex)[commerceIndex]
        if typeIndex ~= 0 and _byWorldmap == false and tradeGraph._isNodeLinked == true then
          global_buyListOpen((commerceCategory[typeIndex]).Type)
        end
      end
    end
  end
end

global_SellPanel_Refresh = function(Sell_itemSSS)
  -- function num : 0_22 , upvalues : tradeGraph
  local clickSellItemKey = ((Sell_itemSSS:get())._key):get()
  local clickSellCommerceType = Sell_itemSSS:getCommerceType()
  if tradeGraph._buyFromNPCOrSellToNPCOrAll ~= 2 then
    click_SellToNPC()
    setBuySellButtonClick()
  end
  local commerceItemSize = npcShop_getCommerceItemSize(clickSellCommerceType)
  local commerceCount = check_Empty_CommerceData(clickSellCommerceType)
  local tempScrollIndex = 0
  if tradeGraph._commerceGraph_Max < commerceItemSize then
    tempScrollIndex = npcShop_getTradeItemIndex(clickSellCommerceType, clickSellItemKey)
    if commerceItemSize < tempScrollIndex + tradeGraph._commerceGraph_Max - 1 then
      tempScrollIndex = commerceItemSize - tradeGraph._commerceGraph_Max
    end
  end
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R6 in 'UnsetPending'

  tradeGraph._currentScrollIndex = tempScrollIndex
  ;
  (UIScroll.ScrollEvent)(tradeGraph._scroll, true, tradeGraph._commerceGraph_Max, commerceCount, tradeGraph._currentScrollIndex, 1)
  global_updateCommerceInfoByType(clickSellCommerceType, 2)
end

global_updateCurrentCommerce = function()
  -- function num : 0_23 , upvalues : tradeGraph, tradeGraphMode
  if tradeGraph._currentCommerceIndex == nil then
    return true
  end
  if isGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph) == false then
    return false
  end
  if tradeGraph._currentCommerceIndex > 0 and tradeGraph._currentCommerceIndex < enCommerceType.enCommerceType_Max then
    (tradeGraph.updateCommerceInfo)(tradeGraph._currentCommerceIndex)
  end
  return true
end

eventResetScreenSizeTrade = function(supplyShop)
  -- function num : 0_24 , upvalues : tradeGraph, setGraphMiniPanel
  Panel_Trade_Market_Graph_Window:SetSize(Panel_Trade_Market_Graph_Window:GetSizeX(), getScreenSizeY() - Panel_Npc_Trade_Market:GetSizeY())
  ;
  (tradeGraph._staticRectangle):SetPosY(80)
  local rtSizeY = Panel_Trade_Market_Graph_Window:GetSizeY() - 90
  ;
  (tradeGraph._staticRectangle):SetSize((tradeGraph._staticRectangle):GetSizeX(), rtSizeY)
  ;
  (tradeGraph._scroll):SetSize((tradeGraph._scroll):GetSizeX(), rtSizeY)
  local _gap = ((tradeGraph._static_SupplyCount)[1]):GetSizeY() + ((tradeGraph._static_SupplyCount)[1]):GetPosY() - ((tradeGraph._static_OriginalPrice)[1]):GetPosY()
  if supplyShop == nil or not supplyShop then
    _gap = 0
  end
  local miniPanelSizeY = (tradeGraph._staticMiniPanel):GetSizeY() + _gap
  local showMiniPanelCount = 0
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R5 in 'UnsetPending'

  tradeGraph._commerceGraph_Max = 1
  for count = 1, tradeGraph._itemMaxCount do
    if miniPanelSizeY * count < rtSizeY then
      showMiniPanelCount = showMiniPanelCount + 1
    else
      break
    end
  end
  do
    for count = 1, tradeGraph._itemMaxCount do
      setGraphMiniPanel(count, false)
    end
    -- DECOMPILER ERROR at PC92: Confused about usage of register: R5 in 'UnsetPending'

    tradeGraph._commerceGraph_Max = showMiniPanelCount
  end
end

refreshGraphData = function()
  -- function num : 0_25 , upvalues : tradeGraph
  check_Empty_CommerceDataALL()
  ;
  (tradeGraph.CommerceDataShowAll)()
  ;
  (tradeGraph._scroll):SetControlPos(0)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  tradeGraph._currentScrollIndex = 0
  for lineCount = 1, enCommerceType.enCommerceType_Max - 1 do
    ((tradeGraph._staticLines)[lineCount]):SetShow(false)
  end
  Panel_Trade_Market_Graph_Window:ResetRadiobutton(((tradeGraph._buttonTradeList)[1]):GetGroupNumber())
  setCommerceButtonClick(tradeGraph._currentCommerceIndex)
  ;
  ((tradeGraph._staticLines)[tradeGraph._currentCommerceIndex]):SetShow(true)
end

setBuySellButtonClick = function()
  -- function num : 0_26 , upvalues : tradeGraph
  local buttonBaseTexture = (tradeGraph._button_BuyFromNPC):getBaseTexture()
  local buttonClickTexture = (tradeGraph._button_BuyFromNPC):getClickTexture()
  if tradeGraph._buyFromNPCOrSellToNPCOrAll == 1 then
    (tradeGraph._button_BuyFromNPC):setRenderTexture(buttonClickTexture)
    ;
    (tradeGraph._button_SellToNPC):setRenderTexture(buttonBaseTexture)
  else
    if tradeGraph._buyFromNPCOrSellToNPCOrAll == 2 or tradeGraph._buyFromNPCOrSellToNPCOrAll == 3 then
      (tradeGraph._button_BuyFromNPC):setRenderTexture(buttonBaseTexture)
      ;
      (tradeGraph._button_SellToNPC):setRenderTexture(buttonClickTexture)
    else
      ;
      (UI.ASSERT)(false, "비정상적�\184 번호 입니�\164.")
    end
  end
end

setCommerceButtonClick = function(buttonIndex)
  -- function num : 0_27 , upvalues : tradeGraph
  local buttonUI = (tradeGraph._buttonTradeList)[buttonIndex]
  local btnClickTexture = buttonUI:getClickTexture()
  buttonUI:setRenderTexture(btnClickTexture)
  if tradeGraph._buyFromNPCOrSellToNPCOrAll == 1 then
    (tradeGraph._button_BuyFromNPC):EraseAllEffect()
    ;
    (tradeGraph._button_BuyFromNPC):AddEffect("UI_Trade_Button", true, 0, 0)
    ;
    (tradeGraph._button_SellToNPC):EraseAllEffect()
  else
    if tradeGraph._buyFromNPCOrSellToNPCOrAll == 2 then
      (tradeGraph._button_SellToNPC):EraseAllEffect()
      ;
      (tradeGraph._button_SellToNPC):AddEffect("UI_Trade_Button", true, 0, 0)
      ;
      (tradeGraph._button_BuyFromNPC):EraseAllEffect()
    end
  end
end

click_BuyFromNPC = function()
  -- function num : 0_28 , upvalues : tradeGraph, _byWorldmap, commerceGraphInitialize
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  tradeGraph._buyFromNPCOrSellToNPCOrAll = 1
  ;
  (tradeGraph._button_BuyFromNPC):AddEffect("UI_Trade_Button", true, 0, 0)
  ;
  (tradeGraph._button_SellToNPC):EraseAllEffect()
  refreshGraphData()
  local typeIndex = (tradeGraph._dialogSceneIndex)[tradeGraph._currentCommerceIndex]
  if typeIndex ~= 0 and _byWorldmap == false and tradeGraph._isNodeLinked == true then
    global_buyListOpen((commerceCategory[typeIndex]).Type)
  end
  commerceGraphInitialize()
  ;
  (tradeGraph.updateTradeProduct)()
end

click_SellToNPC = function()
  -- function num : 0_29 , upvalues : tradeGraph, commerceGraphInitialize
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  tradeGraph._buyFromNPCOrSellToNPCOrAll = 2
  ;
  (tradeGraph._button_SellToNPC):AddEffect("UI_Trade_Button", true, 0, 0)
  ;
  (tradeGraph._button_BuyFromNPC):EraseAllEffect()
  Panel_Trade_Market_BuyItemList:SetShow(false)
  refreshGraphData()
  commerceGraphInitialize()
  ;
  (tradeGraph.updateTradeProduct)()
end

trendTradeItemInfoInShop = function()
  -- function num : 0_30 , upvalues : tradeGraphMode, tradeGraph, commerceGraphInitialize
  setChangeGraphMode(tradeGraphMode.eGraphMode_TendGraph)
  for count = 1, enCommerceType.enCommerceType_Max - 1 do
    ((tradeGraph._buttonTradeList)[count]):SetShow(false)
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  tradeGraph._territoryCount = 5
  resetTrendGraphButton(true)
  Panel_Trade_Market_Graph_Window:SetEnableArea(-30000, -30000, 30000, 30000)
  commerceGraphInitialize()
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

  tradeGraph._currentScrollIndex = 0
  ;
  (tradeGraph.updateTrendTradeItem)()
  buttonLupTradeGraph_Territory(1)
end

tradeGraph.updateTrendTradeItem = function()
  -- function num : 0_31 , upvalues : tradeGraph, debugValue, _byWorldmap
  (tradeGraph._staticTradeItemName):SetShow(true)
  local scrollIndex = tradeGraph._currentScrollIndex
  local UIIndex = 1
  ;
  (tradeGraph._scroll):SetShow(true)
  local trendItemSizeInTerritory = ToClient_TrendTradeItemSize(tradeGraph._selectTerritory)
  local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(tradeGraph._selectTerritory)
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R4 in 'UnsetPending'

  tradeGraph._commerceItemCount = trendItemSizeInTerritory
  local territoryKey = territoryInfoWrapper:getKeyRaw()
  for itemCountInTerritory = 1, trendItemSizeInTerritory do
    if itemCountInTerritory + scrollIndex - 1 == trendItemSizeInTerritory then
      break
    end
    local tradeItemWrapper = ToClient_GetTrendTradeItemAt(territoryKey, itemCountInTerritory + scrollIndex - 1)
    if tradeItemWrapper ~= nil then
      local itemSS = tradeItemWrapper:getStaticStatus()
      local itemKey = (itemSS:get())._key
      if UIIndex == tradeGraph._commerceGraph_Max + 1 then
        break
      end
      local commerceUI = (tradeGraph._staticCommerceGraphs)[UIIndex]
      commerceUI:ClearGraphList()
      local intervalPosY = tradeGraph._graphBackSizeY / 2
      commerceUI:setGraphBasePos(intervalPosY)
      ;
      ((tradeGraph._graphMiniPanel)[UIIndex]):SetShow(true)
      local itemESSW = getItemEnchantStaticStatus(itemKey)
      local itemStatus = itemESSW:get()
      ;
      (((tradeGraph._icons)[UIIndex]).icon):setItemByStaticStatus(itemESSW)
      ;
      ((((tradeGraph._icons)[UIIndex]).icon).icon):SetShow(true)
      ;
      ((((tradeGraph._icons)[UIIndex]).icon).icon):addInputEvent("Mouse_On", "Tooltip_Item_Show_TradeMarket(" .. UIIndex .. ", true)")
      ;
      ((((tradeGraph._icons)[UIIndex]).icon).icon):addInputEvent("Mouse_Out", "Tooltip_Item_Show_TradeMarket(" .. UIIndex .. ", false)")
      local originalPrice = itemESSW:getOriginalPriceByInt64()
      ;
      ((tradeGraph._static_OriginalPrice)[UIIndex]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_OriginalPrice", "OriginalPrice", makeDotMoney(originalPrice)))
      local sellPrice = tradeItemWrapper:getTradeSellPrice()
      ;
      ((tradeGraph._static_PriceIcon)[UIIndex]):SetText(makeDotMoney(sellPrice))
      ;
      ((tradeGraph._static_PriceIcon)[UIIndex]):SetPosX((tradeGraph._staticBasePriceRate):GetPosX() - (tradeGraph._staticMiniPanel):GetPosX() + ((tradeGraph._static_PriceIcon)[UIIndex]):GetTextSizeX() - 2)
      local sellRate = Int64toInt32(sellPrice) / Int64toInt32(originalPrice) * 100
      local str_sellRate = (string.format)("%.f", sellRate)
      local priceRate_Value = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_SellRate", "Percent", tostring(str_sellRate))
      if tonumber(tostring(str_sellRate)) > 100 then
        priceRate_Value = "(<PAColor0xFFFFCE22>" .. priceRate_Value .. "�\178<PAOldColor>)"
      else
        priceRate_Value = "(<PAColor0xFFF26A6A>" .. priceRate_Value .. "�\188<PAOldColor>)"
      end
      ;
      ((tradeGraph._staticPriceRate)[UIIndex]):SetText(priceRate_Value)
      ;
      ((tradeGraph._staticPriceRate)[UIIndex]):SetPosX(((tradeGraph._static_PriceIcon)[UIIndex]):GetPosX() + 15)
      ;
      ((tradeGraph._staticPriceRate)[UIIndex]):SetShow(false)
      ;
      ((tradeGraph._static_GraphBaseLine)[UIIndex]):SetPosX(commerceUI:GetPosX())
      ;
      ((tradeGraph._static_GraphBaseLine)[UIIndex]):SetPosY(commerceUI:GetPosY() + commerceUI:GetSizeY() / 2)
      ;
      ((tradeGraph._static_GraphBaseLine)[UIIndex]):SetShow(true)
      commerceUI:SetGraphMode(true)
      commerceUI:SetShow(true)
      local trendItemRegion = tradeItemWrapper:getTrendRegionInfo()
      if debugValue == 1 then
        ((tradeGraph._staticCommceName)[UIIndex]):SetText(trendItemRegion:getAreaName() .. "(" .. itemKey .. ")")
      else
        ;
        ((tradeGraph._staticCommceName)[UIIndex]):SetText(trendItemRegion:getAreaName())
      end
      if itemStatus._tradeType == 1 then
        ((tradeGraph._staticCommceName)[UIIndex]):SetFontColor((Defines.Color).C_FFB75EDD)
      else
        ;
        ((tradeGraph._staticCommceName)[UIIndex]):SetFontColor((Defines.Color).C_FFE7E7E7)
      end
      ;
      ((tradeGraph._staticCommceName)[UIIndex]):SetShow(true)
      ;
      ((tradeGraph._static_OriginalPrice)[UIIndex]):SetShow(true)
      if tradeItemWrapper:isTradableItem() == true and (tradeGraph._isNodeLinked == true or _byWorldmap == true) then
        ((tradeGraph._staticPriceRate)[UIIndex]):SetShow(true)
        ;
        ((tradeGraph._static_PriceIcon)[UIIndex]):SetShow(true)
      else
        if itemStatus._tradeType == 1 then
          ((tradeGraph._staticText_PermissionMsg)[UIIndex]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_TXT_PERMISSION2"))
        else
          ;
          ((tradeGraph._staticText_PermissionMsg)[UIIndex]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_TXT_PERMISSION"))
        end
        ;
        ((tradeGraph._staticText_PermissionMsg)[UIIndex]):SetShow(true)
      end
      local graphSize = tradeItemWrapper:getGraphSize()
      ;
      (tradeGraph.tradeMarket_DrawGraphXX)(commerceUI, itemKey:get(), UIIndex, tradeItemWrapper, intervalPosY)
      -- DECOMPILER ERROR at PC375: Confused about usage of register: R23 in 'UnsetPending'

      ;
      (tradeGraph._graphDisplayIndex)[UIIndex] = scrollIndex + UIIndex
      UIIndex = UIIndex + 1
    end
  end
  do
    local _tradeItemWrapper = ToClient_GetTrendTradeItemAt(territoryKey, 1 + scrollIndex)
    if _tradeItemWrapper ~= nil then
      local itemSS = _tradeItemWrapper:getStaticStatus()
      local itemKey = (itemSS:get())._key
      local itemESSW = getItemEnchantStaticStatus(itemKey)
      local itemStatus = itemESSW:get()
      local trendName = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_TRENDNAME")
      ;
      (tradeGraph._staticTradeItemName):SetText(trendName)
      ;
      (tradeGraph._staticTradeItemName):SetShow(true)
    end
    do
      ;
      (UIScroll.SetButtonSize)(tradeGraph._scroll, tradeGraph._commerceGraph_Max, trendItemSizeInTerritory)
    end
  end
end

buttonLupTradeGraph_Territory = function(buttonIndex)
  -- function num : 0_32 , upvalues : tradeGraph, commerceGraphInitialize
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  tradeGraph._selectTerritory = buttonIndex - 1
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  tradeGraph._currentScrollIndex = 0
  commerceGraphInitialize()
  for lineCount = 1, enCommerceType.enCommerceType_Max - 1 do
    ((tradeGraph._staticLines)[lineCount]):SetShow(false)
  end
  ;
  ((tradeGraph._staticLines)[buttonIndex]):SetShow(true)
  ;
  (tradeGraph.updateTrendTradeItem)()
  ;
  (tradeGraph._scroll):SetControlPos(0)
end

buttonLupGoBackTradeGraph = function()
  -- function num : 0_33 , upvalues : tradeGraph, tradeGraphMode
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  tradeGraph._currentCommerceIndex = 1
  resetTrendGraphButton(false)
  click_BuyFromNPC()
  setChangeGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph)
  Panel_Trade_Market_Graph_Window:SetEnableArea(0, 0, Panel_Trade_Market_Graph_Window:GetSizeX(), Panel_Trade_Market_Graph_Window:GetSizeY())
  npcShop_requestList()
end

resetTrendGraphButton = function(isShow)
  -- function num : 0_34 , upvalues : tradeGraph, territoryCount
  if isShow == true then
    for countIndex = 1, tradeGraph._territoryCount do
      local trendItemSizeInTerritory = ToClient_TrendTradeItemSize(countIndex - 1)
      if trendItemSizeInTerritory - 1 >= 0 then
        local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(countIndex - 1)
        ;
        ((tradeGraph._buttonTerritory)[countIndex]):SetText(territoryInfoWrapper:getTerritoryName())
        local btnTradeTerritorySizeX = ((tradeGraph._buttonTerritory)[countIndex]):GetSizeX() + 23
        local btnTradeTerritoryTextPosX = btnTradeTerritorySizeX - btnTradeTerritorySizeX / 2 - ((tradeGraph._buttonTerritory)[countIndex]):GetTextSizeX() / 2
        ;
        ((tradeGraph._buttonTerritory)[countIndex]):SetTextSpan(btnTradeTerritoryTextPosX, 5)
        ;
        ((tradeGraph._buttonTerritory)[countIndex]):SetShow(true)
      else
        do
          do
            ;
            ((tradeGraph._buttonTerritory)[countIndex]):SetShow(false)
            -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  else
    for countIndex = 1, territoryCount do
      local trendItemSizeInTerritory = ToClient_TrendTradeItemSize(countIndex - 1)
      ;
      ((tradeGraph._buttonTerritory)[countIndex]):SetShow(false)
    end
  end
  do
    ;
    (tradeGraph._buttonGoBackGraph):SetShow(isShow)
    ;
    (tradeGraph._staticTradeItemName):SetShow(false)
    if isShow == true then
      (tradeGraph._button_BuyFromNPC):SetShow(false)
      ;
      (tradeGraph._button_SellToNPC):SetShow(false)
    else
      ;
      (tradeGraph._button_BuyFromNPC):SetShow(true)
      ;
      (tradeGraph._button_SellToNPC):SetShow(true)
    end
  end
end

tradeGraph.registTradeGraphEvent = function(self)
  -- function num : 0_35 , upvalues : tradeGraph
  Panel_Trade_Market_Graph_Window:RegisterUpdateFunc("updateTradeMarketGraphData")
  registerEvent("onScreenResize", "eventResetScreenSizeTrade")
  ;
  (tradeGraph._buttonExit):addInputEvent("Mouse_LUp", "closeNpcTrade_BasketByGraph()")
  local talker = dialog_getTalker()
  if talker ~= nil then
    local actorKeyRaw = talker:getActorKey()
    local actorProxyWrapper = getNpcActor(actorKeyRaw)
    local actorProxy = actorProxyWrapper:get()
    local characterStaticStatus = actorProxy:getCharacterStaticStatus()
    if characterStaticStatus:isSmuggleMerchant() then
      (tradeGraph._button_SellToNPC):SetShow(false)
    end
    if characterStaticStatus:isTerritorySupplyMerchant() then
      (tradeGraph._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"TerritorySupply\" )")
    else
      if characterStaticStatus:isTerritoryTradeMerchant() then
        (tradeGraph._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"TerritoryTrade\" )")
      else
        ;
        (tradeGraph._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelTradeMarketGraph\" )")
      end
    end
  else
    do
      local characterStaticStatusWrapper = npcShop_getCurrentCharacterKeyForTrade()
      if characterStaticStatusWrapper == nil then
        return 
      end
      do
        local characterStaticStatus = characterStaticStatusWrapper:get()
        if characterStaticStatus:isTerritorySupplyMerchant() then
          (tradeGraph._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"TerritorySupply\" )")
        else
          if characterStaticStatus:isTerritoryTradeMerchant() then
            (tradeGraph._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"TerritoryTrade\" )")
          else
            ;
            (tradeGraph._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelTradeMarketGraph\" )")
          end
        end
        ;
        (tradeGraph._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelTradeMarketGraph\", \"true\")")
        ;
        (tradeGraph._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelTradeMarketGraph\", \"false\")")
        ;
        (tradeGraph._button_BuyFromNPC):addInputEvent("Mouse_LUp", "click_BuyFromNPC()")
        ;
        (tradeGraph._button_SellToNPC):addInputEvent("Mouse_LUp", "click_SellToNPC()")
        ;
        (UIScroll.InputEvent)(tradeGraph._scroll, "NpcTradeGraph_ScrollEvent")
        ;
        (tradeGraph._staticRectangle):addInputEvent("Mouse_UpScroll", "NpcTradeGraph_ScrollEvent(true)")
        ;
        (tradeGraph._staticRectangle):addInputEvent("Mouse_DownScroll", "NpcTradeGraph_ScrollEvent(false)")
        for count = 1, enCommerceType.enCommerceType_Max - 1 do
          ((tradeGraph._buttonTradeList)[count]):addInputEvent("Mouse_LUp", "buttonLupTradeGraph_CommerceType(" .. count .. ")")
        end
        registerEvent("FromClient_TrendInfoInShop", "trendTradeItemInfoInShop")
      end
    end
  end
end

NpcTradeGraph_ScrollEvent = function(isUpScroll)
  -- function num : 0_36 , upvalues : tradeGraph, commerceGraphInitialize, tradeGraphMode, last_Tooltip
  local pre_Index = tradeGraph._currentScrollIndex
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  tradeGraph._currentScrollIndex = (UIScroll.ScrollEvent)(tradeGraph._scroll, isUpScroll, tradeGraph._commerceGraph_Max, tradeGraph._commerceItemCount, tradeGraph._currentScrollIndex, 1)
  local cur_Index = tradeGraph._currentScrollIndex
  commerceGraphInitialize()
  if isGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph) then
    (tradeGraph.updateTradeProduct)()
  else
    if isGraphMode(tradeGraphMode.eGraphMode_TendGraph) then
      (tradeGraph.updateTrendTradeItem)()
    end
  end
  if last_Tooltip ~= nil and Panel_Tooltip_Item:GetShow() == true then
    Tooltip_Item_Show_TradeMarket(last_Tooltip, true)
  end
end

Tooltip_Item_Show_TradeMarket = function(UIIndex, isShow)
  -- function num : 0_37 , upvalues : tradeGraphMode, last_Tooltip, index_Tooltip
  if isGraphMode(tradeGraphMode.eGraphMode_NormalShopGraph) == false then
    return 
  end
  if isShow == true then
    last_Tooltip = UIIndex
  else
    if isShow == false then
      if last_Tooltip ~= UIIndex then
        return 
      end
      last_Tooltip = nil
    end
  end
  local _itemsetIndex = index_Tooltip[UIIndex]
  if _itemsetIndex ~= nil then
    Panel_Tooltip_Item_Show_GeneralStatic(_itemsetIndex, "tradeMarket", isShow)
  end
end

closeNpcTrade_BasketByGraph = function()
  -- function num : 0_38
  if (Defines.UIMode).eUIMode_Trade == GetUIMode() then
    closeNpcTrade_Basket()
  else
    WorldMapPopupManager:pop()
  end
end

NpcTradeGraph_SimpleToolTip = function(isShow, index)
  -- function num : 0_39 , upvalues : tradeGraph
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_GRAPH_SIMPLETOOLTIP_NAME")
  control = (tradeGraph._staticPriceRate)[index]
  TooltipSimple_Show(control, name, desc)
end

tradeGraph:registUIControl()
tradeGraph:registTradeGraphEvent()

