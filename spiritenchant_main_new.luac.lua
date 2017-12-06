-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\enchant\spiritenchant_main_new.luac 

-- params : ...
-- function num : 0
Panel_Window_Enchant:setMaskingChild(true)
Panel_Window_Enchant:setGlassBackground(true)
Panel_Window_Enchant:SetDragEnable(true)
Panel_Window_Enchant:SetDragAll(true)
Panel_Window_Enchant:RegisterShowEventFunc(true, "Enchant_ShowAni()")
Panel_Window_Enchant:RegisterShowEventFunc(false, "Enchant_HideAni()")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Enchant")
PaGlobal_Enchant = {
_ui = {_button_Question = (UI.getChildControl)(Panel_Window_Enchant, "Button_Question"), _radiobutton_EnchantTab = (UI.getChildControl)(Panel_Window_Enchant, "Radiobutton_EnchantTab"), _radiobutton_CronEnchantTab = (UI.getChildControl)(Panel_Window_Enchant, "Radiobutton_CronEnchantTab"), _effect_Enchant = (UI.getChildControl)(Panel_Window_Enchant, "Static_EnchantEffect"), _button_Apply = (UI.getChildControl)(Panel_Window_Enchant, "Button_EnchantApply"), _statictext_noticeApplyButton = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_NoticeApplyButton"), _checkbox_skipEffect = (UI.getChildControl)(Panel_Window_Enchant, "CheckBox_SkipEffect"), _tooltip_TargetItem = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Notice_Slot_0"), _tooltip_EnchantMaterial = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Notice_Slot_1"), _statictext_EnchantResult = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Result"), _frame_DescEnchant = (UI.getChildControl)(Panel_Window_Enchant, "Static_DescEnchantFrame"), _statictext_EnchantFailCount = nil, _statictext_ValksCount = nil, _statictext_TotalEnchantCount = nil, _statictext_EnchantInfo = nil, _button_SecretExtract = nil, _radiobutton_EasyEnchant = nil, _radiobutton_DifficultEnchant = nil, _checkbox_ForcedEnchant = nil, _checkbox_UseCron = nil, _tooltip_ForcedEnchant = nil, _tooltip_UseCron = nil, _slot_Cron = nil, _statictext_NumOfCron = nil, _frame_DescCronEnchant = (UI.getChildControl)(Panel_Window_Enchant, "Static_DescUpgradeFrame"), _progress_Cron = nil, _bg_ProgressCron = nil, 
_addStatBg = {}
, 
_statictext_AddStat = {}
, 
_staticText_CronEnchantCount = {}
, _statictext_BounsStats = nil, _statictext_CurCronState = nil, _statictext_StackForNext = nil, 
_slot_TargetItem = {}
, 
_slot_EnchantMaterial = {}
}
, 
_const = {_gapX_PanelEquip = 10, _gapX_ToolTip = 7, _gapY_ToolTip = 30, _posX_CronCount = 25, _posY_CronCount = 40, _gapY_CronCount = 20, _effectTime_Enchant = 6, _poxX_PanelOriginPos = Panel_Window_Enchant:GetPosY()}
, 
_enum_EnchantType = {_safe = 0, _unsafe = 1, _broken = 2, _gradedown = 3, _downAndBroken = 4}
, 
_enum_EnchantResult = {_success = 0, _broken = 1, _gradedown = 2, _fail = 3, _failAndPrevent = 4, _error = 5}
, 
_strForEnchantInfo = {_checked = "", _notChecked = ""}
, _enchantInfo = nil, _screctExtractIvenType = nil, _numOfCronLevelText = 4, _animationTimeStamp = 0, _isAnimating = false, _resultFlag = false, _resultShowTime = 0, _resultTimeCheck = false, _cronEnchantItemWrapper = nil, _isLastEnchant = false, _isResulTextAnimation = false, _isContentsEnable = ToClient_IsContentsGroupOpen("74"), _isCronBonusOpen = ToClient_IsContentsGroupOpen("222"), _isCronEnchantOpen = ToClient_IsContentsGroupOpen("234")}
-- DECOMPILER ERROR at PC191: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._statictext_EnchantFailCount = (UI.getChildControl)((self._ui)._frame_DescEnchant, "StaticText_EnchantFailCount")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._statictext_ValksCount = (UI.getChildControl)((self._ui)._frame_DescEnchant, "StaticText_ValksCount")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._statictext_TotalEnchantCount = (UI.getChildControl)((self._ui)._frame_DescEnchant, "StaticText_TotalEnchantFailCount")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._statictext_EnchantInfo = (UI.getChildControl)((self._ui)._frame_DescEnchant, "StaticText_EnchantInfo")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._checkbox_ForcedEnchant = (UI.getChildControl)((self._ui)._frame_DescEnchant, "Checkbox_ForcedEnchant")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_SecretExtract = (UI.getChildControl)((self._ui)._frame_DescEnchant, "Button_SecretExtraction")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radiobutton_EasyEnchant = (UI.getChildControl)((self._ui)._frame_DescEnchant, "Radiobutton_EasyEnchant")
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radiobutton_DifficultEnchant = (UI.getChildControl)((self._ui)._frame_DescEnchant, "Radiobutton_DifficultEnchant")
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._checkbox_UseCron = (UI.getChildControl)((self._ui)._frame_DescEnchant, "Checkbox_UseCron")
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._tooltip_ForcedEnchant = (UI.getChildControl)((self._ui)._frame_DescEnchant, "StaticText_ForcedEnchant_Tooltip")
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._tooltip_UseCron = (UI.getChildControl)((self._ui)._frame_DescEnchant, "StaticText_UseCrone_Tooltip")
  -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._slot_Cron = (UI.getChildControl)((self._ui)._frame_DescEnchant, "Static_Slot_Cron")
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._forceEnchantIcon = (UI.getChildControl)((self._ui)._frame_DescEnchant, "CheckButton_FocedEnchant")
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._useCronIcon = (UI.getChildControl)((self._ui)._frame_DescEnchant, "CheckButton_Cron")
  -- DECOMPILER ERROR at PC119: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._froceEnchantTooltip = (UI.getChildControl)((self._ui)._frame_DescEnchant, "Static_ForcedEnchant")
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._useCronTooltip = (UI.getChildControl)((self._ui)._frame_DescEnchant, "Static_Cron")
  -- DECOMPILER ERROR at PC135: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._statictext_NumOfCron = (UI.getChildControl)((self._ui)._slot_Cron, "StaticText_NumOfCron")
  -- DECOMPILER ERROR at PC143: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._topDesc = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_TopDesc")
  -- DECOMPILER ERROR at PC151: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._topDesc2 = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_TopDesc2")
  -- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._statictext_CurCronState = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_CurCronState")
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._statictext_StackForNext = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_StackForNext")
  -- DECOMPILER ERROR at PC175: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._statictext_BounsStats = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_BounsStats")
  -- DECOMPILER ERROR at PC183: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._progress_CronBg = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "Static_ItemEnergy_BG")
  -- DECOMPILER ERROR at PC191: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._progress_Cron = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "Progress2_CronStack")
  -- DECOMPILER ERROR at PC199: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._bg_ProgressCron = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "Static_BGProgressCronStack")
  -- DECOMPILER ERROR at PC208: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._addStatBg)[0] = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_AddStat_0")
  -- DECOMPILER ERROR at PC218: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._statictext_AddStat)[0] = (UI.getChildControl)(((self._ui)._addStatBg)[0], "StaticText_Stat")
  -- DECOMPILER ERROR at PC227: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._addStatBg)[1] = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_AddStat_1")
  -- DECOMPILER ERROR at PC237: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._statictext_AddStat)[1] = (UI.getChildControl)(((self._ui)._addStatBg)[1], "StaticText_Stat")
  -- DECOMPILER ERROR at PC246: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._addStatBg)[2] = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_AddStat_2")
  -- DECOMPILER ERROR at PC256: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._statictext_AddStat)[2] = (UI.getChildControl)(((self._ui)._addStatBg)[2], "StaticText_Stat")
  -- DECOMPILER ERROR at PC265: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._addStatBg)[3] = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_AddStat_3")
  -- DECOMPILER ERROR at PC275: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._statictext_AddStat)[3] = (UI.getChildControl)(((self._ui)._addStatBg)[3], "StaticText_Stat")
  -- DECOMPILER ERROR at PC284: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._staticText_CronEnchantCount)[0] = (UI.getChildControl)((self._ui)._bg_ProgressCron, "StaticText_CronCount0")
  -- DECOMPILER ERROR at PC293: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._staticText_CronEnchantCount)[1] = (UI.getChildControl)((self._ui)._bg_ProgressCron, "StaticText_CronCount1")
  -- DECOMPILER ERROR at PC302: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._staticText_CronEnchantCount)[2] = (UI.getChildControl)((self._ui)._bg_ProgressCron, "StaticText_CronCount2")
  -- DECOMPILER ERROR at PC311: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._staticText_CronEnchantCount)[3] = (UI.getChildControl)((self._ui)._bg_ProgressCron, "StaticText_CronCount3")
  -- DECOMPILER ERROR at PC319: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._stackTitle = (UI.getChildControl)((self._ui)._bg_ProgressCron, "StaticText_StackTitle")
  local slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
  -- DECOMPILER ERROR at PC333: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._slot_TargetItem).icon = (UI.getChildControl)(Panel_Window_Enchant, "Static_Slot_0")
  ;
  (SlotItem.new)((self._ui)._slot_TargetItem, "Slot_0", 0, Panel_Window_Enchant, slotConfig)
  ;
  ((self._ui)._slot_TargetItem):createChild()
  -- DECOMPILER ERROR at PC349: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._slot_TargetItem).empty = true
  ;
  ((self._ui)._slot_TargetItem):clearItem()
  ;
  (((self._ui)._slot_TargetItem).border):SetSize(42, 42)
  ;
  (((self._ui)._slot_TargetItem).border):SetPosX(0)
  ;
  (((self._ui)._slot_TargetItem).border):SetPosY(0)
  Panel_Tooltip_Item_SetPosition(0, (self._ui)._slot_TargetItem, "Enchant")
  -- DECOMPILER ERROR at PC386: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._slot_EnchantMaterial).icon = (UI.getChildControl)(Panel_Window_Enchant, "Static_Slot_1")
  ;
  (SlotItem.new)((self._ui)._slot_EnchantMaterial, "Slot_1", 1, Panel_Window_Enchant, slotConfig)
  ;
  ((self._ui)._slot_EnchantMaterial):createChild()
  -- DECOMPILER ERROR at PC402: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._slot_EnchantMaterial).empty = true
  ;
  ((self._ui)._slot_EnchantMaterial):clearItem()
  ;
  (((self._ui)._slot_EnchantMaterial).border):SetSize(42, 42)
  ;
  (((self._ui)._slot_EnchantMaterial).border):SetPosX(1)
  ;
  (((self._ui)._slot_EnchantMaterial).border):SetPosY(1)
  Panel_Tooltip_Item_SetPosition(1, (self._ui)._slot_EnchantMaterial, "Enchant")
  ;
  ((self._ui)._statictext_BounsStats):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._checkbox_skipEffect):SetEnableArea(0, 0, ((self._ui)._checkbox_skipEffect):GetTextSizeX() + 60, ((self._ui)._checkbox_skipEffect):GetSizeY())
  local itemSSW = FromClient_getPreventDownGradeItem()
  ;
  ((self._ui)._slot_Cron):ChangeTextureInfoName("")
  ;
  ((self._ui)._statictext_noticeApplyButton):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._statictext_noticeApplyButton):SetAutoResize(false)
  ;
  ((self._ui)._radiobutton_EnchantTab):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleLUpEnchantTab()")
  ;
  ((self._ui)._radiobutton_CronEnchantTab):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleLUpCronTab()")
  ;
  (((self._ui)._slot_EnchantMaterial).icon):addInputEvent("Mouse_RUp", "PaGlobal_Enchant:handleRUpEnchantSlot")
  ;
  (((self._ui)._slot_TargetItem).icon):addInputEvent("Mouse_RUp", "PaGlobal_Enchant:handleRUpEnchantSlot")
  ;
  ((self._ui)._button_Apply):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleLUpEnchantApplyButton()")
  ;
  ((self._ui)._button_SecretExtract):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleLUPSecretExtractButton()")
  ;
  (((self._ui)._slot_TargetItem).icon):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnEnchantTargetTooltip()")
  ;
  (((self._ui)._slot_TargetItem).icon):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutEnchantTargetTooltip()")
  ;
  (((self._ui)._slot_TargetItem).icon):addInputEvent("Mouse_RUp", "PaGlobal_Enchant:handleRUpEnchantSlot()")
  ;
  (((self._ui)._slot_EnchantMaterial).icon):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnEnchantMaterialTooltip()")
  ;
  (((self._ui)._slot_EnchantMaterial).icon):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutEnchantMaterialTooltip()")
  ;
  (((self._ui)._slot_EnchantMaterial).icon):addInputEvent("Mouse_RUp", "PaGlobal_Enchant:handleRUpEnchantSlot()")
  ;
  ((self._ui)._froceEnchantTooltip):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnForceEnchantTooltip()")
  ;
  ((self._ui)._froceEnchantTooltip):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutForceEnchantTooltip()")
  ;
  ((self._ui)._useCronTooltip):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnCronIconTooltip()")
  ;
  ((self._ui)._useCronTooltip):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutCronIconTooltip()")
  ;
  ((self._ui)._checkbox_UseCron):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleLUpUseChronBox()")
  ;
  ((self._ui)._checkbox_ForcedEnchant):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:handleLUpForcedEnchantCheckBox()")
  ;
  ((self._ui)._checkbox_skipEffect):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMUpSkipEffect()")
  ;
  ((self._ui)._checkbox_skipEffect):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutSkipEffect()")
  ;
  ((self._ui)._button_Question):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"SpiritEnchant\" )")
  ;
  ((self._ui)._button_Question):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"SpiritEnchant\", \"true\")")
  ;
  ((self._ui)._button_Question):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"SpiritEnchant\", \"false\")")
  ;
  ((self._ui)._radiobutton_EasyEnchant):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:didsetEnchantTarget()")
  ;
  ((self._ui)._radiobutton_EasyEnchant):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnEasyEnchant()")
  ;
  ((self._ui)._radiobutton_EasyEnchant):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutEasyEnchant()")
  ;
  ((self._ui)._radiobutton_DifficultEnchant):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:didsetEnchantTarget()")
  ;
  ((self._ui)._radiobutton_DifficultEnchant):addInputEvent("Mouse_On", "PaGlobal_Enchant:handlemOnDifficultEnchant()")
  ;
  ((self._ui)._radiobutton_DifficultEnchant):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutDifficultEnchant()")
  registerEvent("EventEnchantResultShow", "FromClient_EnchantResultShow")
  registerEvent("FromClient_UpgradeItem", "FromClient_UpgradeItem")
  registerEvent("FromClient_UpdateEnchantFailCount", "FromClient_UpdateEnchantFailCount")
  registerEvent("onScreenResize", "OnScreenEvent")
  Panel_Window_Enchant:RegisterUpdateFunc("UpdateFunc_checkAnimation")
