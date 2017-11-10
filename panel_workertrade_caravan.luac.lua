-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\workertrade\panel_workertrade_caravan.luac 

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
control = {_closeBtn = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Close"), _questionBtn = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_Question"), _caravanStatBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_CaravanStatBg"), _workerBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_WorkerBg"), _assetBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_AssetBg"), _itemSetBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_ItemSetBg"), _itemWeight = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_WeightIcon"), 
_routerNode = {_btnStartNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_StartNode"), _btnArrivalNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_ArrivalNode"), 
_btnRouterNode = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_RouteNode5")}
}
, _list2TradeWorker = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_TradeWorkerList"), _list2TradeItem = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_TradeItemList"), _list2ArrivalNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_ArrivalNodeList"), _list2RouteNode = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "List2_RouteNodeList"), _itemListBg = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_ItemListBg"), 
_tradeItemSlotBg = {}
, 
_tradeItemSlot = {}
, _tradePrice = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "StaticText_TradePrice"), _btnTradeStart = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Button_TradeStart"), _tooltip = (UI.getChildControl)(Panel_WorkerTrade_Caravan, "Static_ItemTooltipBg"), 
_caravanStat = {}
, 
_worker = {}
, 
_asset = {}
, 
_itemSet = {}
, 
_tooltipItem = {}
}
, 
_selectedWorker = {[0] = (Defines.u64_const).u64_0, [1] = (Defines.u64_const).u64_0}
, _caravanIndex = -1, _selectIndex = -1, _selectArrNodeIndex = -1, _routeNodeIndex = 0, _selectRouteNodeIndex = 0, _currentSelectRouteNodeCount = 0, 
_currentSelectRouteNodeList = {}
, _allWeight = 0, _allPrice = 0, _maxCarriageCount = 5, _minCarriageCount = 1, _maxWorkerCount = 3, _minWorkerCount = 2, _maxGuardCount = 3, _maxFACount = 3, 
tradeItemInfo = {}
, _maxItemCount = 30, 
_itemCountInSlot = {}
}
workerTradeCaravan.ControlInit = function(self)
  -- function num : 0_2
  local control = self.control
  control._caravanStat = {_image = (UI.getChildControl)(control._caravanStatBg, "Static_CaravanImage"), _name = (UI.getChildControl)(control._caravanStatBg, "StaticText_CaravanName"), _speed = (UI.getChildControl)(control._caravanStatBg, "StaticText_Speed"), _luck = (UI.getChildControl)(control._caravanStatBg, "StaticText_Luck"), _defence = (UI.getChildControl)(control._caravanStatBg, "StaticText_Deffence")}
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
, _btnClose = (UI.getChildControl)(control._itemListBg, "Button_ItemListClose")}
  ;
  (control._itemListBg):SetShow(false)
  control._itemSlotBg = (UI.getChildControl)(control._itemListBg, "Static_SlotBg")
  ;
  (control._itemSlotBg):SetShow(false)
  control._itemSlot = (UI.getChildControl)(control._itemListBg, "Static_Slot")
  local rowCount = (math.ceil)(self._maxItemCount / 4)
  for index = 0, rowCount - 1 do
    for cIndex = 0, 3 do
      local realIndex = index * 4 + cIndex
      -- DECOMPILER ERROR at PC224: Confused about usage of register: R12 in 'UnsetPending'

      if realIndex < self._maxItemCount then
        (control._tradeItemSlotBg)[realIndex] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, control._itemListBg, "TradeItemBg_" .. realIndex)
        CopyBaseProperty(control._itemSlotBg, (control._tradeItemSlotBg)[realIndex])
        ;
        ((control._tradeItemSlotBg)[realIndex]):SetPosX(10 + 60 * cIndex)
        ;
        ((control._tradeItemSlotBg)[realIndex]):SetPosY(50 + 60 * index)
        ;
        ((control._tradeItemSlotBg)[realIndex]):SetShow(false)
        -- DECOMPILER ERROR at PC259: Confused about usage of register: R12 in 'UnsetPending'

        ;
        (control._tradeItemSlot)[realIndex] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (control._tradeItemSlotBg)[realIndex], "TradeItemSlot_" .. realIndex)
        CopyBaseProperty(control._itemSlot, (control._tradeItemSlot)[realIndex])
        ;
        ((control._tradeItemSlot)[realIndex]):SetPosX(2)
        ;
        ((control._tradeItemSlot)[realIndex]):SetPosY(2)
      end
    end
  end
  for index = 1, 5 do
    -- DECOMPILER ERROR at PC285: Confused about usage of register: R7 in 'UnsetPending'

    (((control._itemSet)._itemSetBg)[index])._itemSlotBg = {}
    -- DECOMPILER ERROR at PC297: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._itemSlotBg)[1] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "Static_ItemSlotBg1")
    -- DECOMPILER ERROR at PC309: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._itemSlotBg)[2] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "Static_ItemSlotBg2")
    -- DECOMPILER ERROR at PC314: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (((control._itemSet)._itemSetBg)[index])._itemSlot = {}
    -- DECOMPILER ERROR at PC328: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._itemSlot)[1] = (UI.getChildControl)(((((control._itemSet)._itemSetBg)[index])._itemSlotBg)[1], "Static_Slot")
    -- DECOMPILER ERROR at PC342: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._itemSlot)[2] = (UI.getChildControl)(((((control._itemSet)._itemSetBg)[index])._itemSlotBg)[2], "Static_Slot")
    -- DECOMPILER ERROR at PC347: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (((control._itemSet)._itemSetBg)[index])._plus = {}
    -- DECOMPILER ERROR at PC359: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._plus)[1] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_Plus1")
    -- DECOMPILER ERROR at PC371: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._plus)[2] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_Plus2")
    -- DECOMPILER ERROR at PC376: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (((control._itemSet)._itemSetBg)[index])._count = {}
    -- DECOMPILER ERROR at PC388: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._count)[1] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_Count1")
    -- DECOMPILER ERROR at PC400: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((((control._itemSet)._itemSetBg)[index])._count)[2] = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_Count2")
    -- DECOMPILER ERROR at PC411: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (((control._itemSet)._itemSetBg)[index])._noCarriage = (UI.getChildControl)(((control._itemSet)._itemSlotBg)[index], "StaticText_NoCarriage")
    -- DECOMPILER ERROR at PC417: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._itemCountInSlot)[(index - 1) * 2 + 1] = {}
    -- DECOMPILER ERROR at PC423: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._itemCountInSlot)[(index - 1) * 2 + 1])._count = 0
    -- DECOMPILER ERROR at PC429: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._itemCountInSlot)[(index - 1) * 2 + 1])._key = 0
    -- DECOMPILER ERROR at PC435: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._itemCountInSlot)[(index - 1) * 2 + 2] = {}
    -- DECOMPILER ERROR at PC441: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._itemCountInSlot)[(index - 1) * 2 + 2])._count = 0
    -- DECOMPILER ERROR at PC447: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._itemCountInSlot)[(index - 1) * 2 + 2])._key = 0
  end
  control._tooltipItem = {_slotBg = (UI.getChildControl)(control._tooltip, "Static_ItemSlotBg"), _slot = (UI.getChildControl)(control._tooltip, "Static_ItemSlot"), _name = (UI.getChildControl)(control._tooltip, "StaticText_ItemName"), _price = (UI.getChildControl)(control._tooltip, "StaticText_Price"), _weight = (UI.getChildControl)(control._tooltip, "StaticText_Weight")}
