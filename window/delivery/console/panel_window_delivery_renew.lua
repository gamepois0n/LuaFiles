local _panel = Panel_Window_Delivery_Renew
local titleOffColor = 4287797159
local titleOnColor = 4293848814
local PanelDelivery = {
  _ui = {
    stc_TopBg = UI.getChildControl(_panel, "Static_TopBg"),
    stc_BtnBg = UI.getChildControl(_panel, "Static_RadioButtonBg"),
    stc_DeliveryBg = UI.getChildControl(_panel, "Static_DeliveryListBg"),
    stc_SendBg = UI.getChildControl(_panel, "Static_SendBg"),
    stc_Line = UI.getChildControl(_panel, "Static_Line")
  },
  _tabIdx = {delivery = 0, send = 1},
  _maxTabIdx = 2,
  _currentOpenTabIdx = 0,
  _const = {
    deliveryProgressTypeRequest = 0,
    deliveryProgressTypeIng = 1,
    deliveryProgressTypeComplete = 2
  },
  _deliveryType = {
    none = 0,
    cancel = 1,
    receive = 2
  },
  slotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  },
  selectWaypointKey = 0,
  selectCarriageKeyRaw = 0,
  distance = 0,
  currentWaypointKey = 0,
  currentWaypointName = 0,
  deliveryList = nil,
  maxSendItemIdx = 40,
  slotCols = 5,
  _sendDestList = {},
  _sendCarriageList = {},
  _sendItemSlots = Array.new(),
  _sendItemSlotBgs = Array.new()
}
function PanelDelivery:openTab(tabIdx)
  if false == _panel:GetShow() then
    _panel:SetShow(true)
  end
  Warehouse_SetIgnoreMoneyButton(true)
  clearDeliveryPack()
  if true == ToClient_isXBox() then
    _panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "")
  end
  if self._tabIdx.delivery == tabIdx then
    self._ui.stc_DeliveryBg:SetShow(true)
    self._ui.stc_SendBg:SetShow(false)
    self._ui.btn_Delivery:SetFontColor(titleOnColor)
    self._ui.btn_Send:SetFontColor(titleOffColor)
    delivery_requsetList()
    _panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_PanelDelivery_ReceiveAll()")
    self:updateDeliveryList()
  elseif self._tabIdx.send == tabIdx then
    self._ui.stc_SendBg:SetShow(true)
    self._ui.stc_DeliveryBg:SetShow(false)
    self._ui.btn_Send:SetFontColor(titleOnColor)
    self._ui.btn_Delivery:SetFontColor(titleOffColor)
    self._ui.txt_SendDest:SetText("")
    self.selectCarriageKeyRaw = 0
    self.selectWaypointKey = 0
    _panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_PanelDelivery_SendAll()")
    self:updateDestination()
    self:updateCarriageTypeList()
    self:updateSendList()
  end
  FromClient_WarehouseUpdate()
  FGlobal_WarehouseTownListCheck()
end
function PanelDelivery:close()
  clearDeliveryPack()
  if true == _panel:GetShow() then
    _panel:SetShow(false)
    FromClient_WarehouseUpdate()
  end
  FGlobal_WarehouseTownListCheck()
