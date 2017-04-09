-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\repair\fixequip_main.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_FixEquip:setMaskingChild(true)
Panel_FixEquip:RegisterShowEventFunc(true, "FixEquip_ShowAni()")
Panel_FixEquip:RegisterShowEventFunc(false, "FixEquip_HideAni()")
PaGlobal_FixEquip = {_s64_allWeight, _useCash, _onlyItemCheck; 
_slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, _uiButtonApply = (UI.getChildControl)(Panel_FixEquip, "Button_Apply"), _uiButtonApplyCash = (UI.getChildControl)(Panel_FixEquip, "Button_CashItemUse"), _uiFixHelp = (UI.getChildControl)(Panel_FixEquip, "StaticText_HelpDesc"), _uiItemFix = (UI.getChildControl)(Panel_FixEquip, "RadioButton_OnlyItem"), _uiMoneyItemFix = (UI.getChildControl)(Panel_FixEquip, "RadioButton_ItemMoneyRecovery"), _uiEquipPrice = (UI.getChildControl)(Panel_FixEquip, "StaticText_EquipPrice"), _uiStreamRecovery = (UI.getChildControl)(Panel_FixEquip, "CheckButton_StreamRecovery"), _uiChkInven = (UI.getChildControl)(Panel_FixEquip, "RadioButton_Icon_Money"), _uiChkWarehouse = (UI.getChildControl)(Panel_FixEquip, "RadioButton_Icon_Money2"), _uiTxtInven = (UI.getChildControl)(Panel_FixEquip, "Static_Text_Money"), _uiTxtWarehouse = (UI.getChildControl)(Panel_FixEquip, "Static_Text_Money2"), _uiButtonQuestion = (UI.getChildControl)(Panel_FixEquip, "Button_Question"), _slot_0_Notice = (UI.getChildControl)(Panel_FixEquip, "StaticText_Notice_Slot_0"), _slot_1_Notice = (UI.getChildControl)(Panel_FixEquip, "StaticText_Notice_Slot_1"), 
_fixEquipData = {slotNoMain, whereTypeMain, whereTypeSub, itemKeySub}
, _slotMain = nil, _slotSub = nil, 
_slotMainTbl = {}
, 
_slotSubTbl = {}
, _onlyMoneyCheck = false, _moneyItemCheck = false}
-- DECOMPILER ERROR at PC134: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.initialize = function(self)
  -- function num : 0_0
  (self._uiStreamRecovery):SetShow(true)
  self._onlyItemCheck = (self._uiItemFix):IsCheck()
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelFixEquip\" )")
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelFixEquip\", \"true\")")
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelFixEquip\", \"false\")")
  local btnButtonApplySizeX = (self._uiButtonApply):GetSizeX() + 23
  local btnButtonApplyTextPosX = btnButtonApplySizeX - btnButtonApplySizeX / 2 - (self._uiButtonApply):GetTextSizeX() / 2
  ;
  (self._uiButtonApply):SetTextSpan(btnButtonApplyTextPosX, 5)
  local btnButtonApplyCashSizeX = (self._uiButtonApplyCash):GetSizeX() + 23
  local btnButtonApplyCashTextPosX = btnButtonApplyCashSizeX - btnButtonApplyCashSizeX / 2 - (self._uiButtonApplyCash):GetTextSizeX() / 2
  ;
  (self._uiButtonApplyCash):SetTextSpan(btnButtonApplyCashTextPosX, 5)
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_FixHelp = function(self)
  -- function num : 0_1
  (self._uiFixHelp):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiFixHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_FIXHELP"))
  ;
  (self._uiFixHelp):SetSize((self._uiFixHelp):GetSizeX(), (self._uiFixHelp):GetTextSizeY() + 5)
  Panel_FixEquip:SetSize(Panel_FixEquip:GetSizeX(), (self._uiFixHelp):GetTextSizeY() + 305)
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_clearData = function(self)
  -- function num : 0_2
  (self._slotMain):clearItem()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotMain).empty = true
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotMain).whereType = nil
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotMain).slotNo = nil
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotMain).itemKey = nil
  ;
  (self._slotSub):clearItem()
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotSub).empty = true
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotSub).whereType = nil
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotSub).slotNo = nil
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotSub).itemKey = nil
  ;
  (self._uiButtonApply):SetIgnore(true)
  ;
  (self._uiButtonApply):SetMonoTone(true)
  ;
  (self._uiButtonApply):SetEnable(false)
  ;
  (self._uiButtonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_REPAIR_MAXENDURANCE"))
  ;
  (self._uiButtonApply):SetAlpha(0.85)
  ;
  (self._uiButtonApplyCash):SetMonoTone(true)
  ;
  (self._uiButtonApplyCash):SetAlpha(0.85)
  PaGlobal_FixEquip:fixEquip_MouseEvent_OutSlots_Done(true)
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_clearDataOnlySub = function(self)
  -- function num : 0_3
  (self._slotSub):clearItem()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotSub).empty = true
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotSub).whereType = nil
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotSub).slotNo = nil
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotSub).itemKey = nil
  ;
  (self._uiButtonApply):SetIgnore(true)
  ;
  (self._uiButtonApply):SetMonoTone(true)
  ;
  (self._uiButtonApply):SetEnable(false)
  ;
  (self._uiButtonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_REPAIR_MAXENDURANCE"))
  ;
  (self._uiButtonApply):SetAlpha(0.85)
  ;
  (self._uiButtonApplyCash):SetMonoTone(true)
  ;
  (self._uiButtonApplyCash):SetAlpha(0.85)
  PaGlobal_FixEquip:fixEquip_MouseEvent_OutSlots_Done(false)
end

-- DECOMPILER ERROR at PC146: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_clearDataStreamRecovery = function(self, isOn, str)
  -- function num : 0_4
  _PA_LOG("�\177", "PaGlobal_FixEquip:fixEquip_clearDataStreamRecovery( isOn ) " .. tostring(isOn) .. " - " .. tostring(str))
  if isOn then
    (self._uiStreamRecovery):SetIgnore(false)
    ;
    (self._uiStreamRecovery):SetMonoTone(false)
    ;
    (self._uiStreamRecovery):SetEnable(true)
    ;
    (self._uiStreamRecovery):SetAlpha(1)
  else
    ;
    (self._uiStreamRecovery):SetIgnore(true)
    ;
    (self._uiStreamRecovery):SetMonoTone(true)
    ;
    (self._uiStreamRecovery):SetEnable(false)
    ;
    (self._uiStreamRecovery):SetAlpha(0.85)
    ;
    (self._uiStreamRecovery):SetCheck(false)
  end
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_MouseEvent_OutSlots_Done = function(self, isDone)
  -- function num : 0_5
  if isDone == true then
    ((self._slotMain).icon):addInputEvent("Mouse_RUp", "PaGlobal_FixEquip:fixEquip_OutSlots( true )")
    ;
    ((self._slotSub).icon):addInputEvent("Mouse_RUp", "PaGlobal_FixEquip:fixEquip_OutSlots( false )")
  else
    ;
    ((self._slotSub).icon):addInputEvent("Mouse_RUp", "PaGlobal_FixEquip:fixEquip_OutSlots( false )")
  end
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquip_createControl = function(self)
  -- function num : 0_6
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local invenMoney = ((selfPlayer:get()):getInventory()):getMoney_s64()
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._slotMainTbl).icon = (UI.getChildControl)(Panel_FixEquip, "Static_Slot_0")
  ;
  (SlotItem.new)(self._slotMainTbl, "Slot_0", 0, Panel_FixEquip, self._slotConfig)
  ;
  (self._slotMainTbl):createChild()
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._slotMainTbl).empty = true
  ;
  ((self._slotMainTbl).icon):addInputEvent("Mouse_On", "PaGlobal_FixEquip:panel_FixEquipMouseOnEvent(0, \"FixEquip\", true)")
  ;
  ((self._slotMainTbl).icon):addInputEvent("Mouse_Out", "PaGlobal_FixEquip:panel_FixEquipMouseOnEvent(0, \"FixEquip\", false)")
  Panel_Tooltip_Item_SetPosition(0, self._slotMainTbl, "FixEquip")
  self._slotMain = self._slotMainTbl
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._slotSubTbl).icon = (UI.getChildControl)(Panel_FixEquip, "Static_Slot_1")
  ;
  (SlotItem.new)(self._slotSubTbl, "Slot_1", 1, Panel_FixEquip, self._slotConfig)
  ;
  (self._slotSubTbl):createChild()
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._slotSubTbl).empty = true
  ;
  ((self._slotSubTbl).icon):addInputEvent("Mouse_On", "PaGlobal_FixEquip:panel_FixEquipMouseOnEvent(1, \"FixEquip\", true)")
  ;
  ((self._slotSubTbl).icon):addInputEvent("Mouse_Out", "PaGlobal_FixEquip:panel_FixEquipMouseOnEvent(1, \"FixEquip\", false)")
  Panel_Tooltip_Item_SetPosition(1, self._slotSubTbl, "FixEquip")
  self._slotSub = self._slotSubTbl
  if isGameTypeEnglish() then
    (self._uiStreamRecovery):SetSpanSize(140, 200)
    ;
    (self._uiItemFix):SetSpanSize(-165, 220)
    ;
    (self._uiMoneyItemFix):SetSpanSize(-165, 245)
  else
    ;
    (self._uiStreamRecovery):SetSpanSize(100, 200)
    ;
    (self._uiItemFix):SetSpanSize(-20, 210)
    ;
    (self._uiMoneyItemFix):SetSpanSize(-20, 240)
  end
  ;
  (self._uiTxtInven):SetText(makeDotMoney(invenMoney))
  ;
  (self._uiTxtWarehouse):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  ;
  (self._uiItemFix):SetCheck(true)
  PaGlobal_FixEquip:fixEquip_clearData()
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.panel_FixEquipMouseOnEvent = function(self, index, type, isMouseOn)
  -- function num : 0_7 , upvalues : UI_TM
  -- DECOMPILER ERROR at PC11: Unhandled construct in 'MakeBoolean' P1

  if (self._slotMainTbl).empty and index == 0 then
    if isMouseOn == true then
      (self._slot_1_Notice):SetShow(true)
      ;
      (self._slot_1_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (self._slot_1_Notice):SetAutoResize(true)
      ;
      (self._slot_1_Notice):SetSize(220, 86)
      ;
      (self._slot_1_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_REPAIR_MAXENDURANCE_GUIDE1"))
      ;
      (self._slot_1_Notice):SetSize((self._slot_1_Notice):GetSizeX() + 5, (self._slot_1_Notice):GetSizeY() + 30)
    else
      ;
      (self._slot_1_Notice):SetShow(false)
    end
  end
  Panel_Tooltip_Item_Show_GeneralNormal(index, type, isMouseOn)
  -- DECOMPILER ERROR at PC67: Unhandled construct in 'MakeBoolean' P1

  if (self._slotSubTbl).empty and index == 1 then
    if isMouseOn == true then
      (self._slot_0_Notice):SetShow(true)
      ;
      (self._slot_0_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (self._slot_0_Notice):SetAutoResize(true)
      ;
      (self._slot_0_Notice):SetSize(220, 86)
      ;
      (self._slot_0_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_GETITEM"))
      ;
      (self._slot_0_Notice):SetSize((self._slot_0_Notice):GetSizeX() + 5, (self._slot_0_Notice):GetSizeY() + 30)
    else
      ;
      (self._slot_0_Notice):SetShow(false)
    end
  end
  Panel_Tooltip_Item_Show_GeneralNormal(index, type, isMouseOn)
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.isReadyToReapirMaxEndurance = function(self)
  -- function num : 0_8
  if (self._slotMain).slotNo == nil then
    return false
  end
  if (self._slotSub).slotNo == nil then
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.isCheckSlot = function(self)
  -- function num : 0_9
  if (self._slotMain).slotNo == nil then
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.useCashBtnEffectDelete = function(self)
  -- function num : 0_10
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
    end
  end
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.isFixEquip_SubSlotItemKey = function(self)
  -- function num : 0_11
  return (self._fixEquipData).itemKeySub
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.isRepeatRepair = function(self)
  -- function num : 0_12
  return (self._uiStreamRecovery):IsCheck()
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquipContinue = function(self, slotNo)
  -- function num : 0_13
  local selfPlayer = getSelfPlayer()
  local mainItemWrapper = getInventoryItemByType((self._fixEquipData).whereTypeMain, (self._fixEquipData).slotNoMain)
  if mainItemWrapper == nil then
    return 
  end
  if selfPlayer == nil then
    return 
  end
  local invenMoney = ((selfPlayer:get()):getInventory()):getMoney_s64()
  do
    if self._useCash then
      local doHaveCashItem = doHaveContentsItem(27, 0, false)
      if not doHaveCashItem and self._useCash then
        (self._uiButtonApplyCash):EraseAllEffect()
        ;
        (self._uiButtonApplyCash):SetMonoTone(true)
        ;
        (self._uiButtonApplyCash):SetAlpha(0.85)
        ;
        (self._uiButtonApplyCash):addInputEvent("Mouse_LUp", "")
        return 
      end
    end
    if ((getSelfPlayer()):get()):getCurrentWeight_s64() < self._s64_allWeight then
      self._s64_allWeight = ((getSelfPlayer()):get()):getCurrentWeight_s64()
    else
      return 
    end
    local moneyWhereType = (CppEnums.ItemWhereType).eInventory
    if (self._uiChkInven):IsCheck() then
      moneyWhereType = (CppEnums.ItemWhereType).eInventory
    else
      moneyWhereType = (CppEnums.ItemWhereType).eWarehouse
    end
    if mainItemWrapper:checkToRepairItemMaxEndurance() then
      repair_MaxEndurance((self._fixEquipData).whereTypeMain, (self._fixEquipData).slotNoMain, (self._fixEquipData).whereTypeSub, slotNo, moneyWhereType, self._useCash)
    else
      PaGlobal_FixEquip:fixEquipData_Clear()
    end
  end
end

-- DECOMPILER ERROR at PC177: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquipData_Clear = function(self)
  -- function num : 0_14
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._fixEquipData).slotNoMain = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._fixEquipData).whereTypeMain = nil
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._fixEquipData).whereTypeSub = nil
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._fixEquipData).itemKeySub = nil
  self._s64_allWeight = nil
  self._useCash = nil
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fGlobal_closeFix = function(self)
  -- function num : 0_15
  if Panel_FixEquip:GetShow() == true then
    (self._uiButtonApply):EraseAllEffect()
    local savedSubSlotNo = (self._slotSub).slotNo
    local savedMainSlotNo = (self._slotMain).slotNo
    if savedMainSlotNo == nil then
      return 
    end
    local itemMainWrapper = getInventoryItem(savedMainSlotNo)
    local mainSlotEndurance = FixEquip_InvenFiler_MainItem((self._slotMain).slotNo, itemMainWrapper)
    if mainSlotEndurance == true and savedMainSlotNo ~= nil then
      PaGlobal_FixEquip:fixEquip_clearData()
      Inventory_SetFunctor(FixEquip_InvenFiler_MainItem, Panel_FixEquip_InteractortionFromInventory, FixEquip_CloseButton, nil)
      return 
    end
    if savedSubSlotNo == nil then
      return 
    end
    local inventory = ((getSelfPlayer()):get()):getInventory()
    local inventoryType = Inventory_GetCurrentInventoryType()
    local itemWrapper = getInventoryItem(savedSubSlotNo)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local itemKey = (itemSSW:get())._key
      local itemCount = inventory:getItemCount_s64(itemKey)
      ;
      (self._slotSub):setItem(itemWrapper)
    else
      do
        ;
        (self._slotSub):clearItem()
        -- DECOMPILER ERROR at PC70: Confused about usage of register: R8 in 'UnsetPending'

        ;
        (self._slotSub).empty = true
        PaGlobal_FixEquip:fixEquip_clearDataOnlySub()
      end
    end
  end
