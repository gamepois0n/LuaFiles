local _panel = Panel_Window_Enchant_Renew
local EnchantInfo = {
  _ui = {
    stc_title = UI.getChildControl(_panel, "Static_Title"),
    txt_title = nil,
    stc_mainBG = UI.getChildControl(_panel, "Static_MainBG"),
    txt_desc = nil,
    txt_descSub = nil,
    stc_innerBG = UI.getChildControl(_panel, "Static_InnerBG"),
    txt_bonus1 = nil,
    txt_bonus2 = nil,
    txt_bonus1Val = nil,
    txt_bonus2Val = nil,
    txt_totalBonusVal = nil,
    txt_forceEnchantDesc = nil,
    txt_normalEnchantDesc = nil,
    txt_keyGuideSelect = nil,
    stc_enchantArtwork = UI.getChildControl(_panel, "Static_EnchantArtwork"),
    stc_targetSlotBG = nil,
    stc_subjectSlotBG = nil,
    stc_buttonGroupForPad = UI.getChildControl(_panel, "Static_ButtonGroup_ConsoleUI"),
    btn_normal = nil,
    btn_forced = nil,
    txt_keyGuideForced = nil,
    txt_result = nil,
    txt_normalKeyGuide = nil,
    txt_forcedKeyGuide = nil,
    stc_bottomBG = UI.getChildControl(_panel, "Static_Bottom"),
    txt_keyGuideForExit = nil
  },
  _isLastEnchant = nil,
  _enchantInfo = nil,
  _isAnimating = false,
  _forcedEnchant = false,
  _effectTime_Enchant = 6,
  _strForEnchantInfo = {
    _forcedChecked = "",
    _cronChecked = "",
    _notChecked = ""
  },
  _enum_EnchantType = {
    _safe = 0,
    _unsafe = 1,
    _broken = 2,
    _gradedown = 3,
    _downAndBroken = 4
  },
  _enum_EnchantResult = {
    _success = 0,
    _broken = 1,
    _gradedown = 2,
    _fail = 3,
    _failAndPrevent = 4,
    _error = 5
  }
}
local _snappedOnThisPanel = false
function FromClient_luaLoadComplete_EnchantInfo_Init()
  EnchantInfo:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_EnchantInfo_Init")
function EnchantInfo:initialize()
  self._ui.txt_title = UI.getChildControl(self._ui.stc_title, "StaticText_Title")
  self._ui.txt_desc = UI.getChildControl(self._ui.stc_mainBG, "StaticText_DescTitle")
  self._ui.txt_descSub = UI.getChildControl(self._ui.stc_mainBG, "StaticText_DescSub")
  self._ui.txt_descSub:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_descSub:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_IMPROVEMENT_DESC_RENEW"))
  self._ui.txt_bonus1 = UI.getChildControl(self._ui.stc_innerBG, "StaticText_ExtraChance1")
  self._ui.txt_bonus2 = UI.getChildControl(self._ui.stc_innerBG, "StaticText_ExtraChance2")
  self._ui.txt_bonus1Val = UI.getChildControl(self._ui.stc_innerBG, "StaticText_ExtraChance1Val")
  self._ui.txt_bonus2Val = UI.getChildControl(self._ui.stc_innerBG, "StaticText_ExtraChance2Val")
  self._ui.txt_totalBonusVal = UI.getChildControl(self._ui.stc_innerBG, "StaticText_TotalVal")
  self._ui.txt_forceEnchantDesc = UI.getChildControl(self._ui.stc_innerBG, "StaticText_ForceEnchant")
  self._ui.txt_forceEnchantDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_forceEnchantDesc:SetText(self._ui.txt_forceEnchantDesc:GetText())
  self._ui.txt_normalEnchantDesc = UI.getChildControl(self._ui.stc_innerBG, "StaticText_NormalEnchant")
  self._ui.txt_normalEnchantDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_normalEnchantDesc:SetText(self._ui.txt_normalEnchantDesc:GetText())
  self._ui.txt_keyGuideSelect = UI.getChildControl(self._ui.stc_innerBG, "StaticText_KeyGuideSelect")
  self._ui.txt_keyGuideSelect:SetShow(false)
  self._ui.btn_normal = UI.getChildControl(self._ui.stc_buttonGroupForPad, "Button_NormalEnchant")
  self._ui.txt_keyGuideNormal = UI.getChildControl(self._ui.btn_normal, "StaticText_KeyGuideNormal")
  self._ui.btn_forced = UI.getChildControl(self._ui.stc_buttonGroupForPad, "Button_ForceEnchant")
  self._ui.txt_keyGuideForced = UI.getChildControl(self._ui.btn_forced, "StaticText_KeyGuideForce")
  local slotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCash = true
  }
  self._ui.stc_targetSlotBG = UI.getChildControl(self._ui.stc_enchantArtwork, "Static_SlotResult")
  self._ui.slot_targetItem = {}
  SlotItem.new(self._ui.slot_targetItem, "Slot_Target", 0, self._ui.stc_targetSlotBG, slotConfig)
  self._ui.slot_targetItem:createChild()
  self._ui.stc_subjectSlotBG = UI.getChildControl(self._ui.stc_enchantArtwork, "Static_SlotBase")
  self._ui.slot_subjectItem = {}
  SlotItem.new(self._ui.slot_subjectItem, "Slot_Subject", 1, self._ui.stc_subjectSlotBG, slotConfig)
  self._ui.slot_subjectItem:createChild()
  self._ui.txt_result = UI.getChildControl(self._ui.stc_enchantArtwork, "StaticText_ResultText")
  self._ui.txt_result:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_result:SetText(self._ui.txt_result:GetText())
  self._ui.txt_keyGuideForExit = UI.getChildControl(self._ui.stc_bottomBG, "StaticText_KeyGuideCancel_ConsoleUI")
  self:registEventHandler()
  self:registMessageHandler()
