-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_wroldmap_tradenpciteminfo.luac 

-- params : ...
-- function num : 0
Panel_TradeNpcItemInfo:SetShow(false)
Panel_TradeNpcItemInfo:SetDragAll(true)
gTradeNpcItemInfo_TerritoryKey = 0
local slotConfig = {createIcon = true, createBorder = true, createCount = false, createCash = true}
local maxCount = 6
local _slot = {}
local _slotBG = {}
local _itemStatic = {}
local _basePanel = (UI.getChildControl)(Panel_TradeNpcItemInfo, "Static_ItemPanel")
local _buttonClose = (UI.getChildControl)(Panel_TradeNpcItemInfo, "Button_Close")
local slotBG = (UI.getChildControl)(Panel_TradeNpcItemInfo, "Static_SlotBG")
local nodeNpc = (UI.getChildControl)(Panel_TradeNpcItemInfo, "nodeMenu_nodeNpc")
local territoryValue = (UI.getChildControl)(Panel_TradeNpcItemInfo, "nodeMenu_nodeName")
local territoryName = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_3")), [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_4")), [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_5")), [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYNAME_6"))}
local npcName = {[0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_NPC_0")), [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_NPC_1")), [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_NPC_2")), [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_NPC_3")), [4] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_NPC_4")), [5] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_NPC_5")), [6] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_NPC_6"))}
initialize_TradeNpcInfoUI = function()
  -- function num : 0_0 , upvalues : _basePanel, maxCount, _itemStatic, slotBG, _slotBG, slotConfig, _slot, _buttonClose
  local miniSizeY = _basePanel:GetSizeY()
  local miniPosY = _basePanel:GetPosY()
  for count = 1, maxCount do
    local miniPanel = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_TradeNpcItemInfo, "static_ItemPanel_" .. count)
    CopyBaseProperty(_basePanel, miniPanel)
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R7 in 'UnsetPending'

    _itemStatic[count] = miniPanel
    local tempItemSlotBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_TradeNpcItemInfo, "Static_Slot_" .. count)
    CopyBaseProperty(slotBG, tempItemSlotBG)
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R8 in 'UnsetPending'

    _slotBG[count] = tempItemSlotBG
    local slot = {}
    slot.icon = {}
    ;
    (SlotItem.new)(slot.icon, "TradeSupply_Icon" .. count, count, miniPanel, slotConfig)
    ;
    (slot.icon):createChild()
    ;
    ((slot.icon).icon):addInputEvent("Mouse_On", "Tooltip_Item_Show_TradeSupply(" .. count .. ", true)")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_Out", "Tooltip_Item_Show_TradeSupply(" .. count .. ", false)")
    ;
    ((slot.icon).icon):SetPosX(3)
    ;
    ((slot.icon).icon):SetPosY(3)
    -- DECOMPILER ERROR at PC87: Confused about usage of register: R9 in 'UnsetPending'

    _slot[count] = slot
  end
  _buttonClose:addInputEvent("Mouse_LUp", "close_TradeNpcItemInfo()")
end

Tooltip_Item_Show_TradeSupply = function(count, isShow)
  -- function num : 0_1
  Panel_Tooltip_Item_Show_GeneralStatic(count, "tradeSupply", isShow)
end

TradeNpcItemInfo_getTerritoryKey = function()
  -- function num : 0_2
  return gTradeNpcItemInfo_TerritoryKey
end

resetTerritorySupplyUI = function()
  -- function num : 0_3 , upvalues : maxCount, _itemStatic, _slot, _slotBG
  for count = 1, maxCount do
    (_itemStatic[count]):SetShow(false)
    ;
    (((_slot[count]).icon).icon):SetShow(false)
    ;
    (_slotBG[count]):SetShow(false)
  end
end

refreshTradeSupplyList = function(clientSpawnInRegionData)
  -- function num : 0_4 , upvalues : territoryValue, territoryName, nodeNpc, npcName, slotBG, _itemStatic, _slot, _slotBG
  resetTerritorySupplyUI()
  Panel_TradeNpcItemInfo_Reposition()
  local regionInfo = getRegionInfoByPosition(clientSpawnInRegionData:FromClient_getSpawnPosition())
  gTradeNpcItemInfo_TerritoryKey = regionInfo:getTerritoryKeyRaw()
  territoryValue:SetText(territoryName[gTradeNpcItemInfo_TerritoryKey] .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_MESSAGE_1"))
  nodeNpc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYSUPPLY_MESSAGE_2") .. " : " .. npcName[gTradeNpcItemInfo_TerritoryKey])
  local tradeSupplyCount = (ToClient_worldmap_getTradeSupplyCount(regionInfo:getTerritoryKeyRaw()))
  local shopItemWrapper = nil
  local sizeX = slotBG:GetSizeX()
  local gap = sizeX * 0.4
  local startPosX = (Panel_TradeNpcItemInfo:GetSizeX() - (sizeX * tradeSupplyCount + gap * (tradeSupplyCount - 1))) / 2
  for count = 1, tradeSupplyCount do
    shopItemWrapper = ToClient_worldmap_getTradeSupplyItem(regionInfo:getTerritoryKeyRaw(), count - 1)
    if shopItemWrapper ~= nil then
      local itemSSWrapper = shopItemWrapper:getStaticStatus()
      ;
      (_itemStatic[count]):SetShow(true)
      ;
      ((_slot[count]).icon):setItemByStaticStatus(itemSSWrapper)
      ;
      (((_slot[count]).icon).icon):SetShow(true)
      Panel_Tooltip_Item_SetPosition(count, (_slot[count]).icon, "tradeSupply")
      local posX = startPosX + (sizeX + gap) * (count - 1)
      ;
      (((_slot[count]).icon).icon):SetPosX(posX - gap)
      ;
      (_slotBG[count]):SetPosX(posX - 2)
      ;
      (_slotBG[count]):SetShow(true)
    end
  end
end

Panel_TradeNpcItemInfo_Reposition = function()
  -- function num : 0_5
  Panel_TradeNpcItemInfo:SetPosX((getScreenSizeX() - Panel_TradeNpcItemInfo:GetSizeX()) / 2)
  Panel_TradeNpcItemInfo:SetPosY(getScreenSizeY() / 2 - Panel_TradeNpcItemInfo:GetSizeY() * 1.5)
end

close_TradeNpcItemInfo = function()
  -- function num : 0_6
  WorldMapPopupManager:pop()
end

initialize_TradeNpcInfoUI()

