-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stablestallion.luac 

-- params : ...
-- function num : 0
Panel_Window_StableStallion:SetShow(false)
Panel_Window_StableStallion:setMaskingChild(true)
Panel_Window_StableStallion:ActiveMouseEventEffect(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local StableStallion = {
_config = {
baseSlot = {startX = 7, startY = 104, stallionNotifyPosX = 15, stallionNotifyPosY = 450, gapX = 122}
, 
Pos = {gapX = 122, skillTextPosX = 0, skillTextPosY = 6, expGaugePosX = 29, expGaugePosY = 30, iconPosX = 35, iconPosY = 36, trainingBtnPosX = 6, trainingBtnPosY = 155, itemPosX = 35, itemPosY = 109, expCountX = 42, expCountY = 60, meterialPosX = 30, meterialPosY = 87, selectedBGPosX = -10, selectedBGPosY = -9}
, 
skill = {count = 3}
}
, _closeBtn = (UI.getChildControl)(Panel_Window_StableStallion, "Button_Close"), _stallionNotifyBG = (UI.getChildControl)(Panel_Window_StableStallion, "Static_DescBg"), _stallionNotify = (UI.getChildControl)(Panel_Window_StableStallion, "StaticText_StallionDesc"), _upgradeBG = (UI.getChildControl)(Panel_Window_StableStallion, "Static_UpgradeBG"), 
awaken = {_awakenIconBG = (UI.getChildControl)(Panel_Window_StableStallion, "Static_AwakenIconBG"), _awakenIcon = (UI.getChildControl)(Panel_Window_StableStallion, "Static_AwakenIcon"), _awakenCount = (UI.getChildControl)(Panel_Window_StableStallion, "StaticText_AwakenItemCount"), _awakenExpBG = (UI.getChildControl)(Panel_Window_StableStallion, "Static_AwakenExpBG"), _awakenExp = (UI.getChildControl)(Panel_Window_StableStallion, "Static_AwakenExp"), _awakenExpCount = (UI.getChildControl)(Panel_Window_StableStallion, "Static_AwakenPercentString"), _awakenButton = (UI.getChildControl)(Panel_Window_StableStallion, "Button_AwakenTraining"), _awakenArea = (UI.getChildControl)(Panel_Window_StableStallion, "Static_SelectedAwakenArea"), _isEnableAwaken = false, _awakenSlotNo = 0, _awakenItemCount = 0, 
_awaken = {}
}
, 
protect = {_protectMainBG = (UI.getChildControl)(Panel_Window_StableStallion, "Static_ProtectBG"), _protectIconBG = (UI.getChildControl)(Panel_Window_StableStallion, "Static_ProtectIconBG"), _protectIcon = (UI.getChildControl)(Panel_Window_StableStallion, "Static_ProtectIcon"), _protectCount = (UI.getChildControl)(Panel_Window_StableStallion, "StaticText_ProtectItemCount"), _protectButton = (UI.getChildControl)(Panel_Window_StableStallion, "CheckButton_ProtectItem"), _protectItemDescBG = (UI.getChildControl)(Panel_Window_StableStallion, "Static_ProtectItemDescBg"), _protectItemDesc = (UI.getChildControl)(Panel_Window_StableStallion, "StaticText_ProtectItemDesc"), _isEnableProtect = false, _protectSlotNo = 0, _protectItemCount = 0, 
_protect = {}
}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = true}
, _slotCount = 3, _slots = (Array.new)(), 
_selectedItemSlotNo = {}
, _selectedItemWhereType = 0, _index = 0, 
_itemCount = {}
, 
_skillExpCount = {}
, _awakenExpCount = 0, _buttonClick = -1, _elapsedTime = 0, _effectType = 0, _awakenDoing = false, _selectedServantIndex = 0, 
_isExpUp = {}
, _servantNo = nil}
local inventoryItemSSW = nil
local selectedItemWhereType = (CppEnums.ItemWhereType).eInventory
StableStallion.init = function(self)
  -- function num : 0_0
  for ii = 0, self._slotCount - 1 do
    local slot = {}
    slot._panel = Panel_Window_StableStallion
    slot._startSlotIndex = 0
    slot._mainBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Static_MainBG", self._upgradeBG, "servantMainBG_" .. ii)
    slot._skillText = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Static_SkillText", slot._mainBG, "servantStallion_Slot_SkillText_" .. ii)
    slot._skillIcon = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Static_SkillIcon", slot._mainBG, "servantStallion_Slot_SkillIcon_" .. ii)
    slot._skillExpBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Static_SkillExpBG", slot._mainBG, "servantStallion_Slot_SkillExpBG_" .. ii)
    slot._skillExp = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Static_SkillExp", slot._mainBG, "servantStallion_Slot_SkillExp_" .. ii)
    slot._materialTitel = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "StaticText_MaterialTitle", slot._mainBG, "servantStallion_Slot_materialTitle_" .. ii)
    slot._itemSlotBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Static_ItemSlotBG", slot._mainBG, "servantStallion_itemSlotBG_" .. ii)
    slot._itemSlot = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Static_ItemSlot", slot._mainBG, "servantStallion_itemSlot_" .. ii)
    slot._skillPercent = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Skill_PercentString", slot._mainBG, "servantStallion_Slot_EXPValue_" .. ii)
    slot._buttonTraining = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Button_StallionTraining", slot._mainBG, "servantMarket_End_" .. ii)
    slot._selectedSkillBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableStallion, "Static_SelectedSkillBg", slot._mainBG, "selectedSkillBG_" .. ii)
    ;
    (SlotItem.new)(slot, "ItemIcon_" .. ii, ii, slot._itemSlotBG, self.slotConfig)
    slot:createChild()
    local slotConfig = (self._config).baseSlot
    ;
    (slot._mainBG):SetPosX(slotConfig.startX + slotConfig.gapX * ii)
    ;
    (slot._mainBG):SetPosY(slotConfig.startY)
    local slotConfig = (self._config).Pos
    ;
    (slot._skillIcon):SetPosX(slotConfig.iconPosX)
    ;
    (slot._skillIcon):SetPosY(slotConfig.iconPosY)
    ;
    (slot._skillExpBG):SetPosX(slotConfig.expGaugePosX)
    ;
    (slot._skillExpBG):SetPosY(slotConfig.expGaugePosY)
    ;
    (slot._skillExp):SetPosX(slotConfig.expGaugePosX + 2)
    ;
    (slot._skillExp):SetPosY(slotConfig.expGaugePosY + 2)
    ;
    (slot._skillText):SetPosX(slotConfig.skillTextPosX)
    ;
    (slot._skillText):SetPosY(slotConfig.skillTextPosY)
    ;
    (slot._skillPercent):SetPosX(slotConfig.expCountX)
    ;
    (slot._skillPercent):SetPosY(slotConfig.expCountY)
    ;
    (slot._itemSlotBG):SetPosX(slotConfig.itemPosX)
    ;
    (slot._itemSlotBG):SetPosY(slotConfig.itemPosY)
    ;
    (slot._itemSlot):SetPosX(slotConfig.itemPosX)
    ;
    (slot._itemSlot):SetPosY(slotConfig.itemPosY)
    ;
    (slot._buttonTraining):SetPosX(slotConfig.trainingBtnPosX)
    ;
    (slot._buttonTraining):SetPosY(slotConfig.trainingBtnPosY)
    ;
    (slot._materialTitel):SetPosX(slotConfig.meterialPosX)
    ;
    (slot._materialTitel):SetPosY(slotConfig.meterialPosY)
    ;
    (slot._selectedSkillBG):SetPosX(slotConfig.selectedBGPosX)
    ;
    (slot._selectedSkillBG):SetPosY(slotConfig.selectedBGPosY)
    ;
    (slot._buttonTraining):SetAutoDisableTime(1)
    ;
    (slot._buttonTraining):addInputEvent("Mouse_LUp", "StableStallion_Training(" .. ii .. ")")
    ;
    (slot._itemSlot):addInputEvent("Mouse_RUp", "Set_StallionItemSlotClick(" .. ii .. ")")
    ;
    (slot._mainBG):addInputEvent("Mouse_LUp", "Set_StallionItemSlotClick(" .. ii .. ")")
    ;
    (slot._buttonTraining):SetShow(true)
    ;
    (slot._skillIcon):SetShow(true)
    ;
    (slot._skillExpBG):SetShow(true)
    ;
    (slot._skillExp):SetShow(true)
    ;
    (slot._skillText):SetShow(true)
    ;
    (slot._skillPercent):SetShow(true)
    ;
    (slot._materialTitel):SetShow(true)
    ;
    (slot._selectedSkillBG):SetShow(false)
    ;
    (slot._skillIcon):SetIgnore(true)
    ;
    (slot._skillExpBG):SetIgnore(true)
    ;
    (slot._skillExp):SetIgnore(true)
    ;
    (slot._skillText):SetIgnore(true)
    ;
    (slot._skillPercent):SetIgnore(true)
    ;
    (slot._selectedSkillBG):SetIgnore(true)
    ;
    (slot._itemSlot):SetShow(false)
    -- DECOMPILER ERROR at PC317: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._itemCount)[ii] = 0
    -- DECOMPILER ERROR at PC319: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  ;
  (self._upgradeBG):SetShow(true)
  ;
  (self._stallionNotify):SetShow(true)
  ;
  (self._stallionNotify):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._stallionNotify):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_NOTIFY"))
  ;
  ((self.protect)._protectItemDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self.protect)._protectItemDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_PROTECTITEMNOTIFY"))
  ;
  ((self.protect)._protectButton):SetText("")
  ;
  ((self.awaken)._awakenButton):addInputEvent("Mouse_LUp", "Awaken_Training()")
  ;
  (self._closeBtn):addInputEvent("Mouse_LUp", "StableStallion_Close()")
  ;
  ((self.awaken)._awakenIcon):SetIgnore(false)
  ;
  ((self.protect)._protectIcon):SetIgnore(false)
  for i = 0, self._slotCount - 1 do
    -- DECOMPILER ERROR at PC391: Confused about usage of register: R5 in 'UnsetPending'

    (self._selectedItemSlotNo)[i] = nil
    -- DECOMPILER ERROR at PC393: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._isExpUp)[i] = false
  end
  StableStallion_SetPos()
