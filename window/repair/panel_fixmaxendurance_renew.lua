local _panel = Panel_FixMaxEndurance_Renew
local FixMaxEnduranceInfo = {
  _ui = {
    stc_titleBar = UI.getChildControl(_panel, "Static_TitleBar"),
    txt_title = nil,
    stc_titleIcon = nil,
    stc_bodyBG = UI.getChildControl(_panel, "Static_BodyBG"),
    stc_itemSlotLeft = nil,
    stc_itemSlotRight = nil,
    slot_targetItem = {},
    slot_subjectItem = {},
    txt_expectedVal = nil,
    stc_progressBG = nil,
    progress_grey = nil,
    progress_red = nil,
    txt_enduranceVal = nil,
    txt_toggleAuto = nil,
    btn_Left = nil,
    txt_keyGuideLeft = nil,
    btn_Right = nil,
    txt_keyGuideRight = nil,
    stc_bottomLeft = UI.getChildControl(_panel, "Static_BottomLeft"),
    txt_moneyInChar = nil,
    txt_moneyInCharVal = nil,
    stc_bottomRight = UI.getChildControl(_panel, "Static_BottomRight"),
    txt_moneyInWarehouse = nil,
    txt_moneyInWarehouseVal = nil,
    txt_keyGuideDiscard = UI.getChildControl(_panel, "StaticText_KeyGuide")
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = false,
    createCash = true,
    createEnchant = true,
    createEnduranceIcon = true,
    createItemLock = true
  },
  _fixEquipData = {},
  _isAutoRepeat = false
}
function FromClient_luaLoadComplete_FixMaxEnduranceInfo_Init()
  FixMaxEnduranceInfo:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_FixMaxEnduranceInfo_Init")
function FixMaxEnduranceInfo:initialize()
  self._ui.txt_title = UI.getChildControl(self._ui.stc_titleBar, "StaticText_Title")
  self._ui.stc_titleIcon = UI.getChildControl(self._ui.stc_titleBar, "Static_TitleIcon")
  self._ui.stc_itemSlotLeft = UI.getChildControl(self._ui.stc_bodyBG, "Static_ItemSlot_1")
  self._ui.stc_itemSlotRight = UI.getChildControl(self._ui.stc_bodyBG, "Static_ItemSlot_2")
  self._ui.slot_targetItem = {}
  SlotItem.new(self._ui.slot_targetItem, "FixMaxSlot_Target", 1, self._ui.stc_itemSlotLeft, self._slotConfig)
  self._ui.slot_targetItem:createChild()
  self._ui.slot_targetItem.icon:addInputEvent("Mouse_RUp", "InputMRUp_FixMaxEndurance_TargetSlot()")
  self._ui.slot_subjectItem = {}
  SlotItem.new(self._ui.slot_subjectItem, "FixMaxSlot_Subject", 1, self._ui.stc_itemSlotRight, self._slotConfig)
  self._ui.slot_subjectItem:createChild()
  self._ui.slot_subjectItem.icon:addInputEvent("Mouse_RUp", "InputMRUp_FixMaxEndurance_SubjectSlot()")
  self._ui.txt_expectedVal = UI.getChildControl(self._ui.stc_bodyBG, "StaticText_ExpectedValue")
  self._ui.stc_progressBG = UI.getChildControl(self._ui.stc_bodyBG, "Static_ProgressBG")
  self._ui.progress_grey = UI.getChildControl(self._ui.stc_progressBG, "Progress2_Grey")
  self._ui.progress_red = UI.getChildControl(self._ui.stc_progressBG, "Progress2_Red")
  self._ui.txt_enduranceVal = UI.getChildControl(self._ui.stc_bodyBG, "StaticText_EnduranceVal")
  self._ui.txt_toggleAuto = UI.getChildControl(self._ui.stc_bodyBG, "StaticText_ToggleAuto")
  self._ui.txt_toggleAuto:SetShow(false)
  local posX = self._ui.stc_bodyBG:GetSizeX() / 2 - (self._ui.txt_toggleAuto:GetTextSizeX() + self._ui.txt_toggleAuto:GetSizeX()) / 2
  self._ui.txt_toggleAuto:SetPosX(posX)
  self._ui.btn_Left = UI.getChildControl(self._ui.stc_bodyBG, "Button_Ribbon_1")
  self._ui.btn_Left:addInputEvent("Mouse_LUp", "Input_FixMaxEndurance_FixMaxEndurance(false)")
  self._ui.btn_Right = UI.getChildControl(self._ui.stc_bodyBG, "Button_Ribbon_2")
  self._ui.btn_Right:addInputEvent("Mouse_LUp", "Input_FixMaxEndurance_FixMaxEndurance(true)")
  self._ui.txt_keyGuideLeft = UI.getChildControl(self._ui.btn_Left, "StaticText_KeyGuide")
  self._ui.txt_keyGuideRight = UI.getChildControl(self._ui.btn_Right, "StaticText_KeyGuide")
  self._ui.txt_moneyInChar = UI.getChildControl(self._ui.stc_bottomLeft, "StaticText_MoneyInCharacter")
  self._ui.txt_moneyInCharVal = UI.getChildControl(self._ui.stc_bottomLeft, "StaticText_MoneyInCharacterVal")
  self._ui.txt_moneyInWarehouse = UI.getChildControl(self._ui.stc_bottomRight, "StaticText_MoneyInWarehouse")
  self._ui.txt_moneyInWarehouseVal = UI.getChildControl(self._ui.stc_bottomRight, "StaticText_MoneyInWarehouseVal")
  self:registEventHandler()
  self:registMessageHandler()
