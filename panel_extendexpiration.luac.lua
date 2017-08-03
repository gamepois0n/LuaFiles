-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extendexpiration\panel_extendexpiration.luac 

-- params : ...
-- function num : 0
Panel_ExtendExpiration:SetShow(false)
local ExtendExpiration = {
ui = {_txt_Guide = (UI.getChildControl)(Panel_ExtendExpiration, "Static_GuideText"), _static_Effect = (UI.getChildControl)(Panel_ExtendExpiration, "Static_Effect"), _static_materialSlot = (UI.getChildControl)(Panel_ExtendExpiration, "Static_Slot_0"), _static_Slot = (UI.getChildControl)(Panel_ExtendExpiration, "Static_Slot_1"), _desc = (UI.getChildControl)(Panel_ExtendExpiration, "Static_GuideText"), _btn_materialPlus = (UI.getChildControl)(Panel_ExtendExpiration, "Button_CountPlus"), _btn_materialMinus = (UI.getChildControl)(Panel_ExtendExpiration, "Button_CountMinus"), _btn_Confirm = (UI.getChildControl)(Panel_ExtendExpiration, "Button_Confirm"), _btn_Cancel = (UI.getChildControl)(Panel_ExtendExpiration, "Button_Cancel"), _btn_Close = (UI.getChildControl)(Panel_ExtendExpiration, "Button_Win_Close"), 
material = {}
, 
item = {}
}
, 
config = {materialWhereType = 0, materialSlotNo = 0, materialCount = toInt64(0, 0), materialMaxCount = toInt64(0, 0), materialExtendExpirationType = 0, targetWhereType = 0, targetSlotNo = 0, isSetItem = false, extendExpirationDo = false}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true, createExpiration = true}
, 
materialSlotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true, createExpiration = false}
}
ExtendExpiration.Init = function(self)
  -- function num : 0_0
  (SlotItem.new)((self.ui).material, "ExtendExpirationmaterialItem_" .. 0, 0, (self.ui)._static_materialSlot, self.materialSlotConfig)
  ;
  ((self.ui).material):createChild()
  ;
  (SlotItem.new)((self.ui).item, "ExtendExpirationItem_" .. 0, 0, (self.ui)._static_Slot, self.slotConfig)
  ;
  ((self.ui).item):createChild()
  ;
  ((self.ui)._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self.ui)._desc):SetText(((self.ui)._desc):GetText())
  if ((self.ui)._desc):GetTextSizeY() > 30 then
    ((self.ui)._desc):SetSize(((self.ui)._desc):GetSizeX(), ((self.ui)._desc):GetTextSizeY() + 10)
  else
    ;
    ((self.ui)._desc):SetSize(((self.ui)._desc):GetSizeX(), 30)
  end
end

ExtendExpiration.registEventHandler = function(self)
  -- function num : 0_1
  (((self.ui).item).icon):addInputEvent("Mouse_RUp", "HandleClicked_ExtendExpiration_UnSetItem()")
  ;
  ((self.ui)._btn_materialPlus):addInputEvent("Mouse_LUp", "HandleClicked_ExtendExpiration_ChangeMaterialCount( true )")
  ;
  ((self.ui)._btn_materialMinus):addInputEvent("Mouse_LUp", "HandleClicked_ExtendExpiration_ChangeMaterialCount( false )")
  ;
  ((self.ui)._btn_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_ExtendExpiration_Do()")
  ;
  ((self.ui)._btn_Cancel):addInputEvent("Mouse_LUp", "HandleClicked_ExtendExpiration_Close()")
  ;
  ((self.ui)._btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ExtendExpiration_Close()")
end

ExtendExpiration.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("FromClient_ClickedExtendExpirationPeriodMaterial", "FromClient_ClickedExtendExpirationPeriodMaterial")
  registerEvent("FromClient_SucceedExtendedExpirationPeriod", "FromClient_SucceedExtendedExpirationPeriod")
  Panel_ExtendExpiration:RegisterUpdateFunc("ExtendExpiration_TimeChecker")
end

ExtendExpiration.Close = function(self)
  -- function num : 0_3 , upvalues : ExtendExpiration
  Panel_ExtendExpiration:SetShow(false)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).materialWhereType = 0
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).materialSlotNo = 0
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).materialCount = toInt64(0, 0)
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).materialMaxCount = toInt64(0, 0)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).materialExtendExpirationType = 0
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).isSetItem = false
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).targetWhereType = 0
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).targetSlotNo = 0
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).extendExpirationDo = false
  ;
  ((ExtendExpiration.ui).material):clearItem()
  ;
  ((ExtendExpiration.ui).item):clearItem()
  Inventory_SetFunctor(nil, nil, nil, nil)
  Equipment_SetShow(true)