end

local over_SlotEffect = nil
StableStallion.registEventHandler = function(self)
  -- function num : 0_1
  registerEvent("FromClient_IncreaseStallionSkillExpAck", "FromClient_IncreaseStallionSkillExpAck")
  registerEvent("FromClient_CompleteStallionTrainingAck", "FromClient_CompleteStallionTrainingAck")
end

StableStallion_Open = function(servantNo)
  -- function num : 0_2 , upvalues : StableStallion
  local self = StableStallion
  Panel_Window_StableStallion:SetShow(true)
  self._servantNo = servantNo
  self:Refresh_UIData()
  ;
  (((self._slots)[0])._selectedSkillBG):SetShow(true)
  Set_StallionItemSlotClick(0)
  StableFunction_Buttonclose()
  local skillCount = stable_getStallionTrainingSkillCount()
  for i = 0, skillCount - 1 do
    local skillWrapper = stable_getStallionTrainingSkillListAt(i)
    if skillWrapper ~= nil then
      (((self._slots)[i])._skillIcon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
      ;
      (((self._slots)[i])._skillText):SetText(skillWrapper:getName())
    end
  end
  local servantInfo = stable_getServantByServantNo(servantNo)
  if servantInfo == nil then
    return 
  end
  local skillCount = servantInfo:getSkillCount()
  for i = 0, self._slotCount - 1 do
    local satllionSkillWrapper = stable_getStallionTrainingSkillListAt(i)
    local stallionSkillWrapperKey = satllionSkillWrapper:getKey()
    for ii = 1, skillCount - 1 do
      local skillWrapper = servantInfo:getSkill(ii)
      if skillWrapper ~= nil then
        local skillKey = skillWrapper:getKey()
        -- DECOMPILER ERROR at PC86: Confused about usage of register: R17 in 'UnsetPending'

        if stallionSkillWrapperKey == skillKey then
          (self._skillExpCount)[i] = servantInfo:getSkillExp(ii) / (skillWrapper:getMaxExp() / 100)
          -- DECOMPILER ERROR at PC92: Confused about usage of register: R17 in 'UnsetPending'

          if (self._skillExpCount)[i] ~= 0 then
            (self._isExpUp)[i] = true
          else
            -- DECOMPILER ERROR at PC95: Confused about usage of register: R17 in 'UnsetPending'

            ;
            (self._isExpUp)[i] = false
          end
        end
      end
    end
  end
end

StableStallion_Close = function()
  -- function num : 0_3 , upvalues : StableStallion
  local self = StableStallion
  if not Panel_Window_StableStallion:GetShow() then
    return 
  end
  if self._buttonClick > -1 then
    return 
  end
  for index = 0, self._slotCount - 1 do
    (((self._slots)[index])._itemSlot):ChangeTextureInfoName("")
    ;
    (((self._slots)[index])._itemSlot):EraseAllEffect()
    ;
    (((self._slots)[index])._selectedSkillBG):SetShow(false)
    ;
    ((self._slots)[index]):clearItem()
    ;
    (((self._slots)[index]).icon):addInputEvent("Mouse_On", "HandleMOnoutTrainingItemToolTip()")
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._selectedItemSlotNo)[index] = nil
  end
  Panel_Window_StableStallion:SetShow(false)
  StableFunction_ButtonOpen()
  if Panel_Window_Inventory:GetShow() then
    Inventory_ShowToggle()
  end
  ItemNotify_Close()
  StableStallion_EffectErase()
  StableStallion_EffectClose()
  self._buttonClick = -1
  self._effectType = 0
  self._elapsedTime = 0
