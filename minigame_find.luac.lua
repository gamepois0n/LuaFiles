-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\minigame\minigame_find.luac 

-- params : ...
-- function num : 0
PaGlobal_MiniGame_Find = {
_ui = {_baseOpenSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_OpenSlot"), _baseCloseSlot = (UI.getChildControl)(Panel_MiniGame_Find, "Static_CloseSlot"), _closeButton = (UI.getChildControl)(Panel_MiniGame_Find, "Button_Win_Close"), _rightBG = (UI.getChildControl)(Panel_MiniGame_Find, "Static_RightBg"), _startMsg = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Msg"), _timerMsg = (UI.getChildControl)(Panel_MiniGame_MiniGameResult, "StaticText_Msg"), _staticObjBg = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Body"), _descBg = (UI.getChildControl)(Panel_MiniGame_Find, "Static_BottomBg"), _facePicture = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Obsidian"), _bubbleBg = (UI.getChildControl)(Panel_MiniGame_Find, "Static_Obsidian_B"), _maskBg = (UI.getChildControl)(Panel_MiniGame_Find, "Static_MaskBg"), _tutorialStep_1 = (UI.getChildControl)(Panel_MiniGame_Find, "Static_TutorialStep_1"), _tutorialStep_2 = (UI.getChildControl)(Panel_MiniGame_Find, "Static_TutorialStep_2"), _tutorialStep_3 = (UI.getChildControl)(Panel_MiniGame_Find, "Static_TutorialStep_3")}
, 
_config = {_slotCols = 12, _slotRows = 12, _slotSize = 48, _slotStartPosX = 13, _slotStartPosY = 45, _rewardMaxCount = 6, _nextGameSec = 3, _endGameSec = 5, _slotTypeDefault = 0, _slotTypeEmpty = 1, _slotTypeMain = 2, _slotTypeSub = 3, _slotTypeTrap = 5}
, 
_clickType = {LClcik = 1, RClcik = 2}
, 
_state = {None = 0, Play = 1, Wait = 2, Reward = 3}
, 
_rewardSlotConfig = {createIcon = true, createBorder = true, createEnchant = true}
, _slots = (Array.new)(), _rewardSlot = (Array.new)(), _damageSlot = (Array.new)(), _gameState = nil, _readyToEndGame = false, _readyToNextGame = false, _curSec = 0, _gameCurDepth = 0, _gameLastDepth = 0, _curRClickCount = 0, _addSize = 16, _curSlotSize = 0, _stateMsgKey = 0, _tutorialOpen = 0, _tutorialTime = 0, _tutorialIndex = -1, _tutorialEffectShow = false, 
_isFirstTouch = {_ground = true, _root = true, _stone = true}
}
-- DECOMPILER ERROR at PC151: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._rightTopBG = (UI.getChildControl)((self._ui)._rightBG, "Static_TopBg")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._endurance = (UI.getChildControl)((self._ui)._rightTopBG, "StaticText_DDPercent")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._RClickCnt = (UI.getChildControl)((self._ui)._rightTopBG, "StaticText_RClickCount")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._LeftValueBg = (UI.getChildControl)((self._ui)._rightBG, "Static_LeftValueBg")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._damageGauge = (UI.getChildControl)((self._ui)._rightBG, "Progress2_DamageDegree")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._slotBackground = (UI.getChildControl)((self._ui)._rightBG, "Static_RewardSlotBg")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._focusSlot = (UI.getChildControl)((self._ui)._rightBG, "Static_CurrentSlotFocus")
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._gameDepth = (UI.getChildControl)((self._ui)._rightBG, "StaticText_GradeTitle")
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._curRewardSlot = (UI.getChildControl)((self._ui)._rightBG, "Static_CurrentSlotFocus")
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._commercialValue = (UI.getChildControl)((self._ui)._rightBG, "StaticText_CommercialValue")
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._emptyCnt = (UI.getChildControl)((self._ui)._LeftValueBg, "StaticText_LandCountValue")
  -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._subObjCnt = (UI.getChildControl)((self._ui)._LeftValueBg, "StaticText_RootCountValue")
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._trapCnt = (UI.getChildControl)((self._ui)._LeftValueBg, "StaticText_StoneCountValue")
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._bubbleText = (UI.getChildControl)((self._ui)._bubbleBg, "StaticText_BubbleText")
  -- DECOMPILER ERROR at PC119: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._tutorialMaskBg_1 = (UI.getChildControl)((self._ui)._tutorialStep_1, "Static_MaskingBg")
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._tutorialFocus_1 = (UI.getChildControl)((self._ui)._tutorialStep_1, "Static_Focus")
  -- DECOMPILER ERROR at PC135: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._tutorialMaskBg_2 = (UI.getChildControl)((self._ui)._tutorialStep_2, "Static_MaskingBg")
  -- DECOMPILER ERROR at PC143: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._tutorialFocus_2 = (UI.getChildControl)((self._ui)._tutorialStep_2, "Static_Focus")
  -- DECOMPILER ERROR at PC151: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._tutorialMaskBg_3 = (UI.getChildControl)((self._ui)._tutorialStep_3, "Static_MaskingBg")
  -- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._tutorialFocus_3 = (UI.getChildControl)((self._ui)._tutorialStep_3, "Static_Focus")
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._msgDesc = (UI.getChildControl)((self._ui)._startMsg, "StaticText_Desc")
  -- DECOMPILER ERROR at PC175: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._left = (UI.getChildControl)((self._ui)._startMsg, "StaticText_MouseL_Desc")
  -- DECOMPILER ERROR at PC183: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._right = (UI.getChildControl)((self._ui)._startMsg, "StaticText_MouseR_Desc")
  self:createSlot()
  self:createRewardSlot()
  self:registEventHandler()
  self._messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_NOREWARDALERT"), functionYes = FGlobal_MiniGameFind_Close, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  -- DECOMPILER ERROR at PC219: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._desc = (UI.getChildControl)((self._ui)._descBg, "StaticText_BottomDesc")
  ;
  ((self._ui)._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._desc):SetText(((self._ui)._desc):GetText())
  local textSizeY = ((self._ui)._desc):GetTextSizeY() + 7
  local bgSizeY = ((self._ui)._descBg):GetSizeY()
  local sumSizeY = textSizeY - bgSizeY
  ;
  ((self._ui)._descBg):SetSize(((self._ui)._descBg):GetSizeX(), textSizeY)
  if sumSizeY > 0 then
    Panel_MiniGame_Find:SetSize(Panel_MiniGame_Find:GetSizeX(), Panel_MiniGame_Find:GetSizeY() + sumSizeY)
    ;
    ((self._ui)._rightBG):SetSize(((self._ui)._rightBG):GetSizeX(), ((self._ui)._rightBG):GetSizeY() + sumSizeY)
    ;
    ((self._ui)._desc):ComputePos()
  end
  Panel_MiniGame_Find:SetShow(false)
  self._tutorialOpen = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).RakiaroTutorial)
  ;
  ((self._ui)._maskBg):SetShow(false)
  ;
  ((self._ui)._startMsg):SetShow(false)
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.TutorialNextStep = function(self)
  -- function num : 0_1
  local self = PaGlobal_MiniGame_Find
  ;
  ((self._ui)._tutorialStep_1):SetShow(false)
  ;
  ((self._ui)._tutorialStep_2):SetShow(false)
  ;
  ((self._ui)._tutorialStep_3):SetShow(false)
  self._tutorialIndex = self._tutorialIndex + 1
  self._tutorialEffectShow = false
  PaGlobal_MiniGame_Find:bubbleShow()
