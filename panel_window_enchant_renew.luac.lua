-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\enchant\console\panel_window_enchant_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_Enchant_Renew
local EnchantInfo = {
_ui = {stc_title = (UI.getChildControl)(_panel, "Static_Title"), txt_title = nil, stc_mainBG = (UI.getChildControl)(_panel, "Static_MainBG"), txt_desc = nil, txt_descSub = nil, stc_innerBG = (UI.getChildControl)(_panel, "Static_InnerBG"), txt_bonus1 = nil, txt_bonus2 = nil, txt_bonus1Val = nil, txt_bonus2Val = nil, txt_totalBonusVal = nil, txt_forceEnchantDesc = nil, txt_normalEnchantDesc = nil, txt_keyGuideSelect = nil, stc_enchantArtwork = (UI.getChildControl)(_panel, "Static_EnchantArtwork"), stc_targetSlotBG = nil, stc_subjectSlotBG = nil, stc_buttonGroupForPad = (UI.getChildControl)(_panel, "Static_ButtonGroup_ConsoleUI"), btn_normal = nil, btn_forced = nil, txt_keyGuideForced = nil, txt_result = nil, txt_normalKeyGuide = nil, txt_forcedKeyGuide = nil, stc_bottomBG = (UI.getChildControl)(_panel, "Static_Bottom"), txt_keyGuideForExit = nil}
, _isLastEnchant = nil, _enchantInfo = nil, _isAnimating = false, _forcedEnchant = false, _effectTime_Enchant = 6, 
_strForEnchantInfo = {_forcedChecked = "", _cronChecked = "", _notChecked = ""}
, 
_enum_EnchantType = {_safe = 0, _unsafe = 1, _broken = 2, _gradedown = 3, _downAndBroken = 4}
, 
_enum_EnchantResult = {_success = 0, _broken = 1, _gradedown = 2, _fail = 3, _failAndPrevent = 4, _error = 5}
}
FromClient_luaLoadComplete_EnchantInfo_Init = function()
  -- function num : 0_0 , upvalues : EnchantInfo
  EnchantInfo:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_EnchantInfo_Init")
EnchantInfo.initialize = function(self)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_title = (UI.getChildControl)((self._ui).stc_title, "StaticText_Title")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_desc = (UI.getChildControl)((self._ui).stc_mainBG, "StaticText_DescTitle")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_descSub = (UI.getChildControl)((self._ui).stc_mainBG, "StaticText_DescSub")
  ;
  ((self._ui).txt_descSub):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_descSub):SetText(((self._ui).txt_descSub):GetText())
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_bonus1 = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_ExtraChance1")
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_bonus2 = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_ExtraChance2")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_bonus1Val = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_ExtraChance1Val")
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_bonus2Val = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_ExtraChance2Val")
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_totalBonusVal = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_TotalVal")
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_forceEnchantDesc = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_ForceEnchant")
  ;
  ((self._ui).txt_forceEnchantDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_forceEnchantDesc):SetText(((self._ui).txt_forceEnchantDesc):GetText())
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_normalEnchantDesc = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_NormalEnchant")
  ;
  ((self._ui).txt_normalEnchantDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_normalEnchantDesc):SetText(((self._ui).txt_normalEnchantDesc):GetText())
  -- DECOMPILER ERROR at PC132: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_keyGuideSelect = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_KeyGuideSelect")
  ;
  ((self._ui).txt_keyGuideSelect):SetShow(false)
  -- DECOMPILER ERROR at PC145: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_normal = (UI.getChildControl)((self._ui).stc_buttonGroupForPad, "Button_NormalEnchant")
  -- DECOMPILER ERROR at PC153: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_keyGuideNormal = (UI.getChildControl)((self._ui).btn_normal, "StaticText_KeyGuideNormal")
  -- DECOMPILER ERROR at PC161: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_forced = (UI.getChildControl)((self._ui).stc_buttonGroupForPad, "Button_ForceEnchant")
  -- DECOMPILER ERROR at PC169: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_keyGuideForced = (UI.getChildControl)((self._ui).btn_forced, "StaticText_KeyGuideForce")
  local slotConfig = {createIcon = true, createBorder = false, createCount = true, createEnchant = true, createCash = true}
  -- DECOMPILER ERROR at PC183: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_targetSlotBG = (UI.getChildControl)((self._ui).stc_enchantArtwork, "Static_SlotResult")
  -- DECOMPILER ERROR at PC186: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).slot_targetItem = {}
  ;
  (SlotItem.new)((self._ui).slot_targetItem, "Slot_Target", 0, (self._ui).stc_targetSlotBG, slotConfig)
  ;
  ((self._ui).slot_targetItem):createChild()
  -- DECOMPILER ERROR at PC208: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_subjectSlotBG = (UI.getChildControl)((self._ui).stc_enchantArtwork, "Static_SlotBase")
  -- DECOMPILER ERROR at PC211: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).slot_subjectItem = {}
  ;
  (SlotItem.new)((self._ui).slot_subjectItem, "Slot_Subject", 1, (self._ui).stc_subjectSlotBG, slotConfig)
  ;
  ((self._ui).slot_subjectItem):createChild()
  -- DECOMPILER ERROR at PC233: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_result = (UI.getChildControl)((self._ui).stc_enchantArtwork, "StaticText_ResultText")
  -- DECOMPILER ERROR at PC241: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_keyGuideForExit = (UI.getChildControl)((self._ui).stc_bottomBG, "StaticText_KeyGuideCancel_ConsoleUI")
  self:registEventHandler()
  self:registMessageHandler()