end

StablStallion_Resize = function()
  -- function num : 0_4
  screenX = getScreenSizeX()
  screenY = getScreenSizeY()
end

StableStallion_Position = function()
  -- function num : 0_5
  Panel_Window_StableStallion:SetPosX(getScreenSizeX() / 2 - Panel_Window_StableStallion:GetSizeX() / 2)
  Panel_Window_StableStallion:SetPosY(getScreenSizeY() / 2 - Panel_Window_StableStallion:GetSizeY() / 2)
end

StableStallion_Resize = function()
  -- function num : 0_6 , upvalues : StableStallion
  local self = StableStallion
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_StableStallion:ComputePos()
end

StableStallion.protectItemCount = function(self)
  -- function num : 0_7 , upvalues : StableStallion
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local useStartSlot = inventorySlotNoUserStart()
  local normalInventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local invenUseSize = selfPlayer:getInventorySlotCount(false)
  local protectItemSSW = stable_getPreventStallionTrainingSkillExpItem()
  if protectItemSSW ~= nil then
    local protectItemName = (protectItemSSW:getName())
    local protectItemSlotNo = nil
    local protectItemCounts = 0
    for idx = useStartSlot, invenUseSize - 2 do
      local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, idx)
      if itemWrapper ~= nil then
        local itemSSW = itemWrapper:getStaticStatus()
        local itemName = itemSSW:getName()
        if protectItemName == itemName then
          protectItemSlotNo = idx
          protectItemCounts = ((getInventoryItemByType((CppEnums.ItemWhereType).eInventory, idx)):get()):getCount_s64()
          break
        end
      end
    end
    do
      do
        if protectItemSlotNo ~= nil then
          return protectItemSlotNo, protectItemCounts
        else
          return protectItemSlotNo, toInt64(0, 0)
        end
        StableStallion:Refresh_UIData()
      end
    end
  end
end

