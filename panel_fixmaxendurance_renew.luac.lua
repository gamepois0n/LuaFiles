-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\repair\panel_fixmaxendurance_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_FixMaxEndurance_Renew
local FixMaxEnduranceInfo = {
_ui = {stc_titleBar = (UI.getChildControl)(_panel, "Static_TitleBar"), txt_title = nil, stc_titleIcon = nil, stc_bodyBG = (UI.getChildControl)(_panel, "Static_BodyBG"), stc_itemSlotLeft = nil, stc_itemSlotRight = nil, 
slot_targetItem = {}
, 
slot_subjectItem = {}
, txt_expectedVal = nil, stc_progressBG = nil, progress_grey = nil, progress_red = nil, txt_enduranceVal = nil, txt_toggleAuto = nil, btn_Left = nil, txt_keyGuideLeft = nil, btn_Right = nil, txt_keyGuideRight = nil, stc_bottomLeft = (UI.getChildControl)(_panel, "Static_BottomLeft"), txt_moneyInChar = nil, txt_moneyInCharVal = nil, stc_bottomRight = (UI.getChildControl)(_panel, "Static_BottomRight"), txt_moneyInWarehouse = nil, txt_moneyInWarehouseVal = nil, txt_keyGuideDiscard = (UI.getChildControl)(_panel, "StaticText_KeyGuide")}
, 
_slotConfig = {createIcon = true, createBorder = true, createCount = false, createCash = true, createEnchant = true, createEnduranceIcon = true, createItemLock = true}
, 
_fixEquipData = {}
, _isAutoRepeat = false}
FromClient_luaLoadComplete_FixMaxEnduranceInfo_Init = function()
  -- function num : 0_0 , upvalues : FixMaxEnduranceInfo
  FixMaxEnduranceInfo:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_FixMaxEnduranceInfo_Init")
