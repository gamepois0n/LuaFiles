-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\purification\panel_window_purification.luac 

-- params : ...
-- function num : 0
Panel_Purification:SetShow(false)
PuriManager = {
_ui = {_btn_Close = (UI.getChildControl)(Panel_Purification, "Button_CloseIcon"), _btn_Puri = (UI.getChildControl)(Panel_Purification, "Button_Purification"), _bg_Main = (UI.getChildControl)(Panel_Purification, "Static_Bg"), _bg_Bottom = (UI.getChildControl)(Panel_Purification, "Static_BottomBg")}
, _fromWhereType = -1, _fromSlotNo = -1, _moneyWhereType = 0, _resultWhereType = -1, _resultSlotNo = -1, _fromSlotOn = false, _resultSlotOn = false, _isAniStart = false, _const_ani_time = 3, _delta_ani_time = 0, 
_slotConfig = {createBorder = false, createCount = true, createCooltime = false, createCooltimeText = false, createCash = true, createEnchant = true, createQuickslotBagIcon = false}
}
-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PuriManager.SetPosition = function(self)
  -- function num : 0_0
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  if screenSizeY <= 800 then
    Panel_Purification:SetPosY(screenSizeY / 2 - Panel_Purification:GetSizeY() / 2 - 30)
  else
    Panel_Purification:SetPosY(screenSizeY / 2 - Panel_Purification:GetSizeY() / 2 - 100)
  end
  Panel_Purification:SetPosX(screenSizeX / 2 - Panel_Purification:GetSizeX() / 2)
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PuriManager.Open = function(self)
  -- function num : 0_1
  warehouse_requestInfoFromNpc()
  PuriManager:Clear()
  HandleClicked_Inventory_WeakenEnchant_Open()
  Panel_Window_Inventory:SetShow(true)
  Inventory_SetFunctor(PaGlobal_Purification_Filter, PaGlobal_Purification_RClick, PaGlobal_Purification_Close, nil)
  ;
  ((self._ui)._text_InvenMoney):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  ((self._ui)._text_WareHouseMoney):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  if Panel_Purification:GetShow() == false then
    PuriManager:SetPosition()
  end
  Panel_Purification:SetShow(true)
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PuriManager.Clear = function(self)
  -- function num : 0_2
  self._fromSlotNo = -1
  self._fromWhereType = -1
  self._resultSlotNo = -1
  self._resultWhereType = -1
  self._fromSlotOn = false
  self._resultSlotOn = false
  ;
  ((self._ui)._icon_items):clearItem()
  ;
  ((self._ui)._icon_result):clearItem()
  ;
  ((self._ui)._radio_Inven):SetCheck(true)
  ;
  ((self._ui)._radio_Warehouse):SetCheck(false)
  self._moneyWhereType = 0
  self._delta_ani_time = 0
  self._isAniStart = false
  ;
  ((self._ui)._btn_Puri):SetIgnore(false)
  ;
  ((self._ui)._btn_Puri):SetMonoTone(false)
  ;
  ((self._ui)._bg_itemSlot):EraseAllEffect()
  ;
  ((self._ui)._bg_resultItemSlot):EraseAllEffect()
end

PaGlobal_Purification_Close = function()
  -- function num : 0_3
  PuriManager:Close()
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PuriManager.Close = function(self)
  -- function num : 0_4
  ((self._ui)._icon_items):clearItem()
  HandleClicked_InventoryWindow_Close()
  Panel_Purification:SetShow(false)
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PuriManager.ClickMoneyWhereType = function(self, isInventory)
  -- function num : 0_5
  if isInventory == true then
    self._moneyWhereType = (CppEnums.ItemWhereType).eInventory
  else
    self._moneyWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
end

