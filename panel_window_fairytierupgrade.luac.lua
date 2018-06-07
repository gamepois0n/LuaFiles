-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\fairyinfo\panel_window_fairytierupgrade.luac 

-- params : ...
-- function num : 0
local PaGlobal_FairyTierUpgrade = {
_ui = {_close = (UI.getChildControl)(Panel_Window_FairyTierUpgrade, "Button_Win_Close"), _mainBG = (UI.getChildControl)(Panel_Window_FairyTierUpgrade, "Static_MainBG"), _bottomDescBG = (UI.getChildControl)(Panel_Window_FairyTierUpgrade, "Static_BottomBG"), _btn_TierUpgrade = (UI.getChildControl)(Panel_Window_FairyTierUpgrade, "Button_Upgrade"), _tierUpgradeEffect = (UI.getChildControl)(Panel_Window_FairyTierUpgrade, "Static_Block_TierUpgrade"), _resultSuccessEffect = (UI.getChildControl)(Panel_Window_FairyTierUpgrade, "Static_Block_Success"), _resultFailEffect = (UI.getChildControl)(Panel_Window_FairyTierUpgrade, "Static_Block_Fail"), _subjectItemBG = (UI.getChildControl)(Panel_Window_FairyTierUpgrade, "Static_SubjectIconBG")}
, 
_rim = {}
, _rimCount = 4, _rimSpeed = 2, _currentItemKey = nil, _currentItemSlotNo = nil, _currentItemStackCount = 0, _currentItemWhereType = nil, _currentItemCountInInventory = 0, _maxSuccessRate = 0, _maxSubjectCount = 0, _currentSuccessRate = 0, _isResultAnimating = false, _resultAniElapsed = 0, _resultAniLength = 3, _resultMessagePosX = 0, _resultMessagePosY = 232, _result = 0, 
_RIM_ANI_STATE = {IDLE = 1, ROTATING = 2, INDICATING = 3, WAITING_FOR_RESULT = 4}
, 
_RESULT_TYPE = {UNDEFINED = 0, SUCCESS = 1, FAIL = 2}
, 
_slotConfig = {createBorder = false, createCount = true, createCooltime = false, createCooltimeText = false, createCash = true, createEnchant = true, createQuickslotBagIcon = false}
}
local UI_TM = CppEnums.TextMode
PaGlobal_FairyTierUpgrade.initialize = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  ((self._ui)._close):addInputEvent("Mouse_LUp", "PaGlobal_FairyTierUpgrade_Close()")
  ;
  ((self._ui)._btn_TierUpgrade):addInputEvent("Mouse_LUp", "FGlobal_OnClick_Button_TierUpgrade()")
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._text_SuccessChance = (UI.getChildControl)((self._ui)._mainBG, "StaticText_SuccessChance")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._percentageText = (UI.getChildControl)((self._ui)._mainBG, "StaticText_Percentage")
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._percentMark = (UI.getChildControl)((self._ui)._mainBG, "StaticText_PercentMark")
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._fairyBG = (UI.getChildControl)((self._ui)._mainBG, "Static_FairyBG")
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._subjectItemBase = (UI.getChildControl)((self._ui)._subjectItemBG, "Static_SubjectIcon")
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._subjectItem = {}
  ;
  (SlotItem.new)((self._ui)._subjectItem, "subjectItem", nil, (self._ui)._subjectItemBase, self._slotConfig)
  ;
  ((self._ui)._subjectItem):createChild()
  ;
  (((self._ui)._subjectItem).icon):addInputEvent("Mouse_On", "PaGlobal_FairyTierUpgrade_ShowToolTip(true)")
  ;
  (((self._ui)._subjectItem).icon):addInputEvent("Mouse_Out", "PaGlobal_FairyTierUpgrade_ShowToolTip(false)")
  ;
  (((self._ui)._subjectItem).icon):addInputEvent("Mouse_RUp", "PaGlobal_FairyTierUpgrade_ClearFeedItem()")
  ;
  ((self._ui)._subjectItem):clearItem()
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonPlus = (UI.getChildControl)((self._ui)._subjectItemBG, "Button_Plus")
  ;
  ((self._ui)._buttonPlus):addInputEvent("Mouse_LUp", "PaGlobal_FairyTierUpgrade_OnClickPlusButton()")
  -- DECOMPILER ERROR at PC115: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonMinus = (UI.getChildControl)((self._ui)._subjectItemBG, "Button_Minus")
  ;
  ((self._ui)._buttonMinus):addInputEvent("Mouse_LUp", "PaGlobal_FairyTierUpgrade_OnClickMinusButton()")
  -- DECOMPILER ERROR at PC129: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonNumPad = (UI.getChildControl)((self._ui)._subjectItemBG, "Button_NumPad")
  ;
  ((self._ui)._buttonNumPad):addInputEvent("Mouse_LUp", "PaGlobal_FairyTierUpgrade_OnClickNumPadButton()")
  -- DECOMPILER ERROR at PC143: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._bottomDescText = (UI.getChildControl)((self._ui)._bottomDescBG, "StaticText_BottomDesc")
  ;
  ((self._ui)._bottomDescText):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self._ui)._bottomDescText):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRY_TIERUPGRADE_DEC"))
  ;
  ((self._ui)._bottomDescText):SetTextVerticalTop()
  local textYSize = ((self._ui)._bottomDescText):GetTextSizeY()
  local stretchAmount = textYSize - ((self._ui)._bottomDescBG):GetSizeY() + 20
  ;
  ((self._ui)._bottomDescBG):SetSize(((self._ui)._bottomDescBG):GetSizeX(), textYSize + 20)
  Panel_Window_FairyTierUpgrade:SetSize(Panel_Window_FairyTierUpgrade:GetSizeX(), Panel_Window_FairyTierUpgrade:GetSizeY() + stretchAmount)
  -- DECOMPILER ERROR at PC199: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._plusButtonEffect = (UI.getChildControl)((self._ui)._subjectItemBG, "Static_Block_Plus")
  -- DECOMPILER ERROR at PC207: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._minusButtonEffect = (UI.getChildControl)((self._ui)._subjectItemBG, "Static_Block_Minus")
  for i = 1, self._rimCount do
    -- DECOMPILER ERROR at PC214: Confused about usage of register: R7 in 'UnsetPending'

    (self._rim)[i] = {}
    -- DECOMPILER ERROR at PC227: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._rim)[i])._uiControl = (UI.getChildControl)((self._ui)._fairyBG, "Static_Seq" .. tostring(i))
    -- DECOMPILER ERROR at PC230: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._rim)[i])._currentDegree = 0
    -- DECOMPILER ERROR at PC233: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._rim)[i])._rotateTarget = 0
    -- DECOMPILER ERROR at PC236: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._rim)[i])._accel = 0
    -- DECOMPILER ERROR at PC240: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._rim)[i])._aniValue = {}
    -- DECOMPILER ERROR at PC245: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._rim)[i])._state = (self._RIM_ANI_STATE).IDLE
  end
  Panel_Window_FairyTierUpgrade:RegisterUpdateFunc("UpdateFunc_FairyTierUpdateFunc")
