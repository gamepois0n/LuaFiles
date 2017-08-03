-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\enchant\spiritenchant_main.luac 

-- params : ...
-- function num : 0
Panel_Window_Enchant:setMaskingChild(true)
Panel_Window_Enchant:setGlassBackground(true)
Panel_Window_Enchant:SetDragEnable(true)
Panel_Window_Enchant:SetDragAll(true)
Panel_Window_Enchant:RegisterShowEventFunc(true, "Enchant_ShowAni()")
Panel_Window_Enchant:RegisterShowEventFunc(false, "Enchant_HideAni()")
PaGlobal_Enchant = {_enchantCountValue = 0, _Xgap = 7, _enchantClassifyValue = nil, _enchantPerfectEnduranceValue = 3, _isEnchantSafeTypeValue = 0, _isItemKey = nil, _isCash = nil, _isEnchantLevel = 0, _isContentsEnable = ToClient_IsContentsGroupOpen("74"), _isCronBonusOpen = ToClient_IsContentsGroupOpen("222"), _isCronEnchantOpen = ToClient_IsContentsGroupOpen("234"), _isEnableProtect = false, _uiHelpTargetItem = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Notice_Slot_0"), _uiHelpEnchantItem = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Notice_Slot_1"), _uiHelpEnchantBtn = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Notice_Enchant"), _uiHelpPerfectEnchant = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Notice_GoGoGo"), _uiHelpEnchantFailCnt = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_EnchantFailCount"), _uiEnchantFailDesc = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_EnchantFailDesc"), _uiEnchantPackFailCnt = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_EnchantFailPackCount"), _uiEnchantPcroomFailCnt = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_EnchantFailPcroomCount"), _uiEnchantBottomDesc = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Comment"), _uiButtonQuestion = (UI.getChildControl)(Panel_Window_Enchant, "Button_Question"), _enchantItemType = 0, 
_slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, _uiButtonApply = (UI.getChildControl)(Panel_Window_Enchant, "Button_GoGoGo"), _uiButtonSureSuccess = (UI.getChildControl)(Panel_Window_Enchant, "Button_Apply"), _uiEnchantEffect = (UI.getChildControl)(Panel_Window_Enchant, "Static_AddEffect"), _uiSkipEnchant = (UI.getChildControl)(Panel_Window_Enchant, "CheckButton_SkipEnchant"), _uiDrasticEnchant = (UI.getChildControl)(Panel_Window_Enchant, "Radiobutton_DrasticEnchant"), _uiMeticulousEnchant = (UI.getChildControl)(Panel_Window_Enchant, "Radiobutton_MeticulousEnchant"), _uiProtectItem_BG = (UI.getChildControl)(Panel_Window_Enchant, "Static_ProtectItemBG"), _uiProtectItem_Icon = (UI.getChildControl)(Panel_Window_Enchant, "Static_ProtectItemSlot"), _uiProtectItem_Count = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_ProtectItemCount"), _uiProtectItem_Name = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_ProtectItemName"), _uiProtectItem_Desc = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_ProtectItemDesc"), _uiProtectItem_Btn = (UI.getChildControl)(Panel_Window_Enchant, "CheckButton_ProtectItem"), _protectItem_SlotNo = nil, _descBg = (UI.getChildControl)(Panel_Window_Enchant, "Static_CommentBG"), _desc = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Comment"), _uiCheckBtn_CronEnchnt = (UI.getChildControl)(Panel_Window_Enchant, "CheckButton_CronEnchant"), _uiCronDescBg = (UI.getChildControl)(Panel_Window_Enchant, "Static_CronStoneBg"), _uiCronDescArrow = (UI.getChildControl)(Panel_Window_Enchant, "Static_Arrow"), _uiCron_StackCount = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_StackCountBg"), _uiCron_ProgressBg = (UI.getChildControl)(Panel_Window_Enchant, "Static_CronStoneStackBg"), _uiCron_Progress = (UI.getChildControl)(Panel_Window_Enchant, "Progress2_StackCount"), 
_uiCron_StackGrade = {[0] = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Grade1"), [1] = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Grade2"), [2] = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Grade3"), [3] = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Grade4")}
, 
_uiCron_StackCountValue = {[0] = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Count1"), [1] = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Count2"), [2] = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Count3"), [3] = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Count4")}
, _uiCron_AddValue = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_CronStackDesc"), _buttonSecretExtraction = (UI.getChildControl)(Panel_Window_Enchant, "Button_SecretExtraction"), 
_slotTargetItem = {}
, 
_slotEnchantItem = {}
, _isStartEnchantNormal = false, _isStartEnchantSureSuccess = false, _currentTime = 0, _isDoingEnchant = false, _btnMouseOnCount = 0, _enchantHelpDesc = "", savedBoxSizeY = 70, _bubbleBasePosY = 295}
-- DECOMPILER ERROR at PC316: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.initialize = function(self)
  -- function num : 0_0
  (self._uiHelpPerfectEnchant):SetShow(false)
  ;
  (self._uiHelpPerfectEnchant):SetSize(220, 60)
  ;
  (self._uiHelpPerfectEnchant):SetPosY(self._bubbleBasePosY - (self._uiHelpPerfectEnchant):GetSizeY() + 50)
  ;
  (self._uiEnchantFailDesc):SetShow(false)
  ;
  (self._uiEnchantFailDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiEnchantFailDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_SPRITENCHANT_DESC"))
  ;
  (self._uiDrasticEnchant):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DRASTICENCHANT_TITLE"))
  ;
  (self._uiMeticulousEnchant):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_METICULOUSENCHANT_TITLE"))
  ;
  (self._uiCron_AddValue):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiButtonApply):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleMClickedEnchantApplyButton()")
  ;
  (self._uiButtonSureSuccess):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleMClickedSureSuccessButton()")
  ;
  (self._uiDrasticEnchant):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleMClickedEnchantType()")
  ;
  (self._uiMeticulousEnchant):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleMClickedEnchantType()")
  ;
  (self._uiButtonSureSuccess):SetShow(true)
  ;
  (self._uiSkipEnchant):SetCheck(false)
  ;
  (self._uiSkipEnchant):SetEnableArea(0, 0, (self._uiSkipEnchant):GetTextSizeX() + 60, (self._uiSkipEnchant):GetSizeY())
  ;
  (self._uiDrasticEnchant):SetCheck(true)
  ;
  (self._uiMeticulousEnchant):SetCheck(false)
  ;
  (self._uiDrasticEnchant):SetShow(false)
  ;
  (self._uiMeticulousEnchant):SetShow(false)
  ;
  (self._uiDrasticEnchant):SetEnableArea(0, 0, (self._uiDrasticEnchant):GetTextSizeX() + 60, (self._uiDrasticEnchant):GetSizeY())
  ;
  (self._uiMeticulousEnchant):SetEnableArea(0, 0, (self._uiMeticulousEnchant):GetTextSizeX() + 60, (self._uiMeticulousEnchant):GetSizeY())
  -- DECOMPILER ERROR at PC144: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotTargetItem).icon = (UI.getChildControl)(Panel_Window_Enchant, "Static_Slot_0")
  ;
  (SlotItem.new)(self._slotTargetItem, "Slot_0", 0, Panel_Window_Enchant, self._slotConfig)
  ;
  (self._slotTargetItem):createChild()
  -- DECOMPILER ERROR at PC157: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotTargetItem).empty = true
  Panel_Tooltip_Item_SetPosition(0, self._slotTargetItem, "Enchant")
  -- DECOMPILER ERROR at PC169: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotEnchantItem).icon = (UI.getChildControl)(Panel_Window_Enchant, "Static_Slot_1")
  ;
  (SlotItem.new)(self._slotEnchantItem, "Slot_1", 1, Panel_Window_Enchant, self._slotConfig)
  ;
  (self._slotEnchantItem):createChild()
  -- DECOMPILER ERROR at PC182: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._slotEnchantItem).empty = true
  ;
  (self._uiProtectItem_Desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiProtectItem_Desc):SetText((self._uiProtectItem_Desc):GetText())
  self._currentTime = 0
  Panel_Tooltip_Item_SetPosition(1, self._slotEnchantItem, "Enchant")
  ;
  ((self._slotEnchantItem).icon):addInputEvent("Mouse_RUp", "PaGlobal_Enchant:handleMClickedEnchantSlotCancel()")
  ;
  ((self._slotTargetItem).icon):addInputEvent("Mouse_RUp", "PaGlobal_Enchant:handleMClickedEnchantSlotCancel()")
  ;
  (self._uiButtonApply):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnShowHelpDesc(true)")
  ;
  (self._uiButtonApply):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOnShowHelpDesc(false)")
  ;
  (self._uiButtonSureSuccess):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnSureSuccessButton()")
  ;
  (self._uiButtonSureSuccess):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutSureSuccessButton()")
  ;
  ((self._slotTargetItem).icon):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnEnchantItemTooltip()")
  ;
  ((self._slotTargetItem).icon):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutEnchantItemTooltip()")
  ;
  ((self._slotEnchantItem).icon):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnTargetItemTooltip()")
  ;
  ((self._slotEnchantItem).icon):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutTargetItemTooltip()")
  ;
  (self._uiSkipEnchant):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnoutSkipEnchantTooltip(true)")
  ;
  (self._uiSkipEnchant):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOnoutSkipEnchantTooltip(false)")
  ;
  (self._uiDrasticEnchant):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnoutDifficultyEnchantTooltip(true, 0)")
  ;
  (self._uiDrasticEnchant):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOnoutDifficultyEnchantTooltip(false, 0)")
  ;
  (self._uiMeticulousEnchant):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnoutDifficultyEnchantTooltip(true, 1)")
  ;
  (self._uiMeticulousEnchant):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOnoutDifficultyEnchantTooltip(false, 1)")
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"SpiritEnchant\" )")
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"SpiritEnchant\", \"true\")")
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"SpiritEnchant\", \"false\")")
  ;
  (self._uiProtectItem_Btn):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleClickedProtectCheckBtn()")
  ;
  (self._uiCheckBtn_CronEnchnt):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleClickedCronEnchantBtn()")
  ;
  (self._uiCheckBtn_CronEnchnt):addInputEvent("Mouse_On", "PaGlobal_Enchant:enchantTooltipShow(true)")
  ;
  (self._uiCheckBtn_CronEnchnt):addInputEvent("Mouse_Out", "PaGlobal_Enchant:enchantTooltipShow(false)")
  ;
  (self._buttonSecretExtraction):addInputEvent("Mouse_LUp", "Panel_EnchantExtraction_Show()")
  if isGameTypeJapan() then
    (self._uiEnchantBottomDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_PCROOMENCHANT_DESC_JP"))
  else
    if isGameTypeEnglish() then
      (self._uiEnchantBottomDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_PCROOMENCHANT_DESC_NA"))
    else
      if isGameTypeRussia() then
        (self._uiEnchantBottomDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_PCROOMENCHANT_DESC_RU"))
      else
        ;
        (self._uiEnchantBottomDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_PCROOMENCHANT_DESC"))
      end
    end
  end
  ;
  (self._uiCheckBtn_CronEnchnt):SetShow(self._isCronEnchantOpen)
  ;
  (self._uiCron_StackCount):SetShow(self._isCronEnchantOpen)
  ;
  (self._uiCron_ProgressBg):SetShow(self._isCronEnchantOpen)
  ;
  (self._uiCron_Progress):SetShow(self._isCronEnchantOpen)
  ;
  ((self._uiCron_StackGrade)[0]):SetShow(self._isCronEnchantOpen)
  ;
  ((self._uiCron_StackGrade)[1]):SetShow(self._isCronEnchantOpen)
  ;
  ((self._uiCron_StackGrade)[2]):SetShow(self._isCronEnchantOpen)
  ;
  ((self._uiCron_StackGrade)[3]):SetShow(self._isCronEnchantOpen)
  ;
  ((self._uiCron_StackCountValue)[0]):SetShow(self._isCronEnchantOpen)
  ;
  ((self._uiCron_StackCountValue)[1]):SetShow(self._isCronEnchantOpen)
  ;
  ((self._uiCron_StackCountValue)[2]):SetShow(self._isCronEnchantOpen)
  ;
  ((self._uiCron_StackCountValue)[3]):SetShow(self._isCronEnchantOpen)
  ;
  (self._uiCron_AddValue):SetShow(self._isCronEnchantOpen)
  if self._isCronBonusOpen then
    (self._uiEnchantBottomDesc):SetText((self._uiEnchantBottomDesc):GetText() .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONESTONEDESC"))
  end
  ;
  (self._uiEnchantBottomDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiEnchantBottomDesc):SetText((self._uiEnchantBottomDesc):GetText())
  ;
  (self._uiEnchantBottomDesc):SetSize((self._uiEnchantBottomDesc):GetSizeX(), (self._uiEnchantBottomDesc):GetTextSizeY())
  ;
  (self._descBg):SetSize((self._descBg):GetSizeX(), (self._uiEnchantBottomDesc):GetTextSizeY() + 5)
  Panel_Window_Enchant:SetSize(Panel_Window_Enchant:GetSizeX(), (self._descBg):GetPosY() + (self._descBg):GetSizeY() + 10)
  ;
  (self._descBg):ComputePos()
  ;
  (self._uiEnchantBottomDesc):ComputePos()
  PaGlobal_Enchant:enchantFailCount()
  if isGameTypeKR2() then
    (self._uiButtonApply):SetSpanSize(-80, 150)
    ;
    (self._uiButtonSureSuccess):SetSpanSize(80, 150)
  else
    ;
    (self._uiButtonApply):SetSpanSize(-80, 300)
    ;
    (self._uiButtonSureSuccess):SetSpanSize(80, 300)
  end
  ;
  (self._uiCheckBtn_CronEnchnt):SetMonoTone(true)
  Panel_Window_Enchant:RegisterUpdateFunc("UpdateFunc_DoingEnchant")
  registerEvent("EventEnchantResultShow", "FromClient_EnchantResultShow")
  registerEvent("FromClient_UpgradeItem", "FromClient_UpgradeItem")
  registerEvent("onScreenResize", "OnScreenEvent")
end

;
(PaGlobal_Enchant._uiProtectItem_Btn):SetEnableArea(0, 0, 25 + (PaGlobal_Enchant._uiProtectItem_Btn):GetTextSizeX(), (PaGlobal_Enchant._uiProtectItem_Btn):GetSizeY())
;
(PaGlobal_Enchant._uiCheckBtn_CronEnchnt):SetEnableArea(0, 0, 25 + (PaGlobal_Enchant._uiCheckBtn_CronEnchnt):GetTextSizeX(), (PaGlobal_Enchant._uiCheckBtn_CronEnchnt):GetSizeY())
-- DECOMPILER ERROR at PC349: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.get = function(self)
  -- function num : 0_1
  return self
end

-- DECOMPILER ERROR at PC352: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.getMaterialSlot = function(self)
  -- function num : 0_2
  return self._slotEnchantItem
end

-- DECOMPILER ERROR at PC355: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.getTargetItemSlot = function(self)
  -- function num : 0_3
  return self._slotTargetItem
end

-- DECOMPILER ERROR at PC358: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleClickedProtectCheckBtn = function(self)
  -- function num : 0_4
  if (self._uiProtectItem_Btn):IsCheck() then
    (self._uiCheckBtn_CronEnchnt):SetCheck(false)
    FGlobal_EnchantArrowSet(true)
  end
  FGlobal_EnchantMaterialSlotCheck()
  PaGlobal_Enchant:SetTextStartBtn()
end

-- DECOMPILER ERROR at PC361: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleClickedCronEnchantBtn = function(self)
  -- function num : 0_5
  if (self._uiCheckBtn_CronEnchnt):IsCheck() then
    (self._uiProtectItem_Btn):SetCheck(false)
    FGlobal_EnchantArrowSet(false)
  end
  FGlobal_InvenFilterCronEnchant()
end

-- DECOMPILER ERROR at PC364: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantTooltipShow = function(self, isShow)
  -- function num : 0_6
  if isShow == true then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONSTONE_TITLE")
    local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONSTONE_DESC")
    TooltipSimple_Show(self._uiCheckBtn_CronEnchnt, name, desc)
  else
    do
      if isShow == false then
        TooltipSimple_Hide()
      end
    end
  end
end

-- DECOMPILER ERROR at PC367: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.SetTextStartBtn = function(self)
  -- function num : 0_7
end

-- DECOMPILER ERROR at PC370: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchant_Show = function(self)
  -- function num : 0_8
  if Panel_Window_Socket:GetShow() then
    Panel_Window_Socket:SetShow(false, false)
  else
    if Panel_SkillAwaken:GetShow() then
      Panel_SkillAwaken:SetShow(false, false)
    end
  end
  PaGlobal_Enchant:enchantFailCount()
  SkillAwaken_Close()
  Panel_Join_Close()
  FGlobal_LifeRanking_Close()
  FGlobal_EnchantExtraction_JustClose()
  self:show()
  ;
  (self._uiSkipEnchant):SetCheck(false)
  ;
  (self._uiDrasticEnchant):SetCheck(true)
  ;
  (self._uiMeticulousEnchant):SetCheck(false)
end

Enchant_Close = function()
  -- function num : 0_9
  local self = PaGlobal_Enchant
  Equipment_PosLoadMemory()
  Panel_Window_Enchant:SetShow(false, false)
  self:clear()
  ;
  (self._uiHelpEnchantBtn):SetShow(false)
  InventoryWindow_Close()
  Panel_Equipment:SetShow(false, false)
  ToClient_BlackspiritEnchantClose()
  PaGlobal_TutorialManager:handleCloseEnchantWindow()
  FGlobal_EnchantExtraction_JustClose()
end

-- DECOMPILER ERROR at PC375: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantClose = function(self)
  -- function num : 0_10
  Enchant_Close()
end

-- DECOMPILER ERROR at PC378: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantFailCount = function(self)
  -- function num : 0_11
  local selfPlayer = (getSelfPlayer()):get()
  local failCount = selfPlayer:getEnchantFailCount()
  local failCountPack = selfPlayer:getEnchantValuePackCount()
  ;
  (self._uiHelpEnchantFailCnt):SetShow(true)
  ;
  (self._uiHelpEnchantFailCnt):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_HELP", "failCount", failCount))
  if isGameTypeJapan() then
    (self._uiEnchantPcroomFailCnt):SetShow(true)
  else
    if isGameTypeRussia() then
      (self._uiEnchantPcroomFailCnt):SetShow(true)
    else
      if isGameTypeKorea() then
        (self._uiEnchantPcroomFailCnt):SetShow(true)
      else
        if isGameTypeEnglish() then
          (self._uiEnchantPcroomFailCnt):SetShow(false)
        end
      end
    end
  end
  ;
  (self._uiEnchantPcroomFailCnt):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_VALKSCOUNT", "count", failCountPack))
  ;
  (self._uiHelpEnchantFailCnt):SetSpanSize(0, 48)
  ;
  (self._uiEnchantPackFailCnt):SetText("( <PAColor0xffffbc1a>+" .. failCountPack .. "<PAOldColor> )")
  local secretExtractionButtonShow = PaGlobal_Enchant:SecretExtractionCheck()
  ;
  (self._buttonSecretExtraction):SetShow(secretExtractionButtonShow)
end

-- DECOMPILER ERROR at PC381: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.SecretExtractionCheck = function(self)
  -- function num : 0_12
  if getSelfPlayer() == nil then
    return 
  end
  local selfPlayer = (getSelfPlayer()):get()
  local failCount = selfPlayer:getEnchantFailCount()
  if failCount < 1 then
    return false
  end
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = selfPlayer:getInventorySlotCount(false)
  local inventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local invenMaxSize = inventory:sizeXXX()
  for index = 0, invenMaxSize - 1 do
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, index)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local maxEnchantParam = itemSSW:getContentsEventParam1()
      if (CppEnums.ContentsEventType).ContentsType_ConvertEnchantFailCountToItem == (itemSSW:get()):getContentsEventType() and failCount <= maxEnchantParam then
        return true
      end
    end
  end
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = selfPlayer:getInventorySlotCount(false)
  local inventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eCashInventory)
  local invenMaxSize = inventory:sizeXXX()
  for index = 0, invenMaxSize - 1 do
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, index)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local maxEnchantParam = itemSSW:getContentsEventParam1()
      if (CppEnums.ContentsEventType).ContentsType_ConvertEnchantFailCountToItem == (itemSSW:get()):getContentsEventType() and failCount <= maxEnchantParam then
        return true, true
      end
    end
  end
  return false
end

-- DECOMPILER ERROR at PC384: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantItem_FromItemWrapper = function(self)
  -- function num : 0_13
  if (self._slotEnchantItem).slotNo == nil then
    return nil
  end
  return getInventoryItemByType((self._slotEnchantItem).inventoryType, (self._slotEnchantItem).slotNo)
end

-- DECOMPILER ERROR at PC387: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.enchantItem_ToItemWrapper = function(self)
  -- function num : 0_14
  if (self._slotTargetItem).slotNo == nil then
    return nil
  end
  return getInventoryItemByType((self._slotTargetItem).inventoryType, (self._slotTargetItem).slotNo)
end

-- DECOMPILER ERROR at PC390: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnSureSuccessButton = function(self)
  -- function num : 0_15
  (self._uiHelpPerfectEnchant):SetShow(true)
  ;
  (self._uiHelpEnchantBtn):SetShow(false)
  ;
  (self._uiHelpPerfectEnchant):SetSize(220, self.savedBoxSizeY)
  ;
  (self._uiHelpPerfectEnchant):SetPosY(self._bubbleBasePosY - (self._uiHelpPerfectEnchant):GetSizeY() + 50)
end

-- DECOMPILER ERROR at PC393: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutSureSuccessButton = function(self)
  -- function num : 0_16
  (self._uiHelpPerfectEnchant):SetShow(false)
end

-- DECOMPILER ERROR at PC396: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMClickedEnchantSlotCancel = function(self)
  -- function num : 0_17
  self:cancelEnchant()
  self:handleMOnShowHelpDesc(false)
  ;
  (self._uiProtectItem_Btn):SetCheck(false)
  ;
  (self._uiCheckBtn_CronEnchnt):SetCheck(false)
  FGlobal_EnchantArrowSet(true)
  if self._isContentsEnable then
    self:setProtectItem()
  end
  ;
  (self._uiDrasticEnchant):SetCheck(true)
  ;
  (self._uiMeticulousEnchant):SetCheck(false)
  ;
  (self._uiDrasticEnchant):SetShow(false)
  ;
  (self._uiMeticulousEnchant):SetShow(false)
  ;
  (self._uiCheckBtn_CronEnchnt):SetMonoTone(true)
end

-- DECOMPILER ERROR at PC399: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMClickedEnchantApplyButton = function(self)
  -- function num : 0_18
  if self:isDoingEnchant() then
    self:cancelEnchant()
  else
    local isProtect = (self._uiProtectItem_Btn):IsCheck()
    if isProtect then
      if not self._isEnableProtect then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_NOT_ENOUGH_CRONESTONE"))
        return 
      end
      ;
      (getEnchantInformation()):setPreventDownGradeItem((CppEnums.ItemWhereType).eInventory, PaGlobal_Enchant._protectItem_SlotNo)
    else
      ;
      (getEnchantInformation()):setPreventDownGradeItem((CppEnums.ItemWhereType).eInventory, 255)
    end
    local skipCheck = (self._uiSkipEnchant):IsCheck()
    if skipCheck then
      PaGlobal_Enchant:handleMClickedSkipEnchant()
    else
      self:startEnchant(false)
    end
  end
end

-- DECOMPILER ERROR at PC402: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMClickedEnchantType = function(self)
  -- function num : 0_19
  local isEasy = (self._uiDrasticEnchant):IsCheck()
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).EnchantType, not isEasy)
end

