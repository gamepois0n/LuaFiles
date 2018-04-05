-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_npcgift.luac 

-- params : ...
-- function num : 0
local PaGlobal_NpcGift = {
_ui = {_questionBtn = (UI.getChildControl)(Panel_NpcGift, "Button_Question"), _presentBtn = (UI.getChildControl)(Panel_NpcGift, "Button_Present"), _confessionBtn = (UI.getChildControl)(Panel_NpcGift, "Button_Confession"), _closeBtn = (UI.getChildControl)(Panel_NpcGift, "Button_Close"), 
_slot_PresentItem = {}
, _interestItemListBG = (UI.getChildControl)(Panel_NpcGift, "Static_InterestItemListBg"), 
_slot_InterestItemList = {}
}
, _inventoryType = 0, _slotNo = 0, _count = 0, _presentItemName = "", _interestItemCount = 5}
local slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
PaGlobal_NpcGift.init = function(self)
  -- function num : 0_0 , upvalues : slotConfig
  Panel_NpcGift:SetShow(false)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._slot_PresentItem).icon = (UI.getChildControl)(Panel_NpcGift, "Static_PresentItemSlot")
  ;
  (SlotItem.new)((self._ui)._slot_PresentItem, "PresentItem", 0, Panel_NpcGift, slotConfig)
  ;
  ((self._ui)._slot_PresentItem):createChild()
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._slot_PresentItem).empty = true
  ;
  ((self._ui)._slot_PresentItem):clearItem()
  ;
  (((self._ui)._slot_PresentItem).border):SetSize(42, 42)
  Panel_Tooltip_Item_SetPosition(0, (self._ui)._slot_PresentItem, "NpcGift")
  for idx = 0, self._interestItemCount - 1 do
    local itemSlot = {}
    itemSlot.icon = (UI.getChildControl)((self._ui)._interestItemListBG, "Static_InterestItemSlot" .. tostring(idx))
    ;
    (SlotItem.new)(itemSlot, "InterestItemSlot_" .. tostring(idx), 0, Panel_NpcGift, slotConfig)
    itemSlot:createChild()
    itemSlot.empty = true
    itemSlot:clearItem()
    ;
    (itemSlot.border):SetSize(42, 42)
    Panel_Tooltip_Item_SetPosition(idx, itemSlot, "NpcIntertestGift")
    -- DECOMPILER ERROR at PC91: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui)._slot_InterestItemList)[idx] = itemSlot
  end
end

PaGlobal_NpcGift.setItemToSlot = function(self, uiSlot, itemSS, count)
  -- function num : 0_1
  (uiSlot.icon):AddEffect("UI_Button_Hide", false, 0, 0)
  uiSlot.empty = false
  ;
  (uiSlot.icon):SetMonoTone(false)
  uiSlot:setItemByStaticStatus(itemSS, count, -1)
end

PaGlobal_NpcGift.open = function(self)
  -- function num : 0_2
  Panel_NpcGift:SetShow(true)
  InventoryWindow_Show()
  Inventory_SetFunctor(FGlobal_Enchant_FileterForNpcGift, FGlobal_NpcGift_RClickForTargetItem, FGlobal_NpcGift_Close, nil)
  ;
  ((self._ui)._slot_PresentItem):clearItem()
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._slot_PresentItem).empty = true
  self._count = 0
  local interestitemSize = ToClient_getInterestNpcGiftSize()
  for idx = 0, interestitemSize - 1 do
    (((self._ui)._slot_InterestItemList)[idx]):clearItem()
    if idx == self._interestItemCount then
      break
    end
    local itemSS = ToClient_getInterestNpcGift(idx)
    if itemSS ~= nil then
      self:setItemToSlot(((self._ui)._slot_InterestItemList)[idx], itemSS, 1)
    end
  end
end

PaGlobal_NpcGift.close = function(self)
  -- function num : 0_3
  Panel_NpcGift:SetShow(false)
  InventoryWindow_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
end

FGlobal_NpcGift_RClickForTargetItem = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_4 , upvalues : PaGlobal_NpcGift
  if itemWrapper == nil then
    return 
  end
  local self = PaGlobal_NpcGift
  self._inventoryType = inventoryType
  self._slotNo = slotNo
  self._presentItemName = (itemWrapper:getStaticStatus()):getName()
  self._count = 0
  if count == 1 then
    FGlobal_NpcGift_ItemSetting(count)
  else
    Panel_NumberPad_Show(true, count, 0, FGlobal_NpcGift_ItemSetting)
  end
end