end

PaGlobal_FairyTierUpgrade_Open = function(PositionReset)
  -- function num : 0_1 , upvalues : PaGlobal_FairyTierUpgrade
  local self = PaGlobal_FairyTierUpgrade
  ClothInventory_Close()
  if Panel_Window_FairySetting:GetShow() then
    PaGlobal_FairySetting_Close()
  end
  if Panel_Window_FairyUpgrade:GetShow() then
    PaGlobal_FairyUpgrade_Close()
  end
  if Panel_Window_FairyTierUpgrade:GetShow() then
    self:close()
    return 
  end
  do
    if PaGlobal_FairyInfo_getUpgradeStack() == 0 then
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYTIERUPGRADE_ONTRY_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYTIERUPGRADE_NOTE_STACK"), functionYes = function()
    -- function num : 0_1_0
  end
, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      return 
    end
    do
      if ToClient_getFairyUnsealedList() > 0 then
        local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYTIERUPGRADE_ONTRY_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYTIERUPGRADE_NOTE_UNSEALED"), functionYes = function()
    -- function num : 0_1_1
  end
, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
        return 
      end
      if PaGlobal_FairyInfo_isMaxTier() then
        return 
      end
      if PositionReset == true then
        self:setPosition()
      end
      HandleClicked_Inventory_FairyFeed_Open()
      Panel_Window_Inventory:SetShow(true)
      Inventory_SetFunctor(PaGlobal_Fairy_FilterForTierUpgrade, PaGlobal_FairyTierUpgrade_rClickCallback, PaGlobal_FairyTierUpgrade_Close, nil)
      ;
      ((self._ui)._text_SuccessChance):SetShow(true)
      ;
      ((self._ui)._percentMark):SetShow(true)
      ;
      ((self._ui)._percentageText):SetShow(true)
      ;
      ((self._ui)._percentageText):SetText("0")
      self:clearFeedItem()
      ;
      (((self._ui)._subjectItem).icon):SetEnable(true)
      for i = 1, self._rimCount do
        -- DECOMPILER ERROR at PC141: Confused about usage of register: R6 in 'UnsetPending'

        ((self._rim)[i])._currentDegree = (math.random)(-180, 180)
        -- DECOMPILER ERROR at PC147: Confused about usage of register: R6 in 'UnsetPending'

        ;
        ((self._rim)[i])._rotateTarget = ((self._rim)[i])._currentDegree
        ;
        (((self._rim)[i])._uiControl):SetRotate((math.rad)(((self._rim)[i])._currentDegree))
        -- DECOMPILER ERROR at PC161: Confused about usage of register: R6 in 'UnsetPending'

        ;
        ((self._rim)[i])._accel = 0
        -- DECOMPILER ERROR at PC166: Confused about usage of register: R6 in 'UnsetPending'

        ;
        ((self._rim)[i])._state = (self._RIM_ANI_STATE).IDLE
        self:initIdleAnimation((self._rim)[i])
      end
      Panel_Window_FairyTierUpgrade:SetShow(true)
      self._maxSuccessRate = ToClient_getFairyTierUpgradeMaxRate(PaGlobal_FairyInfo_FairyTier())
      ;
      ((self._ui)._btn_TierUpgrade):SetMonoTone(false)
      registerEvent("FromClient_FairyTierUpgrade_Success", "FromClient_TierUpSuccess")
      registerEvent("FromClient_FairyTierUpgrade_Failed", "FromClient_TierUpFailed")
    end
  end