end

ExtendExpiration_Inventory_Filter = function(slotNo, itemWrapper, currentWhereType)
  -- function num : 0_4 , upvalues : ExtendExpiration
  local itemSSW = itemWrapper:getStaticStatus()
  local isExtendedExpiration = itemSSW:isExtendedExpirationPeriod()
  local extendExpirationType = itemSSW:getExtendExpirationPeriodType()
  do
    local isMatchType = (ExtendExpiration.config).materialExtendExpirationType == extendExpirationType
    if isExtendedExpiration and isMatchType then
      return false
    else
      return true
    end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

local _ExtendExpiration_Inventory_Rclick = function()
  -- function num : 0_5 , upvalues : ExtendExpiration
  local itemWrapper = getInventoryItemByType((ExtendExpiration.config).targetWhereType, (ExtendExpiration.config).targetSlotNo)
  ;
  ((ExtendExpiration.ui).item):setItem(itemWrapper)
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (ExtendExpiration.config).isSetItem = true
end

ExtendExpiration_Inventory_Rclick = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_6 , upvalues : ExtendExpiration, _ExtendExpiration_Inventory_Rclick
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R4 in 'UnsetPending'

  (ExtendExpiration.config).targetWhereType = inventoryType
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (ExtendExpiration.config).targetSlotNo = slotNo
  local materialItemWrapper = getInventoryItemByType((ExtendExpiration.config).materialWhereType, (ExtendExpiration.config).materialSlotNo)
  local materialItemSSW = materialItemWrapper:getStaticStatus()
  local materialItemEnchantKey = ItemEnchantKey(((materialItemWrapper:get()):getKey()):get())
  local targetItemWrapper = getInventoryItemByType(inventoryType, slotNo)
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (ExtendExpiration.config).materialMaxCount = targetItemWrapper:getMaxUsableExtendedExpirationMaterialCount(materialItemEnchantKey)
  local isOverExtendedExpiration = targetItemWrapper:isOverExtendedExpirationPeriod(materialItemEnchantKey, (ExtendExpiration.config).materialMaxCount)
  if isOverExtendedExpiration == true then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_EXTENDEXPIRATION_DONT_OVERPERIOD")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = _ExtendExpiration_Inventory_Rclick, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      _ExtendExpiration_Inventory_Rclick()
    end
  end
end

ExtendExpiration_Close = function()
  -- function num : 0_7 , upvalues : ExtendExpiration
  ExtendExpiration:Close()
end

HandleClicked_ExtendExpiration_Close = function()
  -- function num : 0_8 , upvalues : ExtendExpiration
  ExtendExpiration:Close()
end

HandleClicked_ExtendExpiration_UnSetItem = function()
  -- function num : 0_9 , upvalues : ExtendExpiration
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  (ExtendExpiration.config).targetWhereType = 0
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (ExtendExpiration.config).targetSlotNo = 0
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (ExtendExpiration.config).isSetItem = false
  ;
  ((ExtendExpiration.ui).item):clearItem()
  Inventory_SetFunctor(ExtendExpiration_Inventory_Filter, ExtendExpiration_Inventory_Rclick, ExtendExpiration_Close, nil)
end

