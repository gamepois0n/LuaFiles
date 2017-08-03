-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\inventory\panel_window_clothinventory.luac 

-- params : ...
-- function num : 0
Panel_Window_ClothInventory:SetShow(false, false)
Panel_Window_ClothInventory:setMaskingChild(true)
Panel_Window_ClothInventory:ActiveMouseEventEffect(true)
Panel_Window_ClothInventory:setGlassBackground(true)
Panel_Window_ClothInventory:RegisterShowEventFunc(true, "ClothInventoryShowAni()")
Panel_Window_ClothInventory:RegisterShowEventFunc(false, "ClothInventoryHideAni()")
ClothInventoryShowAni = function()
  -- function num : 0_0
end

ClothInventoryHideAni = function()
  -- function num : 0_1
end

local clothInven = {textureBg = (UI.getChildControl)(Panel_Window_ClothInventory, "Static_BG"), slotBg = (UI.getChildControl)(Panel_Window_ClothInventory, "Static_Slot"), btnQuestion = (UI.getChildControl)(Panel_Window_ClothInventory, "Button_Question"), btnClose = (UI.getChildControl)(Panel_Window_ClothInventory, "Button_Close"), textTitle = (UI.getChildControl)(Panel_Window_ClothInventory, "StaticText_Title"), descBg = (UI.getChildControl)(Panel_Window_ClothInventory, "Static_DescBg"), desc = (UI.getChildControl)(Panel_Window_ClothInventory, "StaticText_Desc"), btnChangeAll = (UI.getChildControl)(Panel_Window_ClothInventory, "Button_ChangeAll"), 
config = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
bg = {}
, 
slot = {}
, bagSize = 0, fromWhereType = nil, fromSlotNo = nil, bagWhereType = nil, bagSlotNo = nil}
;
(clothInven.btnQuestion):SetShow(false)
;
(clothInven.desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
;
(clothInven.desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CLOTHINVENTORY_DESC"))
local group_1 = Panel_Window_ClothInventory:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
group_1:addControl(0, 0, 1, 1, clothInven.btnChangeAll)
FromClient_ShowInventoryBag = function(bagType, bagSize, fromWhereType, fromSlotNo)
  -- function num : 0_2 , upvalues : clothInven
  local self = clothInven
  local _title = ""
  if bagType == 0 then
    bagType = (CppEnums.ItemWhereType).eCashInventory
    _title = PAGetString(Defines.StringSheet_GAME, "LUA_CLOTHINVENTORY_PEARLTITLE")
  else
    if bagType == 1 then
      bagType = (CppEnums.ItemWhereType).eInventory
      _title = PAGetString(Defines.StringSheet_GAME, "LUA_CLOTHINVENTORY_TITLE")
    end
  end
  ;
  (self.textTitle):SetText(_title)
  self.bagWhereType = bagType
  Panel_Window_ClothInventory:deleteConsoleUIGroup(0)
  local group_0 = Panel_Window_ClothInventory:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  for index = 0, bagSize - 1 do
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R11 in 'UnsetPending'

    (self.bg)[index] = {}
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self.slot)[index] = {}
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self.bg)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_ClothInventory, "ColothInventory_SlotBg_" .. index)
    CopyBaseProperty(self.slotBg, (self.bg)[index])
    ;
    ((self.bg)[index]):SetPosX(25 + index % 4 * 50)
    ;
    ((self.bg)[index]):SetPosY(60 + (math.floor)(index / 4) * 50)
    ;
    ((self.bg)[index]):SetShow(true)
    ;
    (SlotItem.new)((self.slot)[index], "ClothInventory_", index, (self.bg)[index], self.config)
    ;
    ((self.slot)[index]):createChild()
    group_0:addControl(index % 4, index / 4, 4, bagSize / 4, ((self.slot)[index]).icon)
    local itemWrapper = getInventoryBagItemByType(fromWhereType, fromSlotNo, index)
    if itemWrapper ~= nil then
      ((self.slot)[index]):setItem(itemWrapper, index)
      ;
      (((self.slot)[index]).icon):addInputEvent("Mouse_On", "ShowTooltip_ClothInven(" .. fromWhereType .. ", " .. fromSlotNo .. ", " .. index .. ")")
      ;
      (((self.slot)[index]).icon):addInputEvent("Mouse_Out", "ShowTooltip_ClothInven()")
      ;
      (((self.slot)[index]).icon):addInputEvent("Mouse_RUp", "RequestPush_BagToInventory(" .. fromWhereType .. ", " .. fromSlotNo .. ", " .. index .. ", " .. bagType .. ")")
    else
      ;
      ((self.slot)[index]):clearItem()
    end
  end
  ;
  (self.textureBg):SetSize((self.textureBg):GetSizeX(), (math.ceil)(bagSize / 4) * 45 + ((math.ceil)(bagSize / 4) - 1) * 5 + 10)
  ;
  (self.descBg):SetSize((self.descBg):GetSizeX(), (self.desc):GetTextSizeY() + 15)
  ;
  (self.descBg):SetPosY((self.textureBg):GetPosY() + (self.textureBg):GetSizeY() + 5)
  ;
  (self.desc):SetPosY((self.descBg):GetPosY() + 5)
  Panel_Window_ClothInventory:SetSize(Panel_Window_ClothInventory:GetSizeX(), (self.descBg):GetPosY() + (self.descBg):GetSizeY() + 60)
  ;
  (self.btnChangeAll):ComputePos()
  Panel_Window_ClothInventory:SetPosX(Panel_Window_Inventory:GetPosX() - Panel_Window_ClothInventory:GetSizeX())
  Panel_Window_ClothInventory:SetPosY(Panel_Window_Inventory:GetPosY() + 80)
  Panel_Window_ClothInventory:SetShow(true, true)
  self.bagSize = bagSize
  self.fromWhereType = fromWhereType
  self.fromSlotNo = fromSlotNo
  Inventory_SetFunctor(ClothInven_Filter, ClothInven_RClickFunction, nil, nil)
  Panel_Tooltip_Item_hideTooltip()
