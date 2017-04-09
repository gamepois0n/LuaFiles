-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\workertrade\panel_workertrade_caravan.luac 

-- params : ...
-- function num : 0
Panel_WorkerTrade_Caravan:SetShow(false, false)
Panel_WorkerTrade_Caravan:setGlassBackground(true)
Panel_WorkerTrade_Caravan:SetDragAll(true)
Panel_WorkerTrade_Caravan:RegisterShowEventFunc(true, "Panel_WorkerTrade_Caravan_ShowAni()")
Panel_WorkerTrade_Caravan:RegisterShowEventFunc(false, "Panel_WorkerTrade_Caravan_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local isWorkerTradeContentOpen = ToClient_IsContentsGroupOpen("209")
Panel_WorkerTrade_Caravan_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_WorkerTrade_Caravan)
  local aniInfo1 = Panel_WorkerTrade_Caravan:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_WorkerTrade_Caravan:GetSizeX() / 2
  aniInfo1.AxisY = Panel_WorkerTrade_Caravan:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_WorkerTrade_Caravan:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_WorkerTrade_Caravan:GetSizeX() / 2
  aniInfo2.AxisY = Panel_WorkerTrade_Caravan:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_WorkerTrade_Caravan_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_WorkerTrade_Caravan:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_WorkerTrade_Caravan:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local workerTradeCaravan = {workerImage1 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_WorkerImage1"), workerImage2 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_WorkerImage2"), btnWorkerChange1 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Change1"), btnWorkerChange2 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Change2"), caravanOwnerName = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_PlayerName"), tradeLevel = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_TradeLevel"), caravanCount = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_CaravaCount"), caravanName = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_CaravanName"), 
radioButton = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Caravan1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Caravan2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Caravan3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Caravan4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Caravan5")}
, haveCoinCount = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_CoinIcon"), btnCoinChange = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_CoinChange"), btnCountChange1 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_OfficePart1_Sell"), haveWorkerCount1 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_OfficePart1_HaveCount"), btnCountChange2 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_OfficePart2_Sell"), haveWorkerCount2 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_OfficePart2_HaveCount"), btnCountChange3 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_OfficePart3_Sell"), haveWorkerCount3 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_OfficePart3_HaveCount"), btnCountChange4 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_OfficePart4_Sell"), haveWorkerCount4 = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_OfficePart4_HaveCount"), startNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_StartNodeValue"), arrivalNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ArrivalNodeValue"), btnSelectRouteNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_SelectRouteNode"), 
routeNode = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_RouteNodeValue1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_RouteNodeValue2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_RouteNodeValue3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_RouteNodeValue4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_RouteNodeValue5")}
, 
itemSlotBg = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG5"), [6] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG6"), [7] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG7"), [8] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG8"), [9] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG9"), [10] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot_BG10")}
, 
itemSlot = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot5"), [6] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot6"), [7] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot7"), [8] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot8"), [9] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot9"), [10] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_Slot10")}
, 
itemCount = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount5"), [6] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount6"), [7] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount7"), [8] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount8"), [9] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount9"), [10] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_ItemCount10")}
, haveCount = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_HaveCount"), allItemWeight = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_WeightValue"), allPrice = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_AllPriceValue"), btnStart = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Start"), list2_TradeWorkerList = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_TradeWorkerList"), list2_ArrivalNodeList = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_ArrivalNodeList"), list2_RouteNodeList = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_RouteNodeList"), list2_TradeItemList = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_TradeItemList"), btnClose = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Close"), selectIndex = 0, selectArrNodeIndex = -1, currentSelectRouteNodeCount = 0, 
currentSelectRouteNodeList = {}
, routeNodeIndex = 0, 
selectedWorker = {[0] = nil, [1] = nil}
, 
tradeItemInfo = {}
, maxCarriageCount = 5, minWorkerCount = 2, maxWorkerCount = 10, maxFortuneCharm = 3}
workerTradeCaravan.DataInit = function(self)
  -- function num : 0_2
  (self.arrivalNode):SetText("선택해주세요")
  for index = 1, #self.routeNode do
    ((self.routeNode)[index]):SetText("선택해주세요")
  end
  self.selectArrNodeIndex = -1
  self.currentSelectRouteNodeList = {}
  for index = 1, #self.itemSlot do
    ((self.itemSlot)[index]):ChangeTextureInfoName("")
    ;
    ((self.itemCount)[index]):SetShow(false)
  end
  ;
  (self.haveCount):SetText("적재�\168 : 0 / 10")
  ;
  (self.allItemWeight):SetText("소지 무게 : 0 / 6000LT")
  ;
  (self.allPrice):SetText("�\157 �\128�\169 : 0코인")
  self.tradeItemInfo = {}