end
function EnchantInfo:registEventHandler()
  self._ui.slot_targetItem.icon:addInputEvent("Mouse_RUp", "InputRUp_EnchantInfo_TargetSlot()")
  self._ui.slot_subjectItem.icon:addInputEvent("Mouse_RUp", "InputRUp_EnchantInfo_TargetSlot()")
  self._ui.btn_normal:addInputEvent("Mouse_LUp", "Input_EnchantInfo_TryEnchant(false)")
  self._ui.btn_forced:addInputEvent("Mouse_LUp", "Input_EnchantInfo_TryEnchant(true)")
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "Input_EnchantInfo_TryEnchant(false)")
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "Input_EnchantInfo_TryEnchant(true)")
end
function EnchantInfo:registMessageHandler()
  registerEvent("FromClient_PadSnapChangePanel", "FromClient_EnchantInfo_PadSnapChangePanel")
  registerEvent("EventEnchantResultShow", "FromClient_EnchantInfo_ResultShow")
  registerEvent("FromClient_UpdateEnchantFailCount", "FromClient_EnchantInfo_UpdateBonus")
  registerEvent("FromClient_ConvertEnchantFailItemToCountAck", "FromClient_EnchantInfo_UpdateBonus")
  _panel:RegisterUpdateFunc("FromClient_EnchantInfo_PerFrame")
end
function PaGlobalFunc_EnchantInfo_Open()
  EnchantInfo:open()
end
function PaGlobalFunc_EnchantInfo_GetShow()
  return _panel:GetShow()
end
function EnchantInfo:open()
  _panel:SetShow(true)
  self._ui.txt_keyGuideForExit:SetShow(true)
  self._ui.txt_keyGuideForExit:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GENERIC_KEYGUIDE_XBOX_EXIT"))
  self._enchantInfo = getEnchantInformation()
  self._enchantInfo:ToClient_clearData()
  self:clearItemSlot(self._ui.slot_subjectItem)
  self:clearItemSlot(self._ui.slot_targetItem)
  self._ui.txt_keyGuideNormal:SetMonoTone(true)
  self._ui.txt_keyGuideForced:SetMonoTone(true)
  self._ui.txt_result:SetShow(false)
  self._isAnimating = false
  self:setEnchantFailCount()
  PaGlobalFunc_InventoryInfo_Open()
  ToClient_padSnapSetTargetPanel(Panel_Window_Inventory)
  Inventory_SetFunctor(PaGlobal_EnchantInfo_FilterForEnchantTarget, PaGlobal_EnchantInfo_RClickTarget, nil, nil)