end

-- DECOMPILER ERROR at PC194: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.init_EnchantFrame = function(self)
  -- function num : 0_1
  self:SetCheck_RadioButton((self._ui)._radiobutton_EnchantTab, true)
  self:SetCheck_RadioButton((self._ui)._radiobutton_CronEnchantTab, false)
  self:setEnable_CheckboxForcedEnchant(false)
  self:setEnable_CheckboxUseCron(false)
  ;
  ((self._ui)._frame_DescEnchant):SetShow(true)
  ;
  ((self._ui)._frame_DescCronEnchant):SetShow(false)
  ;
  ((self._ui)._checkbox_UseCron):SetCheck(false)
  ;
  ((self._ui)._checkbox_ForcedEnchant):SetCheck(false)
  ;
  ((self._ui)._tooltip_UseCron):SetShow(false)
  ;
  ((self._ui)._tooltip_ForcedEnchant):SetShow(false)
  ;
  ((self._ui)._statictext_EnchantInfo):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SETEQUIPMENT"))
  ;
  ((self._ui)._statictext_noticeApplyButton):SetShow(false)
  self:setText_NumOfCron(0, 0)
  self:setAsEnchantButton()
  self:showDifficultEnchantButton(false)
end

-- DECOMPILER ERROR at PC197: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.init_CronFrame = function(self)
  -- function num : 0_2
  self:SetCheck_RadioButton((self._ui)._radiobutton_EnchantTab, false)
  self:SetCheck_RadioButton((self._ui)._radiobutton_CronEnchantTab, true)
  ;
  ((self._ui)._frame_DescCronEnchant):SetShow(true)
  ;
  ((self._ui)._frame_DescEnchant):SetShow(false)
  ;
  ((self._ui)._statictext_noticeApplyButton):SetShow(false)
  ;
  ((self._ui)._checkbox_skipEffect):SetCheck(false)
  self:setTextCronEnchantState(0, 0)
  self:setCronStackProgress(0, 0)
  self:setAsCronEnchantButton()
  self:hideAllCronCountText()
  ;
  ((self._ui)._statictext_BounsStats):SetText("\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SETEQUIPMENT"))
  ;
  ((self._ui)._statictext_StackForNext):SetText("")
  ;
  ((self._ui)._statictext_EnchantResult):ResetVertexAni()
  ;
  ((self._ui)._statictext_EnchantResult):SetScale(1, 1)
  ;
  ((self._ui)._statictext_EnchantResult):SetSize(250, 20)
  ;
  ((self._ui)._statictext_EnchantResult):ComputePos()
  ;
  ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_NOEQUIP"))
