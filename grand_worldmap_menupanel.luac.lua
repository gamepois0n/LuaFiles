-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\grand_worldmap_menupanel.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
local ServantStable_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_ServantStable")
local WareHouse_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_WareHouse")
local Quest_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_Quest")
local Transport_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_Transport")
local transportAlert = (UI.getChildControl)(Panel_WorldMap, "Static_TransportAlert")
local ItemMarket_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_ItemMarket")
local WorkerList_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_WorkerList")
local HelpMenu_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_HelpMovie")
local Exit_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_Exit")
local WorkerTrade_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_WorkerTrade")
local StableMarket_Btn = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_StableMarket")
local isWorkerTradeOpen = (ToClient_IsContentsGroupOpen("209"))
local currentNodeKey = nil
local popupType = {stable = 0, wareHouse = 1, quest = 2, transport = 3, itemMarket = 4, workerList = 5, helpMovie = 6, workerTrade = 7, workerTradeCaravan = 8, stableMarket = 9}
local popupTypeCount = 10
local popupPanelList = {}
Panel_WorldMap:SetShow(false, false)
local worldMap_Init = function()
  -- function num : 0_0 , upvalues : Exit_Btn, HelpMenu_Btn, WorkerList_Btn, ItemMarket_Btn, Transport_Btn, Quest_Btn, WareHouse_Btn, ServantStable_Btn, WorkerTrade_Btn, StableMarket_Btn, transportAlert
  Exit_Btn:SetSize(44, 44)
  HelpMenu_Btn:SetSize(44, 44)
  WorkerList_Btn:SetSize(44, 44)
  ItemMarket_Btn:SetSize(44, 44)
  Transport_Btn:SetSize(44, 44)
  Quest_Btn:SetSize(44, 44)
  WareHouse_Btn:SetSize(44, 44)
  ServantStable_Btn:SetSize(44, 44)
  WorkerTrade_Btn:SetSize(44, 44)
  StableMarket_Btn:SetSize(44, 44)
  transportAlert:SetShow(false)
  Exit_Btn:SetSpanSize(5, 5)
  HelpMenu_Btn:SetSpanSize((Exit_Btn:GetSpanSize()).x + Exit_Btn:GetSizeX() + 3, 5)
  WorkerList_Btn:SetSpanSize((HelpMenu_Btn:GetSpanSize()).x + HelpMenu_Btn:GetSizeX() + 3, 5)
  ItemMarket_Btn:SetSpanSize((WorkerList_Btn:GetSpanSize()).x + WorkerList_Btn:GetSizeX() + 3, 5)
  Transport_Btn:SetSpanSize((ItemMarket_Btn:GetSpanSize()).x + ItemMarket_Btn:GetSizeX() + 3, 5)
  transportAlert:SetSpanSize((ItemMarket_Btn:GetSpanSize()).x + ItemMarket_Btn:GetSizeX(), 33)
  Quest_Btn:SetSpanSize((Transport_Btn:GetSpanSize()).x + Transport_Btn:GetSizeX() + 3, 5)
  WareHouse_Btn:SetSpanSize((Quest_Btn:GetSpanSize()).x + Quest_Btn:GetSizeX() + 3, 5)
  ServantStable_Btn:SetSpanSize((WareHouse_Btn:GetSpanSize()).x + WareHouse_Btn:GetSizeX() + 3, 5)
  StableMarket_Btn:SetSpanSize((ServantStable_Btn:GetSpanSize()).x + ServantStable_Btn:GetSizeX() + 3, 5)
  WorkerTrade_Btn:SetSpanSize((StableMarket_Btn:GetSpanSize()).x + StableMarket_Btn:GetSizeX() + 3, 5)
  ServantStable_Btn:addInputEvent("Mouse_LUp", "BtnEvent_ServantStable()")
  WareHouse_Btn:addInputEvent("Mouse_LUp", "BtnEvent_WareHouse()")
  Quest_Btn:addInputEvent("Mouse_LUp", "BtnEvent_Quest()")
  Transport_Btn:addInputEvent("Mouse_LUp", "BtnEvent_Transport()")
  ItemMarket_Btn:addInputEvent("Mouse_LUp", "BtnEvent_ItemMarket()")
  WorkerList_Btn:addInputEvent("Mouse_LUp", "BtnEvent_WorkerList()")
  HelpMenu_Btn:addInputEvent("Mouse_LUp", "BtnEvent_HelpMovie()")
  Exit_Btn:addInputEvent("Mouse_LUp", "BtnEvent_Exit()")
  StableMarket_Btn:addInputEvent("Mouse_LUp", "BtnEvent_StableMarket()")
  WorkerTrade_Btn:addInputEvent("Mouse_LUp", "BtnEvent_WorkerTrade()")
  ServantStable_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 0 .. " )")
  ServantStable_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 0 .. " )")
  ServantStable_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 0 .. " )")
  WareHouse_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 1 .. " )")
  WareHouse_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 1 .. " )")
  WareHouse_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 1 .. " )")
  Quest_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 2 .. " )")
  Quest_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 2 .. " )")
  Quest_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 2 .. " )")
  Transport_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 3 .. " )")
  Transport_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 3 .. " )")
  Transport_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 3 .. " )")
  ItemMarket_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 4 .. " )")
  ItemMarket_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 4 .. " )")
  ItemMarket_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 4 .. " )")
  WorkerList_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 5 .. " )")
  WorkerList_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 5 .. " )")
  WorkerList_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 5 .. " )")
  HelpMenu_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 6 .. " )")
  HelpMenu_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 6 .. " )")
  HelpMenu_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 6 .. " )")
  Exit_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 7 .. " )")
  Exit_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 7 .. " )")
  Exit_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 7 .. " )")
  WorkerTrade_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 8 .. " )")
  WorkerTrade_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 8 .. " )")
  WorkerTrade_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 8 .. " )")
  StableMarket_Btn:addInputEvent("Mouse_On", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 9 .. " )")
  StableMarket_Btn:addInputEvent("Mouse_Out", "HandleOnOut_WorldmapGrand_MenuButtonTooltip( false, " .. 9 .. " )")
  StableMarket_Btn:setTooltipEventRegistFunc("HandleOnOut_WorldmapGrand_MenuButtonTooltip( true, " .. 9 .. " )")