end

workerTradeCaravan.Show = function(self, index)
  -- function num : 0_3
  if Panel_WorkerTrade:GetShow() then
    WorkerTrade_Close()
  end
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_WorkerTrade_Caravan, true)
  Panel_WorkerTrade_Caravan:SetShow(true, true)
  self:DataInit()
  self:SetData(index)
end

workerTradeCaravan.SetData = function(self, index)
  -- function num : 0_4
  for _index = 1, #self.radioButton do
    if index == _index then
      ((self.radioButton)[_index]):SetCheck(true)
      self.selectIndex = index
    else
      ;
      ((self.radioButton)[_index]):SetCheck(false)
    end
  end
  ToClient_RequestClearTempInfo()
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index)
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  ;
  (self.haveCoinCount):SetText(tostring(coinCount) .. " 코인")
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R5 in 'UnsetPending'

  if tradeGroupWrapper ~= nil then
    (self.selectedWorker)[0] = tradeGroupWrapper:getWorkerNo(0)
    if Int64toInt32((self.selectedWorker)[0]) > 0 then
      local workerWrapper = getWorkerWrapper((self.selectedWorker)[0], true)
      local workerName = workerWrapper:getName()
      ;
      (self.workerImage1):ChangeTextureInfoName(workerWrapper:getWorkerIcon())
    else
      do
        ;
        (self.workerImage1):ChangeTextureInfoName("/new_ui_common_forlua/window/trade/workertrade_00.dds")
        do
          local x1, y1, x2, y2 = setTextureUV_Func(self.workerImage1, 1, 1, 121, 121)
          ;
          ((self.workerImage1):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          (self.workerImage1):setRenderTexture((self.workerImage1):getBaseTexture())
          -- DECOMPILER ERROR at PC93: Confused about usage of register: R5 in 'UnsetPending'

          ;
          (self.selectedWorker)[1] = tradeGroupWrapper:getWorkerNo(1)
          if Int64toInt32((self.selectedWorker)[1]) > 0 then
            local workerWrapper = getWorkerWrapper((self.selectedWorker)[1], true)
            local workerName = workerWrapper:getName()
            ;
            (self.workerImage2):ChangeTextureInfoName(workerWrapper:getWorkerIcon())
          else
            do
              ;
              (self.workerImage2):ChangeTextureInfoName("/new_ui_common_forlua/window/trade/workertrade_00.dds")
              do
                local x1, y1, x2, y2 = setTextureUV_Func(self.workerImage2, 1, 1, 121, 121)
                ;
                ((self.workerImage2):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (self.workerImage2):setRenderTexture((self.workerImage2):getBaseTexture())
                local porterCount = tradeGroupWrapper:getTradeGroupPorter()
                local guardCount = tradeGroupWrapper:getTradeGroupGuard()
                local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
                do
                  local amuletCount = tradeGroupWrapper:getTradeGroupAmulet()
                  ;
                  (self.haveWorkerCount1):SetText("배치 : " .. carriageCount .. "�\128")
                  ;
                  (self.haveWorkerCount2):SetText("배치 : " .. porterCount .. "�\133")
                  ;
                  (self.haveWorkerCount3):SetText("배치 : " .. guardCount .. "�\133")
                  ;
                  (self.haveWorkerCount4):SetText("배치 : " .. amuletCount .. "�\156")
                  if tradeGroupWrapper:getState() == 4 then
                    local startRegionInfo = tradeGroupWrapper:getCurrentRegion()
                    ;
                    (self.startNode):SetText(startRegionInfo:getAreaName())
                  else
                    do
                      local startRegionInfo = tradeGroupWrapper:getStartRegion()
                      ;
                      (self.startNode):SetText(startRegionInfo:getAreaName())
                      local arrivalRegionInfo = tradeGroupWrapper:getDestinationRegion()
                      local arrivalWayPointKey = (self.arrivalNode):SetText(arrivalRegionInfo:getAreaName())
                      local routeNodeCount = tradeGroupWrapper:getEventNodeCount()
                      for rIndex = 1, routeNodeCount do
                        local routeNodeInfo = tradeGroupWrapper:getEventNodeRegion(rIndex - 1)
                        ;
                        ((self.routeNode)[index]):SetText(routeNodeInfo:getAreaName())
                      end
                      if routeNodeCount < 5 then
                        for rIndex = routeNodeCount + 1, 5 do
                          ((self.routeNode)[rIndex]):SetText("미설�\149")
                        end
                      end
                      do
                        local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
                        local slotCount, totalWeight = 0, 0
                        local totalPrice = makeDotMoney(tradeGroupWrapper:getConsumePrice())
                        for iIndex = 1, 10 do
                          ((self.itemSlot)[iIndex]):ChangeTextureInfoName("")
                          ;
                          ((self.itemCount)[iIndex]):SetShow(false)
                          local tradeItemWrapper = tradeGroupWrapper:getInventoryItem(iIndex - 1)
                          if tradeItemWrapper ~= nil then
                            local itemCount = Int64toInt32(tradeItemWrapper:getCount())
                            if itemCount > 0 then
                              ((self.itemSlot)[iIndex]):ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
                              ;
                              ((self.itemCount)[iIndex]):SetShow(true)
                              ;
                              ((self.itemCount)[iIndex]):SetText(itemCount)
                              slotCount = slotCount + 1
                              totalWeight = totalWeight + tradeItemWrapper:getWeight() * itemCount
                            end
                          end
                        end
                        local maxWeight = tradeGroupWrapper:getTradeGroupTransportCapacity()
                        ;
                        (self.haveCount):SetText("적재�\168 : " .. slotCount .. " / 10")
                        ;
                        (self.allItemWeight):SetText("소지 무게 : " .. tostring(totalWeight) .. " / " .. tostring(maxWeight))
                        ;
                        (self.allPrice):SetText("�\157 �\128�\169 : " .. tostring(totalPrice) .. "코인")
                        ;
                        (self.list2_TradeWorkerList):SetShow(false)
                        ;
                        (self.list2_ArrivalNodeList):SetShow(false)
                        ;
                        (self.list2_RouteNodeList):SetShow(false)
                        ;
                        (self.list2_TradeItemList):SetShow(false)
                        self.currentSelectRouteNodeCount = ToClient_GetWorkerTradeEventNodeCount(startWayPointKey)
                        self.routeNodeIndex = 0
                        self.currentSelectRouteNodeList = {}
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

FGlobal_WorkerTradeCaravan_SetData = function()
  -- function num : 0_5 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  self:SetData(self.selectIndex)
end

FGlobal_WorkerTradeCaravan_Show = function(index)
  -- function num : 0_6 , upvalues : workerTradeCaravan
  workerTradeCaravan:Show(index)
end

workerTradeCaravan.Hide = function(self)
  -- function num : 0_7
  Panel_WorkerTrade_Caravan:SetShow(false, false)
  WorldMapPopupManager:pop()
  GrandWorldMap_CheckPopup(7)
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_WorkerTrade, true)
  WorkerTrade_Open()
end

FGlobal_WorkerTradeCaravan_Hide = function()
  -- function num : 0_8 , upvalues : workerTradeCaravan
  workerTradeCaravan:Hide()
end

WorkerTradeCaravan_Set = function(index)
  -- function num : 0_9 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index)
  if tradeGroupWrapper == nil then
    ((self.radioButton)[index]):SetCheck(false)
    ;
    ((self.radioButton)[self.selectIndex]):SetCheck(true)
    return 
  end
  self:DataInit()
  self:SetData(index)