end
function PaGlobalFunc_EnchantInfo_Close()
  EnchantInfo:close()
end
function EnchantInfo:close()
  self:clearEnchantData()
  _panel:SetShow(false)
  if true == PaGlobalFunc_InventoryInfo_GetShow() then
    InventoryWindow_Close()
  end
  Inventory_SetFunctor(nil, nil, nil, nil)
  ToClient_BlackspiritEnchantClose()
end
function PaGlobal_EnchantInfo_FilterForEnchantTarget(slotNo, notUse_itemWrappers, whereType)
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
function PaGlobalFunc_EnchantInfo_FilterForSubject(slotNo, notUse_itemWrappers, whereType)
  local self = EnchantInfo
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
  if slotNo ~= getEnchantInformation():ToClient_getNeedItemSlotNo() then
    returnValue = true
  else
    returnValue = false
    if self._ui.slot_targetItem.slotNo == slotNo and CppEnums.ItemWhereType.eInventory ~= whereType then
      returnValue = true
    end
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    returnValue = true
  end
  return returnValue
end
function PaGlobal_EnchantInfo_RClickTarget(slotNo, itemWrapper, count, inventoryType)
  local self = EnchantInfo
  if self._isAnimating then
    return
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    self:setEnchantFailCount()
    return
  end
  self:setEnchantTarget(slotNo, itemWrapper, inventoryType, nil, true)
  Inventory_SetFunctor(PaGlobalFunc_EnchantInfo_FilterForSubject, PaGlobalFunc_EnchantInfo_RClickSubject, nil, nil)
end
function EnchantInfo:setEnchantTarget(slotNo, itemWrapper, inventoryType, resultType, isMonotone)
  self._enchantInfo = getEnchantInformation()
  self._enchantInfo:ToClient_clearData()
  if 0 ~= self._enchantInfo:ToClient_setEnchantSlot(inventoryType, slotNo) then
    return false
  end
  self:setItemToSlot(self._ui.slot_targetItem, slotNo, itemWrapper, inventoryType)
  local isMaterialInit = false
  if nil ~= resultType and 0 == resultType then
    local resultItemWrapper = getInventoryItemByType(inventoryType, slotNo)
    if nil ~= resultItemWrapper then
      local itemSSW = resultItemWrapper:getStaticStatus()
      local enchantLevel = itemSSW:get()._key:getEnchantLevel()
      if 15 == enchantLevel then
        self._grantItemSlotNo = nil
        self._grantItemWhereType = nil
        self:setEnchantMaterial(true)
        ToClient_padSnapSetTargetPanel(Panel_Window_Inventory)
        return true
      end
    end
  end
  local equipType = itemWrapper:getStaticStatus():getItemClassify()
  local monotone = isMonotone
  if CppEnums.ItemClassifyType.eItemClassify_Accessory == equipType then
    monotone = true
  end
  if not monotone then
    ToClient_padSnapSetTargetPanel(_panel)
  end
  self._grantItemSlotNo = slotNo
  self._grantItemWhereType = inventoryType
  self:evaluateEnchantTarget(monotone)
  self._ui.txt_keyGuideForExit:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GENERIC_KEYGUIDE_XBOX_DISCARD"))
  return true
end
function EnchantInfo:setItemToSlot(uiSlot, slotNo, itemWrapper, inventoryType)
  uiSlot.icon:AddEffect("UI_Button_Hide", false, 0, 0)
  uiSlot.empty = false
  uiSlot.slotNo = slotNo
  uiSlot.inventoryType = inventoryType
  uiSlot.icon:SetMonoTone(false)
  uiSlot:setItem(getInventoryItemByType(inventoryType, slotNo))
