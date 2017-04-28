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

local workerTradeCaravan = {
control = {_caravanStatBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_CaravanStatBg"), _workerBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_WorkerBg"), _assetBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_AssetBg"), _itemSetBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_ItemSetBg"), _itemWeight = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_WeightIcon"), 
_routerNode = {_btnStartNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_StartNode"), _btnArrivalNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_ArrivalNode"), 
_btnRouterNode = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode5")}
}
, _list2TradeWorker = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_TradeWorkerList"), _list2TradeItem = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_TradeItemList"), _list2ArrivalNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_ArrivalNodeList"), _list2RouteNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_RouteNodeList"), _tradePrice = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_TradePrice"), _btnTradeStart = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_TradeStart"), 
_caravanStat = {}
, 
_worker = {}
, 
_asset = {}
, 
_itemSet = {}
}
, 
_selectedWorker = {[0] = (Defines.u64_const).u64_0, [1] = (Defines.u64_const).u64_0}
, _caravanIndex = -1, _selectIndex = -1, _selectArrNodeIndex = -1, _routeNodeIndex = 0, _currentSelectRouteNodeCount = 0, 
_currentSelectRouteNodeList = {}
, _maxCarriageCount = 5, _minCarriageCount = 1, _maxWorkerCount = 10, _minWorkerCount = 2, _maxGuardCount = 3, _maxFACount = 3, 
tradeItemInfo = {}
}
workerTradeCaravan.ControlInit = function(self)
  -- function num : 0_2
  local control = self.control
  control._caravanStat = {_image = (UI.getChildControl)(control._caravanStatBg, "Static_CaravanImage"), _name = (UI.getChildControl)(control._caravanStatBg, "StaticText_CaravanName"), _speed = (UI.getChildControl)(control._caravanStatBg, "StaticText_Speed"), _luck = (UI.getChildControl)(control._caravanStatBg, "StaticText_Luck"), _attack = (UI.getChildControl)(control._caravanStatBg, "StaticText_Attack"), _defence = (UI.getChildControl)(control._caravanStatBg, "StaticText_Deffence")}
  control._worker = {
_image = {[1] = (UI.getChildControl)(control._workerBg, "Static_WorkerImage1"), [2] = (UI.getChildControl)(control._workerBg, "Static_WorkerImage2")}
}
  control._asset = {_carriage = (UI.getChildControl)(control._assetBg, "StaticText_Carriage"), _worker = (UI.getChildControl)(control._assetBg, "StaticText_Worker"), _guard = (UI.getChildControl)(control._assetBg, "StaticText_Guard"), _FA = (UI.getChildControl)(control._assetBg, "StaticText_FortuneAmulet"), _btnCarriage = (UI.getChildControl)(control._assetBg, "Static_CarriageIcon"), _btnWorker = (UI.getChildControl)(control._assetBg, "Static_WorkerIcon"), _btnGuard = (UI.getChildControl)(control._assetBg, "Static_GuardIcon"), _btnFA = (UI.getChildControl)(control._assetBg, "Static_FAIcon"), _carriageCount = (UI.getChildControl)(control._assetBg, "StaticText_CarriageCount"), _workerCount = (UI.getChildControl)(control._assetBg, "StaticText_WorkerCount"), _guardCount = (UI.getChildControl)(control._assetBg, "StaticText_GuardCount"), _FACount = (UI.getChildControl)(control._assetBg, "StaticText_FACount")}
  control._itemSet = {
_itemSlotBg = {[1] = (UI.getChildControl)(control._itemSetBg, "Static_ItemSlotBg"), [2] = (UI.getChildControl)(control._itemSetBg, "Static_ItemSlotBg2"), [3] = (UI.getChildControl)(control._itemSetBg, "Static_ItemSlotBg3"), [4] = (UI.getChildControl)(control._itemSetBg, "Static_ItemSlotBg4"), [5] = (UI.getChildControl)(control._itemSetBg, "Static_ItemSlotBg5")}
, 
_itemSetBg = {
[1] = {}
, 
[2] = {}
, 
[3] = {}
, 
[4] = {}
, 
[5] = {}
}
}
  for index = 1, 5 do
    -- DECOMPILER ERROR at PC183: Confused about usage of register: R6 in 'UnsetPending'

    (((control._itemSet)._itemSetBg)[index])._itemSlotBg = {}
    -- DECOMPILER ERROR at PC195: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._itemSlotBg)[1] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "Static_ItemSlotBg1")
    -- DECOMPILER ERROR at PC207: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._itemSlotBg)[2] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "Static_ItemSlotBg2")
    -- DECOMPILER ERROR at PC212: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (((control._itemSet)._itemSetBg)[index])._itemSlot = {}
    -- DECOMPILER ERROR at PC226: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._itemSlot)[1] = (UI.getChildControl)(((((control._itemSet)._itemSetBg)[index])._itemSlotBg)[1], "Static_Slot")
    -- DECOMPILER ERROR at PC240: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._itemSlot)[2] = (UI.getChildControl)(((((control._itemSet)._itemSetBg)[index])._itemSlotBg)[2], "Static_Slot")
    -- DECOMPILER ERROR at PC245: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (((control._itemSet)._itemSetBg)[index])._plus = {}
    -- DECOMPILER ERROR at PC257: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._plus)[1] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_Plus1")
    -- DECOMPILER ERROR at PC269: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._plus)[2] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_Plus2")
    -- DECOMPILER ERROR at PC274: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (((control._itemSet)._itemSetBg)[index])._count = {}
    -- DECOMPILER ERROR at PC286: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._count)[1] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_Count1")
    -- DECOMPILER ERROR at PC298: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._count)[2] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_Count2")
    -- DECOMPILER ERROR at PC309: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (((control._itemSet)._itemSetBg)[index])._noCarriage = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_NoCarriage")
  end
