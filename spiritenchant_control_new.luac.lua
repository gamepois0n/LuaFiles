-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\enchant\spiritenchant_control_new.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.willShow = function(self)
  -- function num : 0_0
  self._enchantInfo = getEnchantInformation()
  ;
  (self._enchantInfo):ToClient_clearData()
  if Panel_Window_Socket:GetShow() then
    Panel_Window_Socket:SetShow(false, false)
  end
  SkillAwaken_Close()
  Panel_Join_Close()
  FGlobal_LifeRanking_Close()
  Panel_EnchantExtraction_Close()
  Equipment_PosSaveMemory()
end

-- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchant_Show = function(self)
  -- function num : 0_1
  self:willShow()
  self:showPanel()
  self:showEnchantTab()
end

-- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showTab = function(self)
  -- function num : 0_2
  if self:isEnchantTab() == true then
    self:showEnchantTab()
  else
    self:showCronEnchantTab()
  end
end

-- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantClose = function(self)
  -- function num : 0_3
  if self._isAnimating == true then
    self:handleLUpEnchantApplyButton()
    return 
  end
  self:clearEnchantSlot()
  Equipment_PosLoadMemory()
  InventoryWindow_Close()
  Panel_Equipment:SetShow(false, false)
  ToClient_BlackspiritEnchantClose()
  PaGlobal_TutorialManager:handleCloseEnchantWindow()
  Panel_EnchantExtraction_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
  Panel_Window_Enchant:SetShow(false, false)
end

-- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showEnchantTab = function(self)
  -- function num : 0_4
  self:init_EnchantFrame()
  self:didShowEnchantTab()
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.didShowEnchantTab = function(self)
  -- function num : 0_5
  self._screctExtractIvenType = (self._enchantInfo):ToClient_getVaildSecretExtractionIvenType()
  self:setEnchantFailCount()
  self:setEnable_button_Apply(false)
  self:showScretExtractButton(self._screctExtractIvenType ~= (CppEnums.ItemWhereType).eCount)
  Inventory_SetFunctor(FGlobal_Enchant_FileterForEnchantTarget, FGlobal_Enchant_RClickForTargetItem, closeForEnchant, nil)
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnchantTarget = function(self, slotNo, itemWrapper, inventoryType, resultType, isMonotone)
  -- function num : 0_6
  if (self._enchantInfo):ToClient_setEnchantSlot(inventoryType, slotNo) ~= 0 then
    _PA_LOG("정훈", "PaGlobal_Enchant:setEnchantTarget Error!")
    return false
  end
  self:setItemToSlot((self._ui)._slot_TargetItem, slotNo, itemWrapper, inventoryType)
  local isMaterialInit = false
  if resultType ~= nil and resultType == 0 then
    local resultItemWrapper = getInventoryItemByType(inventoryType, slotNo)
    if resultItemWrapper ~= nil then
      local itemSSW = resultItemWrapper:getStaticStatus()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      if enchantLevel == 15 then
        self._grantItemSlotNo = nil
        self._grantItemWhereType = nil
        self:setEnchantMaterial(true)
        self:didsetEnchantTarget(true)
        return true
      end
    end
  end
  do
    local equipType = (itemWrapper:getStaticStatus()):getItemClassify()
    if (CppEnums.ItemClassifyType).eItemClassify_Accessory == equipType then
      isMonotone = true
    end
    self._grantItemSlotNo = slotNo
    self._grantItemWhereType = inventoryType
    self:didsetEnchantTarget(isMonotone)
    return true
  end
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.didsetEnchantTarget = function(self, isMonotone)
  -- function num : 0_7
  local enchantType = (self._enchantInfo):ToClient_getEnchantType()
  local needCountForPerfectEnchant_s64 = (self._enchantInfo):ToClient_getNeedCountForPerfectEnchant_s64()
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._strForEnchantInfo)._notChecked = self:getStr_EnchantInfo((self._enchantInfo):ToClient_getCurMaxEndura(), (self._enchantInfo):ToClient_getDecMaxEndura(), enchantType)
  local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if itemWrapper == nil then
    return 
  end
  local enchantItemClassify = (itemWrapper:getStaticStatus()):getItemClassify()
  local enchantLevel = ((itemWrapper:get()):getKey()):getEnchantLevel()
  if enchantLevel > 16 or enchantItemClassify == 4 then
    self:setEnable_CheckboxUseCron(true)
    self:setText_NumOfCron((self._enchantInfo):ToClient_getCountProtecMaterial_s64(), (self._enchantInfo):ToClient_getNeedCountForProtect_s64())
    local enduranceDesc = self:getStr_EnchantInfo((self._enchantInfo):ToClient_getCurMaxEndura(), (self._enchantInfo):ToClient_getDecMaxEndura(), enchantType, true)
    -- DECOMPILER ERROR at PC65: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._strForEnchantInfo)._cronChecked = enduranceDesc .. self:getStr_EnchantProtectInfo(enchantType)
  else
    do
      self:setEnable_CheckboxUseCron(false)
      self:setText_NumOfCron(0, 0)
      if toInt64(0, 0) < needCountForPerfectEnchant_s64 then
        self:setEnable_CheckboxForcedEnchant(true)
        local enduranceDesc = self:getStr_EnchantInfo((self._enchantInfo):ToClient_getCurMaxEndura(), (self._enchantInfo):ToClient_getDecMaxEndura(), enchantType, true)
        -- DECOMPILER ERROR at PC102: Confused about usage of register: R8 in 'UnsetPending'

        ;
        (self._strForEnchantInfo)._forcedChecked = enduranceDesc .. self:getStr_PerfectEnchantInfo(needCountForPerfectEnchant_s64, (self._enchantInfo):ToClient_getDecMaxEnduraPerfect())
      else
        do
          self:setEnable_CheckboxForcedEnchant(false)
          if (self._enchantInfo):ToClient_checkIsValidDifficultEnchant() == 0 then
            self:showDifficultEnchantButton(true)
          else
            self:showDifficultEnchantButton(false)
          end
          if ((self._ui)._checkbox_ForcedEnchant):IsCheck() then
            self:setText_EnchantInfo(((self._ui)._checkbox_ForcedEnchant):GetShow())
            self:showNoticeEnchantApply(enchantType)
            self:setEnchantMaterial(isMonotone)
            self:showDifficulty(self._grantItemWhereType, self._grantItemSlotNo)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnchantMaterial = function(self, isMonotone)
  -- function num : 0_8
  local slotNo = (self._enchantInfo):ToClient_getNeedItemSlotNo()
  local inventoryType = (self._enchantInfo):ToClient_getNeedItemWhereType()
  if isMonotone == true or (self._enchantInfo):ToClient_setEnchantSlot(inventoryType, slotNo) ~= 0 then
    self:setItemToSlotMonoTone((self._ui)._slot_EnchantMaterial, (self._enchantInfo):ToClient_getNeedItemStaticInformation())
    self:setEnable_button_Apply(false)
    return 
  end
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  self:setItemToSlot((self._ui)._slot_EnchantMaterial, slotNo, itemWrapper, inventoryType)
  self:didsetEnchantMaterial()
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.didsetEnchantMaterial = function(self)
  -- function num : 0_9
  self:setEnable_button_Apply(true)
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.willStartEnchant = function(self)
  -- function num : 0_10
  if ((self._ui)._checkbox_UseCron):IsCheck() and (self._enchantInfo):ToClient_setPreventDownGradeItem() ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_NOT_ENOUGH_CRONESTONE"))
    return 
  end
  if not ((self._ui)._checkbox_skipEffect):IsCheck() then
    self:startEnchantAnimation()
  else
    self:startEnchant()
  end
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.startEnchantAnimation = function(self)
  -- function num : 0_11
  self:addEnchantEffectToItemSlot(((self._ui)._slot_TargetItem).icon)
  self:addEnchantEffectToItemSlot(((self._ui)._slot_EnchantMaterial).icon)
  if (self._enchantInfo):ToClient_getEquipType() == 0 then
    self:addWeaponEnchantEffect()
  else
    self:addAmorEnchantEffect()
  end
  self:setAsCancelButton()
  ToClient_BlackspiritEnchantStart()
  self._animationTimeStamp = 0
  self._isAnimating = true
  audioPostEvent_SystemUi(5, 6)
  audioPostEvent_SystemUi(5, 9)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.startEnchant = function(self)
  -- function num : 0_12
  self:setAsEnchantButton()
  if Panel_Window_Enchant:IsShow() == true then
    (self._enchantInfo):ToClient_doEnchant(((self._ui)._checkbox_ForcedEnchant):IsCheck(), self:isDifficultEnchant())
  end
  if self._isAnimating == true then
    audioPostEvent_SystemUi(5, 6)
    audioPostEvent_SystemUi(5, 9)
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.didEnchant = function(self, resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_13
  if resultType == (self._enum_EnchantResult)._error then
    ToClient_BlackspiritEnchantCancel()
    self:didsetEnchantMaterial()
    return 
  end
  self:showEnchantResultEffect(resultType)
  self:clearEnchantSlot()
  if self:setEnchantTarget(mainSlotNo, getInventoryItemByType(mainWhereType, mainSlotNo), mainWhereType, resultType, false) == false then
    local itemWrapper = getInventoryItemByType(mainWhereType, mainSlotNo)
    self._isLastEnchant = false
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      -- DECOMPILER ERROR at PC49: Unhandled construct in 'MakeBoolean' P1

      if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() and enchantLevel == 5 then
        self._isLastEnchant = true
      end
    end
    do
      do
        if enchantLevel == 20 then
          self._isLastEnchant = true
        end
        if self._isLastEnchant then
          self:setItemToSlot((self._ui)._slot_TargetItem, mainSlotNo, itemWrapper, mainWhereType)
          ;
          ((self._ui)._statictext_EnchantInfo):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FINALENCHANT"))
        else
          self:clearEnchantSlot()
          self:showTab()
        end
        self:showEnchantResultText(resultType, mainSlotNo, mainWhereType)
      end
    end
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showEnchantResultEffect = function(self, resultType)
  -- function num : 0_14
  if resultType == (self._enum_EnchantResult)._success then
    audioPostEvent_SystemUi(5, 1)
    render_setChromaticBlur(40, 1)
    render_setPointBlur(0.05, 0.045)
    render_setColorBypass(0.85, 0.08)
    self:addEnchantSuccessEffectToItemSlot(((self._ui)._slot_TargetItem).icon)
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_SUCCESSENCHANT"))
    ToClient_BlackspiritEnchantSuccess()
  else
    audioPostEvent_SystemUi(0, 7)
    if resultType == (self._enum_EnchantResult)._broken then
      audioPostEvent_SystemUi(5, 8)
    else
      if resultType == (self._enum_EnchantResult)._gradeDown then
        audioPostEvent_SystemUi(5, 2)
      else
        if resultType == (self._enum_EnchantResult)._fail then
          audioPostEvent_SystemUi(5, 2)
        else
          if resultType == (self._enum_EnchantResult)._failAndPrevent then
            audioPostEvent_SystemUi(5, 2)
          end
        end
      end
    end
    ToClient_BlackspiritEnchantCancel()
  end
  self:didsetEnchantTarget(false)
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.cancelEnchant = function(self)
  -- function num : 0_15
  self._isAnimating = false
  self:removeEnchantEffect()
  self:setAsEnchantButton()
  ToClient_BlackspiritEnchantCancel()
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showCronEnchantTab = function(self)
  -- function num : 0_16
  self:init_CronFrame()
  self:didShowCronEnchantTab()
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.didShowCronEnchantTab = function(self)
  -- function num : 0_17
  self:setEnable_button_Apply(false)
  Inventory_SetFunctor(FGlobal_Enchant_FilterForCronEnchantTarget, FGlobal_Enchant_RClickForCronEnchantItem, closeForEnchant, nil)
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setCronEnchanTarget = function(self, slotNo, itemWrapper, inventoryType, isMonotone)
  -- function num : 0_18
  if (self._enchantInfo):ToClient_setCronEnchantSlot(inventoryType, slotNo) ~= 0 then
    _PA_LOG("정훈", "PaGlobal_Enchant:setCronEnchantTarget Error!")
    return 
  end
  self:setItemToSlot((self._ui)._slot_TargetItem, slotNo, itemWrapper, inventoryType)
  self._grantItemSlotNo = slotNo
  self._grantItemWhereType = inventoryType
  self:didSetCronEnchantTarget(isMonotone)
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.didSetCronEnchantTarget = function(self, isMonotone)
  -- function num : 0_19
  local curStack = (self._enchantInfo):ToClient_getCurStack()
  local maxLevel = (self._enchantInfo):ToClient_getMaxLevel()
  local curLevel = (self._enchantInfo):ToClient_getCurLevel()
  self:setTextCronEnchantState(curLevel, curStack)
  self:setTextStackForNext((self._enchantInfo):ToClient_getNeedStack())
  self:setTextBonusStats((self._enchantInfo):ToClient_getAddedDD(), (self._enchantInfo):ToClient_getAddedHIT(), (self._enchantInfo):ToClient_getAddedDV(), (self._enchantInfo):ToClient_getAddedHDV(), (self._enchantInfo):ToClient_getAddedPV(), (self._enchantInfo):ToClient_getAddedHPV(), (self._enchantInfo):ToClient_getAddedHP(), (self._enchantInfo):ToClient_getAddedMP())
  self:setCronStackProgress(curStack, (self._enchantInfo):ToClient_getStackForLevel(maxLevel - 1))
  self:initCronLevelAndCountText(maxLevel)
  self:setCronEnchantMaterial(isMonotone)
  if maxLevel == curLevel then
    self:setEnable_button_Apply(false)
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setCronEnchantMaterial = function(self, isMonotone)
  -- function num : 0_20
  local slotNo = (self._enchantInfo):ToClient_getCronSlotNo()
  local inventoryType = (self._enchantInfo):ToClient_getCronItemWhereType()
  if isMonotone == true or (self._enchantInfo):ToClient_setCronEnchantSlot(inventoryType, slotNo) ~= 0 then
    self:setItemToSlotMonoTone((self._ui)._slot_EnchantMaterial, FromClient_getPreventDownGradeItem())
    return 
  end
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  self:setItemToSlot((self._ui)._slot_EnchantMaterial, slotNo, itemWrapper, inventoryType)
  self:setNeedCountToMatrialSlot((self._ui)._slot_EnchantMaterial, (self._enchantInfo):ToClient_getNeedCount_s64())
  self:didSetCronEnchantMaterial()
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.didSetCronEnchantMaterial = function(self)
  -- function num : 0_21
  self:setEnable_button_Apply(true)
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.willStartCronEnchant = function(self)
  -- function num : 0_22
  if not ((self._ui)._checkbox_skipEffect):IsCheck() then
    self:startCronEnchantAnimation()
  else
    self:startCronEnchant()
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.startCronEnchantAnimation = function(self)
  -- function num : 0_23
  self:addEnchantEffectToItemSlot(((self._ui)._slot_TargetItem).icon)
  self:addEnchantEffectToItemSlot(((self._ui)._slot_EnchantMaterial).icon)
  self:addAmorEnchantEffect()
  self:setAsCancelButton()
  ToClient_BlackspiritEnchantStart()
  self._animationTimeStamp = 0
  self._isAnimating = true
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.startCronEnchant = function(self)
  -- function num : 0_24
  self:setAsCronEnchantButton()
  if Panel_Window_Enchant:IsShow() == true then
    (self._enchantInfo):ToClient_doCronEnchant()
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.didCronEnchant = function(self, mainWhereType, mainSlotNo, variedCount)
  -- function num : 0_25
  self:clearEnchantSlot()
  self:setCronEnchanTarget(mainSlotNo, getInventoryItemByType(mainWhereType, mainSlotNo), mainWhereType, false)
  self:showCronEnchantEndEffect(variedCount)
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showCronEnchantEndEffect = function(self, variedCount)
  -- function num : 0_26
  audioPostEvent_SystemUi(5, 1)
  render_setChromaticBlur(40, 1)
  render_setPointBlur(0.05, 0.045)
  render_setColorBypass(0.85, 0.08)
  self:addEnchantSuccessEffectToItemSlot(((self._ui)._slot_TargetItem).icon)
  self:showCronEnchantResult(variedCount)
  ToClient_BlackspiritEnchantSuccess()
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.cancelCronEnchant = function(self)
  -- function num : 0_27
  self._isAnimating = false
  self:removeEnchantEffect()
  self:setAsCronEnchantButton()
  ToClient_BlackspiritEnchantCancel()
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.clearEnchantSlot = function(self)
  -- function num : 0_28
  self:clearItemSlot((self._ui)._slot_TargetItem)
  self:clearItemSlot((self._ui)._slot_EnchantMaterial)
  self._grantItemWhereType = nil
  self._grantItemSlotNo = nil
  ;
  (self._enchantInfo):ToClient_clearData()
  ;
  ((self._ui)._difficultyBg):SetShow(false)
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.getStr_EnchantInfo = function(self, curMaxEndura, decEndura, enchantType, isChecked)
  -- function num : 0_29
  local str = nil
  if enchantType == (self._enum_EnchantType)._safe then
    str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT")
  else
    if ((self._ui)._radiobutton_DifficultEnchant):GetShow() and ((self._ui)._radiobutton_DifficultEnchant):IsCheck() then
      decEndura = decEndura * 0.8
    end
    str = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_0", "maxEndurance", tostring(decEndura), "currentEndurance", tostring(curMaxEndura))
    if isChecked == nil then
      if enchantType == (self._enum_EnchantType)._broken or enchantType == (self._enum_EnchantType)._downAndBroken then
        str = str .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_1")
      end
      if enchantType == (self._enum_EnchantType)._gradedown or enchantType == (self._enum_EnchantType)._downAndBroken then
        str = str .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_2")
      end
    end
  end
  return str
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.getStr_EnchantProtectInfo = function(self, enchantType)
  -- function num : 0_30
  if enchantType == (self._enum_EnchantType)._broken or enchantType == (self._enum_EnchantType)._downAndBroken then
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_3") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_4")
  else
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_5") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_4")
  end
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.getStr_PerfectEnchantInfo = function(self, needCount, decEndura)
  -- function num : 0_31
  local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if itemWrapper ~= nil then
    local itemSSW = itemWrapper:getStaticStatus()
    local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
    if enchantLevel > 14 then
      return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT") .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_7", "count", tostring(needCount), "endurance", tostring(decEndura))
    end
  end
  do
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT") .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_6", "count", tostring(needCount), "endurance", tostring(decEndura))
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.getMaterialSlot = function(self)
  -- function num : 0_32
  return (self._ui)._slot_EnchantMaterial
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.getTargetItemSlot = function(self)
  -- function num : 0_33
  return (self._ui)._slot_TargetItem
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.get = function(self)
  -- function num : 0_34
  return self
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantItem_ToItemNo = function(self)
  -- function num : 0_35
  if ((self._ui)._slot_TargetItem).slotNo == nil then
    return nil
  end
  return getTItemNoBySlotNo(((self._ui)._slot_TargetItem).slotNo, false)
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantItem_FromItemWrapper = function(self)
  -- function num : 0_36
  if ((self._ui)._slot_EnchantMaterial).slotNo == nil then
    return nil
  end
  return getInventoryItemByType(((self._ui)._slot_EnchantMaterial).inventoryType, ((self._ui)._slot_EnchantMaterial).slotNo)
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantItem_ToItemWrapper = function(self)
  -- function num : 0_37
  if ((self._ui)._slot_TargetItem).slotNo == nil then
    return nil
  end
  return getInventoryItemByType(((self._ui)._slot_TargetItem).inventoryType, ((self._ui)._slot_TargetItem).slotNo)
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.isEnchantTab = function(self)
  -- function num : 0_38
  return ((self._ui)._radiobutton_EnchantTab):IsCheck()
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.isDifficultEnchant = function(self)
  -- function num : 0_39
  if ((self._ui)._checkbox_ForcedEnchant):IsCheck() == true then
    return false
  end
  return ((self._ui)._radiobutton_DifficultEnchant):IsCheck()