StableStallion.setProtectItem = function(self)
  -- function num : 0_8 , upvalues : StableStallion
  local self = StableStallion
  local itemSSW = stable_getPreventStallionTrainingSkillExpItem()
  if itemSSW ~= nil then
    local name = itemSSW:getName()
    ;
    ((self.protect)._protectIcon):ChangeTextureInfoName("Icon/" .. itemSSW:getIconPath())
    ;
    ((self.protect)._protectIcon):SetMonoTone(false)
    local needCount = toInt64(0, 0)
    local haveCount = toInt64(0, 0)
    needCount = toInt64(0, stable_getPreventStallionTrainingSkillExpDownItemCount())
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.protect)._protectSlotNo = self:protectItemCount()
    ;
    ((self.protect)._protectButton):SetIgnore(true)
    ;
    ((self.protect)._protectButton):SetMonoTone(true)
    -- DECOMPILER ERROR at PC56: Overwrote pending register: R5 in 'AssignReg'

    if haveCount < needCount then
      ((self.protect)._protectIcon):SetMonoTone(true)
      ;
      ((self.protect)._protectButton):SetIgnore(true)
      ;
      ((self.protect)._protectButton):SetMonoTone(true)
      self._isEnableProtect = false
    else
      ;
      ((self.protect)._protectIcon):SetMonoTone(false)
      ;
      ((self.protect)._protectButton):SetIgnore(false)
      ;
      ((self.protect)._protectButton):SetMonoTone(false)
      self._isEnableProtect = true
    end
    ;
    ((self.protect)._protectCount):SetText(tostring(haveCount) .. "/" .. tostring(needCount))
    ;
    ((self.protect)._protectIcon):addInputEvent("Mouse_On", "HandleMOnoutProtectItemToolTip( true )")
    ;
    ((self.protect)._protectIcon):addInputEvent("Mouse_Out", "HandleMOnoutProtectItemToolTip( false )")
    ;
    ((self.protect)._protectIcon):setTooltipEventRegistFunc("HandleMOnoutProtectItemToolTip( true )")
    local textSizeX = ((self.protect)._protectCount):GetTextSizeX()
  end
end

StableStallion.AwakenItemCount = function(self)
  -- function num : 0_9 , upvalues : StableStallion
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local useStartSlot = inventorySlotNoUserStart()
  local normalInventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local invenUseSize = selfPlayer:getInventorySlotCount(false)
  local awakenItemSSW = stable_getStallionTrainingCompleteRequiredItem()
  if awakenItemSSW ~= nil then
    local awakenItemName = (awakenItemSSW:getName())
    local awakenItemSlotNo = nil
    local awakenItemCounts = 0
    for idx = useStartSlot, invenUseSize - 2 do
      local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, idx)
      if itemWrapper ~= nil then
        local itemSSW = itemWrapper:getStaticStatus()
        local itemName = itemSSW:getName()
        if awakenItemName == itemName then
          awakenItemSlotNo = idx
          awakenItemCounts = ((getInventoryItemByType((CppEnums.ItemWhereType).eInventory, idx)):get()):getCount_s64()
          break
        end
      end
    end
    do
      do
        if awakenItemSlotNo ~= nil then
          return awakenItemSlotNo, awakenItemCounts
        else
          return awakenItemSlotNo, toInt64(0, 0)
        end
        StableStallion:Refresh_UIData()
      end
    end
  end
end

StableStallion.setAwakenitem = function(self)
  -- function num : 0_10
  local itemSSW = stable_getStallionTrainingCompleteRequiredItem()
  if itemSSW ~= nil then
    ((self.awaken)._awakenIcon):ChangeTextureInfoName("Icon/" .. itemSSW:getIconPath())
    ;
    ((self.awaken)._awakenIcon):SetMonoTone(false)
    local needCount = toInt64(0, 1)
    local haveCount = toInt64(0, 0)
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self.awaken)._awakenSlotNo = self:AwakenItemCount()
    -- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

    if haveCount < needCount then
      ((self.awaken)._awakenIcon):SetMonoTone(true)
      self._isEnableAwaken = false
    else
      ;
      ((self.awaken)._awakenIcon):SetMonoTone(false)
      self._isEnableAwaken = true
    end
    ;
    ((self.awaken)._awakenCount):SetText(tostring(haveCount) .. "/" .. tostring(needCount))
    ;
    ((self.awaken)._awakenIcon):addInputEvent("Mouse_On", "HandleMOnoutAwakenItemToolTip( true )")
    ;
    ((self.awaken)._awakenIcon):addInputEvent("Mouse_Out", "HandleMOnoutAwakenItemToolTip( false )")
    ;
    ((self.awaken)._awakenIcon):setTooltipEventRegistFunc("HandleMOnoutAwakenItemToolTip( true )")
  end
end

Set_StallionItemSlotClick = function(index)
  -- function num : 0_11 , upvalues : StableStallion
  self = StableStallion
  if Panel_Window_Exchange_Number:GetShow() or self._buttonClick ~= -1 then
    return 
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  self._index = index
  if Panel_Window_Inventory:GetShow() then
    Inventory_SetFunctor(InvenFilter_Stallion, nil, nil, nil)
  else
    Inventory_SetFunctor(InvenFilter_Stallion, nil, nil, nil)
    Inventory_ShowToggle()
  end
  for i = 0, self._slotCount - 1 do
    (((self._slots)[i])._selectedSkillBG):SetShow(i == index)
  end
  local skillWrapper = stable_getStallionTrainingSkillListAt(index)
  do
    local skillKey = skillWrapper:getKey()
    Stallion_ItemNotify(skillKey, index)
    audioPostEvent_SystemUi(0, 0)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

InvenFilter_Stallion = function(slotNo, itemWrapper)
  -- function num : 0_12 , upvalues : StableStallion
  if itemWrapper == nil then
    return true
  end
  local invenItemSSW = itemWrapper:getStaticStatus()
  if invenItemSSW == nil then
    return true
  end
  local self = StableStallion
  local skillWrapper = stable_getStallionTrainingSkillListAt(self._index)
  if skillWrapper ~= nil then
    local skillName = skillWrapper:getName()
    local skillKey = skillWrapper:getKey()
    local itemCount = stable_getStallionSkillItemListCount(skillKey)
    local itemSSW = {}
    for index = 0, itemCount - 1 do
      itemSSW[index] = stable_getStallionSkillItemListAt(skillKey, index)
      local itemName = (itemSSW[index]):getName()
      local invenItemName = invenItemSSW:getName()
      if itemSSW[index] ~= nil and itemName == invenItemName then
        return false
      end
    end
  end
  do
    return true
  end
end

