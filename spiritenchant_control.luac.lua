-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\enchant\spiritenchant_control.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setNeedPerfectEnchantItemCount = function(self, needCount, enchantCount, enchantItemClassify)
  -- function num : 0_0
  (self._uiHelpPerfectEnchant):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  if needCount > 0 then
    (self._uiHelpPerfectEnchant):SetShow(true)
    ;
    (self._uiHelpPerfectEnchant):SetNotAbleMasking(true)
    local needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_0") .. " "
    if enchantCount < 15 and (enchantItemClassify == 1 or enchantItemClassify == 2) then
      needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_1") .. " "
    else
      if enchantCount < 15 and enchantItemClassify == 3 then
        needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_2") .. " "
      else
        if enchantCount >= 15 and (enchantItemClassify == 1 or enchantItemClassify == 2) then
          needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_3") .. " "
        else
          if enchantCount >= 15 and enchantItemClassify == 3 then
            needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_4") .. " "
          end
        end
      end
    end
    ;
    (self._uiHelpPerfectEnchant):SetText(needEnchantStone .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_BLACKSTONE_COUNT", "needCount", needCount) .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_DECREASEENDURANCE_PERFECTENCHANT", "enchantPerfectEnduranceValue", self._enchantPerfectEnduranceValue))
    local boxSizeY = (self._uiHelpPerfectEnchant):GetTextSizeY() + 30
    if boxSizeY < 70 then
      boxSizeY = 70
    end
    self.savedBoxSizeY = boxSizeY
    ;
    (self._uiHelpPerfectEnchant):SetSize((self._uiHelpPerfectEnchant):GetSizeX() + self._Xgap, boxSizeY)
  else
    do
      local needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_0") .. " "
      if enchantCount < 15 and (enchantItemClassify == 1 or enchantItemClassify == 2) then
        needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_1") .. " "
      else
        if enchantCount < 15 and enchantItemClassify == 3 then
          needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_2") .. " "
        else
          if enchantCount >= 15 and (enchantItemClassify == 1 or enchantItemClassify == 2) then
            needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_3") .. " "
          else
            if enchantCount >= 15 and enchantItemClassify == 3 then
              needEnchantStone = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_KIND_OF_STONE_4") .. " "
            end
          end
        end
      end
      ;
      (self._uiHelpPerfectEnchant):SetText(needEnchantStone .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_BLACKSTONE_COUNT", "needCount", needCount) .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_DECREASEENDURANCE_PERFECTENCHANT", "enchantPerfectEnduranceValue", self._enchantPerfectEnduranceValue))
      do
        local boxSizeY = (self._uiHelpPerfectEnchant):GetTextSizeY() + 30
        if boxSizeY < 70 then
          boxSizeY = 70
        end
        ;
        (self._uiHelpPerfectEnchant):SetShow(false)
        ;
        (self._uiHelpPerfectEnchant):SetSize(220, boxSizeY)
        ;
        (self._uiHelpPerfectEnchant):SetPosY(self._bubbleBasePosY - (self._uiHelpPerfectEnchant):GetSizeY() + 50)
      end
    end
  end
end

-- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.clear = function(self)
  -- function num : 0_1
  (self._uiHelpPerfectEnchant):SetShow(false)
  ;
  (self._uiHelpPerfectEnchant):SetSize(220, self.savedBoxSizeY)
  ;
  (self._slotTargetItem):clearItem()
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotTargetItem).empty = true
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotTargetItem).slotNo = nil
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotTargetItem).inventoryType = nil
  ;
  (self._slotEnchantItem):clearItem()
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotEnchantItem).empty = true
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotEnchantItem).slotNo = nil
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotEnchantItem).inventoryType = nil
  ;
  ((self._slotEnchantItem).icon):EraseAllEffect()
  ;
  (self._uiButtonApply):EraseAllEffect()
  ;
  (self._uiButtonSureSuccess):EraseAllEffect()
  ;
  (self._uiButtonApply):SetIgnore(true)
  ;
  (self._uiButtonApply):SetMonoTone(true)
  ;
  (self._uiButtonSureSuccess):SetIgnore(true)
  ;
  (self._uiButtonSureSuccess):SetShow(true)
  self._isStartEnchantNormal = false
  self._isStartEnchantSureSuccess = false
  self._isDoingEnchant = false
  ;
  (self._uiButtonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DOENCHANT"))
  ;
  (self._uiDrasticEnchant):SetCheck(true)
  ;
  (self._uiMeticulousEnchant):SetCheck(false)
  ;
  (self._uiDrasticEnchant):SetShow(false)
  ;
  (self._uiMeticulousEnchant):SetShow(false)
  ;
  (self._uiDrasticEnchant):SetIgnore(self._isDoingEnchant)
  ;
  (self._uiMeticulousEnchant):SetIgnore(self._isDoingEnchant)
  ;
  (self._uiHelpEnchantBtn):SetShow(false)
  local dummy, cronCount = self:protectItemCount()
  ;
  (self._uiProtectItem_Count):SetText(tostring(cronCount) .. "/" .. tostring(0))
  FGlobal_EnchantArrowSet(true)
  ;
  (getEnchantInformation()):clearData()
  ;
  (self._uiCheckBtn_CronEnchnt):SetMonoTone(true)
  ;
  (self._uiProtectItem_Btn):SetMonoTone(true)
  ;
  (self._uiCheckBtn_CronEnchnt):SetIgnore(true)
  ;
  (self._uiProtectItem_Btn):SetIgnore(true)
end

-- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.isDoingEnchant = function(self)
  -- function num : 0_2
  return self._isDoingEnchant
end

-- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.protectItemCount = function(self)
  -- function num : 0_3
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local useStartSlot = inventorySlotNoUserStart()
  local normalInventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local invenUseSize = selfPlayer:getInventorySlotCount(false)
  local protectItemSSW = FromClient_getPreventDownGradeItem()
  if protectItemSSW ~= nil then
    local protectItemName = (protectItemSSW:getName())
    local protectItemSlotNo = nil
    local protectItemCounts = 0
    for idx = useStartSlot, invenUseSize - 1 do
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
      if protectItemSlotNo ~= nil then
        return protectItemSlotNo, protectItemCounts
      else
        return protectItemSlotNo, toInt64(0, 0)
      end
    end
  end
end

-- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setProtectItem = function(self, itemKey, enchantLevel)
  -- function num : 0_4
  local itemSSW = FromClient_getPreventDownGradeItem()
  if itemSSW ~= nil then
    local name = itemSSW:getName()
    ;
    (self._uiProtectItem_Icon):ChangeTextureInfoName("Icon/" .. itemSSW:getIconPath())
    local needCount = toInt64(0, 0)
    local haveCount = toInt64(0, 0)
    if itemKey ~= nil then
      needCount = (getEnchantInformation()):getNeedCountPreventDownGradeItem(itemKey)
    end
    self._protectItem_SlotNo = self:protectItemCount()
    ;
    (self._uiProtectItem_Btn):SetIgnore(true)
    ;
    (self._uiProtectItem_Btn):SetMonoTone(true)
    -- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

    if haveCount < needCount then
      if (self._uiProtectItem_Btn):IsCheck() then
        (self._uiProtectItem_Btn):SetCheck(false)
      end
      self._isEnableProtect = false
    else
      self._isEnableProtect = true
    end
    if enchantLevel ~= nil then
      if enchantLevel > 15 or self._enchantClassifyValue == 4 then
        (self._uiProtectItem_Btn):SetIgnore(false)
        ;
        (self._uiProtectItem_Btn):SetMonoTone(false)
      else
        ;
        (self._uiProtectItem_Btn):SetIgnore(true)
        ;
        (self._uiProtectItem_Btn):SetMonoTone(true)
      end
    end
    ;
    (self._uiProtectItem_Count):SetText(tostring(haveCount) .. "/" .. tostring(needCount))
    ;
    (self._uiProtectItem_Icon):addInputEvent("Mouse_On", "HandleMOnoutProtectItemToolTip( true )")
    ;
    (self._uiProtectItem_Icon):addInputEvent("Mouse_Out", "HandleMOnoutProtectItemToolTip( false )")
    ;
    (self._uiProtectItem_Icon):setTooltipEventRegistFunc("HandleMOnoutProtectItemToolTip( true )")
  end
end

HandleMOnoutProtectItemToolTip = function(isShow)
  -- function num : 0_5
  local self = PaGlobal_Enchant
  local itemSSW = FromClient_getPreventDownGradeItem()
  if isShow then
    registTooltipControl(self._uiProtectItem_Icon, Panel_Tooltip_Item)
    Panel_Tooltip_Item_Show(itemSSW, self._uiProtectItem_Icon, true, false, nil, nil, nil)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end

FGlobal_EnchantMaterialSlotCheck = function()
  -- function num : 0_6
  local self = PaGlobal_Enchant
  if (self._uiProtectItem_Btn):IsCheck() then
    if not (self._slotEnchantItem).empty then
      local itemWrapper = getInventoryItemByType((self._slotEnchantItem).inventoryType, (self._slotEnchantItem).slotNo)
      if itemWrapper ~= nil then
        local protectItemSSW = FromClient_getPreventDownGradeItem()
        -- DECOMPILER ERROR at PC29: Confused about usage of register: R3 in 'UnsetPending'

        if protectItemSSW:getName() == (itemWrapper:getStaticStatus()):getName() then
          (self._slotEnchantItem).inventoryType = nil
          -- DECOMPILER ERROR at PC31: Confused about usage of register: R3 in 'UnsetPending'

          ;
          (self._slotEnchantItem).slotNo = nil
          ;
          (self._slotEnchantItem):clearItem()
          -- DECOMPILER ERROR at PC36: Confused about usage of register: R3 in 'UnsetPending'

          ;
          (self._slotEnchantItem).empty = true
          ;
          (self._uiButtonApply):SetIgnore(true)
          ;
          (self._uiButtonApply):SetMonoTone(true)
          ;
          (self._uiButtonApply):SetFontColor((Defines.Color).C_FF626262)
        end
      end
    end
    do
      local itemWrapper = getInventoryItemByType((self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
      if itemWrapper ~= nil then
        local enchantCount = ((itemWrapper:get()):getKey()):getEnchantLevel()
        local itemKey = ((itemWrapper:getStaticStatus()):get())._key
        local needCount = (getEnchantInformation()):getNeedCountPreventDownGradeItem(itemKey)
        local dummy, cronCount = self:protectItemCount()
        ;
        (self._uiProtectItem_Count):SetText(tostring(cronCount) .. "/" .. tostring(needCount))
        Inventory_SetFunctor(EnchantInvenFilerSubItem, EnchantInteractionFromInventory, Enchant_Close, nil)
      end
    end
  end
end

FGlobal_EnchantArrowSet = function(isTop)
  -- function num : 0_7
  local self = PaGlobal_Enchant
  if isTop then
    (self._uiCronDescArrow):SetPosY(232)
  else
    ;
    (self._uiCronDescArrow):SetPosY(210)
    self:SetCronDesc()
  end
  if not self._isCronEnchantOpen then
    (self._uiProtectItem_Desc):SetShow(isTop)
    self:CronDescSetShow(not isTop)
  end
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.CronDescSetShow = function(self, isShow)
  -- function num : 0_8
  (self._uiCron_StackCount):SetShow(isShow)
  ;
  (self._uiCron_ProgressBg):SetShow(isShow)
  ;
  (self._uiCron_Progress):SetShow(isShow)
  ;
  ((self._uiCron_StackGrade)[0]):SetShow(isShow)
  ;
  ((self._uiCron_StackGrade)[1]):SetShow(isShow)
  ;
  ((self._uiCron_StackGrade)[2]):SetShow(isShow)
  ;
  ((self._uiCron_StackGrade)[3]):SetShow(isShow)
  ;
  ((self._uiCron_StackCountValue)[0]):SetShow(isShow)
  ;
  ((self._uiCron_StackCountValue)[1]):SetShow(isShow)
  ;
  ((self._uiCron_StackCountValue)[2]):SetShow(isShow)
  ;
  ((self._uiCron_StackCountValue)[3]):SetShow(isShow)
  ;
  (self._uiCron_AddValue):SetShow(isShow)
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.SetCronDesc = function(self)
  -- function num : 0_9
  local itemWrapper = getInventoryItemByType((self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
  if itemWrapper == nil then
    (self._uiCron_StackCount):SetText("0")
    ;
    (self._uiCron_AddValue):SetText("적용 효과 : 없음")
    ;
    (self._uiCron_Progress):SetProgressRate(0)
    for gradeIndex = 0, 3 do
      ((self._uiCron_StackCountValue)[gradeIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
      ;
      ((self._uiCron_StackGrade)[gradeIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
    end
  else
    do
      local currentEnchantFailCount = itemWrapper:getCronEnchantFailCount()
      if currentEnchantFailCount > 0 then
        local bonusText = ""
        if itemWrapper:getAddedDD() > 0 then
          if bonusText == "" then
            bonusText = bonusText .. "추가 공격 +" .. itemWrapper:getAddedDD()
          else
            bonusText = bonusText .. " | 추가 공격 +" .. itemWrapper:getAddedDD()
          end
        end
        if itemWrapper:getAddedHIT() > 0 then
          if bonusText == "" then
            bonusText = bonusText .. "추가 적중 +" .. itemWrapper:getAddedHIT()
          else
            bonusText = bonusText .. " | 추가 적중 +" .. itemWrapper:getAddedHIT()
          end
        end
        if itemWrapper:getAddedDV() > 0 then
          if bonusText == "" then
            bonusText = bonusText .. "추가 회피 +" .. itemWrapper:getAddedDV()
          else
            bonusText = bonusText .. " | 추가 회피 +" .. itemWrapper:getAddedDV()
          end
        end
        if itemWrapper:getAddedPV() > 0 then
          if bonusText == "" then
            bonusText = bonusText .. "추가 피해 감소 +" .. itemWrapper:getAddedPV()
          else
            bonusText = bonusText .. " | 추가 피해 감소 +" .. itemWrapper:getAddedPV()
          end
        end
        if itemWrapper:getAddedMaxHP() > 0 then
          if bonusText == "" then
            bonusText = bonusText .. "추가 최대 HP +" .. itemWrapper:getAddedMaxHP()
          else
            bonusText = bonusText .. " | 추가 최대 HP +" .. itemWrapper:getAddedMaxHP()
          end
        end
        if itemWrapper:getAddedMaxMP() > 0 then
          if bonusText == "" then
            bonusText = bonusText .. "추가 최대 MP +" .. itemWrapper:getAddedMaxMP()
          else
            bonusText = bonusText .. " | 추가 최대 MP +" .. itemWrapper:getAddedMaxMP()
          end
        end
        if bonusText == "" then
          bonusText = "없음"
        end
        local itemSSW = itemWrapper:getStaticStatus()
        local itemClassifyType = itemSSW:getItemClassify()
        local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
        local startPosX = 294
        local gradeCount = ToClient_GetCronEnchnatInfoCount(itemClassifyType, enchantLevel)
        local lastCount = 0
        local lastIndex = gradeCount - 1
        local cronEnchantSSW = ToClient_GetCronEnchantWrapper(itemClassifyType, enchantLevel, lastIndex)
        local enchantablelastCount = cronEnchantSSW:getCount()
        if currentEnchantFailCount > 0 then
          for gradeIndex = 0, gradeCount - 1 do
            local cronEnchantSSW = ToClient_GetCronEnchantWrapper(itemClassifyType, enchantLevel, gradeIndex)
            local enchantableCount = cronEnchantSSW:getCount()
            ;
            ((self._uiCron_StackGrade)[gradeIndex]):SetShow(true)
            ;
            ((self._uiCron_StackGrade)[gradeIndex]):SetFontColor((Defines.Color).C_FF69BB4C)
            ;
            ((self._uiCron_StackGrade)[gradeIndex]):SetPosX(startPosX + 200 * enchantableCount / enchantablelastCount)
            ;
            ((self._uiCron_StackCountValue)[gradeIndex]):SetShow(true)
            ;
            ((self._uiCron_StackCountValue)[gradeIndex]):SetPosX(startPosX + 200 * enchantableCount / enchantablelastCount)
            ;
            ((self._uiCron_StackCountValue)[gradeIndex]):SetText(enchantableCount)
            ;
            ((self._uiCron_StackCountValue)[gradeIndex]):SetFontColor((Defines.Color).C_FF69BB4C)
            if currentEnchantFailCount < enchantableCount then
              ((self._uiCron_StackCountValue)[gradeIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
              ;
              ((self._uiCron_StackGrade)[gradeIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
            end
            if gradeCount - 1 == gradeIndex then
              lastCount = enchantableCount
            end
          end
        end
        do
          do
            ;
            (self._uiCron_StackCount):SetText(currentEnchantFailCount)
            ;
            (self._uiCron_AddValue):SetText("적용 효과 : " .. bonusText)
            ;
            (self._uiCron_Progress):SetProgressRate(currentEnchantFailCount / lastCount * 100)
            ;
            (self._uiCron_StackCount):SetText("0")
            ;
            (self._uiCron_AddValue):SetText("적용 효과 : 없음")
            ;
            (self._uiCron_Progress):SetProgressRate(0)
            for gradeIndex = 0, 3 do
              ((self._uiCron_StackCountValue)[gradeIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
              ;
              ((self._uiCron_StackGrade)[gradeIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.startEnchant = function(self, isSureSuccess)
  -- function num : 0_10
  audioPostEvent_SystemUi(5, 6)
  audioPostEvent_SystemUi(5, 9)
  self._currentTime = 0
  self._isStartEnchantNormal = isSureSuccess == false
  self._isStartEnchantSureSuccess = isSureSuccess
  ;
  ((self._slotTargetItem).icon):EraseAllEffect()
  ;
  ((self._slotEnchantItem).icon):EraseAllEffect()
  ;
  (self._uiEnchantEffect):EraseAllEffect()
  self._isDoingEnchant = true
  ;
  (self._uiDrasticEnchant):SetIgnore(self._isDoingEnchant)
  ;
  (self._uiMeticulousEnchant):SetIgnore(self._isDoingEnchant)
  ;
  ((self._slotTargetItem).icon):AddEffect("fUI_LimitOver01A", false, 0, 0)
  ;
  ((self._slotEnchantItem).icon):AddEffect("fUI_LimitOver01A", false, 0, 0)
  ;
  (self._uiEnchantEffect):AddEffect("fUI_LimitOver02A", true, 0, 0)
  if self._enchantItemType == 0 then
    (self._uiEnchantEffect):AddEffect("UI_LimitOverLine", false, 0, 0)
    ;
    (self._uiEnchantEffect):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
  elseif self._enchantItemType == 1 then
    (self._uiEnchantEffect):AddEffect("UI_LimitOverLine_Red", false, 0, 0)
    ;
    (self._uiEnchantEffect):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
  end
  ;
  (self._uiButtonSureSuccess):SetIgnore(true)
  ;
  (self._uiButtonApply):EraseAllEffect()
  ;
  (self._uiButtonSureSuccess):EraseAllEffect()
  ;
  (self._uiButtonApply):SetAlpha(1)
  ;
  (self._uiButtonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_CANCEL"))
  ;
  (self._uiButtonApply):SetFontColor((Defines.Color).C_FFC4BEBE)
  ToClient_BlackspiritEnchantStart()
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.doEnchant = function(self)
  -- function num : 0_11
  self._isDoingEnchant = false
  if (self._uiCheckBtn_CronEnchnt):IsCheck() then
    ToClient_ReqUpgradeItem((self._slotEnchantItem).inventoryType, (self._slotEnchantItem).slotNo, (self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
  else
    local checkEasy = (self._uiDrasticEnchant):IsCheck()
    ;
    (getEnchantInformation()):doEnchant(self._isStartEnchantSureSuccess, not checkEasy)
  end
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMClickedSkipEnchant = function(self)
  -- function num : 0_12
  self._isDoingEnchant = false
  if (self._uiCheckBtn_CronEnchnt):IsCheck() then
    ToClient_ReqUpgradeItem((self._slotEnchantItem).inventoryType, (self._slotEnchantItem).slotNo, (self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
  else
    local checkEasy = (self._uiDrasticEnchant):IsCheck()
    ;
    (getEnchantInformation()):doEnchant(false, not checkEasy)
  end
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMClickedSkipPerfectEnchant = function(self)
  -- function num : 0_13
  self._isDoingEnchant = false
  ;
  (getEnchantInformation()):doEnchant(true, false)
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.cancelEnchant = function(self)
  -- function num : 0_14
  self:clear()
  Inventory_SetFunctor(EnchantInvenFilerMainItem, EnchantInteractionFromInventory, Enchant_Close, nil)
  ;
  ((self._slotTargetItem).icon):EraseAllEffect()
  ;
  ((self._slotEnchantItem).icon):EraseAllEffect()
  ;
  (self._uiEnchantEffect):EraseAllEffect()
  ;
  (self._uiButtonSureSuccess):SetFontColor((Defines.Color).C_FF626262)
  ;
  (self._uiButtonApply):SetFontColor((Defines.Color).C_FF626262)
  ;
  (self._uiProtectItem_Btn):SetIgnore(false)
  ;
  (self._uiProtectItem_Btn):SetCheck(false)
  ;
  (self._uiDrasticEnchant):SetIgnore(self._isDoingEnchant)
  ;
  (self._uiMeticulousEnchant):SetIgnore(self._isDoingEnchant)
  ToClient_BlackspiritEnchantCancel()
  ;
  (self._uiCheckBtn_CronEnchnt):SetCheck(false)
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.successEnchant = function(self)
  -- function num : 0_15
  render_setChromaticBlur(40, 1)
  render_setPointBlur(0.05, 0.045)
  render_setColorBypass(0.85, 0.08)
  local itemWrapper = getInventoryItemByType((self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
  local enchantCount = ((itemWrapper:get()):getKey()):getEnchantLevel()
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  local isDifficultyEnchant = (itemWrapper:getStaticStatus()):getEnchantDifficulty()
  if enchantCount >= 0 and enchantCount <= 14 then
    if (CppEnums.EnchantDifficulty).eEnchantDifficulty_Normal == isDifficultyEnchant then
      (self._uiDrasticEnchant):SetShow(true)
      ;
      (self._uiMeticulousEnchant):SetShow(true)
    else
      if (CppEnums.EnchantDifficulty).eEnchantDifficulty_Hard == isDifficultyEnchant then
        (self._uiDrasticEnchant):SetCheck(true)
        ;
        (self._uiMeticulousEnchant):SetCheck(false)
        ;
        (self._uiDrasticEnchant):SetShow(false)
        ;
        (self._uiMeticulousEnchant):SetShow(false)
      end
    end
  else
    ;
    (self._uiDrasticEnchant):SetCheck(true)
    ;
    (self._uiMeticulousEnchant):SetCheck(false)
    ;
    (self._uiDrasticEnchant):SetShow(false)
    ;
    (self._uiMeticulousEnchant):SetShow(false)
  end
  ToClient_BlackspiritEnchantSuccess()
  ;
  (self._uiButtonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DOENCHANT"))
  PaGlobal_Enchant:enchantFailCount()
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.failEnchant = function(self)
  -- function num : 0_16
  ToClient_BlackspiritEnchantFail()
  ;
  (self._uiButtonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DOENCHANT"))
  PaGlobal_Enchant:enchantFailCount()
end

FGlobal_InvenFilterCronEnchant = function()
  -- function num : 0_17
  local self = PaGlobal_Enchant
  if (self._uiCheckBtn_CronEnchnt):IsCheck() then
    if (self._slotTargetItem).empty then
      Inventory_SetFunctor(MainItemFilter_CronEnchant, RclickFunction_CronEnchant, nil, nil)
    else
      if (self._slotEnchantItem).empty then
        self:SetCronStone()
        Inventory_SetFunctor(CronStoneFilter, nil, nil, nil)
      else
        ;
        (self._slotEnchantItem):clearItem()
        self:SetCronStone()
        Inventory_SetFunctor(CronStoneFilter, nil, nil, nil)
      end
    end
  else
    if (self._slotTargetItem).empty then
      Inventory_SetFunctor(EnchantInvenFilerMainItem, EnchantInteractionFromInventory, Enchant_Close, nil)
    else
      local enchantInfo = getEnchantInformation()
      local rv = enchantInfo:SetEnchantSlot((self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
      local itemWrapper = getInventoryItemByType((self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
      if rv ~= 0 and itemWrapper:checkToUpgradeItem() then
        self:clear()
        Inventory_SetFunctor(EnchantInvenFilerMainItem, EnchantInteractionFromInventory, Enchant_Close, nil)
      else
        ;
        (self._slotEnchantItem):clearItem()
        Inventory_SetFunctor(EnchantInvenFilerSubItem, EnchantInteractionFromInventory, Enchant_Close, nil)
      end
    end
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.SetCronStone = function(self)
  -- function num : 0_18
  if getSelfPlayer() ~= nil then
    local protectItemSSW = FromClient_getPreventDownGradeItem()
    local selfPlayer = (getSelfPlayer()):get()
    local invenUseSize = selfPlayer:getInventorySlotCount(false)
    local useStartSlot = inventorySlotNoUserStart()
    for idx = useStartSlot, invenUseSize - 1 do
      local cronItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, idx)
      if cronItemWrapper ~= nil then
        local itemSSW = cronItemWrapper:getStaticStatus()
        local itemName = itemSSW:getName()
        if protectItemSSW:getName() == itemName then
          (self._slotEnchantItem):setItem(cronItemWrapper)
          -- DECOMPILER ERROR at PC40: Confused about usage of register: R12 in 'UnsetPending'

          ;
          (self._slotEnchantItem).slotNo = idx
          -- DECOMPILER ERROR at PC45: Confused about usage of register: R12 in 'UnsetPending'

          ;
          (self._slotEnchantItem).inventoryType = (CppEnums.ItemWhereType).eInventory
          -- DECOMPILER ERROR at PC47: Confused about usage of register: R12 in 'UnsetPending'

          ;
          (self._slotEnchantItem).empty = false
          self:EnableEnchantCheck()
          break
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.EnableEnchantCheck = function(self)
  -- function num : 0_19
  do
    if (self._uiCheckBtn_CronEnchnt):IsCheck() then
      local enableCron = Enchat_CronStoneCountCheck()
      ;
      (self._uiButtonApply):SetIgnore(not enableCron)
      ;
      (self._uiButtonApply):SetMonoTone(not enableCron)
      if enableCron then
        (self._uiButtonApply):SetFontColor((Defines.Color).C_FF96D4FC)
      else
        ;
        (self._uiButtonApply):SetFontColor((Defines.Color).C_FF626262)
      end
    end
    PaGlobal_Enchant:SetTextStartBtn()
  end
end

MainItemFilter_CronEnchant = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_20
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  local needEndurance = ToClient_GetDecreaseMaxEnduranceToUpgradeItem()
  local currentEndurance = (itemWrapper:get()):getEndurance()
  if currentEndurance < needEndurance then
    return true
  end
  return not itemWrapper:checkToUpgradeItem()
end

RclickFunction_CronEnchant = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_21
  local self = PaGlobal_Enchant
  if (self._slotTargetItem).icon then
    audioPostEvent_SystemUi(0, 16)
    ;
    ((self._slotTargetItem).icon):AddEffect("UI_Button_Hide", false, 0, 0)
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._slotTargetItem).empty = false
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._slotTargetItem).slotNo = slotNo
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._slotTargetItem).inventoryType = inventoryType
  itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  local enchantSSW = itemWrapper:getStaticStatus()
  local enchantItemKey = ItemEnchantKey(((enchantSSW:get())._key):getItemKey(), perfectEnchantLevel)
  local perfectEnchantSSW = getItemEnchantStaticStatus(enchantItemKey)
  local enchantItemClassify = (itemWrapper:getStaticStatus()):getItemClassify()
  local isCashItem = ((itemWrapper:getStaticStatus()):get()):isCash()
  local enchantCount = ((itemWrapper:get()):getKey()):getEnchantLevel()
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  self._enchantClassifyValue = enchantItemClassify
  self._isItemKey = ((enchantSSW:get())._key):getItemKey()
  self._isCash = isCashItem
  self._isEnchantLevel = enchantCount
  itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  ;
  (self._slotTargetItem):setItem(itemWrapper)
  if getSelfPlayer() ~= nil then
    local protectItemSSW = FromClient_getPreventDownGradeItem()
    local selfPlayer = (getSelfPlayer()):get()
    local invenUseSize = selfPlayer:getInventorySlotCount(false)
    local useStartSlot = inventorySlotNoUserStart()
    for idx = useStartSlot, invenUseSize - 1 do
      local cronItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, idx)
      if cronItemWrapper ~= nil then
        local itemSSW = cronItemWrapper:getStaticStatus()
        local itemName = itemSSW:getName()
        if protectItemSSW:getName() == itemName then
          (self._slotEnchantItem):setItem(cronItemWrapper)
          self:EnableEnchantCheck()
          break
        end
      end
    end
  end
  do
    self:SetCronDesc()
    Inventory_SetFunctor(CronStoneFilter, nil, nil, nil)
  end
end

Enchat_CronStoneCountCheck = function()
  -- function num : 0_22
  local self = PaGlobal_Enchant
  local dummy, cronCount = self:protectItemCount()
  local itemWrapper = getInventoryItemByType((self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
  if itemWrapper == nil then
    return false
  end
  local itemKey = ((itemWrapper:get()):getKey()):get()
  local needCronCount = (getTemporaryInformationWrapper()):getNeedSourceCountToUpgradeItem(itemKey)
  if (self._uiCheckBtn_CronEnchnt):IsCheck() then
    (self._uiProtectItem_Count):SetText(tostring(cronCount) .. "/" .. tostring(needCronCount))
  end
  if Int64toInt32(needCronCount) <= 0 then
    return false
  end
  if needCronCount <= cronCount then
    return true
  else
    return false
  end
end

EnchantInvenFilerMainItem = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_23
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return true
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    return true
  end
  local needEndurance = ToClient_GetDecreaseMaxEnduranceToUpgradeItem()
  local currentEndurance = (itemWrapper:get()):getEndurance()
  do
    local cronEnchantable = PaGlobal_Enchant._isCronEnchantOpen and ((needEndurance <= currentEndurance and itemWrapper:checkToUpgradeItem()))
    do return (itemWrapper:checkToEnchantItem(false) == false and not cronEnchantable) end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

EnchantInvenFilerSubItem = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_24
  local self = PaGlobal_Enchant
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return true
  end
  if (CppEnums.ItemWhereType).eCashInventory == whereType then
    return true
  end
  local returnValue = true
  if (getEnchantInformation()):checkIsValidSubItem(slotNo) ~= 0 then
    returnValue = true
  else
    returnValue = false
    if (self._slotTargetItem).slotNo == slotNo and (CppEnums.ItemWhereType).eInventory ~= whereType then
      returnValue = true
    end
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    returnValue = true
  end
  return returnValue
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.SetMainAndCronStone = function(self, slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_25
  if not (self._uiCheckBtn_CronEnchnt):IsCheck() then
    (self._uiCheckBtn_CronEnchnt):SetCheck(true)
    ;
    (self._uiProtectItem_Btn):SetCheck(false)
  end
  if (self._slotTargetItem).empty then
    if (self._slotTargetItem).icon then
      audioPostEvent_SystemUi(0, 16)
      ;
      ((self._slotTargetItem).icon):AddEffect("UI_Button_Hide", false, 0, 0)
    end
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._slotTargetItem).empty = false
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._slotTargetItem).slotNo = slotNo
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._slotTargetItem).inventoryType = inventoryType
    itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    local enchantSSW = itemWrapper:getStaticStatus()
    local enchantItemKey = ItemEnchantKey(((enchantSSW:get())._key):getItemKey(), perfectEnchantLevel)
    local perfectEnchantSSW = getItemEnchantStaticStatus(enchantItemKey)
    local enchantItemClassify = (itemWrapper:getStaticStatus()):getItemClassify()
    local isCashItem = ((itemWrapper:getStaticStatus()):get()):isCash()
    local enchantCount = ((itemWrapper:get()):getKey()):getEnchantLevel()
    local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
    self._enchantClassifyValue = enchantItemClassify
    self._isItemKey = ((enchantSSW:get())._key):getItemKey()
    self._isCash = isCashItem
    self._isEnchantLevel = enchantCount
    itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    ;
    (self._slotTargetItem):setItem(itemWrapper)
    self:SetCronStone()
    Inventory_SetFunctor(CronStoneFilter, nil, nil, nil)
  end
  do
    FGlobal_EnchantArrowSet(false)
  end
end

CronStoneFilter = function()
  -- function num : 0_26
  return true
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.CronEnchantCheck = function(self, itemWrapper)
  -- function num : 0_27
  if (itemWrapper == nil or itemWrapper:checkToUpgradeItem()) and Enchat_CronStoneCountCheck() then
    (self._uiCheckBtn_CronEnchnt):SetIgnore(false)
    ;
    (self._uiCheckBtn_CronEnchnt):SetMonoTone(false)
  else
    ;
    (self._uiCheckBtn_CronEnchnt):SetIgnore(true)
    ;
    (self._uiCheckBtn_CronEnchnt):SetCheck(false)
    ;
    (self._uiCheckBtn_CronEnchnt):SetMonoTone(true)
  end
end

EnchantInteractionFromInventory = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_28
  local self = PaGlobal_Enchant
  local enchantInfo = getEnchantInformation()
  local rv = enchantInfo:SetEnchantSlot(inventoryType, slotNo)
  if rv ~= 0 then
    if itemWrapper ~= nil and itemWrapper:checkToUpgradeItem() and self._isCronEnchantOpen then
      self:SetMainAndCronStone(slotNo, itemWrapper, count, inventoryType)
    end
    return 
  end
  if (self._slotTargetItem).empty then
    if (self._slotTargetItem).icon then
      audioPostEvent_SystemUi(0, 16)
      ;
      ((self._slotTargetItem).icon):AddEffect("UI_Button_Hide", false, 0, 0)
    end
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._slotTargetItem).empty = false
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._slotTargetItem).slotNo = slotNo
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._slotTargetItem).inventoryType = inventoryType
    itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    local enchantSSW = itemWrapper:getStaticStatus()
    local perfectEnchantLevel = ((enchantSSW:get())._key):getEnchantLevel() + 1
    local enchantItemKey = ItemEnchantKey(((enchantSSW:get())._key):getItemKey(), perfectEnchantLevel)
    enchantItemKey:set(((enchantSSW:get())._key):getItemKey(), perfectEnchantLevel)
    local perfectEnchantSSW = getItemEnchantStaticStatus(enchantItemKey)
    local enchantPerfectEndurance = (perfectEnchantSSW:get()):getReduceMaxEnduranceAtPerfectEnchant()
    local isEnchantSafeType = perfectEnchantSSW:getEnchantType()
    local enchantItemClassify = (itemWrapper:getStaticStatus()):getItemClassify()
    local isCashItem = ((itemWrapper:getStaticStatus()):get()):isCash()
    local enchantCount = ((itemWrapper:get()):getKey()):getEnchantLevel()
    local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
    local isDifficultyEnchant = (itemWrapper:getStaticStatus()):getEnchantDifficulty()
    if enchantCount >= 0 and enchantCount <= 14 then
      if (CppEnums.EnchantDifficulty).eEnchantDifficulty_Normal == isDifficultyEnchant then
        local isEasyEnchantTypeCheck = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).EnchantType)
        ;
        (self._uiDrasticEnchant):SetShow(true)
        ;
        (self._uiMeticulousEnchant):SetShow(true)
        ;
        (self._uiDrasticEnchant):SetCheck(not isEasyEnchantTypeCheck)
        ;
        (self._uiMeticulousEnchant):SetCheck(isEasyEnchantTypeCheck)
      else
        do
          do
            if (CppEnums.EnchantDifficulty).eEnchantDifficulty_Hard == isDifficultyEnchant then
              (self._uiDrasticEnchant):SetShow(false)
              ;
              (self._uiMeticulousEnchant):SetShow(false)
              ;
              (self._uiDrasticEnchant):SetCheck(true)
              ;
              (self._uiMeticulousEnchant):SetCheck(false)
            end
            self._enchantClassifyValue = enchantItemClassify
            self._enchantPerfectEnduranceValue = enchantPerfectEndurance
            self._isEnchantSafeTypeValue = isEnchantSafeType
            self._isItemKey = ((enchantSSW:get())._key):getItemKey()
            self._isCash = isCashItem
            self._isEnchantLevel = enchantCount
            if itemWrapper:getNeedEnchantItem(true) == nil then
              (self._uiEnchantFailDesc):SetShow(true)
              self:handleMOnShowHelpDesc(false)
              self._enchantCountValue = enchantCount
            else
              ;
              (self._uiEnchantFailDesc):SetShow(false)
              self:handleMOnShowHelpDesc(true)
              self._enchantCountValue = enchantCount
              self:setNeedPerfectEnchantItemCount(itemWrapper:getNeedEnchantItem(true), enchantCount, enchantItemClassify)
            end
            if self._isContentsEnable then
              self:setProtectItem((enchantSSW:get())._key, enchantCount)
            end
            itemWrapper = getInventoryItemByType(inventoryType, slotNo)
            ;
            (self._slotTargetItem):setItem(itemWrapper)
            Inventory_SetFunctor(EnchantInvenFilerSubItem, EnchantInteractionFromInventory, Enchant_Close, nil)
            self:CronEnchantCheck(itemWrapper)
            -- DECOMPILER ERROR at PC242: Confused about usage of register: R7 in 'UnsetPending'

            if (self._slotEnchantItem).empty then
              (self._slotEnchantItem).empty = false
              -- DECOMPILER ERROR at PC244: Confused about usage of register: R7 in 'UnsetPending'

              ;
              (self._slotEnchantItem).slotNo = slotNo
              -- DECOMPILER ERROR at PC246: Confused about usage of register: R7 in 'UnsetPending'

              ;
              (self._slotEnchantItem).inventoryType = inventoryType
              itemWrapper = getInventoryItemByType(inventoryType, slotNo)
              ;
              (self._slotEnchantItem):setItem(itemWrapper)
              ;
              ((self._slotEnchantItem).icon):EraseAllEffect()
              audioPostEvent_SystemUi(0, 7)
              if ((itemWrapper:get()):getKey()):getItemKey() == 16002 then
                (self._uiEnchantEffect):AddEffect("fUI_Gauge_Blue", true, 0, 0)
                ;
                ((self._slotEnchantItem).icon):AddEffect("fUI_DarkstoneAura02", false, 0, 0)
                ;
                ((self._slotEnchantItem).icon):AddEffect("UI_Button_Hide", false, 0, 0)
                self._enchantItemType = 0
              else
                if ((itemWrapper:get()):getKey()):getItemKey() == 16001 then
                  (self._uiEnchantEffect):AddEffect("fUI_Gauge_Red", true, 0, 0)
                  ;
                  ((self._slotEnchantItem).icon):AddEffect("fUI_DarkstoneAura01", true, 0, 0)
                  ;
                  ((self._slotEnchantItem).icon):AddEffect("UI_Button_Hide", false, 0, 0)
                  self._enchantItemType = 1
                else
                  if ((itemWrapper:get()):getKey()):getItemKey() == 16004 then
                    self:handleMOnShowHelpDesc(false)
                  else
                    if ((itemWrapper:get()):getKey()):getItemKey() == 16005 then
                      self:handleMOnShowHelpDesc(false)
                    end
                  end
                end
              end
            else
              ;
              (UI.ASSERT)(false, "Client data, UI data is Mismatch!!!!!")
              return 
            end
            local enchantable = enchantInfo:IsReadyEnchant() == 0
            do
              local enchantablePerfect = enchantInfo:IsReadyPerfectEnchant() == 0
              ;
              (self._uiButtonApply):EraseAllEffect()
              if enchantable == true then
                (self._uiButtonApply):SetFontColor((Defines.Color).C_FF96D4FC)
              else
                (self._uiButtonApply):SetFontColor((Defines.Color).C_FF626262)
              end
              ;
              (self._uiButtonSureSuccess):EraseAllEffect()
              if enchantablePerfect == true then
                (self._uiButtonSureSuccess):SetFontColor((Defines.Color).C_FF69BB4C)
              else
                (self._uiButtonSureSuccess):SetFontColor((Defines.Color).C_FF626262)
              end
              ;
              (self._uiButtonApply):SetIgnore(enchantable == false)
              ;
              (self._uiButtonApply):SetMonoTone(enchantable == false)
              ;
              (self._uiButtonSureSuccess):SetIgnore(enchantablePerfect == false)
              if enchantable == true then
                self:handleMOnShowHelpDesc(true)
              end
              if (self._isEnchantLevel >= 16 and self._isEnchantSafeTypeValue == 3) or self._enchantClassifyValue == 4 then
                (self._uiProtectItem_Btn):SetIgnore(false)
              else
                (self._uiProtectItem_Btn):SetCheck(false)
                ;
                (self._uiProtectItem_Btn):SetIgnore(true)
              end
              -- DECOMPILER ERROR: 14 unprocessed JMP targets
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.show = function(self)
  -- function num : 0_29
  ((self._slotTargetItem).icon):EraseAllEffect()
  ;
  ((self._slotEnchantItem).icon):EraseAllEffect()
  ;
  (self._uiEnchantEffect):EraseAllEffect()
  ;
  (self._uiProtectItem_Btn):SetCheck(false)
  ;
  (self._uiCheckBtn_CronEnchnt):SetCheck(false)
  FGlobal_EnchantArrowSet(true)
  self:clear()
  Inventory_SetFunctor(EnchantInvenFilerMainItem, EnchantInteractionFromInventory, Enchant_Close, nil)
  FGlobal_SetInventoryDragNoUse(Panel_Window_Enchant)
  ;
  (self._uiEnchantFailDesc):SetShow(false)
  Panel_Window_Enchant:SetShow(true, true)
  audioPostEvent_SystemUi(1, 0)
  InventoryWindow_Show()
  Equipment_PosSaveMemory()
  Panel_Equipment:SetShow(true, true)
  Panel_Equipment:SetPosX(10)
  Panel_Equipment:SetPosY(getScreenSizeY() - getScreenSizeY() / 2 - Panel_Equipment:GetSizeY() / 2)
  self._btnMouseOnCount = 0
  self._enchantHelpDesc = ""
  Panel_Window_Enchant:SetEnableArea(0, 0, 530, 25)
  if self._isContentsEnable then
    self:setProtectItem()
  end
  ;
  (self._uiProtectItem_BG):SetShow(self._isContentsEnable)
  ;
  (self._uiProtectItem_Icon):SetShow(self._isContentsEnable)
  ;
  (self._uiProtectItem_Count):SetShow(self._isContentsEnable)
  ;
  (self._uiProtectItem_Btn):SetShow(self._isContentsEnable)
  ;
  (self._uiButtonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DOENCHANT"))
  ;
  (self._uiButtonSureSuccess):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_WIN_ENCHANT_GOGOGO"))
  if self._isContentsEnable then
    (self._uiEnchantFailDesc):SetSpanSize(((self._uiEnchantFailDesc):GetSpanSize()).x, 120)
  else
    ;
    (self._uiEnchantFailDesc):SetSpanSize(((self._uiEnchantFailDesc):GetSpanSize()).x, 170)
  end
end

FromClient_EnchantResultShow = function(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_30
  local self = PaGlobal_Enchant
  Inventory_SetFunctor(EnchantInvenFilerMainItem, EnchantInteractionFromInventory, Enchant_Close, nil)
  if resultType == 0 then
    self:successEnchant()
    ;
    ((self._slotTargetItem).icon):AddEffect("UI_ItemEnchant01", false, -6, -6)
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_SUCCESSENCHANT"))
  else
    if resultType == 1 then
      self:failEnchant()
    else
      if resultType == 2 then
        self:failEnchant()
      else
        if resultType == 3 then
          self:failEnchant()
        else
          self:failEnchant()
        end
      end
    end
  end
  self:clear()
  local mainInventory = ((getSelfPlayer()):get()):getInventoryByType(mainWhereType)
  if mainInventory:empty(mainSlotNo) == false then
    EnchantInteractionFromInventory(mainSlotNo, nil, 0, mainWhereType)
  end
  local subInventory = ((getSelfPlayer()):get()):getInventoryByType(subWhereType)
  if subInventory:empty(subSlotNo) == false then
    EnchantInteractionFromInventory(subSlotNo, nil, 0, subWhereType)
  end
  PaGlobal_TutorialManager:handleEnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
end

FromClient_UpgradeItem = function(itemWhereType, slotNo)
  -- function num : 0_31
  PaGlobal_Enchant:successEnchant()
  PaGlobal_Enchant:SetCronStone()
  PaGlobal_Enchant:SetCronDesc()
end