end

workerTradeCaravan.Show = function(self, index)
  -- function num : 0_3
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_WorkerTrade_Caravan, true)
  self:SetData(index)
end

workerTradeCaravan.SetData = function(self, index)
  -- function num : 0_4
  local player = getSelfPlayer()
  if not player then
    return 
  end
  local control = self.control
  ToClient_RequestClearTempInfo()
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index - 1)
  if tradeGroupWrapper == nil then
    return 
  end
  self._selectIndex = index - 1
  local stat = control._caravanStat
  local familyName = player:getUserNickname()
  local moveSpeed = tradeGroupWrapper:getTradeGroupMoveSpeed()
  local luck = tradeGroupWrapper:getTradeGroupLuck()
  local deffence = tradeGroupWrapper:getTradeGroupDefense()
  ;
  (stat._name):SetText("<" .. familyName .. ">�\128문의 상단")
  ;
  (stat._speed):SetText("이동속도 : " .. tostring(moveSpeed))
  ;
  (stat._luck):SetText("행운 : " .. tostring(luck))
  ;
  (stat._attack):SetText("공격�\165 : 0")
  ;
  (stat._defence):SetText("방어�\165 : " .. tostring(deffence))
  -- DECOMPILER ERROR at PC66: Confused about usage of register: R11 in 'UnsetPending'

  ;
  (self._selectedWorker)[0] = tradeGroupWrapper:getWorkerNo(0)
  if Int64toInt32((self._selectedWorker)[0]) > 0 then
    local workerWrapper = getWorkerWrapper((self._selectedWorker)[0], true)
    local workerName = workerWrapper:getName()
    ;
    (((control._worker)._image)[1]):ChangeTextureInfoName(workerWrapper:getWorkerIcon())
  else
    do
      ;
      (((control._worker)._image)[1]):ChangeTextureInfoName("/new_ui_common_forlua/window/trade/workertrade_00.dds")
      do
        local x1, y1, x2, y2 = setTextureUV_Func(((control._worker)._image)[1], 1, 1, 121, 121)
        ;
        ((((control._worker)._image)[1]):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((control._worker)._image)[1]):setRenderTexture((((control._worker)._image)[1]):getBaseTexture())
        -- DECOMPILER ERROR at PC128: Confused about usage of register: R11 in 'UnsetPending'

        ;
        (self._selectedWorker)[1] = tradeGroupWrapper:getWorkerNo(1)
        if Int64toInt32((self._selectedWorker)[1]) > 0 then
          local workerWrapper = getWorkerWrapper((self._selectedWorker)[1], true)
          local workerName = workerWrapper:getName()
          ;
          (((control._worker)._image)[2]):ChangeTextureInfoName(workerWrapper:getWorkerIcon())
        else
          do
            ;
            (((control._worker)._image)[2]):ChangeTextureInfoName("/new_ui_common_forlua/window/trade/workertrade_00.dds")
            do
              local x1, y1, x2, y2 = setTextureUV_Func(((control._worker)._image)[2], 1, 1, 121, 121)
              ;
              ((((control._worker)._image)[2]):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (((control._worker)._image)[2]):setRenderTexture((((control._worker)._image)[2]):getBaseTexture())
              self:AssetUpdate(index)
              if tradeGroupWrapper:getState() == 4 then
                local startRegionInfo = tradeGroupWrapper:getCurrentRegion()
                ;
                ((control._routerNode)._btnStartNode):SetText(startRegionInfo:getAreaName())
              else
                do
                  local startRegionInfo = tradeGroupWrapper:getStartRegion()
                  ;
                  ((control._routerNode)._btnStartNode):SetText(startRegionInfo:getAreaName())
                  local arrivalRegionInfo = tradeGroupWrapper:getDestinationRegion()
                  local arrivalWayPointKey = ((control._routerNode)._btnArrivalNode):SetText(arrivalRegionInfo:getAreaName())
                  local routeNodeCount = tradeGroupWrapper:getEventNodeCount()
                  for rIndex = 1, routeNodeCount do
                    local routeNodeInfo = tradeGroupWrapper:getEventNodeRegion(rIndex - 1)
                    ;
                    (((control._routerNode)._btnRouterNode)[index]):SetText(routeNodeInfo:getAreaName())
                  end
                  if routeNodeCount < 5 then
                    for rIndex = routeNodeCount + 1, 5 do
                      (((control._routerNode)._btnRouterNode)[index]):SetText("미설�\149")
                    end
                  end
                  do
                    local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
                    local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
                    local slotCount, totalWeight = 0, 0
                    local totalPrice = makeDotMoney(tradeGroupWrapper:getConsumePrice())
                    for iIndex = 1, 5 do
                      for slotIndex = 1, 2 do
                        if carriageCount < iIndex then
                          (((((control._itemSet)._itemSetBg)[iIndex])._itemSlotBg)[slotIndex]):SetShow(false)
                          ;
                          (((((control._itemSet)._itemSetBg)[iIndex])._itemSlot)[slotIndex]):SetShow(false)
                          ;
                          (((((control._itemSet)._itemSetBg)[iIndex])._plus)[slotIndex]):SetShow(false)
                          ;
                          (((((control._itemSet)._itemSetBg)[iIndex])._count)[slotIndex]):SetShow(false)
                          ;
                          ((((control._itemSet)._itemSetBg)[iIndex])._noCarriage):SetShow(true)
                          ;
                          (((((control._itemSet)._itemSetBg)[iIndex])._itemSlot)[slotIndex]):addInputEvent("Mouse_LUp", "")
                        else
                          ;
                          (((((control._itemSet)._itemSetBg)[iIndex])._itemSlotBg)[slotIndex]):SetShow(true)
                          ;
                          (((((control._itemSet)._itemSetBg)[iIndex])._itemSlot)[slotIndex]):SetShow(true)
                          ;
                          ((((control._itemSet)._itemSetBg)[iIndex])._noCarriage):SetShow(false)
                          local itemIndex = (iIndex - 1) * 2 + (slotIndex - 1)
                          local tradeItemWrapper = tradeGroupWrapper:getInventoryItem(itemIndex)
                          if tradeItemWrapper ~= nil then
                            local itemCount = Int64toInt32(tradeItemWrapper:getCount())
                            if itemCount > 0 then
                              (((((control._itemSet)._itemSetBg)[iIndex])._itemSlot)[slotIndex]):ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
                              ;
                              (((((control._itemSet)._itemSetBg)[iIndex])._count)[slotIndex]):SetShow(true)
                              ;
                              (((((control._itemSet)._itemSetBg)[iIndex])._count)[slotIndex]):SetText(itemCount)
                              ;
                              (((((control._itemSet)._itemSetBg)[iIndex])._plus)[slotIndex]):SetShow(false)
                              slotCount = slotCount + 1
                              totalWeight = totalWeight + tradeItemWrapper:getWeight() * itemCount
                            else
                              ;
                              (((((control._itemSet)._itemSetBg)[iIndex])._itemSlot)[slotIndex]):ChangeTextureInfoName("")
                              ;
                              (((((control._itemSet)._itemSetBg)[iIndex])._count)[slotIndex]):SetShow(false)
                              ;
                              (((((control._itemSet)._itemSetBg)[iIndex])._plus)[slotIndex]):SetShow(true)
                            end
                          else
                            do
                              do
                                ;
                                (((((control._itemSet)._itemSetBg)[iIndex])._itemSlot)[slotIndex]):ChangeTextureInfoName("")
                                ;
                                (((((control._itemSet)._itemSetBg)[iIndex])._count)[slotIndex]):SetShow(false)
                                ;
                                (((((control._itemSet)._itemSetBg)[iIndex])._plus)[slotIndex]):SetShow(true)
                                ;
                                (((((control._itemSet)._itemSetBg)[iIndex])._itemSlot)[slotIndex]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SelectItem(" .. itemIndex .. ")")
                                -- DECOMPILER ERROR at PC457: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC457: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                -- DECOMPILER ERROR at PC457: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC457: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                -- DECOMPILER ERROR at PC457: LeaveBlock: unexpected jumping out IF_STMT

                              end
                            end
                          end
                        end
                      end
                    end
                    local maxWeight = tradeGroupWrapper:getTradeGroupTransportCapacity()
                    ;
                    (control._itemWeight):SetText(makeDotMoney(totalWeight) .. " / " .. makeDotMoney(maxWeight))
                    ;
                    (control._tradePrice):SetText(makeDotMoney(totalPrice))
                    ;
                    (control._list2TradeWorker):SetShow(false)
                    ;
                    (control._list2TradeItem):SetShow(false)
                    ;
                    (control._list2ArrivalNode):SetShow(false)
                    ;
                    (control._list2RouteNode):SetShow(false)
                    self._currentSelectRouteNodeCount = ToClient_GetWorkerTradeEventNodeCount(startWayPointKey)
                    self._routeNodeIndex = 0
                    self._currentSelectRouteNodeList = {}
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

workerTradeCaravan.AssetUpdate = function(self, index)
  -- function num : 0_5
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index - 1)
  if tradeGroupWrapper == nil then
    return 
  end
  local groupPorterCount = tradeCompanyWrapper:getTradeCompanyPorter()
  local groupGuardCount = tradeCompanyWrapper:getTradeCompanyGuard()
  local groupCarriageCount = tradeCompanyWrapper:getTradeCompanyCarriage()
  local groupAmuletCount = tradeCompanyWrapper:getTradeCompanyAmulet()
  local porterCount = tradeGroupWrapper:getTradeGroupPorter()
  local guardCount = tradeGroupWrapper:getTradeGroupGuard()
  local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
  local amuletCount = tradeGroupWrapper:getTradeGroupAmulet()
  local control = self.control
  ;
  ((control._asset)._carriage):SetText("마차 : " .. groupCarriageCount)
  ;
  ((control._asset)._worker):SetText("짐꾼 : " .. groupPorterCount)
  ;
  ((control._asset)._guard):SetText("호위 : " .. groupGuardCount)
  ;
  ((control._asset)._FA):SetText("행운�\128�\129 : " .. groupAmuletCount)
  ;
  ((control._asset)._carriageCount):SetText(carriageCount)
  ;
  ((control._asset)._workerCount):SetText(porterCount)
  ;
  ((control._asset)._guardCount):SetText(guardCount)
  ;
  ((control._asset)._FACount):SetText(amuletCount)
  local maxPorterCount = carriageCount * self._maxWorkerCount
  if maxPorterCount < porterCount then
    ToClient_RequestSetPorterInTradeGroup(self._selectIndex, maxPorterCount)
  end
end

WorkerTrade_SetAsset = function(assetType, increaseCount)
  -- function num : 0_6 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(self._selectIndex)
  if tradeGroupWrapper == nil then
    return 
  end
  local groupPorterCount = tradeCompanyWrapper:getTradeCompanyPorter()
  local groupGuardCount = tradeCompanyWrapper:getTradeCompanyGuard()
  local groupCarriageCount = tradeCompanyWrapper:getTradeCompanyCarriage()
  local groupAmuletCount = tradeCompanyWrapper:getTradeCompanyAmulet()
  local porterCount = tradeGroupWrapper:getTradeGroupPorter()
  local guardCount = tradeGroupWrapper:getTradeGroupGuard()
  local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
  local amuletCount = tradeGroupWrapper:getTradeGroupAmulet()
  if assetType == 0 then
    carriageCount = carriageCount + increaseCount
    if carriageCount < 0 and increaseCount == -1 then
      Proc_ShowMessage_Ack("�\148 이상 회수�\160 마차�\128 없습니다.")
      return 
    end
    if self._maxCarriageCount < carriageCount then
      Proc_ShowMessage_Ack("�\148 이상 마차�\188 배치�\160 �\152 없습니다.")
      return 
    end
    if groupCarriageCount == 0 and increaseCount == 1 then
      Proc_ShowMessage_Ack("�\148 이상 배치�\160 마차�\128 없습니다.")
      return 
    end
    ToClient_RequestSetCarriageInTradeGroup(self._selectIndex, carriageCount)
  else
    if assetType == 1 then
      porterCount = porterCount + increaseCount
      if porterCount < 0 and increaseCount == -1 then
        Proc_ShowMessage_Ack("�\148 이상 회수�\160 짐꾼�\180 없습니다.")
        return 
      end
      if (carriageCount) * self._maxWorkerCount < porterCount then
        Proc_ShowMessage_Ack("마차�\128 �\128족해 �\148 이상 짐꾼�\132 배치�\160 �\152 없습니다.")
        return 
      end
      if groupPorterCount == 0 and increaseCount == 1 then
        Proc_ShowMessage_Ack("�\148 이상 배치�\160 짐꾼�\180 없습니다.")
        return 
      end
      ToClient_RequestSetPorterInTradeGroup(self._selectIndex, porterCount)
    else
      if assetType == 2 then
        guardCount = guardCount + increaseCount
        if guardCount < 0 and increaseCount == -1 then
          Proc_ShowMessage_Ack("�\148 이상 회수�\160 호위�\128 없습니다.")
          return 
        end
        if self._maxGuardCount < guardCount then
          Proc_ShowMessage_Ack("�\148 이상 호위�\188 배치�\160 �\152 없습니다.")
          return 
        end
        if groupGuardCount == 0 and increaseCount == 1 then
          Proc_ShowMessage_Ack("�\148 이상 배치�\160 호위�\128 없습니다.")
          return 
        end
        ToClient_RequestSetGuardInTradeGroup(self._selectIndex, guardCount)
      else
        if assetType == 3 then
          amuletCount = amuletCount + increaseCount
          if amuletCount < 0 and increaseCount == -1 then
            Proc_ShowMessage_Ack("�\148 이상 회수�\160 행운�\128적이 없습니다.")
            return 
          end
          if self._maxFACount < amuletCount then
            Proc_ShowMessage_Ack("�\148 이상 행운�\128적을 배치�\160 �\152 없습니다.")
            return 
          end
          if groupAmuletCount == 0 and increaseCount == 1 then
            Proc_ShowMessage_Ack("�\148 이상 배치�\160 행운�\128적이 없습니다.")
            return 
          end
          ToClient_RequestSetAmuletInTradeGroup(self._selectIndex, amuletCount)
        end
      end
    end
  end
end

FGlobal_WorkerTradeCaravan_SetData = function()
  -- function num : 0_7 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  self:SetData(self._selectIndex + 1)
end

FGlobal_WorkerTradeCaravan_Show = function(index)
  -- function num : 0_8 , upvalues : workerTradeCaravan
  workerTradeCaravan:Show(index)
end

workerTradeCaravan.Hide = function(self)
  -- function num : 0_9
  WorldMapPopupManager:pop()
end

FGlobal_WorkerTradeCaravan_Hide = function()
  -- function num : 0_10 , upvalues : workerTradeCaravan
  workerTradeCaravan:Hide()
end

WorkerTradeCaravan_Set = function(index)
  -- function num : 0_11 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index - 1)
  self:SetData(index)