end

workerTradeCaravan.tradeItemInit = function(self)
  -- function num : 0_3
  for index = 1, 10 do
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R5 in 'UnsetPending'

    ((self._itemCountInSlot)[index])._count = 0
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._itemCountInSlot)[index])._key = 0
  end
end

workerTradeCaravan.Show = function(self, index)
  -- function num : 0_4
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_WorkerTrade_Caravan, true)
  ToClient_RequestClearTempInfo()
  self._selectArrNodeIndex = -1
  self._currentSelectRouteNodeList = {}
  self:tradeItemInit()
  self:SetData(index)
end

workerTradeCaravan.SetData = function(self, index)
  -- function num : 0_5
  local player = getSelfPlayer()
  if not player then
    return 
  end
  local control = self.control
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
  (stat._name):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_FAMILY", "name", familyName))
  ;
  (stat._speed):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SPEED", "speed", tostring(moveSpeed)))
  ;
  (stat._luck):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_LUCK", "luck", tostring(luck)))
  ;
  (stat._defence):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_DEFFENCE", "deffence", tostring(deffence)))
  -- DECOMPILER ERROR at PC75: Confused about usage of register: R11 in 'UnsetPending'

  ;
  (self._selectedWorker)[0] = tradeGroupWrapper:getWorkerNo(0)
  if Int64toInt32((self._selectedWorker)[0]) > 0 then
    local workerWrapper = getWorkerWrapper((self._selectedWorker)[0], true)
    local workerName = workerWrapper:getName()
    ;
    (((control._worker)._image)[1]):ChangeTextureInfoName(workerWrapper:getWorkerIcon())
    local x1, y1, x2, y2 = setTextureUV_Func(((control._worker)._image)[1], 14, 0, 294, 280)
    ;
    ((((control._worker)._image)[1]):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (((control._worker)._image)[1]):setRenderTexture((((control._worker)._image)[1]):getBaseTexture())
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
        -- DECOMPILER ERROR at PC167: Confused about usage of register: R11 in 'UnsetPending'

        ;
        (self._selectedWorker)[1] = tradeGroupWrapper:getWorkerNo(1)
        if Int64toInt32((self._selectedWorker)[1]) > 0 then
          local workerWrapper = getWorkerWrapper((self._selectedWorker)[1], true)
          local workerName = workerWrapper:getName()
          ;
          (((control._worker)._image)[2]):ChangeTextureInfoName(workerWrapper:getWorkerIcon())
          local x1, y1, x2, y2 = setTextureUV_Func(((control._worker)._image)[2], 14, 0, 294, 280)
          ;
          ((((control._worker)._image)[2]):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          (((control._worker)._image)[2]):setRenderTexture((((control._worker)._image)[2]):getBaseTexture())
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
              local startRegionInfo = tradeGroupWrapper:getStartRegion()
              if startRegionInfo ~= nil then
                ((control._routerNode)._btnStartNode):SetText(startRegionInfo:getAreaName())
              end
              local arrivalRegionInfo = tradeCompanyWrapper:ToClient_getDestinationRegion()
              if arrivalRegionInfo ~= nil then
                ((control._routerNode)._btnArrivalNode):SetText(arrivalRegionInfo:getAreaName())
              end
              local routeNodeCount = tradeCompanyWrapper:ToClient_getEventNodeCount()
              for rIndex = 1, routeNodeCount do
                local routeNodeInfo = tradeCompanyWrapper:ToClient_getEventNodeRegion(rIndex - 1)
                ;
                (((control._routerNode)._btnRouterNode)[rIndex]):SetText(routeNodeInfo:getAreaName())
              end
              if routeNodeCount < 5 then
                for rIndex = routeNodeCount + 1, 5 do
                  (((control._routerNode)._btnRouterNode)[rIndex]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WORKERTRADECARAVAN_ROUTENODETITLE_" .. rIndex))
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
                      local tradeItemWrapper = tradeCompanyWrapper:getTempInventoryItem(itemIndex)
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
                            ;
                            (((((control._itemSet)._itemSetBg)[iIndex])._itemSlot)[slotIndex]):addInputEvent("Mouse_RUp", "WorkerTradeCaravan_DecreaseItem(" .. itemIndex .. ")")
                            -- DECOMPILER ERROR at PC535: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC535: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                            -- DECOMPILER ERROR at PC535: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC535: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                            -- DECOMPILER ERROR at PC535: LeaveBlock: unexpected jumping out IF_STMT

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
                ;
                (control._itemListBg):SetShow(false)
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

workerTradeCaravan.AssetUpdate = function(self, index)
  -- function num : 0_6
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
  ((control._asset)._carriage):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_CARRIAGE", "count", groupCarriageCount))
  ;
  ((control._asset)._worker):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_PORTER", "count", groupPorterCount))
  ;
  ((control._asset)._guard):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_GUARD", "count", groupGuardCount))
  ;
  ((control._asset)._FA):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_FA", "count", groupAmuletCount))
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
  -- function num : 0_7 , upvalues : workerTradeCaravan
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
    do
      if carriageCount > 0 and increaseCount < 0 then
        local countIndex = (carriageCount - 1) * 2
        if ((self._itemCountInSlot)[countIndex + 1])._count > 0 or ((self._itemCountInSlot)[countIndex + 2])._count > 0 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_0"))
          return 
        end
      end
      carriageCount = carriageCount + increaseCount
      if carriageCount < 0 and increaseCount == -1 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_1"))
        return 
      end
      if self._maxCarriageCount < carriageCount then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_2"))
        return 
      end
      if groupCarriageCount == 0 and increaseCount == 1 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_3"))
        return 
      end
      ToClient_RequestSetCarriageInTradeGroup(self._selectIndex, carriageCount)
      if assetType == 1 then
        porterCount = porterCount + increaseCount
        if porterCount < 0 and increaseCount == -1 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_4"))
          return 
        end
        if (carriageCount) * self._maxWorkerCount < porterCount then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_5"))
          return 
        end
        if groupPorterCount == 0 and increaseCount == 1 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_6"))
          return 
        end
        ToClient_RequestSetPorterInTradeGroup(self._selectIndex, porterCount)
      else
        if assetType == 2 then
          guardCount = guardCount + increaseCount
          if guardCount < 0 and increaseCount == -1 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_7"))
            return 
          end
          if self._maxGuardCount < guardCount then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_8"))
            return 
          end
          if groupGuardCount == 0 and increaseCount == 1 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_9"))
            return 
          end
          ToClient_RequestSetGuardInTradeGroup(self._selectIndex, guardCount)
        else
          if assetType == 3 then
            amuletCount = amuletCount + increaseCount
            if amuletCount < 0 and increaseCount == -1 then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_10"))
              return 
            end
            if self._maxFACount < amuletCount then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_11"))
              return 
            end
            if groupAmuletCount == 0 and increaseCount == 1 then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_SETALERT_12"))
              return 
            end
            ToClient_RequestSetAmuletInTradeGroup(self._selectIndex, amuletCount)
          end
        end
      end
    end
  end
end

FGlobal_WorkerTradeCaravan_SetData = function()
  -- function num : 0_8 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  self:SetData(self._selectIndex + 1)
end

FGlobal_WorkerTradeCaravan_Show = function(index)
  -- function num : 0_9 , upvalues : workerTradeCaravan
  workerTradeCaravan:Show(index)
end

workerTradeCaravan.Hide = function(self)
  -- function num : 0_10
  WorldMapPopupManager:pop()
  WorkerTradeCaravan_TooltipHide()
  ;
  (((self.control)._routerNode)._btnArrivalNode):SetText("목적�\128")
end

FGlobal_WorkerTradeCaravan_Hide = function()
  -- function num : 0_11 , upvalues : workerTradeCaravan
  workerTradeCaravan:Hide()
end

WorkerTradeCaravan_Set = function(index)
  -- function num : 0_12 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index - 1)
  self:SetData(index)
end

local clickedWorkerIndex = 0
local setableWorkerCount = 0
WorkerTradeCaravan_SetWorker = function(index)
  -- function num : 0_13 , upvalues : workerTradeCaravan, setableWorkerCount, clickedWorkerIndex
  if ((workerTradeCaravan.control)._list2TradeWorker):GetShow() then
    ((workerTradeCaravan.control)._list2TradeWorker):SetShow(false)
    return 
  end
  if not isChangeableState() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_WORKERALERT_1"))
    return 
  end
  local self = workerTradeCaravan
  local control = self.control
  local plantConut = ToCleint_getHomePlantKeyListCount()
  local startWayPointKey = 1101
  setableWorkerCount = 0
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
        end
        setableWorkerCount = setableWorkerCount + 1
      end
    end
  end
  if Int64toInt32((self._selectedWorker)[index]) > 0 then
    setableWorkerCount = setableWorkerCount + 1
    ;
    ((control._list2TradeWorker):getElementManager()):pushKey(toInt64(0, setableWorkerCount))
  else
    if setableWorkerCount == 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_WORKERALERT_2"))
      return 
    end
  end
  ;
  (control._list2TradeWorker):SetShow(true)
  ;
  (control._list2TradeItem):SetShow(false)
  ;
  (control._list2ArrivalNode):SetShow(false)
  ;
  (control._list2RouteNode):SetShow(false)
  ;
  (control._itemListBg):SetShow(false)
  clickedWorkerIndex = index
end

local tempWorkerNo = {}
TradeWorkerListControlCreate = function(content, key)
  -- function num : 0_14 , upvalues : workerTradeCaravan, tempWorkerNo, setableWorkerCount, clickedWorkerIndex
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
        if (self._selectedWorker)[0] ~= workerNoRaw and (self._selectedWorker)[1] ~= workerNoRaw and _key == workerIndex then
          local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(plantKey, workerIndex)
          local workerWrapperLua = getWorkerWrapper(workerNoRaw, true)
          tradeWorkerName:SetText(tostring(workerWrapperLua:getName()))
          -- DECOMPILER ERROR at PC68: Confused about usage of register: R22 in 'UnsetPending'

          tempWorkerNo[workerIndex] = {}
          -- DECOMPILER ERROR at PC70: Confused about usage of register: R22 in 'UnsetPending'

          tempWorkerNo[workerIndex] = workerNoRaw
          workerListBg:addInputEvent("Mouse_LUp", "TradeWorker_SetWorker(" .. tostring(workerIndex) .. ")")
          break
        end
      end
      do
        do
          if _key == setableWorkerCount then
            tradeWorkerName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_BUTTONFIRE"))
            workerListBg:addInputEvent("Mouse_LUp", "TradeWorker_FireWorker(" .. clickedWorkerIndex .. ")")
          end
          -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

TradeWorker_SetWorker = function(workerIndex)
  -- function num : 0_15 , upvalues : workerTradeCaravan, clickedWorkerIndex, tempWorkerNo
  local self = workerTradeCaravan
  ToClient_RequestSetWorker(self._selectIndex, clickedWorkerIndex, tempWorkerNo[workerIndex])
  ;
  ((self.control)._list2TradeWorker):SetShow(false)
end

TradeWorker_FireWorker = function(index)
  -- function num : 0_16 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  ToClient_RequestUnsetWorker(self._selectIndex, index)
end

WorkerTradeCaravan_ShowArrivalNodeList = function()
  -- function num : 0_17 , upvalues : workerTradeCaravan
  if ((workerTradeCaravan.control)._list2ArrivalNode):GetShow() then
    ((workerTradeCaravan.control)._list2ArrivalNode):SetShow(false)
    return 
  end
  if not isChangeableState() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_ARRIVALALERT_1"))
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
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_ARRIVALALERT_2"))
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
  ;
  (control._itemListBg):SetShow(false)
end

ArrivalNodeList_Set = function(index)
  -- function num : 0_18 , upvalues : workerTradeCaravan
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
  -- function num : 0_19 , upvalues : workerTradeCaravan
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

WorkerTradeCaravan_RouteNodeSet = function(nodeIndex)
  -- function num : 0_20 , upvalues : workerTradeCaravan
  if ((workerTradeCaravan.control)._list2RouteNode):GetShow() then
    ((workerTradeCaravan.control)._list2RouteNode):SetShow(false)
    return 
  end
  if not isChangeableState() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_ROUTEALERT_1"))
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
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_ROUTEALERT_2"))
    return 
  end
  self._selectRouteNodeIndex = nodeIndex
  ;
  (control._list2TradeWorker):SetShow(false)
  ;
  (control._list2ArrivalNode):SetShow(false)
  ;
  (control._list2RouteNode):SetShow(true)
  ;
  (control._list2TradeItem):SetShow(false)
  ;
  (control._itemListBg):SetShow(false)
end

RouteNodeList_Set = function(index)
  -- function num : 0_21 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local control = self.control
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  local regionInfo = ToClient_GetWorkerTradeEventNodeByIndex(startWayPointKey, index)
  if self._routeNodeIndex < self._selectRouteNodeIndex then
    self._routeNodeIndex = self._routeNodeIndex + 1
    ;
    (((control._routerNode)._btnRouterNode)[self._routeNodeIndex]):SetText(regionInfo:getAreaName())
    ;
    (control._list2RouteNode):SetShow(false)
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._currentSelectRouteNodeList)[self._routeNodeIndex] = regionInfo:getAreaName()
    ToClient_RequestSetEventNode(self._routeNodeIndex - 1, regionInfo:getExplorationKey())
  else
    ;
    (((control._routerNode)._btnRouterNode)[self._selectRouteNodeIndex]):SetText(regionInfo:getAreaName())
    ;
    (control._list2RouteNode):SetShow(false)
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._currentSelectRouteNodeList)[self._selectRouteNodeIndex] = regionInfo:getAreaName()
    ToClient_RequestSetEventNode(self._selectRouteNodeIndex - 1, regionInfo:getExplorationKey())
  end
