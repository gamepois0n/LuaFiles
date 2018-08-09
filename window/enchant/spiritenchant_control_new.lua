function PaGlobal_Enchant:willShow()
  self._enchantInfo = getEnchantInformation()
  self._enchantInfo:ToClient_clearData()
  if Panel_Window_Socket:GetShow() then
    Panel_Window_Socket:SetShow(false, false)
  end
  SkillAwaken_Close()
  Panel_Join_Close()
  FGlobal_LifeRanking_Close()
  Panel_EnchantExtraction_Close()
  Equipment_PosSaveMemory()
end
function PaGlobal_Enchant:enchant_Show()
  self:willShow()
  self:showPanel()
  self:showEnchantTab()
end
function PaGlobal_Enchant:showTab()
  if self:isEnchantTab() == true then
    self:showEnchantTab()
  else
    self:showCronEnchantTab()
  end
end
function PaGlobal_Enchant:enchantClose()
  if self._isAnimating == true then
    self:handleLUpEnchantApplyButton()
    return
  end
  self:clearEnchantSlot()
  Equipment_PosLoadMemory()
  InventoryWindow_Close()
  if false == _ContentsGroup_RenewUI then
    Panel_Equipment:SetShow(false, false)
  end
  ClothInventory_Close()
  ToClient_BlackspiritEnchantClose()
  PaGlobal_TutorialManager:handleCloseEnchantWindow()
  Panel_EnchantExtraction_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
  Panel_Window_Enchant:SetShow(false, false)
end
function PaGlobal_Enchant:showEnchantTab()
  self:init_EnchantFrame()
  self:didShowEnchantTab(true)
end
function PaGlobal_Enchant:didShowEnchantTab(setButtonApply)
  if nil == self._enchantInfo then
    return
  end
  self._screctExtractIvenType = self._enchantInfo:ToClient_getVaildSecretExtractionIvenType()
  self:setEnchantFailCount()
  if true == setButtonApply then
    self:setEnable_button_Apply(false)
  end
  self:showScretExtractButton(self._screctExtractIvenType ~= CppEnums.ItemWhereType.eCount)
  Inventory_SetFunctor(FGlobal_Enchant_FileterForEnchantTarget, FGlobal_Enchant_RClickForTargetItem, closeForEnchant, nil)
end
function PaGlobal_Enchant:setEnchantTarget(slotNo, itemWrapper, inventoryType, resultType, isMonotone)
  self._enchantInfo = getEnchantInformation()
  self._enchantInfo:ToClient_clearData()
  if 0 ~= self._enchantInfo:ToClient_setEnchantSlot(inventoryType, slotNo) then
    _PA_LOG("\236\160\149\237\155\136", "PaGlobal_Enchant:setEnchantTarget Error!")
    return false
  end
  self:setItemToSlot(self._ui._slot_TargetItem, slotNo, itemWrapper, inventoryType)
  local isMaterialInit = false
  if nil ~= resultType and 0 == resultType then
    local resultItemWrapper = getInventoryItemByType(inventoryType, slotNo)
    if nil ~= resultItemWrapper then
      local itemSSW = resultItemWrapper:getStaticStatus()
      local enchantLevel = itemSSW:get()._key:getEnchantLevel()
      if 15 == enchantLevel then
        self._grantItemSlotNo = nil
        self._grantItemWhereType = nil
        self._materialItemSlotNo = nil
        self._materialItemWhereType = nil
        self._isSetNewPerfectItemMaterial = false
        self:didsetEnchantTarget(true)
        return true
      end
    end
  end
  local materialItemWrapper = getInventoryItemByType(self._materialItemWhereType, self._materialItemSlotNo)
  local isStackMaterial = false
  if nil ~= materialItemWrapper then
    isStackMaterial = materialItemWrapper:getStaticStatus():isStackable()
  end
  local equipType = itemWrapper:getStaticStatus():getItemClassify()
  if CppEnums.ItemClassifyType.eItemClassify_Accessory == equipType and false == isStackMaterial then
    isMonotone = true
  end
  if true == isMonotone then
    self._materialItemSlotNo = nil
    self._materialItemWhereType = nil
    self._isSetNewPerfectItemMaterial = false
  end
  self._grantItemSlotNo = slotNo
  self._grantItemWhereType = inventoryType
  self:didsetEnchantTarget(isMonotone)
  return true
