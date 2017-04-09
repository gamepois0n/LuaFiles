-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\delivery\panel_window_delivery_informationview.luac 

-- params : ...
-- function num : 0
Panel_Window_Delivery_InformationView:ActiveMouseEventEffect(true)
Panel_Window_Delivery_InformationView:setMaskingChild(true)
Panel_Window_Delivery_InformationView:setGlassBackground(true)
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local deliveryInformationView = {
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
config = {slotCount = 7, slotStartX = 10, slotStartY = 70, slotGapY = 70, slotIconStartX = 5, slotIconStartY = 8, slotCarriageTypeStartX = 88, slotCarriageTypeStartY = 8, slotDepartureStartX = 65, slotDepartureStartY = 31, slotDestinationStartX = 215, slotDestinationStartY = 31, slotArrowStartX = 180, slotArrowStartY = 34, slotButtonStartX = 320, slotButtonStartY = 5}
, 
const = {deliveryProgressTypeRequest = 0, deliveryProgressTypeIng = 1, deliveryProgressTypeComplete = 2}
, _staticBackground = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Static_Bakcground"), _buttonClose = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Button_Question"), _buttonRefresh = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Button_Refresh"), _textCount = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "StaticText_DeliveryCount"), _defaultNotify = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "StaticText_Empty_List"), _scroll = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Scroll_1"), _slots = (Array.new)(), _startSlotNo = 0, _slotMaxSize = 100}
local scrollCtrlBtn = (UI.getChildControl)(deliveryInformationView._scroll, "Scroll_1_CtrlButton")
scrollCtrlBtn:addInputEvent("Mouse_LPress", "HandleClicked_Delivery_ScrollBtn()")
deliveryInformationView.registMessageHandler = function(self)
  -- function num : 0_0
  registerEvent("EventDeliveryInfoUpdate", "DeliveryInformationView_Update")
  registerEvent("FromClient_MoveDeliveryItem", "DeliveryInformationView_Update")
end

deliveryInformationView.registEventHandler = function(self)
  -- function num : 0_1
  Panel_Window_Delivery_InformationView:addInputEvent("Mouse_UpScroll", "DeliveryInformationView_ScrollEvent( true )")
  Panel_Window_Delivery_InformationView:addInputEvent("Mouse_DownScroll", "DeliveryInformationView_ScrollEvent( false )")
  ;
  (self._staticBackground):addInputEvent("Mouse_UpScroll", "DeliveryInformationView_ScrollEvent( true )")
  ;
  (self._staticBackground):addInputEvent("Mouse_DownScroll", "DeliveryInformationView_ScrollEvent( false )")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "DeliveryInformationView_Close()")
  ;
  (self._buttonRefresh):addInputEvent("Mouse_LUp", "DeliveryInformationView_Refresh()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"DeliveryInformation\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"DeliveryInformation\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"DeliveryInformation\", \"false\")")
end

deliveryInformationView.init = function(self)
  -- function num : 0_2
  for ii = 0, (self.config).slotCount - 1 do
    local slot = {}
    slot.slotNo = ii
    slot.panel = Panel_Window_Delivery_InformationView
    slot.base = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_InformationView, "Static_Slot", Panel_Window_Delivery_InformationView, "DeliveryView_Slot_" .. ii)
    slot.carriageType = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_InformationView, "StaticText_CarriageType", slot.base, "DeliveryView_Slot_CarriageType_" .. ii)
    slot.departure = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_InformationView, "StaticText_Departure", slot.base, "DeliveryView_Slot_Departure_" .. ii)
    slot.destination = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_InformationView, "StaticText_Destination", slot.base, "DeliveryView_Slot_Destination_" .. ii)
    slot.static_Arrow = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_InformationView, "Static_Arrow", slot.base, "DeliveryView_Slot_Arrow_" .. ii)
    slot.buttonReady = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_InformationView, "Button_Ready", slot.base, "DeliveryView_Slot_Ready_" .. ii)
    slot.buttonIng = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_InformationView, "Button_Ing", slot.base, "DeliveryView_Slot_Ing_" .. ii)
    slot.buttonComplete = (UI.createAndCopyBasePropertyControl)(Panel_Window_Delivery_InformationView, "Button_Complete", slot.base, "DeliveryView_Slot_Complete_" .. ii)
    slot.icon = {}
    ;
    (SlotItem.new)(slot.icon, "DeliveryView_Slot_Icon_" .. slot.slotNo, slot.slotNo, slot.base, self.slotConfig)
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
    (slot.buttonReady):SetPosX((self.config).slotButtonStartX)
    ;
    (slot.buttonReady):SetPosY((self.config).slotButtonStartY)
    ;
    (slot.buttonIng):SetPosX((self.config).slotButtonStartX)
    ;
    (slot.buttonIng):SetPosY((self.config).slotButtonStartY)
    ;
    (slot.buttonComplete):SetPosX((self.config).slotButtonStartX)
    ;
    (slot.buttonComplete):SetPosY((self.config).slotButtonStartY)
    ;
    (slot.base):addInputEvent("Mouse_UpScroll", "DeliveryInformationView_ScrollEvent( true )")
    ;
    (slot.base):addInputEvent("Mouse_DownScroll", "DeliveryInformationView_ScrollEvent( false )")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_UpScroll", "DeliveryInformationView_ScrollEvent( true )")
    ;
    ((slot.icon).icon):addInputEvent("Mouse_DownScroll", "DeliveryInformationView_ScrollEvent( false )")
    slot.deliveryIndex = 0
    -- DECOMPILER ERROR at PC226: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