end

-- DECOMPILER ERROR at PC157: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.close = function(self)
  -- function num : 0_2
  self._gameState = (self._state).None
  self._readyToNextGame = false
  self._readyToEndGame = false
  self._stateMsgKey = 0
  for _,slot in pairs(self._damageSlot) do
    slot:SetShow(false)
  end
  self._damageSlot = {}
  Panel_MiniGame_MiniGameResult:SetShow(false)
  Panel_MiniGame_Find:SetShow(false)
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).RakiaroTutorial, 1, (CppEnums.VariableStorageType).eVariableStorageType_User)
  self._tutorialOpen = 1
  ;
  ((self._ui)._maskBg):SetShow(false)
  ;
  ((self._ui)._bubbleBg):SetShow(false)
  ;
  ((self._ui)._tutorialStep_1):SetShow(false)
  ;
  ((self._ui)._tutorialStep_2):SetShow(false)
  ;
  ((self._ui)._tutorialStep_3):SetShow(false)
  ToClient_MiniGameFindHide()
end

-- DECOMPILER ERROR at PC160: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.createSlot = function(self)
  -- function num : 0_3
  for col = 0, (self._config)._slotCols - 1 do
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

    (self._slots)[col] = (Array.new)()
    for row = 0, (self._config)._slotRows - 1 do
      local slot = {close = nil, open = nil, damage = nil, isOpen = false}
      slot.close = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "Slot_Close_" .. col .. "_" .. row)
      slot.open = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "Slot_Open_" .. col .. "_" .. row)
      slot.damage = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "Slot_Damage_" .. col .. "_" .. row)
      CopyBaseProperty((self._ui)._baseCloseSlot, slot.close)
      CopyBaseProperty((self._ui)._baseOpenSlot, slot.open)
      CopyBaseProperty((self._ui)._baseCloseSlot, slot.damage)
      ;
      (slot.close):SetShow(false)
      ;
      (slot.close):SetEnable(true)
      ;
      (slot.open):SetShow(false)
      ;
      (slot.open):SetEnable(false)
      ;
      (slot.damage):SetShow(false)
      ;
      (slot.damage):SetEnable(false)
      slot.isOpen = false
      ;
      (slot.close):addInputEvent("Mouse_On", "PaGlobal_MiniGame_Find:OnCloseSlot(" .. col .. "," .. row .. ", true)")
      ;
      (slot.close):addInputEvent("Mouse_Out", "PaGlobal_MiniGame_Find:OnCloseSlot(" .. col .. "," .. row .. ", false)")
      ;
      (slot.close):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:ClickCloseSlot(" .. col .. "," .. row .. "," .. (self._clickType).LClcik .. ")")
      ;
      (slot.close):addInputEvent("Mouse_RUp", "PaGlobal_MiniGame_Find:ClickCloseSlot(" .. col .. "," .. row .. "," .. (self._clickType).RClcik .. ")")
      -- DECOMPILER ERROR at PC149: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self._slots)[col])[row] = slot
    end
  end
  -- DECOMPILER ERROR at PC161: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._mainObjBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_MiniGame_Find, "MainObjBG")
  CopyBaseProperty((self._ui)._staticObjBg, (self._ui)._mainObjBG)
  ;
  ((self._ui)._mainObjBG):SetShow(false)
  Panel_MiniGame_Find:SetChildIndex((self._ui)._maskBg, 9999)
  Panel_MiniGame_Find:SetChildIndex((self._ui)._tutorialStep_1, 9999)
  Panel_MiniGame_Find:SetChildIndex((self._ui)._tutorialStep_2, 9999)
  Panel_MiniGame_Find:SetChildIndex((self._ui)._tutorialStep_3, 9999)
  Panel_MiniGame_Find:SetChildIndex((self._ui)._bubbleBg, 9999)
  Panel_MiniGame_Find:SetChildIndex((self._ui)._facePicture, 9999)
  Panel_MiniGame_Find:SetChildIndex((self._ui)._startMsg, 9999)