end
function PaGlobal_Enchant:didsetEnchantTarget(isMonotone, isRadioClick)
  local enchantType = self._enchantInfo:ToClient_getEnchantType()
  local needCountForPerfectEnchant_s64 = self._enchantInfo:ToClient_getNeedCountForPerfectEnchant_s64()
  self._strForEnchantInfo._notChecked = self:getStr_EnchantInfo(self._enchantInfo:ToClient_getCurMaxEndura(), self._enchantInfo:ToClient_getDecMaxEndura(), enchantType)
  local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if nil == itemWrapper then
    return
  end
  local enchantItemClassify = itemWrapper:getStaticStatus():getItemClassify()
  local enchantLevel = itemWrapper:get():getKey():getEnchantLevel()
  local isStackLessBlackStone = itemWrapper:getStaticStatus():isNeedStackLessBlackStonForEnchant()
  if (enchantLevel > 16 or 4 == enchantItemClassify) and false == isStackLessBlackStone then
    self:setEnable_CheckboxUseCron(true)
    self:setText_NumOfCron(self._enchantInfo:ToClient_getCountProtecMaterial_s64(), self._enchantInfo:ToClient_getNeedCountForProtect_s64())
    local enduranceDesc = self:getStr_EnchantInfo(self._enchantInfo:ToClient_getCurMaxEndura(), self._enchantInfo:ToClient_getDecMaxEndura(), enchantType, true)
    self._strForEnchantInfo._cronChecked = enduranceDesc .. self:getStr_EnchantProtectInfo(enchantType)
  else
    self:setEnable_CheckboxUseCron(false)
    self:setText_NumOfCron(0, 0)
  end
  if needCountForPerfectEnchant_s64 > toInt64(0, 0) then
    self:setEnable_CheckboxForcedEnchant(true)
    local enduranceDesc = self:getStr_EnchantInfo(self._enchantInfo:ToClient_getCurMaxEndura(), self._enchantInfo:ToClient_getDecMaxEndura(), enchantType, true)
    self._strForEnchantInfo._forcedChecked = enduranceDesc .. self:getStr_PerfectEnchantInfo(needCountForPerfectEnchant_s64, self._enchantInfo:ToClient_getDecMaxEnduraPerfect())
  else
    self:setEnable_CheckboxForcedEnchant(false)
  end
  if self._enchantInfo:ToClient_checkIsValidDifficultEnchant() == 0 then
    self:showDifficultEnchantButton(true)
  else
    self:showDifficultEnchantButton(false)
  end
  if true == self._isSetNewPerfectItemMaterial then
    self:setEnable_CheckboxUseCron(false)
    self:setText_NumOfCron(0, 0)
    self:setEnable_CheckboxForcedEnchant(false)
    self:showDifficultEnchantButton(false)
  end
  self:setText_EnchantInfo(self._ui._checkbox_ForcedEnchant:IsCheck() and self._ui._checkbox_ForcedEnchant:GetShow())
  self:showNoticeEnchantApply(enchantType)
  if nil == isRadioClick then
    self:setEnchantMaterial(isMonotone)
  end
  self:showDifficulty(self._grantItemWhereType, self._grantItemSlotNo)
end
function PaGlobal_Enchant:setEnchantMaterial(isMonotone)
  if true == isMonotone or 0 ~= self._enchantInfo:ToClient_setEnchantSlot(self._materialItemWhereType, self._materialItemSlotNo) then
    self:setItemToSlotMonoTone(self._ui._slot_EnchantMaterial, self._enchantInfo:ToClient_getNeedItemStaticInformation())
    self:setEnable_button_Apply(false)
    self._enchantInfo:materialClearData()
    local newPerfectNeedItem = self._enchantInfo:ToClient_getNeedNewPerfectItemStaticInformation()
    if true == newPerfectNeedItem:isSet() then
      self._isSlotChangeAnimation = true
    else
      self._isSlotChangeAnimation = false
    end
    return
  elseif true == self._isSetNewPerfectItemMaterial then
    if 0 < self._enchantInfo:ToClient_getDecMaxEnduraNewPerfect() then
      local str = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT_PENALTY", "maxEndurance", tostring(self._enchantInfo:ToClient_getDecMaxEnduraNewPerfect()), "currentEndurance", tostring(self._enchantInfo:ToClient_getCurMaxEndura()))
      self._ui._statictext_EnchantInfo:SetText(str)
    else
      self._ui._statictext_EnchantInfo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT"))
    end
  else
    self:setText_EnchantInfo(self._ui._checkbox_ForcedEnchant:IsCheck() and self._ui._checkbox_ForcedEnchant:GetShow())
  end
  self._isSlotChangeAnimation = false
  local itemWrapper = getInventoryItemByType(self._materialItemWhereType, self._materialItemSlotNo)
  self:setItemToSlot(self._ui._slot_EnchantMaterial, self._materialItemSlotNo, itemWrapper, self._materialItemWhereType)
  self:didsetEnchantMaterial()
end
function PaGlobal_Enchant:didsetEnchantMaterial()
  self:setEnable_button_Apply(true)
end
function PaGlobal_Enchant:willStartEnchant()
  if self._ui._checkbox_UseCron:IsCheck() then
    if self._enchantInfo:ToClient_setPreventDownGradeItem() ~= 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_NOT_ENOUGH_CRONESTONE"))
      return
    end
  else
    self._enchantInfo:ToClient_clearPreventDownGradeItem()
  end
  if not self._ui._checkbox_skipEffect:IsCheck() then
    self:startEnchantAnimation()
  else
    self:startEnchant()
  end
end
function PaGlobal_Enchant:startEnchantAnimation()
  self:addEnchantEffectToItemSlot(self._ui._slot_TargetItem.icon)
  self:addEnchantEffectToItemSlot(self._ui._slot_EnchantMaterial.icon)
  if self._enchantInfo:ToClient_getEquipType() == 0 then
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
function PaGlobal_Enchant:startEnchant()
  self:setAsEnchantButton()
  if Panel_Window_Enchant:IsShow() == true then
    self._enchantInfo:ToClient_doEnchant(self._ui._checkbox_ForcedEnchant:IsCheck(), self:isDifficultEnchant())
  end
  if self._isAnimating == true then
    audioPostEvent_SystemUi(5, 6)
    audioPostEvent_SystemUi(5, 9)
  end