end

local clickedWorkerIndex = 0
WorkerTradeCaravan_SetWorker = function(index)
  -- function num : 0_12 , upvalues : workerTradeCaravan, clickedWorkerIndex
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 일꾼�\132 �\128경할 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local control = self.control
  local plantConut = ToCleint_getHomePlantKeyListCount()
  local startWayPointKey = 1101
  local workerCount = 0
  ;
  ((control._list2TradeWorker):getElementManager()):clearKey()
  for plantIdx = 0, plantConut - 1 do
    local plantKeyRaw = ToCleint_getHomePlantKeyListByIndex(plantIdx)
    if startWayPointKey == plantKeyRaw then
      local plantKey = ToClient_convertWaypointKeyToPlantKey(startWayPointKey)
      local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(plantKey, 0)
      local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(plantKey)
      for workerIndex = 0, waitWorkerCount - 1 do
        local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(plantKey, workerIndex)
        if (self._selectedWorker)[0] ~= workerNoRaw and (self._selectedWorker)[1] ~= workerNoRaw then
          ((control._list2TradeWorker):getElementManager()):pushKey(toInt64(0, workerIndex))
          workerCount = workerCount + 1
        end
      end
    end
  end
  if workerCount == 0 then
    Proc_ShowMessage_Ack("상단�\144 배치�\160 일꾼�\180 없습니다.")
    return 
  end
  ;
  (control._list2TradeWorker):SetShow(true)
  ;
  (control._list2TradeItem):SetShow(false)
  ;
  (control._list2ArrivalNode):SetShow(false)
  ;
  (control._list2RouteNode):SetShow(false)
  clickedWorkerIndex = index