end

closeForEnchant = function()
  -- function num : 0_40
  PaGlobal_Enchant:enchantClose()
end

FGlobal_Enchant_RClickForTargetItem = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_41
  local self = PaGlobal_Enchant
  if self._isAnimating then
    return 
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    return 
  end
  self._isLastEnchant = false
  self:clearEnchantSlot()
  self:showTab()
  self:setEnchantTarget(slotNo, itemWrapper, inventoryType, nil, true)
  Inventory_SetFunctor(FGlobal_Enchant_InvenFilerSubItem, FGlobal_Enchant_RClickMaterialItem, closeForEnchant, nil)
end

FGlobal_Enchant_RClickForCronEnchantItem = function(slotNo, itemWrapper, Count, inventoryType)
  -- function num : 0_42
  local self = PaGlobal_Enchant
  if self._isAnimating then
    return 
  end
  self._isLastEnchant = false
  self:clearEnchantSlot()
  self:showTab()
  self:setCronEnchanTarget(slotNo, itemWrapper, inventoryType, true)
  Inventory_SetFunctor(FGlobal_Enchant_InvenFilerCronItem, FGlobal_Enchant_RClickCronItem, closeForEnchant, nil)
end

FGlobal_Enchant_RClickMaterialItem = function(slotNo, itemWrapper, Count, inventoryType)
  -- function num : 0_43
  local self = PaGlobal_Enchant
  if self._isAnimating then
    return 
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    return 
  end
  self._isLastEnchant = false
  self:clearItemSlot((self._ui)._slot_EnchantMaterial)
  self:setEnchantMaterial()
