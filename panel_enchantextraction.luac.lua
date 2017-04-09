-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\enchant\panel_enchantextraction.luac 

-- params : ...
-- function num : 0
Panel_EnchantExtraction:SetShow(false)
Panel_EnchantExtraction:ActiveMouseEventEffect(true)
Panel_EnchantExtraction:setMaskingChild(true)
Panel_EnchantExtraction:setGlassBackground(true)
Panel_EnchantExtraction:RegisterShowEventFunc(true, "EnchantExtractionShowAni()")
Panel_EnchantExtraction:RegisterShowEventFunc(false, "EnchantExtractionHideAni()")
EnchantExtractionShowAni = function()
  -- function num : 0_0
end

EnchantExtractionHideAni = function()
  -- function num : 0_1
end

local slotConfig = {createIcon = true, createBorder = true, createCount = false, createCash = false}
local elapsTime = 4
local doExtraction = false
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local item_1 = {}
local item_2 = {}
local btn_Close = (UI.getChildControl)(Panel_EnchantExtraction, "Button_Close")
local btn_Extraction = (UI.getChildControl)(Panel_EnchantExtraction, "Button_Extraction")
local effect_Arrow = (UI.getChildControl)(Panel_EnchantExtraction, "Static_BackEffect")
local effect_Process = (UI.getChildControl)(Panel_EnchantExtraction, "Static_ProcessEffect")
local slot_1 = (UI.getChildControl)(Panel_EnchantExtraction, "equipIcon_1")
local slot_2 = (UI.getChildControl)(Panel_EnchantExtraction, "equipIcon_2")
local enchantNumber = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Slot_Enchant_value")
local enchantCount = (UI.getChildControl)(Panel_EnchantExtraction, "StaticText_Slot2")
btn_Close:addInputEvent("Mouse_LUp", "Panel_EnchantExtraction_Close()")
btn_Extraction:addInputEvent("Mouse_LUp", "HandleClicked_Extraction()")
;
(SlotItem.new)(item_1, "Static_Icon_1", 0, slot_1, slotConfig)
item_1:createChild()
;
(item_1.icon):SetPosX(0)
;
(item_1.icon):SetPosY(0)
;
(item_1.icon):addInputEvent("Mouse_On", "EnchantExtraction_IconOver( true, " .. 0 .. ")")
;
(item_1.icon):addInputEvent("Mouse_Out", "EnchantExtraction_IconOver( false )")
;
(SlotItem.new)(item_2, "Static_Icon_2", 0, slot_2, slotConfig)
item_2:createChild()
;
(item_2.icon):SetPosX(0)
;
(item_2.icon):SetPosY(0)
;
(item_2.icon):addInputEvent("Mouse_On", "EnchantExtraction_IconOver( true, " .. 1 .. ")")
;
(item_2.icon):addInputEvent("Mouse_Out", "EnchantExtraction_IconOver( false )")
slot_2:EraseAllEffect()
local enchantText_1 = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, slot_1, "StaticText_Enchant_1")
CopyBaseProperty(enchantNumber, enchantText_1)
enchantText_1:SetSize(slot_1:GetSizeX(), slot_1:GetSizeY())
enchantText_1:SetPosX(0)
enchantText_1:SetPosY(0)
enchantText_1:SetTextHorizonCenter()
enchantText_1:SetTextVerticalCenter()
enchantText_1:SetIgnore(true)
enchantText_1:SetShow(false)
local enchantText_2 = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, slot_2, "StaticText_Enchant_1")
CopyBaseProperty(enchantNumber, enchantText_2)
enchantText_2:SetSize(slot_2:GetSizeX(), slot_2:GetSizeY())
enchantText_2:SetPosX(0)
enchantText_2:SetPosY(0)
enchantText_2:SetTextHorizonCenter()
enchantText_2:SetTextVerticalCenter()
enchantText_2:SetIgnore(true)
enchantText_2:SetShow(false)
HandleClicked_Extraction = function()
  -- function num : 0_2 , upvalues : doExtraction, effect_Arrow, elapsTime
  doExtraction = true
  effect_Arrow:SetShow(true)
  effect_Arrow:AddEffect("fUI_Extraction01", false)
  audioPostEvent_SystemUi(5, 11)
  elapsTime = 0
end

Panel_EnchantExtraction_Show = function()
  -- function num : 0_3 , upvalues : elapsTime, doExtraction
  if not Panel_EnchantExtraction:GetShow() then
    Panel_EnchantExtraction:SetShow(true)
  end
  elapsTime = 4
  doExtraction = false
end

Panel_EnchantExtraction_Close = function()
  -- function num : 0_4 , upvalues : elapsTime, doExtraction
  Panel_EnchantExtraction:SetShow(false)
  elapsTime = 4
  doExtraction = false
end

