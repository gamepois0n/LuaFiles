-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\carveseal\panel_carveseal.luac 

-- params : ...
-- function num : 0
Panel_CarveSeal:SetShow(false, false)
Panel_CarveSeal:ActiveMouseEventEffect(true)
local SealWindow = {_buttonApply = (UI.getChildControl)(Panel_CarveSeal, "Button_Apply"), _buttonCancel = (UI.getChildControl)(Panel_CarveSeal, "Button_Close"), 
_slotTargetItem = {icon = (UI.getChildControl)(Panel_CarveSeal, "Static_Slot_0"), empty = true}
, 
_slotConfig = {createIcon = false, createBorder = true, createCount = true, createCash = true}
, _inventoryTypeSealItem = nil, _slotNoSealItem = nil, _inventoryTypeTargetItem = nil, _slotNoTargetItem = nil}
local SealWindowHelpMessage = {}
SealWindow.initialize = function(self)
  -- function num : 0_0 , upvalues : SealWindow
  (SlotItem.new)(SealWindow._slotTargetItem, "Slot_0", 0, Panel_CarveSeal, self._slotConfig)
  ;
  (self._slotTargetItem):createChild()
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotTargetItem).empty = true
  ;
  (self._buttonApply):addInputEvent("Mouse_LUp", "HandleClickedApplyButton()")
  ;
  (self._buttonCancel):addInputEvent("Mouse_LUp", "FromClient_SealWindowHide()")
  ;
  ((self._slotTargetItem).icon):addInputEvent("Mouse_On", "HandleOnTargetItem()")
  ;
  ((self._slotTargetItem).icon):addInputEvent("Mouse_Out", "HandleOutTargetItem()")
end

HandleOnTargetItem = function()
  -- function num : 0_1 , upvalues : SealWindow
  if SealWindow._slotNoTargetItem == nil then
    local itemWrapper = getInventoryItemByType(SealWindow._inventoryTypeTargetItem, SealWindow._slotNoTargetItem)
    if itemWrapper ~= nil then
      Panel_Tooltip_Item_Show(itemWrapper, (SealWindow._slotTargetItem).icon, false, true)
    end
  end
end

HandleOutTargetItem = function()
  -- function num : 0_2 , upvalues : SealWindow
  if SealWindow._slotNoTargetItem == nil then
    Panel_Tooltip_Item_hideTooltip()
  end
end

FromClient_SealWindowShow = function(inventoryType, slotNoSealItem)
  -- function num : 0_3 , upvalues : SealWindow
  Inventory_SetFunctor(Seal_InvenFiler, HandleSeal_InteractionFromInventory, nil, nil)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  SealWindow._inventoryTypeSealItem = inventoryType
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  SealWindow._slotNoSealItem = slotNoSealItem
  Panel_CarveSeal:SetShow(true)
end

FromClient_SealWindowHide = function()
  -- function num : 0_4 , upvalues : SealWindow
  Inventory_SetFunctor(nil, nil, nil, nil)
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (SealWindow._slotTargetItem).empty = true
  ;
  (SealWindow._slotTargetItem):clearItem()
  Panel_CarveSeal:SetShow(false)
end

HandleClickedApplyButton = function()
  -- function num : 0_5 , upvalues : SealWindow
  if (SealWindow._slotTargetItem).empty == false then
    ToClient_CarveSealRequest(SealWindow._inventoryTypeSealItem, SealWindow._slotNoSealItem, SealWindow._inventoryTargetItem, SealWindow._slotNoTargetItem, true)
  end
end

Seal_InvenFiler = function(slotNo, itemWrapper)
  -- function num : 0_6
  if itemWrapper == nil then
    return true
  end
  do
    local staticStatus = itemWrapper:getStaticStatus()
    if staticStatus == nil then
      return true
    end
    if itemWrapper:isSealed() then
      return true
    end
    do return staticStatus:isPossibleCarveSeal() == false end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

HandleSeal_InteractionFromInventory = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_7 , upvalues : SealWindow
  local staticStatus = itemWrapper:getStaticStatus()
  if staticStatus == nil then
    return 
  end
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R5 in 'UnsetPending'

  if staticStatus:isPossibleCarveSeal() then
    (SealWindow._slotTargetItem).empty = false
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R5 in 'UnsetPending'

    SealWindow._inventoryTypeTargetItem = inventoryType
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

    SealWindow._slotNoTargetItem = slotNo
    ;
    (SealWindow._slotTargetItem):setItem(itemWrapper)
  end
end

SealWindow:initialize()
registerEvent("FromClient_CarveSeal_Show", "FromClient_SealWindowShow")
registerEvent("FromClinet_CarveSeal_Hide", "FromClient_SealWindowHide")