end

FGlobal_Enchant_RClickCronItem = function(slotNo, itemWrapper, Count, inventoryType)
  -- function num : 0_44
  local self = PaGlobal_Enchant
  if self._isAnimating then
    return 
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    return 
  end
  self._isLastEnchant = false
  self:clearItemSlot((self._ui)._slot_EnchantMaterial)
  self:setCronEnchantMaterial(false)
end

FGlobal_Enchant_FileterForEnchantTarget = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_45
  do
    local itemWrapper = getInventoryItemByType(whereType, slotNo)
    if itemWrapper == nil then
      return true
    end
    if itemWrapper:checkToValksItem() then
      return false
    end
    if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
      return true
    end
    do return itemWrapper:checkToEnchantItem(false) == false end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

FGlobal_Enchant_FilterForCronEnchantTarget = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_46
  do
    local itemWrapper = getInventoryItemByType(whereType, slotNo)
    if itemWrapper == nil then
      return true
    end
    if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
      return true
    end
    do return itemWrapper:checkToUpgradeItem() == false end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

FGlobal_Enchant_InvenFilerSubItem = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_47
  local self = PaGlobal_Enchant
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return true
  end
  if itemWrapper:checkToValksItem() then
    return false
  end
  if (CppEnums.ItemWhereType).eCashInventory == whereType then
    return true
  end
  local returnValue = true
  if slotNo ~= (getEnchantInformation()):ToClient_getNeedItemSlotNo() then
    returnValue = true
  else
    returnValue = false
    if (self._ui)._slot_TargetItem == slotNo and (CppEnums.ItemWhereType).eInventory ~= whereType then
      returnValue = true
    end
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    returnValue = true
  end
  return returnValue