end
function PaGlobal_Enchant:didEnchant(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  if resultType == self._enum_EnchantResult._error then
    ToClient_BlackspiritEnchantCancel()
    self:didsetEnchantMaterial()
    return
  end
  self:showEnchantResultEffect(resultType)
  self:clearEnchantSlot()
  if false == self:setEnchantTarget(mainSlotNo, getInventoryItemByType(mainWhereType, mainSlotNo), mainWhereType, resultType, false) then
    local itemWrapper = getInventoryItemByType(mainWhereType, mainSlotNo)
    self._isLastEnchant = false
    if nil ~= itemWrapper then
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = itemSSW:get()._key:getEnchantLevel()
      if CppEnums.ItemClassifyType.eItemClassify_Accessory == itemSSW:getItemClassify() then
        if 5 == enchantLevel then
          self._isLastEnchant = true
        end
      elseif 20 == enchantLevel then
        self._isLastEnchant = true
      end
    end
    if self._isLastEnchant then
      self:setItemToSlot(self._ui._slot_TargetItem, mainSlotNo, itemWrapper, mainWhereType)
      self._ui._statictext_EnchantInfo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FINALENCHANT"))
    else
      self:clearEnchantSlot()
      self:showTab()
    end
  end
  self:showEnchantResultText(resultType, mainSlotNo, mainWhereType)
end
function PaGlobal_Enchant:showEnchantResultEffect(resultType)
  if resultType == self._enum_EnchantResult._success then
    audioPostEvent_SystemUi(5, 1)
    render_setChromaticBlur(40, 1)
    render_setPointBlur(0.05, 0.045)
    render_setColorBypass(0.85, 0.08)
    self:addEnchantSuccessEffectToItemSlot(self._ui._slot_TargetItem.icon)
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_SUCCESSENCHANT"))
    ToClient_BlackspiritEnchantSuccess()
  else
    audioPostEvent_SystemUi(0, 7)
    if resultType == self._enum_EnchantResult._broken then
      audioPostEvent_SystemUi(5, 8)
    elseif resultType == self._enum_EnchantResult._gradeDown then
      audioPostEvent_SystemUi(5, 2)
    elseif resultType == self._enum_EnchantResult._fail then
      audioPostEvent_SystemUi(5, 2)
    elseif resultType == self._enum_EnchantResult._failAndPrevent then
      audioPostEvent_SystemUi(5, 2)
    end
    ToClient_BlackspiritEnchantCancel()
  end
  self:didsetEnchantTarget(false)
end
function PaGlobal_Enchant:cancelEnchant()
  self._isAnimating = false
  self:removeEnchantEffect()
  self:setAsEnchantButton()
  ToClient_BlackspiritEnchantCancel()
end
function PaGlobal_Enchant:showCronEnchantTab()
  self:init_CronFrame()
  self:didShowCronEnchantTab()
end
function PaGlobal_Enchant:didShowCronEnchantTab()
  self:setEnable_button_Apply(false)
  Inventory_SetFunctor(FGlobal_Enchant_FilterForCronEnchantTarget, FGlobal_Enchant_RClickForCronEnchantItem, closeForEnchant, nil)
end
function PaGlobal_Enchant:setCronEnchanTarget(slotNo, itemWrapper, inventoryType, isMonotone, isPromotion)
  if 0 ~= self._enchantInfo:ToClient_setCronEnchantSlot(inventoryType, slotNo) then
    _PA_LOG("\236\160\149\237\155\136", "PaGlobal_Enchant:setCronEnchantTarget Error!")
    return
  end
  self:setItemToSlot(self._ui._slot_TargetItem, slotNo, itemWrapper, inventoryType)
  self._grantItemSlotNo = slotNo
  self._grantItemWhereType = inventoryType
  self:didSetCronEnchantTarget(itemWrapper, isMonotone, isPromotion)
end
function PaGlobal_Enchant:didSetCronEnchantTarget(itemWrapper, isMonotone, isPromotion)
  local curStack = self._enchantInfo:ToClient_getCurStack()
  local maxLevel = self._enchantInfo:ToClient_getMaxLevel()
  local curLevel = self._enchantInfo:ToClient_getCurLevel()
  self:setTextCronEnchantState(curLevel, curStack)
  self:setTextStackForNext(self._enchantInfo:ToClient_getNeedStack())
  self:setTextBonusStats(self._enchantInfo:ToClient_getAddedDD(), self._enchantInfo:ToClient_getAddedHIT(), self._enchantInfo:ToClient_getAddedDV(), self._enchantInfo:ToClient_getAddedHDV(), self._enchantInfo:ToClient_getAddedPV(), self._enchantInfo:ToClient_getAddedHPV(), self._enchantInfo:ToClient_getAddedHP(), self._enchantInfo:ToClient_getAddedMP())
  local nextOptionsSizeY = self._ui._statictext_StackForNext:GetTextSizeY()
  local currentOptionsSizeY = self._ui._statictext_BounsStats:GetTextSizeY()
  self._ui._static_descBG:SetSize(self._ui._static_descBG:GetSizeX(), nextOptionsSizeY + currentOptionsSizeY + 10)
  self._ui._static_descBG:ComputePos()
  self._ui._statictext_BounsStats:SetPosY(self._ui._static_descBG:GetPosY() + 4)
  self._ui._statictext_StackForNext:SetPosY(self._ui._statictext_BounsStats:GetPosY() + self._ui._statictext_BounsStats:GetTextSizeY() + 4)
  local previousLevelStack = self._enchantInfo:ToClient_getStackForLevel(curLevel - 1)
  if 0 == curLevel then
    previousLevelStack = 0
  end
  if maxLevel == curLevel then
    self:setCronStackProgress(1, 1)
  else
    local nextLevelStack = self._enchantInfo:ToClient_getStackForLevel(curLevel)
    self:setCronStackProgress(curStack - previousLevelStack, self._enchantInfo:ToClient_getStackForLevel(curLevel) - previousLevelStack, nextLevelStack - curStack)
  end
  self:initCronLevelAndCountText(maxLevel)
  self:setCronEnchantMaterial(isMonotone, 0)
  if isPromotion then
    self._isPossiblePromotion = false
    PaGlobal_Enchant:setAsCronEnchantButton()
    self:setEnable_button_Apply(true)
    Inventory_SetFunctor(FGlobal_Enchant_InvenFilerCronItem, FGlobal_Enchant_RClickCronItem, closeForEnchant, nil)
  elseif maxLevel == curLevel then
    if itemWrapper:isPossibleCronPromotion() then
      self._isPossiblePromotion = true
      PaGlobal_Enchant:setAsPromotionEnchantButton()
      self:setEnable_button_Apply(true)
    else
      self:setEnable_button_Apply(false)
    end
  end
end
function PaGlobal_Enchant:setCronEnchantMaterial(isMonotone, count)
  local slotNo = self._enchantInfo:ToClient_getCaphRasSlotNo()
  local inventoryType = self._enchantInfo:ToClient_getCaphRasItemWhereType()
  self._enchantInfo:materialClearData()
  if true == isMonotone or 0 ~= self._enchantInfo:ToClient_setCronEnchantSlot(inventoryType, slotNo, count) then
    self:setItemToSlotMonoTone(self._ui._slot_EnchantMaterial, ToClient_getPromotionEnchantItem())
    self._enchantInfo:materialClearData()
    return
  end
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  self:setItemToSlot(self._ui._slot_EnchantMaterial, slotNo, itemWrapper, inventoryType)
  self:setNeedCountToMatrialSlot(self._ui._slot_EnchantMaterial, count)
  self:didSetCronEnchantMaterial()
end
function PaGlobal_Enchant:didSetCronEnchantMaterial()
  self:setEnable_button_Apply(true)
end
function PaGlobal_Enchant:willStartCronEnchant()
  if not self._ui._checkbox_skipEffect:IsCheck() then
    self:startCronEnchantAnimation()
  else
    self:startCronEnchant()
  end
end
function PaGlobal_Enchant:willStartPromotionEnchant()
  if not self._ui._checkbox_skipEffect:IsCheck() then
    self:startCronEnchantAnimation()
  else
    self:startPromotionEnchant()
  end
end
function PaGlobal_Enchant:startCronEnchantAnimation()
  self:addEnchantEffectToItemSlot(self._ui._slot_TargetItem.icon)
  self:addEnchantEffectToItemSlot(self._ui._slot_EnchantMaterial.icon)
  self:addAmorEnchantEffect()
  self:setAsCancelButton()
  ToClient_BlackspiritEnchantStart()
  self._animationTimeStamp = 0
  self._isAnimating = true
  audioPostEvent_SystemUi(5, 6)
  audioPostEvent_SystemUi(5, 9)
end
function PaGlobal_Enchant:startCronEnchant()
  self:setAsCronEnchantButton()
  if Panel_Window_Enchant:IsShow() == true then
    self._enchantInfo:ToClient_doCronEnchant()
  end
end
function PaGlobal_Enchant:startPromotionEnchant()
  self:setAsPromotionEnchantButton()
  if Panel_Window_Enchant:IsShow() == true then
    self._enchantInfo:ToClient_doCronPromotion()
  end
end
function PaGlobal_Enchant:didCronEnchant(mainWhereType, mainSlotNo, variedCount)
  self:clearEnchantSlot()
  self:setCronEnchanTarget(mainSlotNo, getInventoryItemByType(mainWhereType, mainSlotNo), mainWhereType, true, false)
  self:showCronEnchantEndEffect(variedCount)
end
function PaGlobal_Enchant:didCronPromotion(mainWhereType, mainSlotNo)
  Inventory_updateSlotData()
  self:clearEnchantSlot()
  self:setCronEnchanTarget(mainSlotNo, getInventoryItemByType(mainWhereType, mainSlotNo), mainWhereType, true, true)
  self:showCronPromotionEndEffect()
end
function PaGlobal_Enchant:showCronEnchantEndEffect(variedCount)
  audioPostEvent_SystemUi(5, 1)
  render_setChromaticBlur(40, 1)
  render_setPointBlur(0.05, 0.045)
  render_setColorBypass(0.85, 0.08)
  self:addEnchantSuccessEffectToItemSlot(self._ui._slot_TargetItem.icon)
  self:showCronEnchantResult(variedCount)
  ToClient_BlackspiritEnchantSuccess()
end
function PaGlobal_Enchant:showCronPromotionEndEffect(variedCount)
  audioPostEvent_SystemUi(5, 1)
  render_setChromaticBlur(40, 1)
  render_setPointBlur(0.05, 0.045)
  render_setColorBypass(0.85, 0.08)
  self:addEnchantSuccessEffectToItemSlot(self._ui._slot_TargetItem.icon)
  self:showPromotionResult()
  ToClient_BlackspiritEnchantSuccess()
end
function PaGlobal_Enchant:cancelCronEnchant()
  self._isAnimating = false
  self:removeEnchantEffect()
  self:setAsCronEnchantButton()
  ToClient_BlackspiritEnchantCancel()
end
function PaGlobal_Enchant:cancelPromotionEnchant()
  self._isAnimating = false
  self:removeEnchantEffect()
  self:setAsPromotionEnchantButton()
  ToClient_BlackspiritEnchantCancel()
end
function PaGlobal_Enchant:clearEnchantSlot()
  self:clearItemSlot(self._ui._slot_TargetItem)
  self:clearItemSlot(self._ui._slot_EnchantMaterial)
  self._grantItemWhereType = nil
  self._grantItemSlotNo = nil
  self._enchantInfo:ToClient_clearData()
  self._ui._difficultyBg:SetShow(false)
end
function PaGlobal_Enchant:getStr_EnchantInfo(curMaxEndura, decEndura, enchantType, isChecked)
  local str = ""
  if enchantType == self._enum_EnchantType._safe then
    str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT")
  else
    if self._ui._radiobutton_DifficultEnchant:GetShow() and self._ui._radiobutton_DifficultEnchant:IsCheck() then
      decEndura = decEndura * 0.8
    end
    local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
    if nil ~= itemWrapper then
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = itemSSW:get()._key:getEnchantLevel()
      if CppEnums.ItemClassifyType.eItemClassify_Accessory ~= itemSSW:getItemClassify() then
        str = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_0", "maxEndurance", tostring(decEndura), "currentEndurance", tostring(curMaxEndura))
      end
    end
    if nil == isChecked then
      if enchantType == self._enum_EnchantType._broken or enchantType == self._enum_EnchantType._downAndBroken then
        if "" == str then
          str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_1")
        else
          str = str .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_1")
        end
      end
      if enchantType == self._enum_EnchantType._gradedown or enchantType == self._enum_EnchantType._downAndBroken then
        if "" == str then
          str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_2")
        else
          str = str .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_2")
        end
      end
    end
  end
  return str
end
function PaGlobal_Enchant:getStr_EnchantProtectInfo(enchantType)
  if enchantType == self._enum_EnchantType._broken or enchantType == self._enum_EnchantType._downAndBroken then
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_3") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_4")
  else
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_5") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_4")
  end