end

PaGlobal_FairyTierUpgrade.clearFeedItem = function(self)
  -- function num : 0_2
  ((self._ui)._subjectItemBase):SetShow(false)
  self._currentItemKey = nil
  self._currentItemWrapper = nil
  self._currentItemSSW = nil
  self._currentItemStackCount = 0
  self._currentItemWhereType = nil
  self._currentItemSlotNo = nil
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._result = 0
  ;
  ((self._ui)._buttonPlus):SetEnable(false)
  ;
  ((self._ui)._buttonMinus):SetEnable(false)
  ;
  ((self._ui)._buttonNumPad):SetEnable(false)
  self:setRimRotation(0, 0)
  self._isResultAnimating = false
  ;
  ((self._ui)._percentageText):SetText("0")
  ;
  ((self._ui)._subjectItem):clearItem()
  PaGlobal_FairyTierUpgrade_ShowToolTip(false)
end

PaGlobal_Fairy_FilterForTierUpgrade = function(slotNo, notUse_itemWrappers, whereType)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R3 in 'UnsetPending'

  (self._ui)._currentItemWhereType = whereType
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return true
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    return true
  end
  if itemWrapper:isFairyTierUpgradeItem(PaGlobal_FairyInfo_FairyTier()) then
    return false
  else
    return true
  end
end