end

ClothInven_ChangeItem = function()
  -- function num : 0_3 , upvalues : clothInven
  if not Panel_Window_ClothInventory:GetShow() then
    return 
  end
  local self = clothInven
  for index = 0, self.bagSize - 1 do
    ((self.slot)[index]):clearItem()
    local itemWrapper = getInventoryBagItemByType(self.fromWhereType, self.fromSlotNo, index)
    if itemWrapper ~= nil then
      ((self.slot)[index]):setItem(itemWrapper, index)
      ;
      (((self.slot)[index]).icon):addInputEvent("Mouse_On", "ShowTooltip_ClothInven(" .. self.fromWhereType .. ", " .. self.fromSlotNo .. ", " .. index .. ")")
      ;
      (((self.slot)[index]).icon):addInputEvent("Mouse_Out", "ShowTooltip_ClothInven()")
      ;
      (((self.slot)[index]).icon):addInputEvent("Mouse_RUp", "RequestPush_BagToInventory(" .. self.fromWhereType .. ", " .. self.fromSlotNo .. ", " .. index .. ", " .. self.bagWhereType .. ")")
    end
  end
  FGlobal_UpdateInventoryWeight()
end

ClothInven_Filter = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_4
  local returnValue = true
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return true
  end
  local myClass = selfPlayer:getClassType()
  local itemSSW = itemWrapper:getStaticStatus()
  local isEuqipItme = itemSSW:isEquipable()
  local isUsableItem = ((itemSSW:get())._usableClassType):isOn(myClass)
  local isPushableItem = itemWrapper:isPushableInventoryBag()
  if isEuqipItme and isUsableItem and isPushableItem then
    returnValue = false
  end
  return returnValue
end

ClothInven_RClickFunction = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_5 , upvalues : clothInven
  if (((itemWrapper:getStaticStatus()):get())._vestedType):getItemKey() == 2 and (itemWrapper:get()):isVested() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CLOTHINVENTORY_INPUTALERT"))
    return 
  end
  ToClient_ReqPushInventoryItemToInventoryBag(inventoryType, slotNo, clothInven.fromWhereType, clothInven.fromSlotNo)
end

RequestPush_BagToInventory = function(fromWhereType, fromSlotNo, bagIndex, bagWhereType)
  -- function num : 0_6
  ToClient_ReqPopInventoryBagItemToInventory(fromWhereType, fromSlotNo, bagIndex, bagWhereType)
end

ClothInven_ChangeAllItem = function()
  -- function num : 0_7 , upvalues : clothInven
  ToClient_ReqEquipItemFromInventoryBag(clothInven.fromWhereType, clothInven.fromSlotNo)
end

ShowTooltip_ClothInven = function(fromWhereType, fromSlotNo, index)
  -- function num : 0_8 , upvalues : clothInven
  if fromWhereType == nil then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local itemWrapper = getInventoryBagItemByType(fromWhereType, fromSlotNo, index)
  if itemWrapper ~= nil then
    Panel_Tooltip_Item_Show(itemWrapper, ((clothInven.slot)[index]).icon, false, true)
  end
end

ClothInventory_Close = function()
  -- function num : 0_9 , upvalues : clothInven
  for index = 0, clothInven.bagSize - 1 do
    ((clothInven.slot)[index]):destroyChild()
  end
  Panel_Window_ClothInventory:SetShow(false, false)
  Inventory_SetFunctor()
end

;
(clothInven.btnClose):addInputEvent("Mouse_LUp", "ClothInventory_Close()")
;
(clothInven.btnChangeAll):addInputEvent("Mouse_LUp", "ClothInven_ChangeAllItem()")
registerEvent("FromClient_ShowInventoryBag", "FromClient_ShowInventoryBag")
registerEvent("FromClient_UpdateInventoryBag", "ClothInven_ChangeItem")
registerEvent("EventEquipItem", "ClothInven_ChangeItem")
registerEvent("EventUnEquipItemToInventory", "ClothInven_ChangeItem")