end

GrandWorldMap_CheckPopup = function(openPanel)
  -- function num : 0_1 , upvalues : popupTypeCount, popupPanelList
  for idx = 0, popupTypeCount - 1 do
    if openPanel ~= idx and ((popupPanelList[idx]).panelname):GetShow() then
      ((popupPanelList[idx]).closeFunc)()
    end
  end
  PaGlobal_TutorialManager:handleGrandWorldMap_CheckPopup(openPanel, (popupPanelList[openPanel]).panelname)
end

BtnEvent_ServantStable = function()
  -- function num : 0_2 , upvalues : currentNodeKey, popupType
  if not Panel_NodeStable:GetShow() then
    if currentNodeKey ~= nil then
      GrandWorldMap_CheckPopup(popupType.stable)
      StableOpen_FromWorldMap(currentNodeKey)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_GRAND_WRONG_STABLE"))
      return 
    end
  else
    StableClose_FromWorldMap()
  end
end

BtnEvent_StableMarket = function()
  -- function num : 0_3 , upvalues : popupType
  if Panel_Window_StableMarket:GetShow() == true then
    StableMarket_Close()
  else
    GrandWorldMap_CheckPopup(popupType.stableMarket)
    StableMarket_Open()
  end
end

BtnEvent_WorkerTrade = function()
  -- function num : 0_4 , upvalues : popupType
  if not ToClient_IsActiveWorkerTrade() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_WORKERTRADEALERT"))
    return 
  end
  if Panel_WorkerTrade:GetShow() then
    WorkerTrade_Close()
  else
    GrandWorldMap_CheckPopup(popupType.workerTrade)
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_WorkerTrade, true)
    FGlobal_WorkerTrade_Update()
  end
end

BtnEvent_WareHouse = function()
  -- function num : 0_5 , upvalues : currentNodeKey, popupType
  if Panel_Window_Warehouse:GetShow() then
    Warehouse_Close()
  else
    if currentNodeKey ~= nil then
      GrandWorldMap_CheckPopup(popupType.wareHouse)
      Warehouse_OpenPanelFromWorldmap(currentNodeKey, (CppEnums.WarehoouseFromType).eWarehoouseFromType_Worldmap)
    end
  end
end

BtnEvent_Quest = function()
  -- function num : 0_6 , upvalues : popupType
  if Panel_CheckedQuest:GetShow() then
    FGlobal_QuestWidget_Close()
  else
    GrandWorldMap_CheckPopup(popupType.quest)
    FGlobal_QuestWidget_Open()
  end
end

BtnEvent_Transport = function()
  -- function num : 0_7 , upvalues : popupType
  if Panel_Window_Delivery_InformationView:GetShow() then
    DeliveryInformationView_Close()
  else
    GrandWorldMap_CheckPopup(popupType.transport)
    DeliveryInformationView_Open()
  end
end