end

FGlobal_Enchant_InvenFilerCronItem = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_48
  local cronItemWrapper = getInventoryItemByType(whereType, slotNo)
  local protectItemSSW = FromClient_getPreventDownGradeItem()
  if cronItemWrapper ~= nil then
    local itemSSW = cronItemWrapper:getStaticStatus()
    local itemName = itemSSW:getName()
    if protectItemSSW:getName() == itemName then
      return false
    end
  end
  do
    return true
  end
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleRUpEnchantSlot = function(self)
  -- function num : 0_49
  if self._isAnimating then
    return 
  end
  self:clearEnchantSlot()
  self:showTab()
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleLUpEnchantTab = function(self)
  -- function num : 0_50
  self:SetCheck_RadioButton((self._ui)._radiobutton_EnchantTab, true)
  self:SetCheck_RadioButton((self._ui)._radiobutton_CronEnchantTab, false)
  self:clearEnchantSlot()
  self:showTab()
end

-- DECOMPILER ERROR at PC146: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleLUpCronTab = function(self)
  -- function num : 0_51
  self:SetCheck_RadioButton((self._ui)._radiobutton_EnchantTab, false)
  self:SetCheck_RadioButton((self._ui)._radiobutton_CronEnchantTab, true)
  self:clearEnchantSlot()
  self:showTab()
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleLUPSecretExtractButton = function(self)
  -- function num : 0_52
  if self._screctExtractIvenType == (CppEnums.ItemWhereType).eCashInventoryBag then
    FGlobal_CashInventoryOpen_ByEnchant()
  end
  Panel_EnchantExtraction_Show()
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleLUpForcedEnchantCheckBox = function(self)
  -- function num : 0_53
  self:setText_EnchantInfo(((self._ui)._checkbox_ForcedEnchant):IsCheck())
  self:showDifficulty(self._grantItemWhereType, self._grantItemSlotNo)