end

-- DECOMPILER ERROR at PC163: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.registEventHandler = function(self)
  -- function num : 0_4
  Panel_MiniGame_Find:RegisterUpdateFunc("FGlobal_MiniGameFind_Update")
  ;
  ((self._ui)._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:askGameClose()")
  ;
  ((self._ui)._maskBg):addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_Find:TutorialNextStep()")
  registerEvent("FromClient_MiniGameFindSlotShowEmpty", "FromClient_MiniGameFindSlotShowEmpty")
  registerEvent("FromClient_MiniGameFindSlotShowMain", "FromClient_MiniGameFindSlotShowMain")
  registerEvent("FromClient_MiniGameFindSlotShowMainTexture", "FromClient_MiniGameFindSlotShowMainTexture")
  registerEvent("FromClient_MiniGameFindSlotShowSub", "FromClient_MiniGameFindSlotShowSub")
  registerEvent("FromClient_MiniGameFindSlotShowTrap", "FromClient_MiniGameFindSlotShowTrap")
  registerEvent("FromClient_MiniGameFindSetShow", "FromClient_MiniGameFindSetShow")
  registerEvent("FromClient_MiniGameFindSetReward", "FromClient_MiniGameFindSetReward")
  registerEvent("FromClient_MiniGameFindSetState", "FromClient_MiniGameFindSetState")
  registerEvent("FromClient_MiniGameFindDefaultImage", "FromClient_MiniGameFindDefaultImage")
  registerEvent("FromClient_MiniGameFindDynamicInfo", "FromClient_MiniGameFindDynamicInfo")
  registerEvent("FromClient_MiniGameFindStaticInfo", "FromClient_MiniGameFindStaticInfo")
end

-- DECOMPILER ERROR at PC166: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.OnCloseSlot = function(self, col, row, isOn)
  -- function num : 0_5
  local slot = ((self._slots)[col])[row]
  if slot.isOpen == true then
    return 
  end
  if isOn == true then
    (slot.close):SetSize(self._curSlotSize + 4, self._curSlotSize + 4)
    ;
    (slot.close):SetPosX((self._config)._slotStartPosX + self._curSlotSize * col - 2)
    ;
    (slot.close):SetPosY((self._config)._slotStartPosY + self._curSlotSize * row - 2)
  else
    ;
    (slot.close):SetSize(self._curSlotSize, self._curSlotSize)
    ;
    (slot.close):SetPosX((self._config)._slotStartPosX + self._curSlotSize * col)
    ;
    (slot.close):SetPosY((self._config)._slotStartPosY + self._curSlotSize * row)
  end
end

-- DECOMPILER ERROR at PC169: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.ClickCloseSlot = function(self, col, row, clickType)
  -- function num : 0_6
  local slot = ((self._slots)[col])[row]
  if slot.isOpen == true then
    return 
  end
  if (self._clickType).LClcik == clickType then
    audioPostEvent_SystemUi(11, 31)
  else
    audioPostEvent_SystemUi(11, 32)
    ;
    ((self._ui)._RClickCnt):AddEffect("fUI_Light", false, 5, 0)
    if self._tmpRClickCount <= 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MINIGAME_FINDROOT_RCLICKCOUNTTITLE_1"))
      return 
    end
  end
  ToClient_MiniGameFindClick(col, row, clickType)
end

-- DECOMPILER ERROR at PC172: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.endGame = function(self)
  -- function num : 0_7
  for row = 0, (self._config)._slotRows - 1 do
    for col = 0, (self._config)._slotCols - 1 do
      local slot = ((self._slots)[col])[row]
      ;
      (slot.close):SetEnable(false)
    end
  end
  audioPostEvent_SystemUi(11, 33)
end

-- DECOMPILER ERROR at PC175: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.refresh = function(self, slotMaxCol, slotMaxRow)
  -- function num : 0_8
  local diffCount = (self._config)._slotCols - slotMaxCol
  local slotSize = (self._config)._slotSize + 3 * diffCount
  for row = 0, (self._config)._slotRows - 1 do
    for col = 0, (self._config)._slotCols - 1 do
      local slot = ((self._slots)[col])[row]
      slot.isOpen = false
      if slotMaxCol <= col or slotMaxRow <= row then
        (slot.close):SetShow(false)
        ;
        (slot.close):SetEnable(false)
        ;
        (slot.open):SetShow(false)
        ;
        (slot.damage):SetShow(false)
      else
        ;
        (slot.close):SetSize(slotSize, slotSize)
        ;
        (slot.close):SetPosX((self._config)._slotStartPosX + slotSize * col)
        ;
        (slot.close):SetPosY((self._config)._slotStartPosY + slotSize * row)
        ;
        (slot.close):SetShow(true)
        ;
        (slot.close):SetEnable(true)
        ;
        (slot.close):setOnMouseCursorType(__eMouseCursorType_Dig)
        ;
        (slot.close):setClickMouseCursorType(__eMouseCursorType_Dig)
        ;
        (slot.open):SetSize(slotSize, slotSize)
        ;
        (slot.open):SetPosX((self._config)._slotStartPosX + slotSize * col)
        ;
        (slot.open):SetPosY((self._config)._slotStartPosY + slotSize * row)
        ;
        (slot.open):SetShow(false)
        ;
        (slot.damage):SetSize(slotSize, slotSize)
        ;
        (slot.damage):SetPosX((self._config)._slotStartPosX + slotSize * col)
        ;
        (slot.damage):SetPosY((self._config)._slotStartPosY + slotSize * row)
        ;
        (slot.damage):SetShow(false)
      end
    end
  end
  self._curSlotSize = slotSize
  ;
  ((self._ui)._mainObjBG):SetSize(self._mainColCnt * slotSize + self._addSize, self._mainRowCnt * slotSize + self._addSize)
end

-- DECOMPILER ERROR at PC178: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.askGameClose = function(self)
  -- function num : 0_9
  if (self._state).None == self._gameState then
    self:close()
  else
    ;
    (MessageBox.showMessageBox)(self._messageBoxData)
  end
end

-- DECOMPILER ERROR at PC181: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.createRewardSlot = function(self)
  -- function num : 0_10
  ((self._ui)._slotBackground):SetShow(false)
  for ii = 0, (self._config)._rewardMaxCount - 1 do
    local slot = {}
    slot.background = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui)._rightBG, "RewardItemBG_" .. ii)
    CopyBaseProperty((self._ui)._slotBackground, slot.background)
    ;
    (slot.background):SetPosY(185 + ii * 65)
    ;
    (slot.background):SetShow(true)
    ;
    (SlotItem.new)(slot, "RewardItemIcon_" .. ii, ii, slot.background, self._rewardSlotConfig)
    slot:createChild()
    ;
    (slot.icon):SetPosX(4)
    ;
    (slot.icon):SetPosY(4)
    ;
    (slot.icon):SetShow(true)
    ;
    (slot.icon):addInputEvent("Mouse_On", "PaGlobal_MiniGame_Find:itemTooltip_Show(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "PaGlobal_MiniGame_Find:itemTooltip_Hide()")
    -- DECOMPILER ERROR at PC76: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._rewardSlot)[ii] = slot
  end