end

EnchantInfo.registEventHandler = function(self)
  -- function num : 0_2 , upvalues : _panel
  (((self._ui).slot_targetItem).icon):addInputEvent("Mouse_RUp", "InputRUp_EnchantInfo_TargetSlot()")
  ;
  (((self._ui).slot_subjectItem).icon):addInputEvent("Mouse_RUp", "InputRUp_EnchantInfo_TargetSlot()")
  ;
  ((self._ui).btn_normal):addInputEvent("Mouse_LUp", "Input_EnchantInfo_ApplyEnchant(false)")
  ;
  ((self._ui).btn_forced):addInputEvent("Mouse_LUp", "Input_EnchantInfo_ApplyEnchant(true)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "Input_EnchantInfo_ApplyEnchant(false)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "Input_EnchantInfo_ApplyEnchant(true)")
end

EnchantInfo.registMessageHandler = function(self)
  -- function num : 0_3 , upvalues : _panel
  registerEvent("EventEnchantResultShow", "FromClient_EnchantInfo_ResultShow")
  registerEvent("FromClient_UpdateEnchantFailCount", "FromClient_EnchantInfo_UpdateBonus")
  _panel:RegisterUpdateFunc("FromClient_EnchantInfo_PerFrame")
end

PaGlobalFunc_EnchantInfo_Open = function()
  -- function num : 0_4 , upvalues : EnchantInfo
  EnchantInfo:open()
end

PaGlobalFunc_EnchantInfo_GetShow = function()
  -- function num : 0_5 , upvalues : _panel
  return _panel:GetShow()
end

EnchantInfo.open = function(self)
  -- function num : 0_6 , upvalues : _panel
  _panel:SetShow(true)
  ;
  ((self._ui).txt_keyGuideForExit):SetShow(true)
  ;
  ((self._ui).txt_keyGuideForExit):SetText("Exit")
  self._enchantInfo = getEnchantInformation()
  ;
  (self._enchantInfo):ToClient_clearData()
  self:clearItemSlot((self._ui).slot_subjectItem)
  self:clearItemSlot((self._ui).slot_targetItem)
  PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideNormal, XBOX_PAD_BUTTON.EMPTY)
  PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideForced, XBOX_PAD_BUTTON.EMPTY)
  ;
  ((self._ui).txt_result):SetShow(false)
  self:setEnable_CheckboxForcedEnchant(true)
  self._isAnimating = false
  self:setEnchantFailCount()
  PaGlobalFunc_InventoryInfo_Open()
  ToClient_setTargetPanel(Panel_Window_Inventory)
  Inventory_SetFunctor(PaGlobal_EnchantInfo_FilterForEnchantTarget, PaGlobal_EnchantInfo_RClickTarget, nil, nil)