end
function FixMaxEnduranceInfo:registEventHandler()
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "Input_FixMaxEndurance_FixMaxEndurance(true)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "Input_FixMaxEndurance_FixMaxEndurance(false)")
end
function FixMaxEnduranceInfo:registMessageHandler()
end
function PaGlobalFunc_FixMaxEnduranceInfo_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_FixMaxEnduranceInfo_Open()
  FixMaxEnduranceInfo:open()
end
function FixMaxEnduranceInfo:open()
  _panel:SetShow(true)
  self:cleanAll()
end
function FixMaxEnduranceInfo:cleanAll()
  if nil == self._ui.slot_targetItem.slotNo and nil == self._ui.slot_subjectItem.slotNo then
    return true
  end
  self._ui.slot_targetItem:clearItem()
  self._ui.slot_targetItem.slotNo = nil
  self._ui.slot_subjectItem:clearItem()
  self._ui.slot_subjectItem.slotNo = nil
  self._ui.progress_grey:SetProgressRate(0)
  self._ui.progress_red:SetProgressRate(0)
  self._ui.txt_enduranceVal:SetText("")
  self._ui.txt_expectedVal:SetText("")
  PaGlobalFunc_SetKeyGuideUVTo(self._ui.txt_keyGuideLeft, XBOX_PAD_BUTTON.EMPTY)
  PaGlobalFunc_SetKeyGuideUVTo(self._ui.txt_keyGuideRight, XBOX_PAD_BUTTON.EMPTY)
  ToClient_setTargetPanel(Panel_Window_Inventory)
  Inventory_SetFunctor(PaGlobalFunc_FixMaxEnduranceInfo_FilterTarget, PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject, nil, nil)
  self._ui.txt_keyGuideDiscard:SetText("Exit")
  self:updateMoneyDisplay()
  return false
end
function PaGlobalFunc_FixMaxEnduranceInfo_Close()
  FixMaxEnduranceInfo:close()
end
function FixMaxEnduranceInfo:close()
  _panel:SetShow(false)
  Inventory_SetFunctor(nil, nil, nil, nil)
  if Defines.UIMode.eUIMode_Repair == GetUIMode() then
    PaGlobalFunc_RepairInfo_Open()
  end
end
function FixMaxEnduranceInfo:updateMoneyDisplay()
  self._ui.txt_moneyInCharVal:SetText(makeDotMoney(getSelfPlayer():get():getInventory():getMoney_s64()))
  if ToClient_HasWareHouseFromNpc() then
    self._ui.txt_moneyInWarehouseVal:SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
    self._ui.txt_moneyInWarehouseVal:SetShow(true)
    self._ui.txt_moneyInWarehouse:SetShow(true)
  else
    self._ui.txt_moneyInWarehouseVal:SetShow(false)
    self._ui.txt_moneyInWarehouse:SetShow(false)
  end
end
function PaGlobalFunc_FixMaxEnduranceInfo_OnPadB()
  local self = FixMaxEnduranceInfo
  if nil ~= self._ui.slot_subjectItem.slotNo then
    InputMRUp_FixMaxEndurance_SubjectSlot()
  elseif FixMaxEnduranceInfo:cleanAll() then
    PaGlobalFunc_FixMaxEnduranceInfo_Close()
  end
