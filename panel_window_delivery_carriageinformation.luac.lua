-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\delivery\panel_window_delivery_carriageinformation.luac 

-- params : ...
-- function num : 0
Panel_Window_Delivery_CarriageInformation:ActiveMouseEventEffect(true)
Panel_Window_Delivery_CarriageInformation:setMaskingChild(true)
Panel_Window_Delivery_CarriageInformation:setGlassBackground(true)
Panel_Window_Delivery_CarriageInformation:RegisterShowEventFunc(true, "DeliveryCarriageInformationShowAni()")
Panel_Window_Delivery_CarriageInformation:RegisterShowEventFunc(false, "DeliveryCarriageInformationHideAni()")
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
DeliveryCarriageInformationShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  Panel_Window_Delivery_CarriageInformation:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Window_Delivery_CarriageInformation, 0, 0.15)
  local aniInfo1 = Panel_Window_Delivery_CarriageInformation:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Window_Delivery_CarriageInformation:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_Delivery_CarriageInformation:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_Delivery_CarriageInformation:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_Delivery_CarriageInformation:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_Delivery_CarriageInformation:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

DeliveryCarriageInformationHideAni = function()
  -- function num : 0_1
  Panel_Window_Delivery_CarriageInformation:ChangeSpecialTextureInfoName("")
  Panel_Window_Delivery_CarriageInformation:SetAlpha(1)
  ;
  (UIAni.AlphaAnimation)(0, Panel_Window_Delivery_CarriageInformation, 0, 0.1)
end

local deliveryCarriageInformation = {
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, 
config = {slotCount = 4, slotStartX = 7, slotStartY = 37, slotGapY = 65, slotIconStartX = 5, slotIconStartY = 8, slotCarriageTypeStartX = 88, slotCarriageTypeStartY = 8, slotDepartureStartX = 65, slotDepartureStartY = 21, slotDestinationStartX = 215, slotDestinationStartY = 21, slotArrowStartX = 180, slotArrowStartY = 23, slotButtonStartX = 330, slotButtonStartY = 5}
, 
const = {deliveryProgressTypeRequest = 0, deliveryProgressTypeIng = 1, deliveryProgressTypeComplete = 2}
, panel_Background = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "Static_Bakcground"), button_Close = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "Button_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "Button_Question"), empty_List = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "StaticText_Empty_List"), scroll = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "Scroll_1"), slots = (Array.new)(), startSlotNo = 0}
deliveryCarriageInformation.registMessageHandler = function(self)
  -- function num : 0_2
end

deliveryCarriageInformation.registEventHandler = function(self)
  -- function num : 0_3
  (UIScroll.InputEvent)(self.scroll, "DeliveryCarriageInformation_ScrollEvent")
  ;
  (UIScroll.InputEventByControl)(self.panel_Background, "DeliveryCarriageInformation_ScrollEvent")
  ;
  (self.button_Close):addInputEvent("Mouse_LUp", "DeliveryCarriageInformationWindow_Close()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"DeliveryCarriageinformation\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"DeliveryCarriageinformation\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"DeliveryCarriageinformation\", \"false\")")
end

deliveryCarriageInformation.init = function(self)
  -- function num : 0_4
  local static_Slot = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "Static_Slot")
  local static_Item = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "Static_ItemIcon")
  local static_Arrow = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "Static_Arrow")
  local staticText_Departure = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "StaticText_Departure")
  do
    local staticText_Destination = (UI.getChildControl)(Panel_Window_Delivery_CarriageInformation, "StaticText_Destination")
    ;
    (UI.ASSERT)(self.panel_Background ~= nil and type(self.panel_Background) ~= "number", "Static_Bakcground")
    ;
    (UI.ASSERT)(self.button_Close ~= nil and type(self.button_Close) ~= "number", "Button_Close")
    ;
    (UI.ASSERT)(self.scroll ~= nil and type(self.scroll) ~= "number", "Scroll_1")
    ;
    (UI.ASSERT)(static_Slot ~= nil and type(static_Slot) ~= "number", "Static_Slot")
    ;
    (UI.ASSERT)(static_Item ~= nil and type(static_Item) ~= "number", "Static_ItemIcon")
    ;
    (UI.ASSERT)(static_Arrow ~= nil and type(static_Arrow) ~= "number", "Static_Arrow")
    ;
    (UI.ASSERT)(staticText_Departure ~= nil and type(staticText_Departure) ~= "number", "StaticText_Departure")
    ;
    (UI.ASSERT)(staticText_Destination ~= nil and type(staticText_Destination) ~= "number", "StaticText_Destination")
    for ii = 0, (self.config).slotCount - 1 do
      local slot = {}
      slot.slotNo = ii
      slot.panel = Panel_Window_Delivery_CarriageInformation
      slot.base = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_Delivery_CarriageInformation, "Delivery_Slot_" .. slot.slotNo)
      CopyBaseProperty(static_Slot, slot.base)
      slot.departure = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.base, "Delivery_Slot_Departure_" .. slot.slotNo)
      CopyBaseProperty(staticText_Departure, slot.departure)
      slot.destination = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.base, "Delivery_Slot_Destination_" .. slot.slotNo)
      CopyBaseProperty(staticText_Destination, slot.destination)
      slot.static_Arrow = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, slot.base, "Delivery_Slot_Arrow_" .. slot.slotNo)
      CopyBaseProperty(static_Arrow, slot.static_Arrow)
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
      (slot.static_Arrow):SetIgnore(true)
      ;
      (slot.base):SetShow(true)
      ;
      ((slot.icon).icon):SetShow(true)
      ;
      ((slot.icon).icon):SetEnable(true)
      ;
      (slot.departure):SetShow(true)
      ;
      (slot.destination):SetShow(true)
      ;
      (slot.static_Arrow):SetShow(true)
      ;
      (UIScroll.InputEventByControl)(slot.base, "DeliveryCarriageInformation_ScrollEvent")
      ;
      (UIScroll.InputEventByControl)((slot.icon).icon, "DeliveryCarriageInformation_ScrollEvent")
      ;
      ((slot.icon).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. ii .. ", \"DeliveryCarriageInformation\",true)")
      ;
      ((slot.icon).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. ii .. ", \"DeliveryCarriageInformation\",false)")
      Panel_Tooltip_Item_SetPosition(ii, slot.icon, "DeliveryCarriageInformation")
      ;
      (slot.base):SetShow(false)
      -- DECOMPILER ERROR at PC343: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (self.slots)[ii] = slot
    end
    ;
    (self.scroll):SetControlPos(0)
    -- DECOMPILER ERROR: 15 unprocessed JMP targets
  end