end
function PaGlobal_Enchant:getStr_PerfectEnchantInfo(needCount, decEndura)
  local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if nil ~= itemWrapper then
    local itemSSW = itemWrapper:getStaticStatus()
    local enchantLevel = itemSSW:get()._key:getEnchantLevel()
    if enchantLevel > 14 then
      return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT") .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_7", "count", tostring(needCount), "endurance", tostring(decEndura))
    end
  end
  return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT") .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_6", "count", tostring(needCount), "endurance", tostring(decEndura))
end
function PaGlobal_Enchant:getMaterialSlot()
  return self._ui._slot_EnchantMaterial
end
function PaGlobal_Enchant:getTargetItemSlot()
  return self._ui._slot_TargetItem
end
function PaGlobal_Enchant:get()
  return self
end
function PaGlobal_Enchant:enchantItem_ToItemNo()
  if nil == self._ui._slot_TargetItem.slotNo then
    return nil
  end
  return (getTItemNoBySlotNo(self._ui._slot_TargetItem.slotNo, false))
end
function PaGlobal_Enchant:enchantItem_FromItemWrapper()
  if nil == self._ui._slot_EnchantMaterial.slotNo then
    return nil
  end
  return (getInventoryItemByType(self._ui._slot_EnchantMaterial.inventoryType, self._ui._slot_EnchantMaterial.slotNo))