end

-- DECOMPILER ERROR at PC184: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.itemTooltip_Show = function(self, index)
  -- function num : 0_11
  local itemSSW = getItemEnchantStaticStatus(((self._rewardSlot)[index]).itemNo)
  if itemSSW ~= nil then
    Panel_Tooltip_Item_SetPosition(index, (self._rewardSlot)[index], "minigameFindReward")
    Panel_Tooltip_Item_Show(itemSSW, Panel_MiniGame_Find, true)
  end
end

-- DECOMPILER ERROR at PC187: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.itemTooltip_Hide = function(self)
  -- function num : 0_12
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC190: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.getRewardIndex = function(self, pct)
  -- function num : 0_13
  if pct == 100 then
    return 0
  else
    for ii = 1, (self._config)._rewardMaxCount - 1 do
      if pct <= ii * 20 then
        return (self._config)._rewardMaxCount - ii
      end
    end
    return (self._config)._rewardMaxCount - 1
  end
end

-- DECOMPILER ERROR at PC193: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_MiniGame_Find.nextGameStart = function(self)
  -- function num : 0_14
  Panel_MiniGame_MiniGameResult:SetShow(false)
  self._readyToNextGame = false
  if self._gameCurDepth + 1 <= self._gameLastDepth then
    ToClient_MiniGameFindNext()
  end
end

FGlobal_MiniGameFind_RefreshText = function(isMsgShow)
  -- function num : 0_15
  local self = PaGlobal_MiniGame_Find
  local itemWrapper = ToClient_getEquipmentItem((CppEnums.EquipSlotNoClient).eEquipSlotNoSubTool)
  if itemWrapper ~= nil then
    local grade = (itemWrapper:getStaticStatus()):getGradeType()
    local lv = 0
    if (itemWrapper:get()):getEndurance() ~= 0 then
      lv = ((itemWrapper:get()):getKey()):getEnchantLevel()
    end
    local RClickCount = ToClient_MiniGameFindMaxRClickCount(grade, lv) - self._curRClickCount
    if RClickCount < 0 then
      RClickCount = 0
    end
    if RClickCount ~= self._tmpRClickCount then
      ((self._ui)._RClickCnt):AddEffect("fUI_Light", false, 5, 0)
      self._tmpRClickCount = RClickCount
      if isMsgShow == true then
        if RClickCount > 0 then
          local strMsg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAMEFIND_RCLICK", "rclick", RClickCount)
          Proc_ShowMessage_Ack(strMsg)
        else
          do
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MINIGAME_FINDROOT_RCLICKCOUNTTITLE_1"))
            ;
            ((self._ui)._RClickCnt):SetText(tostring(RClickCount))
            ;
            ((self._ui)._endurance):SetText(tostring((itemWrapper:get()):getEndurance()))
          end
        end
      end
    end
  end
end

FGlobal_MiniGameFind_Close = function()
  -- function num : 0_16
  PaGlobal_MiniGame_Find:close()
end

local __Tutorial_Update = function(deltaTime)
  -- function num : 0_17
  local self = PaGlobal_MiniGame_Find
  if self._tutorialIndex == -1 then
    self._tutorialTime = self._tutorialTime + deltaTime
    if self._tutorialTime > 0.5 then
      self._tutorialIndex = 0
      self:bubbleShow()
      self._tutorialTime = 0
    end
  end
end

