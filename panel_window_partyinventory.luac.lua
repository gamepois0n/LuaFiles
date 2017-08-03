-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\inventory\panel_window_partyinventory.luac 

-- params : ...
-- function num : 0
Panel_Window_PartyInventory:SetShow(false, false)
Panel_Window_PartyInventory:ActiveMouseEventEffect(true)
Panel_Window_PartyInventory:setMaskingChild(true)
Panel_Window_PartyInventory:setGlassBackground(true)
partyInven = {itemSlot = (UI.getChildControl)(Panel_Window_PartyInventory, "Static_Slot0"), invenWeightTxt = (UI.getChildControl)(Panel_Window_PartyInventory, "Static_Text_Weight"), slotBackground = (Array.new)(), slots = (Array.new)(), 
_listPool = {}
, slotCount = 10, _slotsCols = 5, _slotsRows = 0, slotStartX = 10, slotStartY = 10, slotGapX = 42, slotGapY = 47, 
_slotConfig = {createIcon = true, createBorder = true, createCount = true}
}
local btnPartyInven = (UI.getChildControl)(Panel_Party, "Button_PartyInven")
local btnClose = (UI.getChildControl)(Panel_Window_PartyInventory, "Button_Win_Close")
local btnQuestion = (UI.getChildControl)(Panel_Window_PartyInventory, "StaticText_Desc")
-- DECOMPILER ERROR at PC71: Confused about usage of register: R3 in 'UnsetPending'

partyInven.Init = function(self)
  -- function num : 0_0 , upvalues : btnQuestion
  for listIdx = 0, self.slotCount - 1 do
    local slot = {}
    slot.empty = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_PartyInventory, "PartyInventory_Slot_Base_" .. listIdx)
    CopyBaseProperty(self.itemSlot, slot.empty)
    ;
    (slot.empty):SetShow(true)
    local row = (math.floor)(listIdx / self._slotsCols)
    local col = listIdx % self._slotsCols
    ;
    (slot.empty):SetPosX(self.slotStartX + self.slotGapX * col)
    ;
    (slot.empty):SetPosY(self.slotStartY + self.slotGapY * row)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self.slotBackground)[listIdx] = slot
  end
  for ii = 0, self.slotCount - 1 do
    local slot = {}
    ;
    (SlotItem.new)(slot, "ItemIcon_" .. ii, ii, Panel_Window_PartyInventory, self._slotConfig)
    slot:createChild()
    local row = (math.floor)(ii / self._slotsCols)
    local col = ii % self._slotsCols
    ;
    (slot.icon):SetPosX(self.slotStartX + self.slotGapX * col)
    ;
    (slot.icon):SetPosY(self.slotStartY + self.slotGapY * row)
    ;
    (slot.icon):SetSize(35, 35)
    ;
    (slot.border):SetSize(35, 35)
    ;
    (slot.count):SetHorizonRight()
    ;
    (slot.count):SetVerticalBottom()
    ;
    (slot.count):SetSpanSize(5, 2)
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self.slots)[ii] = slot
  end
  btnQuestion:SetEnableArea(0, 0, 130, 20)
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R3 in 'UnsetPending'

partyInven.Clear = function(self)
  -- function num : 0_1
  for listIdx = 0, self.slotCount - 1 do
    local slot = (self.slots)[listIdx]
    slot:clearItem()
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R3 in 'UnsetPending'

