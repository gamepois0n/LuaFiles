-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\enchant\spiritenchant_main_new.luac 

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
_ui = {_button_Question = (UI.getChildControl)(Panel_Window_Enchant, "Button_Question"), _radiobutton_EnchantTab = (UI.getChildControl)(Panel_Window_Enchant, "Radiobutton_EnchantTab"), _radiobutton_CronEnchantTab = (UI.getChildControl)(Panel_Window_Enchant, "Radiobutton_CronEnchantTab"), _effect_Enchant = (UI.getChildControl)(Panel_Window_Enchant, "Static_EnchantEffect"), _button_Apply = (UI.getChildControl)(Panel_Window_Enchant, "Button_EnchantApply"), _statictext_noticeApplyButton = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_NoticeApplyButton"), _checkbox_skipEffect = (UI.getChildControl)(Panel_Window_Enchant, "CheckBox_SkipEffect"), _tooltip_TargetItem = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Notice_Slot_0"), _tooltip_EnchantMaterial = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Notice_Slot_1"), _statictext_EnchantResult = (UI.getChildControl)(Panel_Window_Enchant, "StaticText_Result"), _difficultyBg = (UI.getChildControl)(Panel_Window_Enchant, "Static_DifficultyBg"), 
_difficultyValue = {}
, _frame_DescEnchant = (UI.getChildControl)(Panel_Window_Enchant, "Static_DescEnchantFrame"), _statictext_EnchantFailCount = nil, _statictext_ValksCount = nil, _statictext_TotalEnchantCount = nil, _statictext_EnchantInfo = nil, _button_SecretExtract = nil, _radiobutton_EasyEnchant = nil, _radiobutton_DifficultEnchant = nil, _checkbox_ForcedEnchant = nil, _checkbox_UseCron = nil, _tooltip_ForcedEnchant = nil, _tooltip_UseCron = nil, _slot_Cron = nil, _statictext_NumOfCron = nil, _static_descBG = nil, _frame_DescCronEnchant = (UI.getChildControl)(Panel_Window_Enchant, "Static_DescUpgradeFrame"), _progress_Cron = nil, _bg_ProgressCron = nil, 
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
_strForEnchantInfo = {_forcedChecked = "", _cronChecked = "", _notChecked = ""}
, _enchantInfo = nil, _screctExtractIvenType = nil, _numOfCronLevelText = 4, _animationTimeStamp = 0, _isAnimating = false, _resultFlag = false, _resultShowTime = 0, _resultTimeCheck = false, _grantItemSlotNo = nil, _grantItemWhereType = nil, _isLastEnchant = false, _isResulTextAnimation = false, _isPossiblePromotion = false, _isContentsEnable = ToClient_IsContentsGroupOpen("74"), _isCronBonusOpen = ToClient_IsContentsGroupOpen("222"), _isCronEnchantOpen = ToClient_IsContentsGroupOpen("234"), 
_enchantData = {}
, _isShowNoticeApplyButton = false}
-- DECOMPILER ERROR at PC1331: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant._enchantData = {
_20 = {
[0] = {
[1] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[2] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[3] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[4] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[5] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[6] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[7] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[8] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 2}
, 
[9] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 2, [10] = 7}
, 
[10] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 1, [9] = 7, [10] = 14}
, 
[11] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 5, [9] = 14, [10] = 24}
, 
[12] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 4, [8] = 13, [9] = 26, [10] = 40}
, 
[13] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 5, [7] = 13, [8] = 28, [9] = 50, [10] = 74}
, 
[14] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 5, [7] = 13, [8] = 28, [9] = 50, [10] = 74}
, 
[15] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 5, [7] = 13, [8] = 28, [9] = 50, [10] = 74}
, 
[16] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 5, [7] = 14, [8] = 28, [9] = 52, [10] = 75}
, 
[17] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 4, [6] = 13, [7] = 26, [8] = 48, [9] = 84, [10] = 120}
, 
[18] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 1, [5] = 7, [6] = 18, [7] = 34, [8] = 62, [9] = 106, [10] = 150}
, 
[19] = {[0] = 0, [1] = 0, [2] = 3, [3] = 10, [4] = 23, [5] = 43, [6] = 75, [7] = 128, [8] = 213, [9] = 350, [10] = 490}
, 
[20] = {[0] = 24, [1] = 40, [2] = 74, [3] = 124, [4] = 207, [5] = 340, [6] = 557, [7] = 907, [8] = 1474, [9] = 2390, [10] = 3324}
}
, 
[1] = {
[1] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[2] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[3] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[4] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[5] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[6] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[7] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[8] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 2}
, 
[9] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 1, [9] = 8, [10] = 15}
, 
[10] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 6, [9] = 16, [10] = 25}
, 
[11] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 4, [8] = 13, [9] = 26, [10] = 40}
, 
[12] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 3, [7] = 11, [8] = 24, [9] = 44, [10] = 65}
, 
[13] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 4, [6] = 12, [7] = 25, [8] = 46, [9] = 80, [10] = 115}
, 
[14] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 4, [6] = 13, [7] = 27, [8] = 50, [9] = 86, [10] = 124}
, 
[15] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 1, [5] = 8, [6] = 19, [7] = 36, [8] = 65, [9] = 110, [10] = 157}
, 
[16] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 5, [7] = 14, [8] = 28, [9] = 52, [10] = 75}
, 
[17] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 4, [6] = 13, [7] = 26, [8] = 48, [9] = 84, [10] = 120}
, 
[18] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 1, [5] = 7, [6] = 18, [7] = 34, [8] = 62, [9] = 106, [10] = 150}
, 
[19] = {[0] = 0, [1] = 0, [2] = 3, [3] = 10, [4] = 23, [5] = 43, [6] = 75, [7] = 128, [8] = 213, [9] = 350, [10] = 490}
, 
[20] = {[0] = 24, [1] = 40, [2] = 74, [3] = 124, [4] = 207, [5] = 340, [6] = 557, [7] = 907, [8] = 1474, [9] = 2390, [10] = 3324}
}
, 
[2] = {
[1] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[2] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[3] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[4] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[5] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[6] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[7] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[8] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0}
, 
[9] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 4, [8] = 12, [9] = 26, [10] = 39}
, 
[10] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 2, [7] = 10, [8] = 22, [9] = 41, [10] = 60}
, 
[11] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 1, [6] = 7, [7] = 18, [8] = 35, [9] = 62, [10] = 90}
, 
[12] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 6, [6] = 16, [7] = 32, [8] = 57, [9] = 98, [10] = 140}
, 
[13] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 7, [5] = 17, [6] = 33, [7] = 59, [8] = 102, [9] = 170, [10] = 240}
, 
[14] = {[0] = 0, [1] = 0, [2] = 0, [3] = 6, [4] = 16, [5] = 32, [6] = 58, [7] = 100, [8] = 168, [9] = 278, [10] = 390}
, 
[15] = {[0] = 0, [1] = 0, [2] = 3, [3] = 10, [4] = 23, [5] = 43, [6] = 75, [7] = 128, [8] = 213, [9] = 350, [10] = 490}
, 
[16] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 5, [7] = 14, [8] = 28, [9] = 52, [10] = 75}
, 
[17] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 4, [6] = 13, [7] = 26, [8] = 48, [9] = 84, [10] = 120}
, 
[18] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 1, [5] = 7, [6] = 18, [7] = 34, [8] = 62, [9] = 106, [10] = 150}
, 
[19] = {[0] = 0, [1] = 0, [2] = 3, [3] = 10, [4] = 23, [5] = 43, [6] = 75, [7] = 128, [8] = 213, [9] = 350, [10] = 490}
, 
[20] = {[0] = 24, [1] = 40, [2] = 74, [3] = 124, [4] = 207, [5] = 340, [6] = 557, [7] = 907, [8] = 1474, [9] = 2390, [10] = 3324}
}
}
, 
_10 = {
[0] = {
[1] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 1, [10] = 5}
, 
[2] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 1, [9] = 7, [10] = 13}
, 
[3] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 6, [9] = 15, [10] = 24}
, 
[4] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 4, [8] = 13, [9] = 27, [10] = 41}
, 
[5] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 3, [7] = 11, [8] = 24, [9] = 45, [10] = 66}
, 
[6] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 2, [6] = 10, [7] = 22, [8] = 41, [9] = 73, [10] = 104}
, 
[7] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 2, [5] = 8, [6] = 20, [7] = 37, [8] = 67, [9] = 114, [10] = 161}
, 
[8] = {[0] = 0, [1] = 0, [2] = 0, [3] = 1, [4] = 7, [5] = 17, [6] = 34, [7] = 61, [8] = 105, [9] = 175, [10] = 247}
, 
[9] = {[0] = 0, [1] = 0, [2] = 0, [3] = 6, [4] = 15, [5] = 31, [6] = 56, [7] = 96, [8] = 162, [9] = 267, [10] = 375}
, 
[10] = {[0] = 0, [1] = 0, [2] = 5, [3] = 14, [4] = 28, [5] = 51, [6] = 89, [7] = 149, [8] = 247, [9] = 406, [10] = 567}
}
}
, 
_5 = {
[0] = {
[1] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 6, [8] = 16, [9] = 32, [10] = 48}
, 
[2] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 4, [6] = 12, [7] = 25, [8] = 46, [9] = 80, [10] = 115}
, 
[3] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 3, [5] = 11, [6] = 24, [7] = 45, [8] = 79, [9] = 134, [10] = 190}
, 
[4] = {[0] = 0, [1] = 0, [2] = 0, [3] = 6, [4] = 16, [5] = 32, [6] = 58, [7] = 100, [8] = 168, [9] = 278, [10] = 390}
, 
[5] = {[0] = 10, [1] = 20, [2] = 40, [3] = 70, [4] = 120, [5] = 200, [6] = 330, [7] = 540, [8] = 880, [9] = 1430, [10] = 1990}
}
, 
[1] = {
[1] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 5, [9] = 14, [10] = 24}
, 
[2] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 1, [6] = 7, [7] = 18, [8] = 35, [9] = 62, [10] = 90}
, 
[3] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 4, [6] = 13, [7] = 27, [8] = 50, [9] = 86, [10] = 124}
, 
[4] = {[0] = 0, [1] = 0, [2] = 0, [3] = 6, [4] = 16, [5] = 32, [6] = 58, [7] = 100, [8] = 168, [9] = 278, [10] = 390}
, 
[5] = {[0] = 10, [1] = 20, [2] = 40, [3] = 70, [4] = 120, [5] = 200, [6] = 330, [7] = 540, [8] = 880, [9] = 1430, [10] = 1990}
}
, 
[2] = {
[1] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 1, [10] = 5}
, 
[2] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 6, [9] = 16, [10] = 26}
, 
[3] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 3, [7] = 11, [8] = 24, [9] = 45, [10] = 66}
, 
[4] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 1, [5] = 8, [6] = 19, [7] = 36, [8] = 65, [9] = 110, [10] = 157}
, 
[5] = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 7, [5] = 17, [6] = 33, [7] = 59, [8] = 102, [9] = 170, [10] = 240}
}
}
}
-- DECOMPILER ERROR at PC1334: Confused about usage of register: R0 in 'UnsetPending'

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
  -- DECOMPILER ERROR at PC283: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._stackTitle = (UI.getChildControl)((self._ui)._bg_ProgressCron, "StaticText_StackTitle")
  -- DECOMPILER ERROR at PC291: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._currentGrade = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_CurrentGrade")
  -- DECOMPILER ERROR at PC299: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._maxGrade = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_MaxGrade")
  -- DECOMPILER ERROR at PC307: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._currentStat = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "StaticText_CurrentStack")
  -- DECOMPILER ERROR at PC315: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._progress = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "Progress2_EnergyEXP")
  -- DECOMPILER ERROR at PC323: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._static_descBG = (UI.getChildControl)((self._ui)._frame_DescCronEnchant, "Static_DescBg")
  for dIndex = 0, 10 do
    -- DECOMPILER ERROR at PC338: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._difficultyValue)[dIndex] = (UI.getChildControl)((self._ui)._difficultyBg, "Static_Difficulty_" .. dIndex)
    ;
    (((self._ui)._difficultyValue)[dIndex]):SetShow(false)
  end
  local slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
  -- DECOMPILER ERROR at PC359: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._slot_TargetItem).icon = (UI.getChildControl)(Panel_Window_Enchant, "Static_Slot_0")
  ;
  (SlotItem.new)((self._ui)._slot_TargetItem, "Slot_0", 0, Panel_Window_Enchant, slotConfig)
  ;
  ((self._ui)._slot_TargetItem):createChild()
  -- DECOMPILER ERROR at PC375: Confused about usage of register: R2 in 'UnsetPending'

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
  -- DECOMPILER ERROR at PC412: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._slot_EnchantMaterial).icon = (UI.getChildControl)(Panel_Window_Enchant, "Static_Slot_1")
  ;
  (SlotItem.new)((self._ui)._slot_EnchantMaterial, "Slot_1", 1, Panel_Window_Enchant, slotConfig)
  ;
  ((self._ui)._slot_EnchantMaterial):createChild()
  -- DECOMPILER ERROR at PC428: Confused about usage of register: R2 in 'UnsetPending'

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
  ((self._ui)._statictext_StackForNext):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._checkbox_skipEffect):SetEnableArea(0, 0, ((self._ui)._checkbox_skipEffect):GetTextSizeX() + 60, ((self._ui)._checkbox_skipEffect):GetSizeY())
  local itemSSW = FromClient_getPreventDownGradeItem()
  ;
  ((self._ui)._slot_Cron):ChangeTextureInfoName("")
  ;
  ((self._ui)._statictext_noticeApplyButton):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._statictext_noticeApplyButton):SetAutoResize(true)
  ;
  ((self._ui)._statictext_EnchantResult):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._button_SecretExtract):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._button_SecretExtract):SetText(((self._ui)._button_SecretExtract):GetText())
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
  ((self._ui)._radiobutton_EasyEnchant):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:didsetEnchantTarget(nil,true)")
  ;
  ((self._ui)._radiobutton_EasyEnchant):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnEasyEnchant()")
  ;
  ((self._ui)._radiobutton_EasyEnchant):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutEasyEnchant()")
  ;
  ((self._ui)._radiobutton_DifficultEnchant):addInputEvent("Mouse_LUp", "PaGlobal_Enchant:didsetEnchantTarget(nil,true)")
  ;
  ((self._ui)._radiobutton_DifficultEnchant):addInputEvent("Mouse_On", "PaGlobal_Enchant:handlemOnDifficultEnchant()")
  ;
  ((self._ui)._radiobutton_DifficultEnchant):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutDifficultEnchant()")
  ;
  (((self._ui)._addStatBg)[0]):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnAddStat(" .. 0 .. ")")
  ;
  (((self._ui)._addStatBg)[0]):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutAddStat()")
  ;
  (((self._ui)._addStatBg)[1]):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnAddStat(" .. 1 .. ")")
  ;
  (((self._ui)._addStatBg)[1]):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutAddStat()")
  ;
  (((self._ui)._addStatBg)[2]):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnAddStat(" .. 2 .. ")")
  ;
  (((self._ui)._addStatBg)[2]):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutAddStat()")
  ;
  (((self._ui)._addStatBg)[3]):addInputEvent("Mouse_On", "PaGlobal_Enchant:handleMOnAddStat(" .. 3 .. ")")
  ;
  (((self._ui)._addStatBg)[3]):addInputEvent("Mouse_Out", "PaGlobal_Enchant:handleMOutAddStat()")
  ;
  (((self._ui)._statictext_AddStat)[0]):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  ;
  (((self._ui)._statictext_AddStat)[1]):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  ;
  (((self._ui)._statictext_AddStat)[2]):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  ;
  (((self._ui)._statictext_AddStat)[3]):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  registerEvent("EventEnchantResultShow", "FromClient_EnchantResultShow")
  registerEvent("FromClient_UpgradeItem", "FromClient_UpgradeItem")
  registerEvent("FromClient_UpdateEnchantFailCount", "FromClient_UpdateEnchantFailCount")
  registerEvent("FromClient_PromotionItem", "FromClient_PromotionItem")
  registerEvent("onScreenResize", "OnScreenEvent")
  Panel_Window_Enchant:RegisterUpdateFunc("UpdateFunc_checkAnimation")
  ;
  ((self._ui)._radiobutton_CronEnchantTab):SetShow(self._isCronEnchantOpen)
