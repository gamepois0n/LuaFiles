-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\delivery\panel_window_delivery_information.luac 

-- params : ...
-- function num : 0
Panel_Window_Delivery_Information:ActiveMouseEventEffect(true)
Panel_Window_Delivery_Information:setMaskingChild(true)
Panel_Window_Delivery_Information:setGlassBackground(true)
Panel_Window_Delivery_Information:RegisterShowEventFunc(true, "DeliveryInformationShowAni()")
Panel_Window_Delivery_Information:RegisterShowEventFunc(false, "DeliveryInformationHideAni()")
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
DeliveryInformationShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  Panel_Window_Delivery_Information:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Window_Delivery_Information, 0.05, 0.15)
  local aniInfo1 = Panel_Window_Delivery_Information:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1)
  aniInfo1.AxisX = Panel_Window_Delivery_Information:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_Delivery_Information:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_Delivery_Information:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_Delivery_Information:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_Delivery_Information:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

DeliveryInformationHideAni = function()
  -- function num : 0_1
  Panel_Window_Delivery_Information:ChangeSpecialTextureInfoName("")
  Panel_Window_Delivery_Information:SetAlpha(1)
  ;
  (UIAni.AlphaAnimation)(0, Panel_Window_Delivery_Information, 0, 0.1)
end

local deliveryInformation = {
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
config = {slotCount = 7, slotStartX = 10, slotStartY = 105, slotGapY = 70, slotIconStartX = 5, slotIconStartY = 8, slotCarriageTypeStartX = 88, slotCarriageTypeStartY = 8, slotDepartureStartX = 65, slotDepartureStartY = 31, slotDestinationStartX = 215, slotDestinationStartY = 31, slotArrowStartX = 180, slotArrowStartY = 34, slotButtonStartX = 320, slotButtonStartY = 5}
, 
const = {deliveryProgressTypeRequest = 0, deliveryProgressTypeIng = 1, deliveryProgressTypeComplete = 2}
, panel_Background = (UI.getChildControl)(Panel_Window_Delivery_Information, "Static_Bakcground"), button_Close = (UI.getChildControl)(Panel_Window_Delivery_Information, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_Delivery_Information, "Button_Question"), button_Request = (UI.getChildControl)(Panel_Window_Delivery_Information, "Button_Send"), button_Information = (UI.getChildControl)(Panel_Window_Delivery_Information, "Button_Cancel_Recieve"), button_ReceiveAll = (UI.getChildControl)(Panel_Window_Delivery_Information, "Button_ReceiveAll"), button_Refresh = (UI.getChildControl)(Panel_Window_Delivery_Information, "Button_Refresh"), check_Cancel = (UI.getChildControl)(Panel_Window_Delivery_Information, "CheckButton_Cancel"), check_Recieve = (UI.getChildControl)(Panel_Window_Delivery_Information, "CheckButton_Recieve"), empty_List = (UI.getChildControl)(Panel_Window_Delivery_Information, "StaticText_Empty_List"), scroll = (UI.getChildControl)(Panel_Window_Delivery_Information, "Scroll_1"), slots = (Array.new)(), startSlotNo = 0, currentWaypointKey = 0}
deliveryInformation.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("FromClient_MoveDeliveryItem", "DeliveryInformation_UpdateSlotData")
end

deliveryInformation.registEventHandler = function(self)
  -- function num : 0_3
  Panel_Window_Delivery_Information:addInputEvent("Mouse_UpScroll", "DeliveryInformation_ScrollEvent( true )")
  Panel_Window_Delivery_Information:addInputEvent("Mouse_DownScroll", "DeliveryInformation_ScrollEvent( false )")
  ;
  (self.panel_Background):addInputEvent("Mouse_UpScroll", "DeliveryInformation_ScrollEvent( true )")
  ;
  (self.panel_Background):addInputEvent("Mouse_DownScroll", "DeliveryInformation_ScrollEvent( false )")
  ;
  (self.button_Request):addInputEvent("Mouse_LUp", "DeliveryRequestWindow_Open()")
  ;
  (self.button_Close):addInputEvent("Mouse_LUp", "DeliveryInformationWindow_Close()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"DeliveryInformation\" )")
  ;
  (self.button_Refresh):addInputEvent("Mouse_LUp", "DeliveryInformation_Refresh()")
  ;
  (self.button_ReceiveAll):addInputEvent("Mouse_LUp", "Delivery_Receive_All()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"DeliveryInformation\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"DeliveryInformation\", \"false\")")
  ;
  (self.check_Cancel):addInputEvent("Mouse_LUp", "DeliveryInformation_UpdateSlotData()")
  ;
  (self.check_Recieve):addInputEvent("Mouse_LUp", "DeliveryInformation_UpdateSlotData()")
  ;
  (self.check_Recieve):SetAutoDisableTime(4)
  ;
  (UIScroll.InputEvent)(self.scroll, "DeliveryInformation_ScrollEvent")