FixMaxEnduranceInfo.initialize = function(self)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_title = (UI.getChildControl)((self._ui).stc_titleBar, "StaticText_Title")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_titleIcon = (UI.getChildControl)((self._ui).stc_titleBar, "Static_TitleIcon")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_itemSlotLeft = (UI.getChildControl)((self._ui).stc_bodyBG, "Static_ItemSlot_1")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_itemSlotRight = (UI.getChildControl)((self._ui).stc_bodyBG, "Static_ItemSlot_2")
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).slot_targetItem = {}
  ;
  (SlotItem.new)((self._ui).slot_targetItem, "FixMaxSlot_Target", 1, (self._ui).stc_itemSlotLeft, self._slotConfig)
  ;
  ((self._ui).slot_targetItem):createChild()
  ;
  (((self._ui).slot_targetItem).icon):addInputEvent("Mouse_RUp", "InputMRUp_FixMaxEndurance_TargetSlot()")
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).slot_subjectItem = {}
  ;
  (SlotItem.new)((self._ui).slot_subjectItem, "FixMaxSlot_Subject", 1, (self._ui).stc_itemSlotRight, self._slotConfig)
  ;
  ((self._ui).slot_subjectItem):createChild()
  ;
  (((self._ui).slot_subjectItem).icon):addInputEvent("Mouse_RUp", "InputMRUp_FixMaxEndurance_SubjectSlot()")
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_expectedVal = (UI.getChildControl)((self._ui).stc_bodyBG, "StaticText_ExpectedValue")
  -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_progressBG = (UI.getChildControl)((self._ui).stc_bodyBG, "Static_ProgressBG")
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress_grey = (UI.getChildControl)((self._ui).stc_progressBG, "Progress2_Grey")
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress_red = (UI.getChildControl)((self._ui).stc_progressBG, "Progress2_Red")
  -- DECOMPILER ERROR at PC119: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_enduranceVal = (UI.getChildControl)((self._ui).stc_bodyBG, "StaticText_EnduranceVal")
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_toggleAuto = (UI.getChildControl)((self._ui).stc_bodyBG, "StaticText_ToggleAuto")
  ;
  ((self._ui).txt_toggleAuto):SetShow(false)
  local posX = ((self._ui).stc_bodyBG):GetSizeX() / 2 - (((self._ui).txt_toggleAuto):GetTextSizeX() + ((self._ui).txt_toggleAuto):GetSizeX()) / 2
  ;
  ((self._ui).txt_toggleAuto):SetPosX(posX)
  -- DECOMPILER ERROR at PC161: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).btn_Left = (UI.getChildControl)((self._ui).stc_bodyBG, "Button_Ribbon_1")
  ;
  ((self._ui).btn_Left):addInputEvent("Mouse_LUp", "Input_FixMaxEndurance_FixMaxEndurance(false)")
  -- DECOMPILER ERROR at PC175: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).btn_Right = (UI.getChildControl)((self._ui).stc_bodyBG, "Button_Ribbon_2")
  ;
  ((self._ui).btn_Right):addInputEvent("Mouse_LUp", "Input_FixMaxEndurance_FixMaxEndurance(true)")
  -- DECOMPILER ERROR at PC189: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_keyGuideLeft = (UI.getChildControl)((self._ui).btn_Left, "StaticText_KeyGuide")
  -- DECOMPILER ERROR at PC197: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_keyGuideRight = (UI.getChildControl)((self._ui).btn_Right, "StaticText_KeyGuide")
  -- DECOMPILER ERROR at PC205: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_moneyInChar = (UI.getChildControl)((self._ui).stc_bottomLeft, "StaticText_MoneyInCharacter")
  -- DECOMPILER ERROR at PC213: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_moneyInCharVal = (UI.getChildControl)((self._ui).stc_bottomLeft, "StaticText_MoneyInCharacterVal")
  -- DECOMPILER ERROR at PC221: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_moneyInWarehouse = (UI.getChildControl)((self._ui).stc_bottomRight, "StaticText_MoneyInWarehouse")
  -- DECOMPILER ERROR at PC229: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_moneyInWarehouseVal = (UI.getChildControl)((self._ui).stc_bottomRight, "StaticText_MoneyInWarehouseVal")
  self:registMessageHandler()
end

FixMaxEnduranceInfo.registMessageHandler = function(self)
  -- function num : 0_2
end

PaGlobalFunc_FixMaxEnduranceInfo_GetShow = function()
  -- function num : 0_3 , upvalues : _panel
  return _panel:GetShow()
end

PaGlobalFunc_FixMaxEnduranceInfo_Open = function()
  -- function num : 0_4 , upvalues : FixMaxEnduranceInfo
  FixMaxEnduranceInfo:open()
end

FixMaxEnduranceInfo.open = function(self)
  -- function num : 0_5 , upvalues : _panel
  _panel:SetShow(true)
  self:cleanAll()
end

FixMaxEnduranceInfo.cleanAll = function(self)
  -- function num : 0_6
  if ((self._ui).slot_targetItem).slotNo == nil and ((self._ui).slot_subjectItem).slotNo == nil then
    return true
  end
  ;
  ((self._ui).slot_targetItem):clearItem()
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).slot_targetItem).slotNo = nil
  ;
  ((self._ui).slot_subjectItem):clearItem()
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).slot_subjectItem).slotNo = nil
  ;
  ((self._ui).progress_grey):SetProgressRate(0)
  ;
  ((self._ui).progress_red):SetProgressRate(0)
  ;
  ((self._ui).txt_enduranceVal):SetText("")
  ;
  ((self._ui).txt_expectedVal):SetText("")
  PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideLeft, XBOX_PAD_BUTTON.EMPTY)
  PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideRight, XBOX_PAD_BUTTON.EMPTY)
  ToClient_setTargetPanel(Panel_Window_Inventory)
  Inventory_SetFunctor(PaGlobalFunc_FixMaxEnduranceInfo_FilterTarget, PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject, nil, nil)
  ;
  ((self._ui).txt_keyGuideDiscard):SetText("Exit")
  self:updateMoneyDisplay()
  return false