PaGlobal_FairyTierUpgrade_rClickCallback = function(slotNo, itemWrapper, count, invenType)
  -- function num : 0_4 , upvalues : PaGlobal_FairyTierUpgrade
  if PaGlobal_FairyInfo_getUpgradeStack() == 0 then
    return 
  end
  local self = PaGlobal_FairyTierUpgrade
  self:clearFeedItem()
  self._currentItemWrapper = itemWrapper
  self._currentItemSlotNo = slotNo
  self._currentItemKey = ((self._currentItemWrapper):get()):getKey()
  if self._currentItemKey == nil then
    return 
  end
  self._currentItemSSW = itemWrapper:getStaticStatus()
  self._currentItemCountInInventory = Int64toInt32(count)
  self._currentItemWhereType = invenType
  self._currentSuccessRate = ToClient_getFairyTierUpgradeRate(PaGlobal_FairyInfo_FairyTier(), self._currentItemKey)
  self._maxSubjectCount = (math.floor)(self._maxSuccessRate / self._currentSuccessRate)
  ;
  ((self._ui)._subjectItemBase):SetShow(true)
  ;
  ((self._ui)._subjectItem):setItemByStaticStatus(self._currentItemSSW, (Defines.s64_const).s64_1)
  self:setSubjectItemCount(1)
  ;
  ((self._ui)._buttonPlus):SetEnable(true)
  ;
  ((self._ui)._buttonMinus):SetEnable(true)
  ;
  ((self._ui)._buttonNumPad):SetEnable(true)
end

PaGlobal_FairyTierUpgrade_OnClickNumPadButton = function()
  -- function num : 0_5 , upvalues : PaGlobal_FairyTierUpgrade
  local self = PaGlobal_FairyTierUpgrade
  local availableSubjectCount = (math.min)(self._currentItemCountInInventory, self._maxSubjectCount)
  Panel_NumberPad_Show(true, (toInt64(0, availableSubjectCount)), nil, PaGlobal_FairyTierUpgrade_GetStackItemCountCallBack)
end

PaGlobal_FairyTierUpgrade_GetStackItemCountCallBack = function(count)
  -- function num : 0_6 , upvalues : PaGlobal_FairyTierUpgrade
  PaGlobal_FairyTierUpgrade:setSubjectItemCount(tonumber(tostring(count)))
end

PaGlobal_FairyTierUpgrade_OnClickPlusButton = function()
  -- function num : 0_7 , upvalues : PaGlobal_FairyTierUpgrade
  local self = PaGlobal_FairyTierUpgrade
  PaGlobal_FairyTierUpgrade:setSubjectItemCount(PaGlobal_FairyTierUpgrade._currentItemStackCount + 1)
  ;
  ((self._ui)._plusButtonEffect):AddEffect("fUI_Fairy_TierUpgrade_02A", false, 0, 4)
end

PaGlobal_FairyTierUpgrade_OnClickMinusButton = function()
  -- function num : 0_8 , upvalues : PaGlobal_FairyTierUpgrade
  local self = PaGlobal_FairyTierUpgrade
  PaGlobal_FairyTierUpgrade:setSubjectItemCount(PaGlobal_FairyTierUpgrade._currentItemStackCount - 1)
  ;
  ((self._ui)._minusButtonEffect):AddEffect("fUI_Fairy_TierUpgrade_02A", false, 0, 4)
end