end
function PaGlobal_Enchant:enchantItem_ToItemWrapper()
  if nil == self._ui._slot_TargetItem.slotNo then
    return nil
  end
  return (getInventoryItemByType(self._ui._slot_TargetItem.inventoryType, self._ui._slot_TargetItem.slotNo))
end
function PaGlobal_Enchant:isEnchantTab()
  return self._ui._radiobutton_EnchantTab:IsCheck()
end
function PaGlobal_Enchant:isDifficultEnchant()
  if self._ui._checkbox_ForcedEnchant:IsCheck() == true then
    return false
  end
  return self._ui._radiobutton_DifficultEnchant:IsCheck()
end
function closeForEnchant()
  PaGlobal_Enchant:enchantClose()
end
function FGlobal_Enchant_RClickForTargetItem(slotNo, itemWrapper, count, inventoryType)
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
function FGlobal_Enchant_RClickForCronEnchantItem(slotNo, itemWrapper, Count, inventoryType)
  local self = PaGlobal_Enchant
  if self._isAnimating then
    return
  end
  self._isLastEnchant = false
  self:clearEnchantSlot()
  self:showTab()
  self:setCronEnchanTarget(slotNo, itemWrapper, inventoryType, true, false)
  if true == itemWrapper:isPossibleCronPromotion() then
    self._isPossiblePromotion = true
    PaGlobal_Enchant:setAsPromotionEnchantButton()
    self:setEnable_button_Apply(true)
  else
    self._isPossiblePromotion = false
    Inventory_SetFunctor(FGlobal_Enchant_InvenFilerCronItem, FGlobal_Enchant_RClickCronItem, closeForEnchant, nil)
  end
end
function FGlobal_Enchant_RClickMaterialItem(slotNo, itemWrapper, Count, inventoryType)
  local self = PaGlobal_Enchant
  if self._isAnimating then
    return
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    return
  end
  self._isLastEnchant = false
  self:clearItemSlot(self._ui._slot_EnchantMaterial)
  self._materialItemSlotNo = slotNo
  self._materialItemWhereType = inventoryType
  if slotNo == self._enchantInfo:ToClient_getNeedNewPerfectItemSlotNo() and inventoryType == self._enchantInfo:ToClient_getNeedNewPerfectItemWhereType() then
    self._isSetNewPerfectItemMaterial = true
  else
    self._isSetNewPerfectItemMaterial = false
  end
  self:didsetEnchantTarget(false)
end
function FGlobal_Enchant_RClickCronItem(slotNo, itemWrapper, Count, inventoryType)
  local self = PaGlobal_Enchant
  if self._isAnimating then
    return
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    return
  end
  self._isLastEnchant = false
  Panel_NumberPad_Show(true, itemWrapper:get():getCount_s64(), 0, FGlobal_CronEnchant_SetCount)
end
function FGlobal_CronEnchant_SetCount(inputNumber)
  local self = PaGlobal_Enchant
  self:clearItemSlot(self._ui._slot_EnchantMaterial)
  _PA_LOG("\236\157\180\235\172\184\236\162\133", "\236\157\140.....")
  self:setCronEnchantMaterial(false, inputNumber)