end
function EnchantInfo:evaluateEnchantTarget(isMonotone)
  local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if nil == itemWrapper then
    return
  end
  local enchantItemClassify = itemWrapper:getStaticStatus():getItemClassify()
  local enchantLevel = itemWrapper:get():getKey():getEnchantLevel()
  local enchantType = self._enchantInfo:ToClient_getEnchantType()
  if enchantLevel > 16 or 4 == enchantItemClassify then
    local enduranceDesc = self:getStr_EnchantInfo(self._enchantInfo:ToClient_getCurMaxEndura(), self._enchantInfo:ToClient_getDecMaxEndura(), enchantType, true)
    self._strForEnchantInfo._cronChecked = enduranceDesc .. self:getStr_EnchantProtectInfo(enchantType)
  else
  end
  self:setText_EnchantInfo()
  self:setEnchantMaterial(isMonotone)
end
function EnchantInfo:setText_EnchantInfo()
  local enchantType = self._enchantInfo:ToClient_getEnchantType()
  self._strForEnchantInfo._notChecked = self:getStr_EnchantInfo(self._enchantInfo:ToClient_getCurMaxEndura(), self._enchantInfo:ToClient_getDecMaxEndura(), enchantType)
  local enduranceDesc = self:getStr_EnchantInfo(self._enchantInfo:ToClient_getCurMaxEndura(), self._enchantInfo:ToClient_getDecMaxEndura(), enchantType, true)
  self._ui.txt_normalEnchantDesc:SetText(self._strForEnchantInfo._notChecked)
  local needCountForPerfectEnchant_s64 = self._enchantInfo:ToClient_getNeedCountForPerfectEnchant_s64()
  if needCountForPerfectEnchant_s64 > toInt64(0, 0) then
    self._strForEnchantInfo._forcedChecked = self:getStr_PerfectEnchantInfo(needCountForPerfectEnchant_s64, self._enchantInfo:ToClient_getDecMaxEnduraPerfect())
    self._ui.txt_forceEnchantDesc:SetText(self._strForEnchantInfo._forcedChecked)
  else
    self._ui.txt_forceEnchantDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ENCHANT_RENEW_FORCED_DESC"))
  end
end
function PaGlobalFunc_EnchantInfo_OnPadB()
  local self = EnchantInfo
  if self._isAnimating then
    self:cancelEnchant()
    return
  end
  if nil ~= self._ui.slot_targetItem.slotNo or nil ~= self._ui.slot_subjectItem.slotNo then
    self:clearEnchantData()
    ToClient_padSnapSetTargetPanel(Panel_Window_Inventory)
    Inventory_SetFunctor(PaGlobal_EnchantInfo_FilterForEnchantTarget, PaGlobal_EnchantInfo_RClickTarget, nil, nil)
    return false
  else
    self:close()
    return true
  end
end
function EnchantInfo:cancelEnchant()
  self._isAnimating = false
  self:removeEnchantEffect()
end
function EnchantInfo:removeEnchantEffect()
  self._ui.stc_enchantArtwork:EraseAllEffect()
  self._ui.slot_targetItem.icon:EraseAllEffect()
  self._ui.slot_subjectItem.icon:EraseAllEffect()
  ToClient_BlackspiritEnchantCancel()
end
function PaGlobalFunc_EnchantInfo_RClickSubject(slotNo, itemWrapper, count, inventoryType)
  local self = EnchantInfo
  if self._isAnimating then
    return
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    return
  end
  self._isLastEnchant = false
  self:clearItemSlot(self._ui.slot_subjectItem)
  self:setEnchantMaterial(false)
  ToClient_padSnapSetTargetPanel(_panel)
end
function EnchantInfo:setEnchantMaterial(isMonotone)
  local slotNo = self._enchantInfo:ToClient_getNeedItemSlotNo()
  local inventoryType = self._enchantInfo:ToClient_getNeedItemWhereType()
  if true == isMonotone or 0 ~= self._enchantInfo:ToClient_setEnchantSlot(inventoryType, slotNo) then
    self:setItemToSlotMonoTone(self._ui.slot_subjectItem, self._enchantInfo:ToClient_getNeedItemStaticInformation())
    self:enableApplyButton(false)
    self._enchantInfo:materialClearData()
  else
    local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    self:setItemToSlot(self._ui.slot_subjectItem, slotNo, itemWrapper, inventoryType)
    self:enableApplyButton(true)
  end