end

TradeWorkerListControlCreate = function(content, key)
  -- function num : 0_13 , upvalues : workerTradeCaravan
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
          if (self._selectedWorker)[0] ~= workerNoRaw and (self._selectedWorker)[1] ~= workerNoRaw then
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
  -- function num : 0_14 , upvalues : workerTradeCaravan, clickedWorkerIndex
  local self = workerTradeCaravan
  ToClient_RequestSetWorker(self._selectIndex, clickedWorkerIndex, workerNo)
  ;
  ((self.control).list2_TradeWorkerList):SetShow(false)
end

TradeWorker_FireWorker = function(index)
  -- function num : 0_15 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  ToClient_RequestUnsetWorker(self._selectIndex, index)
end

WorkerTradeCaravan_ShowArrivalNodeList = function()
  -- function num : 0_16 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 목적�\128�\188 설정�\160 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local control = self.control
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  ;
  ((control._list2ArrivalNode):getElementManager()):clearKey()
  local arrivalNodeCount = ToClient_GetWorkerTradeMainNodeCount(startWayPointKey)
  local count = 0
  for index = 0, arrivalNodeCount - 1 do
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, index)
    if regionInfo ~= nil then
      ((control._list2ArrivalNode):getElementManager()):pushKey(toInt64(0, index))
      count = count + 1
    end
  end
  if count == 0 then
    Proc_ShowMessage_Ack("연결�\156 목적�\128�\128 없습니다.")
    return 
  end
  ;
  (control._list2TradeWorker):SetShow(false)
  ;
  (control._list2ArrivalNode):SetShow(true)
  ;
  (control._list2RouteNode):SetShow(false)
  ;
  (control._list2TradeItem):SetShow(false)
