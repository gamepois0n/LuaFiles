-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fairyinfo\panel_window_fairyupgrade.luac 

-- params : ...
-- function num : 0
Panel_Window_FairyUpgrade:SetShow(false)
local UI_TM = CppEnums.TextMode
local FairyUpgrade = {
_UI = {_close = (UI.getChildControl)(Panel_Window_FairyUpgrade, "Button_Win_Close"), _mainBG = (UI.getChildControl)(Panel_Window_FairyUpgrade, "Static_MainBG"), _upgrade = (UI.getChildControl)(Panel_Window_FairyUpgrade, "Button_Upgrade"), _bottomDescBG = (UI.getChildControl)(Panel_Window_FairyUpgrade, "Static_BottomBG")}
, _isAnimating = false, _currentItemEnchantKey = nil, _currentItemSlotNo = 0, _currentItemStackCount = 0, _const_aniTime = 2.3, _ani_TimeStamp = 0, _previewExpRate = 0, _previewLevel = 0}
-- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

;
(FairyUpgrade._UI)._iconFairy = (UI.getChildControl)((FairyUpgrade._UI)._mainBG, "Static_FairyBG")
-- DECOMPILER ERROR at PC56: Confused about usage of register: R2 in 'UnsetPending'

;
(FairyUpgrade._UI)._bottomDesc = (UI.getChildControl)((FairyUpgrade._UI)._bottomDescBG, "StaticText_BottomDesc")
PaGlobal_FairyUpgrade_Open = function(PositionReset)
  -- function num : 0_0 , upvalues : FairyUpgrade
  if Panel_Window_FairySetting:GetShow() then
    PaGlobal_FairySetting_Close()
  end
  if Panel_Window_FairyUpgrade:GetShow() then
    PaGlobal_FairyUpgrade_Close()
    return 
  end
  if PaGlobal_FairyInfo_isMaxLevel() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCantFairyFusionLevel"))
    return 
  end
  if ToClient_getFairyUnsealedList() < 1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoNeedUnsealFairy"))
    return 
  end
  if PositionReset == true then
    FairyUpgrade:SetPosition()
  end
  HandleClicked_Inventory_FairyFeed_Open()
  Panel_Window_Inventory:SetShow(true)
  Inventory_SetFunctor(PaGlobal_Fairy_FileterForFeeding, nil, PaGlobal_FairyUpgrade_Close, nil)
  FairyUpgrade:Clear()
  FairyUpgrade:Open()
  Panel_Window_FairyUpgrade:SetShow(true)
end

PaGlobal_FairyUpgrade_RClickItemByNumberPad = function(count, slotNo, itemKey)
  -- function num : 0_1 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  if itemKey == nil then
    return 
  end
  if self._isAnimating == true then
    return 
  end
  self._currentItemEnchantKey = itemKey
  local itemSSW = getItemEnchantStaticStatus(self._currentItemEnchantKey)
  self._currentItemSlotNo = slotNo
  self._currentItemStackCount = Int64toInt32(count)
  if itemSSW == nil then
    return 
  end
  ;
  ((self._UI)._feedIcon):ChangeTextureInfoName("Icon/" .. itemSSW:getIconPath())
  ;
  ((self._UI)._feedIcon):SetShow(true)
  ;
  ((self._UI)._checkBtn):SetShow(false)
  ToClient_CalculateUpgradeExp(PaGlobal_FairyInfo_GetFairyNo(), self._currentItemEnchantKey, self._currentItemSlotNo, self._currentItemStackCount, ((self._UI)._checkBtn):IsCheck())
  self._previewExpRate = ToClient_GetFutureFairyExp()
  self._previewLevel = ToClient_GetFutureFairyLevel()
  self:Open()
end

PaGlobal_FairyUpgrade_RClickItem = function(value, slotNo, count)
  -- function num : 0_2 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  if value == nil then
    return 
  end
  if self._isAnimating == true then
    return 
  end
  self._currentItemEnchantKey = value
  local itemSSW = getItemEnchantStaticStatus(self._currentItemEnchantKey)
  self._currentItemSlotNo = slotNo
  self._currentItemStackCount = Int64toInt32(count)
  if itemSSW == nil then
    return 
  end
  ;
  ((self._UI)._feedIcon):ChangeTextureInfoName("Icon/" .. itemSSW:getIconPath())
  ;
  ((self._UI)._feedIcon):SetShow(true)
  ;
  ((self._UI)._checkBtn):SetShow(true)
  ToClient_CalculateUpgradeExp(PaGlobal_FairyInfo_GetFairyNo(), self._currentItemEnchantKey, self._currentItemSlotNo, self._currentItemStackCount, ((self._UI)._checkBtn):IsCheck())
  self._previewExpRate = ToClient_GetFutureFairyExp()
  self._previewLevel = ToClient_GetFutureFairyLevel()
  self:Open()