end
function PanelDelivery:init()
  self._ui.txt_TitleDelivery = UI.getChildControl(self._ui.stc_TopBg, "StaticText_Icon_Delivery")
  self._ui.txt_TitleDelivery:SetText(PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_DELIVERY"))
  self._ui.btn_Delivery = UI.getChildControl(self._ui.stc_BtnBg, "RadioButton_Delivery")
  self._ui.btn_Send = UI.getChildControl(self._ui.stc_BtnBg, "RadioButton_Send")
  self._ui.list_Delivery = UI.getChildControl(self._ui.stc_DeliveryBg, "List2_Delivery")
  local deliveryContent = UI.getChildControl(self._ui.list_Delivery, "List2_Delivery_Content")
  local slot = {}
  local deliveryItemSlot = UI.getChildControl(deliveryContent, "Static_SlotBg")
  SlotItem.new(slot, "Delivery_Slot_Icon_", 0, deliveryItemSlot, self.slotConfig)
  slot:createChild()
  self._ui.txt_Empty = UI.getChildControl(self._ui.stc_DeliveryBg, "StaticText_Empty_List")
  self._ui.stc_DeliveryBottomBg = UI.getChildControl(self._ui.stc_DeliveryBg, "Static_BottomBg")
  self._ui.txt_RecvConsoleUI = UI.getChildControl(self._ui.stc_DeliveryBottomBg, "StaticText_Receive_ConsoleUI")
  self._ui.txt_RecvAllConsoleUI = UI.getChildControl(self._ui.stc_DeliveryBottomBg, "StaticText_ReceiveAll_ConsoleUI")
  self._ui.txt_TotalFee = UI.getChildControl(self._ui.stc_SendBg, "StaticText_TotalFeeValue")
  self._ui.txt_PackedItemCount = UI.getChildControl(self._ui.stc_SendBg, "StaticText_ItemCountVaule")
  self._ui.stc_SendLeftBg = UI.getChildControl(self._ui.stc_SendBg, "Static_LeftBg")
  self._ui.txt_SendDestTitle = UI.getChildControl(self._ui.stc_SendLeftBg, "StaticText_DestinationTitle")
  self._ui.txt_SendDest = UI.getChildControl(self._ui.txt_SendDestTitle, "StaticText_SelectedDestination")
  self._ui.frame_Destination = UI.getChildControl(self._ui.stc_SendLeftBg, "Frame_Destination")
  self._ui.txt_SendCarriageTypeTitle = UI.getChildControl(self._ui.stc_SendLeftBg, "StaticText_CarriageTypeTitle")
  self._ui.txt_SendCarriageType = UI.getChildControl(self._ui.txt_SendCarriageTypeTitle, "StaticText_SelectedType")
  self._ui.frame_CarriageType = UI.getChildControl(self._ui.stc_SendLeftBg, "Frame_CarriageType")
  self._ui.stc_BottomBg = UI.getChildControl(self._ui.stc_SendBg, "Static_BottomBg")
  self._ui.txt_SendConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "StaticText_Send_ConsoleUI")
  self._ui.txt_SelectConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "Button_A_ConsoleUI")
  self._ui.txt_PricePenalty = UI.getChildControl(self._ui.stc_BottomBg, "StaticText_NoticePrice")
  self._ui.txt_PricePenalty:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_PricePenalty:SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_WINDOW_DELIVERY_REQUEST_WAYPOINTPENALTY"))
  self._ui.stc_ItemBg = UI.getChildControl(self._ui.stc_SendBg, "Static_ItemListBg")
  for slotIdx = 0, self.maxSendItemIdx - 1 do
    local row = math.floor(slotIdx / self.slotCols)
    local col = slotIdx % self.slotCols
    self._sendItemSlotBgs[slotIdx] = UI.createAndCopyBasePropertyControl(self._ui.stc_ItemBg, "Static_ItemSlotBgTemplate", self._ui.stc_ItemBg, "SendSlotBg_" .. "no_" .. tostring(slotIdx))
    local slotGapX = self._sendItemSlotBgs[slotIdx]:GetSizeX() + 8
    local slotGapY = self._sendItemSlotBgs[slotIdx]:GetSizeY() + 8
    self._sendItemSlotBgs[slotIdx]:SetPosX(self._sendItemSlotBgs[slotIdx]:GetPosX() + slotGapX * col)
    self._sendItemSlotBgs[slotIdx]:SetPosY(self._sendItemSlotBgs[slotIdx]:GetPosY() + slotGapY * row)
    self._sendItemSlotBgs[slotIdx]:addInputEvent("Mouse_On", "InputMO_PanelDelivery_ShowSlotHighlight(true, " .. slotIdx .. ")")
    self._sendItemSlotBgs[slotIdx]:addInputEvent("Mouse_Out", "InputMO_PanelDelivery_ShowSlotHighlight(false, " .. slotIdx .. ")")
    local slot = {}
    slot.slotNo = slotIdx
    slot.panel = _panel
    slot.base = {}
    SlotItem.new(slot.base, "SendItemSlot" .. slot.slotNo, slot.slotNo, self._sendItemSlotBgs[slotIdx], self.slotConfig)
    slot.base:createChild()
    slot.base.icon:SetVerticalMiddle()
    slot.base.icon:SetHorizonCenter()
    if true == ToClient_isXBox() then
      slot.base.icon:addInputEvent("Mouse_LUp", "PaGlobalFunc_PanelDelivery_SlotRClick(" .. slotIdx .. ")")
    else
      slot.base.icon:addInputEvent("Mouse_RUp", "PaGlobalFunc_PanelDelivery_SlotRClick(" .. slotIdx .. ")")
    end
    slot.base.icon:addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotIdx .. ", \"DeliveryRequest\",true)")
    slot.base.icon:addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotIdx .. ", \"DeliveryRequest\",false)")
    slot.base.icon:SetIgnore(false)
    slot.base.icon:SetShow(true)
    Panel_Tooltip_Item_SetPosition(slotIdx, slot.base, "DeliveryRequest")
    self._sendItemSlots[slotIdx] = slot
  end
  self:registEvent()