end
function PaGlobalFunc_FixMaxEnduranceInfo_FilterTarget(slotNo, itemWrapper)
  if nil == itemWrapper then
    return true
  end
  isAble = itemWrapper:checkToRepairItemMaxEndurance()
  return not isAble
end
function PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject(slotNo, itemWrapper, count, inventoryType)
  local self = FixMaxEnduranceInfo
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if nil == itemWrapper then
    return
  end
  if _panel:GetShow() and false == self._checkHasItemJewel and nil ~= self._ui.slot_targetItem.slotNo and nil == self._ui.slot_subjectItem.slotNo and true == self:checkJewel(slotNo, itemWrapper, count, inventoryType) then
    self._checkHasItemJewel = false
    return
  end
  self._checkHasItemJewel = false
  if nil == self._ui.slot_targetItem.slotNo then
    self._ui.slot_targetItem:setItem(itemWrapper)
    self._ui.slot_targetItem.whereType = inventoryType
    self._ui.slot_targetItem.slotNo = slotNo
    self._ui.slot_targetItem.itemKey = itemWrapper:get():getKey()
    local maxEndurance = itemWrapper:getStaticStatus():get():getMaxEndurance()
    local dynamicMaxEndurance = itemWrapper:get():getMaxEndurance()
    local endurance = itemWrapper:get():getEndurance()
    self._memoryFlagRecoveryCount = itemWrapper:getStaticStatus():get()._repairEnduranceCount
    self._ui.progress_red:SetProgressRate(endurance / maxEndurance * 100)
    self._ui.progress_grey:SetProgressRate(dynamicMaxEndurance / maxEndurance * 100)
    self._ui.txt_enduranceVal:SetText(endurance .. " / " .. dynamicMaxEndurance .. "  (" .. maxEndurance .. ")")
    Inventory_SetFunctor(PaGlobalFunc_FixMaxEnduranceInfo_FilterSubject, PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject, FixEquip_Close, nil)
    self._ui.txt_keyGuideDiscard:SetText("Discard")
  elseif nil == self._ui.slot_subjectItem.slotNo then
    self._ui.slot_subjectItem:setItem(itemWrapper)
    self._ui.slot_subjectItem.whereType = inventoryType
    self._ui.slot_subjectItem.slotNo = slotNo
    self._ui.slot_subjectItem.itemKey = itemWrapper:get():getKey():getItemKey()
    if 44195 == self._ui.slot_subjectItem.itemKey then
      self._ui.txt_expectedVal:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RENEW_RECOVERY") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RECOVERYCOUNT", "count", tostring(self._memoryFlagRecoveryCount)))
    elseif 9750 == self._ui.slot_subjectItem.itemKey then
      self._ui.txt_expectedVal:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RENEW_RECOVERY") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RECOVERYCOUNT", "count", tostring(5)))
    else
      self._ui.txt_expectedVal:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RENEW_RECOVERY") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_RECOVERYCOUNT", "count", tostring(10)))
    end
    self._ui.txt_keyGuideDiscard:SetText("Discard")
  else
    UI.ASSERT(false, "Client data, UI data is Mismatch!!!!!")
    return
  end
  local hasCashItem = doHaveContentsItem(27, 0, false)
  if hasCashItem then
    self._ui.btn_Right:SetIgnore(false)
    self._ui.txt_keyGuideLeft:SetMonoTone(false)
  else
    self._ui.btn_Right:SetIgnore(true)
    self._ui.txt_keyGuideLeft:SetMonoTone(true)
  end
  local isReady = self:isReadyToRepairMaxEndurance()
  if isReady == true then
    PaGlobalFunc_SetKeyGuideUVTo(self._ui.txt_keyGuideLeft, XBOX_PAD_BUTTON.Y)
    PaGlobalFunc_SetKeyGuideUVTo(self._ui.txt_keyGuideRight, XBOX_PAD_BUTTON.X)
    ToClient_setTargetPanel(_panel)
  else
  end