end

-- DECOMPILER ERROR at PC1337: Confused about usage of register: R0 in 'UnsetPending'

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
  self._isShowNoticeApplyButton = false
  self:setText_NumOfCron(0, 0)
  self:setAsEnchantButton()
  self:showDifficultEnchantButton(false)
  if not self._isContentsEnable then
    ((self._ui)._useCronIcon):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC1340: Confused about usage of register: R0 in 'UnsetPending'

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
  self._isShowNoticeApplyButton = false
  self:setTextCronEnchantState(0, 0)
  self:setCronStackProgress(0, 0)
  self:setAsCronEnchantButton()
  self:hideAllCronCountText()
  ;
  ((self._ui)._static_descBG):SetSize(((self._ui)._static_descBG):GetSizeX(), 60)
  ;
  ((self._ui)._static_descBG):ComputePos()
  ;
  ((self._ui)._statictext_BounsStats):SetText("\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_SETEQUIPMENT"))
  ;
  ((self._ui)._statictext_BounsStats):SetPosY(0)
  ;
  ((self._ui)._statictext_BounsStats):ComputePos()
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
  ;
  ((self._ui)._currentGrade):SetShow(false)
  ;
  ((self._ui)._maxGrade):SetShow(false)
  ;
  ((self._ui)._currentStat):SetShow(false)
  ;
  ((self._ui)._progress):SetShow(false)
