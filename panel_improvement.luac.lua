-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\enchant\panel_improvement.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_Improvement:setMaskingChild(true)
Panel_Improvement:setGlassBackground(true)
Panel_Improvement:SetDragEnable(true)
Panel_Improvement:SetDragAll(true)
Panel_Improvement:RegisterShowEventFunc(true, "Improvement_ShowAni()")
Panel_Improvement:RegisterShowEventFunc(false, "Improvement_HideAni()")
Improvement_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  audioPostEvent_SystemUi(1, 0)
  local aniInfo1 = Panel_Improvement:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.13)
  aniInfo1.AxisX = Panel_Improvement:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Improvement:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Improvement:addScaleAnimation(0.08, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.13)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Improvement:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Improvement:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Improvement_HideAni = function()
  -- function num : 0_1
  local enchantHide = (UIAni.AlphaAnimation)(0, Panel_Improvement, 0, 0.2)
  enchantHide:SetHideAtEnd(true)
  audioPostEvent_SystemUi(1, 1)
end

local improvement = {title = (UI.getChildControl)(Panel_Improvement, "Static_Text_Title"), effectControl = (UI.getChildControl)(Panel_Improvement, "Static_AddEffect"), slot_0 = (UI.getChildControl)(Panel_Improvement, "Static_Slot_0"), slot_1 = (UI.getChildControl)(Panel_Improvement, "Static_Slot_1"), descBg = (UI.getChildControl)(Panel_Improvement, "Static_CommentBG"), desc = (UI.getChildControl)(Panel_Improvement, "StaticText_Comment"), btnApply = (UI.getChildControl)(Panel_Improvement, "Button_Apply"), equipItem = nil, materialItem = nil, 
equipSlot = {}
, 
materialSlot = {}
, animationTime = 0, _doImprove = false, _doAnimation = false}
;
(improvement.btnApply):addInputEvent("Mouse_LUp", "DoImprove()")
;
(improvement.desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(improvement.desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_IMPROVEMENT_DESC"))
;
(improvement.title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_IMPROVEMENT_TITLE"))
local textSizeY = (improvement.desc):GetTextSizeY()
do
  if (improvement.descBg):GetSizeY() < textSizeY + 15 then
    local addSizeY = textSizeY + 15 - (improvement.descBg):GetSizeY()
    ;
    (improvement.descBg):SetSize((improvement.descBg):GetSizeX(), textSizeY + 15)
    Panel_Improvement:SetSize(Panel_Improvement:GetSizeX(), Panel_Improvement:GetSizeY() + addSizeY)
    ;
    (improvement.descBg):ComputePos()
    ;
    (improvement.desc):ComputePos()
    ;
    (improvement.btnApply):ComputePos()
  end
  local slotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = false}
  improvement.Init = function(self)
  -- function num : 0_2 , upvalues : slotConfig
  (SlotItem.new)(self.equipSlot, "Improvement_EquipSlot", 0, self.slot_0, slotConfig)
  ;
  (self.equipSlot):createChild()
  ;
  ((self.equipSlot).icon):SetPosX(0)
  ;
  ((self.equipSlot).icon):SetPosY(0)
  ;
  ((self.equipSlot).icon):addInputEvent("Mouse_On", "Improvement_Tooltip( true, " .. 0 .. " )")
  ;
  ((self.equipSlot).icon):addInputEvent("Mouse_Out", "Improvement_Tooltip( false, " .. 0 .. " )")
  ;
  ((self.equipSlot).icon):addInputEvent("Mouse_RUp", "Improvement_SlotInit()")
  ;
  (SlotItem.new)(self.materialSlot, "Improvement_MaterialSlot", 0, self.slot_1, slotConfig)
  ;
  (self.materialSlot):createChild()
  ;
  ((self.materialSlot).icon):SetPosX(0)
  ;
  ((self.materialSlot).icon):SetPosY(0)
  ;
  ((self.materialSlot).icon):addInputEvent("Mouse_On", "Improvement_Tooltip( true, " .. 1 .. " )")
  ;
  ((self.materialSlot).icon):addInputEvent("Mouse_Out", "Improvement_Tooltip( false, " .. 1 .. " )")
  ;
  ((self.materialSlot).icon):addInputEvent("Mouse_RUp", "Improvement_SlotInit()")
end

  improvement:Init()
  Panel_Improvement_Show = function()
  -- function num : 0_3 , upvalues : improvement
  Panel_Improvement:SetShow(true, true)
  ;
  (improvement.btnApply):SetIgnore(false)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  improvement.equipItem = nil
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  improvement.materialItem = nil
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  improvement._doImprove = false
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  improvement._doAnimation = false
  InventoryWindow_Show()
  ;
  (getImproveInformation()):clearData()
  ;
  (improvement.equipSlot):clearItem()
  ;
  (improvement.materialSlot):clearItem()
  Inventory_SetFunctor(ImproveInvenFilerMainItem, ImproveSetMainItemFromInventory, Panel_Improvement_Hide, nil)
  FGlobal_SetInventoryDragNoUse(Panel_Improvement)
  audioPostEvent_SystemUi(1, 0)
end

  Panel_Improvement_Hide = function()
  -- function num : 0_4 , upvalues : improvement
  local self = improvement
  self.animationTime = 0
  self._doImprove = false
  self._doAnimation = false
  ;
  (self.equipSlot):clearItem()
  ;
  (self.materialSlot):clearItem()
  ;
  (self.effectControl):EraseAllEffect()
  ;
  ((self.equipSlot).icon):EraseAllEffect()
  ;
  ((self.materialSlot).icon):EraseAllEffect()
  ;
  (getImproveInformation()):clearData()
  ToClient_BlackspiritEnchantClose()
  Panel_Improvement:SetShow(false, true)
end

  ImproveInvenFilerMainItem = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_5
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return true
  end
  local ssW = (itemWrapper:getStaticStatus()):get()
  return not ssW:isImprovable()
end

  ImproveSetMainItemFromInventory = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_6 , upvalues : improvement
  local self = improvement
  local improveInfo = getImproveInformation()
  if improveInfo == nil then
    return 
  end
  improveInfo:SetImproveSlot(inventoryType, slotNo)
  ;
  (self.equipSlot):clearItem()
  ;
  (self.equipSlot):setItem(itemWrapper)
  self.equipItem = slotNo
  audioPostEvent_SystemUi(0, 16)
  Inventory_SetFunctor(ImproveInvenFilerSubItem, ImproveSetMaterialItemFromInventory, Panel_Improvement_Hide, nil)
end

  ImproveInvenFilerSubItem = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_7
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return true
  end
  if (CppEnums.ItemWhereType).eCashInventory == whereType then
    return true
  end
  local returnValue = true
  if (getImproveInformation()):checkIsValidSubItem(slotNo) ~= 0 then
    returnValue = true
  else
    returnValue = false
    if (CppEnums.ItemWhereType).eInventory ~= whereType then
      returnValue = true
    end
  end
  return returnValue
end

  ImproveSetMaterialItemFromInventory = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_8 , upvalues : improvement
  local self = improvement
  local improveInfo = getImproveInformation()
  if improveInfo == nil then
    return 
  end
  improveInfo:SetImproveSlot(inventoryType, slotNo)
  ;
  (self.materialSlot):clearItem()
  ;
  (self.materialSlot):setItem(itemWrapper)
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R6 in 'UnsetPending'

  improvement.materialItem = slotNo
  Inventory_SetFunctor(ImproveInvenFilerAll, nil, Panel_Improvement_Hide, nil)
  audioPostEvent_SystemUi(0, 16)
end

  ImproveInvenFilerAll = function()
  -- function num : 0_9
  return true
end

  Improvement_SlotInit = function()
  -- function num : 0_10 , upvalues : improvement
  local self = improvement
  if self._doImprove then
    (self.effectControl):EraseAllEffect()
    ;
    ((self.equipSlot).icon):EraseAllEffect()
    ;
    ((self.materialSlot).icon):EraseAllEffect()
    ToClient_BlackspiritEnchantCancel()
    self._doImprove = false
  end
  ;
  (self.equipSlot):clearItem()
  ;
  (self.materialSlot):clearItem()
  ;
  (self.effectControl):EraseAllEffect()
  ;
  ((self.equipSlot).icon):EraseAllEffect()
  ;
  ((self.materialSlot).icon):EraseAllEffect()
  ;
  (getImproveInformation()):clearData()
  self._doAnimation = false
  self.equipItem = nil
  self.materialItem = nil
  Inventory_SetFunctor(ImproveInvenFilerMainItem, ImproveSetMainItemFromInventory, Panel_Improvement_Hide, nil)
end

  Improvement_Tooltip = function(isShow, slotType)
  -- function num : 0_11 , upvalues : improvement
  if isShow == false then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local self = improvement
  local slotNo, itemWrapper, uiBase = nil, nil, nil
  if slotType == 0 then
    slotNo = self.equipItem
    uiBase = (self.equipSlot).icon
  else
    if slotType == 1 then
      slotNo = self.materialItem
      uiBase = (self.materialSlot).icon
    end
  end
  if slotNo == nil then
    return 
  end
  local itemWrapper = getInventoryItemByType(0, slotNo)
  if itemWrapper == nil then
    return 
  end
  if isShow then
    Panel_Tooltip_Item_Show(itemWrapper, uiBase, false, true)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end

  DoImprove = function()
  -- function num : 0_12 , upvalues : improvement
  local self = improvement
  if self._doImprove then
    (self.effectControl):EraseAllEffect()
    ;
    ((self.equipSlot).icon):EraseAllEffect()
    ;
    ((self.materialSlot).icon):EraseAllEffect()
    ToClient_BlackspiritEnchantCancel()
    self._doImprove = false
    return 
  end
  local improveInfo = getImproveInformation()
  if improveInfo:IsReadyImprove() ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_IMPROVEMENT_NEEDITEMALERT"))
    return 
  end
  audioPostEvent_SystemUi(5, 6)
  audioPostEvent_SystemUi(5, 9)
  ;
  (self.effectControl):EraseAllEffect()
  ;
  ((self.equipSlot).icon):EraseAllEffect()
  ;
  ((self.materialSlot).icon):EraseAllEffect()
  ;
  ((self.equipSlot).icon):AddEffect("fUI_LimitOver01A", false, 0, 0)
  ;
  ((self.materialSlot).icon):AddEffect("fUI_LimitOver01A", false, 0, 0)
  ;
  (self.effectControl):AddEffect("fUI_LimitOver02A", true, 0, 0)
  ;
  (self.effectControl):AddEffect("UI_LimitOverLine_02", false, 0, 0)
  ;
  (self.effectControl):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
  self.animationTime = 0
  self._doImprove = true
  ToClient_BlackspiritEnchantStart()
end

  UpdateFunc_DoingImprove = function(deltaTime)
  -- function num : 0_13 , upvalues : improvement
  local self = improvement
  self.animationTime = self.animationTime + deltaTime
  if self._doImprove then
    (self.btnApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_IMPROVEMENT_CANCEL"))
  else
    ;
    (self.btnApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_IMPROVEMENT_TITLE"))
  end
  if self._doAnimation then
    (self.btnApply):SetIgnore(true)
  else
    ;
    (self.btnApply):SetIgnore(false)
  end
  if self.animationTime > 6 and self._doImprove then
    (getImproveInformation()):doImprove()
    ;
    ((self.equipSlot).icon):EraseAllEffect()
    ;
    ((self.equipSlot).icon):AddEffect("UI_ItemEnchant01", false, -6, -6)
    ToClient_BlackspiritEnchantClose()
    self._doImprove = false
    self._doAnimation = true
    self.animationTime = 0
  end
  if self.animationTime > 3 and self._doAnimation then
    self.animationTime = 0
    ;
    (self.equipSlot):clearItem()
    ;
    (self.materialSlot):clearItem()
    ;
    (self.effectControl):EraseAllEffect()
    ;
    ((self.equipSlot).icon):EraseAllEffect()
    ;
    ((self.materialSlot).icon):EraseAllEffect()
    ;
    (getImproveInformation()):clearData()
    self._doAnimation = false
    self.equipItem = nil
    self.materialItem = nil
    Inventory_SetFunctor(ImproveInvenFilerMainItem, ImproveSetMainItemFromInventory, Panel_Improvement_Hide, nil)
  end
end

  FromClient_ResponseImporve = function(itemEnchantKey)
  -- function num : 0_14
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_IMPROVEMENT_SUCCESSMSG", "itemName", tostring(itemSSW:getName())))
end

  Panel_Improvement:RegisterUpdateFunc("UpdateFunc_DoingImprove")
  registerEvent("FromClient_ResponseImporve", "FromClient_ResponseImporve")
end

