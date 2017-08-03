-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\looting\panel_looting.luac 

-- params : ...
-- function num : 0
Panel_Looting:SetShow(false, false)
Panel_Looting:setMaskingChild(true)
Panel_Looting:ActiveMouseEventEffect(true)
Panel_Looting:setGlassBackground(true)
Panel_Looting:RegisterShowEventFunc(true, "LootingShowAni()")
Panel_Looting:RegisterShowEventFunc(false, "LootingHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
Panel_Looting_Value_isCloseLooting = false
local looting = {MAX_LOOTING_SLOT_COUNT = 12, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, 
config = {slotCount = MAX_LOOTING_SLOT_COUNT, slotCols = 4, slotRows = 0, slotBGStartX = 11, slotBGStartY = 40, slotStartX = 13, slotStartY = 42, slotGapX = 47, slotGapY = 47}
, slots = (Array.new)(), selectSlotNo = -1, remainItemCnt = 0}
local _buttonCancel = (UI.getChildControl)(Panel_Looting, "Button_Cancel")
local _buttonLootAll = (UI.getChildControl)(Panel_Looting, "Button_LootAll")
local _buttonLootAllToServant = (UI.getChildControl)(Panel_Looting, "Button_LootAllToServant")
_buttonCancel:addInputEvent("Mouse_LUp", "Panel_Looting_buttonCancel_Mouse_Click()")
_buttonLootAll:addInputEvent("Mouse_LUp", "Panel_Looting_buttonLootAll_Mouse_Click( true )")
_buttonLootAllToServant:addInputEvent("Mouse_LUp", "Panel_Looting_buttonLootAllToServant_Mouse_Click()")
registerEvent("EventLootingWindowUpdate", "Panel_Looting_Update")
registerEvent("EventLootingCancel", "Panel_Looting_Cancel")
LootingShowAni = function()
  -- function num : 0_0
  Panel_Looting:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Looting, 0, 0.15)
  Panel_Looting_Value_isCloseLooting = false
end

LootingHideAni = function()
  -- function num : 0_1
end

looting.init = function(self)
  -- function num : 0_2 , upvalues : looting
  for ii = 1, looting.MAX_LOOTING_SLOT_COUNT do
    local row = (math.floor)((ii - 1) / (looting.config).slotCols)
    local col = (ii - 1) % (looting.config).slotCols
    local looting_SlotBGBase = (UI.getChildControl)(Panel_Looting, "Static_Texture_Slot_Background")
    local looting_SlotBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Looting, "looting_SlotBG_" .. ii)
    CopyBaseProperty(looting_SlotBGBase, looting_SlotBG)
    local slotNo = ii - 1
    local slot = {}
    ;
    (SlotItem.new)(slot, "Looting_item_" .. slotNo, slotNo, Panel_Looting, looting.slotConfig)
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "Panel_Looting_SlotRClick(" .. slotNo .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "Panel_Looting_SlotLClick(" .. slotNo .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"looting\",true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"looting\",false)")
    Panel_Tooltip_Item_SetPosition(slotNo, slot, "looting")
    looting_SlotBG:SetPosX((looting.config).slotBGStartX + (looting.config).slotGapX * col)
    looting_SlotBG:SetPosY((looting.config).slotBGStartY + (looting.config).slotGapY * row + 3)
    looting_SlotBG:SetShow(true)
    looting_SlotBG:SetIgnore(false)
    ;
    (slot.icon):SetPosX((looting.config).slotStartX + (looting.config).slotGapX * col)
    ;
    (slot.icon):SetPosY((looting.config).slotStartY + (looting.config).slotGapY * row + 3)
    ;
    (slot.icon):SetIgnore(false)
    -- DECOMPILER ERROR at PC145: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (looting.slots)[ii] = slot
  end
end

local closePanelLooting = function()
  -- function num : 0_3 , upvalues : _buttonLootAll, IM
  if Panel_Looting:IsShow() then
    Panel_Looting:SetShow(false, false)
    _buttonLootAll:ClearDisableTime()
    if AllowChangeInputMode() then
      if check_ShowWindow() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
    if Panel_Looting:IsShow() == false then
      Panel_Looting_Value_isCloseLooting = true
    end
  end
end