end

ArrivalNodeList_Set = function(index)
  -- function num : 0_17 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local control = self.control
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, index)
  ;
  ((control._routerNode)._btnArrivalNode):SetText(regionInfo:getAreaName())
  ;
  (control._list2ArrivalNode):SetShow(false)
  self._selectArrNodeIndex = index
  ToClient_RequestSetDestination(regionInfo:getExplorationKey())
end

ArrivalNodeListControlCreate = function(content, key)
  -- function num : 0_18 , upvalues : workerTradeCaravan
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
  -- function num : 0_19 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 경유�\128�\188 설정�\160 �\152 있습니다.")
    return 
  end
  local self = workerTradeCaravan
  local control = self.control
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  local count = 0
  ;
  ((control._list2RouteNode):getElementManager()):clearKey()
  local routeNodeCount = ToClient_GetWorkerTradeEventNodeCount(startWayPointKey)
  for index = 0, routeNodeCount - 1 do
    local regionInfo = ToClient_GetWorkerTradeEventNodeByIndex(startWayPointKey, index)
    if regionInfo ~= nil and RouteNodeCompare(regionInfo:getAreaName()) then
      ((control._list2RouteNode):getElementManager()):pushKey(toInt64(0, index))
      count = count + 1
    end
  end
  if count == 0 then
    Proc_ShowMessage_Ack("�\148 이상 연결�\156 거점�\180 없어 설정�\160 �\152 없습니다.")
    return 
  end
  ;
  (control._list2TradeWorker):SetShow(false)
  ;
  (control._list2ArrivalNode):SetShow(false)
  ;
  (control._list2RouteNode):SetShow(true)
  ;
  (control._list2TradeItem):SetShow(false)