PaGlobal_FairyTierUpgrade.setSubjectItemCount = function(self, count)
  -- function num : 0_9 , upvalues : PaGlobal_FairyTierUpgrade
  self._maxSubjectCount = (math.floor)(self._maxSuccessRate / self._currentSuccessRate)
  local availableSubjectCount = (math.min)(self._currentItemCountInInventory, self._maxSubjectCount)
  if availableSubjectCount < count then
    count = availableSubjectCount
  else
    if count < 1 then
      count = 1
    end
  end
  self._currentItemSSW = getItemEnchantStaticStatus(self._currentItemKey)
  self._currentItemStackCount = count
  ;
  ((self._ui)._subjectItem):clearItem()
  ;
  ((self._ui)._subjectItem):setItemByStaticStatus(self._currentItemSSW, toInt64(0, count))
  ;
  ((self._ui)._percentageText):SetText(tostring(self:decimalRoundForPercentValue(self._currentSuccessRate / 10000 * self._currentItemStackCount)))
  if self._maxSubjectCount == self._currentItemStackCount then
    ((self._ui)._percentageText):SetText("100")
  end
  local percentMarkPosX = ((self._ui)._percentageText):GetPosX() + ((self._ui)._percentageText):GetSizeX() / 2 + ((self._ui)._percentageText):GetTextSizeX() / 2
  ;
  ((self._ui)._percentMark):SetPosX(percentMarkPosX)
  ;
  ((self._ui)._percentageText):ResetVertexAni()
  ;
  ((self._ui)._percentageText):SetVertexAniRun("Percentage_Ani_Scale", true)
  ;
  ((self._ui)._percentageText):SetVertexAniRun("Percentage_Ani_Move", true)
  local rimProgress = self._currentItemStackCount / self._maxSubjectCount
  local rimInPosition = (math.floor)(rimProgress * self._rimCount)
  local rimRemainder = rimProgress * self._rimCount - rimInPosition
  PaGlobal_FairyTierUpgrade:setRimRotation(rimInPosition, rimRemainder)
end

PaGlobal_FairyTierUpgrade.setRimRotation = function(self, rimInPosition, rimRemainder)
  -- function num : 0_10
  for i = 1, self._rimCount do
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R7 in 'UnsetPending'

    if i <= rimInPosition then
      if ((self._rim)[i])._currentDegree > 0 then
        if ((self._rim)[i])._currentDegree < 90 then
          ((self._rim)[i])._rotateTarget = 0
        else
          -- DECOMPILER ERROR at PC22: Confused about usage of register: R7 in 'UnsetPending'

          ;
          ((self._rim)[i])._rotateTarget = 180
        end
      else
        -- DECOMPILER ERROR at PC31: Confused about usage of register: R7 in 'UnsetPending'

        if ((self._rim)[i])._currentDegree > -90 then
          ((self._rim)[i])._rotateTarget = 0
        else
          -- DECOMPILER ERROR at PC35: Confused about usage of register: R7 in 'UnsetPending'

          ;
          ((self._rim)[i])._rotateTarget = -180
        end
      end
      -- DECOMPILER ERROR at PC40: Confused about usage of register: R7 in 'UnsetPending'

      ;
      ((self._rim)[i])._state = (self._RIM_ANI_STATE).ROTATING
    else
      -- DECOMPILER ERROR at PC58: Confused about usage of register: R7 in 'UnsetPending'

      if rimRemainder > 0.01 then
        if ((self._rim)[i])._currentDegree > 0 then
          if ((self._rim)[i])._currentDegree < 90 then
            ((self._rim)[i])._rotateTarget = 90 - rimRemainder * 90
          else
            -- DECOMPILER ERROR at PC64: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((self._rim)[i])._rotateTarget = 90 + rimRemainder * 90
          end
        else
          -- DECOMPILER ERROR at PC75: Confused about usage of register: R7 in 'UnsetPending'

          if ((self._rim)[i])._currentDegree > -90 then
            ((self._rim)[i])._rotateTarget = -90 + rimRemainder * 90
          else
            -- DECOMPILER ERROR at PC81: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((self._rim)[i])._rotateTarget = -90 - rimRemainder * 90
          end
        end
        rimRemainder = 0
        -- DECOMPILER ERROR at PC87: Confused about usage of register: R7 in 'UnsetPending'

        ;
        ((self._rim)[i])._state = (self._RIM_ANI_STATE).ROTATING
      else
        -- DECOMPILER ERROR at PC103: Confused about usage of register: R7 in 'UnsetPending'

        if (self._RIM_ANI_STATE).IDLE ~= ((self._rim)[i])._state then
          ((self._rim)[i])._rotateTarget = (math.random)(-180, 180)
          self:initIdleAnimation((self._rim)[i])
        end
        -- DECOMPILER ERROR at PC112: Confused about usage of register: R7 in 'UnsetPending'

        ;
        ((self._rim)[i])._state = (self._RIM_ANI_STATE).IDLE
      end
    end
  end
end

