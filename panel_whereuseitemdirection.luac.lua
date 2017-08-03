-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\uicontrolbar\panel_whereuseitemdirection.luac 

-- params : ...
-- function num : 0
Panel_WhereUseItemDirection:SetShow(false, false)
Panel_WhereUseItemDirection:SetDragAll(true)
local whereUseItem = {_slot = (UI.getChildControl)(Panel_WhereUseItemDirection, "Static_Slot"), 
_slotConfig = {createIcon = true, createBorder = true, createCount = true}
, currentItemKey = nil, slotNo = nil, saveItemSSW = nil, widgetItemKey = nil, 
slot = {}
}
local weightOver = (UI.getChildControl)(Panel_Endurance, "StaticText_WeightOver")
WhereUseItemDirectionInit = function()
  -- function num : 0_0 , upvalues : whereUseItem
  local self = whereUseItem
  ;
  (SlotItem.new)(self.slot, "ItemSlot", 0, self._slot, self._slotConfig)
  ;
  (self.slot):createChild()
  ;
  ((self.slot).icon):SetPosX(((self.slot).icon):GetPosX() + 12)
  ;
  ((self.slot).icon):SetPosY(((self.slot).icon):GetPosY() + 3)
  ;
  ((self.slot).count):SetHorizonCenter()
  ;
  ((self.slot).count):SetVerticalBottom()
  ;
  ((self.slot).count):SetSpanSize(-10, -24)
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

WhereUseItemDirectionRestore = function(itemKey, slotNo, itemCount)
  -- function num : 0_1 , upvalues : whereUseItem
  local self = whereUseItem
  self.widgetItemKey = itemKey
  WhereUseItemDirectionUpdate(self.saveItemSSW, self.slotNo)
end

local _key = nil
WhereUseItemDirectionUpdate = function(itemSSW, slotNo, isShow)
  -- function num : 0_2 , upvalues : whereUseItem, _key
  if itemSSW == nil or slotNo == nil then
    return 
  end
  local self = whereUseItem
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local inventoryType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if itemWrapper == nil then
    WhereUseItemDirectionClose()
    return 
  end
  local itemSSWrapper = itemWrapper:getStaticStatus()
  if not itemSSWrapper:isExchangeItemNPC() then
    return 
  end
  self.saveItemSSW = itemSSW
  if itemSSW ~= nil then
    if isShow ~= nil then
      Panel_WhereUseItemDirection:SetShow(true)
      _key = ((itemSSW:get())._key):get()
    else
      if _key ~= ((itemSSW:get())._key):get() then
        return 
      end
    end
    local itemKey = (itemSSW:get())._key
    self.currentItemKey = itemKey
    s64_inventoryItemCount = inventory:getItemCount_s64(itemKey)
    if toInt64(0, 0) == s64_inventoryItemCount then
      WhereUseItemDirectionClose()
    end
    ;
    (self.slot):setItemByStaticStatus(itemSSW, Int64toInt32(s64_inventoryItemCount))
    if self.widgetItemKey == _key then
      ((self.slot).icon):EraseAllEffect()
      ;
      ((self.slot).icon):AddEffect("fUI_Light", false, 0, 0)
    end
    ;
    ((self.slot).icon):addInputEvent("Mouse_RUp", "WhereUseItemDirectionClose()")
    ;
    ((self.slot).icon):addInputEvent("Mouse_On", "WhereUseItemDirectionSlotItemOn()")
    ;
    ((self.slot).icon):addInputEvent("Mouse_Out", "WhereUseItemDirectionSlotItemOff()")
  end
end

PcEnduranceToggle = function()
  -- function num : 0_3 , upvalues : weightOver
  return weightOver:GetShow()
end

whereUseItemDirectionPosition = function()
  -- function num : 0_4
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

FGlobal_WhereUseITemDirectionOpen = function(itemSSW, slotNo)
  -- function num : 0_5 , upvalues : whereUseItem
  local self = whereUseItem
  self.slotNo = slotNo
  whereUseItemDirectionPosition()
  WhereUseItemDirectionUpdate(itemSSW, slotNo, true)
end

WhereUseItemDirectionClose = function()
  -- function num : 0_6
  Panel_WhereUseItemDirection:SetShow(false)
  WhereUseItemDirectionSlotItemOff()
end

WhereUseItemDirectionSlotItemOn = function()
  -- function num : 0_7 , upvalues : whereUseItem
  local self = whereUseItem
  local itemStaticWrapper = getItemEnchantStaticStatus(self.currentItemKey)
  Panel_Tooltip_Item_Show(itemStaticWrapper, (self.slot).icon, true, false)
end

WhereUseItemDirectionSlotItemOff = function()
  -- function num : 0_8
  Panel_Tooltip_Item_hideTooltip()
end

whereUseItem_registMessageHandler = function()
  -- function num : 0_9
  registerEvent("EventAddItemToInventory", "WhereUseItemDirectionRestore")
end

WhereUseItemDirectionInit()
whereUseItem_registMessageHandler()
registerEvent("FromClient_RenderModeChangeState", "WhereUseItemDirectionRestore")

