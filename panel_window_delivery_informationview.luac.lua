-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\delivery\panel_window_delivery_informationview.luac 

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
, _staticBackground = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Static_Bakcground"), _buttonClose = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Button_Question"), _buttonRefresh = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "Button_Refresh"), _textCount = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "StaticText_DeliveryCount"), _defaultNotify = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "StaticText_Empty_List"), _slots = (Array.new)(), list2 = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "List2_DeliveryItemListView"), _startSlotNo = 0, _slotMaxSize = 100}
deliveryInformationView.registMessageHandler = function(self)
  -- function num : 0_0
  registerEvent("EventDeliveryInfoUpdate", "DeliveryInformationView_Update")
  registerEvent("FromClient_MoveDeliveryItem", "DeliveryInformationView_Update")
end

deliveryInformationView.registEventHandler = function(self)
  -- function num : 0_1
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
  local minSize = float2()
  minSize.x = 100
  minSize.y = 50
  local list2 = (UI.getChildControl)(Panel_Window_Delivery_InformationView, "List2_DeliveryItemListView")
  local list2_Content = (UI.getChildControl)(list2, "List2_1_Content")
  local slot = {}
  list2:setMinScrollBtnSize(minSize)
  local list2_ItemSlot = (UI.getChildControl)(list2_Content, "Static_List2_Slot")
  ;
  (SlotItem.new)(slot, "DeliveryView_Slot_Icon_", 0, list2_ItemSlot, self.slotConfig)
  slot:createChild()
  ;
  (slot.icon):SetPosX(4)
  ;
  (slot.icon):SetPosY(1)
  ;
  (self.list2):changeAnimationSpeed(10)
  ;
  (self.list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "DeliveryView_ListControlCreate")
  ;
  (self.list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

local deliveryCountCache = 0
deliveryInformationView.update = function(self)
  -- function num : 0_3 , upvalues : deliveryCountCache
  (self._defaultNotify):SetShow(true)
  local deliveryList = delivery_listAll()
  if deliveryList == nil then
    return 
  end
  local deliveryCount = deliveryList:size()
  ;
  (self._textCount):SetText("(" .. deliveryCount .. "/" .. self._slotMaxSize .. ")")
  ;
  (self.list2):moveIndex(deliveryCount)
  if deliveryCountCache < deliveryCount then
    for idx = deliveryCountCache, deliveryCount - 1 do
      local deliveryInfo = deliveryList:atPointer(idx)
      if deliveryInfo ~= nil then
        ((self.list2):getElementManager()):pushKey(toInt64(0, idx))
      end
    end
  else
    do
      for idx = deliveryCount, deliveryCountCache - 1 do
        ((self.list2):getElementManager()):removeKey(toInt64(0, idx))
      end
      do
        deliveryCountCache = deliveryCount
        if deliveryCount == 0 then
          return 
        end
        ;
        (self._defaultNotify):SetShow(false)
        ;
        (self.list2):moveTopIndex()
      end
    end
  end
end

DeliveryInformationView_Refresh = function()
  -- function num : 0_4
  delivery_refreshClear()
  delivery_requsetList()
end

DeliveryInformationView_Update = function()
  -- function num : 0_5 , upvalues : deliveryInformationView
  local self = deliveryInformationView
  self._startSlotNo = 0
  self:update()
end

DeliveryInformationView_Open = function()
  -- function num : 0_6 , upvalues : deliveryInformationView
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
  -- function num : 0_7
  if not Panel_Window_Delivery_InformationView:GetShow() then
    return 
  end
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
  Panel_Window_Delivery_InformationView:ChangeSpecialTextureInfoName("")
  Panel_Window_Delivery_InformationView:SetShow(false, false)
end

DeliveryView_ListControlCreate = function(content, key)
  -- function num : 0_8 , upvalues : deliveryInformationView
  local self = deliveryInformationView
  local index = Int64toInt32(key)
  local deliveryList = delivery_listAll()
  local deliveryInfo = deliveryList:atPointer(index)
  local itemWrapper = deliveryInfo:getItemWrapper()
  local itemBG = (UI.getChildControl)(content, "Static_List2_ItemBG")
  itemBG:SetPosX(0)
  itemBG:SetPosY(0)
  local slot = {}
  local itemSlot = (UI.getChildControl)(content, "Static_List2_Slot")
  itemSlot:SetShow(true)
  itemSlot:SetPosX(8)
  itemSlot:SetPosY(8)
  itemSlot:SetSize(40, 40)
  ;
  (SlotItem.reInclude)(slot, "DeliveryView_Slot_Icon_", 0, itemSlot, self.slotConfig)
  slot:setItem(itemWrapper)
  local carriageType = (UI.getChildControl)(content, "StaticText_List2_CarriageType")
  carriageType:SetShow(true)
  if deliveryInfo:getCarriageType() == 1 then
    carriageType:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_carriage"))
  else
    if deliveryInfo:getCarriageType() == 2 then
      carriageType:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_Transport"))
    else
      if deliveryInfo:getCarriageType() == 3 then
        carriageType:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_TradeShip"))
      else
        carriageType:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_DeliveryInformation_carriageType_carriage"))
      end
    end
  end
  local departure = (UI.getChildControl)(content, "StaticText_List2_Departure")
  departure:SetShow(true)
  departure:SetText(deliveryInfo:getFromRegionName())
  local destination = (UI.getChildControl)(content, "StaticText_List2_Destination")
  destination:SetShow(true)
  destination:SetText(deliveryInfo:getToRegionName())
  local btn_Ready = (UI.getChildControl)(content, "Button_List2_Ready")
  btn_Ready:SetShow(false)
  btn_Ready:SetPosX(314)
  btn_Ready:SetPosY(5)
  local btn_Ing = (UI.getChildControl)(content, "Button_List2_Ing")
  btn_Ing:SetShow(false)
  btn_Ing:SetPosX(314)
  btn_Ing:SetPosY(5)
  local btn_Complete = (UI.getChildControl)(content, "Button_List2_Complete")
  btn_Complete:SetShow(false)
  btn_Complete:SetPosX(314)
  btn_Complete:SetPosY(5)
  if (self.const).deliveryProgressTypeRequest == deliveryInfo:getProgressType() then
    btn_Ready:SetShow(true)
  else
    if (self.const).deliveryProgressTypeIng == deliveryInfo:getProgressType() then
      btn_Ing:SetShow(true)
    else
      btn_Complete:SetShow(true)
    end
  end
  local arrow = (UI.getChildControl)(content, "Static_List2_Arrow")
  arrow:SetShow(true)
  ;
  (slot.icon):addInputEvent("Mouse_On", "DeliveryItemView_Tooltip_Show(" .. index .. ", true)")
  ;
  (slot.icon):addInputEvent("Mouse_Out", "DeliveryItemView_Tooltip_Show(" .. index .. ", false)")
end

DeliveryItemView_Tooltip_Show = function(idx, isOn)
  -- function num : 0_9 , upvalues : deliveryInformationView
  local self = deliveryInformationView
  if isOn == false then
    Panel_Tooltip_Item_hideTooltip()
  end
  local control = self.list2
  local contents = control:GetContentByKey(toInt64(0, idx))
  if contents ~= nil then
    local itemIcon = (UI.getChildControl)(contents, "Static_List2_Slot")
    if isOn == true then
      local deliveryList = delivery_listAll()
      local deliveryInfo = deliveryList:atPointer(idx)
      local itemWrapper = deliveryInfo:getItemWrapper()
      local itemSSW = itemWrapper:getStaticStatus()
      Panel_Tooltip_Item_Show(itemSSW, itemIcon, true, false, nil, nil, true)
    end
  end
end

deliveryInformationView:init()
deliveryInformationView:registEventHandler()
deliveryInformationView:registMessageHandler()