end

RouteNodeListControlCreate = function(content, key)
  -- function num : 0_22 , upvalues : workerTradeCaravan
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
  -- function num : 0_23 , upvalues : workerTradeCaravan
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
  -- function num : 0_24 , upvalues : _slotIndex
  if not isChangeableState() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_ITEMALERT"))
    return 
  end
  _slotIndex = slotIndex
  ToClient_RequestOpenWorkerTradeList()
end

WorkerTradeCaravan_DecreaseItem = function(slotIndex)
  -- function num : 0_25 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local control = self.control
  local _slotIndex = slotIndex
  local countIndex = _slotIndex + 1
  local carriageIndex = (math.ceil)(countIndex / 2)
  local uiIndex = slotIndex % 2 + 1
  if ((self._itemCountInSlot)[countIndex])._count == 0 then
    return 
  end
  local startWayPointKey = (WorkerTradeCaravan_StartWayPointKey())
  local destWayPointKey = nil
  if self._selectArrNodeIndex == -1 then
    destWayPointKey = startWayPointKey
  else
    local regionInfo = ToClient_GetWorkerTradeMainNodeByIndex(startWayPointKey, self._selectArrNodeIndex)
    destWayPointKey = regionInfo:getExplorationKey()
  end
  do
    local itemKey = ((self._itemCountInSlot)[countIndex])._key
    local rv = ((self._itemCountInSlot)[countIndex])._count - 1
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R11 in 'UnsetPending'

    if rv == 0 then
      ((self._itemCountInSlot)[countIndex])._key = rv
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R11 in 'UnsetPending'

      ;
      ((self._itemCountInSlot)[countIndex])._count = rv
      ;
      (((((control._itemSet)._itemSetBg)[carriageIndex])._count)[uiIndex]):SetShow(false)
      ;
      (((((control._itemSet)._itemSetBg)[carriageIndex])._plus)[uiIndex]):SetShow(true)
      ;
      (((((control._itemSet)._itemSetBg)[carriageIndex])._itemSlot)[uiIndex]):ChangeTextureInfoName("")
      ToClient_RequestAddCart(workerTradeCaravan._selectIndex, _slotIndex, itemKey, rv, startWayPointKey, destWayPointKey)
    else
      local canBuyItem = ToClient_RequestAddCart(workerTradeCaravan._selectIndex, _slotIndex, itemKey, rv, startWayPointKey, destWayPointKey)
      -- DECOMPILER ERROR at PC93: Confused about usage of register: R12 in 'UnsetPending'

      if canBuyItem then
        ((self._itemCountInSlot)[countIndex])._count = rv
        ;
        (((((control._itemSet)._itemSetBg)[carriageIndex])._count)[uiIndex]):SetText(((self._itemCountInSlot)[countIndex])._count)
      end
    end
    do
      local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
      local tradeGroupWrapper = tradeCompanyWrapper:getGroup(workerTradeCaravan._selectIndex)
      local maxWeight = tradeGroupWrapper:getTradeGroupTransportCapacity()
      local totalPrice = tradeCompanyWrapper:getTempTotalPrice()
      local totalWeight = tradeCompanyWrapper:getTempTotalWeight()
      ;
      (control._itemWeight):SetText(makeDotMoney(totalWeight) .. " / " .. makeDotMoney(maxWeight))
      ;
      (control._tradePrice):SetText(makeDotMoney(totalPrice))
    end
  end