end
function EnchantInfo:enableApplyButton(isTrue)
  self._ui.btn_normal:SetIgnore(not isTrue)
  self._ui.btn_normal:SetMonoTone(not isTrue)
  self._normalEnchantEnabled = isTrue
  self._forcedEnchantEnabled = false
  if true == isTrue then
    local needCountForPerfectEnchant_s64 = self._enchantInfo:ToClient_getNeedCountForPerfectEnchant_s64()
    local slotNo = self._enchantInfo:ToClient_getNeedItemSlotNo()
    local inventoryType = self._enchantInfo:ToClient_getNeedItemWhereType()
    local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    local itemCount = itemWrapper:get():getCount_s64()
    if needCountForPerfectEnchant_s64 > toInt64(0, 0) and true == self:forcedEnchantIsReady() and nil ~= itemWrapper and needCountForPerfectEnchant_s64 <= itemCount then
      self._ui.btn_forced:SetMonoTone(false)
      self._ui.btn_forced:SetIgnore(false)
      self._ui.txt_keyGuideForced:SetMonoTone(false)
      self._forcedEnchantEnabled = true
    else
      self._ui.btn_forced:SetMonoTone(true)
      self._ui.btn_forced:SetIgnore(true)
      self._ui.txt_keyGuideForced:SetMonoTone(true)
    end
    self._ui.txt_keyGuideNormal:SetMonoTone(false)
  else
    self._ui.btn_forced:SetMonoTone(true)
    self._ui.btn_forced:SetIgnore(true)
    self._ui.txt_keyGuideNormal:SetMonoTone(true)
    self._ui.txt_keyGuideForced:SetMonoTone(true)
  end
end
function EnchantInfo:updateApplyButton()
  local self = EnchantInfo
  self._ui.txt_keyGuideNormal:SetMonoTone(not self._normalEnchantEnabled or not _snappedOnThisPanel)
  self._ui.txt_keyGuideForced:SetMonoTone(not self._forcedEnchantEnabled or not _snappedOnThisPanel)
end
function InputRUp_EnchantInfo_TargetSlot()
  EnchantInfo:clearEnchantData()
  ToClient_padSnapSetTargetPanel(Panel_Window_Inventory)
  Inventory_SetFunctor(PaGlobal_EnchantInfo_FilterForEnchantTarget, PaGlobal_EnchantInfo_RClickTarget, nil, nil)
end
function Input_EnchantInfo_TryEnchant(isForcedEnchant)
  local self = EnchantInfo
  if self._isAnimating then
    self._animationTimeStamp = self._effectTime_Enchant
    self:removeEnchantEffect()
    return
  end
  if nil == self._grantItemWhereType or nil == self._grantItemSlotNo then
    return
  end
  local targetItemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if nil == targetItemWrapper then
    return
  end
  if nil == self._ui.slot_subjectItem or 0 == self._ui.slot_subjectItem.slotNo then
    return
  end
  if true == isForcedEnchant and not self:forcedEnchantIsReady() then
    return
  end
  self._forcedEnchant = isForcedEnchant
  self:tryEnchant()
end
function Input_EnchantInfo_IgnoreGroupMove()
  ToClient_padSnapIgnoreGroupMove()
end
function EnchantInfo:forcedEnchantIsReady()
  local val = self._enchantInfo:ToClient_getNeedCountForPerfectEnchant_s64()
  local targetItemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  return val > toInt64(0, 0) and targetItemWrapper:get():getMaxEndurance() >= self._enchantInfo:ToClient_getDecMaxEnduraPerfect()