end

PaGlobalFunc_EnchantInfo_Close = function()
  -- function num : 0_7 , upvalues : EnchantInfo
  EnchantInfo:close()
end

EnchantInfo.close = function(self)
  -- function num : 0_8 , upvalues : _panel
  self:clearEnchantData()
  _panel:SetShow(false)
  if PaGlobalFunc_InventoryInfo_GetShow() == true then
    InventoryWindow_Close()
  end
  Inventory_SetFunctor(nil, nil, nil, nil)
  ToClient_BlackspiritEnchantClose()
end

PaGlobal_EnchantInfo_FilterForEnchantTarget = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_9
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

PaGlobalFunc_EnchantInfo_FilterForSubject = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_10 , upvalues : EnchantInfo
  local self = EnchantInfo
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
    if ((self._ui).slot_targetItem).slotNo == slotNo and (CppEnums.ItemWhereType).eInventory ~= whereType then
      returnValue = true
    end
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    returnValue = true
  end
  return returnValue
end

PaGlobal_EnchantInfo_RClickTarget = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_11 , upvalues : EnchantInfo
  local self = EnchantInfo
  if self._isAnimating then
    return 
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    return 
  end
  self:setEnchantTarget(slotNo, itemWrapper, inventoryType, nil, true)
  Inventory_SetFunctor(PaGlobalFunc_EnchantInfo_FilterForSubject, PaGlobalFunc_EnchantInfo_RClickSubject, nil, nil)
end

EnchantInfo.setEnchantTarget = function(self, slotNo, itemWrapper, inventoryType, resultType, isMonotone)
  -- function num : 0_12
  self._enchantInfo = getEnchantInformation()
  ;
  (self._enchantInfo):ToClient_clearData()
  if (self._enchantInfo):ToClient_setEnchantSlot(inventoryType, slotNo) ~= 0 then
    return false
  end
  self:setItemToSlot((self._ui).slot_targetItem, slotNo, itemWrapper, inventoryType)
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
        self:evaluateEnchantTarget(true)
        return true
      end
    end
  end
  do
    local equipType = (itemWrapper:getStaticStatus()):getItemClassify()
    local monotone = isMonotone
    if (CppEnums.ItemClassifyType).eItemClassify_Accessory == equipType then
      monotone = true
    end
    self._grantItemSlotNo = slotNo
    self._grantItemWhereType = inventoryType
    self:evaluateEnchantTarget(monotone)
    ;
    ((self._ui).txt_keyGuideForExit):SetText("Discard")
    return true
  end
end

EnchantInfo.setItemToSlot = function(self, uiSlot, slotNo, itemWrapper, inventoryType)
  -- function num : 0_13
  (uiSlot.icon):AddEffect("UI_Button_Hide", false, 0, 0)
  uiSlot.empty = false
  uiSlot.slotNo = slotNo
  uiSlot.inventoryType = inventoryType
  ;
  (uiSlot.icon):SetMonoTone(false)
  uiSlot:setItem(getInventoryItemByType(inventoryType, slotNo))
end