end

FromClient_OpenWorkerTradeItemList = function()
  -- function num : 0_26 , upvalues : workerTradeCaravan
  if ((workerTradeCaravan.control)._list2TradeItem):GetShow() then
    ((workerTradeCaravan.control)._list2TradeItem):SetShow(false)
    return 
  end
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
    local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
    for index = 0, self._maxItemCount - 1 do
      if index < buyableItemCount then
        ((control._tradeItemSlotBg)[index]):SetShow(true)
        ;
        ((control._tradeItemSlot)[index]):SetShow(true)
        local tradeItemWrapper = ToClient_RequestWorkerTradeItemMaster(startWayPointKey, index)
        if tradeItemWrapper ~= nil then
          local itemKey = tradeItemWrapper:getKey()
          ;
          ((control._tradeItemSlot)[index]):ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
          ;
          ((control._tradeItemSlot)[index]):addInputEvent("Mouse_On", "WorkerTradeCaravan_TooltipShow(" .. index .. ",nil," .. itemKey .. ")")
          ;
          ((control._tradeItemSlot)[index]):addInputEvent("Mouse_Out", "WorkerTradeCaravan_TooltipHide()")
          ;
          ((control._tradeItemSlot)[index]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SetItem(" .. index .. "," .. 1 .. ")")
          ;
          ((control._tradeItemSlot)[index]):addInputEvent("Mouse_RUp", "WorkerTradeCaravan_SetItem(" .. index .. "," .. -1 .. ")")
        end
      else
        do
          do
            ;
            ((control._tradeItemSlotBg)[index]):SetShow(false)
            ;
            ((control._tradeItemSlot)[index]):SetShow(false)
            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    ;
    (control._itemListBg):SetShow(true)
    ;
    (control._itemListBg):SetSize((control._itemListBg):GetSizeX(), 50 + (math.ceil)(buyableItemCount / 4) * 60 + 40)
    ;
    (control._itemListBg):ComputePos()
    ;
    ((control._itemSet)._btnClose):ComputePos()
    ;
    (control._list2TradeWorker):SetShow(false)
    ;
    (control._list2ArrivalNode):SetShow(false)
    ;
    (control._list2RouteNode):SetShow(false)
    ;
    (control._list2TradeItem):SetShow(false)
  end
end

WorkerTradeCaravan_ItemListClose = function()
  -- function num : 0_27 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local control = self.control
  ;
  (control._itemListBg):SetShow(false)
end

WorkerTradeCaravan_SetItem = function(index, value)
  -- function num : 0_28 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local control = self.control
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local tradeGroupWrapper = tradeCompanyWrapper:getGroup(workerTradeCaravan._selectIndex)
  if tradeGroupWrapper == nil then
    return 
  end
  local carriageCount = tradeGroupWrapper:getTradeGroupCarriage()
  if carriageCount == 0 then
    return 
  end
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
    local itemKey = tradeItemWrapper:getKey()
    local maxWeight = tradeGroupWrapper:getTradeGroupTransportCapacity()
    local _slotIndex = -1
    local isSameItem = false
    for carriageIndex = 1, carriageCount do
      for uiIndex = 1, 2 do
        local countIndex = (carriageIndex - 1) * 2 + uiIndex
        local _slotIndex = countIndex - 1
        if itemKey == ((self._itemCountInSlot)[countIndex])._key then
          local rv = ((self._itemCountInSlot)[countIndex])._count + value
          -- DECOMPILER ERROR at PC66: Confused about usage of register: R25 in 'UnsetPending'

          if rv == 0 then
            ((self._itemCountInSlot)[countIndex])._key = rv
            -- DECOMPILER ERROR at PC69: Confused about usage of register: R25 in 'UnsetPending'

            ;
            ((self._itemCountInSlot)[countIndex])._count = rv
            ;
            (((((control._itemSet)._itemSetBg)[carriageIndex])._count)[uiIndex]):SetShow(false)
            ;
            (((((control._itemSet)._itemSetBg)[carriageIndex])._plus)[uiIndex]):SetShow(true)
            ;
            (((((control._itemSet)._itemSetBg)[carriageIndex])._itemSlot)[uiIndex]):ChangeTextureInfoName("")
            ;
            (((((control._itemSet)._itemSetBg)[carriageIndex])._itemSlot)[uiIndex]):addInputEvent("Mouse_On", "")
            ;
            (((((control._itemSet)._itemSetBg)[carriageIndex])._itemSlot)[uiIndex]):addInputEvent("Mouse_Out", "WorkerTradeCaravan_TooltipHide()")
            ToClient_RequestAddCart(workerTradeCaravan._selectIndex, _slotIndex, itemKey, rv, startWayPointKey, destWayPointKey)
          else
            local canBuyItem = ToClient_RequestAddCart(workerTradeCaravan._selectIndex, _slotIndex, itemKey, rv, startWayPointKey, destWayPointKey)
            -- DECOMPILER ERROR at PC135: Confused about usage of register: R26 in 'UnsetPending'

            if canBuyItem then
              ((self._itemCountInSlot)[countIndex])._count = rv
              ;
              (((((control._itemSet)._itemSetBg)[carriageIndex])._count)[uiIndex]):SetText(((self._itemCountInSlot)[countIndex])._count)
            end
          end
          do
            do
              isSameItem = true
              do break end
              -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
      if isSameItem then
        break
      end
    end
    do
      do
        if not isSameItem and value > 0 then
          local isEmptySlot = false
          for carriageIndex = 1, carriageCount do
            for uiIndex = 1, 2 do
              local countIndex = (carriageIndex - 1) * 2 + uiIndex
              local _slotIndex = countIndex - 1
              if ((self._itemCountInSlot)[countIndex])._count == 0 then
                local canBuyItem = ToClient_RequestAddCart(workerTradeCaravan._selectIndex, _slotIndex, itemKey, value, startWayPointKey, destWayPointKey)
                -- DECOMPILER ERROR at PC188: Confused about usage of register: R26 in 'UnsetPending'

                if canBuyItem then
                  ((self._itemCountInSlot)[countIndex])._key = itemKey
                  -- DECOMPILER ERROR at PC195: Confused about usage of register: R26 in 'UnsetPending'

                  ;
                  ((self._itemCountInSlot)[countIndex])._count = ((self._itemCountInSlot)[countIndex])._count + value
                  ;
                  (((((control._itemSet)._itemSetBg)[carriageIndex])._count)[uiIndex]):SetText(((self._itemCountInSlot)[countIndex])._count)
                  ;
                  (((((control._itemSet)._itemSetBg)[carriageIndex])._count)[uiIndex]):SetShow(true)
                  ;
                  (((((control._itemSet)._itemSetBg)[carriageIndex])._plus)[uiIndex]):SetShow(false)
                  ;
                  (((((control._itemSet)._itemSetBg)[carriageIndex])._itemSlot)[uiIndex]):ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
                  isEmptySlot = true
                  ;
                  (((((control._itemSet)._itemSetBg)[carriageIndex])._itemSlot)[uiIndex]):addInputEvent("Mouse_On", "WorkerTradeCaravan_TooltipShow(" .. carriageIndex .. "," .. uiIndex .. "," .. itemKey .. ")")
                  ;
                  (((((control._itemSet)._itemSetBg)[carriageIndex])._itemSlot)[uiIndex]):addInputEvent("Mouse_Out", "WorkerTradeCaravan_TooltipHide()")
                  break
                end
              end
            end
            do
              do
                if isEmptySlot then
                  break
                end
                -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out DO_STMT

              end
            end
          end
        end
        local maxWeight = tradeGroupWrapper:getTradeGroupTransportCapacity()
        local totalPrice = tradeCompanyWrapper:getTempTotalPrice()
        local totalWeight = tradeCompanyWrapper:getTempTotalWeight()
        ;
        (control._itemWeight):SetText(makeDotMoney(totalWeight) .. " / " .. makeDotMoney(maxWeight))
        ;
        (control._tradePrice):SetText(makeDotMoney(totalPrice))
      end
    end
  end
end

WorkerTradeCaravan_ItemCheck = function(index)
  -- function num : 0_29 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  for slotIndex = 0, #self.tradeItemInfo do
    if index == (self.tradeItemInfo)[slotIndex] then
      return false
    end
  end
  return true
end

TradeItemListControlCreate = function(content, key)
  -- function num : 0_30 , upvalues : workerTradeCaravan
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
          priceRate:SetText("시세 : " .. makeDotMoney(tradeItemWrapper:getPriceRate() + 100) .. "%")
          sellPrice:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_BUYPRICE", "price", makeDotMoney(tradeItemWrapper:getBuyPrice())))
          weight:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_WEIGHT", "weight", makeDotMoney(tradeItemWrapper:getWeight())))
          btnPlus:addInputEvent("Mouse_LUp", "WorkerTradeCaravan_BuyItem(" .. index .. "," .. 1 .. ")")
          btnMinus:addInputEvent("Mouse_LUp", "WorkerTradeCaravan_BuyItem(" .. index .. "," .. -1 .. ")")
          local arrivalNode_TradeItemWrapper = ToClient_RequestWorkerTradeItemMaster(destWayPointKey, index)
          break
        end
      end
    end
  end
end

WorkerTradeCaravan_BuyItem = function(index, addCount)
  -- function num : 0_31 , upvalues : workerTradeCaravan, _slotIndex
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
    -- function num : 0_31_0 , upvalues : _slotIndex, tradeItemWrapper, tradeGroupWrapper, canBuyItem, workerTradeCaravan, startWayPointKey, destWayPointKey, self, index, tradeCompanyWrapper
    if _slotIndex == nil then
      return 
    end
    local slotIndex = (math.floor)(_slotIndex / 2) + 1
    local uiIndex = (math.floor)(_slotIndex % 2) + 1
    local itemKey = tradeItemWrapper:getKey()
    local maxWeight = tradeGroupWrapper:getTradeGroupTransportCapacity()
    canBuyItem = ToClient_RequestAddCart(workerTradeCaravan._selectIndex, _slotIndex, itemKey, inputNumber, startWayPointKey, destWayPointKey)
    if canBuyItem == true then
      local control = self.control
      if toInt64(0, 0) < inputNumber then
        (((((control._itemSet)._itemSetBg)[slotIndex])._itemSlot)[uiIndex]):ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
        ;
        (((((control._itemSet)._itemSetBg)[slotIndex])._count)[uiIndex]):SetShow(true)
        ;
        (((((control._itemSet)._itemSetBg)[slotIndex])._count)[uiIndex]):SetText(tostring(inputNumber))
        ;
        (((((control._itemSet)._itemSetBg)[slotIndex])._plus)[uiIndex]):SetShow(false)
        -- DECOMPILER ERROR at PC85: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self.tradeItemInfo)[_slotIndex] = index
      else
        ;
        (((((control._itemSet)._itemSetBg)[slotIndex])._itemSlot)[uiIndex]):ChangeTextureInfoName("")
        ;
        (((((control._itemSet)._itemSetBg)[slotIndex])._count)[uiIndex]):SetShow(false)
        ;
        (((((control._itemSet)._itemSetBg)[slotIndex])._plus)[uiIndex]):SetShow(true)
        -- DECOMPILER ERROR at PC114: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self.tradeItemInfo)[_slotIndex] = nil
      end
      local totalPrice = tradeCompanyWrapper:getTempTotalPrice()
      local totalWeight = tradeCompanyWrapper:getTempTotalWeight()
      ;
      (control._itemWeight):SetText(makeDotMoney(totalWeight) .. " / " .. makeDotMoney(maxWeight))
      ;
      (control._tradePrice):SetText(makeDotMoney(totalPrice))
      ;
      (control._list2TradeItem):SetShow(false)
    end
  end

    if addCount > 0 then
      Panel_NumberPad_Show(true, toInt64(0, maxCount), 0, setTradeItem)
    else
      setTradeItem(toInt64(0, 0))
    end
  end