end

PaGlobal_FairyUpgrade_Close = function()
  -- function num : 0_3
  Panel_Window_FairyUpgrade:SetShow(false)
  HandleClicked_InventoryWindow_Close()
end

FairyUpgrade.Clear = function(self)
  -- function num : 0_4
  self._currentItemEnchantKey = nil
  ;
  ((self._UI)._checkBtn):SetCheck(false)
  ;
  ((self._UI)._feedIcon):SetShow(false)
  self._currentItemSlotNo = 0
  self._currentItemStackCount = 0
  self._isAnimating = false
  self._ani_TimeStamp = 0
  ;
  ((self._UI)._checkBtn):SetIgnore(false)
  ;
  ((self._UI)._checkBtn):SetMonoTone(false)
  self._previewExpRate = 0
  self._previewLevel = 0
end

FairyUpgrade.Open = function(self)
  -- function num : 0_5
  if PaGlobal_FairyInfo_GetIconPath() ~= nil then
    ((self._UI)._fairyIcon):ChangeTextureInfoName(PaGlobal_FairyInfo_GetIconPath())
  end
  if PaGlobal_FairyInfo_GetFairyName() ~= nil then
    ((self._UI)._fairyName):SetText(PaGlobal_FairyInfo_GetFairyName())
  else
    ;
    ((self._UI)._fairyName):SetText("-")
  end
  if PaGlobal_FairyInfo_isMaxLevel() == true then
    PaGlobal_FairyUpgrade_Close()
    return 
  end
  if self._currentItemStackCount <= 1 then
    ((self._UI)._feedCount):SetShow(false)
  else
    ;
    ((self._UI)._feedCount):SetText(self._currentItemStackCount)
    ;
    ((self._UI)._feedCount):SetShow(true)
  end
  local ExpRate = PaGlobal_FairyInfo_CurrentExpRate()
  local currentLevel = PaGlobal_FairyInfo_GetLevel()
  ;
  ((self._UI)._progressCurrent):SetProgressRate(ExpRate)
  ;
  ((self._UI)._progressCurrent):SetCurrentProgressRate(ExpRate)
  ;
  ((self._UI)._progressPreview):SetProgressRate(0)
  ;
  ((self._UI)._progressPreview):SetCurrentProgressRate(0)
  ;
  ((self._UI)._previewLevelText):SetText("Lv." .. tostring(currentLevel))
  ;
  ((self._UI)._previewExpRateText):SetText((string.format)("%.2f", ExpRate) .. "%")
  if currentLevel < self._previewLevel then
    ((self._UI)._progressCurrent):SetProgressRate(0)
    ;
    ((self._UI)._progressCurrent):SetCurrentProgressRate(0)
    ;
    ((self._UI)._progressPreview):SetProgressRate(self._previewExpRate * 100)
    ;
    ((self._UI)._progressPreview):SetCurrentProgressRate(self._previewExpRate * 100)
    ;
    ((self._UI)._previewLevelText):SetText("Lv." .. tostring(self._previewLevel))
    ;
    ((self._UI)._previewExpRateText):SetText((string.format)("%.2f", self._previewExpRate * 100) .. "%")
  else
    if currentLevel == self._previewLevel and self._previewLevel ~= 0 then
      ((self._UI)._progressPreview):SetProgressRate(self._previewExpRate * 100)
      ;
      ((self._UI)._progressPreview):SetCurrentProgressRate(self._previewExpRate * 100)
      ;
      ((self._UI)._previewExpRateText):SetText((string.format)("%.2f", self._previewExpRate * 100) .. "%")
    else
      if (PaGlobal_FairyInfo_FairyTier() + 1) * 10 == self._previewLevel then
        ((self._UI)._previewLevelText):SetText("Lv." .. tostring(self._previewLevel))
        ;
        ((self._UI)._progressPreview):SetProgressRate(100)
        ;
        ((self._UI)._progressPreview):SetCurrentProgressRate(100)
        ;
        ((self._UI)._previewExpRateText):SetText((string.format)("%.2f", 100) .. "%")
      end
    end
  end
end

