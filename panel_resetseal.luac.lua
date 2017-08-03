-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\carveseal\panel_resetseal.luac 

-- params : ...
-- function num : 0
Panel_ResetSeal:SetShow(false, false)
Panel_ResetSeal:ActiveMouseEventEffect(true)
local ResetSealWindow = {_buttonApply = (UI.getChildControl)(Panel_ResetSeal, "Button_Apply"), _buttonCancel = (UI.getChildControl)(Panel_ResetSeal, "Button_Close"), 
_slotTargetItem = {icon = (UI.getChildControl)(Panel_ResetSeal, "Static_Slot_0"), empty = true}
, 
_slotConfig = {createIcon = false, createBorder = true, createCount = true, createCash = true}
, _inventoryTypeResetItem = nil, _slotNoResetItem = nil, _inventoryTypeTargetItem = nil, _slotNoTargetItem = nil}
local ResetSealWindowHelpMessage = {}
ResetSealWindow.initialize = function(self)
  -- function num : 0_0
  (SlotItem.new)(self._slotTargetItem, "Slot_0", 0, Panel_ResetSeal, self._slotConfig)
  ;
  (self._slotTargetItem):createChild()
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotTargetItem).empty = true
  ;
  (self._buttonApply):addInputEvent("Mouse_LUp", "HandleClicked_ResetSealApplyButton()")
  ;
  (self._buttonCancel):addInputEvent("Mouse_LUp", "HandleClicked_ResetSealCancelButton()")
  ;
  ((self._slotTargetItem).icon):addInputEvent("Mouse_On", "HandleOn_TargetSlot()")
  ;
  ((self._slotTargetItem).icon):addInputEvent("Mouse_Out", "HandleOut_TargetSlot()")
end

HandleClicked_ResetSealApplyButton = function()
  -- function num : 0_1 , upvalues : ResetSealWindow
  local self = ResetSealWindow
  if (ResetSealWindow._slotTargetItem).empty == false then
    ToClient_CarveSealRequest(self._inventoryTypeResetItem, self._slotNoResetItem, self._inventoryTypeTargetItem, self._slotNoTargetItem, false)
  end
end

HandleClicked_ResetSealCancelButton = function()
  -- function num : 0_2 , upvalues : ResetSealWindow
  Inventory_SetFunctor(nil, nil, nil, nil)
  ;
  (ResetSealWindow._slotTargetItem):clearItem()
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  ResetSealWindow._inventoryTypeResetItem = nil
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  ResetSealWindow._slotNoResetItem = nil
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  ResetSealWindow._inventoryTypeTargetItem = nil
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  ResetSealWindow._slotNoTargetItem = nil
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (ResetSealWindow._slotTargetItem).empty = true
  Panel_ResetSeal:SetShow(false)
end

HandleOn_TargetSlot = function()
  -- function num : 0_3 , upvalues : ResetSealWindow
  if ResetSealWindow._slotNoTargetItem == nil then
    local itemWrapper = getInventoryItemByType(ResetSealWindow._inventoryTypeTargetItem, ResetSealWindow._slotNoTargetItem)
    Panel_Tooltip_Item_Show(itemWrapper, (ResetSealWindow._slotTargetItem).icon, false, true)
  end
end

HandleOut_TargetSlot = function()
  -- function num : 0_4 , upvalues : ResetSealWindow
  if ResetSealWindow._slotNoTargetItem == nil then
    Panel_Tooltip_Item_hideTooltip()
  end
end

ResetSeal_InvenFiler = function(slotNo, itemWrapper)
  -- function num : 0_5
  if itemWrapper == nil then
    return true
  end
  do return itemWrapper:isSealed() == false end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

HandleResetSeal_InteractionFromInventory = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_6 , upvalues : ResetSealWindow
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R4 in 'UnsetPending'

  if itemWrapper:isSealed() then
    (ResetSealWindow._slotTargetItem).empty = false
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R4 in 'UnsetPending'

    ResetSealWindow._inventoryTypeTargetItem = inventoryType
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R4 in 'UnsetPending'

    ResetSealWindow._slotNoTargetItem = slotNo
    ;
    (ResetSealWindow._slotTargetItem):setItem(itemWrapper)
  end
end

FromClient_ResetSealShow = function(inventoryType, slotNoReset)
  -- function num : 0_7 , upvalues : ResetSealWindow
  Inventory_SetFunctor(ResetSeal_InvenFiler, HandleResetSeal_InteractionFromInventory, nil, nil)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ResetSealWindow._inventoryTypeResetItem = inventoryType
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  ResetSealWindow._slotNoResetItem = slotNoReset
  Panel_ResetSeal:SetShow(true)
end

FromClient_ResetSealHide = function()
  -- function num : 0_8
  HandleClicked_ResetSealCancelButton()
end

ResetSealWindow:initialize()
registerEvent("FromClient_ResetSealShow", "FromClient_ResetSealShow")
registerEvent("FromClient_ResetSealHide", "FromClient_ResetSealHide")

