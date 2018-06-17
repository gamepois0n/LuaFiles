Panel_WhereUseItemDirection:SetShow(false, false)
Panel_WhereUseItemDirection:SetDragAll(true)
local whereUseItem = {
  _slot = UI.getChildControl(Panel_WhereUseItemDirection, "Static_Slot"),
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true
  },
  currentItemKey = nil,
  slotNo = nil,
  saveItemSSW = nil,
  widgetItemKey = nil,
  slot = {}
}
local weightOver = UI.getChildControl(Panel_Endurance, "StaticText_WeightOver")
function WhereUseItemDirectionInit()
  local self = whereUseItem
  SlotItem.new(self.slot, "ItemSlot", 0, self._slot, self._slotConfig)
  self.slot:createChild()
  self.slot.icon:SetPosX(self.slot.icon:GetPosX() + 12)
  self.slot.icon:SetPosY(self.slot.icon:GetPosY() + 3)
  self.slot.count:SetHorizonCenter()
  self.slot.count:SetVerticalBottom()
  self.slot.count:SetSpanSize(0, -24)
  if Panel_HorseEndurance:GetShow() or Panel_CarriageEndurance:GetShow() or Panel_ShipEndurance:GetShow() then
    if PcEnduranceToggle() then
      Panel_WhereUseItemDirection:SetPosX(getScreenSizeX() - FGlobal_Panel_Radar_GetSizeX() - 280)
      Panel_WhereUseItemDirection:SetPosY(FGlobal_Panel_Radar_GetSizeY() - 180)
    else
      Panel_WhereUseItemDirection:SetPosX(getScreenSizeX() - FGlobal_Panel_Radar_GetSizeX() - 190)
      Panel_WhereUseItemDirection:SetPosY(FGlobal_Panel_Radar_GetSizeY() - 180)
    end
  else
    Panel_WhereUseItemDirection:SetPosX(getScreenSizeX() - FGlobal_Panel_Radar_GetSizeX() - 70)
    Panel_WhereUseItemDirection:SetPosY(FGlobal_Panel_Radar_GetSizeY() - 180)
  end
end
function WhereUseItemDirectionRestore(itemKey, slotNo, itemCount)
  local self = whereUseItem
  self.widgetItemKey = itemKey
  WhereUseItemDirectionUpdate(self.saveItemSSW, self.slotNo)
  self.slot.count:SetHorizonCenter()
  self.slot.count:SetVerticalBottom()
  self.slot.count:SetSpanSize(0, -24)
end
local _key
function WhereUseItemDirectionUpdate(itemSSW, slotNo, isShow)
  if nil == itemSSW or nil == slotNo then
    return
  end
  local self = whereUseItem
  local inventory = getSelfPlayer():get():getInventory()
  local inventoryType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if nil == itemWrapper then
    WhereUseItemDirectionClose()
    return
  end
  local itemSSWrapper = itemWrapper:getStaticStatus()
  if not itemSSWrapper:isExchangeItemNPC() and not itemWrapper:isSoulCollector() then
    return
  end
  self.saveItemSSW = itemSSW
  if nil ~= itemSSW then
    if nil ~= isShow then
      Panel_WhereUseItemDirection:SetShow(true)
      _key = itemSSW:get()._key:get()
    elseif _key ~= itemSSW:get()._key:get() then
      return
    end
    local itemKey = itemSSW:get()._key
    self.currentItemKey = itemKey
    s64_inventoryItemCount = inventory:getItemCount_s64(itemKey)
    if toInt64(0, 0) == s64_inventoryItemCount then
      WhereUseItemDirectionClose()
    end
    local countSoul
    if itemWrapper:isSoulCollector() then
      if itemWrapper:getSoulCollectorMaxCount() < itemWrapper:getSoulCollectorCount() then
        countSoul = itemWrapper:getSoulCollectorMaxCount()
      else
        countSoul = itemWrapper:getSoulCollectorCount()
      end
      self.slot:setItemByStaticStatus(itemWrapper:getStaticStatus(), itemWrapper:get():getCount_s64(), -1, false, false, true, itemWrapper:getSoulCollectorCount(), itemWrapper:getSoulCollectorMaxCount(), true)
    else
      self.slot:setItemByStaticStatus(itemSSW, Int64toInt32(s64_inventoryItemCount))
    end
    if self.widgetItemKey == _key then
      self.slot.icon:EraseAllEffect()
      self.slot.icon:AddEffect("fUI_Light", false, 0, 0)
    end
    self.slot.icon:addInputEvent("Mouse_RUp", "WhereUseItemDirectionClose()")
    self.slot.icon:addInputEvent("Mouse_On", "WhereUseItemDirectionSlotItemOn()")
    self.slot.icon:addInputEvent("Mouse_Out", "WhereUseItemDirectionSlotItemOff()")
  end
end
function PcEnduranceToggle()
  return weightOver:GetShow()
end
function whereUseItemDirectionPosition()
  if Panel_HorseEndurance:GetShow() or Panel_CarriageEndurance:GetShow() or Panel_ShipEndurance:GetShow() then
    if PcEnduranceToggle() then
      Panel_WhereUseItemDirection:SetPosX(getScreenSizeX() - Panel_Radar:GetSizeX() - 280)
      Panel_WhereUseItemDirection:SetPosY(Panel_Radar:GetSizeY() - 100)
    else
      Panel_WhereUseItemDirection:SetPosX(getScreenSizeX() - Panel_Radar:GetSizeX() - 190)
      Panel_WhereUseItemDirection:SetPosY(Panel_Radar:GetSizeY() - 100)
    end
  else
    Panel_WhereUseItemDirection:SetPosX(getScreenSizeX() - Panel_Radar:GetSizeX() - 150)
    Panel_WhereUseItemDirection:SetPosY(Panel_Radar:GetSizeY() - 100)
  end
end
function FGlobal_WhereUseITemDirectionOpen(itemSSW, slotNo)
  local self = whereUseItem
  self.slotNo = slotNo
  whereUseItemDirectionPosition()
  WhereUseItemDirectionUpdate(itemSSW, slotNo, true)
  self.slot.count:SetHorizonCenter()
  self.slot.count:SetVerticalBottom()
  self.slot.count:SetTextHorizonCenter()
  self.slot.count:SetSpanSize(0, -24)
end
function WhereUseItemDirectionClose()
  Panel_WhereUseItemDirection:SetShow(false)
  WhereUseItemDirectionSlotItemOff()
end
function WhereUseItemDirectionSlotItemOn()
  local self = whereUseItem
  local itemStaticWrapper = getItemEnchantStaticStatus(self.currentItemKey)
  Panel_Tooltip_Item_Show(itemStaticWrapper, self.slot.icon, true, false)
end
function WhereUseItemDirectionSlotItemOff()
  Panel_Tooltip_Item_hideTooltip()
end
function whereUseItem_registMessageHandler()
  registerEvent("EventAddItemToInventory", "WhereUseItemDirectionRestore")
end
WhereUseItemDirectionInit()
whereUseItem_registMessageHandler()
registerEvent("FromClient_RenderModeChangeState", "WhereUseItemDirectionRestore")