end

PaGlobalFunc_FixMaxEnduranceInfo_Close = function()
  -- function num : 0_7 , upvalues : FixMaxEnduranceInfo
  FixMaxEnduranceInfo:close()
end

FixMaxEnduranceInfo.close = function(self)
  -- function num : 0_8 , upvalues : _panel
  _panel:SetShow(false)
  if (Defines.UIMode).eUIMode_Repair == GetUIMode() then
    PaGlobalFunc_RepairInfo_Open()
  end
end

FixMaxEnduranceInfo.updateMoneyDisplay = function(self)
  -- function num : 0_9
  ((self._ui).txt_moneyInCharVal):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  if ToClient_HasWareHouseFromNpc() then
    ((self._ui).txt_moneyInWarehouseVal):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
    ;
    ((self._ui).txt_moneyInWarehouseVal):SetShow(true)
    ;
    ((self._ui).txt_moneyInWarehouse):SetShow(true)
  else
    ;
    ((self._ui).txt_moneyInWarehouseVal):SetShow(false)
    ;
    ((self._ui).txt_moneyInWarehouse):SetShow(false)
  end
end

PaGlobalFunc_FixMaxEnduranceInfo_OnPadB = function()
  -- function num : 0_10 , upvalues : FixMaxEnduranceInfo
  local self = FixMaxEnduranceInfo
  if ((self._ui).slot_subjectItem).slotNo ~= nil then
    InputMRUp_FixMaxEndurance_SubjectSlot()
  else
    if FixMaxEnduranceInfo:cleanAll() then
      PaGlobalFunc_FixMaxEnduranceInfo_Close()
    end
  end
end

PaGlobalFunc_FixMaxEnduranceInfo_FilterTarget = function(slotNo, itemWrapper)
  -- function num : 0_11
  if itemWrapper == nil then
    return true
  end
  isAble = itemWrapper:checkToRepairItemMaxEndurance()
  return not isAble
end

PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_12 , upvalues : FixMaxEnduranceInfo, _panel
  local self = FixMaxEnduranceInfo
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if itemWrapper == nil then
    return 
  end
  if _panel:GetShow() and self._checkHasItemJewel == false and ((self._ui).slot_targetItem).slotNo ~= nil and ((self._ui).slot_subjectItem).slotNo == nil and self:checkJewel(slotNo, itemWrapper, count, inventoryType) == true then
    self._checkHasItemJewel = false
    return 
  end
  self._checkHasItemJewel = false
  if ((self._ui).slot_targetItem).slotNo == nil then
    ((self._ui).slot_targetItem):setItem(itemWrapper)
    -- DECOMPILER ERROR at PC49: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui).slot_targetItem).whereType = inventoryType
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui).slot_targetItem).slotNo = slotNo
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui).slot_targetItem).itemKey = (itemWrapper:get()):getKey()
    local maxEndurance = ((itemWrapper:getStaticStatus()):get()):getMaxEndurance()
    local dynamicMaxEndurance = (itemWrapper:get()):getMaxEndurance()
    local endurance = (itemWrapper:get()):getEndurance()
    self._memoryFlagRecoveryCount = ((itemWrapper:getStaticStatus()):get())._repairEnduranceCount
    ;
    ((self._ui).progress_red):SetProgressRate(endurance / maxEndurance * 100)
    ;
    ((self._ui).progress_grey):SetProgressRate(dynamicMaxEndurance / maxEndurance * 100)
    ;
    ((self._ui).txt_enduranceVal):SetText(endurance .. " / " .. dynamicMaxEndurance .. "  (" .. maxEndurance .. ")")
    Inventory_SetFunctor(PaGlobalFunc_FixMaxEnduranceInfo_FilterSubject, PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject, FixEquip_Close, nil)
    ;
    ((self._ui).txt_keyGuideDiscard):SetText("Discard")
  else
    do
      if ((self._ui).slot_subjectItem).slotNo == nil then
        ((self._ui).slot_subjectItem):setItem(itemWrapper)
        -- DECOMPILER ERROR at PC127: Confused about usage of register: R6 in 'UnsetPending'

        ;
        ((self._ui).slot_subjectItem).whereType = inventoryType
        -- DECOMPILER ERROR at PC130: Confused about usage of register: R6 in 'UnsetPending'

        ;
        ((self._ui).slot_subjectItem).slotNo = slotNo
        -- DECOMPILER ERROR at PC139: Confused about usage of register: R6 in 'UnsetPending'

        ;
        ((self._ui).slot_subjectItem).itemKey = ((itemWrapper:get()):getKey()):getItemKey()
        if ((self._ui).slot_subjectItem).itemKey == 44195 then
          ((self._ui).txt_expectedVal):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RENEW_RECOVERY") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RECOVERYCOUNT", "count", tostring(self._memoryFlagRecoveryCount)))
        else
          if ((self._ui).slot_subjectItem).itemKey == 9750 then
            ((self._ui).txt_expectedVal):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RENEW_RECOVERY") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RECOVERYCOUNT", "count", tostring(5)))
          else
            ;
            ((self._ui).txt_expectedVal):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RENEW_RECOVERY") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RECOVERYCOUNT", "count", tostring(10)))
          end
        end
        ;
        ((self._ui).txt_keyGuideDiscard):SetText("Discard")
      else
        ;
        (UI.ASSERT)(false, "Client data, UI data is Mismatch!!!!!")
        return 
      end
      local hasCashItem = doHaveContentsItem(27, 0, false)
      local isReady = self:isReadyToRepairMaxEndurance()
      if isReady == true then
        PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideLeft, XBOX_PAD_BUTTON.Y)
        PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideRight, XBOX_PAD_BUTTON.A)
        ToClient_setTargetPanel(_panel)
      end
    end
  end
end

PaGlobalFunc_FixMaxEnduranceInfo_FilterSubject = function(slotNo, itemWrapper, inventoryType)
  -- function num : 0_13 , upvalues : FixMaxEnduranceInfo
  local self = FixMaxEnduranceInfo
  if itemWrapper == nil then
    return true
  end
  local isAble = false
  local repairItemKey = ((self._ui).slot_targetItem).itemKey
  if repairItemKey == nil then
    return true
  end
  if itemWrapper:checkToRepairItemMaxEnduranceWithMoneyAndItem(repairItemKey) and (((self._ui).slot_targetItem).slotNo ~= slotNo or ((self._ui).slot_targetItem).whereType ~= inventoryType) then
    isAble = true
  end
  return not isAble
end

FixMaxEnduranceInfo.isReadyToRepairMaxEndurance = function(self)
  -- function num : 0_14
  if ((self._ui).slot_targetItem).slotNo == nil then
    return false
  end
  if ((self._ui).slot_subjectItem).slotNo == nil then
    return false
  end
  return true
end