end

local clickedWorkerIndex = 0
WorkerTradeCaravan_SetWorker = function(index)
  -- function num : 0_10 , upvalues : workerTradeCaravan, clickedWorkerIndex
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 일꾼�\132 �\128경할 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local plantConut = ToCleint_getHomePlantKeyListCount()
  local startWayPointKey = 1101
  ;
  ((self.list2_TradeWorkerList):getElementManager()):clearKey()
  for plantIdx = 0, plantConut - 1 do
    local plantKeyRaw = ToCleint_getHomePlantKeyListByIndex(plantIdx)
    if startWayPointKey == plantKeyRaw then
      local plantKey = ToClient_convertWaypointKeyToPlantKey(startWayPointKey)
      local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(plantKey, 0)
      local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(plantKey)
      for workerIndex = 0, waitWorkerCount - 1 do
        local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(plantKey, workerIndex)
        if (self.selectedWorker)[0] ~= workerNoRaw and (self.selectedWorker)[1] ~= workerNoRaw then
          ((self.list2_TradeWorkerList):getElementManager()):pushKey(toInt64(0, workerIndex))
        end
      end
    end
  end
  ;
  (self.list2_TradeWorkerList):SetShow(true)
  ;
  (self.list2_ArrivalNodeList):SetShow(false)
  ;
  (self.list2_RouteNodeList):SetShow(false)
  ;
  (self.list2_TradeItemList):SetShow(false)
  clickedWorkerIndex = index