-- DECOMPILER ERROR at PC405: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMClickedSureSuccessButton = function(self)
  -- function num : 0_20
  local skipCheck = (self._uiSkipEnchant):IsCheck()
  if skipCheck then
    if self:isDoingEnchant() then
      self:cancelEnchant()
    else
      PaGlobal_Enchant:handleMClickedSkipPerfectEnchant()
    end
  else
    if self:isDoingEnchant() then
      self:cancelEnchant()
    else
      self:startEnchant(true)
    end
  end
end

-- DECOMPILER ERROR at PC408: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnTargetItemTooltip = function(self)
  -- function num : 0_21
  if (self._slotEnchantItem).empty == true then
    (self._uiHelpTargetItem):SetShow(true)
    ;
    (self._uiHelpTargetItem):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (self._uiHelpTargetItem):SetAutoResize(true)
    ;
    (self._uiHelpTargetItem):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_HELPMESSAGE1"))
    ;
    (self._uiHelpTargetItem):SetSize((self._uiHelpTargetItem):GetSizeX() + self._Xgap, (self._uiHelpTargetItem):GetSizeY() + 30)
  else
    Panel_Tooltip_Item_Show_GeneralNormal(1, "Enchant", true)
  end
end

-- DECOMPILER ERROR at PC411: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutTargetItemTooltip = function(self)
  -- function num : 0_22
  if (self._slotEnchantItem).empty == true then
    (self._uiHelpTargetItem):SetShow(false)
    ;
    (self._uiHelpTargetItem):SetSize(220, 60)
  else
    Panel_Tooltip_Item_Show_GeneralNormal(1, "Enchant", false)
  end