end

-- DECOMPILER ERROR at PC1343: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC1346: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showScretExtractButton = function(self, isShow)
  -- function num : 0_4
  if _ContentsGroup_isSecretExtract then
    ((self._ui)._button_SecretExtract):SetShow(isShow)
  else
    ;
    ((self._ui)._button_SecretExtract):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC1349: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.clearItemSlot = function(self, itemSlot)
  -- function num : 0_5
  itemSlot.inventoryType = nil
  itemSlot.slotNo = nil
  itemSlot:clearItem()
  itemSlot.empty = true
  ;
  (itemSlot.icon):EraseAllEffect()
end

-- DECOMPILER ERROR at PC1352: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setItemToSlot = function(self, uiSlot, slotNo, itemWrapper, inventoryType)
  -- function num : 0_6
  (uiSlot.icon):AddEffect("UI_Button_Hide", false, 0, 0)
  uiSlot.empty = false
  uiSlot.slotNo = slotNo
  uiSlot.inventoryType = inventoryType
  ;
  (uiSlot.icon):SetMonoTone(false)
  uiSlot:setItem(getInventoryItemByType(inventoryType, slotNo))
  ;
  ((self._ui)._difficultyBg):SetShow(false)
  if (self._ui)._slot_TargetItem == uiSlot then
    self:showDifficulty(inventoryType, slotNo)
  end