end

deliveryInformation.init = function(self)
  -- function num : 0_4
  for ii = 0, (self.config).slotCount - 1 do
    local slot = {}
    slot.slotNo = ii
    slot.panel = Panel_Window_Delivery_Information
    slot.base = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_Information, "Static_Slot", Panel_Window_Delivery_Information, "Delivery_Slot_" .. ii)
    slot.carriageType = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_Information, "StaticText_CarriageType", slot.base, "Delivery_Slot_CarriageType_" .. ii)
    slot.departure = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_Information, "StaticText_Departure", slot.base, "Delivery_Slot_Departure_" .. ii)
    slot.destination = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_Information, "StaticText_Destination", slot.base, "Delivery_Slot_Destination_" .. ii)
    slot.static_Arrow = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_Information, "Static_Arrow", slot.base, "Delivery_Slot_Arrow_" .. ii)
    slot.button_Cancel = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_Information, "Button_Cancel", slot.base, "Delivery_Slot_Cancel_" .. ii)
    slot.button_Receive = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_Information, "Button_Receive", slot.base, "Delivery_Slot_Receive_" .. ii)
    slot.icon = {}
    ;
    (SlotItem.new)(slot.icon, "Delivery_Slot_Icon_" .. slot.slotNo, slot.slotNo, slot.base, self.slotConfig)
    ;
    (slot.icon):createChild()
    ;
    (slot.base):SetPosX((self.config).slotStartX)
    ;
    (slot.base):SetPosY((self.config).slotStartY + (self.config).slotGapY * slot.slotNo)
    ;
    ((slot.icon).icon):SetPosX((self.config).slotIconStartX)
    ;
    ((slot.icon).icon):SetPosY((self.config).slotIconStartY)
    ;
    (slot.carriageType):SetPosX((self.config).slotCarriageTypeStartX)
    ;
    (slot.carriageType):SetPosY((self.config).slotCarriageTypeStartY)
    ;
    (slot.departure):SetPosX((self.config).slotDepartureStartX)
    ;
    (slot.departure):SetPosY((self.config).slotDepartureStartY)
    ;
    (slot.destination):SetPosX((self.config).slotDestinationStartX)
    ;
    (slot.destination):SetPosY((self.config).slotDestinationStartY)
    ;
    (slot.static_Arrow):SetPosX((self.config).slotArrowStartX)
    ;
    (slot.static_Arrow):SetPosY((self.config).slotArrowStartY)
    ;
    (slot.button_Cancel):SetPosX((self.config).slotButtonStartX)
    ;
    (slot.button_Cancel):SetPosY((self.config).slotButtonStartY)
    ;
    (slot.button_Receive):SetPosX((self.config).slotButtonStartX)
    ;
    (slot.button_Receive):SetPosY((self.config).slotButtonStartY)
    ;
    (self.check_Cancel):SetCheck(true)
    ;
    (self.check_Recieve):SetCheck(true)
    ;
    (slot.base):addInputEvent("Mouse_UpScroll", "DeliveryInformation_ScrollEvent( true )")
    ;
    (slot.base):addInputEvent("Mouse_DownScroll", "DeliveryInformation_ScrollEvent( false )")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_UpScroll", "DeliveryInformation_ScrollEvent( true )")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_DownScroll", "DeliveryInformation_ScrollEvent( false )")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. ii .. ", \"DeliveryInformation\",true)")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. ii .. ", \"DeliveryInformation\",false)")
    ;
    (slot.button_Cancel):addInputEvent("Mouse_LUp", "Delivery_Cancel(" .. ii .. ")")
    ;
    (slot.button_Cancel):addInputEvent("Mouse_UpScroll", "DeliveryInformation_ScrollEvent( true )")
    ;
    (slot.button_Cancel):addInputEvent("Mouse_DownScroll", "DeliveryInformation_ScrollEvent( false )")
    ;
    (slot.button_Receive):addInputEvent("Mouse_LUp", "Delivery_Receive(" .. ii .. ")")
    ;
    (slot.button_Receive):addInputEvent("Mouse_UpScroll", "DeliveryInformation_ScrollEvent( true )")
    ;
    (slot.button_Receive):addInputEvent("Mouse_DownScroll", "DeliveryInformation_ScrollEvent( false )")
    Panel_Tooltip_Item_SetPosition(ii, slot.icon, "DeliveryInformation")
    slot.deliveryIndex = 0
    -- DECOMPILER ERROR at PC273: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.slots)[ii] = slot
  end