end

-- DECOMPILER ERROR at PC200: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showDifficultEnchantButton = function(self, isShow)
  -- function num : 0_3
  ((self._ui)._radiobutton_EasyEnchant):SetShow(isShow)
  ;
  ((self._ui)._radiobutton_DifficultEnchant):SetShow(isShow)
  if isShow == false then
    ((self._ui)._radiobutton_EasyEnchant):SetCheck(true)
    ;
    ((self._ui)._radiobutton_DifficultEnchant):SetCheck(false)
  end
end

-- DECOMPILER ERROR at PC203: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showScretExtractButton = function(self, isShow)
  -- function num : 0_4
  ((self._ui)._button_SecretExtract):SetShow(isShow)
end

-- DECOMPILER ERROR at PC206: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.clearItemSlot = function(self, itemSlot)
  -- function num : 0_5
  itemSlot.inventoryType = nil
  itemSlot.slotNo = nil
  itemSlot:clearItem()
  itemSlot.empty = true
  ;
  (itemSlot.icon):EraseAllEffect()
end

-- DECOMPILER ERROR at PC209: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setItemToSlot = function(self, uiSlot, slotNo, itemWrapper, inventoryType)
  -- function num : 0_6
  (uiSlot.icon):AddEffect("UI_Button_Hide", false, 0, 0)
  uiSlot.empty = false
  uiSlot.slotNo = slotNo
  uiSlot.inventoryType = inventoryType
  ;
  (uiSlot.icon):SetMonoTone(false)
  uiSlot:setItem(itemWrapper)