Set_StallionItemSlot = function(count, slotNo, itemWrapper)
  -- function num : 0_13 , upvalues : StableStallion, selectedItemWhereType
  local self = StableStallion
  local index = StableStallion._index
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._selectedItemSlotNo)[index] = slotNo
  selectedItemWhereType = whereType
  itemWrapper = getInventoryItemByType(selectedItemWhereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  if ToClient_Inventory_CheckItemLock(slotNo, selectedItemWhereType) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_ITEMLOCK"))
    return 
  end
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._itemCount)[index] = Int64toInt32(count)
  ;
  ((self._slots)[index]):setItem(itemWrapper)
  ;
  (((self._slots)[index]).count):SetText(tostring(count))
  ;
  (((self._slots)[index]).icon):AddEffect("UI_NewSkill01", false, 0, 0)
  ;
  (((self._slots)[index]).icon):addInputEvent("Mouse_On", "HandleMOnoutTrainingItemToolTip(" .. index .. "," .. slotNo .. ")")
  ;
  (((self._slots)[index]).icon):addInputEvent("Mouse_Out", "HandleMOnoutTrainingItemToolTip()")
end

HandleMOnoutAwakenItemToolTip = function(isShow)
  -- function num : 0_14 , upvalues : StableStallion
  local self = StableStallion
  local itemSSW = stable_getStallionTrainingCompleteRequiredItem()
  if isShow then
    registTooltipControl((self.awaken)._awakenIcon, Panel_Tooltip_Item)
    Panel_Tooltip_Item_Show(itemSSW, (self.awaken)._awakenIcon, true, false, nil, nil, nil)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end

HandleMOnoutTrainingItemToolTip = function(index, slotNo)
  -- function num : 0_15 , upvalues : StableStallion
  if index == nil then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local self = StableStallion
  if self._selectedItemWhereType ~= nil then
    local itemWrapper = getInventoryItemByType(self._selectedItemWhereType, slotNo)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      registTooltipControl(((self._slots)[index]).icon, Panel_Tooltip_Item)
      Panel_Tooltip_Item_Show(itemSSW, ((self._slots)[index]).icon, true, false, nil, nil, nil)
    end
  end
end

StableStallion_Training = function(index)
  -- function num : 0_16 , upvalues : StableStallion, selectedItemWhereType
  if Panel_Window_Exchange_Number:GetShow() then
    return 
  end
  local self = StableStallion
  Set_StallionItemSlotClick(index)
  if self._effectType ~= 0 then
    return 
  end
  if (self._itemCount)[index] == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_ITEMREGISTER"))
    return 
  end
  local itemWrapper = getInventoryItemByType(selectedItemWhereType, (self._selectedItemSlotNo)[index])
  if itemWrapper == nil then
    return 
  end
  local skillWrapper = stable_getStallionTrainingSkillListAt(index)
  local skillKey = skillWrapper:getKey()
  ToClient_increaseStallionSkillExpByItem(skillKey, self._servantNo, selectedItemWhereType, (self._selectedItemSlotNo)[index], (self._itemCount)[index])
  self._index = index
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R5 in 'UnsetPending'

  if (self._isExpUp)[index] == false then
    (self._isExpUp)[index] = true
  end
end

Awaken_Training = function()
  -- function num : 0_17 , upvalues : StableStallion
  if Panel_Window_Exchange_Number:GetShow() then
    return 
  end
  local self = StableStallion
  if self._effectType ~= 0 then
    return 
  end
  local isAwaken = ToClient_isCompleteStallionTraining(self._servantNo)
  local needCount = toInt64(0, 1)
  local haveCount = toInt64(0, 0)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self.awaken)._awakenSlotNo = self:AwakenItemCount()
  if haveCount < needCount then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_AWAKENITEM"))
    return 
  end
  if isAwaken == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_AWAKENGAUGELACK"))
    return 
  end
  local contentStr = PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_LOOKCHANGEWARNING")
  local messageboxData = {title = "", content = contentStr, functionYes = Awaken_Training_Yes, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW, exitButton = true}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Awaken_Training_Yes = function()
  -- function num : 0_18 , upvalues : StableStallion
  local self = StableStallion
  self._buttonClick = 1
  self._awakenDoing = true
end

Awaken_Training_isNineTier = function()
  -- function num : 0_19 , upvalues : StableStallion
  local self = StableStallion
  local awakenItemWrapper = stable_getStallionTrainingCompleteRequiredItem()
  if awakenItemWrapper == nil then
    return 
  end
  local whereType = (CppEnums.ItemWhereType).eInventory
  local protectWrapper = stable_getPreventStallionTrainingSkillExpItem()
  if protectWrapper == nil then
    return 
  end
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = selfPlayer:getInventorySlotCount(false)
  local itemSlotNo = CppEnums.TInventorySlotNoUndefined
  local protectSlotNo = CppEnums.TInventorySlotNoUndefined
  local itemKey = ((awakenItemWrapper:get())._key):getItemKey()
  local protectKey = ((protectWrapper:get())._key):getItemKey()
  for idx = useStartSlot, invenUseSize - 2 do
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, idx)
    if itemWrapper ~= nil then
      local invenItemSSW = itemWrapper:getStaticStatus()
      if itemKey == ((invenItemSSW:get())._key):getItemKey() then
        itemSlotNo = idx
      end
      if protectKey == ((invenItemSSW:get())._key):getItemKey() then
        protectSlotNo = idx
      end
      if CppEnums.TInventorySlotNoUndefined ~= itemSlotNo and CppEnums.TInventorySlotNoUndefined ~= protectSlotNo then
        break
      end
    end
  end
  do
    if CppEnums.TInventorySlotNoUndefined ~= itemSlotNo then
      if not ((self.protect)._protectButton):IsCheck() then
        protectSlotNo = CppEnums.TInventorySlotNoUndefined
      end
      ToClient_completeStallionTraining(self._servantNo, whereType, itemSlotNo, whereType, protectSlotNo)
    end
    StableStallion:setProtectItem()
    StableStallion:setAwakenitem()
  end
