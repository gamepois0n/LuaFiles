-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\extraction_enchantstone_control.luac 

-- params : ...
-- function num : 0
ExtractionEnchantStone_InvenFiler_MainItem = function(slotNo, itemWrapper)
  -- function num : 0_0
  if itemWrapper == nil then
    return true
  end
  local itemSSW = (itemWrapper:getStaticStatus()):get()
  local equipSlotNo = (itemWrapper:getStaticStatus()):getEquipSlotNo()
  local isNotAccessories = false
  do
    local isNotCashItem = true
    if equipSlotNo ~= 7 and equipSlotNo ~= 8 and equipSlotNo ~= 9 and equipSlotNo ~= 10 and equipSlotNo ~= 11 and equipSlotNo ~= 12 and equipSlotNo ~= 13 then
      isNotAccessories = true
    end
    if (itemWrapper:getStaticStatus()):isUsableServant() then
      isNotAccessories = true
    end
    if (itemWrapper:getStaticStatus()):isGuildStockable() then
      isNotAccessories = false
    end
    if itemWrapper:isCash() then
      isNotCashItem = false
    end
    do return ((itemSSW._key):getEnchantLevel() <= 0 or (itemSSW._key):getEnchantLevel() >= 16 or isNotAccessories) and isNotCashItem == false end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

ExtractionEnchantStone_InteractortionFromInventory = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_1
  local self = PaGlobal_ExtractionEnchantStone
  if (self._uiEquipItem).icon then
    audioPostEvent_SystemUi(0, 16)
    ;
    ((self._uiEquipItem).icon):AddEffect("UI_Button_Hide", false, 0, 0)
    ;
    ((self._uiEquipItem).slot_On):SetShow(true)
    ;
    ((self._uiEquipItem).slot_Nil):SetShow(false)
    ;
    (self._uiEffectCircle):ResetVertexAni()
    ;
    (self._uiEffectCircle):SetVertexAniRun("Ani_Color_On", true)
    ;
    (self._uiEffectCircle):SetVertexAniRun("Ani_Rotate_New", true)
    ;
    (self._uiButtonApply):SetIgnore(false)
    ;
    (self._uiButtonApply):SetMonoTone(false)
  end
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._uiEquipItem).empty = false
  self._targetWhereType = inventoryType
  self._targetSlotNo = slotNo
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  ;
  (self._uiEquipItem):setItem(itemWrapper)
  ;
  ((self._uiEquipItem).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"inventory\", true)")
  ;
  ((self._uiEquipItem).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"inventory\", false)")
  Panel_Tooltip_Item_SetPosition(slotNo, self._uiEquipItem, "inventory")
  local ItemEnchantStaticStatus = (itemWrapper:getStaticStatus()):get()
  local blackStone_Count = (ItemEnchantStaticStatus._key):getEnchantLevel()
  if not ItemEnchantStaticStatus:isWeapon() and not ItemEnchantStaticStatus:isSubWeapon() then
    local thisIsWeapone = ItemEnchantStaticStatus:isAwakenWeapon()
  end
  -- DECOMPILER ERROR at PC104: Unhandled construct in 'MakeBoolean' P1

  if thisIsWeapone and blackStone_Count >= 8 then
    blackStone_Count = "?"
  end
  if blackStone_Count >= 6 then
    blackStone_Count = "?"
  end
  ;
  (self._uiTextBlackStoneCount):SetText(blackStone_Count)
  if ((itemWrapper:getStaticStatus()):get()):isWeapon() or ((itemWrapper:getStaticStatus()):get()):isSubWeapon() or ((itemWrapper:getStaticStatus()):get()):isAwakenWeapon() then
    (self._uiIconBlackStoneWeapon):SetShow(true)
    ;
    (self._uiIconBlackStoneWeapon):SetMonoTone(true)
    ;
    (self._uiIconBlackStoneArmor):SetShow(false)
    ;
    (self._uiTextBlackStoneCount):SetShow(true)
  else
    ;
    (self._uiIconBlackStoneWeapon):SetShow(false)
    ;
    (self._uiIconBlackStoneArmor):SetShow(true)
    ;
    (self._uiIconBlackStoneArmor):SetMonoTone(true)
    ;
    (self._uiTextBlackStoneCount):SetShow(true)
  end
  Inventory_SetFunctor(ExtractionEnchantStone_InvenFiler_MainItem, ExtractionEnchantStone_InteractortionFromInventory, ExtractionEnchantStone_WindowClose, nil)
end

-- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.handleMRUpEquipSlot = function(self)
  -- function num : 0_2
  (self._uiEffectCircle):ResetVertexAni()
  ;
  (self._uiEffectCircle):SetVertexAniRun("Ani_Color_Off", true)
  ;
  (self._uiEffectCircle):SetVertexAniRun("Ani_Rotate_New", true)
  self:clear()
  Inventory_SetFunctor(ExtractionEnchantStone_InvenFiler_MainItem, ExtractionEnchantStone_InteractortionFromInventory, ExtractionEnchantStone_WindowClose, nil)
end

-- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.applyReady = function(self)
  -- function num : 0_3
  local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_ENCHANTSTONE_APPLYREADY")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageContent, functionYes = function()
    -- function num : 0_3_0 , upvalues : self
    ToClient_ExtractBlackStone(self._targetWhereType, self._targetSlotNo)
    Panel_Window_Extraction_EnchantStone:RegisterUpdateFunc("ExtractionEnchant_CheckTime")
    audioPostEvent_SystemUi(5, 10)
    FGlobal_MiniGame_RequestExtraction()
    PaGlobal_TutorialManager:handleApplyExtractionEnchantStone()
  end
, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

-- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.registMessageHandler = function(self)
  -- function num : 0_4
  registerEvent("FromClient_ExtractionEnchant_Success", "ExtractionEnchant_Success")
end

ExtractionEnchant_Success = function()
  -- function num : 0_5
  local self = PaGlobal_ExtractionEnchantStone
  self._currentTime = 0
  self._doExtracting = true
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.successXXX = function(self)
  -- function num : 0_6
  self._doExtracting = false
  self._currentTime = 0
  PaGlobal_ExtractionEnchantStone:resultShow()
  PaGlobal_ExtractionEnchantStone:clear()
end