end

RouteNodeList_Set = function(index, currentRouteNodeIndex)
  -- function num : 0_20 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local control = self.control
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  local regionInfo = ToClient_GetWorkerTradeEventNodeByIndex(startWayPointKey, index)
  if currentRouteNodeIndex == nil then
    self._routeNodeIndex = self._routeNodeIndex + 1
    ;
    (((control._routerNode)._btnRouterNode)[self._routeNodeIndex]):SetText(regionInfo:getAreaName())
    ;
    (control._list2RouteNode):SetShow(false)
    ;
    (table.insert)(self._currentSelectRouteNodeList, regionInfo:getAreaName())
    ToClient_RequestSetEventNode(self._routeNodeIndex - 1, regionInfo:getExplorationKey())
  end
end

RouteNodeListControlCreate = function(content, key)
  -- function num : 0_21 , upvalues : workerTradeCaravan
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
        self._currentSelectRouteNodeCount = self._currentSelectRouteNodeCount - 1
        break
      end
    end
  end
end

RouteNodeCompare = function(areaName)
  -- function num : 0_22 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  if self._currentSelectRouteNodeList == nil then
    return true
  end
  for v,name in pairs(self._currentSelectRouteNodeList) do
    if areaName == name then
      return false
    end
  end
  return true
end

local _slotIndex = nil
WorkerTradeCaravan_SelectItem = function(slotIndex)
  -- function num : 0_23 , upvalues : _slotIndex
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 무역품을 구입�\160 �\152 있습니다.")
    return 
  end
  _slotIndex = slotIndex
  ToClient_RequestOpenWorkerTrade()
end

FromClient_OpenWorkerTrade = function()
  -- function num : 0_24 , upvalues : workerTradeCaravan, _slotIndex
  local self = workerTradeCaravan
  local control = self.control
  local startWayPointKey = (WorkerTradeCaravan_StartWayPointKey())
  local destWayPointKey = nil
  if self._selectArrNodeIndex == -1 then
    destWayPointKey = startWayPointKey
  else
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, self._selectArrNodeIndex)
    destWayPointKey = regionInfo:getExplorationKey()
  end
  do
    ;
    ((control._list2TradeItem):getElementManager()):clearKey()
    local buyableItemCount = ToClient_RequestBuyableWorkerTradeItemCount(startWayPointKey)
    for index = 0, buyableItemCount - 1 do
      if (self.tradeItemInfo)[_slotIndex] ~= index and WorkerTradeCaravan_ItemCheck(index) then
        ((control._list2TradeItem):getElementManager()):pushKey(toInt64(0, index))
      end
      ;
      ((control._list2TradeItem):getElementManager()):pushKey(toInt64(0, index))
    end
    ;
    (control._list2TradeWorker):SetShow(false)
    ;
    (control._list2ArrivalNode):SetShow(false)
    ;
    (control._list2RouteNode):SetShow(false)
    ;
    (control._list2TradeItem):SetShow(true)
  end
end

WorkerTradeCaravan_ItemCheck = function(index)
  -- function num : 0_25 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  for slotIndex = 0, #self.tradeItemInfo do
    if index == (self.tradeItemInfo)[slotIndex] then
      return false
    end
  end
  return true
end