end

-- DECOMPILER ERROR at PC155: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleLUpUseChronBox = function(self)
  -- function num : 0_54
  self:setText_EnchantProtectInfo(((self._ui)._checkbox_UseCron):IsCheck())
end

-- DECOMPILER ERROR at PC158: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleLUpEnchantApplyButton = function(self)
  -- function num : 0_55
  if self:isEnchantTab() == true then
    if self._isAnimating == true then
      self:cancelEnchant()
    else
      local enchantAlert = false
      local failCount = (self._enchantInfo):ToClient_getFailCount()
      local valksCount = (self._enchantInfo):ToClient_getValksCount()
      if failCount + valksCount == 0 then
        if self._grantItemWhereType ~= nil and self._grantItemSlotNo ~= nil then
          local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
          if itemWrapper ~= nil then
            local itemSSW = itemWrapper:getStaticStatus()
            local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
            -- DECOMPILER ERROR at PC48: Unhandled construct in 'MakeBoolean' P1

            if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() and enchantLevel > 0 then
              enchantAlert = true
            end
          end
        end
        do
          if enchantLevel > 15 then
            enchantAlert = true
          end
          if enchantAlert then
            local goEnchant = function()
    -- function num : 0_55_0 , upvalues : self
    self:willStartEnchant()
  end

            local _title = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGETITLE")
            local _content = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGEDESC")
            local messageBoxData = {title = _title, content = _content, functionYes = goEnchant, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
            ;
            (MessageBox.showMessageBox)(messageBoxData)
          else
            do
              do
                self:willStartEnchant()
                self:willStartEnchant()
                if self._isAnimating == true then
                  self:cancelCronEnchant()
                else
                  self:willStartCronEnchant()
                end
                self._resultShowTime = 0
                ;
                ((self._ui)._radiobutton_EnchantTab):SetIgnore(false)
                ;
                ((self._ui)._radiobutton_CronEnchantTab):SetIgnore(false)
                self:setEnable_button_Apply(true)
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC161: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnForceEnchantTooltip = function(self)
  -- function num : 0_56
  local control = (self._ui)._forceEnchantIcon
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FORCEDENCHANTTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FORCEDENCHANTDESC")
  if not ((self._ui)._forceEnchantIcon):IsCheck() then
    name = name .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_ENABLE")
  else
    name = name .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_DISABLE")
  end
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC164: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutForceEnchantTooltip = function(self)
  -- function num : 0_57
  TooltipSimple_Hide()
end

-- DECOMPILER ERROR at PC167: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnCronIconTooltip = function(self)
  -- function num : 0_58
  local control = (self._ui)._useCronIcon
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SAFTYENCHANTTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SAFTYENCHANTDESC")
  if ((self._ui)._useCronIcon):IsCheck() then
    name = name .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_ENABLE")
  else
    name = name .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_DISABLE")
  end
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC170: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutCronIconTooltip = function(self)
  -- function num : 0_59
  TooltipSimple_Hide()
end

-- DECOMPILER ERROR at PC173: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnEnchantMaterialTooltip = function(self)
  -- function num : 0_60
  if ((self._ui)._slot_EnchantMaterial).empty ~= true or CppEnums.TInventorySlotNoUndefined == ((self._ui)._slot_EnchantMaterial).inventoryType then
    local needSSW = nil
    if self:isEnchantTab() == true then
      needSSW = (self._enchantInfo):ToClient_getNeedItemStaticInformation()
    else
      needSSW = FromClient_getPreventDownGradeItem()
    end
    Panel_Tooltip_Item_Show(needSSW, ((self._ui)._slot_EnchantMaterial).icon, true, false)
  else
    do
      Panel_Tooltip_Item_Show_GeneralNormal(1, "Enchant", true)
    end
  end
end

-- DECOMPILER ERROR at PC176: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutEnchantMaterialTooltip = function(self)
  -- function num : 0_61
  if ((self._ui)._slot_EnchantMaterial).empty ~= true or CppEnums.TInventorySlotNoUndefined == ((self._ui)._slot_EnchantMaterial).inventoryType then
    Panel_Tooltip_Item_hideTooltip()
  else
    Panel_Tooltip_Item_Show_GeneralNormal(1, "Enchant", false)
  end
end

-- DECOMPILER ERROR at PC179: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnEnchantTargetTooltip = function(self)
  -- function num : 0_62
  if ((self._ui)._slot_TargetItem).empty == true then
    Panel_Tooltip_Item_Show_GeneralNormal(0, "Enchant", true)
  end
end

-- DECOMPILER ERROR at PC182: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutEnchantTargetTooltip = function(self)
  -- function num : 0_63
  if ((self._ui)._slot_TargetItem).empty == true then
    Panel_Tooltip_Item_Show_GeneralNormal(0, "Enchant", false)
  end
end

-- DECOMPILER ERROR at PC185: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnEasyEnchant = function(self)
  -- function num : 0_64
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DRASTICENCHANT_TITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DRASTICENCHANT_DESC")
  TooltipSimple_Show((self._ui)._radiobutton_EasyEnchant, name, desc)
end

-- DECOMPILER ERROR at PC188: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutEasyEnchant = function(self)
  -- function num : 0_65
  TooltipSimple_Hide()
end

-- DECOMPILER ERROR at PC191: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handlemOnDifficultEnchant = function(self)
  -- function num : 0_66
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_METICULOUSENCHANT_TITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_METICULOUSENCHANT_DESC")
  TooltipSimple_Show((self._ui)._radiobutton_EasyEnchant, name, desc)
end

-- DECOMPILER ERROR at PC194: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutDifficultEnchant = function(self)
  -- function num : 0_67
  TooltipSimple_Hide()
end

-- DECOMPILER ERROR at PC197: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMUpSkipEffect = function(self)
  -- function num : 0_68
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SKIPENCHANT_TOOLTIP_NAME")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SKIPENCHANT_TOOLTIP_DESC")
  TooltipSimple_Show((self._ui)._checkbox_skipEffect, name, desc)