end

-- DECOMPILER ERROR at PC183: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.fixEquipItem_registEventHandler = function(self)
  -- function num : 0_16
  local self = PaGlobal_FixEquip
  ;
  (self._uiItemFix):addInputEvent("Mouse_LUp", "PaGlobal_FixEquip:handleClicked_FixType( 1 )")
  ;
  (self._uiMoneyItemFix):addInputEvent("Mouse_LUp", "PaGlobal_FixEquip:handleClicked_FixType( 2 )")
  ;
  (self._uiMoneyItemFix):addInputEvent("Mouse_On", "FixEquip_SimpleTooltips( true, 0 )")
  ;
  (self._uiMoneyItemFix):addInputEvent("Mouse_Out", "FixEquip_SimpleTooltips( false )")
  ;
  (self._uiItemFix):addInputEvent("Mouse_On", "FixEquip_SimpleTooltips( true, 1 )")
  ;
  (self._uiItemFix):addInputEvent("Mouse_Out", "FixEquip_SimpleTooltips( false )")
  ;
  (self._uiButtonApplyCash):addInputEvent("Mouse_On", "FixEquip_SimpleTooltips( true, 2 )")
  ;
  (self._uiButtonApplyCash):addInputEvent("Mouse_Out", "FixEquip_SimpleTooltips( false )")
  ;
  (self._uiStreamRecovery):addInputEvent("Mouse_On", "FixEquip_SimpleTooltips( true, 3 )")
  ;
  (self._uiStreamRecovery):addInputEvent("Mouse_Out", "FixEquip_SimpleTooltips( false )")
  ;
  (self._uiMoneyItemFix):setTooltipEventRegistFunc("FixEquip_SimpleTooltips( true, 0 )")
  ;
  (self._uiItemFix):setTooltipEventRegistFunc("FixEquip_SimpleTooltips( true, 1 )")
  ;
  (self._uiButtonApplyCash):setTooltipEventRegistFunc("FixEquip_SimpleTooltips( true, 2 )")
  ;
  (self._uiStreamRecovery):setTooltipEventRegistFunc("FixEquip_SimpleTooltips( true, 3 )")