end

deliveryInformationView.update = function(self)
  -- function num : 0_3
  for ii = 0, (self.config).slotCount - 1 do
    local slot = (self._slots)[ii]
    ;
    (slot.base):SetShow(false)
  end
  ;
  (self._defaultNotify):SetShow(true)
  local deliveryList = delivery_listAll()
  if deliveryList == nil then
    return 
  end
  local deliveryCount = deliveryList:size()
  ;
  (self._textCount):SetText("(" .. deliveryCount .. "/" .. self._slotMaxSize .. ")")
  if deliveryCount == 0 then
    return 
  end
  ;
  (self._defaultNotify):SetShow(false)
  local slotIndex = 0
  for ii = self._startSlotNo, deliveryCount - 1 do
    if slotIndex < (self.config).slotCount then
      local deliveryInfo = deliveryList:atPointer(ii)
      if deliveryInfo ~= nil then
        local itemWrapper = deliveryInfo:getItemWrapper()
        if itemWrapper ~= nil then
          local slot = (self._slots)[slotIndex]
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
          ;
          (slot.buttonReady):SetShow(false)
          ;
          (slot.buttonIng):SetShow(false)
          ;
          (slot.buttonComplete):SetShow(false)
          if (self.const).deliveryProgressTypeRequest == deliveryInfo:getProgressType() then
            (slot.buttonReady):SetShow(true)
          else
            if (self.const).deliveryProgressTypeIng == deliveryInfo:getProgressType() then
              (slot.buttonIng):SetShow(true)
            else
              ;
              (slot.buttonComplete):SetShow(true)
            end
          end
          slot.deliveryIndex = ii
          ;
          (slot.base):SetShow(true)
          slotIndex = slotIndex + 1
        end
      end
    end
  end
  ;
  (UIScroll.SetButtonSize)(self._scroll, (self.config).slotCount, deliveryCount)
end

DeliveryInformationView_Refresh = function()
  -- function num : 0_4
  delivery_refreshClear()
  delivery_requsetList()
end

DeliveryInformationView_ScrollEvent = function(isScrollUp)
  -- function num : 0_5 , upvalues : deliveryInformationView
  local self = deliveryInformationView
  local deliveryList = delivery_listAll()
  if deliveryList == nil then
    return 
  end
  ;
  (self._scroll):SetShow(false)
  local deliveryCount = deliveryList:size()
  if deliveryCount >= 5 then
    (self._scroll):SetShow(true)
    self._startSlotNo = (UIScroll.ScrollEvent)(self._scroll, isScrollUp, (self.config).slotCount, deliveryCount, self._startSlotNo, 1)
  else
    ;
    (self._scroll):SetShow(false)
  end
  self:update()
end

HandleClicked_Delivery_ScrollBtn = function()
  -- function num : 0_6 , upvalues : deliveryInformationView
  local deliveryList = delivery_listAll()
  if deliveryList == nil then
    return 
  end
  local deliveryCount = deliveryList:size()
  if deliveryCount == 0 then
    return 
  end
  local self = deliveryInformationView
  local posByIndex = 1 / (deliveryCount - (self.config).slotCount)
  local currentIndex = (math.floor)((self._scroll):GetControlPos() / posByIndex)
  self._startSlotNo = currentIndex
  self:update()
end

DeliveryInformationView_Update = function()
  -- function num : 0_7 , upvalues : deliveryInformationView
  local self = deliveryInformationView
  ;
  (self._scroll):SetControlPos(0)
  self._startSlotNo = 0
  self:update()
end

DeliveryInformationView_Open = function()
  -- function num : 0_8 , upvalues : deliveryInformationView
  local self = deliveryInformationView
  if Panel_Window_Delivery_InformationView:GetShow() then
    return 
  end
  delivery_requsetList()
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_Window_Delivery_InformationView, true)
    if isWorldMapGrandOpen() then
      Panel_Window_Delivery_InformationView:SetPosX(getScreenSizeX() - Panel_Window_Delivery_InformationView:GetSizeX() - 10)
      Panel_Window_Delivery_InformationView:SetPosY(getScreenSizeY() / 2 - Panel_Window_Delivery_InformationView:GetSizeY() / 2)
    end
  end
  DeliveryInformationView_Update()
  Panel_Window_Delivery_InformationView:SetAlphaExtraChild(1)
  Panel_Window_Delivery_InformationView:SetShow(true, true)
end

DeliveryInformationView_Close = function()
  -- function num : 0_9
  if not Panel_Window_Delivery_InformationView:GetShow() then
    return 
  end
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
  Panel_Window_Delivery_InformationView:ChangeSpecialTextureInfoName("")
  Panel_Window_Delivery_InformationView:SetShow(false, false)
end

deliveryInformationView:init()
deliveryInformationView:registEventHandler()
deliveryInformationView:registMessageHandler()