end

FromClient_IncreaseStallionSkillExpAck = function(servantNo, skillKey, skillExp)
  -- function num : 0_20 , upvalues : StableStallion
  StableStallion:TrainSkillUpdate()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R3 in 'UnsetPending'

  self._buttonClick = 0
end

StableStallion_RefreshUpdate = function()
  -- function num : 0_21 , upvalues : StableStallion
  self = StableStallion
  self:Refresh_UIData()
end

StableStallion.TrainSkillUpdate = function(self)
  -- function num : 0_22 , upvalues : selectedItemWhereType
  for index = 0, self._slotCount - 1 do
    if (self._selectedItemSlotNo)[index] ~= nil then
      local itemWrapper = getInventoryItemByType(selectedItemWhereType, (self._selectedItemSlotNo)[index])
      if (self._itemCount)[index] == 0 then
        ((self._slots)[index]):clearItem()
        ;
        (((self._slots)[index]).icon):addInputEvent("Mouse_On", "")
        ;
        (((self._slots)[index]).icon):addInputEvent("Mouse_Out", "")
      end
    end
  end
end

StableStallion.Refresh_UIData = function(self)
  -- function num : 0_23
  local servantInfo = stable_getServantByServantNo(self._servantNo)
  if servantInfo == nil then
    return 
  end
  local name = servantInfo:getName()
  local skillCount = servantInfo:getSkillCount()
  local awakenExp = 0
  local awakenMaxExp = stable_getStallionTrainingCompleteRequiredExperience()
  for i = 0, self._slotCount - 1 do
    local satllionSkillWrapper = stable_getStallionTrainingSkillListAt(i)
    local stallionSkillWrapperKey = satllionSkillWrapper:getKey()
    for ii = 1, skillCount - 1 do
      local skillWrapper = servantInfo:getSkill(ii)
      if skillWrapper ~= nil then
        local skillname = skillWrapper:getName()
        local skillKey = skillWrapper:getKey()
        -- DECOMPILER ERROR at PC46: Confused about usage of register: R19 in 'UnsetPending'

        if stallionSkillWrapperKey == skillKey then
          (self._skillExpCount)[i] = servantInfo:getSkillExp(ii) / (skillWrapper:getMaxExp() / 100)
          ;
          (((self._slots)[i])._skillPercent):SetText((string.format)("%.1f", (self._skillExpCount)[i]) .. "%")
          ;
          (((self._slots)[i])._skillExp):SetProgressRate((self._skillExpCount)[i])
          awakenExp = awakenExp + servantInfo:getSkillExp(ii)
        end
      end
    end
  end
  self._awakenExpCount = (awakenExp) / (awakenMaxExp / 100)
  ;
  ((self.awaken)._awakenExp):SetProgressRate(self._awakenExpCount)
  ;
  ((self.awaken)._awakenExpCount):SetText((string.format)("%.1f", self._awakenExpCount * 2) .. "%")
  self:setProtectItem()
  self:setAwakenitem()
end

StableStallion.UpdateCount = function(self, isAwakenBtn)
  -- function num : 0_24
  if isAwakenBtn == true then
    for i = 0, self._slotCount - 1 do
      -- DECOMPILER ERROR at PC15: Confused about usage of register: R6 in 'UnsetPending'

      if (self._skillExpCount)[i] > 1 then
        (self._skillExpCount)[i] = (self._skillExpCount)[i] - 1
        ;
        (((self._slots)[i])._skillPercent):SetText((string.format)("%.1f", (self._skillExpCount)[i]) .. "%")
        ;
        (((self._slots)[i])._skillExp):SetProgressRate((self._skillExpCount)[i])
      else
        -- DECOMPILER ERROR at PC38: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self._skillExpCount)[i] = 0
        ;
        (((self._slots)[i])._skillPercent):SetText(0 .. "%")
        ;
        (((self._slots)[i])._skillExp):SetProgressRate(0)
      end
    end
    if self._awakenExpCount - 1 >= 0 then
      self._awakenExpCount = self._awakenExpCount - 1
      ;
      ((self.awaken)._awakenExp):SetProgressRate(self._awakenExpCount)
      ;
      ((self.awaken)._awakenExpCount):SetText((string.format)("%.1f", self._awakenExpCount * 2) .. "%")
    end
  else
    -- DECOMPILER ERROR at PC86: Confused about usage of register: R2 in 'UnsetPending'

    if (self._skillExpCount)[self._index] >= 100 then
      (self._skillExpCount)[self._index] = 100
    else
      -- DECOMPILER ERROR at PC99: Confused about usage of register: R2 in 'UnsetPending'

      if (self._itemCount)[self._index] > 0 then
        (self._skillExpCount)[self._index] = (self._skillExpCount)[self._index] + 1
        -- DECOMPILER ERROR at PC106: Confused about usage of register: R2 in 'UnsetPending'

        ;
        (self._itemCount)[self._index] = (self._itemCount)[self._index] - 1
        ;
        (((self._slots)[self._index]).count):SetText(tostring((self._itemCount)[self._index]))
        self._awakenExpCount = self._awakenExpCount + 0.5
        ;
        ((self.awaken)._awakenExp):SetProgressRate(self._awakenExpCount)
        ;
        ((self.awaken)._awakenExpCount):SetText((string.format)("%.1f", self._awakenExpCount * 2) .. "%")
      end
    end
    ;
    (((self._slots)[self._index])._skillPercent):SetText((string.format)("%.1f", (self._skillExpCount)[self._index]) .. "%")
    ;
    (((self._slots)[self._index])._skillExp):SetProgressRate((self._skillExpCount)[self._index])
  end