local _fromWhereType, _fromSlotNo = nil, nil
local failCount = 0
FromClient_ConvertEnchantFailCountToItem = function(fromWhereType, fromSlotNo)
  -- function num : 0_5 , upvalues : failCount, enchantCount, enchantText_1, enchantText_2, _fromWhereType, _fromSlotNo, item_1, item_2
  failCount = ((getSelfPlayer()):get()):getEnchantFailCount()
  do
    if failCount < 2 then
      local message = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANTCOUNTEXTRACTION_1")
      Proc_ShowMessage_Ack_WithOut_ChattingMessage(message)
      if Panel_EnchantExtraction:GetShow() then
        Panel_EnchantExtraction:SetShow(false)
      end
      return 
    end
    enchantCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ENCHANTCOUNTEXTRACTION_2", "count", "+" .. failCount))
    Panel_EnchantExtraction_Show()
    enchantText_1:SetText("+" .. failCount)
    enchantText_2:SetText("+" .. failCount)
    enchantText_1:SetShow(true)
    enchantText_2:SetShow(false)
    _fromWhereType = fromWhereType
    _fromSlotNo = fromSlotNo
    local itemWrapper = getInventoryItemByType(fromWhereType, fromSlotNo)
    if itemWrapper == nil then
      return 
    end
    item_1:setItem(itemWrapper)
    ;
    (item_1.icon):SetShow(true)
    local itemKey = ToClient_GetConvertEnchantFailItemKey(failCount)
    local resultItemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
    if resultItemStaticWrapper == nil then
      return 
    end
    item_2:setItemByStaticStatus(resultItemStaticWrapper, 1, nil, nil, false)
    ;
    (item_2.icon):SetMonoTone(true)
  end
end

EnchantExtraction_IconOver = function(isShow, controlId)
  -- function num : 0_6 , upvalues : item_1, _fromWhereType, _fromSlotNo, item_2, failCount
  if isShow then
    local control = nil
    if controlId == 0 then
      control = item_1.icon
      local itemWrapper = getInventoryItemByType(_fromWhereType, _fromSlotNo)
      Panel_Tooltip_Item_Show(itemWrapper, control, false, true, nil, nil, nil)
    else
      do
        if controlId == 1 then
          control = item_2.icon
          local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(ToClient_GetConvertEnchantFailItemKey(failCount)))
          Panel_Tooltip_Item_Show(itemSSW, control, true, false, nil, nil, nil)
        else
          do
            do
              do return  end
              Panel_Tooltip_Item_hideTooltip()
            end
          end
        end
      end
    end
  end
end

FromClient_ConvertEnchantFailItemToCount = function(fromWhereType, fromSlotNo)
  -- function num : 0_7
  local doItemUse = function()
    -- function num : 0_7_0 , upvalues : fromWhereType, fromSlotNo
    ToClient_ConvertEnchantFailItemToCount(fromWhereType, fromSlotNo)
  end

  local failCount = ((getSelfPlayer()):get()):getEnchantFailCount()
  local itemWrapper = getInventoryItemByType(fromWhereType, fromSlotNo)
  if failCount > 0 then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_VALKS_NOUSE")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANTCOUNTEXTRACTION_4"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ENCHANTCOUNTEXTRACTION_3", "failCount", failCount, "itemName", (itemWrapper:getStaticStatus()):getName())
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANTCOUNTEXTRACTION_4"), content = messageBoxMemo, functionYes = doItemUse, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  end
end

EnchantExtraction_updateTime = function(deltaTime)
  -- function num : 0_8 , upvalues : elapsTime, doExtraction, effect_Arrow, effect_Process, enchantText_1, enchantText_2, slot_2, item_1, item_2, _fromWhereType, _fromSlotNo, enchantCount
  elapsTime = elapsTime + deltaTime
  if elapsTime > 3 then
    if doExtraction == false then
      return 
    end
    effect_Arrow:SetShow(false)
    effect_Process:SetShow(false)
    enchantText_1:SetShow(false)
    enchantText_2:SetShow(true)
    slot_2:AddEffect("UI_ItemEnchant01", false, -5, -5)
    ;
    (item_1.icon):SetShow(false)
    ;
    (item_2.icon):SetMonoTone(false)
    doExtraction = false
    elapsTime = 0
    ToClient_ConvertEnchantFailCountToItem(_fromWhereType, _fromSlotNo)
    enchantCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ENCHANTCOUNTEXTRACTION_2", "count", "0"))
  end
end

FromClient_ConvertEnchantFailCountToItemAck = function()
  -- function num : 0_9
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANTCOUNTEXTRACTION_5"))
end

FromClient_ConvertEnchantFailItemToCountAck = function()
  -- function num : 0_10
end

FGlobal_ItemChange_IsDoing = function()
  -- function num : 0_11
  return isChangeDoing
end

Panel_EnchantExtraction:RegisterUpdateFunc("EnchantExtraction_updateTime")
registerEvent("FromClient_ConvertEnchantFailCountToItem", "FromClient_ConvertEnchantFailCountToItem")
registerEvent("FromClient_ConvertEnchantFailItemToCount", "FromClient_ConvertEnchantFailItemToCount")
registerEvent("FromClient_ConvertEnchantFailCountToItemAck", "FromClient_ConvertEnchantFailCountToItemAck")
registerEvent("FromClient_ConvertEnchantFailItemToCountAck", "FromClient_ConvertEnchantFailItemToCountAck")