end

WorkerTradeCaravan_Go = function()
  -- function num : 0_32 , upvalues : workerTradeCaravan
  if not isChangeableState() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_STARTALERT_1"))
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
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_STARTALERT_2"))
    return 
  end
  if porterCount < carriageCount * workerTradeCaravan._minWorkerCount then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_STARTALERT_3"))
    return 
  end
  ToClient_RequestStartTradeGroup(workerTradeCaravan._selectIndex)
end

WorkerTradeCaravan_TooltipShow = function(uiIndex, slotIndex, itemKey)
  -- function num : 0_33 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local control = self.control
  local startWayPointKey = WorkerTradeCaravan_StartWayPointKey()
  for index = 0, self._maxItemCount - 1 do
    local tradeItemWrapper = ToClient_RequestWorkerTradeItemMaster(startWayPointKey, index)
    local tradeItemKey = tradeItemWrapper:getKey()
    if itemKey == tradeItemKey then
      ((control._tooltipItem)._slot):ChangeTextureInfoName("Icon/" .. tradeItemWrapper:getIconPath())
      ;
      ((control._tooltipItem)._name):SetText(tradeItemWrapper:getName())
      ;
      ((control._tooltipItem)._price):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_ITEMTOOLTIP_PRICE", "price", tostring(makeDotMoney(tradeItemWrapper:getBuyPrice()))))
      ;
      ((control._tooltipItem)._weight):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADECARAVAN_ITEMTOOLTIP_WEIGHT", "weight", tostring(makeDotMoney(tradeItemWrapper:getWeight()))))
      break
    end
  end
  do
    if ((control._tooltipItem)._name):GetTextSizeX() > 150 then
      (control._tooltip):SetSize(((control._tooltipItem)._name):GetTextSizeX() + 20, 90)
    else
      ;
      (control._tooltip):SetSize(170, 90)
    end
    local basePosX, basePosY = nil, nil
    if slotIndex == nil then
      basePosX = (control._itemListBg):GetPosX() + ((control._tradeItemSlotBg)[uiIndex]):GetPosX()
      basePosY = (control._itemListBg):GetPosY() + ((control._tradeItemSlotBg)[uiIndex]):GetPosY()
    else
      basePosX = (control._itemSetBg):GetPosX() + (((control._itemSet)._itemSlotBg)[uiIndex]):GetPosX() + (((((control._itemSet)._itemSetBg)[uiIndex])._itemSlotBg)[slotIndex]):GetPosX()
      basePosY = (control._itemSetBg):GetPosY() + (((control._itemSet)._itemSlotBg)[uiIndex]):GetPosY()
    end
    if basePosX + Panel_WorkerTrade_Caravan:GetPosX() < getScreenSizeX() / 2 - (control._tooltip):GetSizeX() / 2 then
      (control._tooltip):SetPosX(basePosX + 60)
    else
      ;
      (control._tooltip):SetPosX(basePosX - (control._tooltip):GetSizeX() - 10)
    end
    if getScreenSizeY() < basePosY then
      (control._tooltip):SetPosY(basePosY - 90)
    else
      ;
      (control._tooltip):SetPosY(basePosY)
    end
    ;
    (control._tooltip):SetShow(true)
  end