end

FromClient_CompleteStallionTrainingAck = function(servantNo, servantCharacterKey)
  -- function num : 0_25 , upvalues : StableStallion
  local self = StableStallion
  local servantKey = servantCharacterKey
  if servantKey == 0 then
    StableStallion_AwakenEffect(false)
    audioPostEvent_SystemUi(13, 22)
  else
    StableStallion_AwakenEffect(true, servantKey)
    audioPostEvent_SystemUi(13, 21)
  end
  self:Refresh_UIData()
end

FGlobal_MaxItemCount = function(itemSlotNo)
  -- function num : 0_26 , upvalues : StableStallion
  local self = StableStallion
  if self._buttonClick ~= -1 then
    return nil
  end
  local index = self._index
  local satllionSkillWrapper = stable_getStallionTrainingSkillListAt(index)
  local stallionSkillWrapperKey = satllionSkillWrapper:getKey()
  local itemWhereType = self._selectedItemWhereType
  local itemCount = 0
  local itemCount = ToClient_availableStallionTrainingItemMaxCount(self._servantNo, stallionSkillWrapperKey, itemWhereType, itemSlotNo)
  return itemCount
end

local frame = 0
StableStallion_UpdateTime = function(updateTime)
  -- function num : 0_27 , upvalues : StableStallion, frame
  local self = StableStallion
  if self._buttonClick == -1 then
    return 
  end
  self._elapsedTime = self._elapsedTime + updateTime
  if self._buttonClick == 0 then
    frame = frame + updateTime
    self:UpdateCount(false)
    -- DECOMPILER ERROR at PC31: Unhandled construct in 'MakeBoolean' P1

    if self._elapsedTime < 2.5 and self._effectType == 0 then
      StableStallion_Effect(((self._slots)[self._index]).icon, 0, 0, 0)
      local effectIndex = 0
      if self._index == 0 then
        effectIndex = 9
      else
        if self._index == 1 then
          effectIndex = 10
        else
          if self._index == 2 then
            effectIndex = 11
          end
        end
      end
      if effectIndex ~= 0 then
        StableStallion_Effect(((self._slots)[self._index])._skillPercent, effectIndex, 0, -18)
      end
      StableStallion_Effect(((self._slots)[self._index])._skillPercent, 3, 0, -18)
      ;
      (((self._slots)[self._index])._selectedSkillBG):SetShow(false)
      audioPostEvent_SystemUi(13, 19)
      self._effectType = 1
    end
    do
      -- DECOMPILER ERROR at PC92: Unhandled construct in 'MakeBoolean' P1

      if self._elapsedTime < 3 and self._effectType == 1 then
        StableStallion_Effect((self.awaken)._awakenExpCount, 4, -3, -30)
        StableStallion_Effect((self.awaken)._awakenExpCount, 3, -3, -30)
        self._effectType = 2
      end
      -- DECOMPILER ERROR at PC117: Unhandled construct in 'MakeBoolean' P1

      if self._elapsedTime > 4.2 and self._elapsedTime < 4.5 and self._effectType == 2 then
        StableStallion_Effect((self.awaken)._awakenExpCount, 5, 0, -30)
        StableStallion:Refresh_UIData()
        ;
        (((self._slots)[self._index])._selectedSkillBG):SetShow(true)
        for index = 0, self._slotCount - 1 do
          (((self._slots)[index])._itemSlot):ChangeTextureInfoName("")
          ;
          (((self._slots)[index])._itemSlot):EraseAllEffect()
          ;
          (((self._slots)[index])._selectedSkillBG):SetShow(false)
          ;
          ((self._slots)[index]):clearItem()
          ;
          (((self._slots)[index]).icon):addInputEvent("Mouse_On", "HandleMOnoutTrainingItemToolTip()")
          -- DECOMPILER ERROR at PC162: Confused about usage of register: R6 in 'UnsetPending'

          ;
          (self._selectedItemSlotNo)[index] = nil
        end
        self._effectType = 3
      end
      if self._elapsedTime > 5.5 then
        StableStallion_EffectErase()
        self._elapsedTime = 0
        self._buttonClick = -1
        self._effectType = 0
        StableStallion:Refresh_UIData()
      end
      if self._buttonClick == 1 then
        if Panel_Window_StableStallion_Effect:GetShow() == false then
          Panel_Window_StableStallion_Effect:SetShow(true)
        end
        self:UpdateCount(true)
        -- DECOMPILER ERROR at PC202: Unhandled construct in 'MakeBoolean' P1

        if self._elapsedTime < 2 and self._effectType == 0 then
          audioPostEvent_SystemUi(13, 20)
          for i = 0, self._slotCount - 1 do
            if (self._isExpUp)[i] then
              StableStallion_Effect(((self._slots)[i])._skillPercent, i + 9, 0, -18)
            end
          end
          ;
          (((self._slots)[self._index])._selectedSkillBG):SetShow(false)
          self._effectType = 1
          ;
          ((self.protect)._protectButton):SetIgnore(true)
        end
      end
      -- DECOMPILER ERROR at PC247: Unhandled construct in 'MakeBoolean' P1

      if self._elapsedTime < 2.5 and self._effectType == 1 then
        StableStallion_Effect((self.awaken)._awakenExpCount, 4, -3, -30)
        self._effectType = 2
        StableStallion_doAwakenEffect()
      end
      if self._elapsedTime > 3.7 and self._elapsedTime < 6.5 then
        if Panel_Window_StableStallion:GetShow() then
          Panel_Window_StableStallion:SetShow(false)
          for index = 0, self._slotCount - 1 do
            (((self._slots)[index])._itemSlot):ChangeTextureInfoName("")
            ;
            (((self._slots)[index])._itemSlot):EraseAllEffect()
            ;
            (((self._slots)[index])._selectedSkillBG):SetShow(false)
            ;
            ((self._slots)[index]):clearItem()
            ;
            (((self._slots)[index]).icon):addInputEvent("Mouse_On", "HandleMOnoutTrainingItemToolTip()")
            -- DECOMPILER ERROR at PC301: Confused about usage of register: R6 in 'UnsetPending'

            ;
            (self._selectedItemSlotNo)[index] = nil
          end
          if Panel_Window_Inventory:GetShow() then
            Inventory_ShowToggle()
          end
          ItemNotify_Close()
        end
        if self._effectType == 2 then
          frame = frame + updateTime
          if frame > 0.2 then
            frame = 0
            StableStallion_AwakenEffect(0)
            self._effectType = 3
          end
        end
      else
        -- DECOMPILER ERROR at PC338: Unhandled construct in 'MakeBoolean' P1

        if self._elapsedTime > 8 and self._elapsedTime < 10.5 and self._awakenDoing == true then
          Awaken_Training_isNineTier()
          self._awakenDoing = false
        end
      end
      -- DECOMPILER ERROR at PC352: Unhandled construct in 'MakeBoolean' P1

      if self._elapsedTime > 11.5 and self._elapsedTime < 12 and self._effectType == 3 then
        StableStallion:Refresh_UIData()
        StableList_CharacterSceneResetServantNo(self._servantNo)
        self._effectType = 4
      end
      if self._elapsedTime > 12 then
        StableStallion_EffectErase()
        StableStallion_EffectClose()
        StableStallion:Refresh_UIData()
        self._buttonClick = -1
        self._effectType = 0
        StableFunction_ButtonOpen()
        self._elapsedTime = 0
        ;
        ((self.protect)._protectButton):SetIgnore(false)
        ;
        ((self.protect)._protectButton):SetCheck(false)
      end
    end
  end