end

TradeWorkerListControlCreate = function(content, key)
  -- function num : 0_11 , upvalues : workerTradeCaravan
  local workerListBg = (UI.getChildControl)(content, "List2_OptionList_Bg")
  local tradeWorkerName = (UI.getChildControl)(content, "List2_OptionList_Desc")
  local self = workerTradeCaravan
  local _key = Int64toInt32(key)
  local plantConut = ToCleint_getHomePlantKeyListCount()
  local startWayPointKey = 1101
  for plantIdx = 0, plantConut - 1 do
    local plantKeyRaw = ToCleint_getHomePlantKeyListByIndex(plantIdx)
    if startWayPointKey == plantKeyRaw then
      local plantKey = ToClient_convertWaypointKeyToPlantKey(startWayPointKey)
      local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(plantKey, 0)
      local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(plantKey)
      for workerIndex = 0, waitWorkerCount - 1 do
        if _key == workerIndex then
          local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(plantKey, workerIndex)
          if (self.selectedWorker)[0] ~= workerNoRaw and (self.selectedWorker)[1] ~= workerNoRaw then
            local workerWrapperLua = getWorkerWrapper(workerNoRaw, true)
            tradeWorkerName:SetText(tostring(workerWrapperLua:getName()))
            workerListBg:addInputEvent("Mouse_LUp", "TradeWorker_SetWorker(" .. tostring(workerNoRaw) .. ")")
            break
          end
        end
      end
    end
  end
end

TradeWorker_SetWorker = function(workerNo)
  -- function num : 0_12 , upvalues : workerTradeCaravan, clickedWorkerIndex
  local self = workerTradeCaravan
  ToClient_RequestSetWorker(self.selectIndex, clickedWorkerIndex, workerNo)
  ;
  (self.list2_TradeWorkerList):SetShow(false)
end

TradeWorker_FireWorker = function(index)
  -- function num : 0_13 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  ToClient_RequestUnsetWorker(self.selectIndex, index)
end

WorkerTradeCaravan_ShowArrivalNodeList = function()
  -- function num : 0_14 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 목적�\128�\188 설정�\160 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  ;
  ((self.list2_ArrivalNodeList):getElementManager()):clearKey()
  local arrivalNodeCount = ToClient_GetWorkerTradeMainNodeCount(startWayPointKey)
  for index = 0, arrivalNodeCount - 1 do
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, index)
    if regionInfo ~= nil then
      ((self.list2_ArrivalNodeList):getElementManager()):pushKey(toInt64(0, index))
    end
  end
  ;
  (self.list2_TradeWorkerList):SetShow(false)
  ;
  (self.list2_ArrivalNodeList):SetShow(true)
  ;
  (self.list2_RouteNodeList):SetShow(false)
  ;
  (self.list2_TradeItemList):SetShow(false)
end

ArrivalNodeList_Set = function(index)
  -- function num : 0_15 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, index)
  ;
  (self.arrivalNode):SetText(regionInfo:getAreaName())
  ;
  (self.list2_ArrivalNodeList):SetShow(false)
  self.selectArrNodeIndex = index
  ToClient_RequestSetDestination(regionInfo:getExplorationKey())
end

ArrivalNodeListControlCreate = function(content, key)
  -- function num : 0_16 , upvalues : workerTradeCaravan
  local arrivalNodeBg = (UI.getChildControl)(content, "List2_OptionList_Bg")
  local arrivalNodeName = (UI.getChildControl)(content, "List2_OptionList_Desc")
  local self = workerTradeCaravan
  local _key = Int64toInt32(key)
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  local arrivalNodeCount = ToClient_GetWorkerTradeMainNodeCount(startWayPointKey)
  for index = 0, arrivalNodeCount - 1 do
    if index == _key then
      local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, index)
      if regionInfo ~= nil then
        arrivalNodeName:SetText(regionInfo:getAreaName())
        arrivalNodeBg:addInputEvent("Mouse_LUp", "ArrivalNodeList_Set(" .. index .. ")")
        break
      end
    end
  end
