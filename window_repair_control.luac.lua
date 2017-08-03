-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\repair\window_repair_control.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.handleMClickedEquippedItemButton = function(self)
  -- function num : 0_0
  PaGlobal_Repair:messageBoxRepairAllEquippedItem()
  PaGlobal_Repair:cursor_PosUpdate()
  ;
  (self._uiRepairCursor):AddEffect("fUI_Repair01", false, -8, -8)
end

-- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.handleMClickedInvenItemButton = function(self)
  -- function num : 0_1
  PaGlobal_Repair:messageBoxRepairAllInvenItem()
  PaGlobal_Repair:cursor_PosUpdate()
  ;
  (self._uiRepairCursor):AddEffect("fUI_Repair01", false, -8, -8)
end

-- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.RepairExit = function(self)
  -- function num : 0_2
  handleMClickedRepairExitButton()
end

handleMClickedRepairExitButton = function()
  -- function num : 0_3
  PaGlobal_Repair:repair_OpenPanel(false)
  PaGlobal_FixEquip:fixEquipExit()
  PaGlobal_Camp:setIsCamping()
end

Repair_InvenFilter = function(slotNo, itemWrapper)
  -- function num : 0_4
  if itemWrapper == nil then
    return true
  end
  local isAble = itemWrapper:checkToRepairItem()
  return not isAble
end

Repair_InvenRClick = function(slotNo, itemWrapper, s64_itemCount, itemWhereType)
  -- function num : 0_5
  local self = PaGlobal_Repair
  local isAble = itemWrapper:checkToRepairItem()
  if not isAble then
    return 
  end
  PaGlobal_Repair:cursor_PosUpdate()
  ;
  (self._uiRepairCursor):AddEffect("fUI_Repair01", false, -8, -8)
  local repairPrice = repair_getRepairPrice_s64(itemWhereType, slotNo, (CppEnums.ServantType).Type_Count)
  if (Defines.s64_const).s64_0 < repairPrice then
    local strPrice = (string.format)("%d", Int64toInt32(repairPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_MESSAGEBOX_MEMO", "price", strPrice)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = Repair_Item_MessageBox_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    self._repairWhereType = itemWhereType
    self._repairSlotNo = slotNo
  end
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.repair_EquipWindowRClick = function(self, equipSlotNo, itemWrapper)
  -- function num : 0_6
  local isAble = itemWrapper:checkToRepairItem()
  if not isAble then
    return 
  end
  PaGlobal_Repair:cursor_PosUpdate()
  ;
  (self._uiRepairCursor):AddEffect("fUI_Repair01", false, -8, -8)
  local repairPrice = repair_getRepairPrice_s64((CppEnums.ItemWhereType).eEquip, equipSlotNo, (CppEnums.ServantType).Type_Count)
  if (Defines.s64_const).s64_0 < repairPrice then
    local strPrice = (string.format)("%d", Int64toInt32(repairPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_MESSAGEBOX_MEMO", "price", strPrice)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = Repair_Item_MessageBox_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    self._repairWhereType = (CppEnums.ItemWhereType).eEquip
    self._repairSlotNo = equipSlotNo
  end
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.messageBoxRepairAllEquippedItem = function(self)
  -- function num : 0_7
  local s64_totalPrice = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eEquip, true, (CppEnums.ServantType).Type_Count, false)
  if (Defines.s64_const).s64_0 < s64_totalPrice then
    local strPrice = (string.format)("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = Repair_AllItem_MessageBox_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "REPAIR_NOT_MESSAGEBOX_MEMO")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.handleMClickedHorseItemRepairButton = function(self)
  -- function num : 0_8
  local s64_totalPrice = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eServantEquip, true, (CppEnums.ServantType).Type_Vehicle, false)
  if (Defines.s64_const).s64_0 < s64_totalPrice then
    local strPrice = (string.format)("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = Repair_AllItem_MessageBox_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.handleMClickedShipItemRepairButton = function(self)
  -- function num : 0_9
  local s64_totalPrice = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eServantEquip, true, (CppEnums.ServantType).Type_Ship, false)
  if (Defines.s64_const).s64_0 < s64_totalPrice then
    local strPrice = (string.format)("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = Repair_AllItem_MessageBox_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.handleMClickedElephantRepairButton = function(self)
  -- function num : 0_10
  local s64_totalPrice = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eServantEquip, true, (CppEnums.ServantType).Type_Vehicle, true)
  local GuildMoneyRepairElephant = function()
    -- function num : 0_10_0
    repair_AllItem((CppEnums.ItemWhereType).eGuildWarehouse)
  end

  if (Defines.s64_const).s64_0 < s64_totalPrice then
    local strPrice = (string.format)("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO_ELEPHANT", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = GuildMoneyRepairElephant, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Repair.messageBoxRepairAllInvenItem = function(self)
  -- function num : 0_11
  local inventory_s64 = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eInventory, true, (CppEnums.ServantType).Type_Count, false)
  local totalPrices_64 = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eCashInventory, false, (CppEnums.ServantType).Type_Count, false)
  if (Defines.s64_const).s64_0 < totalPrices_64 then
    local strPrice = (string.format)("%d", Int64toInt32(totalPrices_64))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_INVENTORY_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = Repair_AllItem_MessageBox_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "REPAIR_NOT_MESSAGEBOX_MEMO")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

Repair_AllItem_MessageBox_Confirm = function()
  -- function num : 0_12
  local self = PaGlobal_Repair
  local invenMoney = (self._uiRepairInvenMoney):IsCheck()
  local wareHouseMoney = (self._uiRepairWareHouseMoney):IsCheck()
  local moneyWhereType = (CppEnums.ItemWhereType).eInventory
  if invenMoney then
    moneyWhereType = (CppEnums.ItemWhereType).eInventory
  else
    moneyWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  if PaGlobal_Camp:getIsCamping() then
    repair_AllItemByCamping()
  else
    repair_AllItem(moneyWhereType)
  end
end

Repair_Item_MessageBox_Confirm = function()
  -- function num : 0_13
  local self = PaGlobal_Repair
  local invenMoney = (self._uiRepairInvenMoney):IsCheck()
  local wareHouseMoney = (self._uiRepairWareHouseMoney):IsCheck()
  local moneyWhereType = (CppEnums.ItemWhereType).eInventory
  if invenMoney then
    moneyWhereType = (CppEnums.ItemWhereType).eInventory
  else
    moneyWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  if PaGlobal_Camp:getIsCamping() then
    repair_ItemByCamping(self._repairWhereType, self._repairSlotNo, (CppEnums.ServantType).Type_Count)
  else
    repair_Item(self._repairWhereType, self._repairSlotNo, moneyWhereType, (CppEnums.ServantType).Type_Count)
  end
end