end

FGlobal_IsButtonClick = function()
  -- function num : 0_28 , upvalues : StableStallion
  local self = StableStallion
  return self._buttonClick
end

StableStallion_SetPos = function()
  -- function num : 0_29 , upvalues : StableStallion
  local self = StableStallion
  local stallionTextSizeY = (self._stallionNotify):GetTextSizeY()
  local stallionTextBGSizeY = (self._stallionNotifyBG):GetSizeY()
  local protectTextSizeY = ((self.protect)._protectItemDesc):GetTextSizeY()
  local protectTextBGSizeY = ((self.protect)._protectItemDescBG):GetSizeY()
  local stallionSizeY = 0
  local protectSizeY = 0
  if stallionTextBGSizeY < stallionTextSizeY + 10 or protectTextBGSizeY < protectTextSizeY then
    stallionSizeY = stallionTextSizeY - stallionTextBGSizeY
    protectSizeY = protectTextSizeY - protectTextBGSizeY
    if stallionSizeY < 0 then
      stallionSizeY = 0
    end
    if protectSizeY < 0 then
      protectSizeY = 0
    end
    ;
    (self._stallionNotifyBG):SetSize((self._stallionNotifyBG):GetSizeX(), (self._stallionNotifyBG):GetSizeY() + stallionSizeY + 10)
    local SetPos = function(control)
    -- function num : 0_29_0 , upvalues : self, stallionSizeY, protectSizeY
    if (self.awaken)._awakenButton == control then
      control:SetPosY(control:GetPosY() + stallionSizeY + protectSizeY + 10)
    else
      if (self.protect)._protectCount == control or (self.protect)._protectIcon == control or (self.protect)._protectButton == control or (self.protect)._protectIconBG == control then
        control:SetPosY(control:GetPosY() + stallionSizeY + protectSizeY / 2 + 10)
      else
        control:SetPosY(control:GetPosY() + stallionSizeY + 10)
      end
    end
  end

    SetPos((self.protect)._protectMainBG)
    ;
    ((self.protect)._protectItemDescBG):SetSize(((self.protect)._protectItemDescBG):GetSizeX(), protectTextSizeY + 8)
    ;
    ((self.protect)._protectMainBG):SetSize(((self.protect)._protectMainBG):GetSizeX(), ((self.protect)._protectItemDescBG):GetSizeY() + 20)
    ;
    ((self.protect)._protectItemDescBG):SetPosY(((self.protect)._protectMainBG):GetPosY() + 10)
    ;
    ((self.protect)._protectItemDesc):SetPosY(((self.protect)._protectItemDescBG):GetPosY() + 4)
    SetPos((self.awaken)._awakenButton)
    SetPos((self.protect)._protectIconBG)
    SetPos((self.protect)._protectIcon)
    SetPos((self.protect)._protectCount)
    SetPos((self.protect)._protectButton)
    Panel_Window_StableStallion:SetSize(Panel_Window_StableStallion:GetSizeX(), Panel_Window_StableStallion:GetSizeY() + stallionSizeY + protectSizeY + 10)
  end
end

StableStallion:init()
StableStallion:registEventHandler()
StableStallion_Position()
Panel_Window_StableList:RegisterUpdateFunc("StableStallion_UpdateTime")