end
function PanelDelivery:updateSendList()
  local basePrice = 0
  local baseTradePrice = 0
  local totalCount = 0
  local tatalPrice = 0
  local packingItemCount = delivery_packCountType(false)
  local packingTradeItemCount = delivery_packCountType(true)
  if 0 ~= self.selectCarriageKeyRaw then
    basePrice = delivery_baseFee(DeliveryInformation_WaypointKey(), self.selectWaypointKey, self.selectCarriageKeyRaw, false)
    baseTradePrice = delivery_baseFee(DeliveryInformation_WaypointKey(), self.selectWaypointKey, self.selectCarriageKeyRaw, true)
    tatalPrice = packingItemCount * basePrice + packingTradeItemCount * baseTradePrice
    totalCount = packingItemCount + packingTradeItemCount
  end
  self._ui.txt_PackedItemCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_DeliveryRequest_packingCount", "packingCount", tostring(totalCount)))
  self._ui.txt_TotalFee:SetText("" .. makeDotMoney(tatalPrice))
  if 0 ~= self.selectWaypointKey then
    if not delivery_linkedWayPoint(DeliveryInformation_WaypointKey(), self.selectWaypointKey) then
      self._ui.txt_PricePenalty:SetShow(true)
    else
      self._ui.txt_PricePenalty:SetShow(false)
    end
  else
    self._ui.txt_PricePenalty:SetShow(false)
  end
  self._ui.txt_PackedItemCount:ComputePos()
  self._ui.txt_TotalFee:ComputePos()
  self:clearSlot()
  for slotIdx = 0, self.maxSendItemIdx - 1 do
    local itemWrapper = delivery_packItem(slotIdx)
    if nil ~= itemWrapper then
      self._sendItemSlots[slotIdx].base:setItem(itemWrapper)
      self._sendItemSlots[slotIdx].base.icon:addInputEvent("Mouse_On", "InputMO_PanelDelivery_KeyGuideUpdate(true)")
    else
      self._sendItemSlots[slotIdx].base.icon:addInputEvent("Mouse_On", "InputMO_PanelDelivery_KeyGuideUpdate(false)")
    end
  end
end
function PanelDelivery:clearSlot()
  for slotIdx = 0, self.maxSendItemIdx - 1 do
    self._sendItemSlots[slotIdx].base:clearItem()
  end
end
function PanelDelivery:updateDestination()
  local waypointKeyList = delivery_listWaypointKey(DeliveryInformation_WaypointKey(), false)
  if nil == waypointKeyList then
    return
  end
  for listIdx = 0, #self._sendDestList do
    if nil ~= self._sendDestList[listIdx] then
      self._sendDestList[listIdx]:SetCheck(false)
      UI.deleteControl(self._sendDestList[listIdx])
      self._sendDestList[listIdx] = nil
    end
  end
  local listSize = waypointKeyList:size()
  self._ui.content_Destination = self._ui.frame_Destination:GetFrameContent()
  self._ui.content_Destination:SetShow(true)
  if 0 == listSize then
    self._ui.txt_SendDest:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_NOT_CONNECT_REGION"))
  else
    for listIdx = 0, listSize - 1 do
      local slot = {}
      slot = UI.createAndCopyBasePropertyControl(self._ui.content_Destination, "RadioButton_DestinationTemplate", self._ui.content_Destination, "Destination_" .. "no_" .. tostring(listIdx))
      slot:SetText(waypointKeyList:atPointer(listIdx):getName())
      slot:SetPosY(slot:GetPosY() + listIdx * (slot:GetSizeY() + 3))
      slot:addInputEvent("Mouse_LUp", "InputMLUp_PanelDelivery_SelectDestination(" .. listIdx .. ")")
      slot:addInputEvent("Mouse_On", "InputMO_PanelDelivery_KeyGuideUpdate(true)")
      self._sendDestList[listIdx] = slot
    end
  end
  self._ui.frame_Destination:UpdateContentScroll()
  self._ui.frame_Destination:GetVScroll():SetControlTop()
  self._ui.frame_Destination:UpdateContentPos()
  ToClient_padSnapRefreshTarget(self._ui.frame_Destination)