Panel_Looting_Update = function(empty)
  -- function num : 0_4 , upvalues : looting, closePanelLooting, _buttonLootAllToServant, _buttonLootAll, _buttonCancel
  if empty == 1 then
    Panel_Looting_Value_isCloseLooting = true
    Panel_Tooltip_Item_Show_GeneralNormal(looting.selectSlotNo, "looting", false)
    closePanelLooting()
  else
    Panel_Looting:SetShow(true, true)
    Panel_Looting_Value_isCloseLooting = false
  end
  if Panel_Chatting_Input:GetShow() then
    (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
  end
  Panel_Looting:deleteConsoleUIGroup(1)
  local group_1 = Panel_Looting:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  if looting_isPickItemToServant() then
    _buttonLootAllToServant:SetShow(true)
    group_1:addControl(0, 0, 3, 1, _buttonLootAllToServant)
    group_1:addControl(1, 0, 3, 1, _buttonLootAll)
    group_1:addControl(2, 0, 3, 1, _buttonCancel)
  else
    group_1:addControl(0, 0, 2, 1, _buttonLootAll)
    group_1:addControl(1, 0, 2, 1, _buttonCancel)
    _buttonLootAllToServant:SetShow(false)
  end
  local lootingCount = looting_getItemCount()
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R3 in 'UnsetPending'

  looting.remainItemCnt = 0
  Panel_Looting:deleteConsoleUIGroup(0)
  local group_0 = Panel_Looting:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  for ii = 1, looting.MAX_LOOTING_SLOT_COUNT do
    local slot = (looting.slots)[ii]
    local itemWrapper = looting_getItem(ii - 1)
    if itemWrapper ~= nil then
      slot:setItem(itemWrapper)
      -- DECOMPILER ERROR at PC125: Confused about usage of register: R10 in 'UnsetPending'

      looting.remainItemCnt = looting.remainItemCnt + 1
      group_0:addControl((ii - 1) % 4, (ii - 1) / 4, 4, 4, _buttonLootAll)
    else
      if ii - 1 == looting.selectSlotNo then
        Panel_Tooltip_Item_Show_GeneralNormal(looting.selectSlotNo, "looting", false)
      end
      slot:clearItem()
    end
  end
end

Panel_Looting_PickupBySlot = function(slotNo)
  -- function num : 0_5 , upvalues : looting
  local self = looting
  self.selectSlotNo = slotNo
  local itemWrapper = looting_getItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  local s64_count = (itemWrapper:get()):getCount_s64()
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  local itemName = (itemWrapper:getStaticStatus()):getName()
  if itemKey == 1 then
    Panel_Looting_Pickup(s64_count, slotNo)
  else
    Panel_NumberPad_Show(true, s64_count, slotNo, Panel_Looting_Pickup)
  end
  audioPostEvent_SystemUi(3, 6)
end

Panel_Looting_Pickup = function(s64_count, slotNo)
  -- function num : 0_6
  looting_slotClick(slotNo, s64_count)
end

Panel_Looting_SlotRClick = function(slotNo)
  -- function num : 0_7
  Panel_Looting_PickupBySlot(slotNo)
end

Panel_Looting_SlotLClick = function(slotNo)
  -- function num : 0_8
  Panel_Looting_PickupBySlot(slotNo)
end

Panel_Looting_buttonLootAll_Mouse_Click = function(isMouseEvent)
  -- function num : 0_9 , upvalues : _buttonLootAll, looting
  if not isMouseEvent then
    if not _buttonLootAll:checkAutoDisableTime() then
      return 
    end
    _buttonLootAll:DoAutoDisableTime()
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  looting.selectSlotNo = -1
  looting_pickAllItemToPlayer()
  audioPostEvent_SystemUi(3, 9)
end

Panel_Looting_buttonLootAllToServant_Mouse_Click = function()
  -- function num : 0_10 , upvalues : looting
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  looting.selectSlotNo = -1
  looting_pickAllItemToServant()
end

Panel_Looting_buttonCancel_Mouse_Click = function()
  -- function num : 0_11
  local dropType = looting_getDropType()
  if (CppEnums.DropType).Type_CollectInfo == dropType or (CppEnums.DropType).Type_Harvest == dropType then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_LOOT_MEMO")
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_LOOT_TITLE"), content = messageBoxMemo, functionYes = Panel_Looting_buttonCancel_Mouse_ClickXXX, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      Panel_Looting_buttonCancel_Mouse_ClickXXX()
    end
  end
end

Panel_Looting_buttonCancel_Mouse_ClickXXX = function()
  -- function num : 0_12 , upvalues : closePanelLooting
  closePanelLooting()
  looting_cancel()
  local actor = interaction_getInteractable()
  if actor ~= nil then
    Interaction_Show(actor)
  end
end

Panel_Looting_Cancel = function()
  -- function num : 0_13 , upvalues : looting, closePanelLooting
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  looting.selectSlotNo = -1
  closePanelLooting()
  looting_cancel()
  Panel_Tooltip_Item_hideTooltip()
  local actor = interaction_getInteractable()
  if actor ~= nil then
    Interaction_Show(actor)
  end
end

Panel_Looting_PickAll = function()
  -- function num : 0_14 , upvalues : looting, closePanelLooting
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  looting.selectSlotNo = -1
  closePanelLooting()
end

Panel_Looting_Show = function()
  -- function num : 0_15 , upvalues : looting
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  looting.selectSlotNo = -1
  Panel_Looting:SetShow(true, true)
  Interaction_Close()
end

looting:init()