end

WorkerTradeCaravan_TooltipHide = function()
  -- function num : 0_34 , upvalues : workerTradeCaravan
  local self = workerTradeCaravan
  local control = self.control
  ;
  (control._tooltip):SetShow(false)
end

WorkerTradeCaravan_StartWayPointKey = function()
  -- function num : 0_35 , upvalues : workerTradeCaravan
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

isChangeableState = function()
  -- function num : 0_36 , upvalues : workerTradeCaravan
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
  -- function num : 0_37 , upvalues : workerTradeCaravan
  if Panel_WorkerTrade_Caravan:GetShow() then
    workerTradeCaravan:Hide()
  else
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    workerTradeCaravan._caravanIndex = index
    workerTradeCaravan:Show(index)
  end
end

WorkerTradeCaravan_Close = function()
  -- function num : 0_38 , upvalues : workerTradeCaravan
  workerTradeCaravan:Hide()
end

workerTradeCaravan.registerEvent = function(self)
  -- function num : 0_39
  local control = self.control
  ;
  (((control._worker)._image)[1]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SetWorker(" .. 0 .. ")")
  ;
  (((control._worker)._image)[2]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_SetWorker(" .. 1 .. ")")
  ;
  ((control._asset)._btnCarriage):addInputEvent("Mouse_LUp", "WorkerTrade_SetAsset(" .. 0 .. "," .. 1 .. ")")
  ;
  ((control._asset)._btnCarriage):addInputEvent("Mouse_RUp", "WorkerTrade_SetAsset(" .. 0 .. "," .. -1 .. ")")
  ;
  ((control._asset)._btnWorker):addInputEvent("Mouse_LUp", "WorkerTrade_SetAsset(" .. 1 .. "," .. 1 .. ")")
  ;
  ((control._asset)._btnWorker):addInputEvent("Mouse_RUp", "WorkerTrade_SetAsset(" .. 1 .. "," .. -1 .. ")")
  ;
  ((control._asset)._btnGuard):addInputEvent("Mouse_LUp", "WorkerTrade_SetAsset(" .. 2 .. "," .. 1 .. ")")
  ;
  ((control._asset)._btnGuard):addInputEvent("Mouse_RUp", "WorkerTrade_SetAsset(" .. 2 .. "," .. -1 .. ")")
  ;
  ((control._asset)._btnFA):addInputEvent("Mouse_LUp", "WorkerTrade_SetAsset(" .. 3 .. "," .. 1 .. ")")
  ;
  ((control._asset)._btnFA):addInputEvent("Mouse_RUp", "WorkerTrade_SetAsset(" .. 3 .. "," .. -1 .. ")")
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
    (((control._routerNode)._btnRouterNode)[index]):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_RouteNodeSet(" .. index .. ")")
  end
  ;
  (control._list2RouteNode):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "RouteNodeListControlCreate")
  ;
  (control._list2RouteNode):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((control._itemSet)._btnClose):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_ItemListClose()")
  ;
  (control._list2TradeItem):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "TradeItemListControlCreate")
  ;
  (control._list2TradeItem):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (control._btnTradeStart):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_Go()")
  registerEvent("FromClient_OpenWorkerTradeItemList", "FromClient_OpenWorkerTradeItemList")
  ;
  (control._closeBtn):addInputEvent("Mouse_LUp", "WorkerTradeCaravan_Close()")
  ;
  (control._questionBtn):addInputEvent("Mouse_LUp", "")
  ;
  (control._questionBtn):SetShow(false)
end

workerTradeCaravan:ControlInit()
workerTradeCaravan:registerEvent()