end

-- DECOMPILER ERROR at PC414: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnEnchantItemTooltip = function(self)
  -- function num : 0_23
  if (self._slotTargetItem).empty == true then
    (self._uiHelpEnchantItem):SetShow(true)
    ;
    (self._uiHelpEnchantItem):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (self._uiHelpEnchantItem):SetAutoResize(true)
    ;
    (self._uiHelpEnchantItem):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_HELPMESSAGE2"))
    ;
    (self._uiHelpEnchantItem):SetSize((self._uiHelpEnchantItem):GetTextSizeX() + self._Xgap, (self._uiHelpEnchantItem):GetTextSizeY() + 30)
  else
    Panel_Tooltip_Item_Show_GeneralNormal(0, "Enchant", true)
  end
end

-- DECOMPILER ERROR at PC417: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutEnchantItemTooltip = function(self)
  -- function num : 0_24
  if (self._slotTargetItem).empty == true then
    (self._uiHelpEnchantItem):SetShow(false)
    ;
    (self._uiHelpEnchantItem):SetSize(220, 60)
  else
    Panel_Tooltip_Item_Show_GeneralNormal(0, "Enchant", false)
  end
end

-- DECOMPILER ERROR at PC420: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnoutSkipEnchantTooltip = function(self, isShow)
  -- function num : 0_25
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SKIPENCHANT_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SKIPENCHANT_TOOLTIP_DESC")
  control = self._uiSkipEnchant
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