end
function FGlobal_Enchant_FileterForEnchantTarget(slotNo, notUse_itemWrappers, whereType)
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if nil == itemWrapper then
    return true
  end
  if itemWrapper:checkToValksItem() then
    return false
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    return true
  end
  return false == itemWrapper:checkToEnchantItem(false)
end
function FGlobal_Enchant_FilterForCronEnchantTarget(slotNo, notUse_itemWrappers, whereType)
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if nil == itemWrapper then
    return true
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    return true
  end
  return false == itemWrapper:checkToUpgradeItem() and false == itemWrapper:isPossibleCronPromotion()
end
function FGlobal_Enchant_InvenFilerSubItem(slotNo, notUse_itemWrappers, whereType)
  local self = PaGlobal_Enchant
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if nil == itemWrapper then
    return true
  end
  if itemWrapper:checkToValksItem() then
    return false
  end
  if CppEnums.ItemWhereType.eCashInventory == whereType then
    return true
  end
  local returnValue = true
  if slotNo == getEnchantInformation():ToClient_getNeedNewPerfectItemSlotNo() then
    returnValue = false
  elseif slotNo ~= getEnchantInformation():ToClient_getNeedItemSlotNo() then
    returnValue = true
  else
    returnValue = false
    if self._ui._slot_TargetItem == slotNo and CppEnums.ItemWhereType.eInventory ~= whereType then
      returnValue = true
    end
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    returnValue = true
  end
  return returnValue
end
function FGlobal_Enchant_InvenFilerCronItem(slotNo, notUse_itemWrappers, whereType)
  local cronItemWrapper = getInventoryItemByType(whereType, slotNo)
  local protectItemSSW = ToClient_getPromotionEnchantItem()
  if nil ~= cronItemWrapper then
    local itemSSW = cronItemWrapper:getStaticStatus()
    local itemName = itemSSW:getName()
    if protectItemSSW:getName() == itemName then
      return false
    end
  end
  return true
end
function PaGlobal_Enchant:handleRUpEnchantSlot()
  if self._isAnimating then
    return
  end
  self:clearEnchantSlot()
  self:showTab()
end
function PaGlobal_Enchant:handleLUpEnchantTab()
  self._enchantInfo = getEnchantInformation()
  self._enchantInfo:ToClient_clearData()
  self:SetCheck_RadioButton(self._ui._radiobutton_EnchantTab, true)
  self:SetCheck_RadioButton(self._ui._radiobutton_CronEnchantTab, false)
  self:clearEnchantSlot()
  self:showTab()
end
function PaGlobal_Enchant:handleLUpCronTab()
  self._enchantInfo = getEnchantInformation()
  self._enchantInfo:ToClient_clearData()
  self:SetCheck_RadioButton(self._ui._radiobutton_EnchantTab, false)
  self:SetCheck_RadioButton(self._ui._radiobutton_CronEnchantTab, true)
  self:clearEnchantSlot()
  self:showTab()
end
function PaGlobal_Enchant:handleLUPSecretExtractButton()
  if self._screctExtractIvenType == CppEnums.ItemWhereType.eCashInventoryBag then
    FGlobal_CashInventoryOpen_ByEnchant()
  end
  Panel_EnchantExtraction_Show()
end
function PaGlobal_Enchant:handleLUpForcedEnchantCheckBox()
  self:setText_EnchantInfo(self._ui._checkbox_ForcedEnchant:IsCheck())
  self:showDifficulty(self._grantItemWhereType, self._grantItemSlotNo)
  if true == self._ui._checkbox_ForcedEnchant:IsCheck() then
    self._ui._statictext_noticeApplyButton:SetShow(false)
  else
    self._ui._statictext_noticeApplyButton:SetShow(self._isShowNoticeApplyButton)
  end
end
function PaGlobal_Enchant:handleLUpUseChronBox()
  self:setText_EnchantProtectInfo(self._ui._checkbox_UseCron:IsCheck())
end
function PaGlobal_Enchant:handleLUpEnchantApplyButton()
  if self:isEnchantTab() == true then
    if self._isAnimating == true then
      self:cancelEnchant()
    else
      local enchantAlert = false
      local failCount = self._enchantInfo:ToClient_getFailCount()
      local valksCount = self._enchantInfo:ToClient_getValksCount()
      local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
      if nil == itemWrapper then
        return
      end
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = itemSSW:get()._key:getEnchantLevel()
      local isStackLessBlackStone = itemSSW:isNeedStackLessBlackStonForEnchant()
      if 0 == failCount + valksCount and false == isStackLessBlackStone then
        if nil ~= self._grantItemWhereType and nil ~= self._grantItemSlotNo then
          if CppEnums.ItemClassifyType.eItemClassify_Accessory == itemSSW:getItemClassify() then
            if enchantLevel > 0 then
              enchantAlert = true
            end
          elseif enchantLevel > 15 then
            enchantAlert = true
          end
        end
        if true == self._ui._checkbox_ForcedEnchant:IsCheck() or true == self._isSetNewPerfectItemMaterial then
          enchantAlert = false
        end
        if enchantAlert then
          local function goEnchant()
            self:willStartEnchant()
          end
          local _title = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGETITLE")
          local _content = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGEDESC")
          local messageBoxData = {
            title = _title,
            content = _content,
            functionYes = goEnchant,
            functionNo = MessageBox_Empty_function,
            priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
          }
          MessageBox.showMessageBox(messageBoxData)
        else
          self:willStartEnchant()
        end
      elseif 0 < itemWrapper:getCronEnchantFailCount() and enchantLevel > 17 and false == self._isSetNewPerfectItemMaterial then
        local function goEnchant()
          self:willStartEnchant()
        end
        local _title = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGETITLE")
        local _content = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CRON_ENERGY_WARNING_DESC_CAPHRAS")
        local messageBoxData = {
          title = _title,
          content = _content,
          functionApply = goEnchant,
          functionCancel = MessageBox_Empty_function,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageBoxData, nil, false, false)
      else
        self:willStartEnchant()
      end
    end
  elseif self._isPossiblePromotion then
    if self._isAnimating == true then
      self:cancelPromotionEnchant()
    else
      local function promotionConfirm()
        self:willStartPromotionEnchant()
      end
      local messageBoxData = {
        title = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGETITLE"),
        content = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PROMOTE_WARNING_CAPHRAS"),
        functionYes = promotionConfirm,
        functionNo = MessageBox_Empty_function
      }
      MessageBox.showMessageBox(messageBoxData)
    end
  elseif self._isAnimating == true then
    self:cancelCronEnchant()
  else
    self:willStartCronEnchant()
  end
  self._resultShowTime = 0
  self._ui._radiobutton_EnchantTab:SetIgnore(false)
  self._ui._radiobutton_CronEnchantTab:SetIgnore(false)
  self:setEnable_button_Apply(true)