TradeItemListControlCreate = function(content, key)
  -- function num : 0_26 , upvalues : workerTradeCaravan
  local optionListBg = (UI.getChildControl)(content, "List2_OptionList_Bg")
  local slotBg = (UI.getChildControl)(content, "Static_Slot_BG")
  local slot = (UI.getChildControl)(content, "Static_Slot")
  local itemName = (UI.getChildControl)(content, "List2_OptionList_Name")
  local priceRate = (UI.getChildControl)(content, "List2_OptionList_PriceRate")
  local sellPrice = (UI.getChildControl)(content, "List2_OptionList_SellPrice")
  local weight = (UI.getChildControl)(content, "List2_OptionList_Weight")
  local btnPlus = (UI.getChildControl)(content, "Static_Plus")
  local btnMinus = (UI.getChildControl)(content, "Static_Minus")
  local self = workerTradeCaravan
  local _key = Int64toInt32(key)
  local startWayPointKey = (WorkerTradeCaravan_StartWayPointKey())
  local destWayPointKey = nil
  if self._selectArrNodeIndex == -1 then
    destWayPointKey = startWayPointKey
  else
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, self._selectArrNodeIndex)
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
          sellPrice:SetText("구입 : " .. makeDotMoney(tradeItemWrapper:getBuyPrice()) .. "코인")
          weight:SetText("무게 : " .. makeDotMoney(tradeItemWrapper:getWeight()) .. "LT")
          btnPlus:addInputEvent("Mouse_LUp", "WorkerTradeCaravan_BuyItem(" .. index .. "," .. 1 .. ")")
          btnPlus:addInputEvent("Mouse_LUp", "WorkerTradeCaravan_BuyItem(" .. index .. "," .. -1 .. ")")
          local arrivalNode_TradeItemWrapper = ToClient_RequestWorkerTradeItemMaster(destWayPointKey, index)
          if arrivalNode_TradeItemWrapper ~= nil then
            sellPrice:SetText("구매 : " .. makeDotMoney(arrivalNode_TradeItemWrapper:getContractedPrice()) .. "코인")
          end
          break
        end
      end
    end
  end
end

WorkerTradeCaravan_BuyItem = function(index, addCount)
  -- function num : 0_27 , upvalues : workerTradeCaravan, _slotIndex
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(workerTradeCaravan._selectIndex)
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  local canBuyItem = false
  local startWayPointKey = (WorkerTradeCaravan_StartWayPointKey())
  local destWayPointKey = nil
  if self._selectArrNodeIndex == -1 then
    destWayPointKey = startWayPointKey
  else
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, self._selectArrNodeIndex)
    destWayPointKey = regionInfo:getExplorationKey()
  end
  do
    local tradeItemWrapper = ToClient_RequestWorkerTradeItemMaster(startWayPointKey, index)
    local maxCount = (math.floor)(Int64toInt32(coinCount / tradeItemWrapper:getBuyPrice()))
    local setTradeItem = function(inputNumber)
    -- function num : 0_27_0 , upvalues : _slotIndex, tradeItemWrapper, tradeGroupWrapper, canBuyItem, workerTradeCaravan, startWayPointKey, destWayPointKey, self, index, tradeCompanyWrapper
    if _slotIndex == nil then
      return 
    end
    local slotIndex = (math.floor)((_slotIndex - 1) / 2) + 1
    local uiIndex = (math.floor)((_slotIndex - 1) % 2) + 1
    local itemKey = tradeItemWrapper:getKey()
    local maxWeight = tradeGroupWrapper:getTradeGroupTransportCapacity()
    canBuyItem = ToClient_RequestAddCart(workerTradeCaravan._selectIndex, _slotIndex - 1, itemKey, inputNumber, startWayPointKey, destWayPointKey)
    if canBuyItem == true then
      local control = self.control
      ;
      (((((control._itemSet)._itemSetBg)[slotIndex])._itemSlot)[uiIndex]):ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
      ;
      (((((control._itemSet)._itemSetBg)[slotIndex])._count)[uiIndex]):SetShow(true)
      ;
      (((((control._itemSet)._itemSetBg)[slotIndex])._count)[uiIndex]):SetText(tostring(inputNumber))
      -- DECOMPILER ERROR at PC74: Confused about usage of register: R6 in 'UnsetPending'

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
      (control._list2TradeItem):SetShow(false)
    end
  end

    Panel_NumberPad_Show(true, toInt64(0, maxCount), 0, setTradeItem)
  end
end

WorkerTradeCaravan_Go = function()
  -- function num : 0_28 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack("상단�\180 �\128기중�\188 때만 출발�\160 �\152 있습니다..")
    return 
  end
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(workerTradeCaravan._selectIndex)
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
  ToClient_RequestStartTradeGroup(workerTradeCaravan._selectIndex)
end

WorkerTradeCaravan_StartWayPointKey = function()
  -- function num : 0_29 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(self._selectIndex)
  if tradeGroupWrapper == nil then
    return 
  end
  local startRegionInfo = tradeGroupWrapper:getCurrentRegion()
  local startWayPointKey = startRegionInfo:getExplorationKey()
  return startWayPointKey
end

WorkerTradeCarava_SetPorter = function()
  -- function num : 0_30 , upvalues : workerTradeCaravan
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
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(self._selectIndex)
  local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
  local hirableCount = maxHaveCount - (hiredCount)
  hirableCount = (math.min)(hirableCount, carriageCount * self.maxWorkerCount)
  local setPorter = function(inputNumber)
    -- function num : 0_30_0 , upvalues : self
    ToClient_RequestSetPorterInTradeGroup(self._selectIndex, Int64toInt32(inputNumber))
  end

  if hirableCount > 0 then
    Panel_NumberPad_Show(true, toInt64(0, hirableCount), 0, setPorter)
  else
    Proc_ShowMessage_Ack("고용�\160 �\152 있는 짐꾼�\180 없습니다.")
  end
end