-- DECOMPILER ERROR at PC423: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnoutDifficultyEnchantTooltip = function(self, isShow, tipType)
  -- function num : 0_26
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DRASTICENCHANT_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DRASTICENCHANT_DESC")
    control = self._uiDrasticEnchant
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_METICULOUSENCHANT_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_METICULOUSENCHANT_DESC")
      control = self._uiMeticulousEnchant
    end
  end
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC426: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnShowHelpDesc = function(self, isShow)
  -- function num : 0_27
  if self._enchantCountValue >= 16 and not isGameTypeEnglish() then
    return 
  end
  if self._isEnchantSafeTypeValue == 0 then
    if self._enchantClassifyValue == 1 or self._enchantClassifyValue == 2 then
      if self._btnMouseOnCount % 3 == 0 then
        self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_DESC_1")
      else
        if self._btnMouseOnCount % 3 == 1 then
          if self._isItemKey == 10073 or self._isItemKey == 10273 or self._isItemKey == 10473 or self._isItemKey == 10673 or self._isItemKey == 13273 or self._isItemKey == 13373 or self._isItemKey == 14473 or self._isItemKey == 10078 or self._isItemKey == 10139 or self._isItemKey == 10278 or self._isItemKey == 10339 or self._isItemKey == 10478 or self._isItemKey == 10539 or self._isItemKey == 10678 or self._isItemKey == 10739 or self._isItemKey == 13278 or self._isItemKey == 13039 or self._isItemKey == 13378 or self._isItemKey == 13139 or self._isItemKey == 14478 or self._isItemKey == 14539 or self._isItemKey == 14639 then
            self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_NEWBIEWEAPONE")
          else
            self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_WEAPONE")
          end
        else
          if self._isCash then
            self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_DESC_4")
          else
            self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_DESC_1")
          end
        end
      end
    else
      if self._enchantClassifyValue == 3 then
        if self._btnMouseOnCount % 3 == 0 then
          self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_DESC_1")
        else
          if self._btnMouseOnCount % 3 == 1 then
            if self._isItemKey == 11066 or self._isItemKey == 11067 or self._isItemKey == 11068 or self._isItemKey == 11069 then
              self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_NEWBIEWEAPONE")
            else
              self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_ARMOR")
            end
          end
        end
      else
        if self._isCash then
          self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_DESC_4")
        else
          self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_DESC_1")
        end
      end
    end
  else
    if self._isEnchantSafeTypeValue == 1 then
      self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_FAIL")
    else
      if self._isEnchantSafeTypeValue == 2 then
        self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_DESTORYED")
      else
        if self._isEnchantSafeTypeValue == 3 then
          self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_COUNTDOWN")
        else
          if self._isEnchantSafeTypeValue == 4 then
            self._enchantHelpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_DESTORYED_AND_COUNTDOWN")
          end
        end
      end
    end
  end
  ;
  (self._uiHelpEnchantBtn):SetShow(isShow)
  ;
  (self._uiHelpEnchantBtn):SetNotAbleMasking(true)
  ;
  (self._uiHelpEnchantBtn):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiHelpEnchantBtn):SetAutoResize(true)
  ;
  (self._uiHelpEnchantBtn):SetText(self._enchantHelpDesc)
  local boxSizeY = (self._uiHelpEnchantBtn):GetTextSizeY() + 30
  if boxSizeY < 70 then
    boxSizeY = 70
  end
  ;
  (self._uiHelpEnchantBtn):SetSize((self._uiHelpEnchantBtn):GetSizeX(), boxSizeY)
  ;
  (self._uiHelpEnchantBtn):SetPosY(self._bubbleBasePosY - (self._uiHelpEnchantBtn):GetSizeY() + 50)
  if isShow == true then
    self._btnMouseOnCount = self._btnMouseOnCount + 1
  end
end

UpdateFunc_DoingEnchant = function(deltaTime)
  -- function num : 0_28
  local self = PaGlobal_Enchant
  if self:isDoingEnchant() == true then
    self._currentTime = self._currentTime + deltaTime
    if self._currentTime >= 6 then
      self:doEnchant()
    end
    ;
    (self._uiProtectItem_Btn):SetIgnore(true)
  end
end

OnScreenEvent = function()
  -- function num : 0_29
  local self = PaGlobal_Enchant
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  Panel_Window_Enchant:SetPosX(sizeX / 2 - Panel_Window_Enchant:GetSizeX() / 2)
  Panel_Window_Enchant:SetPosY(sizeY - Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY())
  Panel_Window_Enchant:ComputePos()
  ;
  (self._uiEnchantFailDesc):ComputePos()
end

PaGlobal_Enchant:initialize()