EnchantInfo.evaluateEnchantTarget = function(self, isMonotone, isRadioClick)
  -- function num : 0_14
  local enchantType = (self._enchantInfo):ToClient_getEnchantType()
  local needCountForPerfectEnchant_s64 = (self._enchantInfo):ToClient_getNeedCountForPerfectEnchant_s64()
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._strForEnchantInfo)._notChecked = self:getStr_EnchantInfo((self._enchantInfo):ToClient_getCurMaxEndura(), (self._enchantInfo):ToClient_getDecMaxEndura(), enchantType)
  local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if itemWrapper == nil then
    return 
  end
  local enchantItemClassify = (itemWrapper:getStaticStatus()):getItemClassify()
  local enchantLevel = ((itemWrapper:get()):getKey()):getEnchantLevel()
  do
    if enchantLevel > 16 or enchantItemClassify == 4 then
      local enduranceDesc = self:getStr_EnchantInfo((self._enchantInfo):ToClient_getCurMaxEndura(), (self._enchantInfo):ToClient_getDecMaxEndura(), enchantType, true)
      -- DECOMPILER ERROR at PC54: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (self._strForEnchantInfo)._cronChecked = enduranceDesc .. self:getStr_EnchantProtectInfo(enchantType)
    end
    if toInt64(0, 0) < needCountForPerfectEnchant_s64 then
      self:setEnable_CheckboxForcedEnchant(true)
      local enduranceDesc = self:getStr_EnchantInfo((self._enchantInfo):ToClient_getCurMaxEndura(), (self._enchantInfo):ToClient_getDecMaxEndura(), enchantType, true)
      -- DECOMPILER ERROR at PC84: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (self._strForEnchantInfo)._forcedChecked = enduranceDesc .. self:getStr_PerfectEnchantInfo(needCountForPerfectEnchant_s64, (self._enchantInfo):ToClient_getDecMaxEnduraPerfect())
    else
      do
        self:setEnable_CheckboxForcedEnchant(false)
        self:setText_EnchantInfo()
        if isRadioClick == nil then
          self:setEnchantMaterial(isMonotone)
        end
      end
    end
  end
end

EnchantInfo.setText_EnchantInfo = function(self)
  -- function num : 0_15
  ((self._ui).txt_forceEnchantDesc):SetText((self._strForEnchantInfo)._forcedChecked)
  ;
  ((self._ui).txt_normalEnchantDesc):SetText((self._strForEnchantInfo)._notChecked)
end

PaGlobalFunc_EnchantInfo_OnPadB = function()
  -- function num : 0_16 , upvalues : EnchantInfo
  local self = EnchantInfo
  if ((self._ui).slot_targetItem).slotNo ~= nil or ((self._ui).slot_subjectItem).slotNo ~= nil then
    self:clearEnchantData()
    return false
  else
    self:close()
    return true
  end
end

PaGlobalFunc_EnchantInfo_RClickSubject = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_17 , upvalues : EnchantInfo
  local self = EnchantInfo
  if self._isAnimating then
    return 
  end
  if itemWrapper:checkToValksItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, 0)
    return 
  end
  self._isLastEnchant = false
  self:clearItemSlot((self._ui).slot_subjectItem)
  self:setEnchantMaterial(false)
end

EnchantInfo.setEnchantMaterial = function(self, isMonotone)
  -- function num : 0_18
  local slotNo = (self._enchantInfo):ToClient_getNeedItemSlotNo()
  local inventoryType = (self._enchantInfo):ToClient_getNeedItemWhereType()
  if isMonotone == true or (self._enchantInfo):ToClient_setEnchantSlot(inventoryType, slotNo) ~= 0 then
    self:setItemToSlotMonoTone((self._ui).slot_subjectItem, (self._enchantInfo):ToClient_getNeedItemStaticInformation())
    self:enableApplyButton(false)
    ;
    (self._enchantInfo):materialClearData()
    return 
  end
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  self:setItemToSlot((self._ui).slot_subjectItem, slotNo, itemWrapper, inventoryType)
  self:enableApplyButton(true)
end

EnchantInfo.enableApplyButton = function(self, isTrue)
  -- function num : 0_19 , upvalues : _panel
  ((self._ui).btn_normal):SetIgnore(not isTrue)
  ;
  ((self._ui).btn_normal):SetMonoTone(not isTrue)
  if isTrue == true then
    PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideNormal, XBOX_PAD_BUTTON.A)
    PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideForced, XBOX_PAD_BUTTON.Y)
    ToClient_setTargetPanel(_panel)
  else
    PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideNormal, XBOX_PAD_BUTTON.EMPTY)
    PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideForced, XBOX_PAD_BUTTON.EMPTY)
    ToClient_setTargetPanel(Panel_Window_Inventory)
  end
  self:setEnable_CheckboxForcedEnchant(isTrue)