-- DECOMPILER ERROR at PC201: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MiniGame_Find.bubbleShow = function(self)
  -- function num : 0_18
  local self = PaGlobal_MiniGame_Find
  if self._tutorialIndex == 0 then
    ((self._ui)._maskBg):SetShow(true)
    ;
    ((self._ui)._facePicture):SetShow(true)
    ;
    ((self._ui)._facePicture):EraseAllEffect()
    ;
    ((self._ui)._facePicture):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
    ;
    ((self._ui)._bubbleBg):SetShow(true)
    ;
    ((self._ui)._bubbleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAMEFIND_TUTORIALDESC_1"))
    local textSizeX = ((self._ui)._bubbleText):GetTextSizeX()
    ;
    ((self._ui)._bubbleBg):SetSize(textSizeX + 25, ((self._ui)._bubbleBg):GetSizeY())
  else
    do
      if self._tutorialIndex == 1 then
        ((self._ui)._maskBg):SetShow(true)
        ;
        ((self._ui)._facePicture):SetShow(true)
        ;
        ((self._ui)._facePicture):EraseAllEffect()
        ;
        ((self._ui)._facePicture):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
        ;
        ((self._ui)._bubbleBg):SetShow(true)
        ;
        ((self._ui)._bubbleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAMEFIND_TUTORIALDESC_2"))
        if not self._tutorialEffectShow then
          self:StartTutorial(0)
          self._tutorialEffectShow = true
        end
      else
        if self._tutorialIndex == 2 then
          ((self._ui)._maskBg):SetShow(true)
          ;
          ((self._ui)._facePicture):SetShow(true)
          ;
          ((self._ui)._facePicture):EraseAllEffect()
          ;
          ((self._ui)._facePicture):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
          ;
          ((self._ui)._bubbleBg):SetShow(true)
          ;
          ((self._ui)._bubbleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAMEFIND_TUTORIALDESC_3"))
          if not self._tutorialEffectShow then
            self:StartTutorial(2)
            self._tutorialEffectShow = true
          end
        else
          if self._tutorialIndex == 3 then
            ((self._ui)._maskBg):SetShow(true)
            ;
            ((self._ui)._facePicture):SetShow(true)
            ;
            ((self._ui)._facePicture):EraseAllEffect()
            ;
            ((self._ui)._facePicture):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
            ;
            ((self._ui)._bubbleBg):SetShow(true)
            ;
            ((self._ui)._bubbleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAMEFIND_TUTORIALDESC_4"))
            local textSizeX = ((self._ui)._bubbleText):GetTextSizeX()
            ;
            ((self._ui)._bubbleBg):SetSize(textSizeX + 25, ((self._ui)._bubbleBg):GetSizeY())
            if not self._tutorialEffectShow then
              self:StartTutorial(2)
              self._tutorialEffectShow = true
            end
          else
            do
              if self._tutorialIndex == 4 then
                ((self._ui)._maskBg):SetShow(true)
                ;
                ((self._ui)._facePicture):SetShow(true)
                ;
                ((self._ui)._facePicture):EraseAllEffect()
                ;
                ((self._ui)._facePicture):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
                ;
                ((self._ui)._bubbleBg):SetShow(true)
                ;
                ((self._ui)._bubbleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAMEFIND_TUTORIALDESC_5"))
                if not self._tutorialEffectShow then
                  self:StartTutorial(1)
                  self._tutorialEffectShow = true
                end
              else
                if self._tutorialIndex == 5 then
                  ((self._ui)._maskBg):SetShow(true)
                  ;
                  ((self._ui)._facePicture):SetShow(true)
                  ;
                  ((self._ui)._facePicture):EraseAllEffect()
                  ;
                  ((self._ui)._facePicture):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
                  ;
                  ((self._ui)._bubbleBg):SetShow(true)
                  ;
                  ((self._ui)._bubbleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAMEFIND_TUTORIALDESC_6"))
                  local textSizeX = ((self._ui)._bubbleText):GetTextSizeX()
                  ;
                  ((self._ui)._bubbleBg):SetSize(textSizeX + 25, ((self._ui)._bubbleBg):GetSizeY())
                  self._tutorialEffectShow = false
                else
                  do
                    ;
                    ((self._ui)._maskBg):SetShow(false)
                    ;
                    ((self._ui)._facePicture):SetShow(false)
                    ;
                    ((self._ui)._facePicture):EraseAllEffect()
                    ;
                    ((self._ui)._bubbleBg):SetShow(false)
                    ;
                    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).RakiaroTutorial, 1, (CppEnums.VariableStorageType).eVariableStorageType_User)
                    self._tutorialOpen = 1
                    self:StartMsg((self._ui)._startMsg)
                    self:HideMsg(4, 5)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

local __NoneState_Update = function(deltaTime)
  -- function num : 0_19
  local self = PaGlobal_MiniGame_Find
  if self._gameState ~= (self._state).None then
    return 
  end
  if self._readyToEndGame == false then
    return 
  end
  self._curSec = self._curSec + deltaTime
  local strMsg = ""
  if self._stateMsgKey == 1 then
    strMsg = PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_FINISH")
  else
    if self._stateMsgKey == 2 then
      strMsg = PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_FINISH_01")
    else
      if self._stateMsgKey == 3 then
        strMsg = PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_FINISH_02")
      else
      end
    end
  end
  if self._stateMsgKey == 4 then
    ((self._ui)._timerMsg):SetText(strMsg)
    if (self._config)._endGameSec <= self._curSec then
      self:close()
    end
  end
end

local __WaitState_Update = function(deltaTime)
  -- function num : 0_20
  local self = PaGlobal_MiniGame_Find
  if self._gameState ~= (self._state).Wait then
    return 
  end
  if self._readyToNextGame == false then
    return 
  end
  self._curSec = self._curSec + deltaTime
  local strMsg = ""
  if self._stateMsgKey == 1 then
    strMsg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_LEFTTIME", "second", (math.floor)((self._config)._nextGameSec - self._curSec + 1))
  else
    if self._stateMsgKey == 2 then
      strMsg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_LEFTTIME_01", "second", (math.floor)((self._config)._nextGameSec - self._curSec + 1))
    else
      if self._stateMsgKey == 3 then
        strMsg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_LEFTTIME_02", "second", (math.floor)((self._config)._nextGameSec - self._curSec + 1))
      else
      end
    end
  end
  if self._stateMsgKey == 4 then
    ((self._ui)._timerMsg):SetText(strMsg)
    if (self._config)._nextGameSec <= self._curSec then
      self:nextGameStart()
    end
  end
end

-- DECOMPILER ERROR at PC206: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_MiniGame_Find.StartTutorial = function(self, index)
  -- function num : 0_21
  if index == 0 then
    ((self._ui)._tutorialStep_1):SetShow(true)
    ;
    ((self._ui)._tutorialMaskBg_1):SetShow(false)
    ;
    ((self._ui)._tutorialFocus_1):SetShow(true)
    ;
    ((self._ui)._tutorialFocus_1):ResetVertexAni()
    ;
    ((self._ui)._tutorialFocus_1):SetVertexAniRun("Ani_Scale_New1", true)
    ;
    ((self._ui)._tutorialFocus_1):SetVertexAniRun("Ani_Move_Pos_New1", true)
  else
    if index == 1 then
      ((self._ui)._tutorialStep_2):SetShow(true)
      ;
      ((self._ui)._tutorialMaskBg_2):SetShow(false)
      ;
      ((self._ui)._tutorialFocus_2):SetShow(true)
      ;
      ((self._ui)._tutorialFocus_2):ResetVertexAni()
      ;
      ((self._ui)._tutorialFocus_2):SetVertexAniRun("Ani_Scale_New2", true)
      ;
      ((self._ui)._tutorialFocus_2):SetVertexAniRun("Ani_Move_Pos_New2", true)
    else
      if index == 2 then
        ((self._ui)._tutorialStep_3):SetShow(true)
        ;
        ((self._ui)._tutorialMaskBg_3):SetShow(false)
        ;
        ((self._ui)._tutorialFocus_3):SetShow(true)
        ;
        ((self._ui)._tutorialFocus_3):ResetVertexAni()
        ;
        ((self._ui)._tutorialFocus_3):SetVertexAniRun("Ani_Scale_New3", true)
        ;
        ((self._ui)._tutorialFocus_3):SetVertexAniRun("Ani_Move_Pos_New3", true)
      end
    end
  end
  local textSizeX = ((self._ui)._bubbleText):GetTextSizeX()
  ;
  ((self._ui)._bubbleBg):SetSize(textSizeX + 25, ((self._ui)._bubbleBg):GetSizeY())
end

local alphaDirChange = false
local alphaValue = 0
local __DamageSlot_Update = function(deltaTime)
  -- function num : 0_22 , upvalues : alphaDirChange, alphaValue
  local self = PaGlobal_MiniGame_Find
  if self._gameState ~= (self._state).Play then
    return 
  end
  if alphaDirChange == false then
    alphaValue = alphaValue + deltaTime / 2
    if alphaValue > 0.8 then
      alphaValue = 0.8
      alphaDirChange = true
    end
  else
    alphaValue = alphaValue - deltaTime / 2
    if alphaValue < 0 then
      alphaValue = 0
      alphaDirChange = false
    end
  end
  for _,slot in pairs(self._damageSlot) do
    slot:SetAlpha(alphaValue)
  end
end

FGlobal_MiniGameFind_Update = function(deltaTime)
  -- function num : 0_23 , upvalues : __Tutorial_Update, __NoneState_Update, __WaitState_Update, __DamageSlot_Update
  if PaGlobal_MiniGame_Find._tutorialOpen <= 0 then
    __Tutorial_Update(deltaTime)
    return 
  end
  __NoneState_Update(deltaTime)
  __WaitState_Update(deltaTime)
  __DamageSlot_Update(deltaTime)
end

-- DECOMPILER ERROR at PC220: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_MiniGame_Find.BubbleHideAni = function(self)
  -- function num : 0_24
  local closeAni = ((self._ui)._bubbleBg):addColorAnimation(4.8, 5, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  closeAni:SetStartColor((Defines.Color).C_FFFFFFFF)
  closeAni:SetEndColor((Defines.Color).C_00FFFFFF)
  closeAni:SetStartIntensity(3)
  closeAni:SetEndIntensity(1)
  closeAni:SetHideAtEnd(true)
  closeAni:SetDisableWhileAni(true)
end

-- DECOMPILER ERROR at PC223: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_MiniGame_Find.StartMsg = function(self, control)
  -- function num : 0_25
  local showAni = control:addMoveAnimation(0, 0.2, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  showAni:SetStartPosition(control:GetPosX(), control:GetPosY() - control:GetSizeY())
  showAni:SetEndPosition(control:GetPosX(), control:GetPosY())
  control:CalcUIAniPos(showAni)
  showAni:SetDisableWhileAni(true)
  control:SetShow(true)
end

-- DECOMPILER ERROR at PC226: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_MiniGame_Find.HideMsg = function(self, startTime, endTime)
  -- function num : 0_26
  local closeAni = ((self._ui)._startMsg):addColorAnimation(startTime, endTime, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  closeAni:SetStartColor((Defines.Color).C_FFFFFFFF)
  closeAni:SetEndColor((Defines.Color).C_00FFFFFF)
  closeAni:SetStartIntensity(3)
  closeAni:SetEndIntensity(1)
  closeAni.IsChangeChild = true
  closeAni:SetHideAtEnd(true)
  closeAni:SetDisableWhileAni(true)
end

FromClient_MiniGameFindSlotShowEmpty = function(col, row, uv0, uv1, uv2, uv3, imagePath)
  -- function num : 0_27
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).close
  slot:ChangeTextureInfoName(imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R13 in 'UnsetPending'

  ;
  (((self._slots)[col])[row]).isOpen = true
  slot:setOnMouseCursorType(__eMouseCursorType_Default)
  slot:setClickMouseCursorType(__eMouseCursorType_Default)
  slot:SetSize(self._curSlotSize, self._curSlotSize)
  slot:SetPosX((self._config)._slotStartPosX + self._curSlotSize * col)
  slot:SetPosY((self._config)._slotStartPosY + self._curSlotSize * row)
  slot:AddEffect("fUI_Minigame_Lbutton", false, 0, 0)
end

FromClient_MiniGameFindSlotShowMain = function(col, row)
  -- function num : 0_28
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).close
  if self._isMainLoad == false then
    ((self._ui)._mainObjBG):SetPosX(slot:GetPosX() - self._addSize / 2)
    ;
    ((self._ui)._mainObjBG):SetPosY(slot:GetPosY() - self._addSize / 2)
    ;
    ((self._ui)._mainObjBG):SetShow(true)
    self._isMainLoad = true
  end
  slot:SetEnable(false)
end

FromClient_MiniGameFindSlotShowMainTexture = function(mainColCnt, mainRowCnt, uv0, uv1, uv2, uv3, imagePath)
  -- function num : 0_29
  local self = PaGlobal_MiniGame_Find
  self._mainColCnt = mainColCnt
  self._mainRowCnt = mainRowCnt
  ;
  ((self._ui)._mainObjBG):ChangeTextureInfoName(imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func((self._ui)._mainObjBG, uv0, uv1, uv2, uv3)
  ;
  (((self._ui)._mainObjBG):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  ;
  ((self._ui)._mainObjBG):setRenderTexture(((self._ui)._mainObjBG):getBaseTexture())
end

local __InsertDamageSlot = function(col, row, uv0, uv1, uv2, uv3)
  -- function num : 0_30
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).damage
  slot:ChangeTextureInfoName("New_UI_Common_forLua/Window/MiniGame/MiniGameFind_05.dds")
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
  slot:SetShow(true)
  ;
  (table.insert)(self._damageSlot, slot)
end

FromClient_MiniGameFindSlotShowSub = function(col, row, uv0, uv1, uv2, uv3, imagePath, isSuccess)
  -- function num : 0_31 , upvalues : __InsertDamageSlot
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).open
  slot:ChangeTextureInfoName(imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
  slot:SetShow(true)
  slot:AddEffect("fUI_Minigame_Lbutton", false, 0, 0)
  if isSuccess == false then
    __InsertDamageSlot(col, row, uv0, uv1, uv2, uv3)
  end
end

FromClient_MiniGameFindSlotShowTrap = function(col, row, stoneType)
  -- function num : 0_32
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).open
  slot:ChangeTextureInfoName("New_UI_Common_forLua/Window/MiniGame/MiniGameFind_01.dds")
  if stoneType == 0 then
    local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, 1, 295, 54, 348)
    ;
    (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  else
    do
      do
        local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, 1, 349, 54, 402)
        ;
        (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
        slot:setRenderTexture(slot:getBaseTexture())
        ;
        ((((self._slots)[col])[row]).open):SetShow(true)
        slot:AddEffect("fUI_Minigame_Rbutton", false, 0, 0)
        audioPostEvent_SystemUi(11, 34)
      end
    end
  end
end

FromClient_MiniGameFindDynamicInfo = function(damageRate, RClickCount, emptyCount, subObjCount, trapCount)
  -- function num : 0_33
  local self = PaGlobal_MiniGame_Find
  local curPercent = damageRate / 10000
  if curPercent <= 0 then
    curPercent = 0
  end
  self._curRClickCount = RClickCount
  FGlobal_MiniGameFind_RefreshText(true)
  ;
  ((self._ui)._commercialValue):SetText((string.format)("%s : %.1f", PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MINIGAME_FINDROOT_WORTHTITLE"), curPercent) .. "%")
  ;
  ((self._ui)._damageGauge):SetProgressRate(curPercent)
  ;
  ((self._ui)._damageGauge):SetCurrentProgressRate(curPercent)
  ;
  ((self._ui)._emptyCnt):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_COUNT", "count", emptyCount))
  ;
  ((self._ui)._subObjCnt):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_COUNT", "count", subObjCount))
  ;
  ((self._ui)._trapCnt):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_COUNT", "count", trapCount))
  if emptyCount ~= self._maxEmptyCount then
    ((self._ui)._emptyCnt):AddEffect("UI_LevelUP_Skill", false, 5, 0)
    self._maxEmptyCount = emptyCount
  end
  if subObjCount ~= self._maxSubObjCount then
    ((self._ui)._subObjCnt):AddEffect("UI_LevelUP_Skill", false, 5, 0)
    self._maxSubObjCount = subObjCount
  end
  if trapCount ~= self._maxTrapCount then
    ((self._ui)._trapCnt):AddEffect("UI_LevelUP_Skill", false, 5, 0)
    self._maxTrapCount = trapCount
  end
  if curPercent ~= self._curPecent then
    ((self._ui)._commercialValue):AddEffect("fUI_Skill_Cooltime01", false, 5, 0)
    self._curPecent = curPercent
  end
  local idx = self:getRewardIndex(curPercent)
  if idx ~= self._rewardIndex then
    ((self._ui)._curRewardSlot):SetPosX((((self._rewardSlot)[idx]).background):GetPosX() - 5)
    ;
    ((self._ui)._curRewardSlot):SetPosY((((self._rewardSlot)[idx]).background):GetPosY() - 5)
    for ii = 0, (self._config)._rewardMaxCount - 1 do
      if idx == ii then
        (((self._rewardSlot)[ii]).icon):SetMonoTone(false)
      else
        ;
        (((self._rewardSlot)[ii]).icon):SetMonoTone(true)
      end
    end
    self._rewardIndex = idx
  end
end

FromClient_MiniGameFindStaticInfo = function(damageRate, RClickCount, emptyCount, subObjCount, trapCount, gameCurDepth, gameLastDepth)
  -- function num : 0_34
  local self = PaGlobal_MiniGame_Find
  local curPercent = damageRate / 10000
  if curPercent <= 0 then
    curPercent = 0
  end
  self._curRClickCount = 0
  self._curPecent = 100
  self._maxEmptyCount = emptyCount
  self._maxSubObjCount = subObjCount
  self._maxTrapCount = trapCount
  self._gameCurDepth = gameCurDepth
  self._gameLastDepth = gameLastDepth
  FGlobal_MiniGameFind_RefreshText(false)
  ;
  ((self._ui)._commercialValue):SetText((string.format)("%s : %.1f", PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MINIGAME_FINDROOT_WORTHTITLE"), curPercent) .. "%")
  ;
  ((self._ui)._damageGauge):SetProgressRate(curPercent)
  ;
  ((self._ui)._damageGauge):SetCurrentProgressRate(curPercent)
  ;
  ((self._ui)._emptyCnt):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_COUNT", "count", self._maxEmptyCount))
  ;
  ((self._ui)._subObjCnt):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_COUNT", "count", self._maxSubObjCount))
  ;
  ((self._ui)._trapCnt):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_COUNT", "count", self._maxTrapCount))
  ;
  ((self._ui)._gameDepth):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MINIGAME_FIND_CURRENTGRADE", "currentGrade", self._gameCurDepth, "maxGrade", self._gameLastDepth))
  local idx = self:getRewardIndex(curPercent)
  for ii = 0, (self._config)._rewardMaxCount - 1 do
    if idx == ii then
      (((self._rewardSlot)[ii]).icon):SetMonoTone(false)
    else
      ;
      (((self._rewardSlot)[ii]).icon):SetMonoTone(true)
    end
  end
  ;
  ((self._ui)._curRewardSlot):SetPosX((((self._rewardSlot)[idx]).background):GetPosX() - 5)
  ;
  ((self._ui)._curRewardSlot):SetPosY((((self._rewardSlot)[idx]).background):GetPosY() - 5)
  self._rewardIndex = idx
end

FromClient_MiniGameFindDefaultImage = function(col, row, uv0, uv1, uv2, uv3, imagePath)
  -- function num : 0_35
  local self = PaGlobal_MiniGame_Find
  local slot = (((self._slots)[col])[row]).close
  slot:ChangeTextureInfoName(imagePath)
  local xx1, yy1, xx2, yy2 = setTextureUV_Func(slot, uv0, uv1, uv2, uv3)
  ;
  (slot:getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  slot:setRenderTexture(slot:getBaseTexture())
end

FromClient_MiniGameFindSetShow = function(col, row)
  -- function num : 0_36
  local self = PaGlobal_MiniGame_Find
  self._tmpRClickCount = 0
  self._gameState = (self._state).Play
  for _,slot in pairs(self._damageSlot) do
    slot:SetShow(false)
  end
  self._damageSlot = {}
  self:refresh(col, row)
  self._isMainLoad = false
  self._tutorialTime = 0
  self._tutorialIndex = -1
  Panel_MiniGame_Find:SetShow(true)
  if Panel_Manufacture:GetShow() == true then
    Manufacture_Close()
  end
end

FromClient_MiniGameFindSetReward = function(rewardList)
  -- function num : 0_37
  if rewardList == nil then
    return 
  end
  local self = PaGlobal_MiniGame_Find
  for ii = 0, #rewardList do
    local itemSSW = getItemEnchantStaticStatus(rewardList[ii])
    ;
    ((self._rewardSlot)[ii]):setItemByStaticStatus(itemSSW)
    ;
    (((self._rewardSlot)[ii]).icon):SetShow(true)
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._rewardSlot)[ii]).itemNo = rewardList[ii]
  end
end

FromClient_MiniGameFindSetState = function(serverState, msgKey)
  -- function num : 0_38
  local self = PaGlobal_MiniGame_Find
  self._gameState = serverState
  self._stateMsgKey = msgKey
  if serverState == (self._state).None then
    self:endGame()
    self._readyToEndGame = true
  else
    if serverState == (self._state).Wait then
      self._readyToNextGame = true
    end
  end
  self._curSec = 0
  Panel_MiniGame_MiniGameResult:SetShow(true)
end

PaGlobal_MiniGame_Find:initialize()