end
function PaGlobalFunc_FixMaxEnduranceInfo_FilterSubject(slotNo, itemWrapper, inventoryType)
  local self = FixMaxEnduranceInfo
  if nil == itemWrapper then
    return true
  end
  local isAble = false
  local repairItemKey = self._ui.slot_targetItem.itemKey
  if nil == repairItemKey then
    return true
  end
  if itemWrapper:checkToRepairItemMaxEnduranceWithMoneyAndItem(repairItemKey) and (self._ui.slot_targetItem.slotNo ~= slotNo or self._ui.slot_targetItem.whereType ~= inventoryType) then
    isAble = true
  end
  return not isAble
end
function FixMaxEnduranceInfo:isReadyToRepairMaxEndurance()
  if nil == self._ui.slot_targetItem.slotNo then
    return false
  end
  if nil == self._ui.slot_subjectItem.slotNo then
    return false
  end
  return true
end
function FixMaxEnduranceInfo:checkJewel(slotNo, itemWrapper, count, inventoryType)
  local function repairConfirm()
    PaGlobal_FixEquip._checkHasItemJewel = true
    PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject(slotNo, itemWrapper, count, inventoryType)
  end
  if true == itemWrapper:hasItemJewel() then
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
      content = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_CHECKHASITEMJEWEL_DESC"),
      functionYes = repairConfirm,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    return true
  else
    return false
  end
end
function InputMRUp_FixMaxEndurance_TargetSlot()
  FixMaxEnduranceInfo:cleanAll()
end
function InputMRUp_FixMaxEndurance_SubjectSlot()
  FixMaxEnduranceInfo:cleanSubject()
end
function FixMaxEnduranceInfo:cleanSubject()
  if nil ~= self._ui.slot_targetItem.slotNo then
    Inventory_SetFunctor(PaGlobalFunc_FixMaxEnduranceInfo_FilterSubject, PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject, FixEquip_Close, nil)
    self._ui.slot_subjectItem:clearItem()
    self._ui.slot_subjectItem.slotNo = nil
    self._ui.slot_subjectItem.itemKey = nil
    self._ui.txt_expectedVal:SetText("")
  else
    self:cleanAll()
  end
end
function Input_FixMaxEndurance_FixMaxEndurance(isHelpRepair)
  FixMaxEnduranceInfo:fixEquip_ApplyButton(isHelpRepair)