BtnEvent_ItemMarket = function()
  -- function num : 0_8 , upvalues : popupType
  if Panel_Window_ItemMarket:IsShow() then
    FGolbal_ItemMarketNew_Close()
  else
    GrandWorldMap_CheckPopup(popupType.itemMarket)
    FGlobal_ItemMarket_Open_ForWorldMap(1)
  end
end

BtnEvent_WorkerList = function()
  -- function num : 0_9 , upvalues : popupType, currentNodeKey
  if Panel_WorkerManager:GetShow() then
    workerManager_Close()
  else
    GrandWorldMap_CheckPopup(popupType.workerList)
    if currentNodeKey ~= nil then
      FGlobal_workerManager_UpdateNode(ToClient_convertWaypointKeyToPlantKey(currentNodeKey))
    else
      FGlobal_workerManager_OpenWorldMap()
    end
  end
end

BtnEvent_HelpMovie = function()
  -- function num : 0_10 , upvalues : popupType
  if Panel_WorldMap_MovieGuide:GetShow() == true then
    Panel_Worldmap_MovieGuide_Close()
  else
    GrandWorldMap_CheckPopup(popupType.helpMovie)
    Panel_Worldmap_MovieGuide_Open()
  end
end

BtnEvent_Exit = function()
  -- function num : 0_11
  FGlobal_CloseWorldmapForLuaKeyHandling()
end

local makePopupPanelList = function()
  -- function num : 0_12 , upvalues : popupPanelList, popupType
  popupPanelList = {
[popupType.stable] = {panelname = Panel_NodeStable, closeFunc = StableClose_FromWorldMap}
, 
[popupType.wareHouse] = {panelname = Panel_Window_Warehouse, closeFunc = Warehouse_Close}
, 
[popupType.quest] = {panelname = Panel_CheckedQuest, closeFunc = FGlobal_QuestWidget_Close}
, 
[popupType.transport] = {panelname = Panel_Window_Delivery_InformationView, closeFunc = DeliveryInformationView_Close}
, 
[popupType.itemMarket] = {panelname = Panel_Window_ItemMarket, closeFunc = FGolbal_ItemMarketNew_Close}
, 
[popupType.workerList] = {panelname = Panel_WorkerManager, closeFunc = workerManager_Close}
, 
[popupType.helpMovie] = {panelname = Panel_WorldMap_MovieGuide, closeFunc = Panel_Worldmap_MovieGuide_Close}
, 
[popupType.workerTrade] = {panelname = Panel_WorkerTrade, closeFunc = WorkerTrade_Close}
, 
[popupType.workerTradeCaravan] = {panelname = Panel_WorkerTrade_Caravan, closeFunc = FGlobal_WorkerTradeCaravan_Hide}
, 
[popupType.stableMarket] = {panelname = Panel_Window_StableMarket, closeFunc = StableMarket_Close}
}
end

FGlobal_WorldMapOpenForMenu = function()
  -- function num : 0_13 , upvalues : ServantStable_Btn, WareHouse_Btn, Quest_Btn, Transport_Btn, ItemMarket_Btn, WorkerList_Btn, HelpMenu_Btn, Exit_Btn, WorkerTrade_Btn, isWorkerTradeOpen, StableMarket_Btn, makePopupPanelList
  ServantStable_Btn:SetShow(true, false)
  WareHouse_Btn:SetShow(true, false)
  Quest_Btn:SetShow(true, false)
  Transport_Btn:SetShow(true, false)
  ItemMarket_Btn:SetShow(true, false)
  WorkerList_Btn:SetShow(true, false)
  HelpMenu_Btn:SetShow(true, false)
  Exit_Btn:SetShow(true, false)
  WorkerTrade_Btn:SetShow(isWorkerTradeOpen, false)
  StableMarket_Btn:SetShow(true, false)
  makePopupPanelList()
  Panel_WorldMap:SetShow(true, false)
  Panel_Worldmap_MovieGuide_Init()
  if isGameTypeKR2() then
    HelpMenu_Btn:SetShow(false)
  end
end

WorldmapGrand_setAlpha = function(boolValue)
  -- function num : 0_14
  local returnValue = ""
  if boolValue == true then
    returnValue = 1
  else
    returnValue = 0.7
  end
  return returnValue
end