end
function PaGlobal_Enchant:handleMOnForceEnchantTooltip()
  local control = self._ui._forceEnchantIcon
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FORCEDENCHANTTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FORCEDENCHANTDESC")
  if not self._ui._forceEnchantIcon:IsCheck() then
    name = name .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_ENABLE")
  else
    name = name .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_DISABLE")
  end
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_Enchant:handleMOutForceEnchantTooltip()
  TooltipSimple_Hide()
end
function PaGlobal_Enchant:handleMOnCronIconTooltip()
  local control = self._ui._useCronIcon
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SAFTYENCHANTTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SAFTYENCHANTDESC")
  if self._ui._useCronIcon:IsCheck() then
    name = name .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_ENABLE")
  else
    name = name .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_DISABLE")
  end
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_Enchant:handleMOutCronIconTooltip()
  TooltipSimple_Hide()
end
function PaGlobal_Enchant:handleMOnEnchantMaterialTooltip()
  self._isSlotChangeMouseOver = true
  if true == self._ui._slot_EnchantMaterial.empty then
  elseif CppEnums.TInventorySlotNoUndefined == self._ui._slot_EnchantMaterial.inventoryType then
    local needSSW
    if self:isEnchantTab() == true then
      needSSW = self._enchantInfo:ToClient_getNeedNewPerfectItemStaticInformation()
      if true == self._slotChangeFlag or false == needSSW:isSet() then
        needSSW = self._enchantInfo:ToClient_getNeedItemStaticInformation()
      end
    else
      needSSW = ToClient_getPromotionEnchantItem()
    end
    Panel_Tooltip_Item_Show(needSSW, self._ui._slot_EnchantMaterial.icon, true, false)
  else
    Panel_Tooltip_Item_Show_GeneralNormal(1, "Enchant", true)
  end
end
function PaGlobal_Enchant:handleMOutEnchantMaterialTooltip()
  self._isSlotChangeMouseOver = false
  if true == self._ui._slot_EnchantMaterial.empty then
  elseif CppEnums.TInventorySlotNoUndefined == self._ui._slot_EnchantMaterial.inventoryType then
    Panel_Tooltip_Item_hideTooltip()
  else
    Panel_Tooltip_Item_Show_GeneralNormal(1, "Enchant", false)
  end
end
function PaGlobal_Enchant:handleMOnEnchantTargetTooltip()
  if true == self._ui._slot_TargetItem.empty then
  else
    Panel_Tooltip_Item_Show_GeneralNormal(0, "Enchant", true)
  end
end
function PaGlobal_Enchant:handleMOutEnchantTargetTooltip()
  if true == self._ui._slot_TargetItem.empty then
  else
    Panel_Tooltip_Item_Show_GeneralNormal(0, "Enchant", false)
  end
end
function PaGlobal_Enchant:handleMOnEasyEnchant()
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DRASTICENCHANT_TITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DRASTICENCHANT_DESC")
  TooltipSimple_Show(self._ui._radiobutton_EasyEnchant, name, desc)
end
function PaGlobal_Enchant:handleMOutEasyEnchant()
  TooltipSimple_Hide()
end
function PaGlobal_Enchant:handlemOnDifficultEnchant()
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_METICULOUSENCHANT_TITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_METICULOUSENCHANT_DESC")
  TooltipSimple_Show(self._ui._radiobutton_EasyEnchant, name, desc)
end
function PaGlobal_Enchant:handleMOutDifficultEnchant()
  TooltipSimple_Hide()
end
function PaGlobal_Enchant:handleMUpSkipEffect()
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SKIPENCHANT_TOOLTIP_NAME")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SKIPENCHANT_TOOLTIP_DESC_CAPHRAS")
  TooltipSimple_Show(self._ui._checkbox_skipEffect, name, desc)
end
function PaGlobal_Enchant:handleMOutSkipEffect()
  TooltipSimple_Hide()