end
function EnchantInfo:tryEnchant()
  if self._isAnimating == true then
    return
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
    if 0 == failCount + valksCount then
      if nil ~= self._grantItemWhereType and nil ~= self._grantItemSlotNo then
        if CppEnums.ItemClassifyType.eItemClassify_Accessory == itemSSW:getItemClassify() then
          if enchantLevel > 0 then
            enchantAlert = true
          end
        elseif enchantLevel > 15 then
          enchantAlert = true
        end
      end
      if true == self._forcedEnchant then
        enchantAlert = false
      end
      if enchantAlert then
        local function goEnchant()
          self:startEnchantAnimation()
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
        self:startEnchantAnimation()
      end
    elseif 0 < itemWrapper:getCronEnchantFailCount() and enchantLevel > 17 then
      local function goEnchant()
        self:startEnchantAnimation()
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
      self:startEnchantAnimation()
    end
  end
  self._resultShowTime = 0
end
function EnchantInfo:startEnchant()
  self._enchantInfo:ToClient_doEnchant(self._forcedEnchant, false)
end
function EnchantInfo:startEnchantAnimation()
  self._ui.slot_targetItem.icon:EraseAllEffect()
  self._ui.slot_targetItem.icon:AddEffect("fUI_LimitOver01A", false, 0, 0)
  self._ui.slot_subjectItem.icon:EraseAllEffect()
  self._ui.slot_subjectItem.icon:AddEffect("fUI_LimitOver01A", false, 0, 0)
  if self._enchantInfo:ToClient_getEquipType() == 0 then
    self._ui.stc_enchantArtwork:EraseAllEffect()
    self._ui.stc_enchantArtwork:AddEffect("UI_LimitOverLine_Red", false, 0, 0)
    self._ui.stc_enchantArtwork:AddEffect("fUI_LimitOver02A", true, 0, 0)
    self._ui.stc_enchantArtwork:AddEffect("fUI_LimitOver_Spark", false, 0, 0)
  else
    self._ui.stc_enchantArtwork:EraseAllEffect()
    self._ui.stc_enchantArtwork:AddEffect("UI_LimitOverLine", false, 0, 0)
    self._ui.stc_enchantArtwork:AddEffect("fUI_LimitOver02A", true, 0, 0)
    self._ui.stc_enchantArtwork:AddEffect("fUI_LimitOver_Spark", false, 0, 0)
  end
  ToClient_BlackspiritEnchantStart()
  self._animationTimeStamp = 0
  self._isAnimating = true
  _AudioPostEvent_SystemUiForXBOX(5, 6)
  _AudioPostEvent_SystemUiForXBOX(5, 9)
end
function FromClient_EnchantInfo_UpdateBonus()
  if _panel:GetShow() then
    EnchantInfo:setEnchantFailCount()
  end
end
function EnchantInfo:setEnchantFailCount()
  if nil == self._enchantInfo then
    self._enchantInfo = getEnchantInformation()
    self._enchantInfo:ToClient_clearData()
  end
  local failCount = self._enchantInfo:ToClient_getFailCount()
  self._ui.txt_bonus1:SetShow(true)
  self._ui.txt_bonus2:SetShow(true)
  self._ui.txt_bonus1Val:SetShow(true)
  self._ui.txt_bonus2Val:SetShow(true)
  local valksCount = self._enchantInfo:ToClient_getValksCount()
  if isGameTypeJapan() or isGameTypeRussia() or isGameTypeKorea() then
    self._ui.txt_bonus2:SetShow(true)
    self._ui.txt_bonus2Val:SetShow(true)
  elseif isGameTypeEnglish() then
    self._ui.txt_bonus2:SetShow(false)
    self._ui.txt_bonus2Val:SetShow(false)
  end
  self._ui.txt_bonus1Val:SetText(tostring(failCount))
  self._ui.txt_bonus2Val:SetText(tostring(valksCount))
  self._ui.txt_totalBonusVal:SetText(tostring(failCount + valksCount))
end
function FromClient_EnchantInfo_PerFrame(deltaTime)
  local self = EnchantInfo
  if true == self._isAnimating then
    self._animationTimeStamp = self._animationTimeStamp + deltaTime
    if self._effectTime_Enchant <= self._animationTimeStamp then
      self._isAnimating = false
      self:startEnchant()
      return
    end
  end
  if self._isLastEnchant then
    if not self._isResulTextAnimation then
      self:setAnimation()
    end
    return
  end
  self._isResulTextAnimation = false
  if self._resultTimeCheck then
    self._resultShowTime = self._resultShowTime + deltaTime
    if self._resultShowTime > 5 then
      self._resultShowTime = 0
      self._resultTimeCheck = false
      self._ui.txt_result:SetShow(false)
    end
  end