end

deliveryInformation.updateSlot = function(self)
  -- function num : 0_5
  for ii = 0, (self.config).slotCount - 1 do
    local slot = (self.slots)[ii]
    ;
    (slot.base):SetShow(false)
  end
  local deliveryList = delivery_list(DeliveryInformation_WaypointKey())
  if deliveryList == nil then
    (self.empty_List):SetShow(true)
    return 
  else
    ;
    (self.empty_List):SetShow(false)
  end
  local deliveryCount = deliveryList:size()
  if deliveryCount == 0 then
    (self.empty_List):SetShow(true)
    return 
  else
    ;
    (self.empty_List):SetShow(false)
  end
  local showCount = 0
  if (self.check_Cancel):IsCheck() then
    showCount = showCount + deliveryList:sizeByProgress((self.const).deliveryProgressTypeRequest)
  end
  if (self.check_Recieve):IsCheck() then
    showCount = showCount + deliveryList:sizeByProgress((self.const).deliveryProgressTypeComplete)
  end
  if deliveryCount <= 7 then
    self.startSlotNo = 0
  end
  local showSlot = 0
  for ii = self.startSlotNo, deliveryCount - 1 do
    if showSlot < (self.config).slotCount and showSlot < showCount then
      local deliveryInfo = deliveryList:atPointer(ii)
      if ((self.check_Cancel):IsCheck() and (self.const).deliveryProgressTypeRequest == deliveryInfo:getProgressType()) or (self.check_Recieve):IsCheck() and (self.const).deliveryProgressTypeComplete == deliveryInfo:getProgressType() then
        local itemWrapper = deliveryInfo:getItemWrapper()
        if itemWrapper ~= nil then
          local slot = (self.slots)[showSlot]
          ;
          (slot.icon):setItem(itemWrapper)
          ;
          (slot.departure):SetText(deliveryInfo:getFromRegionName())
          ;
          (slot.destination):SetText(deliveryInfo:getToRegionName())
          if deliveryInfo:getCarriageType() == 1 then
            (slot.carriageType):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_carriage"))
          else
            if deliveryInfo:getCarriageType() == 2 then
              (slot.carriageType):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_Transport"))
            else
              if deliveryInfo:getCarriageType() == 3 then
                (slot.carriageType):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_TradeShip"))
              else
                ;
                (slot.carriageType):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_carriage"))
              end
            end
          end
          if deliveryInfo:getProgressType() == 0 then
            (slot.button_Receive):SetShow(false)
            ;
            (slot.button_Cancel):SetShow(true)
          else
            ;
            (slot.button_Cancel):SetShow(false)
            ;
            (slot.button_Receive):SetShow(true)
          end
          slot.deliveryIndex = ii
          ;
          (slot.base):SetShow(true)
          showSlot = showSlot + 1
        end
      end
    end
  end
  ;
  (UIScroll.SetButtonSize)(self.scroll, (self.config).slotCount, deliveryCount)
  if self.startSlotNo + 7 == deliveryCount then
    (self.scroll):SetControlPos(1)
  end
end

DeliveryInformation_WaypointKey = function()
  -- function num : 0_6 , upvalues : deliveryInformation
  local self = deliveryInformation
  return self.currentWaypointKey
end

DeliveryInformation_SlotIndex = function(slotNo)
  -- function num : 0_7 , upvalues : deliveryInformation
  local self = deliveryInformation
  return ((self.slots)[slotNo]).deliveryIndex
end

DeliveryInformation_ScrollEvent = function(isScrollUp)
  -- function num : 0_8 , upvalues : deliveryInformation
  local self = deliveryInformation
  local deliveryList = delivery_list(DeliveryInformation_WaypointKey())
  if deliveryList == nil then
    return 
  end
  ;
  (self.scroll):SetShow(false)
  local deliveryCount = deliveryList:size()
  if deliveryCount > 7 then
    (self.scroll):SetShow(true)
    self.startSlotNo = (UIScroll.ScrollEvent)(self.scroll, isScrollUp, (self.config).slotCount, deliveryCount, self.startSlotNo, 1)
  end
  self:updateSlot()
