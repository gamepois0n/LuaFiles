-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\repair\fixequip_control.luac 

-- params : ...
-- function num : 0
Panel_FixEquip_InteractortionFromInventory = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_0
  local self = PaGlobal_FixEquip
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if itemWrapper == nil then
    return 
  end
  ;
  (self._enduranceGauge):SetShow(true)
  ;
  (self._enduranceMax):SetShow(true)
  ;
  (self._enduranceGaugeValue):SetShow(true)
  ;
  (self._enduranceValue):SetShow(true)
  if (self._slotMain).empty then
    (self._slotMain):setItem(itemWrapper)
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slotMain).empty = false
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slotMain).whereType = inventoryType
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slotMain).slotNo = slotNo
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slotMain).itemKey = (itemWrapper:get()):getKey()
    local maxEndurance = ((itemWrapper:getStaticStatus()):get()):getMaxEndurance()
    local dynamicMaxEndurance = (itemWrapper:get()):getMaxEndurance()
    local endurance = (itemWrapper:get()):getEndurance()
    self._memoryFlagRecoveryCount = ((itemWrapper:getStaticStatus()):get())._repairEnduranceCount
    ;
    (self._enduranceGaugeValue):SetAniSpeed(0)
    ;
    (self._enduranceMax):SetAniSpeed(0)
    ;
    (self._enduranceGaugeValue):SetProgressRate(endurance / maxEndurance * 100)
    ;
    (self._enduranceMax):SetProgressRate(dynamicMaxEndurance / maxEndurance * 100)
    ;
    (self._enduranceValue):SetText(endurance .. " / " .. dynamicMaxEndurance .. "  [" .. maxEndurance .. "]")
    Inventory_SetFunctor(FixEquip_InvenFiler_SubItem, Panel_FixEquip_InteractortionFromInventory, FixEquip_Close, nil)
    ;
    (self._uiEquipPrice):SetShow(false)
  else
    do
      if (self._slotSub).empty then
        (self._slotSub):setItem(itemWrapper)
        ;
        (self._enduranceText):SetShow(true)
        ;
        (self._enduranceIcon):SetShow(true)
        -- DECOMPILER ERROR at PC120: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self._slotSub).empty = false
        -- DECOMPILER ERROR at PC122: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self._slotSub).whereType = inventoryType
        -- DECOMPILER ERROR at PC124: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self._slotSub).slotNo = slotNo
        -- DECOMPILER ERROR at PC132: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self._slotSub).itemKey = ((itemWrapper:get()):getKey()):getItemKey()
        if (self._slotSub).itemKey == 44195 then
          (self._enduranceText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RECOVERYCOUNT", "count", tostring(self._memoryFlagRecoveryCount)))
        else
          ;
          (self._enduranceText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RECOVERYCOUNT", "count", tostring(10)))
        end
        if self._moneyItemCheck then
          local fixEquipPrice = itemWrapper:getMoneyToRepairItemMaxEndurance((self._slotMain).itemKey)
          if toInt64(0, 0) < fixEquipPrice then
            (self._uiEquipPrice):SetShow(true)
            ;
            (self._uiEquipPrice):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_NEEDMONEY", "fixEquipPrice", makeDotMoney(fixEquipPrice)))
          else
            ;
            (self._uiEquipPrice):SetShow(false)
          end
        else
          do
            ;
            (self._uiEquipPrice):SetShow(false)
            ;
            (UI.ASSERT)(false, "Client data, UI data is Mismatch!!!!!")
            do return  end
            ;
            (self._uiButtonApplyCash):EraseAllEffect()
            ;
            (self._uiButtonApplyCash):SetMonoTone(true)
            ;
            (self._uiButtonApplyCash):SetAlpha(0.85)
            ;
            (self._uiButtonApplyCash):addInputEvent("Mouse_LUp", "")
            local isReady = PaGlobal_FixEquip:isReadyToReapirMaxEndurance()
            if isReady == true then
              (self._uiButtonApply):AddEffect("UI_Equip_Repair", true, 0, 0)
              ;
              (self._uiButtonApply):SetIgnore(false)
              ;
              (self._uiButtonApply):SetMonoTone(false)
              ;
              (self._uiButtonApply):SetEnable(true)
              ;
              (self._uiButtonApply):SetAlpha(1)
              ;
              (self._uiButtonApply):addInputEvent("Mouse_LUp", "PaGlobal_FixEquip:fixEquip_ApplyButton( false )")
              local hasCashItem = doHaveContentsItem(27, 0, false)
              if hasCashItem == true then
                (self._uiButtonApplyCash):AddEffect("UI_Equip_Repair", true, 0, 0)
                ;
                (self._uiButtonApplyCash):SetMonoTone(false)
                ;
                (self._uiButtonApplyCash):SetAlpha(1)
                ;
                (self._uiButtonApplyCash):addInputEvent("Mouse_LUp", "PaGlobal_FixEquip:fixEquip_ApplyButton( true )")
              end
              PaGlobal_FixEquip:fixEquip_clearDataStreamRecovery(true, "Panel_FixEquip_InteractortionFromInventory")
            else
              do
                ;
                (self._uiButtonApply):EraseAllEffect()
                ;
                (self._uiButtonApply):SetIgnore(true)
                ;
                (self._uiButtonApply):SetMonoTone(true)
                ;
                (self._uiButtonApply):SetEnable(false)
                ;
                (self._uiButtonApply):SetAlpha(0.85)
                ;
                (self._uiButtonApply):addInputEvent("Mouse_LUp", "")
                PaGlobal_FixEquip:fixEquip_MouseEvent_OutSlots_Done(true)
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.fixEquipMoneyUpdate = function(self)
  -- function num : 0_1
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if not Panel_FixEquip:IsShow() then
    return 
  end
  local invenMoney = ((selfPlayer:get()):getInventory()):getMoney_s64()
  ;
  (PaGlobal_FixEquip._uiTxtInven):SetText(makeDotMoney(invenMoney))
  ;
  (PaGlobal_FixEquip._uiTxtWarehouse):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  local itemWrapper = getInventoryItemByType((self._slotMain).whereType, (self._slotMain).slotNo)
  if itemWrapper == nil then
    (self._enduranceText):SetShow(false)
    ;
    (self._enduranceGauge):SetShow(false)
    ;
    (self._enduranceMax):SetShow(false)
    ;
    (self._enduranceGaugeValue):SetShow(false)
    ;
    (self._enduranceValue):SetShow(false)
    ;
    (self._enduranceIcon):SetShow(false)
    return 
  end
  local maxEndurance = ((itemWrapper:getStaticStatus()):get()):getMaxEndurance()
  local dynamicMaxEndurance = (itemWrapper:get()):getMaxEndurance()
  local endurance = (itemWrapper:get()):getEndurance()
  ;
  (self._enduranceMax):SetAniSpeed(1)
  ;
  (self._enduranceMax):SetProgressRate(dynamicMaxEndurance / maxEndurance * 100)
  ;
  (self._enduranceGaugeValue):SetAniSpeed(1)
  ;
  (self._enduranceGaugeValue):SetProgressRate(endurance / maxEndurance * 100)
  ;
  (self._enduranceValue):SetText(endurance .. " / " .. dynamicMaxEndurance .. "  [" .. maxEndurance .. "]")
  if maxEndurance <= dynamicMaxEndurance then
    (self._enduranceText):SetShow(false)
    ;
    (self._enduranceGauge):SetShow(false)
    ;
    (self._enduranceMax):SetShow(false)
    ;
    (self._enduranceGaugeValue):SetShow(false)
    ;
    (self._enduranceValue):SetShow(false)
    ;
    (self._enduranceIcon):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_ApplyButton = function(self, isHelpRepair)
  -- function num : 0_2
  local funcYesExe = nil
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local dontFix = function()
    -- function num : 0_2_0
    PaGlobal_FixEquip:fGlobal_closeFix()
    return 
  end

  local moneyWhereType = (CppEnums.ItemWhereType).eInventory
  if (self._uiChkInven):IsCheck() then
    moneyWhereType = (CppEnums.ItemWhereType).eInventory
  else
    moneyWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  local doFixEquipMaxEndurance = function()
    -- function num : 0_2_1 , upvalues : self, isHelpRepair, moneyWhereType
    -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

    (self._fixEquipData).slotNoMain = (self._slotMain).slotNo
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).whereTypeMain = (self._slotMain).whereType
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).whereTypeSub = (self._slotSub).whereType
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).itemKeySub = (self._slotSub).itemKey
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

    self._s64_allWeight = ((getSelfPlayer()):get()):getCurrentWeight_s64()
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

    self._useCash = isHelpRepair
    repair_MaxEndurance((self._slotMain).whereType, (self._slotMain).slotNo, (self._slotSub).whereType, (self._slotSub).slotNo, moneyWhereType, isHelpRepair)
    self:fixEquipMoneyUpdate()
    return 
  end

  local doFixEquipOnlyMoney = function()
    -- function num : 0_2_2 , upvalues : self, isHelpRepair
    repair_MaxEndurance((self._slotMain).whereType, (self._slotMain).slotNo, 0, 0, isHelpRepair)
    self:fixEquipMoneyUpdate()
    PaGlobal_FixEquip:fGlobal_closeFix()
    return 
  end

  do
    local doFixEquipMoneyItem = function()
    -- function num : 0_2_3 , upvalues : self, isHelpRepair, moneyWhereType
    -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

    (self._fixEquipData).slotNoMain = (self._slotMain).slotNo
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).whereTypeMain = (self._slotMain).whereType
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).whereTypeSub = (self._slotSub).whereType
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).itemKeySub = (self._slotSub).itemKey
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

    self._s64_allWeight = ((getSelfPlayer()):get()):getCurrentWeight_s64()
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

    self._useCash = isHelpRepair
    repair_MaxEndurance((self._slotMain).whereType, (self._slotMain).slotNo, (self._slotSub).whereType, (self._slotSub).slotNo, moneyWhereType, isHelpRepair)
    self:fixEquipMoneyUpdate()
    return 
  end

    funcYesExe = doFixEquipMoneyItem
    if (self._slotMain).slotNo ~= nil and (self._slotSub).slotNo ~= nil then
      local hasCashItem = doHaveContentsItem(27, 0, false)
      if hasCashItem == false and isHelpRepair == true then
        (self._uiButtonApplyCash):EraseAllEffect()
        ;
        (self._uiButtonApplyCash):SetMonoTone(true)
        ;
        (self._uiButtonApplyCash):SetAlpha(0.85)
        ;
        (self._uiButtonApplyCash):addInputEvent("Mouse_LUp", "")
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_USECASHALL"))
        return 
      end
      local itemWrapper = getInventoryItemByType((self._slotMain).whereType, (self._slotMain).slotNo)
      local memoryFlagRecoveryCount = ((itemWrapper:getStaticStatus()):get())._repairEnduranceCount
      local isMemoryFlag = (self._slotSub).itemKey == 44195
      local maxEndurance = nil
      local currentEndurance = (itemWrapper:get()):getEndurance()
      if ((itemWrapper:getStaticStatus()):get()):isUnbreakable() == false then
        maxEndurance = ((itemWrapper:getStaticStatus()):get()):getMaxEndurance()
      end
      if self._onlyItemCheck then
        if isMemoryFlag and isHelpRepair == true then
          contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", memoryFlagRecoveryCount * 3)
        elseif isMemoryFlag and isHelpRepair == false then
          contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", memoryFlagRecoveryCount)
        elseif isHelpRepair then
          contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERY_FIX_COUNT_30")
        else
          contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERY_FIX_COUNT_10")
        end
      elseif self._moneyItemCheck then
        contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_MONEYITEMCHECK_CONTENTSTRING")
      end
      if isHelpRepair == true and maxEndurance - currentEndurance < 15 then
        contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_DURABILITY_SHORTAGE") .. contentString
      end
      local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
      local messageboxData = {title = titleString, content = contentString, functionYes = funcYesExe, functionCancel = dontFix, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    else
      PaGlobal_FixEquip:fGlobal_closeFix()
    end
    -- DECOMPILER ERROR: 10 unprocessed JMP targets
  end
end

FixEquip_InvenFiler_MainItem = function(slotNo, itemWrapper)
  -- function num : 0_3
  local self = PaGlobal_FixEquip
  if itemWrapper == nil then
    return true
  end
  isAble = itemWrapper:checkToRepairItemMaxEndurance()
  return not isAble
end

FixEquip_InvenFiler_SubItem = function(slotNo, itemWrapper, inventoryType)
  -- function num : 0_4
  local self = PaGlobal_FixEquip
  if itemWrapper == nil then
    return true
  end
  local isAble = false
  local repairItemKey = (self._slotMain).itemKey
  if repairItemKey == nil then
    return true
  end
  if itemWrapper:checkToRepairItemMaxEnduranceWithMoneyAndItem(repairItemKey) and ((self._slotMain).slotNo ~= slotNo or (self._slotMain).whereType ~= inventoryType) then
    isAble = true
  end
  return not isAble
end

-- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_GetMainSlotNo = function(self)
  -- function num : 0_5
  return (self._slotMain).slotNo
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_GetSubSlotNo = function(self)
  -- function num : 0_6
  return (self._slotSub).slotNo
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_OutSlots = function(self, outSlotType)
  -- function num : 0_7
  if outSlotType == true then
    PaGlobal_FixEquip:fixEquip_clearData()
    Inventory_SetFunctor(FixEquip_InvenFiler_MainItem, Panel_FixEquip_InteractortionFromInventory, FixEquip_CloseButton, nil)
    ;
    (self._enduranceText):SetShow(false)
    ;
    (self._enduranceGauge):SetShow(false)
    ;
    (self._enduranceMax):SetShow(false)
    ;
    (self._enduranceGaugeValue):SetShow(false)
    ;
    (self._enduranceValue):SetShow(false)
    ;
    (self._enduranceIcon):SetShow(false)
  else
    PaGlobal_FixEquip:fixEquip_clearDataOnlySub()
  end
  ;
  (self._uiEquipPrice):SetShow(false)
  PaGlobal_FixEquip:fixEquip_clearDataStreamRecovery(false, "fixEquip_OutSlots")
  ;
  (self._enduranceText):SetShow(false)
  ;
  (self._enduranceIcon):SetShow(false)
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_Show = function(self)
  -- function num : 0_8
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local invenMoney = ((selfPlayer:get()):getInventory()):getMoney_s64()
  PaGlobal_FixEquip:fixEquip_clearData()
  if Panel_FixEquip:IsShow() == false then
    Panel_FixEquip:SetShow(true, false)
    Inventory_SetFunctor(FixEquip_InvenFiler_MainItem, Panel_FixEquip_InteractortionFromInventory, FixEquip_CloseButton, nil)
    InventoryWindow_Show()
    PaGlobal_FixEquip:fixEquip_FixHelp()
    audioPostEvent_SystemUi(1, 0)
  else
    self:fixEquipExit()
  end
  ;
  (self._uiChkInven):SetCheck(false)
  ;
  (self._uiChkWarehouse):SetCheck(true)
  ;
  (self._uiTxtInven):SetText(makeDotMoney(invenMoney))
  ;
  (self._uiTxtWarehouse):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  PaGlobal_FixEquip:fixEquipData_Clear()
end

FixEquip_Close = function()
  -- function num : 0_9
  local self = PaGlobal_FixEquip
  if Panel_FixEquip:IsShow() == false then
    return 
  end
  Panel_FixEquip:SetShow(false, true)
  Inventory_SetFunctor(Repair_InvenFilter, Repair_InvenRClick, handleMClickedRepairExitButton, nil)
  PaGlobal_FixEquip:fixEquip_clearData()
  ;
  (self._uiItemFix):SetCheck(true)
  ;
  (self._uiMoneyItemFix):SetCheck(false)
  PaGlobal_FixEquip:fixEquipData_Clear()
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.fixEquipExit = function(self)
  -- function num : 0_10
  FixEquip_Close()
end

FixEquip_HideAni = function()
  -- function num : 0_11
  ((UIAni.AlphaAnimation)(0, Panel_FixEquip, 0, 0.15)):SetHideAtEnd(true)
  audioPostEvent_SystemUi(1, 1)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_CancelButton = function(self)
  -- function num : 0_12
  PaGlobal_FixEquip:fixEquip_clearData()
  Inventory_SetFunctor(FixEquip_InvenFiler_MainItem, Panel_FixEquip_InteractortionFromInventory, FixEquip_CloseButton, nil)
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FixEquip.handleMClickedFixEquipItemButton = function(self)
  -- function num : 0_13
  if Panel_FixEquip:GetShow() == true then
    self._onlyItemCheck = true
    self._moneyItemCheck = false
    self:fixEquipExit()
  else
    self._onlyItemCheck = true
    self._moneyItemCheck = false
    ;
    (self._uiEquipPrice):SetShow(false)
    PaGlobal_FixEquip:fixEquip_Show()
  end
  ;
  (self._enduranceText):SetShow(false)
  ;
  (self._enduranceGauge):SetShow(false)
  ;
  (self._enduranceMax):SetShow(false)
  ;
  (self._enduranceGaugeValue):SetShow(false)
  ;
  (self._enduranceValue):SetShow(false)
  ;
  (self._enduranceIcon):SetShow(false)
  ;
  (self._enduranceMax):SetAniSpeed(0)
  ;
  (self._enduranceGaugeValue):SetAniSpeed(0)
end