end
function FromClient_EnchantInfo_PadSnapChangePanel(fromPanel, toPanel)
  if nil ~= toPanel then
    if _panel:GetKey() ~= toPanel:GetKey() then
      _snappedOnThisPanel = false
    else
      _snappedOnThisPanel = true
    end
  end
  if _panel:GetShow(true) then
    EnchantInfo:updateApplyButton()
  end
end
function FromClient_EnchantInfo_ResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  EnchantInfo:afterEnchant(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  PaGlobal_TutorialManager:handleEnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
end
function EnchantInfo:afterEnchant(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  if resultType == self._enum_EnchantResult._error then
    ToClient_BlackspiritEnchantCancel()
    return
  end
  self:showEnchantResultEffect(resultType)
  self:showEnchantResultText(resultType, mainSlotNo, mainWhereType)
  self:clearEnchantData()
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
      self:setItemToSlot(self._ui.slot_targetItem, mainSlotNo, itemWrapper, mainWhereType)
    else
      self:clearEnchantData()
      ToClient_padSnapSetTargetPanel(Panel_Window_Inventory)
      Inventory_SetFunctor(PaGlobal_EnchantInfo_FilterForEnchantTarget, PaGlobal_EnchantInfo_RClickTarget, nil, nil)
    end
  end
end
function EnchantInfo:showEnchantResultEffect(resultType)
  if resultType == self._enum_EnchantResult._success then
    _AudioPostEvent_SystemUiForXBOX(5, 1)
    render_setChromaticBlur(40, 1)
    render_setPointBlur(0.05, 0.045)
    render_setColorBypass(0.85, 0.08)
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_SUCCESSENCHANT"))
    ToClient_BlackspiritEnchantSuccess()
  else
    _AudioPostEvent_SystemUiForXBOX(0, 7)
    if resultType == self._enum_EnchantResult._broken then
      _AudioPostEvent_SystemUiForXBOX(5, 8)
    elseif resultType == self._enum_EnchantResult._gradeDown then
      _AudioPostEvent_SystemUiForXBOX(5, 2)
    elseif resultType == self._enum_EnchantResult._fail then
      _AudioPostEvent_SystemUiForXBOX(5, 2)
    elseif resultType == self._enum_EnchantResult._failAndPrevent then
      _AudioPostEvent_SystemUiForXBOX(5, 2)
    end
    ToClient_BlackspiritEnchantCancel()
  end
  self:evaluateEnchantTarget(false)
end
function EnchantInfo:showEnchantResultText(resultType, mainSlotNo, mainWhereType)
  if resultType == self._enum_EnchantResult._success then
    self._ui.txt_result:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_0"))
    self._ui.txt_result:EraseAllEffect()
    self._ui.txt_result:AddEffect("UI_QustComplete01", false, 0, 0)
  elseif resultType == self._enum_EnchantResult._fail then
    self._ui.txt_result:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_1"))
    self._ui.txt_result:EraseAllEffect()
    self._ui.txt_result:AddEffect("fUI_Enchant_Fail", false, 0, 0)
  elseif resultType == self._enum_EnchantResult._broken then
    self._ui.txt_result:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_2"))
    self._ui.txt_result:EraseAllEffect()
    self._ui.txt_result:AddEffect("fUI_Enchant_Fail", false, 0, 0)
  elseif resultType == self._enum_EnchantResult._gradedown then
    self._ui.txt_result:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_3"))
    self._ui.txt_result:EraseAllEffect()
    self._ui.txt_result:AddEffect("fUI_Enchant_Fail", false, 0, 0)
  elseif resultType == self._enum_EnchantResult._failAndPrevent then
    self._ui.txt_result:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_4"))
    self._ui.txt_result:EraseAllEffect()
    self._ui.txt_result:AddEffect("fUI_Enchant_Fail", false, 0, 0)
  end
  self._ui.txt_result:SetShow(true)
  self._resultFlag = true
  self._resultTimeCheck = true
end
function EnchantInfo:setAnimation()
  self._ui.txt_result:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SUCCESSFINALENCHANT"))
  self._ui.txt_result:ResetVertexAni()
  self._ui.txt_result:SetScale(1, 1)
  self._ui.txt_result:SetSize(250, 20)
  self._ui.txt_result:ComputePos()
  self._ui.txt_result:SetVertexAniRun("Ani_Move_Pos_New", true)
  self._ui.txt_result:SetVertexAniRun("Ani_Scale_New", true)
  self._isResulTextAnimation = true
end
function EnchantInfo:showEffectByResult(resultType, mainSlotNo, mainWhereType)
  if resultType == self._enum_EnchantResult._success then
    local itemWrapper = getInventoryItemByType(mainWhereType, mainSlotNo)
    if nil ~= itemWrapper then
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = itemSSW:get()._key:getEnchantLevel()
      if CppEnums.ItemClassifyType.eItemClassify_Accessory == itemSSW:getItemClassify() then
        self._ui.slot_targetItem.icon:AddEffect("UI_ItemEnchant01", false, -6, -6)
      else
        self._ui.slot_targetItem.icon:AddEffect("UI_ItemEnchant01", false, -6, -6)
      end
    end
  else
    self._ui.slot_targetItem.icon:AddEffect("", false, -6, -6)
  end
end
function EnchantInfo:getStr_EnchantInfo(curMaxEndura, decEndura, enchantType, isChecked)
  local str = ""
  if enchantType == self._enum_EnchantType._safe then
    str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT")
  else
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
function EnchantInfo:getStr_EnchantProtectInfo(enchantType)
  if enchantType == self._enum_EnchantType._broken or enchantType == self._enum_EnchantType._downAndBroken then
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_3") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_4")
  else
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_5") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_4")
  end