PaGlobal_FairyUpgrade_Request = function()
  -- function num : 0_6 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  if self._currentItemEnchantKey == nil then
    return 
  end
  local FunctionYesOverExp = function()
    -- function num : 0_6_0 , upvalues : self, FairyUpgrade
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

    self._isAnimating = true
    ;
    ((self._UI)._checkBtn):SetIgnore(true)
    ;
    ((self._UI)._checkBtn):SetMonoTone(true)
    ;
    ((self._UI)._checkBtn):SetCheck(false)
    ;
    ((self._UI)._upgrade):SetIgnore(true)
    ;
    ((self._UI)._upgrade):SetMonoTone(true)
    ;
    ((FairyUpgrade._UI)._iconFairy):AddEffect("CO_UI_Fairy_01A", false, -53, -78)
    ;
    ((FairyUpgrade._UI)._iconFairy):AddEffect("CO_UI_Fairy_01B", false, 53, -78)
    ;
    ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_01A", false, 0, -50)
    ;
    ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_02B", false, 0, -89)
    ;
    ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_03A", false, 0, -88)
    ;
    ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_04A", false, 1, 103)
    ;
    ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_02A", false, 1, 103)
    ;
    ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_05A", false, 1, 103)
  end

  local FunctionYes = function()
    -- function num : 0_6_1 , upvalues : self, FairyUpgrade, FunctionYesOverExp
    local isOverExp = ToClient_isOverExpFairyFeeding(PaGlobal_FairyInfo_GetFairyNo(), self._currentItemEnchantKey)
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

    if isOverExp == false then
      self._isAnimating = true
      ;
      ((self._UI)._checkBtn):SetIgnore(true)
      ;
      ((self._UI)._checkBtn):SetMonoTone(true)
      ;
      ((self._UI)._upgrade):SetIgnore(true)
      ;
      ((self._UI)._upgrade):SetMonoTone(true)
      ;
      ((FairyUpgrade._UI)._iconFairy):AddEffect("CO_UI_Fairy_01A", false, -53, -78)
      ;
      ((FairyUpgrade._UI)._iconFairy):AddEffect("CO_UI_Fairy_01B", false, 53, -78)
      ;
      ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_01A", false, 0, -50)
      ;
      ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_02B", false, 0, -89)
      ;
      ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_03A", false, 0, -88)
      ;
      ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_04A", false, 1, 103)
      ;
      ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_02A", false, 1, 103)
      ;
      ((FairyUpgrade._UI)._iconFairy):AddEffect("fUI_Fairy_05A", false, 1, 103)
    else
      local __title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
      local __contenet = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_UPGRADE_OVEREXP_ALERT")
      local __messageBoxData = {title = __title, content = __contenet, functionYes = FunctionYesOverExp, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(__messageBoxData)
    end
  end

  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
  local _contenet = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_UPGRADE_ALERT")
  local messageBoxData = {title = _title, content = _contenet, functionYes = FunctionYes, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

UpdateFunc_FairyUpgradeAni = function(deltaTime)
  -- function num : 0_7 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  if self._isAnimating == true then
    self._ani_TimeStamp = self._ani_TimeStamp + deltaTime
    if self._const_aniTime <= self._ani_TimeStamp then
      self._isAnimating = false
      ToClient_FairyFeedingRequest(PaGlobal_FairyInfo_GetFairyNo(), self._currentItemEnchantKey, self._currentItemSlotNo, self._currentItemStackCount, ((self._UI)._checkBtn):IsCheck())
      self._ani_TimeStamp = 0
      ;
      ((self._UI)._upgrade):SetIgnore(false)
      ;
      ((self._UI)._upgrade):SetMonoTone(false)
      self:Clear()
      self:Open()
    end
  end
end

FairyUpgrade.SetPosition = function(self)
  -- function num : 0_8
  Panel_Window_FairyUpgrade:SetPosX(Panel_FairyInfo:GetPosX() + Panel_FairyInfo:GetSizeX())
  Panel_Window_FairyUpgrade:SetPosY(Panel_FairyInfo:GetPosY())
end

PaGlobal_FairyUpgrade_UpdateExp = function()
  -- function num : 0_9 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  if self._currentItemEnchantKey == nil then
    return 
  end
  ToClient_CalculateUpgradeExp(PaGlobal_FairyInfo_GetFairyNo(), self._currentItemEnchantKey, self._currentItemSlotNo, self._currentItemStackCount, ((self._UI)._checkBtn):IsCheck())
  self._previewExpRate = ToClient_GetFutureFairyExp()
  self._previewLevel = ToClient_GetFutureFairyLevel()
  self:Open()
end

FairyUpgrade.Initialize = function(self)
  -- function num : 0_10 , upvalues : UI_TM
  Panel_Window_FairyUpgrade:RegisterUpdateFunc("UpdateFunc_FairyUpgradeAni")
  ;
  ((self._UI)._close):addInputEvent("Mouse_LUp", "PaGlobal_FairyUpgrade_Close()")
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._fairyName = (UI.getChildControl)((self._UI)._mainBG, "StaticText_MainBGTitle")
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._fairyIcon = (UI.getChildControl)((self._UI)._mainBG, "Static_FairyIcon")
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._feedIcon = (UI.getChildControl)((self._UI)._mainBG, "Static_StoneIcon")
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._checkBtn = (UI.getChildControl)((self._UI)._mainBG, "CheckButton_Stream")
  ;
  ((self._UI)._checkBtn):addInputEvent("Mouse_LUp", "PaGlobal_FairyUpgrade_UpdateExp()")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._progressCurrent = (UI.getChildControl)((self._UI)._mainBG, "Progress2_Exp")
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._progressPreview = (UI.getChildControl)((self._UI)._mainBG, "Progress2_PreviewExp")
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._previewLevelText = (UI.getChildControl)((self._UI)._mainBG, "Static_PreviewLevel")
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._previewExpRateText = (UI.getChildControl)((self._UI)._mainBG, "Static_PreviewExpRate")
  ;
  ((self._UI)._upgrade):addInputEvent("Mouse_LUp", "PaGlobal_FairyUpgrade_Request()")
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._UI)._feedCount = (UI.getChildControl)((self._UI)._feedIcon, "StaticText_StoneCount")
  ;
  ((self._UI)._feedIcon):addInputEvent("Mouse_On", "PaGlobal_FairyUpgrade_ShowToolTip(true)")
  ;
  ((self._UI)._feedIcon):addInputEvent("Mouse_Out", "PaGlobal_FairyUpgrade_ShowToolTip(false)")
  ;
  ((self._UI)._feedIcon):addInputEvent("Mouse_RUp", "PaGlobal_FairyUpgrade_ClearFeedItem()")
  ;
  ((self._UI)._bottomDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self._UI)._bottomDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_UPGRADE_DEC"))
  ;
  ((self._UI)._bottomDesc):SetSize(((self._UI)._bottomDesc):GetSizeX(), ((self._UI)._bottomDesc):GetTextSizeY())
  ;
  ((self._UI)._bottomDescBG):SetSize(((self._UI)._bottomDescBG):GetSizeX(), ((self._UI)._bottomDesc):GetTextSizeY() + 20)
  ;
  ((self._UI)._bottomDesc):SetSpanSize(0, 0)
  Panel_Window_FairyUpgrade:SetSize(Panel_Window_FairyUpgrade:GetSizeX(), 490 + ((self._UI)._bottomDescBG):GetSizeY())
  ;
  ((self._UI)._checkBtn):SetEnableArea(0, 0, ((self._UI)._checkBtn):GetTextSizeX() + ((self._UI)._checkBtn):GetSizeX() + 10, ((self._UI)._checkBtn):GetSizeY())
  ;
  ((self._UI)._checkBtn):SetPosX(((self._UI)._mainBG):GetSizeX() / 2 - (((self._UI)._checkBtn):GetTextSizeX() + ((self._UI)._checkBtn):GetSizeX()) / 2)
end

PaGlobal_FairyUpgrade_OnlyUpdate = function()
  -- function num : 0_11 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  self:Open()
end

PaGlobal_Fairy_FileterForFeeding = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_12
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return true
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    return true
  end
  if itemWrapper:isFairyFeedItem() == true then
    return false
  end
  return true
end

PaGlobal_FairyUpgrade_ShowToolTip = function(isShow)
  -- function num : 0_13 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  local itemSSW = nil
  itemSSW = getItemEnchantStaticStatus(self._currentItemEnchantKey)
  if itemSSW == nil then
    return 
  end
  if isShow == true then
    Panel_Tooltip_Item_SetPosition(0, (self._UI)._feedIcon, "fairyUpgrade")
    Panel_Tooltip_Item_Show(itemSSW, Panel_Window_FairyUpgrade, true)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end

PaGlobal_FairyUpgrade_ClearFeedItem = function()
  -- function num : 0_14 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  Panel_Tooltip_Item_hideTooltip()
  self:Clear()
  self:Open()
end

FairyUpgrade:Initialize()