end
function PanelDelivery:updateCarriageTypeList()
  local carriageList = delivery_listCarriage(DeliveryInformation_WaypointKey(), self.selectWaypointKey, false)
  self.selectCarriageKeyRaw = 0
  for listIdx = 0, #self._sendCarriageList do
    if nil ~= self._sendCarriageList[listIdx] then
      self._sendCarriageList[listIdx]:SetCheck(false)
      UI.deleteControl(self._sendCarriageList[listIdx])
      self._sendCarriageList[listIdx] = nil
    end
  end
  if nil == carriageList then
    self._ui.txt_SendCarriageType:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_SELECT_REGION"))
    return
  end
  local listSize = carriageList:size()
  self._ui.content_Carriage = self._ui.frame_CarriageType:GetFrameContent()
  self._ui.content_Carriage:SetShow(true)
  if 0 == listSize then
    self._ui.txt_SendCarriageType:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_SELECT_REGION"))
  else
    self._ui.txt_SendCarriageType:SetText("")
    for listIdx = 0, listSize - 1 do
      local slot = {}
      slot = UI.createAndCopyBasePropertyControl(self._ui.content_Carriage, "RadioButton_CarriageTypeTemplate", self._ui.content_Carriage, "CarriageType_" .. "no_" .. tostring(listIdx))
      slot:SetText(carriageList:atPointer(listIdx):getName())
      slot:SetPosY(slot:GetPosY() + listIdx * (slot:GetSizeY() + 3))
      slot:addInputEvent("Mouse_LUp", "InputMLUp_PanelDelivery_SelectCarriage(" .. listIdx .. ")")
      slot:addInputEvent("Mouse_On", "InputMO_PanelDelivery_KeyGuideUpdate(true)")
      self._sendCarriageList[listIdx] = slot
    end
  end
  self._ui.frame_CarriageType:UpdateContentScroll()
  self._ui.frame_CarriageType:GetVScroll():SetControlTop()
  self._ui.frame_CarriageType:UpdateContentPos()
  ToClient_padSnapRefreshTarget(self._ui.frame_CarriageType)
end
function PanelDelivery:updateDeliveryList()
  self.deliveryList = delivery_listAll()
  if nil == self.deliveryList then
    return
  end
  local deliveryCount = self.deliveryList:size()
  self._ui.list_Delivery:getElementManager():clearKey()
  if 0 == deliveryCount then
    self._ui.txt_Empty:SetShow(true)
  else
    for idx = 0, deliveryCount - 1 do
      local deliveryInfo = self.deliveryList:atPointer(idx)
      if nil ~= deliveryInfo then
        self._ui.list_Delivery:getElementManager():pushKey(toInt64(0, idx))
      end
    end
    self._ui.txt_Empty:SetShow(false)
  end
end
function PanelDelivery:registEvent()
  self._ui.btn_Send:addInputEvent("Mouse_LUp", "PaGlobalFunc_PanelDelivery_OpenSendTab()")
  self._ui.btn_Delivery:addInputEvent("Mouse_LUp", "PaGlobalFunc_PanelDelivery_OpenDeliveryTab()")
  self._ui.txt_SendConsoleUI:addInputEvent("Mouse_LUp", "PaGlobalFunc_PanelDelivery_SendAll()")
  self._ui.list_Delivery:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_PanelDelivery_ControlCreate")
  self._ui.list_Delivery:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  registerEvent("FromClient_MoveDeliveryItem", "FromClient_PanelDelivery_DeliveryItemState")
  registerEvent("FromClient_MoveDeliveryItem", "DeliveryInformation_UpdateSlotData")
  _panel:RegisterShowEventFunc(true, "PaGlobalFunc_PanelDelivery_ShowAni()")
  _panel:RegisterShowEventFunc(false, "PaGlobalFunc_PanelDelivery_HideAni()")
  if true == ToClient_isXBox() then
    _panel:registerPadEvent(__eConsoleUIPadEvent_LT, "PaGlobalFunc_PanelDelivery_MoveTabLeft()")
    _panel:registerPadEvent(__eConsoleUIPadEvent_RT, "PaGlobalFunc_PanelDelivery_MoveTabRight()")
  end