end

deliveryCarriageInformation.updateSlot = function(self)
  -- function num : 0_5
  for ii = 0, (self.config).slotCount - 1 do
    local slot = (self.slots)[ii]
    slot.slotNo = -1
    ;
    (slot.base):SetShow(false)
  end
  local deliveryList = deliveryCarriage_dlieveryList(self.objectID)
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
  local showSlot = 0
  for ii = self.startSlotNo, deliveryCount - 1 do
    if showSlot < (self.config).slotCount then
      local deliveryInfo = deliveryList:atPointer(ii)
      if deliveryInfo ~= nil then
        local itemWrapper = deliveryInfo:getItemWrapper(ii)
        if itemWrapper ~= nil then
          local slot = (self.slots)[showSlot]
          ;
          (slot.icon):setItem(itemWrapper)
          slot.slotNo = ii
          ;
          (slot.departure):SetText(deliveryInfo:getFromRegionName(ii))
          ;
          (slot.destination):SetText(deliveryInfo:getToRegionName(ii))
          ;
          (slot.base):SetShow(true)
          showSlot = showSlot + 1
        end
      end
    end
  end
  ;
  (UIScroll.SetButtonSize)(self.scroll, (self.config).slotCount, deliveryCount)
end

DeliveryCarriageInformation_ScrollEvent = function(isScrollUp)
  -- function num : 0_6 , upvalues : deliveryCarriageInformation
  local self = deliveryCarriageInformation
  local deliveryList = deliveryCarriage_dlieveryList(self.objectID)
  if deliveryList == nil then
    return 
  end
  local deliveryCount = deliveryList:size()
  self.startSlotNo = (UIScroll.ScrollEvent)(self.scroll, isScrollUp, (self.config).slotCount, deliveryCount, self.startSlotNo, 1)
  self:updateSlot()
end

DeliveryCarriageInformationWindow_Open = function(objectID)
  -- function num : 0_7 , upvalues : deliveryCarriageInformation
  if Panel_Window_Delivery_CarriageInformation:GetShow() then
    return 
  end
  local deliveryList = deliveryCarriage_dlieveryList(objectID)
  if deliveryList == nil then
    return 
  end
  Panel_Window_Delivery_CarriageInformation:ChangeSpecialTextureInfoName("")
  Panel_Window_Delivery_CarriageInformation:SetAlphaExtraChild(1)
  Panel_Window_Delivery_CarriageInformation:SetShow(true, false)
  local self = deliveryCarriageInformation
  self.startSlotNo = 0
  self.objectID = objectID
  self:updateSlot()
  ;
  (self.scroll):SetControlPos(0)
end

DeliveryCarriageInformationWindow_Close = function()
  -- function num : 0_8
  if Panel_Window_Delivery_CarriageInformation:GetShow() then
    Panel_Window_Delivery_CarriageInformation:ChangeSpecialTextureInfoName("")
    Panel_Window_Delivery_CarriageInformation:SetShow(false, false)
  end
end

DeliveryCarriageInformation_SlotIndex = function(slotNo)
  -- function num : 0_9 , upvalues : deliveryCarriageInformation
  local self = deliveryCarriageInformation
  return ((self.slots)[slotNo]).slotNo
end

DeliveryCarriageInformation_ObjectID = function()
  -- function num : 0_10 , upvalues : deliveryCarriageInformation
  local self = deliveryCarriageInformation
  return self.objectID
end

deliveryCarriageInformation:init()
deliveryCarriageInformation:registEventHandler()
deliveryCarriageInformation:registMessageHandler()