end

WorkerTradeCaravan_RouteNodeSet = function()
  -- function num : 0_17 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 경유�\128�\188 설정�\160 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  ;
  ((self.list2_RouteNodeList):getElementManager()):clearKey()
  local routeNodeCount = ToClient_GetWorkerTradeEventNodeCount(startWayPointKey)
  for index = 0, routeNodeCount - 1 do
    local regionInfo = ToClient_GetWorkerTradeEventNodeByIndex(startWayPointKey, index)
    if regionInfo ~= nil and RouteNodeCompare(regionInfo:getAreaName()) then
      ((self.list2_RouteNodeList):getElementManager()):pushKey(toInt64(0, index))
    end
  end
  ;
  (self.list2_TradeWorkerList):SetShow(false)
  ;
  (self.list2_ArrivalNodeList):SetShow(false)
  ;
  (self.list2_RouteNodeList):SetShow(true)
  ;
  (self.list2_TradeItemList):SetShow(false)
end

RouteNodeList_Set = function(index, currentRouteNodeIndex)
  -- function num : 0_18 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  local regionInfo = ToClient_GetWorkerTradeEventNodeByIndex(startWayPointKey, index)
  if currentRouteNodeIndex == nil then
    self.routeNodeIndex = self.routeNodeIndex + 1
    ;
    ((self.routeNode)[self.routeNodeIndex]):SetText(regionInfo:getAreaName())
    ;
    (self.list2_RouteNodeList):SetShow(false)
    ;
    (table.insert)(self.currentSelectRouteNodeList, regionInfo:getAreaName())
    ToClient_RequestSetEventNode(self.routeNodeIndex - 1, regionInfo:getExplorationKey())
  end
end

RouteNodeListControlCreate = function(content, key)
  -- function num : 0_19 , upvalues : workerTradeCaravan
  local optionListBg = (UI.getChildControl)(content, "List2_OptionList_Bg")
  local optionListDesc = (UI.getChildControl)(content, "List2_OptionList_Desc")
  local self = workerTradeCaravan
  local _key = Int64toInt32(key)
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  local routeNodeCount = ToClient_GetWorkerTradeEventNodeCount(startWayPointKey)
  for index = 0, routeNodeCount - 1 do
    if index == _key then
      local regionInfo = ToClient_GetWorkerTradeEventNodeByIndex(startWayPointKey, index)
      if regionInfo ~= nil then
        optionListDesc:SetText(regionInfo:getAreaName())
        optionListBg:addInputEvent("Mouse_LUp", "RouteNodeList_Set(" .. index .. ")")
        self.currentSelectRouteNodeCount = self.currentSelectRouteNodeCount - 1
        break
      end
    end
  end
end

RouteNodeCompare = function(areaName)
  -- function num : 0_20 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  if self.currentSelectRouteNodeList == nil then
    return true
  end
  for v,name in pairs(self.currentSelectRouteNodeList) do
    if areaName == name then
      return false
    end
  end
  return true
end

local _slotIndex = nil
WorkerTradeCaravan_SelectItem = function(slotIndex)
  -- function num : 0_21 , upvalues : _slotIndex
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 무역품을 구입�\160 �\152 있습니다.")
    return 
  end
  _slotIndex = slotIndex
  ToClient_RequestOpenWorkerTrade()
end

FromClient_OpenWorkerTrade = function()
  -- function num : 0_22 , upvalues : workerTradeCaravan, _slotIndex
  local self = workerTradeCaravan
  local startWayPointKey = (WorkerTradeCaravan_StartWayPointKey())
  local destWayPointKey = nil
  if self.selectArrNodeIndex == -1 then
    destWayPointKey = startWayPointKey
  else
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, self.selectArrNodeIndex)
    destWayPointKey = regionInfo:getExplorationKey()
  end
  do
    ;
    ((self.list2_TradeItemList):getElementManager()):clearKey()
    local buyableItemCount = ToClient_RequestBuyableWorkerTradeItemCount(startWayPointKey)
    for index = 0, buyableItemCount - 1 do
      if (self.tradeItemInfo)[_slotIndex] ~= index and WorkerTradeCaravan_ItemCheck(index) then
        ((self.list2_TradeItemList):getElementManager()):pushKey(toInt64(0, index))
      end
      ;
      ((self.list2_TradeItemList):getElementManager()):pushKey(toInt64(0, index))
    end
    ;
    (self.list2_TradeWorkerList):SetShow(false)
    ;
    (self.list2_ArrivalNodeList):SetShow(false)
    ;
    (self.list2_RouteNodeList):SetShow(false)
    ;
    (self.list2_TradeItemList):SetShow(true)
  end