PaGlobal_FairyTierUpgrade_ClearFeedItem = function()
  -- function num : 0_11 , upvalues : PaGlobal_FairyTierUpgrade
  PaGlobal_FairyTierUpgrade:clearFeedItem()
end

FGlobal_OnClick_Button_TierUpgrade = function()
  -- function num : 0_12 , upvalues : PaGlobal_FairyTierUpgrade
  if PaGlobal_FairyInfo_getUpgradeStack() == 0 then
    return 
  end
  local self = PaGlobal_FairyTierUpgrade
  self._maxSubjectCount = (math.floor)(self._maxSuccessRate / self._currentSuccessRate)
  if self._maxSubjectCount <= self._currentItemStackCount then
    FGlobal_OnClick_Button_UpgradeConfirm()
  else
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYTIERUPGRADE_ONTRY_TITLE"), content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FAIRYTIERUPGRADE_ONTRY_DESC", "percentage", tostring(self:decimalRoundForPercentValue(self._currentSuccessRate / 10000 * self._currentItemStackCount))), functionYes = FGlobal_OnClick_Button_UpgradeConfirm, functionNo = function()
    -- function num : 0_12_0
  end
, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

FGlobal_OnClick_Button_UpgradeConfirm = function()
  -- function num : 0_13 , upvalues : PaGlobal_FairyTierUpgrade
  local self = PaGlobal_FairyTierUpgrade
  if self._currentItemWrapper == nil then
    return 
  end
  if PaGlobal_FairyInfo_getUpgradeStack() == 0 then
    return 
  end
  if ToClient_getFairyUnsealedList() > 0 then
    return 
  end
  if PaGlobal_FairyInfo_isMaxTier() then
    return 
  end
  ;
  ((self._ui)._tierUpgradeEffect):AddEffect("fUI_Fairy_TierUpgrade_01A", false, 0, 4)
  ToClient_FairyTierUpgradeRequest(PaGlobal_FairyInfo_GetFairyNo(), self._currentItemWhereType, self._currentItemSlotNo, self._currentItemStackCount)
  ;
  ((self._ui)._buttonPlus):SetEnable(false)
  ;
  ((self._ui)._buttonMinus):SetEnable(false)
  ;
  ((self._ui)._buttonNumPad):SetEnable(false)
  ;
  (((self._ui)._subjectItem).icon):SetEnable(false)
  for i = 1, self._rimCount do
    -- DECOMPILER ERROR at PC72: Confused about usage of register: R5 in 'UnsetPending'

    if i % 2 == 1 then
      ((self._rim)[i])._accel = (math.random)(-1260, -900) / self._resultAniLength
    else
      -- DECOMPILER ERROR at PC83: Confused about usage of register: R5 in 'UnsetPending'

      ;
      ((self._rim)[i])._accel = (math.random)(900, 1260) / self._resultAniLength
    end
    -- DECOMPILER ERROR at PC88: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._rim)[i])._state = (self._RIM_ANI_STATE).WAITING_FOR_RESULT
  end
  self._isResultAnimating = true
  ;
  ((self._ui)._btn_TierUpgrade):SetMonoTone(true)
  audioPostEvent_SystemUi(21, 1)
end

UpdateFunc_FairyTierUpdateFunc = function(deltaTime)
  -- function num : 0_14 , upvalues : PaGlobal_FairyTierUpgrade
  local self = PaGlobal_FairyTierUpgrade
  for i = 1, self._rimCount do
    if (self._RIM_ANI_STATE).IDLE == ((self._rim)[i])._state then
      self:idleAnimation((self._rim)[i], i, deltaTime)
    else
      if (self._RIM_ANI_STATE).ROTATING == ((self._rim)[i])._state then
        self:rotating((self._rim)[i], deltaTime)
      else
        if (self._RIM_ANI_STATE).INDICATING == ((self._rim)[i])._state then
          self:indicating((self._rim)[i], deltaTime)
        else
          if (self._RIM_ANI_STATE).WAITING_FOR_RESULT == ((self._rim)[i])._state then
            self:waitingForResult((self._rim)[i], deltaTime)
          end
        end
      end
    end
  end
  if self._isResultAnimating then
    self:resultAniUpdate(deltaTime)
  end