EventWarehouseUpdate = function(value)
  -- function num : 0_6
  local self = PuriManager
  if Panel_Purification:GetShow() == true then
    ((self._ui)._text_WareHouseMoney):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  end
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PuriManager.Initialize = function(self)
  -- function num : 0_7
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._bg_itemSlot = (UI.getChildControl)((self._ui)._bg_Main, "Static_ItemSlotBg")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._bg_resultItemSlot = (UI.getChildControl)((self._ui)._bg_Main, "Static_ResultItemSlotBg")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._bg_Deco = (UI.getChildControl)((self._ui)._bg_Main, "Static_Deco")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radio_Inven = (UI.getChildControl)((self._ui)._bg_Main, "RadioButton_InvenMoney")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._text_InvenMoney = (UI.getChildControl)((self._ui)._bg_Main, "StaticText_InvenMoney")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radio_Warehouse = (UI.getChildControl)((self._ui)._bg_Main, "RadioButton_WarehouseMoney")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._text_WareHouseMoney = (UI.getChildControl)((self._ui)._bg_Main, "StaticText_WarehouseMoney")
  ;
  ((self._ui)._radio_Inven):addInputEvent("Mouse_LUp", "PuriManager:ClickMoneyWhereType(true)")
  ;
  ((self._ui)._radio_Warehouse):addInputEvent("Mouse_LUp", "PuriManager:ClickMoneyWhereType(false)")
  ;
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PuriManager:Close()")
  ;
  ((self._ui)._btn_Puri):addInputEvent("Mouse_LUp", "PuriManager:RequestPuri()")
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._icon_items = {}
  ;
  (SlotItem.new)((self._ui)._icon_items, "feeItem", nil, (self._ui)._bg_itemSlot, self._slotConfig)
  ;
  ((self._ui)._icon_items):createChild()
  ;
  (((self._ui)._icon_items).icon):addInputEvent("Mouse_On", "PaGlobal_Purification_ShowToolTip(true)")
  ;
  (((self._ui)._icon_items).icon):addInputEvent("Mouse_Out", "PaGlobal_Purification_ShowToolTip(false)")
  ;
  (((self._ui)._icon_items).icon):addInputEvent("Mouse_RUp", "PuriManager:ClearItemSlot()")
  ;
  ((self._ui)._icon_items):clearItem()
  -- DECOMPILER ERROR at PC124: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._icon_result = {}
  ;
  (SlotItem.new)((self._ui)._icon_result, "resultItem", nil, (self._ui)._bg_resultItemSlot, self._slotConfig)
  ;
  ((self._ui)._icon_result):createChild()
  ;
  (((self._ui)._icon_result).icon):addInputEvent("Mouse_On", "PaGlobal_Purification_ResultShowToolTip(true)")
  ;
  (((self._ui)._icon_result).icon):addInputEvent("Mouse_Out", "PaGlobal_Purification_ResultShowToolTip(false)")
  ;
  ((self._ui)._icon_result):clearItem()
  -- DECOMPILER ERROR at PC164: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._text_desc = (UI.getChildControl)((self._ui)._bg_Bottom, "StaticText_Desc")
  ;
  ((self._ui)._text_desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._text_desc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PURIFICATION_DESC"))
  local prevSizeY = ((self._ui)._bg_Bottom):GetSizeY()
  local textSizeY = ((self._ui)._text_desc):GetTextSizeY()
  ;
  ((self._ui)._bg_Bottom):SetSize(((self._ui)._bg_Bottom):GetSizeX(), textSizeY + 15)
  if prevSizeY < textSizeY then
    Panel_Purification:SetSize(Panel_Purification:GetSizeX(), Panel_Purification:GetSizeY() + textSizeY - prevSizeY + 10)
    ;
    ((self._ui)._text_desc):ComputePos()
  end
  registerEvent("FromClient_notifyWeakenEnchantSuccess", "FromClient_notifyWeakenEnchantSuccess")
  registerEvent("EventWarehouseUpdate", "EventWarehouseUpdate")
  Panel_Purification:RegisterUpdateFunc("Update_RequestAni")
end

Update_RequestAni = function(delta)
  -- function num : 0_8
  local self = PuriManager
  if self._isAniStart == false then
    return 
  end
  self._delta_ani_time = self._delta_ani_time + delta
  if self._const_ani_time < self._delta_ani_time then
    self._delta_ani_time = 0
    ToClient_WeakenEncantByNpc(self._fromWhereType, self._fromSlotNo, self._moneyWhereType)
    ;
    ((self._ui)._btn_Puri):SetIgnore(false)
    ;
    ((self._ui)._btn_Puri):SetMonoTone(false)
    self._resultSlotNo = self._fromSlotNo
    self._resultWhereType = self._fromWhereType
    self._isAniStart = false
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PuriManager.RequestPuri = function(self)
  -- function num : 0_9
  if self._fromSlotNo < 0 or self._fromWhereType < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PURIFICATION_TARGET_EMPTY"))
    return 
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = PAGetString(Defines.StringSheet_GAME, "LUA_PURIFICATION_ALERT"), functionYes = function()
    -- function num : 0_9_0 , upvalues : self
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

    self._delta_ani_time = 0
    -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

    self._isAniStart = true
    ;
    ((self._ui)._bg_itemSlot):AddEffect("fUI_Purification_01A", false, 0, 0)
    ;
    ((self._ui)._bg_resultItemSlot):AddEffect("fUI_Purification_02A", false, 0, 0)
    ;
    ((self._ui)._btn_Puri):SetIgnore(true)
    ;
    ((self._ui)._btn_Puri):SetMonoTone(true)
    audioPostEvent_SystemUi(5, 17)
  end
, functionNo = function()
    -- function num : 0_9_1
  end
, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PuriManager.ClearItemSlot = function(self)
  -- function num : 0_10
  if self._isAniStart == true then
    return 
  end
  self._fromSlotNo = -1
  self._fromWhereType = -1
  self._fromSlotOn = false
  ;
  ((self._ui)._icon_items):clearItem()
  if self._resultSlotOn == false then
    ((self._ui)._icon_result):clearItem()
  end
end

PaGlobal_Purification_RClick = function(slotNo, itemWrapper, count, invenType)
  -- function num : 0_11
  local self = PuriManager
  local tempKey = (itemWrapper:get()):getKey()
  local staticStatus = itemWrapper:getStaticStatus()
  if staticStatus == nil then
    return 
  end
  if self._isAniStart == true then
    return 
  end
  ;
  ((self._ui)._icon_items):setItemByStaticStatus(staticStatus, (Defines.s64_const).s64_1)
  self._fromSlotNo = slotNo
  self._fromWhereType = invenType
  self._fromSlotOn = true
  self._resultSlotOn = false
  self._resultSlotNo = -1
  self._resultWhereType = -1
  local prevStatic = staticStatus:getPrevItemEnchantStaticStatus()
  ;
  ((self._ui)._icon_result):clearItem()
  if prevStatic ~= nil then
    ((self._ui)._icon_result):setItemByStaticStatus(prevStatic, (Defines.s64_const).s64_1)
    ;
    ((self._ui)._bg_resultItemSlot):SetMonoTone(true)
  end
end

PaGlobal_Purification_Filter = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_12
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return true
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    return true
  end
  if itemWrapper:isWeakenEnchantItem() then
    return false
  else
    return true
  end
end

PaGlobal_Purification_ShowToolTip = function(isShow)
  -- function num : 0_13
  local self = PuriManager
  if self._fromSlotOn == false then
    return 
  end
  local itemWrapper = getInventoryItemByType(self._fromWhereType, self._fromSlotNo)
  if isShow == true then
    Panel_Tooltip_Item_SetPosition(0, (self._ui)._bg_itemSlot, "Purification")
    Panel_Tooltip_Item_Show(itemWrapper, Panel_Purification, false, true, nil)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end

PaGlobal_Purification_ResultShowToolTip = function(isShow)
  -- function num : 0_14
  local self = PuriManager
  if self._resultSlotOn == false then
    return 
  end
  local itemWrapper = getInventoryItemByType(self._resultWhereType, self._resultSlotNo)
  if isShow == true then
    Panel_Tooltip_Item_SetPosition(0, (self._ui)._bg_resultItemSlot, "Purification")
    Panel_Tooltip_Item_Show(itemWrapper, Panel_Purification, false, true, nil)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end

FromClient_notifyWeakenEnchantSuccess = function()
  -- function num : 0_15
  local self = PuriManager
  audioPostEvent_SystemUi(5, 16)
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PURIFICATION_SUCCESS"))
  self._fromSlotOn = false
  self._fromSlotNo = -1
  self._fromWhereType = -1
  self._resultSlotOn = true
  ;
  ((self._ui)._icon_items):clearItem()
  ;
  ((self._ui)._icon_result):clearItem()
  ;
  ((self._ui)._bg_resultItemSlot):SetMonoTone(false)
  local itemWrapper = getInventoryItemByType(self._resultWhereType, self._resultSlotNo)
  local staticStatus = itemWrapper:getStaticStatus()
  ;
  ((self._ui)._icon_result):setItemByStaticStatus(staticStatus, (Defines.s64_const).s64_1)
  ;
  ((self._ui)._text_InvenMoney):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  ((self._ui)._text_WareHouseMoney):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
end

PuriManager:Initialize()