end

WorkerTradeCaravan_ItemCheck = function(index)
  -- function num : 0_23 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  for slotIndex = 0, #self.tradeItemInfo do
    if index == (self.tradeItemInfo)[slotIndex] then
      return false
    end
  end
  return true
end

TradeItemListControlCreate = function(content, key)
  -- function num : 0_24 , upvalues : workerTradeCaravan
  local optionListBg = (UI.getChildControl)(content, "List2_OptionList_Bg")
  local slotBg = (UI.getChildControl)(content, "Static_Slot_BG")
  local slot = (UI.getChildControl)(content, "Static_Slot")
  local itemName = (UI.getChildControl)(content, "List2_OptionList_Name")
  local buyPrice = (UI.getChildControl)(content, "List2_OptionList_BuyPrice")
  local sellPrice = (UI.getChildControl)(content, "List2_OptionList_SellPrice")
  local weight = (UI.getChildControl)(content, "List2_OptionList_Weight")
  local btnBuy = (UI.getChildControl)(content, "Button_Buy")
  local self = workerTradeCaravan
  local _key = Int64toInt32(key)
  local startWayPointKey = (WorkerTradeCaravan_StartWayPointKey())
  local destWayPointKey = nil
  if self.selectArrNodeIndex == -1 then
    destWayPointKey = startWayPointKey
  else
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, self.selectArrNodeIndex)
    destWayPointKey = regionInfo:getExplorationKey()
  end
  do
    local buyableItemCount = ToClient_RequestBuyableWorkerTradeItemCount(startWayPointKey)
    for index = 0, buyableItemCount - 1 do
      if index == _key then
        local tradeItemWrapper = ToClient_RequestWorkerTradeItemMaster(startWayPointKey, index)
        if tradeItemWrapper ~= nil then
          slot:ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
          itemName:SetText(tradeItemWrapper:getName())
          buyPrice:SetText("구입 : " .. tostring(tradeItemWrapper:getBuyPrice()) .. "코인")
          weight:SetText("무게 : " .. tostring(tradeItemWrapper:getWeight()) .. "LT")
          local arrivalNode_TradeItemWrapper = ToClient_RequestWorkerTradeItemMaster(destWayPointKey, index)
          if arrivalNode_TradeItemWrapper ~= nil then
            sellPrice:SetText("판매 : " .. tostring(arrivalNode_TradeItemWrapper:getContractedPrice()) .. "코인")
            btnBuy:addInputEvent("Mouse_LUp", "WorkerTradeCaravan_BuyItem(" .. index .. ")")
          end
          break
        end
      end
    end
  end
end

WorkerTradeCaravan_BuyItem = function(index)
  -- function num : 0_25 , upvalues : workerTradeCaravan, _slotIndex
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(workerTradeCaravan.selectIndex)
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  local canBuyItem = false
  local startWayPointKey = (WorkerTradeCaravan_StartWayPointKey())
  local destWayPointKey = nil
  if self.selectArrNodeIndex == -1 then
    destWayPointKey = startWayPointKey
  else
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, self.selectArrNodeIndex)
    destWayPointKey = regionInfo:getExplorationKey()
  end
  do
    local tradeItemWrapper = ToClient_RequestWorkerTradeItemMaster(startWayPointKey, index)
    local maxCount = (math.floor)(Int64toInt32(coinCount / tradeItemWrapper:getBuyPrice()))
    local setTradeItem = function(inputNumber)
    -- function num : 0_25_0 , upvalues : _slotIndex, tradeItemWrapper, tradeGroupWrapper, canBuyItem, workerTradeCaravan, startWayPointKey, destWayPointKey, self, index, tradeCompanyWrapper
    if _slotIndex == nil then
      return 
    end
    local itemKey = tradeItemWrapper:getKey()
    local maxWeight = tradeGroupWrapper:getTradeGroupTransportCapacity()
    canBuyItem = ToClient_RequestAddCart(workerTradeCaravan.selectIndex, _slotIndex - 1, itemKey, inputNumber, startWayPointKey, destWayPointKey)
    if canBuyItem == true then
      ((self.itemSlot)[_slotIndex]):ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
      ;
      ((self.itemCount)[_slotIndex]):SetShow(true)
      ;
      ((self.itemCount)[_slotIndex]):SetText(tostring(inputNumber))
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (self.tradeItemInfo)[_slotIndex] = index
      local slotCount = 0
      for sIndex = 1, #self.itemSlot do
        if (self.tradeItemInfo)[sIndex] ~= nil then
          slotCount = slotCount + 1
        end
      end
      local totalPrice = tradeCompanyWrapper:getTempTotalPrice()
      local totalWeight = tradeCompanyWrapper:getTempTotalWeight()
      ;
      (self.haveCount):SetText("적재�\168 : " .. slotCount .. " / 10")
      ;
      (self.allItemWeight):SetText("소지 무게 : " .. tostring(totalWeight) .. " / " .. tostring(maxWeight))
      ;
      (self.allPrice):SetText("�\157 �\128�\169 : " .. tostring(totalPrice) .. "코인")
      ;
      (self.list2_TradeItemList):SetShow(false)
    end
  end

    Panel_NumberPad_Show(true, toInt64(0, maxCount), 0, setTradeItem)
  end