partyInven.Update = function(self)
  -- function num : 0_2
  for listIdx = 0, self.slotCount - 1 do
    local slot = (self.slots)[listIdx]
    slot:clearItem()
  end
  for slotIndex = 0, self.slotCount - 1 do
    local itemWrapper = ToClient_GetPartyInventory(slotIndex)
    local getPossible = ToClient_IsLootable(slotIndex)
    if itemWrapper ~= nil then
      local slot = (self.slots)[slotIndex]
      slot:setItem(itemWrapper)
      if getPossible then
        (slot.icon):SetMonoTone(false)
      else
        ;
        (slot.icon):SetMonoTone(true)
      end
      ;
      (slot.icon):addInputEvent("Mouse_RUp", "partyInven_slotItemRClick( " .. slotIndex .. ", " .. tostring(getPossible) .. " )")
      ;
      (slot.icon):addInputEvent("Mouse_On", "partyInven_slotItemOn( " .. slotIndex .. " )")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "partyInven_slotItemOff()")
    end
  end
  local currentWeight = ToClient_GetCurrentWeight()
  ;
  (self.invenWeightTxt):SetText((string.format)("%.0f", currentWeight / 10000) .. "/50" .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end

FromClient_ChangePartyInventory = function()
  -- function num : 0_3 , upvalues : btnPartyInven
  btnPartyInven:EraseAllEffect()
  btnPartyInven:AddEffect("fUI_Party_Inventory_01A", false, 0, 0)
  partyInven:Update()
end

partyInven_slotItemRClick = function(slotNo, getType)
  -- function num : 0_4
  local itemWrapper = ToClient_GetPartyInventory(slotNo)
  if itemWrapper == nil then
    return 
  end
  local getPcInven = function(slotNo, itemCount)
    -- function num : 0_4_0
    ToClient_GetPartyItem(itemCount, slotNo)
    partyInven:Update()
  end

  if not getType then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYINVENTORY_ACCESS_ACK"), 3)
    return 
  end
  local itemCount_s64 = (itemWrapper:get()):getCount_s64()
  if itemCount_s64 ~= 1 then
    Panel_NumberPad_Show(true, itemCount_s64, slotNo, getPcInven)
  else
    ToClient_GetPartyItem(1, slotNo)
    partyInven:Update()
  end
end

partyInven_slotItemOn = function(slotNo)
  -- function num : 0_5
  local self = partyInven
  local slot = (self.slots)[slotNo]
  local itemWrapper = ToClient_GetPartyInventory(slotNo)
  if itemWrapper == nil then
    return 
  end
  Panel_Tooltip_Item_Show(itemWrapper, slot.icon, false, true, nil)
end

partyInven_slotItemOff = function()
  -- function num : 0_6
  Panel_Tooltip_Item_hideTooltip()
end

FGlobal_PartyInventoryOpen = function()
  -- function num : 0_7
  local partyNum = RequestParty_getPartyMemberCount()
  if partyNum == 0 then
    return 
  end
  local lootType = RequestParty_getPartyLootType()
  if lootType ~= 4 then
    return 
  end
  Panel_Window_PartyInventory:SetShow(true)
  partyInven:Update()
end

FGlobal_PartyInventoryClose = function()
  -- function num : 0_8
  Panel_Window_PartyInventory:SetShow(false)
end

PartyInventorySimpleTooltip = function(isShow)
  -- function num : 0_9 , upvalues : btnQuestion
  local name, desc, uiControl = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYINVENTORY_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYINVENTORY_TOOLTIP_DESC")
  uiControl = btnQuestion
  if isShow == true then
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R3 in 'UnsetPending'

partyInven.registEventHandler = function(self)
  -- function num : 0_10 , upvalues : btnPartyInven, btnClose, btnQuestion
  btnPartyInven:addInputEvent("Mouse_LUp", "FGlobal_PartyInventoryOpen()")
  btnClose:addInputEvent("Mouse_LUp", "FGlobal_PartyInventoryClose()")
  btnQuestion:addInputEvent("Mouse_On", "PartyInventorySimpleTooltip( true )")
  btnQuestion:addInputEvent("Mouse_Out", "PartyInventorySimpleTooltip( false )")
  btnQuestion:setTooltipEventRegistFunc("PartyInventorySimpleTooltip( true )")
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R3 in 'UnsetPending'

partyInven.registMessageHandler = function(self)
  -- function num : 0_11
  registerEvent("FromClient_ChangePartyInventory", "FromClient_ChangePartyInventory")
end

partyInven:Init()
partyInven:registEventHandler()
partyInven:registMessageHandler()