end
function PaGlobalFunc_PanelDelivery_Init()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self:init()
end
function PaGlobalFunc_PanelDelivery_ControlCreate(content, key)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  local index = Int64toInt32(key)
  local btn_DeliverySlot = UI.getChildControl(content, "Button_DeliverySlot")
  local stc_SlotBg = UI.getChildControl(content, "Static_SlotBg")
  local txt_StartTown = UI.getChildControl(content, "StaticText_StartTownName")
  local txt_ArrivalTown = UI.getChildControl(content, "StaticText_ArrivalTownName")
  local txt_CariageType = UI.getChildControl(content, "StaticText_Title_CariageType")
  local btn_State = UI.getChildControl(content, "Button_State")
  local deliveryList = delivery_listAll()
  local deliveryInfo = deliveryList:atPointer(index)
  local itemWrapper = deliveryInfo:getItemWrapper()
  if nil == itemWrapper then
    return
  end
  local slot = {}
  stc_SlotBg:SetShow(true)
  SlotItem.reInclude(slot, "Delivery_Slot_Icon_", 0, stc_SlotBg, self.slotConfig)
  slot:setItem(itemWrapper)
  slot.icon:addInputEvent("Mouse_On", "PaGlobalFunc_PanelDelivery_TooltipShow(" .. index .. ", true)")
  slot.icon:addInputEvent("Mouse_Out", "PaGlobalFunc_PanelDelivery_TooltipShow(" .. index .. ", false)")
  txt_CariageType:SetShow(true)
  if 1 == deliveryInfo:getCarriageType() then
    txt_CariageType:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_carriage"))
  elseif 2 == deliveryInfo:getCarriageType() then
    txt_CariageType:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_Transport"))
  elseif 3 == deliveryInfo:getCarriageType() then
    txt_CariageType:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_TradeShip"))
  else
    txt_CariageType:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_carriage"))
  end
  txt_StartTown:SetShow(true)
  txt_StartTown:SetText(deliveryInfo:getFromRegionName())
  txt_ArrivalTown:SetShow(true)
  txt_ArrivalTown:SetText(deliveryInfo:getToRegionName())
  btn_State:SetShow(true)
  btn_State:SetMonoTone(true)
  btn_State:SetIgnore(true)
  btn_DeliverySlot:addInputEvent("Mouse_LUp", "")
  btn_DeliverySlot:addInputEvent("Mouse_On", "InputMO_PanelDelivery_SetDeliveryUI(" .. self._deliveryType.none .. ")")
  local stateString = ""
  if self._const.deliveryProgressTypeRequest == deliveryInfo:getProgressType() then
    if deliveryInfo:getFromRegionName() == self.currentWaypointName then
      btn_State:SetMonoTone(false)
      btn_DeliverySlot:addInputEvent("Mouse_LUp", "PaGlobalFunc_PanelDelivery_DeliveryCancel(" .. index .. " )")
      btn_DeliverySlot:addInputEvent("Mouse_On", "InputMO_PanelDelivery_SetDeliveryUI(" .. self._deliveryType.cancel .. ")")
      stateString = PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_INFORMATION_BTN_CANCEL")
    else
      stateString = PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_INFORMATION_BTN_READY")
    end
  elseif self._const.deliveryProgressTypeIng == deliveryInfo:getProgressType() then
    stateString = PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_INFORMATION_BTN_ING")
  elseif deliveryInfo:getToRegionName() == self.currentWaypointName then
    btn_State:SetMonoTone(false)
    btn_DeliverySlot:addInputEvent("Mouse_LUp", "PaGlobalFunc_PanelDelivery_DeliveryReceive(" .. index .. " )")
    btn_DeliverySlot:addInputEvent("Mouse_On", "InputMO_PanelDelivery_SetDeliveryUI(" .. self._deliveryType.receive .. ")")
    stateString = PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_INFORMATION_BTN_RECEIVE")
  else
    stateString = PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_INFORMATION_BTN_COMPLETE")
  end
  btn_State:SetText(stateString)
end
function PaGlobalFunc_PanelDelivery_ReceiveAll()
  delivery_receiveAll(DeliveryInformation_WaypointKey())