end

WorkerTradeCaravan_Go = function()
  -- function num : 0_26 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 출발�\160 �\152 있습니다..")
    return 
  end
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(workerTradeCaravan.selectIndex)
  if tradeGroupWrapper == nil then
    return 
  end
  local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
  local porterCount = tradeGroupWrapper:getTradeGroupPorter()
  if carriageCount == 0 then
    Proc_ShowMessage_Ack("배치�\156 마차�\128 없어 출발�\160 �\152 없습니다.")
    return 
  end
  if porterCount < carriageCount * workerTradeCaravan.minWorkerCount then
    Proc_ShowMessage_Ack("배치�\156 짐꾼�\180 �\128족해 출발�\160 �\152 없습니다.")
    return 
  end
  ToClient_RequestStartTradeGroup(workerTradeCaravan.selectIndex)
end

WorkerTradeCaravan_StartWayPointKey = function()
  -- function num : 0_27 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(self.selectIndex)
  if tradeGroupWrapper == nil then
    return 
  end
  local startRegionInfo = tradeGroupWrapper:getCurrentRegion()
  local startWayPointKey = startRegionInfo:getExplorationKey()
  return startWayPointKey
end

WorkerTradeCarava_SetPorter = function()
  -- function num : 0_28 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 짐꾼�\132 배치�\160 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local maxHaveCount = tradeCompanyWrapper:getTradeCompanyPorter()
  local hiredCount = 0
  for index = 0, 4 do
    local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index)
    if tradeGroupWrapper ~= nil then
      hiredCount = hiredCount + tradeGroupWrapper:getTradeGroupPorter()
    end
  end
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(self.selectIndex)
  local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
  local hirableCount = maxHaveCount - (hiredCount)
  hirableCount = (math.min)(hirableCount, carriageCount * self.maxWorkerCount)
  local setPorter = function(inputNumber)
    -- function num : 0_28_0 , upvalues : self
    ToClient_RequestSetPorterInTradeGroup(self.selectIndex, Int64toInt32(inputNumber))
  end

  if hirableCount > 0 then
    Panel_NumberPad_Show(true, toInt64(0, hirableCount), 0, setPorter)
  else
    Proc_ShowMessage_Ack("고용�\160 �\152 있는 짐꾼�\180 없습니다.")
  end
end

WorkerTradeCarava_SetGuard = function()
  -- function num : 0_29 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 호위�\188 배치�\160 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local maxHaveCount = tradeCompanyWrapper:getTradeCompanyGuard()
  local hiredCount = 0
  for index = 0, 4 do
    local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index)
    if tradeGroupWrapper ~= nil then
      hiredCount = hiredCount + tradeGroupWrapper:getTradeGroupGuard()
    end
  end
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(self.selectIndex)
  local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
  local hirableCount = maxHaveCount - (hiredCount)
  hirableCount = (math.min)(hirableCount, carriageCount)
  local setGuard = function(inputNumber)
    -- function num : 0_29_0 , upvalues : self
    ToClient_RequestSetGuardInTradeGroup(self.selectIndex, Int64toInt32(inputNumber))
  end

  if hirableCount > 0 then
    Panel_NumberPad_Show(true, toInt64(0, hirableCount), 0, setGuard)
  else
    Proc_ShowMessage_Ack("고용�\160 �\152 있는 호위�\128 없습니다.")
  end