end
function FromClient_EnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  local self = PaGlobal_Enchant
  self:didEnchant(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  PaGlobal_TutorialManager:handleEnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
end
function FromClient_UpgradeItem(mainWhereType, mainSlotNo, variedCount)
  local self = PaGlobal_Enchant
  self:didCronEnchant(mainWhereType, mainSlotNo, variedCount)
  if 0 ~= self._enchantInfo:ToClient_getNeedStack() then
    PaGlobal_Enchant:setEnable_button_Apply(false)
  end
end
function FromClient_PromotionItem(mainWhereType, mainSlotNo)
  local self = PaGlobal_Enchant
  self:didCronPromotion(mainWhereType, mainSlotNo)
  PaGlobal_Enchant:setEnable_button_Apply(false)
end
function FromClient_UpdateEnchantFailCount()
  if Panel_Window_Enchant:GetShow() then
    PaGlobal_Enchant:setEnchantFailCount()
  end
end
function OnScreenEvent()
  local self = PaGlobal_Enchant
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  Panel_Window_Enchant:SetPosX(sizeX / 2 - Panel_Window_Enchant:GetSizeX() / 2)
  Panel_Window_Enchant:SetPosY(sizeY - self._const._poxX_PanelOriginPos - Panel_Window_Enchant:GetSizeY())
  Panel_Window_Enchant:ComputePos()
end
function PaGlobal_Enchant:SetAnimation()
  self._ui._statictext_EnchantResult:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SUCCESSFINALENCHANT"))
  self._ui._statictext_EnchantResult:ResetVertexAni()
  self._ui._statictext_EnchantResult:SetScale(1, 1)
  self._ui._statictext_EnchantResult:SetSize(250, 20)
  self._ui._statictext_EnchantResult:ComputePos()
  self._ui._statictext_EnchantResult:SetVertexAniRun("Ani_Move_Pos_New", true)
  self._ui._statictext_EnchantResult:SetVertexAniRun("Ani_Scale_New", true)
  self._isResulTextAnimation = true
end
function PaGlobal_Enchant:enchatSlotAnimation(flag)
  local control = self._ui._slot_EnchantMaterial.icon
  self:changeSlotIconTexture(self._ui._slot_EnchantMaterial, flag)
  if true == flag then
    local ImageMoveAni = control:addMoveAnimation(0, self._slotChangeMoveTime, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    ImageMoveAni:SetStartPosition(self._ui._slot_EnchantMaterial.icon:GetPosX(), self._ui._slot_EnchantMaterial.icon:GetPosY())
    ImageMoveAni:SetEndPosition(self._ui._slot_EnchantMaterial.icon:GetPosX(), self._ui._slot_EnchantMaterial.icon:GetPosY())
    control:CalcUIAniPos(ImageMoveAni)
    ImageMoveAni:SetDisableWhileAni(true)
  else
    local ImageMoveAni = control:addMoveAnimation(0, self._slotChangeMoveTime, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    ImageMoveAni:SetStartPosition(self._ui._slot_EnchantMaterial.icon:GetPosX(), self._ui._slot_EnchantMaterial.icon:GetPosY())
    ImageMoveAni:SetEndPosition(self._ui._slot_EnchantMaterial.icon:GetPosX(), self._ui._slot_EnchantMaterial.icon:GetPosY())
    control:CalcUIAniPos(ImageMoveAni)
    ImageMoveAni:SetDisableWhileAni(true)
  end
end
function PaGlobal_Enchant:changeSlotIconTexture(control, flag)
  if false == flag then
    self:setItemToSlotMonoTone(control, self._enchantInfo:ToClient_getNeedItemStaticInformation())
  else
    local newPerfectNeedItem = self._enchantInfo:ToClient_getNeedNewPerfectItemStaticInformation()
    if true == newPerfectNeedItem:isSet() then
      self:setItemToSlotMonoTone(control, newPerfectNeedItem)
    end
  end
end
function FGlobal_Enchant_SetTargetItem()
  local self = PaGlobal_Enchant
  if true == self._ui._slot_TargetItem.empty then
    return false
  else
    return true
  end
end
function FromClient_ProtmotionItem(mainWhereType, mainSlotNo, variedCount)
  local self = PaGlobal_Enchant
  self:didCronEnchant(mainWhereType, mainSlotNo, variedCount)
end
function UpdateFunc_checkAnimation(deltaTime)
  local self = PaGlobal_Enchant
  if false == self._isSlotChangeAnimation or true == self._isSlotChangeMouseOver then
    self._slotChangeDelayTime = 0
  else
    self._slotChangeDelayTime = self._slotChangeDelayTime + deltaTime
    if self._slotChangeWaitTime < self._slotChangeDelayTime then
      self:enchatSlotAnimation(self._slotChangeFlag)
      self._slotChangeDelayTime = 0
      self._slotChangeFlag = not self._slotChangeFlag
    end
  end
  if true == self._isAnimating then
    self._animationTimeStamp = self._animationTimeStamp + deltaTime
    if self._const._effectTime_Enchant <= self._animationTimeStamp then
      self._isAnimating = false
      self._ui._radiobutton_EnchantTab:SetIgnore(false)
      self._ui._radiobutton_CronEnchantTab:SetIgnore(false)
      if self:isEnchantTab() == true then
        self:startEnchant()
      elseif self._isPossiblePromotion then
        self:startPromotionEnchant()
      else
        self:startCronEnchant()
      end
      return
    end
    self._ui._radiobutton_EnchantTab:SetIgnore(true)
    self._ui._radiobutton_CronEnchantTab:SetIgnore(true)
  end
  if self._isLastEnchant then
    if not self._isResulTextAnimation then
      self:SetAnimation()
    end
    return
  end
  self._isResulTextAnimation = false
  if self._resultTimeCheck then
    self._resultShowTime = self._resultShowTime + deltaTime
    if self._resultShowTime > 5 then
      self._resultShowTime = 0
      self._resultTimeCheck = false
      if self._ui._radiobutton_EnchantTab:IsCheck() then
        self:setEnchantFailCount()
      else
        self:setTextCronEnchantResultState()
      end
    end
  end
end