end

PaGlobal_FairyTierUpgrade.initIdleAnimation = function(self, rim)
  -- function num : 0_15
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  (rim._aniValue)[1] = (math.random)(0, 2 * math.pi)
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (rim._aniValue)[2] = (math.random)(2, 4)
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (rim._aniValue)[3] = (math.random)(3, 7)
end

PaGlobal_FairyTierUpgrade.idleAnimation = function(self, rim, index, deltaTime)
  -- function num : 0_16
  local acc = rim._rotateTarget - rim._currentDegree
  if (math.abs)(acc) > 0.1 then
    rim._accel = self:limitAcceleration(acc, 40) * self._rimSpeed
    rim._currentDegree = self:negate360Turn(rim._currentDegree + rim._accel * deltaTime)
    ;
    (rim._uiControl):SetRotate((math.rad)(rim._currentDegree))
  else
    rim._rotateTarget = rim._currentDegree
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R5 in 'UnsetPending'

    if 2 * math.pi < (rim._aniValue)[1] then
      (rim._aniValue)[1] = 0
      self:initIdleAnimation(rim)
    end
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (rim._aniValue)[1] = (rim._aniValue)[1] + (rim._aniValue)[2] * deltaTime
    rim._accel = (math.sin)((rim._aniValue)[1]) * (rim._aniValue)[3]
    rim._currentDegree = self:negate360Turn(rim._currentDegree + rim._accel * deltaTime)
    ;
    (rim._uiControl):SetRotate((math.rad)(rim._currentDegree))
  end
end

PaGlobal_FairyTierUpgrade.rotating = function(self, rim, deltaTime)
  -- function num : 0_17
  local acc = rim._rotateTarget - rim._currentDegree
  rim._accel = self:limitAcceleration(acc, 40) * self._rimSpeed
  rim._currentDegree = self:negate360Turn(rim._currentDegree + rim._accel * deltaTime)
  ;
  (rim._uiControl):SetRotate((math.rad)(rim._currentDegree))
  if (math.abs)(acc) <= 0.1 then
    rim._currentDegree = self:negate360Turn(rim._rotateTarget)
    ;
    (rim._uiControl):SetRotate((math.rad)(rim._currentDegree))
    rim._state = (self._RIM_ANI_STATE).INDICATING
  end
end

PaGlobal_FairyTierUpgrade.indicating = function(self, rim, deltaTime)
  -- function num : 0_18
  rim._accel = 0
  rim._rotateTarget = 0
end

PaGlobal_FairyTierUpgrade.waitingForResult = function(self, rim, deltaTime)
  -- function num : 0_19
  rim._currentDegree = self:negate360Turn(rim._currentDegree + rim._accel * deltaTime)
  ;
  (rim._uiControl):SetRotate((math.rad)(rim._currentDegree))
  if not self._isResultAnimating then
    rim._accel = rim._accel * 0.9
  end
end

PaGlobal_FairyTierUpgrade.resultAniUpdate = function(self, deltaTime)
  -- function num : 0_20
  self._resultAniElapsed = self._resultAniElapsed + deltaTime
  if self._resultAniLength < self._resultAniElapsed then
    self._isResultAnimating = false
    self._resultAniElapsed = 0
    self:onResultAnimationFinish()
  end
end

FromClient_TierUpSuccess = function()
  -- function num : 0_21 , upvalues : PaGlobal_FairyTierUpgrade
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_FairyTierUpgrade._result = (PaGlobal_FairyTierUpgrade._RESULT_TYPE).SUCCESS
end

FromClient_TierUpFailed = function()
  -- function num : 0_22 , upvalues : PaGlobal_FairyTierUpgrade
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_FairyTierUpgrade._result = (PaGlobal_FairyTierUpgrade._RESULT_TYPE).FAIL
end