end

WorkerTradeCarava_SetCarriage = function()
  -- function num : 0_30 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 마차�\188 배치�\160 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local maxHaveCount = tradeCompanyWrapper:getTradeCompanyCarriage()
  local hiredCount = 0
  for index = 0, 4 do
    local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index)
    if tradeGroupWrapper ~= nil then
      hiredCount = hiredCount + tradeGroupWrapper:getTradeGroupCarriage()
    end
  end
  local hirableCount = maxHaveCount
  hirableCount = (math.min)(hirableCount, self.maxCarriageCount)
  local setCarriage = function(inputNumber)
    -- function num : 0_30_0 , upvalues : self
    ToClient_RequestSetCarriageInTradeGroup(self.selectIndex, Int64toInt32(inputNumber))
  end

  if hirableCount > 0 then
    Panel_NumberPad_Show(true, toInt64(0, hirableCount), 0, setCarriage)
  else
    Proc_ShowMessage_Ack("고용�\160 �\152 있는 마차�\128 없습니다.")
  end
end

WorkerTradeCarava_SetAmulet = function()
  -- function num : 0_31 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 행운 �\128적을 적재 �\160 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local maxHaveCount = tradeCompanyWrapper:getTradeCompanyAmulet()
  local hiredCount = 0
  for index = 0, 4 do
    local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index)
    if tradeGroupWrapper ~= nil then
      hiredCount = hiredCount + tradeGroupWrapper:getTradeGroupAmulet()
    end
  end
  local hirableCount = maxHaveCount - (hiredCount)
  hirableCount = (math.min)(hirableCount, self.maxFortuneCharm)
  local setAmulet = function(inputNumber)
    -- function num : 0_31_0 , upvalues : self
    ToClient_RequestSetAmuletInTradeGroup(self.selectIndex, Int64toInt32(inputNumber))
  end

  if hirableCount > 0 then
    Panel_NumberPad_Show(true, toInt64(0, hirableCount), 0, setAmulet)
  else
    Proc_ShowMessage_Ack("적재�\160 �\152 있는 행운 �\128적이 없습니다.")
  end
end

isChangeableState = function()
  -- function num : 0_32 , upvalues : workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(workerTradeCaravan.selectIndex)
  local currentState = tradeGroupWrapper:getState()
  if currentState == 4 then
    return true
  else
    return false
  end
end

workerTradeCaravan.registerEvent = function(self)
  -- function num : 0_33
  (self.btnWorkerChange1):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SetWorker(" .. 0 .. ")")
  ;
  (self.btnWorkerChange2):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SetWorker(" .. 1 .. ")")
  ;
  (self.btnCountChange1):addInputEvent("Mouse_LUp", "WorkerTradeCarava_SetCarriage()")
  ;
  (self.btnCountChange2):addInputEvent("Mouse_LUp", "WorkerTradeCarava_SetPorter()")
  ;
  (self.btnCountChange3):addInputEvent("Mouse_LUp", "WorkerTradeCarava_SetGuard()")
  ;
  (self.btnCountChange4):addInputEvent("Mouse_LUp", "WorkerTradeCarava_SetAmulet()")
  for index = 1, #self.radioButton do
    ((self.radioButton)[index]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_Set(" .. index .. ")")
  end
  ;
  (self.list2_TradeWorkerList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "TradeWorkerListControlCreate")
  ;
  (self.list2_TradeWorkerList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.arrivalNode):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_ShowArrivalNodeList()")
  ;
  (self.list2_ArrivalNodeList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ArrivalNodeListControlCreate")
  ;
  (self.list2_ArrivalNodeList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.btnSelectRouteNode):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_RouteNodeSet()")
  ;
  (self.list2_RouteNodeList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "RouteNodeListControlCreate")
  ;
  (self.list2_RouteNodeList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  for index = 1, #self.itemSlot do
    ((self.itemSlot)[index]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SelectItem(" .. index .. ")")
  end
  ;
  (self.list2_TradeItemList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "TradeItemListControlCreate")
  ;
  (self.list2_TradeItemList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.btnStart):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_Go()")
  registerEvent("FromClient_OpenWorkerTrade", "FromClient_OpenWorkerTrade")
  ;
  (self.btnClose):addInputEvent("Mouse_LUp", "FGlobal_WorkerTradeCaravan_Hide()")
end

workerTradeCaravan:registerEvent()