end

-- DECOMPILER ERROR at PC212: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setItemToSlotMonoTone = function(self, uiSlot, itemStaticWrapper)
  -- function num : 0_7
  (uiSlot.icon):AddEffect("UI_Button_Hide", false, 0, 0)
  uiSlot.empty = false
  uiSlot.slotNo = 0
  uiSlot.inventoryType = CppEnums.TInventorySlotNoUndefined
  ;
  (uiSlot.icon):SetMonoTone(true)
  uiSlot:setItemByStaticStatus(itemStaticWrapper, toInt64(0, 0), 0, false, false, false, 0, 0, nil)
end

-- DECOMPILER ERROR at PC215: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnable_button_Apply = function(self, isTrue)
  -- function num : 0_8
  ((self._ui)._button_Apply):SetIgnore(not isTrue)
  ;
  ((self._ui)._button_Apply):SetMonoTone(not isTrue)
  if isTrue then
    ((self._ui)._button_Apply):SetFontColor((Defines.Color).C_FF96D4FC)
  else
    ;
    ((self._ui)._button_Apply):SetFontColor((Defines.Color).C_FF626262)
    ;
    ((self._ui)._button_Apply):EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC218: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.SetCheck_RadioButton = function(self, radioBtn, isTrue)
  -- function num : 0_9
  radioBtn:SetCheck(isTrue)
end