FGlobal_NpcGift_ItemSetting = function(count)
  -- function num : 0_5 , upvalues : PaGlobal_NpcGift
  local self = PaGlobal_NpcGift
  self._count = count
  local itemWrapper = getInventoryItemByType(self._inventoryType, self._slotNo)
  if itemWrapper == nil then
    return 
  end
  self:setItemToSlot((self._ui)._slot_PresentItem, itemWrapper:getStaticStatus(), count)
end

FGlobal_NpcGift_PopupMessage = function()
  -- function num : 0_6 , upvalues : PaGlobal_NpcGift
  local self = PaGlobal_NpcGift
  if self._count == 0 then
    return 
  end
  local messageBoxtitle = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NPC_GIFT_CONFIRM", "itemName", tostring(self._presentItemName), "count", tostring(self._count))
  local messageBoxData = {title = messageBoxtitle, content = messageBoxMemo, functionYes = FGlobal_NpcGift_Confirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData, "middle")
end

FGlobal_NpcGift_Confirm = function()
  -- function num : 0_7 , upvalues : PaGlobal_NpcGift
  local self = PaGlobal_NpcGift
  ToClient_giveNpcGift(self._inventoryType, self._slotNo, self._count)
end

FGlobal_NpcGift_Open = function()
  -- function num : 0_8 , upvalues : PaGlobal_NpcGift
  PaGlobal_NpcGift:open()
end

FGlobal_NpcGift_Close = function()
  -- function num : 0_9 , upvalues : PaGlobal_NpcGift
  PaGlobal_NpcGift:close()
end

FGlobal_NpcGift_OnPresentTooltip = function()
  -- function num : 0_10 , upvalues : PaGlobal_NpcGift
  local self = PaGlobal_NpcGift
  local itemWrapper = getInventoryItemByType(self._inventoryType, self._slotNo)
  if itemWrapper == nil then
    return 
  end
  Panel_Tooltip_Item_Show(itemWrapper:getStaticStatus(), ((PaGlobal_NpcGift._ui)._slot_PresentItem).icon, true, false)
end

FGlobal_NpcGift_OnTooltip = function(idx)
  -- function num : 0_11 , upvalues : PaGlobal_NpcGift
  local needSS = ToClient_getInterestNpcGift(idx)
  Panel_Tooltip_Item_Show(needSS, (((PaGlobal_NpcGift._ui)._slot_InterestItemList)[idx]).icon, true, false)
end

FGlobal_NpcGift_OutTooltip = function()
  -- function num : 0_12
  Panel_Tooltip_Item_hideTooltip()
end

FGlobal_Enchant_FileterForNpcGift = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_13
  do
    local itemWrapper = getInventoryItemByType(whereType, slotNo)
    if itemWrapper == nil then
      return true
    end
    if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
      return true
    end
    do return itemWrapper:checkToGiveNpc() == false end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

FromClient_luaLoadComplete_NpcGift = function()
  -- function num : 0_14 , upvalues : PaGlobal_NpcGift
  PaGlobal_NpcGift:init()
  PaGlobal_NpcGift:registEventHandler()
end

FromClient_NpcGiftSend = function()
  -- function num : 0_15 , upvalues : PaGlobal_NpcGift
  local self = PaGlobal_NpcGift
  self._count = 0
  self._inventoryType = 0
  self._slotNo = -1
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._slot_PresentItem).empty = true
  ;
  ((self._ui)._slot_PresentItem):clearItem()
end

PaGlobal_NpcGift.registEventHandler = function(self)
  -- function num : 0_16
  local ui = self._ui
  ;
  (ui._presentBtn):addInputEvent("Mouse_LUp", "FGlobal_NpcGift_PopupMessage()")
  ;
  (ui._closeBtn):addInputEvent("Mouse_LUp", "FGlobal_NpcGift_Close()")
  ;
  ((ui._slot_PresentItem).icon):addInputEvent("Mouse_On", "FGlobal_NpcGift_OnPresentTooltip()")
  ;
  ((ui._slot_PresentItem).icon):addInputEvent("Mouse_Out", "FGlobal_NpcGift_OutTooltip()")
  for idx = 0, self._interestItemCount - 1 do
    (((ui._slot_InterestItemList)[idx]).icon):addInputEvent("Mouse_On", "FGlobal_NpcGift_OnTooltip(" .. idx .. ")")
    ;
    (((ui._slot_InterestItemList)[idx]).icon):addInputEvent("Mouse_Out", "FGlobal_NpcGift_OutTooltip()")
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_NpcGift")
registerEvent("FromClient_VaryIntimacy_Dialog", "FromClient_NpcGiftSend")