end

-- DECOMPILER ERROR at PC186: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.handleClicked_FixType = function(self, fixType)
  -- function num : 0_17
  local self = PaGlobal_FixEquip
  if fixType == 1 then
    self._onlyItemCheck = (self._uiItemFix):IsCheck()
    self._onlyMoneyCheck = false
    self._moneyItemCheck = false
    ;
    (self._uiFixHelp):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (self._uiFixHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ITEMFIX_HELP"))
    ;
    (self._uiStreamRecovery):SetCheck(false)
    PaGlobal_FixEquip:fixEquip_CancelButton()
  else
    if fixType == 2 then
      self._moneyItemCheck = (self._uiMoneyItemFix):IsCheck()
      self._onlyMoneyCheck = false
      self._onlyItemCheck = false
      ;
      (self._uiFixHelp):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      ;
      (self._uiFixHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_MONEYITEMFIX_HELP"))
      ;
      (self._uiStreamRecovery):SetCheck(false)
      PaGlobal_FixEquip:fixEquip_CancelButton()
    end
  end
end

-- DECOMPILER ERROR at PC189: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FixEquip.StreamRecoveryStop = function(self)
  -- function num : 0_18
  (self._uiStreamRecovery):SetCheck(false)
end

FixEquip_SimpleTooltips = function(isShow, fixType)
  -- function num : 0_19
  local self = PaGlobal_FixEquip
  local name, desc, uiControl = nil, nil, nil
  if fixType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_TOOLTIP_MONEYITEM_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_TOOLTIP_MONEYITEM_DESC")
    uiControl = self._uiMoneyItemFix
  else
    if fixType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_TOOLTIP_ONLYITEM_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_TOOLTIP_ONLYITEM_DESC")
      uiControl = self._uiItemFix
    else
      if fixType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_TOOLTIP_APPLYCASH_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_TOOLTIP_APPLYCASH_DESC")
        uiControl = self._uiButtonApplyCash
      else
        if fixType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_STREAMRECOVERY_TOOLTIP_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_STREAMRECOVERY_TOOLTIP_DESC")
          uiControl = self._uiStreamRecovery
        end
      end
    end
  end
  if isShow == true then
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

PaGlobal_FixEquip:initialize()
PaGlobal_FixEquip:fixEquip_FixHelp()
PaGlobal_FixEquip:fixEquip_createControl()
PaGlobal_FixEquip:fixEquipItem_registEventHandler()