end

EnchantInfo.setEnable_CheckboxForcedEnchant = function(self, isEnable)
  -- function num : 0_20
  ((self._ui).btn_forced):SetIgnore(not isEnable)
  ;
  ((self._ui).btn_forced):SetMonoTone(not isEnable)
  ;
  ((self._ui).txt_keyGuideForced):SetMonoTone(not isEnable)
end

InputRUp_EnchantInfo_TargetSlot = function()
  -- function num : 0_21 , upvalues : EnchantInfo
  EnchantInfo:clearEnchantData()
end

Input_EnchantInfo_ApplyEnchant = function(isForcedEnchant)
  -- function num : 0_22 , upvalues : EnchantInfo
  EnchantInfo:applyEnchant(isForcedEnchant)
end

EnchantInfo.applyEnchant = function(self, isForcedEnchant)
  -- function num : 0_23
  if self._isAnimating == true then
    return 
  else
    local enchantAlert = false
    local failCount = (self._enchantInfo):ToClient_getFailCount()
    local valksCount = (self._enchantInfo):ToClient_getValksCount()
    local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
    if itemWrapper == nil then
      return 
    end
    local itemSSW = itemWrapper:getStaticStatus()
    local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
    if failCount + valksCount == 0 then
      -- DECOMPILER ERROR at PC44: Unhandled construct in 'MakeBoolean' P1

      -- DECOMPILER ERROR at PC44: Unhandled construct in 'MakeBoolean' P1

      if self._grantItemWhereType ~= nil and self._grantItemSlotNo ~= nil and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() and enchantLevel > 0 then
        enchantAlert = true
      end
      if enchantLevel > 15 then
        enchantAlert = true
      end
      self._forcedEnchant = isForcedEnchant
      if isForcedEnchant == true then
        enchantAlert = false
      end
      if enchantAlert then
        local goEnchant = function()
    -- function num : 0_23_0 , upvalues : self
    self:startEnchantAnimation()
  end

        local _title = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGETITLE")
        local _content = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGEDESC")
        local messageBoxData = {title = _title, content = _content, functionYes = goEnchant, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
      else
        do
          self:startEnchantAnimation()
          if itemWrapper:getCronEnchantFailCount() > 0 and enchantLevel > 17 then
            local goEnchant = function()
    -- function num : 0_23_1 , upvalues : self
    self:startEnchantAnimation()
  end

            local _title = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MESSAGETITLE")
            local _content = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CRON_ENERGY_WARNING_DESC_CAPHRAS")
            local messageBoxData = {title = _title, content = _content, functionApply = goEnchant, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
            ;
            (MessageBox.showMessageBox)(messageBoxData, nil, false, false)
          else
            do
              do
                self:startEnchantAnimation()
                self._resultShowTime = 0
                self:enableApplyButton(true)
              end
            end
          end
        end
      end
    end
  end
end

EnchantInfo.startEnchant = function(self)
  -- function num : 0_24
  (self._enchantInfo):ToClient_doEnchant(self._forcedEnchant, false)
  audioPostEvent_SystemUi(5, 6)
  audioPostEvent_SystemUi(5, 9)
end

EnchantInfo.startEnchantAnimation = function(self)
  -- function num : 0_25
  (((self._ui).slot_targetItem).icon):EraseAllEffect()
  ;
  (((self._ui).slot_targetItem).icon):AddEffect("fUI_LimitOver01A", false, 0, 0)
  ;
  (((self._ui).slot_subjectItem).icon):EraseAllEffect()
  ;
  (((self._ui).slot_subjectItem).icon):AddEffect("fUI_LimitOver01A", false, 0, 0)
  if (self._enchantInfo):ToClient_getEquipType() == 0 then
    ((self._ui).stc_enchantArtwork):EraseAllEffect()
    ;
    ((self._ui).stc_enchantArtwork):AddEffect("fUI_LimitOver02A", true, 0, 0)
    ;
    ((self._ui).stc_enchantArtwork):AddEffect("UI_LimitOverLine_Red", false, 0, 0)
    ;
    ((self._ui).stc_enchantArtwork):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
  else
    ;
    ((self._ui).stc_enchantArtwork):EraseAllEffect()
    ;
    ((self._ui).stc_enchantArtwork):AddEffect("fUI_LimitOver02A", true, 0, 0)
    ;
    ((self._ui).stc_enchantArtwork):AddEffect("UI_LimitOverLine", false, 0, 0)
    ;
    ((self._ui).stc_enchantArtwork):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
  end
  ToClient_BlackspiritEnchantStart()
  self._animationTimeStamp = 0
  self._isAnimating = true
  audioPostEvent_SystemUi(5, 6)
  audioPostEvent_SystemUi(5, 9)
end

FromClient_EnchantInfo_UpdateBonus = function()
  -- function num : 0_26 , upvalues : _panel, EnchantInfo
  if _panel:GetShow() then
    EnchantInfo:setEnchantFailCount()
  end
end

EnchantInfo.setEnchantFailCount = function(self)
  -- function num : 0_27
  if self._enchantInfo == nil then
    self._enchantInfo = getEnchantInformation()
    ;
    (self._enchantInfo):ToClient_clearData()
  end
  local failCount = (self._enchantInfo):ToClient_getFailCount()
  local valksCount = (self._enchantInfo):ToClient_getValksCount()
  ;
  ((self._ui).txt_bonus1):SetShow(true)
  ;
  ((self._ui).txt_bonus1):SetText(true)
  ;
  ((self._ui).txt_bonus1Val):SetShow(true)
  ;
  ((self._ui).txt_bonus1Val):SetText(true)
  if isGameTypeJapan() or isGameTypeRussia() or isGameTypeKorea() then
    ((self._ui).txt_bonus2):SetShow(true)
    ;
    ((self._ui).txt_bonus2Val):SetShow(true)
  else
    if isGameTypeEnglish() then
      ((self._ui).txt_bonus2):SetShow(false)
      ;
      ((self._ui).txt_bonus2Val):SetShow(false)
    end
  end
  ;
  ((self._ui).txt_bonus1Val):SetText(tostring(failCount))
  ;
  ((self._ui).txt_bonus2Val):SetText(tostring(valksCount))
  ;
  ((self._ui).txt_totalBonusVal):SetText(tostring(failCount + valksCount))
end

FromClient_EnchantInfo_PerFrame = function(deltaTime)
  -- function num : 0_28 , upvalues : EnchantInfo
  local self = EnchantInfo
  if self._isAnimating == true then
    self._animationTimeStamp = self._animationTimeStamp + deltaTime
    if self._effectTime_Enchant <= self._animationTimeStamp then
      self._isAnimating = false
      _PA_LOG("박범�\128", "FromClient_EnchantInfo_PerFrame, Flag Off")
      self:startEnchant()
      return 
    end
  end
  if self._isLastEnchant and not self._isResulTextAnimation then
    self:setAnimation()
  end
  do return  end
  self._isResulTextAnimation = false
  if self._resultTimeCheck then
    self._resultShowTime = self._resultShowTime + deltaTime
    if self._resultShowTime > 5 then
      self._resultShowTime = 0
      self._resultTimeCheck = false
      ;
      ((self._ui).txt_result):SetShow(false)
    end
  end
end

FromClient_EnchantInfo_ResultShow = function(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_29 , upvalues : EnchantInfo
  EnchantInfo:afterEnchant(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  PaGlobal_TutorialManager:handleEnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
end

EnchantInfo.afterEnchant = function(self, resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_30
  if resultType == (self._enum_EnchantResult)._error then
    _PA_LOG("박범�\128", "afterEnchant return cause by error resultType")
    ToClient_BlackspiritEnchantCancel()
    self:evaluateEnchantTarget()
    return 
  end
  self:showEnchantResultEffect(resultType)
  self:showEnchantResultText(resultType, mainSlotNo, mainWhereType)
  self:clearEnchantData()
  if self:setEnchantTarget(mainSlotNo, getInventoryItemByType(mainWhereType, mainSlotNo), mainWhereType, resultType, false) == false then
    local itemWrapper = getInventoryItemByType(mainWhereType, mainSlotNo)
    self._isLastEnchant = false
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      -- DECOMPILER ERROR at PC58: Unhandled construct in 'MakeBoolean' P1

      if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() and enchantLevel == 5 then
        self._isLastEnchant = true
      end
    end
    do
      if enchantLevel == 20 then
        self._isLastEnchant = true
      end
      if self._isLastEnchant then
        self:setItemToSlot((self._ui).slot_targetItem, mainSlotNo, itemWrapper, mainWhereType)
      else
        self:clearEnchantData()
      end
    end
  end
end

EnchantInfo.showEnchantResultEffect = function(self, resultType)
  -- function num : 0_31
  _PA_LOG("박범�\128", "showEnchantResultEffect.." .. tostring(resultType))
  if resultType == (self._enum_EnchantResult)._success then
    audioPostEvent_SystemUi(5, 1)
    render_setChromaticBlur(40, 1)
    render_setPointBlur(0.05, 0.045)
    render_setColorBypass(0.85, 0.08)
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
  self:evaluateEnchantTarget(false)
end

EnchantInfo.showEnchantResultText = function(self, resultType, mainSlotNo, mainWhereType)
  -- function num : 0_32
  if resultType == (self._enum_EnchantResult)._success then
    ((self._ui).txt_result):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_0"))
    ;
    ((self._ui).txt_result):EraseAllEffect()
    ;
    ((self._ui).txt_result):AddEffect("UI_QustComplete01", false, 0, 0)
  else
    if resultType == (self._enum_EnchantResult)._fail then
      ((self._ui).txt_result):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_1"))
      ;
      ((self._ui).txt_result):EraseAllEffect()
      ;
      ((self._ui).txt_result):AddEffect("fUI_Enchant_Fail", false, 0, 0)
    else
      if resultType == (self._enum_EnchantResult)._broken then
        ((self._ui).txt_result):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_2"))
        ;
        ((self._ui).txt_result):EraseAllEffect()
        ;
        ((self._ui).txt_result):AddEffect("fUI_Enchant_Fail", false, 0, 0)
      else
        if resultType == (self._enum_EnchantResult)._gradedown then
          ((self._ui).txt_result):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_3"))
          ;
          ((self._ui).txt_result):EraseAllEffect()
          ;
          ((self._ui).txt_result):AddEffect("fUI_Enchant_Fail", false, 0, 0)
        else
          if resultType == (self._enum_EnchantResult)._failAndPrevent then
            ((self._ui).txt_result):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_4"))
            ;
            ((self._ui).txt_result):EraseAllEffect()
            ;
            ((self._ui).txt_result):AddEffect("fUI_Enchant_Fail", false, 0, 0)
          end
        end
      end
    end
  end
  ;
  ((self._ui).txt_result):SetShow(true)
  self._resultFlag = true
  self._resultTimeCheck = true
end

EnchantInfo.setAnimation = function(self)
  -- function num : 0_33
  ((self._ui).txt_result):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SUCCESSFINALENCHANT"))
  ;
  ((self._ui).txt_result):ResetVertexAni()
  ;
  ((self._ui).txt_result):SetScale(1, 1)
  ;
  ((self._ui).txt_result):SetSize(250, 20)
  ;
  ((self._ui).txt_result):ComputePos()
  ;
  ((self._ui).txt_result):SetVertexAniRun("Ani_Move_Pos_New", true)
  ;
  ((self._ui).txt_result):SetVertexAniRun("Ani_Scale_New", true)
  self._isResulTextAnimation = true
end

EnchantInfo.showEffectByResult = function(self, resultType, mainSlotNo, mainWhereType)
  -- function num : 0_34
  if resultType == (self._enum_EnchantResult)._success then
    local itemWrapper = getInventoryItemByType(mainWhereType, mainSlotNo)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
        (((self._ui).slot_targetItem).icon):AddEffect("UI_ItemEnchant01", false, -6, -6)
      else
        ;
        (((self._ui).slot_targetItem).icon):AddEffect("UI_ItemEnchant01", false, -6, -6)
      end
    end
  else
    do
      ;
      (((self._ui).slot_targetItem).icon):AddEffect("", false, -6, -6)
    end
  end
end

EnchantInfo.getStr_EnchantInfo = function(self, curMaxEndura, decEndura, enchantType, isChecked)
  -- function num : 0_35
  local str = ""
  if enchantType == (self._enum_EnchantType)._safe then
    str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_100PERCENT")
  else
    local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      if (CppEnums.ItemClassifyType).eItemClassify_Accessory ~= itemSSW:getItemClassify() then
        str = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_0", "maxEndurance", tostring(decEndura), "currentEndurance", tostring(curMaxEndura))
      end
    end
    do
      do
        if isChecked == nil then
          if enchantType == (self._enum_EnchantType)._broken or enchantType == (self._enum_EnchantType)._downAndBroken then
            if str == "" then
              str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_1")
            else
              str = str .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_1")
            end
          end
          if enchantType == (self._enum_EnchantType)._gradedown or enchantType == (self._enum_EnchantType)._downAndBroken then
            if str == "" then
              str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_2")
            else
              str = str .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_2")
            end
          end
        end
        return str
      end
    end
  end
end

EnchantInfo.getStr_EnchantProtectInfo = function(self, enchantType)
  -- function num : 0_36
  if enchantType == (self._enum_EnchantType)._broken or enchantType == (self._enum_EnchantType)._downAndBroken then
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_3") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_4")
  else
    return "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_5") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_PENALTY_4")
  end
end

EnchantInfo.getStr_PerfectEnchantInfo = function(self, needCount, decEndura)
  -- function num : 0_37
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

EnchantInfo.clearEnchantData = function(self)
  -- function num : 0_38
  self:clearItemSlot((self._ui).slot_targetItem)
  self:clearItemSlot((self._ui).slot_subjectItem)
  self._grantItemWhereType = nil
  self._grantItemSlotNo = nil
  ;
  (self._enchantInfo):ToClient_clearData()
  ;
  ((self._ui).txt_keyGuideForExit):SetShow(true)
  ;
  ((self._ui).txt_keyGuideForExit):SetText("Exit")
  PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideNormal, XBOX_PAD_BUTTON.EMPTY)
  PaGlobalFunc_SetKeyGuideUVTo((self._ui).txt_keyGuideForced, XBOX_PAD_BUTTON.EMPTY)
  ToClient_setTargetPanel(Panel_Window_Inventory)
  Inventory_SetFunctor(PaGlobal_EnchantInfo_FilterForEnchantTarget, PaGlobal_EnchantInfo_RClickTarget, nil, nil)
end

EnchantInfo.clearItemSlot = function(self, slot)
  -- function num : 0_39
  slot.inventoryType = nil
  slot.slotNo = nil
  slot:clearItem()
  slot.empty = true
  ;
  (slot.icon):EraseAllEffect()
end

EnchantInfo.setItemToSlotMonoTone = function(self, slot, itemStaticWrapper)
  -- function num : 0_40
  (slot.icon):AddEffect("UI_Button_Hide", false, 0, 0)
  slot.empty = false
  slot.slotNo = 0
  slot.inventoryType = CppEnums.TInventorySlotNoUndefined
  ;
  (slot.icon):SetMonoTone(true)
  slot:setItemByStaticStatus(itemStaticWrapper, toInt64(0, 0), 0, false, false, false, 0, 0, nil)
end