PaGlobal_FairyTierUpgrade.onResultAnimationFinish = function(self)
  -- function num : 0_23
  if self._result == (self._RESULT_TYPE).UNDEFINED then
    self._isResultAnimating = true
    self._resultAniElapsed = 0
  else
    self:setSubjectItemCount(0)
    self:clearFeedItem()
    ;
    ((self._ui)._subjectItem):clearItem()
    ;
    ((self._ui)._text_SuccessChance):SetShow(false)
    ;
    ((self._ui)._percentageText):SetShow(false)
    ;
    ((self._ui)._percentMark):SetShow(false)
    if self._result == (self._RESULT_TYPE).SUCCESS then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoSuccessFairyUpgrade"), 1.6, Panel_Window_FairyTierUpgrade:GetPosX() + self._resultMessagePosX, Panel_Window_FairyTierUpgrade:GetPosY() + self._resultMessagePosY)
      ;
      ((self._ui)._resultSuccessEffect):AddEffect("fUI_Fairy_TierUpgrade_Success_01A", false, 0, 4)
      audioPostEvent_SystemUi(21, 2)
    else
      if self._result == (self._RESULT_TYPE).FAIL then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoFailFairyUpgrade"), 1.6, Panel_Window_FairyTierUpgrade:GetPosX() + self._resultMessagePosX, Panel_Window_FairyTierUpgrade:GetPosY() + self._resultMessagePosY)
        ;
        ((self._ui)._resultFailEffect):AddEffect("fUI_Fairy_TierUpgrade_Fail_01A", false, 0, 4)
      end
    end
  end
end

PaGlobal_FairyTierUpgrade.limitAcceleration = function(self, val, limit)
  -- function num : 0_24
  if limit < val then
    return limit
  else
    if val < -limit then
      return -limit
    else
      return val
    end
  end
end

PaGlobal_FairyTierUpgrade.negate360Turn = function(self, degree)
  -- function num : 0_25
  if degree > 360 then
    return degree - 360
  else
    if degree < -360 then
      return degree + 360
    else
      return degree
    end
  end
end

PaGlobal_FairyTierUpgrade.decimalRoundForPercentValue = function(self, value)
  -- function num : 0_26
  if value >= 100 then
    return 100
  else
    if value > 99 and value < 100 then
      return 99
    else
      if value > 0 and value < 1 then
        return 1
      else
        return (math.floor)(value)
      end
    end
  end
end

PaGlobal_FairyTierUpgrade.setPosition = function(self)
  -- function num : 0_27
  Panel_Window_FairyTierUpgrade:SetPosX(Panel_FairyInfo:GetPosX() + Panel_FairyInfo:GetSizeX() / 2 - Panel_Window_FairyTierUpgrade:GetSizeX() / 2)
  Panel_Window_FairyTierUpgrade:SetPosY(Panel_FairyInfo:GetPosY() + 20)
end

PaGlobal_FairyTierUpgrade_ShowToolTip = function(isShow)
  -- function num : 0_28 , upvalues : PaGlobal_FairyTierUpgrade
  local self = PaGlobal_FairyTierUpgrade
  do
    if self._currentItemKey ~= nil then
      local itemSSW = getItemEnchantStaticStatus(self._currentItemKey)
    end
    if itemSSW == nil then
      return 
    end
    if isShow == true then
      Panel_Tooltip_Item_SetPosition(0, (self._ui)._subjectItemBase, "fairyTierUpgrade")
      Panel_Tooltip_Item_Show(itemSSW, Panel_Window_FairyTierUpgrade, true)
    else
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

PaGlobal_FairyTierUpgrade_Close = function()
  -- function num : 0_29 , upvalues : PaGlobal_FairyTierUpgrade
  PaGlobal_FairyTierUpgrade:close()
end

PaGlobal_FairyTierUpgrade.close = function(self)
  -- function num : 0_30
  self:clearFeedItem()
  Panel_Window_FairyTierUpgrade:SetShow(false)
  HandleClicked_InventoryWindow_Close()
  ;
  ((self._ui)._subjectItem):clearItem()
end

FromClient_luaLoadComplete_Panel_Window_FairyTierUpgrade = function()
  -- function num : 0_31 , upvalues : PaGlobal_FairyTierUpgrade
  PaGlobal_FairyTierUpgrade:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_FairyTierUpgrade")