HandleClicked_ExtendExpiration_ChangeMaterialCount = function(isPlus)
  -- function num : 0_10 , upvalues : ExtendExpiration
  if (ExtendExpiration.config).isSetItem ~= true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_EXTENDEXPIRATION_SELECTITEM"))
    return 
  end
  local nowCount = (ExtendExpiration.config).materialCount
  local maxCount = (ExtendExpiration.config).materialMaxCount
  if isPlus then
    if maxCount <= nowCount then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_EXTENDEXPIRATION_EXPIRATION_MAX"))
      return 
    end
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (ExtendExpiration.config).materialCount = (ExtendExpiration.config).materialCount + toInt64(0, 1)
  else
    if nowCount <= toInt64(0, 1) then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_EXTENDEXPIRATION_EXPIRATION_MIN"))
      return 
    end
    -- DECOMPILER ERROR at PC67: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (ExtendExpiration.config).materialCount = (ExtendExpiration.config).materialCount - toInt64(0, 1)
  end
  ;
  (((ExtendExpiration.ui).material).count):SetText(tostring((ExtendExpiration.config).materialCount))
end

HandleClicked_ExtendExpiration_Do = function()
  -- function num : 0_11 , upvalues : ExtendExpiration
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  if (ExtendExpiration.config).isSetItem then
    (ExtendExpiration.config).extendExpirationDo = true
    ;
    ((ExtendExpiration.ui)._static_Effect):EraseAllEffect()
    ;
    ((ExtendExpiration.ui)._static_Effect):AddEffect("fUI_Dress_Extraction03", false, 0, 0)
  else
    return 
  end
end

FromClient_ClickedExtendExpirationPeriodMaterial = function(materialWhereType, materialSlotNo)
  -- function num : 0_12 , upvalues : ExtendExpiration
  local materialItemWrapper = getInventoryItemByType(materialWhereType, materialSlotNo)
  local materialItemSSW = materialItemWrapper:getStaticStatus()
  local doitExtendExpiration = function()
    -- function num : 0_12_0 , upvalues : ExtendExpiration, materialItemSSW, materialWhereType, materialSlotNo
    ((ExtendExpiration.ui).material):setItemByStaticStatus(materialItemSSW, (toInt64(0, 1)), nil, nil, nil)
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (ExtendExpiration.config).materialWhereType = materialWhereType
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (ExtendExpiration.config).materialSlotNo = materialSlotNo
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (ExtendExpiration.config).materialCount = toInt64(0, 1)
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (ExtendExpiration.config).materialExtendExpirationType = materialItemSSW:getExtendExpirationPeriodType()
    Panel_ExtendExpiration:SetShow(true)
    Panel_ExtendExpiration:ComputePos()
    Inventory_SetFunctor(ExtendExpiration_Inventory_Filter, ExtendExpiration_Inventory_Rclick, ExtendExpiration_Close, nil)
  end

  doitExtendExpiration()
end

FromClient_SucceedExtendedExpirationPeriod = function(targetWhereType, targetSlotNo)
  -- function num : 0_13
  local targetItemWrapper = getInventoryItemByType(targetWhereType, targetSlotNo)
  if targetItemWrapper ~= nil then
    local targetItemName = (targetItemWrapper:getStaticStatus()):getName()
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EXTENDEXPIRATION_SUCCEEDEXTENDPERIOD", "name", targetItemName))
  end
end

local elapsTime = 0
ExtendExpiration_TimeChecker = function(deltaTime)
  -- function num : 0_14 , upvalues : ExtendExpiration, elapsTime
  if (ExtendExpiration.config).isSetItem == true and (ExtendExpiration.config).extendExpirationDo == true then
    elapsTime = elapsTime + deltaTime
    if elapsTime >= 2.5 then
      local targetWhereType = (ExtendExpiration.config).targetWhereType
      local targetSlotNo = (ExtendExpiration.config).targetSlotNo
      local materialWhereType = (ExtendExpiration.config).materialWhereType
      local materialSlotNo = (ExtendExpiration.config).materialSlotNo
      local materialCount = (ExtendExpiration.config).materialCount
      ToClient_ExtendExpirationPeriod(targetWhereType, targetSlotNo, materialWhereType, materialSlotNo, materialCount)
      elapsTime = 0
      ;
      ((ExtendExpiration.ui)._static_Effect):EraseAllEffect()
      ExtendExpiration_Close()
    end
  end
end

ExtendExpiration:Init()
ExtendExpiration:registEventHandler()
ExtendExpiration:registMessageHandler()

