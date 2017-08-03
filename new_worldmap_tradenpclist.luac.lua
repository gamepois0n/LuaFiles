-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_tradenpclist.luac 

-- params : ...
-- function num : 0
local UI_TYPE = CppEnums.PA_UI_CONTROL_TYPE
local ENT = CppEnums.ExplorationNodeType
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local viewWorldMapTradeNpcKey = -1
FromClient_OnWorldMapTradeNpc = function(tradeNpcStatic)
  -- function num : 0_0
  local uiHeadStatic = tradeNpcStatic:FromClient_getTradeListHead()
end

FromClient_OutWorldMapTradeNpc = function(tradeNpcStatic)
  -- function num : 0_1
  local uiHeadStatic = tradeNpcStatic:FromClient_getTradeListHead()
  uiHeadStatic:SetShow(false)
end

FromClient_LClickWorldMapTradeNpc = function(tradeNpcStatic)
  -- function num : 0_2 , upvalues : viewWorldMapTradeNpcKey
  local clientSpawnInRegionData = tradeNpcStatic:getClientSpawnInRegionData()
  if clientSpawnInRegionData:FromClient_isTerritorySupply() == true then
    WorldMapPopupManager:increaseLayer(false)
    refreshTradeSupplyList(clientSpawnInRegionData)
    WorldMapPopupManager:push(Panel_TradeNpcItemInfo, true)
  else
    if clientSpawnInRegionData:FromClient_isTerritoryTrade() then
      return 
    else
      local wp = npcShop_demandWpByRequestShop((clientSpawnInRegionData:get()):getKeyRaw())
      viewWorldMapTradeNpcKey = (clientSpawnInRegionData:get()):getKeyRaw()
      local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "Lua_WorldMap_TradeList_Show_Title")
      local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_WorldMap_TradeList_Show_Question", "Usewp", wp)
      local messageboxData = {title = messageboxTitle, content = messageboxMemo, functionYes = ViewTradeShopGraphList, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

FromClient_RClickWorldMapTradeNpc = function(tradeNpcStatic)
  -- function num : 0_3
  local npcData = tradeNpcStatic:getClientSpawnInRegionData()
  local pos3D = npcData:getPosition()
  FromClient_RClickWorldmapPanel(pos3D, true, false)
end

ViewTradeShopGraphList = function()
  -- function num : 0_4 , upvalues : viewWorldMapTradeNpcKey
  ToClient_npcShop_requestShopItemListByWorldMap(viewWorldMapTradeNpcKey)
end

FromClient_ResponseWorldMapTradeNpc = function(clientSpawnInRegionData, tradeNpcStatic)
  -- function num : 0_5
  if ToClient_WorldMapIsShow() == false then
    return 
  end
  WorldMapPopupManager:increaseLayer(false)
  WorldMapPopupManager:push(Panel_Trade_Market_Graph_Window, true)
  global_CommerceGraphDataInit(true)
end

registerEvent("FromClient_OnWorldMapTradeNpc", "FromClient_OnWorldMapTradeNpc")
registerEvent("FromClient_OutWorldMapTradeNpc", "FromClient_OutWorldMapTradeNpc")
registerEvent("FromClient_LClickWorldMapTradeNpc", "FromClient_LClickWorldMapTradeNpc")
registerEvent("FromClient_RClickWorldMapTradeNpc", "FromClient_RClickWorldMapTradeNpc")
registerEvent("FromClient_ResponseWorldMapTradeNpc", "FromClient_ResponseWorldMapTradeNpc")