FixMaxEnduranceInfo.checkJewel = function(self, slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_15
  local repairConfirm = function()
    -- function num : 0_15_0 , upvalues : slotNo, itemWrapper, count, inventoryType
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

    PaGlobal_FixEquip._checkHasItemJewel = true
    PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject(slotNo, itemWrapper, count, inventoryType)
  end

  if itemWrapper:hasItemJewel() == true then
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_CHECKHASITEMJEWEL_DESC"), functionYes = repairConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return true
  else
    do
      do return false end
    end
  end
end

InputMRUp_FixMaxEndurance_TargetSlot = function()
  -- function num : 0_16 , upvalues : FixMaxEnduranceInfo
  FixMaxEnduranceInfo:cleanAll()
end

InputMRUp_FixMaxEndurance_SubjectSlot = function()
  -- function num : 0_17 , upvalues : FixMaxEnduranceInfo
  FixMaxEnduranceInfo:cleanSubject()
end

FixMaxEnduranceInfo.cleanSubject = function(self)
  -- function num : 0_18
  if ((self._ui).slot_targetItem).slotNo ~= nil then
    Inventory_SetFunctor(PaGlobalFunc_FixMaxEnduranceInfo_FilterSubject, PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject, FixEquip_Close, nil)
    ;
    ((self._ui).slot_subjectItem):clearItem()
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((self._ui).slot_subjectItem).slotNo = nil
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

    ;
    ((self._ui).slot_subjectItem).itemKey = nil
    ;
    ((self._ui).txt_expectedVal):SetText("")
  else
    self:cleanAll()
  end
end

Input_FixMaxEndurance_FixMaxEndurance = function(isHelpRepair)
  -- function num : 0_19 , upvalues : FixMaxEnduranceInfo
  FixMaxEnduranceInfo:fixEquip_ApplyButton(isHelpRepair)
end

FixMaxEnduranceInfo.fixEquip_ApplyButton = function(self, isHelpRepair)
  -- function num : 0_20
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local moneyWhereType = (CppEnums.ItemWhereType).eInventory
  local funcYesExe = function()
    -- function num : 0_20_0 , upvalues : self, isHelpRepair, moneyWhereType
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

    (self._fixEquipData).slotNoMain = ((self._ui).slot_targetItem).slotNo
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).whereTypeMain = ((self._ui).slot_targetItem).whereType
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).whereTypeSub = ((self._ui).slot_subjectItem).whereType
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (self._fixEquipData).itemKeySub = ((self._ui).slot_subjectItem).itemKey
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

    self._s64_allWeight = ((getSelfPlayer()):get()):getCurrentWeight_s64()
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

    self._useCash = isHelpRepair
    repair_MaxEndurance(((self._ui).slot_targetItem).whereType, ((self._ui).slot_targetItem).slotNo, ((self._ui).slot_subjectItem).whereType, ((self._ui).slot_subjectItem).slotNo, moneyWhereType, isHelpRepair)
    self:updateMoneyDisplay()
    self:cleanSubject()
    return 
  end

  if ((self._ui).slot_targetItem).slotNo ~= nil and ((self._ui).slot_subjectItem).slotNo ~= nil then
    local itemWrapper = getInventoryItemByType(((self._ui).slot_targetItem).whereType, ((self._ui).slot_targetItem).slotNo)
    local memoryFlagRecoveryCount = ((itemWrapper:getStaticStatus()):get())._repairEnduranceCount
    local isMemoryFlag = ((self._ui).slot_subjectItem).itemKey == 44195
    local isDriganFlag = ((self._ui).slot_subjectItem).itemKey == 9750
    local maxEndurance = nil
    local currentEndurance = (itemWrapper:get()):getEndurance()
    if ((itemWrapper:getStaticStatus()):get()):isUnbreakable() == false then
      maxEndurance = ((itemWrapper:getStaticStatus()):get()):getMaxEndurance()
    end
    local contentString = ""
    if isMemoryFlag and isHelpRepair == true then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", memoryFlagRecoveryCount * 4)
    elseif isMemoryFlag and isHelpRepair == false then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", memoryFlagRecoveryCount)
    elseif isDriganFlag and isHelpRepair == true then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", tostring(20))
    elseif isDriganFlag and isHelpRepair == false then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", tostring(5))
    elseif isHelpRepair then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERY_FIX_COUNT_30")
    else
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERY_FIX_COUNT_10")
    end
    if isHelpRepair == true and maxEndurance - currentEndurance < 15 then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_DURABILITY_SHORTAGE") .. contentString
    end
    local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
    local messageboxData = {title = titleString, content = contentString, functionYes = funcYesExe, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
  -- DECOMPILER ERROR: 11 unprocessed JMP targets
end

PaGlobalFunc_FixMaxEnduranceInfo_UpdateProgressBar = function()
  -- function num : 0_21 , upvalues : FixMaxEnduranceInfo
  local self = FixMaxEnduranceInfo
  if ((self._ui).slot_targetItem).slotNo == nil then
    ((self._ui).progress_grey):SetProgressRate(0)
    ;
    ((self._ui).txt_enduranceVal):SetText(0)
    return 
  end
  local itemWrapper = getInventoryItemByType(((self._ui).slot_targetItem).whereType, ((self._ui).slot_targetItem).slotNo)
  if itemWrapper ~= nil then
    local maxEndurance = ((itemWrapper:getStaticStatus()):get()):getMaxEndurance()
    local dynamicMaxEndurance = (itemWrapper:get()):getMaxEndurance()
    local endurance = (itemWrapper:get()):getEndurance()
    ;
    ((self._ui).progress_grey):SetProgressRate(dynamicMaxEndurance / maxEndurance * 100)
    ;
    ((self._ui).txt_enduranceVal):SetText(endurance .. " / " .. dynamicMaxEndurance .. "  (" .. maxEndurance .. ")")
  else
    do
      ;
      ((self._ui).progress_grey):SetProgressRate(0)
      ;
      ((self._ui).txt_enduranceVal):SetText(0)
    end
  end
end

PaGlobalFunc_FixMaxEnduranceInfo_IsAutoRepeat = function()
  -- function num : 0_22 , upvalues : FixMaxEnduranceInfo
  return FixMaxEnduranceInfo._isAutoRepeat
end

PaGlobalFunc_FixMaxEnduranceInfo_GetSubjectItemKey = function()
  -- function num : 0_23 , upvalues : FixMaxEnduranceInfo
  return (FixMaxEnduranceInfo._fixEquipData).itemKeySub
end

FixMaxEnduranceInfo.fixEquipContinue = function(self, slotNo)
  -- function num : 0_24
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
        return 
      end
    end
    if ((getSelfPlayer()):get()):getCurrentWeight_s64() < self._s64_allWeight then
      self._s64_allWeight = ((getSelfPlayer()):get()):getCurrentWeight_s64()
    else
      return 
    end
    local moneyWhereType = (CppEnums.ItemWhereType).eInventory
    if mainItemWrapper:checkToRepairItemMaxEndurance() then
      repair_MaxEndurance((self._fixEquipData).whereTypeMain, (self._fixEquipData).slotNoMain, (self._fixEquipData).whereTypeSub, slotNo, moneyWhereType, self._useCash)
    else
      PaGlobal_FixEquip:fixEquipData_Clear()
    end
  end
end

XBOX_PAD_BUTTON = {X = 8, Y = 9, A = 10, B = 11, EMPTY = -1}
local _buttonUV = {
[XBOX_PAD_BUTTON.X] = {136, 1, 180, 45}
, 
[XBOX_PAD_BUTTON.Y] = {46, 1, 90, 45}
, 
[XBOX_PAD_BUTTON.A] = {1, 1, 45, 45}
, 
[XBOX_PAD_BUTTON.B] = {91, 1, 135, 45}
, 
[XBOX_PAD_BUTTON.EMPTY] = {0, 0, 2, 2}
}
PaGlobalFunc_SetKeyGuideUVTo = function(control, XBOX_PAD_BUTTON)
  -- function num : 0_25 , upvalues : _buttonUV
  local x1, y1, x2, y2 = setTextureUV_Func(control, (_buttonUV[XBOX_PAD_BUTTON])[1], (_buttonUV[XBOX_PAD_BUTTON])[2], (_buttonUV[XBOX_PAD_BUTTON])[3], (_buttonUV[XBOX_PAD_BUTTON])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end