end
function DeliveryInformation_WaypointKey()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  return self.currentWaypointKey
end
function DeliveryInformation_SlotIndex(slotNo)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  return slotNo
end
function DeliveryInformation_UpdateSlotData()
  if false == Panel_Window_Delivery_Renew:IsShow() then
    return
  end
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self.deliveryList = delivery_listAll()
  self:updateDeliveryList()
end
function DeliveryInformation_OpenPanelFromDialog()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self.currentWaypointKey = getCurrentWaypointKey()
  self.currentWaypointName = getRegionNameByWaypointKey(self.currentWaypointKey)
  Warehouse_OpenPanelFromDialogWithoutInventory(getCurrentWaypointKey(), CppEnums.WarehoouseFromType.eWarehoouseFromType_Npc)
  self._currentOpenTabIdx = self._tabIdx.delivery
  PaGlobalFunc_PanelDelivery_OpenDeliveryTab()
end
function PaGlobalFunc_PanelDelivery_SlotRClick(slotNo)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  delivery_popPack(slotNo)
  self:updateSendList()
  FromClient_WarehouseUpdate()
end
function PaGlobalFunc_PanelDelivery_Send()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  delivery_request(DeliveryInformation_WaypointKey(), self.selectWaypointKey, self.selectCarriageKeyRaw)
end
function PaGlobalFunc_PanelDelivery_OpenDeliveryTab()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self:openTab(self._tabIdx.delivery)
end
function PaGlobalFunc_PanelDelivery_OpenSendTab()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self:openTab(self._tabIdx.send)
end
function DeliveryRequestWindow_Close()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self:close()
end
function PaGlobalFunc_PanelDelivery_GetShow()
  if nil ~= Panel_Window_Delivery_Renew then
    return Panel_Window_Delivery_Renew:GetShow()
  else
    return false
  end
end
function DeliveryRequest_PushPackingItem(warehouseSlotNo, s64_count)
  if s64_count < Defines.s64_const.s64_1 then
    return
  end
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  if self._tabIdx.delivery == self._currentOpenTabIdx then
    return
  end
  warehouse_requestInfo(DeliveryInformation_WaypointKey())
  delivery_pushPack(warehouseSlotNo, s64_count)
  self:updateSendList()
  FromClient_WarehouseUpdate()
end
function PaGlobalFunc_PanelDelivery_TooltipShow(idx, isOn)
  if false == isOn then
    Panel_Tooltip_Item_hideTooltip()
  end
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  local control = self._ui.list_Delivery
  local contents = control:GetContentByKey(toInt64(0, idx))
  if nil ~= contents then
    local itemIcon = UI.getChildControl(contents, "Static_SlotBg")
    if true == isOn then
      self.deliveryList = delivery_listAll()
      local deliveryInfo = self.deliveryList:atPointer(idx)
      local itemWrapper = deliveryInfo:getItemWrapper()
      local itemSSW = itemWrapper:getStaticStatus()
      Panel_Tooltip_Item_Show(itemSSW, itemIcon, true, false, nil, nil, true, nil, "PanelDelivery", deliveryInfo:getItemNo())
    end
  end
end
function FromClient_PanelDelivery_DeliveryItemState(state)
  if 0 == state then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_REQUEST_DELIVERYITEMSTATE_WAIT"))
  elseif 1 == state then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_REQUEST_DELIVERYITEMSTATE_START"))
  elseif 2 == state then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_REQUEST_DELIVERYITEMSTATE_COMPLETE"))
  end