-- DECOMPILER ERROR at PC221: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setAsCancelButton = function(self)
  -- function num : 0_10
  ((self._ui)._button_Apply):EraseAllEffect()
  ;
  ((self._ui)._button_Apply):EraseAllEffect()
  ;
  ((self._ui)._button_Apply):SetAlpha(1)
  ;
  ((self._ui)._button_Apply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_CANCEL"))
  ;
  ((self._ui)._button_Apply):SetFontColor((Defines.Color).C_FFC4BEBE)
end

-- DECOMPILER ERROR at PC224: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setAsEnchantButton = function(self)
  -- function num : 0_11
  ((self._ui)._button_Apply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DOENCHANT"))
end

-- DECOMPILER ERROR at PC227: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setAsCronEnchantButton = function(self)
  -- function num : 0_12
  ((self._ui)._button_Apply):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ENCHANT_RADIOBTNTITLE_2"))
end

-- DECOMPILER ERROR at PC230: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnable_CheckboxForcedEnchant = function(self, isEnable)
  -- function num : 0_13
  ((self._ui)._checkbox_ForcedEnchant):SetIgnore(not isEnable)
  ;
  ((self._ui)._checkbox_ForcedEnchant):SetMonoTone(not isEnable)
  ;
  ((self._ui)._checkbox_ForcedEnchant):SetShow(isEnable)
  if isEnable == false then
    ((self._ui)._checkbox_ForcedEnchant):SetCheck(false)
  end
  ;
  ((self._ui)._forceEnchantIcon):SetCheck(not isEnable)
end

-- DECOMPILER ERROR at PC233: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnable_CheckboxUseCron = function(self, isEnable)
  -- function num : 0_14
  ((self._ui)._checkbox_UseCron):SetIgnore(not isEnable)
  ;
  ((self._ui)._checkbox_UseCron):SetMonoTone(not isEnable)
  ;
  ((self._ui)._checkbox_UseCron):SetShow(isEnable)
  ;
  ((self._ui)._statictext_NumOfCron):SetShow(isEnable)
  if isEnable == false then
    ((self._ui)._checkbox_UseCron):SetCheck(false)
  end
  ;
  ((self._ui)._useCronIcon):SetCheck(isEnable)
end

-- DECOMPILER ERROR at PC236: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setText_NumOfCron = function(self, cnt, needCnt)
  -- function num : 0_15
  ((self._ui)._statictext_NumOfCron):SetText(tostring(needCnt) .. "/" .. tostring(cnt))
end

-- DECOMPILER ERROR at PC239: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setText_EnchantInfo = function(self, isChecked)
  -- function num : 0_16
  if isChecked then
    ((self._ui)._statictext_EnchantInfo):SetText((self._strForEnchantInfo)._checked)
  else
    ;
    ((self._ui)._statictext_EnchantInfo):SetText((self._strForEnchantInfo)._notChecked)
  end
end

-- DECOMPILER ERROR at PC242: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setText_EnchantProtectInfo = function(self, isChecked)
  -- function num : 0_17
  if isChecked then
    ((self._ui)._statictext_EnchantInfo):SetText((self._strForEnchantInfo)._checked)
  else
    ;
    ((self._ui)._statictext_EnchantInfo):SetText((self._strForEnchantInfo)._notChecked)
  end
end

-- DECOMPILER ERROR at PC245: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addEnchantEffectToItemSlot = function(self, icon)
  -- function num : 0_18
  icon:EraseAllEffect()
  icon:AddEffect("fUI_LimitOver01A", false, 0, 0)
end

-- DECOMPILER ERROR at PC248: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addEnchantSuccessEffectToItemSlot = function(self, icon)
  -- function num : 0_19
  icon:AddEffect("UI_ItemEnchant01", false, -6, -6)
end

-- DECOMPILER ERROR at PC251: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addWeaponEnchantEffect = function(self)
  -- function num : 0_20
  ((self._ui)._effect_Enchant):EraseAllEffect()
  ;
  ((self._ui)._effect_Enchant):AddEffect("fUI_LimitOver02A", true, 0, 0)
  ;
  ((self._ui)._effect_Enchant):AddEffect("UI_LimitOverLine_Red", false, 0, 0)
  ;
  ((self._ui)._effect_Enchant):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
end

-- DECOMPILER ERROR at PC254: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addAmorEnchantEffect = function(self)
  -- function num : 0_21
  ((self._ui)._effect_Enchant):EraseAllEffect()
  ;
  ((self._ui)._effect_Enchant):AddEffect("fUI_LimitOver02A", true, 0, 0)
  ;
  ((self._ui)._effect_Enchant):AddEffect("UI_LimitOverLine", false, 0, 0)
  ;
  ((self._ui)._effect_Enchant):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
end

-- DECOMPILER ERROR at PC257: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeEnchantEffect = function(self)
  -- function num : 0_22
  ((self._ui)._effect_Enchant):EraseAllEffect()
  ;
  (((self._ui)._slot_EnchantMaterial).icon):EraseAllEffect()
  ;
  (((self._ui)._slot_TargetItem).icon):EraseAllEffect()
end

-- DECOMPILER ERROR at PC260: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addFailCountEffectForTutorial = function(self)
  -- function num : 0_23
  ((self._ui)._statictext_EnchantFailCount):AddEffect("UI_QustComplete01", false, 0, 0)
end

-- DECOMPILER ERROR at PC263: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeFailCountEffect = function(self)
  -- function num : 0_24
  ((self._ui)._statictext_EnchantFailCount):EraseAllEffect()
end

-- DECOMPILER ERROR at PC266: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addValksCountEffectForTutorial = function(self)
  -- function num : 0_25
  ((self._ui)._statictext_ValksCount):AddEffect("UI_QustComplete02", true, 0, 0)
  ;
  ((self._ui)._statictext_ValksCount):AddEffect("UI_ArrowMark06", true, ((self._ui)._statictext_ValksCount):GetSizeX() * -0.9, 0)
end

-- DECOMPILER ERROR at PC269: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeValksCountEffect = function(self)
  -- function num : 0_26
  ((self._ui)._statictext_ValksCount):EraseAllEffect()
end

-- DECOMPILER ERROR at PC272: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addTargetSlotEffectForTutorial = function(self)
  -- function num : 0_27
  (((self._ui)._slot_TargetItem).icon):AddEffect("UI_ArrowMark02", true, 0, -50)
  ;
  (((self._ui)._slot_TargetItem).icon):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
end

-- DECOMPILER ERROR at PC275: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeTargetSlotEffect = function(self)
  -- function num : 0_28
  (((self._ui)._slot_TargetItem).icon):EraseAllEffect()
end

-- DECOMPILER ERROR at PC278: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addMaterialSlotEffectForTutorial = function(self)
  -- function num : 0_29
  (((self._ui)._slot_EnchantMaterial).icon):AddEffect("UI_ArrowMark02", true, 0, -50)
  ;
  (((self._ui)._slot_EnchantMaterial).icon):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
end

-- DECOMPILER ERROR at PC281: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeMaterialSlotEffect = function(self)
  -- function num : 0_30
  (((self._ui)._slot_EnchantMaterial).icon):EraseAllEffect()
end

-- DECOMPILER ERROR at PC284: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addApplyButtonEffectForTutorial = function(self)
  -- function num : 0_31
  ((self._ui)._button_Apply):AddEffect("UI_ArrowMark02", true, 0, -50)
  ;
  ((self._ui)._button_Apply):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
end

-- DECOMPILER ERROR at PC287: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeApplyButtonEffect = function(self)
  -- function num : 0_32
  ((self._ui)._button_Apply):EraseAllEffect()
end

-- DECOMPILER ERROR at PC290: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showPanel = function(self)
  -- function num : 0_33
  InventoryWindow_Show()
  Equipment_PosSaveMemory()
  Panel_Equipment:SetShow(true, true)
  Panel_Equipment:SetPosX((self._const)._gapX_PanelEquip)
  Panel_Equipment:SetPosY(getScreenSizeY() - getScreenSizeY() / 2 - Panel_Equipment:GetSizeY() / 2)
  Panel_Window_Enchant:SetShow(true, true)
  OnScreenEvent()
end

-- DECOMPILER ERROR at PC293: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextEnchantFailCntWithCnt = function(self, cnt)
  -- function num : 0_34
  ((self._ui)._statictext_EnchantFailCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_HELP", "failCount", cnt))
end

-- DECOMPILER ERROR at PC296: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextValksCntWithCnt = function(self, cnt)
  -- function num : 0_35
  ((self._ui)._statictext_ValksCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_VALKSCOUNT", "count", cnt))
end

-- DECOMPILER ERROR at PC299: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextTotalEnchantCntWithCnt = function(self, cnt)
  -- function num : 0_36
  ((self._ui)._statictext_TotalEnchantCount):SetText("<PAColor0xffffbc1a>+ " .. cnt)
end

-- DECOMPILER ERROR at PC302: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextCronEnchantState = function(self, curLevel, curStack)
  -- function num : 0_37
  ((self._ui)._statictext_CurCronState):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CURRENTSTATE", "level", tostring(curLevel), "stack", tostring(curStack)))
  ;
  ((self._ui)._statictext_EnchantResult):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CURRENTGRADE", "level", curLevel))
end

-- DECOMPILER ERROR at PC305: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextCronEnchantResultState = function(self)
  -- function num : 0_38
  local curLevel = (self._enchantInfo):ToClient_getCurLevel()
  if curLevel == 4 then
    self:setEnable_button_Apply(false)
    ;
    ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FINALGRADE"))
  else
    ;
    ((self._ui)._statictext_EnchantResult):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CURRENTGRADE", "level", curLevel))
  end
end

-- DECOMPILER ERROR at PC308: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextStackForNext = function(self, needStack)
  -- function num : 0_39
  local curLevel = (self._enchantInfo):ToClient_getCurLevel()
  if curLevel == 4 then
    ((self._ui)._statictext_StackForNext):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FINALENERGY"))
  else
    ;
    ((self._ui)._statictext_StackForNext):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CURRENTSTACK", "stack", needStack))
  end
end

-- DECOMPILER ERROR at PC311: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setNeedCountToMatrialSlot = function(self, slot, needCnt)
  -- function num : 0_40
  (slot.count):SetText(tostring(needCnt) .. "/" .. (slot.count):GetText())
end

-- DECOMPILER ERROR at PC314: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setCronStackProgress = function(self, curStack, maxStack)
  -- function num : 0_41
  local rate = 0
  if maxStack ~= 0 then
    rate = curStack / maxStack * 100
  end
  ;
  ((self._ui)._progress_Cron):SetProgressRate(rate)
  local itemWrapper = self._cronEnchantItemWrapper
  if itemWrapper ~= nil then
    local curCount = itemWrapper:getCronEnchantFailCount()
    for idx = 0, 3 do
      local itemSSW = itemWrapper:getStaticStatus()
      local itemClassifyType = itemSSW:getItemClassify()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      local cronEnchantSSW = ToClient_GetCronEnchantWrapper(itemClassifyType, enchantLevel, idx)
      local enchantableCount = cronEnchantSSW:getCount()
      if curCount < enchantableCount then
        (((self._ui)._statictext_AddStat)[idx]):SetFontColor((Defines.Color).C_FFC4BEBE)
      else
        ;
        (((self._ui)._statictext_AddStat)[idx]):SetFontColor((Defines.Color).C_FF69BB4C)
      end
    end
  end
end

-- DECOMPILER ERROR at PC317: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextBonusStats = function(self, DD, HIT, DV, PV, HP, MP, isReturn)
  -- function num : 0_42
  local str = ""
  if DD > 0 then
    str = PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONSTONE_ADD_ATTCK") .. tostring(DD)
  end
  if HIT > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONSTONE_ADD_HIT") .. tostring(HIT)
  end
  if DV > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONSTONE_ADD_DV") .. tostring(DV)
  end
  if PV > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONSTONE_ADD_PV") .. tostring(PV)
  end
  if HP > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONSTONE_ADD_HP") .. tostring(HP)
  end
  if MP > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_CRONSTONE_ADD_MP") .. tostring(MP)
  end
  if str == "" then
    str = PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_NOEFFECT")
  end
  if isReturn then
    return str
  end
  ;
  ((self._ui)._statictext_BounsStats):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_ADDEFFECT", "add", str))
end

-- DECOMPILER ERROR at PC320: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.initCronLevelAndCountText = function(self, maxLevel)
  -- function num : 0_43
  local countControl, curCount = nil, nil
  local maxCountInv = 1 / (self._enchantInfo):ToClient_getStackForLevel(maxLevel - 1) * ((self._ui)._progress_Cron):GetSizeX()
  local posX = 0
  local maxIdx = (math.max)(maxLevel, self._numOfCronLevelText) - 1
  for idx = 0, maxIdx do
    if self._numOfCronLevelText < idx then
      countControl = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._frame_DescCronEnchant)._bg_ProgressCron, "StaticText_CronCount" .. tostring(idx))
      CopyBaseProperty((self._frame_DescCronEnchant)._bg_ProgressCron, countControl)
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R11 in 'UnsetPending'

      ;
      ((self._ui)._staticText_CronEnchantCount)[idx] = countControl
    else
      countControl = ((self._ui)._staticText_CronEnchantCount)[idx]
    end
    if idx < maxLevel then
      local maxCount = (self._enchantInfo):ToClient_getStackForLevel(maxIdx)
      curCount = (self._enchantInfo):ToClient_getStackForLevel(idx)
      posX = curCount / maxCount * ((self._ui)._progress_Cron):GetSizeX() + (self._const)._posX_CronCount - countControl:GetSizeX() / 2
      countControl:SetText(tostring(curCount))
      countControl:SetPosX(posX)
      countControl:SetPosY((self._const)._posY_CronCount)
      countControl:SetShow(true)
      ;
      ((self._ui)._stackTitle):SetPosY((self._const)._posY_CronCount + 2)
      if ((self._ui)._addStatBg)[idx] ~= nil then
        if idx < 3 then
          if idx == 0 then
            posX = posX - 10
          end
          local statPosX = posX + countControl:GetSizeX() / 2 - (((self._ui)._addStatBg)[idx]):GetSizeX() / 2
          ;
          (((self._ui)._addStatBg)[idx]):SetPosX(statPosX)
        end
        do
          ;
          (((self._ui)._addStatBg)[idx]):SetShow(true)
          local itemWrapper = self._cronEnchantItemWrapper
          if itemWrapper ~= nil then
            local itemSSW = itemWrapper:getStaticStatus()
            local itemClassifyType = itemSSW:getItemClassify()
            local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
            local cronEnchantSSW = ToClient_GetCronEnchantWrapper(itemClassifyType, enchantLevel, idx)
            local addText = self:setTextBonusStats(cronEnchantSSW:getAddedDD(), cronEnchantSSW:getAddedHIT(), cronEnchantSSW:getAddedDV(), cronEnchantSSW:getAddedPV(), cronEnchantSSW:getAddedMaxHP(), cronEnchantSSW:getAddedMaxMP(), true)
            ;
            (((self._ui)._statictext_AddStat)[idx]):SetText(addText)
          end
          do
            do
              countControl:SetShow(false)
              ;
              ((self._ui)._stackTitle):SetShow(false)
              -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  ;
  ((self._ui)._topDesc):SetShow(false)
  ;
  ((self._ui)._topDesc2):SetShow(true)
  ;
  ((self._ui)._statictext_CurCronState):SetShow(false)
  ;
  ((self._ui)._bg_ProgressCron):SetShow(true)
  ;
  ((self._ui)._progress_Cron):SetShow(true)
  ;
  ((self._ui)._progress_CronBg):SetShow(true)
  ;
  ((self._ui)._stackTitle):SetShow(true)
  self._numOfCronLevelText = maxIdx + 1
end

-- DECOMPILER ERROR at PC323: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.hideAllCronCountText = function(self)
  -- function num : 0_44
  for idx = 0, self._numOfCronLevelText - 1 do
    (((self._ui)._staticText_CronEnchantCount)[idx]):SetShow(false)
    ;
    (((self._ui)._addStatBg)[idx]):SetShow(false)
  end
  ;
  ((self._ui)._topDesc):SetShow(true)
  ;
  ((self._ui)._topDesc2):SetShow(false)
  ;
  ((self._ui)._statictext_CurCronState):SetShow(false)
  ;
  ((self._ui)._progress_CronBg):SetShow(false)
  ;
  ((self._ui)._progress_Cron):SetShow(false)
  ;
  ((self._ui)._bg_ProgressCron):SetShow(false)
  ;
  ((self._ui)._stackTitle):SetShow(false)
end

-- DECOMPILER ERROR at PC326: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnchantFailCount = function(self)
  -- function num : 0_45
  local failCount = (self._enchantInfo):ToClient_getFailCount()
  local valksCount = (self._enchantInfo):ToClient_getValksCount()
  ;
  ((self._ui)._statictext_EnchantFailCount):SetShow(true)
  ;
  ((self._ui)._statictext_EnchantFailCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_HELP", "failCount", failCount))
  if isGameTypeJapan() then
    ((self._ui)._statictext_ValksCount):SetShow(true)
  else
    if isGameTypeRussia() then
      ((self._ui)._statictext_ValksCount):SetShow(true)
    else
      if isGameTypeKorea() then
        ((self._ui)._statictext_ValksCount):SetShow(true)
      else
        if isGameTypeEnglish() then
          ((self._ui)._statictext_ValksCount):SetShow(false)
        end
      end
    end
  end
  ;
  ((self._ui)._statictext_ValksCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_VALKSCOUNT", "count", valksCount))
  ;
  ((self._ui)._statictext_TotalEnchantCount):SetText("<PAColor0xffffbc1a>+" .. failCount + valksCount)
  self:showEnchantProbability(failCount + valksCount)
end

-- DECOMPILER ERROR at PC329: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showSlotToolTip = function(self, toolTip, text)
  -- function num : 0_46
  toolTip:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  toolTip:SetAutoResize(true)
  toolTip:SetText(text)
  toolTip:SetSize(toolTip:GetSizeX() + (self._const)._gapX_ToolTip, toolTip:GetTextSizeY() + (self._const)._gapY_ToolTip)
  toolTip:SetShow(true)
end

-- DECOMPILER ERROR at PC332: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showNoticeEnchantApply = function(self, enchantType)
  -- function num : 0_47
  if enchantType == (self._enum_EnchantType)._safe then
    ((self._ui)._statictext_noticeApplyButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_WEAPONE"))
  else
    if enchantType == (self._enum_EnchantType)._unsafe then
      ((self._ui)._statictext_noticeApplyButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_FAIL"))
    else
      if enchantType == (self._enum_EnchantType)._broken then
        ((self._ui)._statictext_noticeApplyButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_DESTORYED"))
      else
        if enchantType == (self._enum_EnchantType)._gradedown then
          ((self._ui)._statictext_noticeApplyButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_COUNTDOWN"))
        else
          if enchantType == (self._enum_EnchantType)._downAndBroken then
            ((self._ui)._statictext_noticeApplyButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_DESTORYED_AND_COUNTDOWN"))
          end
        end
      end
    end
  end
  ;
  ((self._ui)._statictext_noticeApplyButton):SetShow(true)
end

-- DECOMPILER ERROR at PC335: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showEnchantResultText = function(self, resultType)
  -- function num : 0_48
  if resultType == (self._enum_EnchantResult)._success then
    ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_0"))
  else
    if resultType == (self._enum_EnchantResult)._fail then
      ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_1"))
    else
      if resultType == (self._enum_EnchantResult)._broken then
        ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_2"))
      else
        if resultType == (self._enum_EnchantResult)._gradedown then
          ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_3"))
        else
          if resultType == (self._enum_EnchantResult)._failAndPrevent then
            ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_4"))
          end
        end
      end
    end
  end
  ;
  ((self._ui)._statictext_EnchantResult):SetShow(true)
  ;
  ((self._ui)._statictext_EnchantResult):EraseAllEffect()
  ;
  ((self._ui)._statictext_EnchantResult):AddEffect("UI_QustComplete01", false, 0, 0)
  self._resultFlag = true
  self._resultTimeCheck = true
end

-- DECOMPILER ERROR at PC338: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showCronEnchantResult = function(self, variedCount)
  -- function num : 0_49
  ((self._ui)._statictext_EnchantResult):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_5", "count", tostring(variedCount)))
  ;
  ((self._ui)._statictext_EnchantResult):SetShow(true)
  ;
  ((self._ui)._statictext_EnchantResult):EraseAllEffect()
  ;
  ((self._ui)._statictext_EnchantResult):AddEffect("UI_QustComplete01", false, 0, 0)
  self._resultTimeCheck = true
end

-- DECOMPILER ERROR at PC341: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showEnchantProbability = function(self, count)
  -- function num : 0_50
  if self._resultFlag then
    self._resultFlag = false
    return 
  end
  ;
  ((self._ui)._statictext_EnchantResult):ResetVertexAni()
  ;
  ((self._ui)._statictext_EnchantResult):SetScale(1, 1)
  ;
  ((self._ui)._statictext_EnchantResult):SetSize(250, 20)
  ;
  ((self._ui)._statictext_EnchantResult):ComputePos()
  ;
  ((self._ui)._statictext_EnchantResult):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SUCCESSPERCENT", "count", tostring(count)))
  ;
  ((self._ui)._statictext_EnchantResult):SetShow(true)
  self._resultTimeCheck = false
end

FromClient_luaLoadComplete_Enchant = function()
  -- function num : 0_51
  PaGlobal_Enchant:initialize()
end