end
function FixMaxEnduranceInfo:fixEquip_ApplyButton(isHelpRepair)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local moneyWhereType = CppEnums.ItemWhereType.eInventory
  local function funcYesExe()
    self._fixEquipData.slotNoMain = self._ui.slot_targetItem.slotNo
    self._fixEquipData.whereTypeMain = self._ui.slot_targetItem.whereType
    self._fixEquipData.whereTypeSub = self._ui.slot_subjectItem.whereType
    self._fixEquipData.itemKeySub = self._ui.slot_subjectItem.itemKey
    self._s64_allWeight = getSelfPlayer():get():getCurrentWeight_s64()
    self._useCash = isHelpRepair
    repair_MaxEndurance(self._ui.slot_targetItem.whereType, self._ui.slot_targetItem.slotNo, self._ui.slot_subjectItem.whereType, self._ui.slot_subjectItem.slotNo, moneyWhereType, isHelpRepair)
    self:updateMoneyDisplay()
    self:cleanSubject()
    return
  end
  if nil ~= self._ui.slot_targetItem.slotNo and nil ~= self._ui.slot_subjectItem.slotNo then
    local itemWrapper = getInventoryItemByType(self._ui.slot_targetItem.whereType, self._ui.slot_targetItem.slotNo)
    local memoryFlagRecoveryCount = itemWrapper:getStaticStatus():get()._repairEnduranceCount
    local isMemoryFlag = self._ui.slot_subjectItem.itemKey == 44195
    local isDriganFlag = self._ui.slot_subjectItem.itemKey == 9750
    local maxEndurance
    local currentEndurance = itemWrapper:get():getEndurance()
    if false == itemWrapper:getStaticStatus():get():isUnbreakable() then
      maxEndurance = itemWrapper:getStaticStatus():get():getMaxEndurance()
    end
    local contentString = ""
    if isMemoryFlag and true == isHelpRepair then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", memoryFlagRecoveryCount * 4)
    elseif isMemoryFlag and false == isHelpRepair then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", memoryFlagRecoveryCount)
    elseif isDriganFlag and true == isHelpRepair then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", tostring(20))
    elseif isDriganFlag and false == isHelpRepair then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERYCOUNT", "count", tostring(5))
    elseif isHelpRepair then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERY_FIX_COUNT_30")
    else
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_ONLYITEMCHECK_CONTENTSTRING") .. PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_CONTROL_MAXENDURANCERECOVERY_FIX_COUNT_10")
    end
    if true == isHelpRepair and maxEndurance - currentEndurance < 15 then
      contentString = PAGetString(Defines.StringSheet_GAME, "LUA_FIXEQUIP_DURABILITY_SHORTAGE") .. contentString
    end
    local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
    local messageboxData = {
      title = titleString,
      content = contentString,
      functionYes = funcYesExe,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  else
  end
end
function PaGlobalFunc_FixMaxEnduranceInfo_UpdateProgressBar()
  local self = FixMaxEnduranceInfo
  if nil == self._ui.slot_targetItem.slotNo then
    self._ui.progress_grey:SetProgressRate(0)
    self._ui.txt_enduranceVal:SetText(0)
    return
  end
  local itemWrapper = getInventoryItemByType(self._ui.slot_targetItem.whereType, self._ui.slot_targetItem.slotNo)
  if nil ~= itemWrapper then
    local maxEndurance = itemWrapper:getStaticStatus():get():getMaxEndurance()
    local dynamicMaxEndurance = itemWrapper:get():getMaxEndurance()
    local endurance = itemWrapper:get():getEndurance()
    self._ui.progress_grey:SetProgressRate(dynamicMaxEndurance / maxEndurance * 100)
    self._ui.txt_enduranceVal:SetText(endurance .. " / " .. dynamicMaxEndurance .. "  (" .. maxEndurance .. ")")
  else
    self._ui.progress_grey:SetProgressRate(0)
    self._ui.txt_enduranceVal:SetText(0)
  end
end
function PaGlobalFunc_FixMaxEnduranceInfo_IsAutoRepeat()
  return FixMaxEnduranceInfo._isAutoRepeat
end
function PaGlobalFunc_FixMaxEnduranceInfo_GetSubjectItemKey()
  return FixMaxEnduranceInfo._fixEquipData.itemKeySub
end
function FixMaxEnduranceInfo:fixEquipContinue(slotNo)
  local selfPlayer = getSelfPlayer()
  local mainItemWrapper = getInventoryItemByType(self._fixEquipData.whereTypeMain, self._fixEquipData.slotNoMain)
  if nil == mainItemWrapper then
    return
  end
  if nil == selfPlayer then
    return
  end
  local invenMoney = selfPlayer:get():getInventory():getMoney_s64()
  if self._useCash then
    local doHaveCashItem = doHaveContentsItem(27, 0, false)
    if not doHaveCashItem and self._useCash then
      return
    end
  end
  if getSelfPlayer():get():getCurrentWeight_s64() < self._s64_allWeight then
    self._s64_allWeight = getSelfPlayer():get():getCurrentWeight_s64()
  else
    return
  end
  local moneyWhereType = CppEnums.ItemWhereType.eInventory
  if mainItemWrapper:checkToRepairItemMaxEndurance() then
    repair_MaxEndurance(self._fixEquipData.whereTypeMain, self._fixEquipData.slotNoMain, self._fixEquipData.whereTypeSub, slotNo, moneyWhereType, self._useCash)
  else
    PaGlobal_FixEquip:fixEquipData_Clear()
  end
end
XBOX_PAD_BUTTON = {
  X = 8,
  Y = 9,
  A = 10,
  B = 11,
  EMPTY = -1
}
local _buttonUV = {
  [XBOX_PAD_BUTTON.X] = {
    136,
    1,
    180,
    45
  },
  [XBOX_PAD_BUTTON.Y] = {
    46,
    1,
    90,
    45
  },
  [XBOX_PAD_BUTTON.A] = {
    1,
    1,
    45,
    45
  },
  [XBOX_PAD_BUTTON.B] = {
    91,
    1,
    135,
    45
  },
  [XBOX_PAD_BUTTON.EMPTY] = {
    0,
    0,
    2,
    2
  }
}
function PaGlobalFunc_SetKeyGuideUVTo(control, XBOX_PAD_BUTTON)
  local x1, y1, x2, y2 = setTextureUV_Func(control, _buttonUV[XBOX_PAD_BUTTON][1], _buttonUV[XBOX_PAD_BUTTON][2], _buttonUV[XBOX_PAD_BUTTON][3], _buttonUV[XBOX_PAD_BUTTON][4])
  control:getBaseTexture():setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end