end

-- DECOMPILER ERROR at PC200: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutSkipEffect = function(self)
  -- function num : 0_69
  TooltipSimple_Hide()
end

FromClient_EnchantResultShow = function(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_70
  local self = PaGlobal_Enchant
  self:didEnchant(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  PaGlobal_TutorialManager:handleEnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
end

FromClient_UpgradeItem = function(mainWhereType, mainSlotNo, variedCount)
  -- function num : 0_71
  local self = PaGlobal_Enchant
  self:didCronEnchant(mainWhereType, mainSlotNo, variedCount)
end

FromClient_UpdateEnchantFailCount = function()
  -- function num : 0_72
  if Panel_Window_Enchant:GetShow() then
    PaGlobal_Enchant:setEnchantFailCount()
  end
end

OnScreenEvent = function()
  -- function num : 0_73
  local self = PaGlobal_Enchant
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  Panel_Window_Enchant:SetPosX(sizeX / 2 - Panel_Window_Enchant:GetSizeX() / 2)
  Panel_Window_Enchant:SetPosY(sizeY - (self._const)._poxX_PanelOriginPos - Panel_Window_Enchant:GetSizeY())
  Panel_Window_Enchant:ComputePos()
end

-- DECOMPILER ERROR at PC211: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.SetAnimation = function(self)
  -- function num : 0_74
  ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SUCCESSFINALENCHANT"))
  ;
  ((self._ui)._statictext_EnchantResult):ResetVertexAni()
  ;
  ((self._ui)._statictext_EnchantResult):SetScale(1, 1)
  ;
  ((self._ui)._statictext_EnchantResult):SetSize(250, 20)
  ;
  ((self._ui)._statictext_EnchantResult):ComputePos()
  ;
  ((self._ui)._statictext_EnchantResult):SetVertexAniRun("Ani_Move_Pos_New", true)
  ;
  ((self._ui)._statictext_EnchantResult):SetVertexAniRun("Ani_Scale_New", true)
  self._isResulTextAnimation = true
end

UpdateFunc_checkAnimation = function(deltaTime)
  -- function num : 0_75
  local self = PaGlobal_Enchant
  if self._isAnimating == true then
    self._animationTimeStamp = self._animationTimeStamp + deltaTime
    if (self._const)._effectTime_Enchant <= self._animationTimeStamp then
      self._isAnimating = false
      ;
      ((self._ui)._radiobutton_EnchantTab):SetIgnore(false)
      ;
      ((self._ui)._radiobutton_CronEnchantTab):SetIgnore(false)
      if self:isEnchantTab() == true then
        self:startEnchant()
      else
        self:startCronEnchant()
      end
      return 
    end
    ;
    ((self._ui)._radiobutton_EnchantTab):SetIgnore(true)
    ;
    ((self._ui)._radiobutton_CronEnchantTab):SetIgnore(true)
  end
  if self._isLastEnchant and not self._isResulTextAnimation then
    self:SetAnimation()
  end
  do return  end
  self._isResulTextAnimation = false
  if self._resultTimeCheck then
    self._resultShowTime = self._resultShowTime + deltaTime
    if self._resultShowTime > 5 then
      self._resultShowTime = 0
      self._resultTimeCheck = false
      if ((self._ui)._radiobutton_EnchantTab):IsCheck() then
        self:setEnchantFailCount()
      else
        self:setTextCronEnchantResultState()
      end
    end
  end
end