WorkerTradeCarava_SetGuard = function()
  -- function num : 0_31 , upvalues : workerTradeCaravan
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
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(self._selectIndex)
  local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
  local hirableCount = maxHaveCount - (hiredCount)
  hirableCount = (math.min)(hirableCount, carriageCount)
  local setGuard = function(inputNumber)
    -- function num : 0_31_0 , upvalues : self
    ToClient_RequestSetGuardInTradeGroup(self._selectIndex, Int64toInt32(inputNumber))
  end

  if hirableCount > 0 then
    Panel_NumberPad_Show(true, toInt64(0, hirableCount), 0, setGuard)
  else
    Proc_ShowMessage_Ack("고용�\160 �\152 있는 호위�\128 없습니다.")
  end
end

WorkerTradeCarava_SetCarriage = function()
  -- function num : 0_32 , upvalues : workerTradeCaravan
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
    -- function num : 0_32_0 , upvalues : self
    ToClient_RequestSetCarriageInTradeGroup(self._selectIndex, Int64toInt32(inputNumber))
  end

  if hirableCount > 0 then
    Panel_NumberPad_Show(true, toInt64(0, hirableCount), 0, setCarriage)
  else
    Proc_ShowMessage_Ack("고용�\160 �\152 있는 마차�\128 없습니다.")
  end
end

WorkerTradeCarava_SetAmulet = function()
  -- function num : 0_33 , upvalues : workerTradeCaravan
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
    -- function num : 0_33_0 , upvalues : self
    ToClient_RequestSetAmuletInTradeGroup(self._selectIndex, Int64toInt32(inputNumber))
  end

  if hirableCount > 0 then
    Panel_NumberPad_Show(true, toInt64(0, hirableCount), 0, setAmulet)
  else
    Proc_ShowMessage_Ack("적재�\160 �\152 있는 행운 �\128적이 없습니다.")
  end
end

isChangeableState = function()
  -- function num : 0_34 , upvalues : workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(workerTradeCaravan._selectIndex)
  local currentState = tradeGroupWrapper:getState()
  if currentState == 4 then
    return true
  else
    return false
  end
end

FGlobal_WorkerTradeCaraven_Open = function(index)
  -- function num : 0_35 , upvalues : workerTradeCaravan
  if Panel_WorkerTrade_Caravan:GetShow() then
    workerTradeCaravan:Hide()
  else
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    workerTradeCaravan._caravanIndex = index
    workerTradeCaravan:Show(index)
  end
end

workerTradeCaravan.registerEvent = function(self)
  -- function num : 0_36
  local control = self.control
  ;
  (((control._worker)._image)[1]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SetWorker(" .. 0 .. ")")
  ;
  (((control._worker)._image)[2]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SetWorker(" .. 1 .. ")")
  ;
  ((control._asset)._btnCarriage):addInputEvent("Mouse_LUp", "WorkerTrade_SetAsset(" .. 0 .. "," .. -1 .. ")")
  ;
  ((control._asset)._btnCarriage):addInputEvent("Mouse_RUp", "WorkerTrade_SetAsset(" .. 0 .. "," .. 1 .. ")")
  ;
  ((control._asset)._btnWorker):addInputEvent("Mouse_LUp", "WorkerTrade_SetAsset(" .. 1 .. "," .. -1 .. ")")
  ;
  ((control._asset)._btnWorker):addInputEvent("Mouse_RUp", "WorkerTrade_SetAsset(" .. 1 .. "," .. 1 .. ")")
  ;
  ((control._asset)._btnGuard):addInputEvent("Mouse_LUp", "WorkerTrade_SetAsset(" .. 2 .. "," .. -1 .. ")")
  ;
  ((control._asset)._btnGuard):addInputEvent("Mouse_RUp", "WorkerTrade_SetAsset(" .. 2 .. "," .. 1 .. ")")
  ;
  ((control._asset)._btnFA):addInputEvent("Mouse_LUp", "WorkerTrade_SetAsset(" .. 3 .. "," .. -1 .. ")")
  ;
  ((control._asset)._btnFA):addInputEvent("Mouse_RUp", "WorkerTrade_SetAsset(" .. 3 .. "," .. 1 .. ")")
  ;
  (control._list2TradeWorker):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "TradeWorkerListControlCreate")
  ;
  (control._list2TradeWorker):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((control._routerNode)._btnArrivalNode):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_ShowArrivalNodeList()")
  ;
  (control._list2ArrivalNode):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ArrivalNodeListControlCreate")
  ;
  (control._list2ArrivalNode):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  for index = 1, 5 do
    (((control._routerNode)._btnRouterNode)[index]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_RouteNodeSet()")
  end
  ;
  (control._list2RouteNode):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "RouteNodeListControlCreate")
  ;
  (control._list2RouteNode):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (control._list2TradeItem):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "TradeItemListControlCreate")
  ;
  (control._list2TradeItem):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  registerEvent("FromClient_OpenWorkerTrade", "FromClient_OpenWorkerTrade")
end

workerTradeCaravan:ControlInit()
workerTradeCaravan:registerEvent()