end

-- DECOMPILER ERROR at PC1355: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC1358: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC1361: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.SetCheck_RadioButton = function(self, radioBtn, isTrue)
  -- function num : 0_9
  radioBtn:SetCheck(isTrue)
end

-- DECOMPILER ERROR at PC1364: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC1367: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setAsEnchantButton = function(self)
  -- function num : 0_11
  ((self._ui)._button_Apply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENCHANT_DOENCHANT"))
end

-- DECOMPILER ERROR at PC1370: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setAsCronEnchantButton = function(self)
  -- function num : 0_12
  ((self._ui)._button_Apply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_APPLY_BUTTON_NORM_CAPHRAS"))
end

-- DECOMPILER ERROR at PC1373: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setAsPromotionEnchantButton = function(self)
  -- function num : 0_13
  ((self._ui)._button_Apply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_APPLY_BUTTON_MAX_CAPHRAS"))
end

-- DECOMPILER ERROR at PC1376: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnable_CheckboxForcedEnchant = function(self, isEnable)
  -- function num : 0_14
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

-- DECOMPILER ERROR at PC1379: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnable_CheckboxUseCron = function(self, isEnable)
  -- function num : 0_15
  if not self._isContentsEnable then
    isEnable = false
  end
  ;
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

-- DECOMPILER ERROR at PC1382: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setText_NumOfCron = function(self, cnt, needCnt)
  -- function num : 0_16
  if cnt < needCnt then
    ((self._ui)._statictext_NumOfCron):SetText("<PAColor0xffff7383>" .. tostring(cnt) .. "/" .. tostring(needCnt) .. "<PAOldColor>")
  else
    ;
    ((self._ui)._statictext_NumOfCron):SetText("<PAColor0xFF0FBFFF>" .. tostring(cnt) .. "/" .. tostring(needCnt) .. "<PAOldColor>")
  end
end

-- DECOMPILER ERROR at PC1385: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setText_EnchantInfo = function(self, isChecked)
  -- function num : 0_17
  if isChecked then
    ((self._ui)._statictext_EnchantInfo):SetText((self._strForEnchantInfo)._forcedChecked)
    ;
    ((self._ui)._checkbox_UseCron):SetCheck(false)
  else
    ;
    ((self._ui)._statictext_EnchantInfo):SetText((self._strForEnchantInfo)._notChecked)
  end
end

-- DECOMPILER ERROR at PC1388: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setText_EnchantProtectInfo = function(self, isChecked)
  -- function num : 0_18
  if isChecked then
    ((self._ui)._statictext_EnchantInfo):SetText((self._strForEnchantInfo)._cronChecked)
    ;
    ((self._ui)._checkbox_ForcedEnchant):SetCheck(false)
  else
    ;
    ((self._ui)._statictext_EnchantInfo):SetText((self._strForEnchantInfo)._notChecked)
  end
end

-- DECOMPILER ERROR at PC1391: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addEnchantEffectToItemSlot = function(self, icon)
  -- function num : 0_19
  icon:EraseAllEffect()
  icon:AddEffect("fUI_LimitOver01A", false, 0, 0)
end

-- DECOMPILER ERROR at PC1394: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addEnchantSuccessEffectToItemSlot = function(self, icon)
  -- function num : 0_20
  icon:AddEffect("UI_ItemEnchant01", false, -6, -6)
end

-- DECOMPILER ERROR at PC1397: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addWeaponEnchantEffect = function(self)
  -- function num : 0_21
  ((self._ui)._effect_Enchant):EraseAllEffect()
  ;
  ((self._ui)._effect_Enchant):AddEffect("fUI_LimitOver02A", true, 0, 0)
  ;
  ((self._ui)._effect_Enchant):AddEffect("UI_LimitOverLine_Red", false, 0, 0)
  ;
  ((self._ui)._effect_Enchant):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
end

-- DECOMPILER ERROR at PC1401: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addAmorEnchantEffect = function(self)
  -- function num : 0_22
  ((self._ui)._effect_Enchant):EraseAllEffect()
  ;
  ((self._ui)._effect_Enchant):AddEffect("fUI_LimitOver02A", true, 0, 0)
  ;
  ((self._ui)._effect_Enchant):AddEffect("UI_LimitOverLine", false, 0, 0)
  ;
  ((self._ui)._effect_Enchant):AddEffect("fUI_LimitOver_Spark", false, 0, 0)
end

-- DECOMPILER ERROR at PC1405: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeEnchantEffect = function(self)
  -- function num : 0_23
  ((self._ui)._effect_Enchant):EraseAllEffect()
  ;
  (((self._ui)._slot_EnchantMaterial).icon):EraseAllEffect()
  ;
  (((self._ui)._slot_TargetItem).icon):EraseAllEffect()
end

-- DECOMPILER ERROR at PC1409: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addFailCountEffectForTutorial = function(self)
  -- function num : 0_24
  ((self._ui)._statictext_EnchantFailCount):AddEffect("UI_QustComplete01", false, 0, 0)
end

-- DECOMPILER ERROR at PC1413: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeFailCountEffect = function(self)
  -- function num : 0_25
  ((self._ui)._statictext_EnchantFailCount):EraseAllEffect()
end

-- DECOMPILER ERROR at PC1417: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addValksCountEffectForTutorial = function(self)
  -- function num : 0_26
  ((self._ui)._statictext_ValksCount):AddEffect("UI_QustComplete02", true, 0, 0)
  ;
  ((self._ui)._statictext_ValksCount):AddEffect("UI_ArrowMark06", true, ((self._ui)._statictext_ValksCount):GetSizeX() * -0.9, 0)
end

-- DECOMPILER ERROR at PC1421: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeValksCountEffect = function(self)
  -- function num : 0_27
  ((self._ui)._statictext_ValksCount):EraseAllEffect()
end

-- DECOMPILER ERROR at PC1425: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addTargetSlotEffectForTutorial = function(self)
  -- function num : 0_28
  (((self._ui)._slot_TargetItem).icon):AddEffect("UI_ArrowMark02", true, 0, -50)
  ;
  (((self._ui)._slot_TargetItem).icon):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
end

-- DECOMPILER ERROR at PC1429: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeTargetSlotEffect = function(self)
  -- function num : 0_29
  (((self._ui)._slot_TargetItem).icon):EraseAllEffect()
end

-- DECOMPILER ERROR at PC1433: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addMaterialSlotEffectForTutorial = function(self)
  -- function num : 0_30
  (((self._ui)._slot_EnchantMaterial).icon):AddEffect("UI_ArrowMark02", true, 0, -50)
  ;
  (((self._ui)._slot_EnchantMaterial).icon):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
end

-- DECOMPILER ERROR at PC1437: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeMaterialSlotEffect = function(self)
  -- function num : 0_31
  (((self._ui)._slot_EnchantMaterial).icon):EraseAllEffect()
end

-- DECOMPILER ERROR at PC1441: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.addApplyButtonEffectForTutorial = function(self)
  -- function num : 0_32
  ((self._ui)._button_Apply):AddEffect("UI_ArrowMark02", true, 0, -50)
  ;
  ((self._ui)._button_Apply):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
end

-- DECOMPILER ERROR at PC1445: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.removeApplyButtonEffect = function(self)
  -- function num : 0_33
  ((self._ui)._button_Apply):EraseAllEffect()
end

-- DECOMPILER ERROR at PC1449: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showPanel = function(self)
  -- function num : 0_34
  if _ContentsGroup_RenewUI == true then
    PaGlobalFunc_InventoryInfo_Open()
    Panel_Window_Enchant:SetShow(true, true)
    self:clearEnchantSlot()
    OnScreenEvent()
    return 
  end
  InventoryWindow_Show()
  self:clearEnchantSlot()
  if _ContentsGroup_RenewUI == false then
    Equipment_PosSaveMemory()
    Panel_Equipment:SetShow(true, true)
    Panel_Equipment:SetPosX((self._const)._gapX_PanelEquip)
    Panel_Equipment:SetPosY(getScreenSizeY() - getScreenSizeY() / 2 - Panel_Equipment:GetSizeY() / 2)
  end
  Panel_Window_Enchant:SetShow(true, true)
  OnScreenEvent()
end

-- DECOMPILER ERROR at PC1453: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextEnchantFailCntWithCnt = function(self, cnt)
  -- function num : 0_35
  ((self._ui)._statictext_EnchantFailCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_HELP", "failCount", cnt))
end

-- DECOMPILER ERROR at PC1457: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextValksCntWithCnt = function(self, cnt)
  -- function num : 0_36
  ((self._ui)._statictext_ValksCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPIRITENCHANT_VALKSCOUNT", "count", cnt))
end

-- DECOMPILER ERROR at PC1461: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextTotalEnchantCntWithCnt = function(self, cnt)
  -- function num : 0_37
  ((self._ui)._statictext_TotalEnchantCount):SetText("<PAColor0xffffbc1a>+ " .. cnt)
end

-- DECOMPILER ERROR at PC1465: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextCronEnchantState = function(self, curLevel, curStack)
  -- function num : 0_38
  ((self._ui)._statictext_CurCronState):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CURRENTSTATE", "level", tostring(curLevel), "stack", tostring(curStack)))
  ;
  ((self._ui)._statictext_EnchantResult):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CURRENTGRADE_CAPHRAS", "level", curLevel))
end

-- DECOMPILER ERROR at PC1469: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextCronEnchantResultState = function(self)
  -- function num : 0_39
  local curLevel = (self._enchantInfo):ToClient_getCurLevel()
  local maxLevel = (self._enchantInfo):ToClient_getMaxLevel()
  if maxLevel == curLevel then
    ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FINALGRADE_CAPHRAS"))
  else
    ;
    ((self._ui)._statictext_EnchantResult):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CURRENTGRADE_CAPHRAS", "level", curLevel))
  end
end

-- DECOMPILER ERROR at PC1473: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextStackForNext = function(self, needStack)
  -- function num : 0_40
  local curLevel = (self._enchantInfo):ToClient_getCurLevel()
  local maxLevel = (self._enchantInfo):ToClient_getMaxLevel()
  if maxLevel == curLevel then
    ((self._ui)._statictext_StackForNext):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_FINALENERGY"))
  else
    if curLevel < maxLevel then
      local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
      if itemWrapper ~= nil then
        local itemSSW = itemWrapper:getStaticStatus()
        local cronKey = itemSSW:getCronKey()
        local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
        local cronEnchantSSW = ToClient_GetCronEnchantWrapper(cronKey, enchantLevel, curLevel)
        local addText = self:setTextBonusStats(cronEnchantSSW:getAddedDD(), cronEnchantSSW:getAddedHIT(), cronEnchantSSW:getAddedDV(), cronEnchantSSW:getAddedHDV(), cronEnchantSSW:getAddedPV(), cronEnchantSSW:getAddedHPV(), cronEnchantSSW:getAddedMaxHP(), cronEnchantSSW:getAddedMaxMP(), true)
        ;
        ((self._ui)._statictext_StackForNext):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_NEXT_BONUS", "bonus", addText))
      end
    end
  end
end

-- DECOMPILER ERROR at PC1477: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setNeedCountToMatrialSlot = function(self, slot, needCnt)
  -- function num : 0_41
  _PA_LOG("이문�\133", "needCnt : " .. tostring(needCnt))
  ;
  (slot.count):SetText("<PAColor0xFF0FBFFF>" .. tostring(needCnt) .. "<PAOldColor>")
  PaGlobal_Enchant:setEnable_button_Apply(not isAble)
end

-- DECOMPILER ERROR at PC1481: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setCronStackProgress = function(self, curStack, maxStack, nextStack)
  -- function num : 0_42
  local rate = 0
  if maxStack ~= 0 then
    rate = curStack / maxStack * 100
  end
  ;
  ((self._ui)._progress):SetProgressRate(rate)
  ;
  ((self._ui)._currentStat):SetText((string.format)("%.3f", rate) .. " %")
  if nextStack ~= nil then
    ((self._ui)._maxGrade):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_NEXT_STEP_CAPHRAS", "val", nextStack))
  else
    local maxLevel = (self._enchantInfo):ToClient_getMaxLevel()
    ;
    ((self._ui)._maxGrade):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_MAX_CRONELV", "level", tostring(maxLevel)))
  end
  do
    if self._grantItemWhereType == nil or self._grantItemSlotNo == nil then
      return 
    end
    local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
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
end

-- DECOMPILER ERROR at PC1485: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setTextBonusStats = function(self, DD, HIT, DV, HDV, PV, HPV, HP, MP, isReturn)
  -- function num : 0_43
  local str = ""
  if DD > 0 then
    str = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_ATTACK") .. tostring(DD)
  end
  if HIT > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_HIT") .. tostring(HIT)
  end
  if DV > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_DODGE") .. tostring(DV)
  end
  if HDV > 0 then
    if DV == 0 then
      if str ~= "" then
        str = str .. " / "
      end
      str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_DODGE") .. "0" .. "(+" .. tostring(HDV) .. ")"
    else
      str = str .. "(+" .. tostring(HDV) .. ")"
    end
  end
  if PV > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_REDUCE") .. tostring(PV)
  end
  if HPV > 0 then
    if PV == 0 then
      if str ~= "" then
        str = str .. " / "
      end
      str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_REDUCE") .. "0" .. "(+" .. tostring(HPV) .. ")"
    else
      str = str .. "(+" .. tostring(HPV) .. ")"
    end
  end
  if HP > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_HP") .. tostring(HP)
  end
  if MP > 0 then
    if str ~= "" then
      str = str .. " / "
    end
    str = str .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_MP") .. tostring(MP)
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

-- DECOMPILER ERROR at PC1489: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.initCronLevelAndCountText = function(self, maxLevel)
  -- function num : 0_44
  local curCount = nil
  local maxCountInv = 1 / (self._enchantInfo):ToClient_getStackForLevel(maxLevel - 1) * ((self._ui)._progress):GetSizeX()
  local maxIdx = (math.max)(maxLevel, self._numOfCronLevelText) - 1
  for idx = 0, maxIdx do
    if idx < maxLevel then
      local maxCount = (self._enchantInfo):ToClient_getStackForLevel(maxIdx)
      curCount = (self._enchantInfo):ToClient_getStackForLevel(idx)
      ;
      ((self._ui)._stackTitle):SetPosY((self._const)._posY_CronCount + 2)
      if ((self._ui)._addStatBg)[idx] ~= nil then
        local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
        if itemWrapper ~= nil then
          local itemSSW = itemWrapper:getStaticStatus()
          local itemClassifyType = itemSSW:getItemClassify()
          local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
          local cronEnchantSSW = ToClient_GetCronEnchantWrapper(itemClassifyType, enchantLevel, idx)
          local addText = self:setTextBonusStats(cronEnchantSSW:getAddedDD(), cronEnchantSSW:getAddedHIT(), cronEnchantSSW:getAddedDV(), cronEnchantSSW:getAddedHDV(), cronEnchantSSW:getAddedPV(), cronEnchantSSW:getAddedHPV(), cronEnchantSSW:getAddedMaxHP(), cronEnchantSSW:getAddedMaxMP(), true)
        end
      end
    else
      do
        do
          ;
          ((self._ui)._stackTitle):SetShow(false)
          -- DECOMPILER ERROR at PC88: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC88: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC88: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  ((self._ui)._topDesc):SetShow(false)
  ;
  ((self._ui)._topDesc2):SetShow(true)
  ;
  ((self._ui)._topDesc2):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._topDesc2):SetText(((self._ui)._topDesc2):GetText())
  ;
  ((self._ui)._statictext_CurCronState):SetShow(false)
  ;
  ((self._ui)._bg_ProgressCron):SetShow(false)
  ;
  ((self._ui)._progress_Cron):SetShow(false)
  ;
  ((self._ui)._progress_CronBg):SetShow(false)
  ;
  ((self._ui)._stackTitle):SetShow(false)
  self._numOfCronLevelText = maxIdx + 1
  ;
  ((self._ui)._currentGrade):SetShow(true)
  ;
  ((self._ui)._maxGrade):SetShow(true)
  ;
  ((self._ui)._currentStat):SetShow(true)
  ;
  ((self._ui)._progress):SetShow(true)
  local maxLevel = (self._enchantInfo):ToClient_getMaxLevel()
  local curLevel = (self._enchantInfo):ToClient_getCurLevel()
  ;
  ((self._ui)._currentGrade):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_CURRENT_CRONELV", "level", tostring(curLevel)))
end

-- DECOMPILER ERROR at PC1493: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.hideAllCronCountText = function(self)
  -- function num : 0_45
  for idx = 0, self._numOfCronLevelText - 1 do
  end
  ;
  ((self._ui)._topDesc):SetShow(true)
  ;
  ((self._ui)._topDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._topDesc):SetText(((self._ui)._topDesc):GetText())
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

-- DECOMPILER ERROR at PC1497: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.setEnchantFailCount = function(self)
  -- function num : 0_46
  if self._enchantInfo == nil then
    self._enchantInfo = getEnchantInformation()
    ;
    (self._enchantInfo):ToClient_clearData()
  end
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

-- DECOMPILER ERROR at PC1501: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showDifficulty = function(self, inventoryType, slotNo)
  -- function num : 0_47
  if not isGameServiceTypeDev() then
    ((self._ui)._difficultyBg):SetShow(false)
    return 
  end
  for index = 0, 10 do
    (((self._ui)._difficultyValue)[index]):SetShow(false)
  end
  if ((self._ui)._checkbox_ForcedEnchant):IsCheck() then
    (((self._ui)._difficultyValue)[10]):SetShow(true)
    return 
  end
  local failCount = (self._enchantInfo):ToClient_getFailCount()
  local valksCount = (self._enchantInfo):ToClient_getValksCount()
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if itemWrapper == nil then
    ((self._ui)._difficultyBg):SetShow(false)
    return 
  end
  local itemSSW = itemWrapper:getStaticStatus()
  local itemClassifyType = itemSSW:getItemClassify()
  local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
  local maxEnchantLevel = 0
  for index = 1, 20 do
    local nextEnchantLevel = ((itemSSW:get())._key):getEnchantLevel() + index
    local enchantItemKey = ItemEnchantKey(((itemSSW:get())._key):getItemKey(), nextEnchantLevel)
    enchantItemKey:set(((itemSSW:get())._key):getItemKey(), nextEnchantLevel)
    local enchantItemSSW = getItemEnchantStaticStatus(enchantItemKey)
    if enchantItemSSW ~= nil then
      do
        if enchantItemSSW:get() == nil then
          break
        end
        maxEnchantLevel = nextEnchantLevel
        -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
  local enchantData = {}
  if maxEnchantLevel == 20 then
    local itemGrade = itemSSW:getGradeType()
    if itemGrade < 2 then
      if ((self._ui)._radiobutton_EasyEnchant):IsCheck() then
        enchantData = ((self._enchantData)._20)[0]
      else
        enchantData = ((self._enchantData)._20)[1]
      end
    else
      ;
      ((self._ui)._difficultyBg):SetShow(false)
      return 
    end
  else
    do
      ;
      ((self._ui)._difficultyBg):SetShow(false)
      do return  end
      local veryLow = true
      for index = 10, 0, -1 do
        if (enchantData[enchantLevel + 1])[index] <= failCount + valksCount then
          (((self._ui)._difficultyValue)[index]):SetShow(true)
          veryLow = false
          break
        end
      end
      do
        if veryLow then
          (((self._ui)._difficultyValue)[0]):SetShow(true)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC1505: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showSlotToolTip = function(self, toolTip, text)
  -- function num : 0_48
  toolTip:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  toolTip:SetAutoResize(true)
  toolTip:SetText(text)
  toolTip:SetSize(toolTip:GetSizeX() + (self._const)._gapX_ToolTip, toolTip:GetTextSizeY() + (self._const)._gapY_ToolTip)
  toolTip:SetShow(true)
end

-- DECOMPILER ERROR at PC1509: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showNoticeEnchantApply = function(self, enchantType)
  -- function num : 0_49
  if enchantType == (self._enum_EnchantType)._safe then
    local isWeapon = true
    local isCollectTool = true
    local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
    do
      do
        if itemWrapper ~= nil then
          local itemSSW = itemWrapper:getStaticStatus()
          if not (itemSSW:get()):isWeapon() and not (itemSSW:get()):isSubWeapon() then
            isWeapon = (itemSSW:get()):isAwakenWeapon()
          end
          isCollectTool = (itemSSW:get()):isCollectTool()
        end
        if isWeapon or isCollectTool then
          ((self._ui)._statictext_noticeApplyButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_WEAPONE"))
        else
          ;
          ((self._ui)._statictext_noticeApplyButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SPRITENCHANT_SAFEENCHANT_ARMOR"))
        end
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
        ;
        ((self._ui)._statictext_noticeApplyButton):SetShow(true)
        self._isShowNoticeApplyButton = true
        ;
        ((self._ui)._statictext_noticeApplyButton):SetPosY((((self._ui)._statictext_noticeApplyButton):GetSizeY() + 5) * -1)
      end
    end
  end
end

-- DECOMPILER ERROR at PC1513: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showEnchantResultText = function(self, resultType, mainSlotNo, mainWhereType)
  -- function num : 0_50
  if resultType == (self._enum_EnchantResult)._success then
    ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_0"))
    ;
    ((self._ui)._statictext_EnchantResult):EraseAllEffect()
    ;
    ((self._ui)._statictext_EnchantResult):AddEffect("UI_QustComplete01", false, 0, 0)
  else
    if resultType == (self._enum_EnchantResult)._fail then
      ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_1"))
      ;
      ((self._ui)._statictext_EnchantResult):EraseAllEffect()
      ;
      ((self._ui)._statictext_EnchantResult):AddEffect("fUI_Enchant_Fail", false, 0, 0)
    else
      if resultType == (self._enum_EnchantResult)._broken then
        ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_2"))
        ;
        ((self._ui)._statictext_EnchantResult):EraseAllEffect()
        ;
        ((self._ui)._statictext_EnchantResult):AddEffect("fUI_Enchant_Fail", false, 0, 0)
      else
        if resultType == (self._enum_EnchantResult)._gradedown then
          ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_3"))
          ;
          ((self._ui)._statictext_EnchantResult):EraseAllEffect()
          ;
          ((self._ui)._statictext_EnchantResult):AddEffect("fUI_Enchant_Fail", false, 0, 0)
        else
          if resultType == (self._enum_EnchantResult)._failAndPrevent then
            ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_4"))
            ;
            ((self._ui)._statictext_EnchantResult):EraseAllEffect()
            ;
            ((self._ui)._statictext_EnchantResult):AddEffect("fUI_Enchant_Fail", false, 0, 0)
          end
        end
      end
    end
  end
  ;
  ((self._ui)._statictext_EnchantResult):SetShow(true)
  self._resultFlag = true
  self._resultTimeCheck = true
  self:showEffectByResult(resultType, mainSlotNo, mainWhereType)
end

-- DECOMPILER ERROR at PC1517: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showEffectByResult = function(self, resultType, mainSlotNo, mainWhereType)
  -- function num : 0_51
  if resultType == (self._enum_EnchantResult)._success then
    local itemWrapper = getInventoryItemByType(mainWhereType, mainSlotNo)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
      if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
        (((self._ui)._slot_TargetItem).icon):AddEffect("UI_ItemEnchant01", false, -6, -6)
      else
        ;
        (((self._ui)._slot_TargetItem).icon):AddEffect("UI_ItemEnchant01", false, -6, -6)
      end
    end
  else
    do
      ;
      (((self._ui)._slot_TargetItem).icon):AddEffect("", false, -6, -6)
    end
  end
end

-- DECOMPILER ERROR at PC1521: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showCronEnchantResult = function(self, variedCount)
  -- function num : 0_52
  ((self._ui)._statictext_EnchantResult):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_5_CAPHRAS", "count", tostring(variedCount)))
  ;
  ((self._ui)._statictext_EnchantResult):SetShow(true)
  ;
  ((self._ui)._statictext_EnchantResult):EraseAllEffect()
  ;
  ((self._ui)._statictext_EnchantResult):AddEffect("UI_QustComplete01", false, 0, 0)
  self._resultTimeCheck = true
end

-- DECOMPILER ERROR at PC1525: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showPromotionResult = function(self)
  -- function num : 0_53
  ((self._ui)._statictext_EnchantResult):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEWENCHANT_RESULT_PROMOTION_CAPHRAS"))
  ;
  ((self._ui)._statictext_EnchantResult):SetShow(true)
  ;
  ((self._ui)._statictext_EnchantResult):EraseAllEffect()
  ;
  ((self._ui)._statictext_EnchantResult):AddEffect("UI_QustComplete01", false, 0, 0)
  self._resultTimeCheck = true
end

-- DECOMPILER ERROR at PC1529: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.showEnchantProbability = function(self, count)
  -- function num : 0_54
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

-- DECOMPILER ERROR at PC1533: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOnAddStat = function(self, index)
  -- function num : 0_55
  local itemWrapper = getInventoryItemByType(self._grantItemWhereType, self._grantItemSlotNo)
  if itemWrapper ~= nil then
    local itemSSW = itemWrapper:getStaticStatus()
    local itemClassifyType = itemSSW:getItemClassify()
    local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
    local cronEnchantSSW = ToClient_GetCronEnchantWrapper(itemClassifyType, enchantLevel, index)
    local addText = self:setTextBonusStats(cronEnchantSSW:getAddedDD(), cronEnchantSSW:getAddedHIT(), cronEnchantSSW:getAddedDV(), cronEnchantSSW:getAddedHDV(), cronEnchantSSW:getAddedPV(), cronEnchantSSW:getAddedHPV(), cronEnchantSSW:getAddedMaxHP(), cronEnchantSSW:getAddedMaxMP(), true)
    TooltipSimple_Show(((self._ui)._addStatBg)[index], addText)
  end
end

-- DECOMPILER ERROR at PC1537: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Enchant.handleMOutAddStat = function(self)
  -- function num : 0_56
  TooltipSimple_Hide()
end

FromClient_luaLoadComplete_Enchant = function()
  -- function num : 0_57
  PaGlobal_Enchant:initialize()
end


