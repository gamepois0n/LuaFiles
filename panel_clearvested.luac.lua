-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\clearvested\panel_clearvested.luac 

-- params : ...
-- function num : 0
Panel_ClearVested:SetShow(false, false)
Panel_ClearVested:ActiveMouseEventEffect(true)
local UI_TM = CppEnums.TextMode
local ClearVestedWindow = {_buttonApply = (UI.getChildControl)(Panel_ClearVested, "Button_Apply"), _buttonCancel = (UI.getChildControl)(Panel_ClearVested, "Button_Cancel"), 
_slotVestedItem = {icon = (UI.getChildControl)(Panel_ClearVested, "Static_Slot_0"), isEmpty = true}
, 
_slotConfig = {createIcon = false, createBorder = true, createCount = true, createCash = true}
, _toWhereType = nil, _toSlotNo = nil, _fromWhereType = nil, _fromSlotNo = nil}
ClearVestedWindow.initialize = function(self)
  -- function num : 0_0
  (SlotItem.new)(self._slotVestedItem, "Slot_0", 0, Panel_ClearVested, self._slotConfig)
  ;
  (self._slotVestedItem):createChild()
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotVestedItem).isEmpty = true
  ;
  (self._buttonApply):addInputEvent("Mouse_LUp", "HandleClicked_ApplyButton()")
  ;
  (self._buttonCancel):addInputEvent("Mouse_LUp", "HandleClicked_CancelButton()")
  ;
  ((self._slotVestedItem).icon):addInputEvent("Mouse_On", "HandleOn_SlotVestedItem()")
  ;
  ((self._slotVestedItem).icon):addInputEvent("Mouse_Out", "HandleOut_SlotVestedItem()")
end

HandleClicked_ApplyButton = function()
  -- function num : 0_1 , upvalues : ClearVestedWindow
  if (ClearVestedWindow._slotVestedItem).isEmpty == false then
    ToClient_ClearVestedRequest(ClearVestedWindow._toWhereType, ClearVestedWindow._toSlotNo, ClearVestedWindow._fromWhereType, ClearVestedWindow._fromSlotNo)
  end
end

HandleClicked_CancelButton = function()
  -- function num : 0_2
  FromClient_HideWindow()
end

HandleOn_SlotVestedItem = function()
  -- function num : 0_3 , upvalues : ClearVestedWindow
  if ClearVestedWindow._slotVestedItem == nil then
    local itemWrapper = getInventoryItemByType(ClearVestedWindow._toWhereType, ClearVestedWindow._toSlotNo)
    if itemWrapper ~= nil then
      Panel_Tooltip_Item_Show(itemWrapper:getStaticStatus(), (ClearVestedWindow._slotVestedItem).icon, true, false)
    end
  end
end

HandleOut_SlotVestedItem = function()
  -- function num : 0_4 , upvalues : ClearVestedWindow
  if ClearVestedWindow._slotVestedItem == nil then
    Panel_Tooltip_Item_hideTooltip()
  end
end

FromClient_ShowWindow = function(fromWhereType, fromSlotNo)
  -- function num : 0_5 , upvalues : ClearVestedWindow
  Inventory_SetFunctor(InvenFiler_VestedItem, VestedItem_InteractionFromInventory, nil, nil)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ClearVestedWindow._fromWhereType = fromWhereType
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  ClearVestedWindow._fromSlotNo = fromSlotNo
  Panel_ClearVested:SetShow(true)
end

FromClient_HideWindow = function()
  -- function num : 0_6 , upvalues : ClearVestedWindow
  Inventory_SetFunctor(nil, nil, nil, nil)
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (ClearVestedWindow._slotVestedItem).isEmpty = true
  ;
  (ClearVestedWindow._slotVestedItem):clearItem()
  Panel_ClearVested:SetShow(false)
end

InvenFiler_VestedItem = function(slotNo, itemWrapper)
  -- function num : 0_7
  if itemWrapper == nil then
    return true
  end
  do return itemWrapper:checkToClearVested() == false end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

VestedItem_InteractionFromInventory = function(slotNo, itemWrapper, stackCount, inventoryType)
  -- function num : 0_8 , upvalues : ClearVestedWindow
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R4 in 'UnsetPending'

  if itemWrapper:checkToClearVested() then
    ClearVestedWindow._toSlotNo = slotNo
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

    ClearVestedWindow._toWhereType = inventoryType
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (ClearVestedWindow._slotVestedItem).isEmpty = false
    ;
    (ClearVestedWindow._slotVestedItem):setItem(itemWrapper)
  end
end

ClearVestedWindow:initialize()
registerEvent("FromClient_ShowWindow", "FromClient_ShowWindow")
registerEvent("FromClient_HideWindow", "FromClient_HideWindow")