HandleOnOut_WorldmapGrand_MenuButtonTooltip = function(isShow, buttonType)
  -- function num : 0_15 , upvalues : ServantStable_Btn, WareHouse_Btn, Quest_Btn, Transport_Btn, ItemMarket_Btn, WorkerList_Btn, HelpMenu_Btn, Exit_Btn, WorkerTrade_Btn, StableMarket_Btn
  if isShow then
    local control = nil
    local name = ""
    local desc = nil
    if buttonType == 0 then
      control = ServantStable_Btn
      name = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_MENUBUTTONTOOLTIP_STABLE")
    else
      if buttonType == 1 then
        control = WareHouse_Btn
        name = PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_WAREHOUSE")
      else
        if buttonType == 2 then
          control = Quest_Btn
          name = PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST")
        else
          if buttonType == 3 then
            control = Transport_Btn
            name = PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_DELIVERY")
          else
            if buttonType == 4 then
              control = ItemMarket_Btn
              name = PAGetString(Defines.StringSheet_GAME, "GAME_ITEM_MARKET_NAME")
            else
              if buttonType == 5 then
                control = WorkerList_Btn
                name = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_WORKERTITLE")
              else
                if buttonType == 6 then
                  control = HelpMenu_Btn
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_MENUBUTTONTOOLTIP_HELPMOVIE")
                else
                  if buttonType == 7 then
                    control = Exit_Btn
                    name = PAGetString(Defines.StringSheet_RESOURCE, "UICONTROL_BTN_GAMEEXIT")
                  else
                    if buttonType == 8 then
                      control = WorkerTrade_Btn
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_HELPWORKERTRADE")
                    else
                      if buttonType == 9 then
                        control = StableMarket_Btn
                        name = PAGetString(Defines.StringSheet_RESOURCE, "STABLE_FUNCTION_BTN_MARKET")
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
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

FGlobal_WorldmapGrand_Bottom_MenuSet = function(waypointKey)
  -- function num : 0_16 , upvalues : currentNodeKey, ServantStable_Btn, WareHouse_Btn, WorkerTrade_Btn, isWorkerTradeOpen
  if waypointKey ~= nil then
    currentNodeKey = waypointKey
    local isStableOpen = false
    local isWareHouseOpen = false
    local regionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(waypointKey)
    if regionInfoWrapper ~= nil then
      isStableOpen = (regionInfoWrapper:get()):hasStableNpc()
      isWareHouseOpen = (regionInfoWrapper:get()):hasWareHouseNpc()
    end
    ServantStable_Btn:SetAlpha(WorldmapGrand_setAlpha(isStableOpen))
    ServantStable_Btn:SetIgnore(not isStableOpen)
    WareHouse_Btn:SetAlpha(WorldmapGrand_setAlpha(isWareHouseOpen))
    WareHouse_Btn:SetIgnore(not isWareHouseOpen)
    WorkerTrade_Btn:SetAlpha(WorldmapGrand_setAlpha(not isWorkerTradeOpen))
    WorkerTrade_Btn:SetIgnore(isWorkerTradeOpen)
  else
    do
      currentNodeKey = nil
      ServantStable_Btn:SetAlpha(WorldmapGrand_setAlpha(false))
      ServantStable_Btn:SetIgnore(true)
      WareHouse_Btn:SetAlpha(WorldmapGrand_setAlpha(false))
      WareHouse_Btn:SetIgnore(true)
      WorkerTrade_Btn:SetAlpha(WorldmapGrand_setAlpha(isWorkerTradeOpen))
      WorkerTrade_Btn:SetIgnore(not isWorkerTradeOpen)
    end
  end
end

worldmapGrand_Base_OnScreenResize = function()
  -- function num : 0_17 , upvalues : ServantStable_Btn, WareHouse_Btn, Quest_Btn, Transport_Btn, ItemMarket_Btn, WorkerList_Btn, HelpMenu_Btn, Exit_Btn, WorkerTrade_Btn, StableMarket_Btn, transportAlert
  Panel_WorldMap:SetSize(getScreenSizeX(), getScreenSizeY())
  ServantStable_Btn:ComputePos()
  WareHouse_Btn:ComputePos()
  Quest_Btn:ComputePos()
  Transport_Btn:ComputePos()
  ItemMarket_Btn:ComputePos()
  WorkerList_Btn:ComputePos()
  HelpMenu_Btn:ComputePos()
  Exit_Btn:ComputePos()
  WorkerTrade_Btn:ComputePos()
  StableMarket_Btn:ComputePos()
  transportAlert:ComputePos()
end

FromClient_isCompletedTransport = function(isComplete)
  -- function num : 0_18
  if isComplete == nil then
    return 
  end
end

worldMap_Init()
registerEvent("onScreenResize", "worldmapGrand_Base_OnScreenResize")
registerEvent("FromClient_isCompletedTransport", "FromClient_isCompletedTransport")