end

DeliveryInformation_UpdateSlotData = function()
  -- function num : 0_9 , upvalues : deliveryInformation
  if not Panel_Window_Delivery_Information:IsShow() then
    return 
  end
  local self = deliveryInformation
  if DeliveryInformation_WaypointKey() ~= nil then
    deliveryList = delivery_list(DeliveryInformation_WaypointKey())
  end
  if deliveryList ~= nil and deliveryList:size() > 7 and deliveryList:size() < self.startSlotNo + 7 then
    self.startSlotNo = self.startSlotNo - 1
    ;
    (self.scroll):SetControlPos(self.startSlotNo / deliveryList:size() - 7)
  end
  self:updateSlot()
end

DeliveryInformationWindow_Open = function()
  -- function num : 0_10 , upvalues : deliveryInformation
  DeliveryRequestWindow_Close()
  Warehouse_SetIgnoreMoneyButton(true)
  if not Panel_Window_Delivery_Information:IsShow() then
    Panel_Window_Delivery_Information:SetAlphaExtraChild(1)
    Panel_Window_Delivery_Information:SetShow(true, true)
    delivery_requsetList()
    if ToClient_WorldMapIsShow() then
      WorldMapPopupManager:increaseLayer(true)
      WorldMapPopupManager:push(Panel_Window_Delivery_Information, true)
    end
  end
  local self = deliveryInformation
  self.startSlotNo = 0
  self:updateSlot()
  ;
  (self.scroll):SetControlPos(0)
  Panel_Window_Delivery_Information:SetPosX(Panel_Window_Warehouse:GetPosX() - Panel_Window_Delivery_Information:GetSizeX())
  Panel_Window_Delivery_Information:SetPosY(Panel_Window_Warehouse:GetPosY() - 40)
  Panel_Window_Delivery_Request:SetPosX(Panel_Window_Warehouse:GetPosX() - Panel_Window_Delivery_Information:GetSizeX())
  Panel_Window_Delivery_Request:SetPosY(Panel_Window_Warehouse:GetPosY() - 40)
end

DeliveryInformationWindow_Close = function()
  -- function num : 0_11
  if ToClient_WorldMapIsShow() and Panel_Window_Delivery_Information:GetShow() then
    WorldMapPopupManager:pop()
  end
  if Panel_Window_Delivery_Information:GetShow() then
    Panel_Window_Delivery_Information:ChangeSpecialTextureInfoName("")
    Panel_Window_Delivery_Information:SetShow(false, false)
  end
end

DeliveryInformation_Refresh = function()
  -- function num : 0_12
  delivery_refreshClear()
  delivery_requsetList()
end

DeliveryInformation_OpenPanelFromWorldmap = function(waypointKey)
  -- function num : 0_13 , upvalues : deliveryInformation
  local self = deliveryInformation
  self.currentWaypointKey = waypointKey
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_Window_Delivery_Information, true)
  DeliveryInformationWindow_Open()
end

DeliveryInformation_OpenPanelFromDialog = function()
  -- function num : 0_14 , upvalues : deliveryInformation
  local self = deliveryInformation
  self.currentWaypointKey = getCurrentWaypointKey()
  Warehouse_OpenPanelFromDialogWithoutInventory(getCurrentWaypointKey(), (CppEnums.WarehoouseFromType).eWarehoouseFromType_Npc)
  Panel_Window_Warehouse:SetVerticalMiddle()
  Panel_Window_Warehouse:SetHorizonCenter()
  Panel_Window_Warehouse:SetSpanSize(100, 0)
  DeliveryInformationWindow_Open()
end

Delivery_Cancel = function(slotNo)
  -- function num : 0_15 , upvalues : deliveryInformation
  local self = deliveryInformation
  delivery_cancel(DeliveryInformation_WaypointKey(), ((self.slots)[slotNo]).deliveryIndex)
end

Delivery_Receive = function(slotNo)
  -- function num : 0_16 , upvalues : deliveryInformation
  local self = deliveryInformation
  delivery_receive(DeliveryInformation_WaypointKey(), ((self.slots)[slotNo]).deliveryIndex)
end

Delivery_Receive_All = function()
  -- function num : 0_17
  delivery_receiveAll(DeliveryInformation_WaypointKey())
end

deliveryInformation:init()
deliveryInformation:registEventHandler()
deliveryInformation:registMessageHandler()