end
function EnchantInfo:getStr_PerfectEnchantInfo(needCount, decEndura)
  local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if nil ~= itemWrapper then
    local itemSSW = itemWrapper:getStaticStatus()
    local enchantLevel = itemSSW:get()._key:getEnchantLevel()
    if enchantLevel > 14 then
      return PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT") .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_7", "count", tostring(needCount), "endurance", tostring(decEndura))
    end
  end
  return PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT") .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_6", "count", tostring(needCount), "endurance", tostring(decEndura))
end
function EnchantInfo:clearEnchantData()
  self:clearItemSlot(self._ui.slot_targetItem)
  self:clearItemSlot(self._ui.slot_subjectItem)
  self._grantItemWhereType = nil
  self._grantItemSlotNo = nil
  self._enchantInfo:ToClient_clearData()
  self._ui.txt_keyGuideForExit:SetShow(true)
  self._ui.txt_keyGuideForExit:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GENERIC_KEYGUIDE_XBOX_EXIT"))
  self._ui.txt_keyGuideNormal:SetMonoTone(true)
  self._ui.txt_keyGuideForced:SetMonoTone(true)
  self:setText_EnchantInfo()
  self._ui.txt_normalEnchantDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ENCHANT_RENEW_NORMAL_DESC"))
  self._ui.txt_forceEnchantDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ENCHANT_RENEW_FORCED_DESC"))
end
function EnchantInfo:clearItemSlot(slot)
  slot.inventoryType = nil
  slot.slotNo = nil
  slot:clearItem()
  slot.empty = true
  slot.icon:EraseAllEffect()
end
function EnchantInfo:setItemToSlotMonoTone(slot, itemStaticWrapper)
  slot.icon:AddEffect("UI_Button_Hide", false, 0, 0)
  slot.empty = false
  slot.slotNo = 0
  slot.inventoryType = CppEnums.TInventorySlotNoUndefined
  slot.icon:SetMonoTone(true)
  slot:setItemByStaticStatus(itemStaticWrapper, toInt64(0, 0), 0, false, false, false, 0, 0, nil)
end