end
function PaGlobalFunc_PanelDelivery_SendAll()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  local packingItemCount = delivery_packCountType(false)
  local packingTradeItemCount = delivery_packCountType(true)
  if packingItemCount + packingTradeItemCount < 1 then
    return
  end
  local selected_Destination = self.selectWaypointKey
  local selected_Carriage = self.selectCarriageKeyRaw
  if 0 == selected_Destination or 0 == selected_Carriage then
    local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_REQUEST_PLZSELECT_DESTINATION")
    local messageboxData = {
      title = messageboxTitle,
      content = messageboxMemo,
      functionApply = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
    return
  end
  if not delivery_linkedWayPoint(DeliveryInformation_WaypointKey(), self.selectWaypointKey) then
    local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_REQUEST_NOTLINKEDWAYPOINT_TITLE")
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_REQUEST_NOTLINKEDWAYPOINT_MSG")
    local messageboxData = {
      title = messageboxTitle,
      content = messageboxMemo,
      functionYes = PaGlobalFunc_PanelDelivery_Send,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  else
    PaGlobalFunc_PanelDelivery_Send()
  end
end
function InputMLUp_PanelDelivery_SelectDestination(_index)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  local waypointKeyList = delivery_listWaypointKey(DeliveryInformation_WaypointKey(), false)
  if nil == waypointKeyList then
    return
  end
  local size = waypointKeyList:size()
  local selectIndex = _index
  local waypoint = waypointKeyList:atPointer(selectIndex)
  if nil == waypoint then
    return
  end
  self._ui.txt_SendDest:SetText(waypointKeyList:atPointer(selectIndex):getName())
  self.selectWaypointKey = waypointKeyList:atPointer(selectIndex):getWaypointKey()
  self:updateCarriageTypeList()
  self:updateSendList()
end
function InputMLUp_PanelDelivery_SelectCarriage(_index)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  if -1 == _index then
    return
  end
  local carriageList = delivery_listCarriage(DeliveryInformation_WaypointKey(), self.selectWaypointKey, false)
  if nil == carriageList then
    return
  end
  local size = carriageList:size()
  self._ui.txt_SendCarriageType:SetText(carriageList:atPointer(_index):getName())
  self.selectCarriageKeyRaw = carriageList:atPointer(_index):getCharacterKeyRaw()
  self:updateSendList()
end
function PaGlobalFunc_PanelDelivery_DeliveryCancel(index)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self.deliveryList = delivery_listAll()
  local deliveryInfo = self.deliveryList:atPointer(index)
  local itemNo = deliveryInfo:getItemNo()
  delivery_cancelbyItemNo(itemNo)
  self:updateDeliveryList()
end
function PaGlobalFunc_PanelDelivery_DeliveryReceive(index)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self.deliveryList = delivery_listAll()
  local deliveryInfo = self.deliveryList:atPointer(index)
  local itemNo = deliveryInfo:getItemNo()
  delivery_receiveItemNo(itemNo)
  self:updateDeliveryList()
end
function InputMO_PanelDelivery_SetDeliveryUI(_type)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self._ui.txt_RecvAllConsoleUI:addInputEvent("Mouse_LUp", "PaGlobalFunc_PanelDelivery_ReceiveAll()")
  if _type == self._deliveryType.cancel then
    self._ui.txt_RecvConsoleUI:SetShow(true)
    self._ui.txt_RecvConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_INFORMATION_BTN_CANCEL"))
  elseif _type == self._deliveryType.receive then
    self._ui.txt_RecvConsoleUI:SetShow(true)
    self._ui.txt_RecvConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_INFORMATION_BTN_RECEIVE"))
  else
    self._ui.txt_RecvConsoleUI:SetShow(false)
  end
end
function InputMO_PanelDelivery_ShowSlotHighlight(isShow, idx)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  local slot = self._sendItemSlotBgs[idx]
  if nil == slot then
    return
  end
  if true == isShow then
    local x1, y1, x2, y2 = setTextureUV_Func(slot, 50, 195, 94, 239)
    slot:getBaseTexture():setUV(x1, y1, x2, y2)
  else
    local x1, y1, x2, y2 = setTextureUV_Func(slot, 143, 195, 187, 239)
    slot:getBaseTexture():setUV(x1, y1, x2, y2)
  end
  slot:setRenderTexture(slot:getBaseTexture())
end
function DeliveryRequest_UpdateRequestSlotData()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self:updateSendList()
end
function PaGlobalFunc_PanelDelivery_ShowAni()
end
function PaGlobalFunc_PanelDelivery_HideAni()
end
function InputMO_PanelDelivery_KeyGuideUpdate(isShow)
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self._ui.txt_SelectConsoleUI:SetShow(isShow)
end
function PaGlobalFunc_PanelDelivery_MoveTabLeft()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self._currentOpenTabIdx = self._currentOpenTabIdx - 1
  self._currentOpenTabIdx = self._currentOpenTabIdx % self._maxTabIdx
  self:openTab(self._currentOpenTabIdx)
end
function PaGlobalFunc_PanelDelivery_MoveTabRight()
  local self = PanelDelivery
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PanelDelivery")
    return
  end
  self._currentOpenTabIdx = self._currentOpenTabIdx + 1
  self._currentOpenTabIdx = self._currentOpenTabIdx % self._maxTabIdx
  self:openTab(self._currentOpenTabIdx)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_PanelDelivery_Init")
