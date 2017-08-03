-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase4_inventoryandquickslot.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_InventoryAndQuickSlot = {_phaseNo = 4, _currentStep = 0, _nextStep = 0, _currentProgress = 1, _returnStep = 0, _returnProgress = 0, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {88, 349}
, _startLimitLevel = 15}
local beginnerPotionItemKey = 502
local enabledEffectSlotInQuickSlot, classType = nil, nil
-- DECOMPILER ERROR at PC20: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("곽민�\176", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    _PA_LOG("곽민�\176", "튜토리얼 시작 �\128�\165 여부 �\128사중�\144 selfPlayer�\128 없습니다! _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local currentRegionKeyRaw = selfPlayer:getRegionKeyRaw()
  local isPossiblePhaseRegion = false
  for index,value in pairs(self._regionKeyRawList) do
    if value == currentRegionKeyRaw then
      isPossiblePhaseRegion = true
      break
    end
  end
  do
    if isPossiblePhaseRegion == false then
      _PA_LOG("곽민�\176", "튜토리얼�\180 �\128능한 �\128역이 아니�\128�\156 튜토리얼�\132 실행하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    if self._startLimitLevel < ((getSelfPlayer()):get()):getLevel() then
      _PA_LOG("곽민�\176", "캐릭터의 레벨�\180 " .. tostring(self._startLimitLevel) .. "�\188 초과했으�\128�\156 튜토리얼�\132 진행하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    return true
  end
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.startPhase = function(self, stepNo)
  -- function num : 0_2
  if self:checkPossibleForPhaseStart(stepNo) == false then
    return 
  end
  if PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    PaGlobal_SummonBossTutorial_Manager:endTutorial()
    _PA_LOG("곽민�\176", "튜토리얼 phase(" .. tostring(self._phaseNo) .. ")�\128 보스 소환 튜토리얼�\132 종료시킴! _phaseNo : " .. tostring(self._phaseNo))
  end
  local isSkippable = self:checkSkippablePhase()
  if isSkippable == true and PaGlobal_TutorialManager:isDoingTutorial() == false then
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo)
  else
    self:startPhaseXXX(stepNo)
  end
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3 , upvalues : classType
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_InventoryAndQuickSlot:startPhase()")
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  classType = (getSelfPlayer()):getClassType()
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
  ToClient_DeleteNaviGuideByGroup()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(false)
  PaGlobal_TutorialManager:setAllowMainQuestWidget(false)
  PaGlobal_TutorialUiManager:setShowAllDefaultUi(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  FGlobal_Panel_Radar_Show(true)
  Panel_TimeBar:SetShow(true, true)
  GameTips_Show()
  GameTips_Reposition()
  FGlobal_NewQuickSlot_Update()
  Panel_MainStatus_User_Bar:SetShow(true, false)
  FGlobal_ClassResource_SetShowControl(true)
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.endPhase = function(self)
  -- function num : 0_4
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialManager:startNextPhase()
end

local result = nil
-- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5 , upvalues : result
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if currentStep == 1 then
    result = false
  else
    if currentStep == 2 then
      result = false
    end
  end
  if result == true then
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if currentStep == 1 then
    self:changeStepUsePotionInInventory()
  else
    if currentStep == 2 then
      self:changeStepUsePotionInQuickSlot()
    else
      if currentStep == 3 then
        self:endPhase()
      else
        if currentStep == -1 then
          self:changeStepExceptionClosedInventory()
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.changeStepExceptionClosedInventory = function(self)
  -- function num : 0_7
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_38"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_15"), true, getScreenSizeX() * 0.5 + 150, getScreenSizeY() * 0.5 - 200)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_I")
  end
)
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.eventCallExceptionClosedInventory = function(self)
  -- function num : 0_8
  if self._currentStep == 2 and self._currentProgress == 1 then
    return 
  end
  if self._currentStep == 2 and self._currentProgress == 2 then
    return 
  end
  if self._currentStep ~= -1 then
    self._returnStep = self._currentStep
    self._returnProgress = self._currentProgress
    self._nextStep = -1
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.eventCallExceptionOpenedInventory = function(self)
  -- function num : 0_9
  self._nextStep = self._returnStep
  self._currentProgress = self._returnProgress
  self._returnStep = 0
  self._returnProgress = 0
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.changeStepUsePotionInInventory = function(self)
  -- function num : 0_10
  if self._currentProgress == 1 then
    Panel_QuickSlot:SetShow(false, false)
    if Panel_Window_Inventory:GetShow() == true then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
      return 
    end
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_38"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_15"), true, getScreenSizeX() * 0.5 - 150, getScreenSizeY() * 0.5)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_I")
  end
)
  else
    if self._currentProgress == 2 then
      Inventory_SetCheckRadioButtonNormalInventory(true)
      Inventory_updateSlotData()
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_70"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_71"), false, getScreenSizeX(), Panel_Window_Inventory:GetPosY() - 100)
  end
)
    end
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.eventCallOpenedInventory = function(self)
  -- function num : 0_11
  if self._currentProgress == 1 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.eventCallAddEffectInventoryBeginnerPotion = function(self, slot, slotItemKey)
  -- function num : 0_12 , upvalues : beginnerPotionItemKey
  if self._currentStep == 1 and self._currentProgress == 2 and beginnerPotionItemKey == slotItemKey then
    PaGlobal_Inventory:addSlotEffectForTutorial(slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.eventCallCompareInventoryBeginnerPotionItemKey = function(self, rClickedItemKey)
  -- function num : 0_13 , upvalues : beginnerPotionItemKey
  if self._currentProgress == 2 and beginnerPotionItemKey == rClickedItemKey then
    audioPostEvent_SystemUi(4, 12)
    self._nextStep = self._nextStep + 1
    self._currentProgress = 1
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.changeStepUsePotionInQuickSlot = function(self)
  -- function num : 0_14
  if self._currentProgress == 1 then
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
    Panel_QuickSlot:SetShow(false)
    FGlobal_QuickSlot_Show()
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_48") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_49"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_45"), false, Panel_QuickSlot:GetPosX(), Panel_QuickSlot:GetPosY() - 200)
  end
)
  end
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.eventCallAddEffectQuickSlot = function(self, slot, quickSlotItemKey)
  -- function num : 0_15 , upvalues : beginnerPotionItemKey, enabledEffectSlotInQuickSlot
  if self._currentProgress == 1 and beginnerPotionItemKey == quickSlotItemKey and enabledEffectSlotInQuickSlot == nil then
    PaGlobal_QuickSlot:addSlotEffectForTutorial(slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
    enabledEffectSlotInQuickSlot = slot
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.eventCallCompareUsedQuickSlotItemKey = function(self, itemKey)
  -- function num : 0_16 , upvalues : beginnerPotionItemKey, enabledEffectSlotInQuickSlot
  if self._currentProgress == 1 then
    if itemKey ~= beginnerPotionItemKey then
      return 
    end
    if enabledEffectSlotInQuickSlot ~= nil then
      PaGlobal_QuickSlot:eraseSlotEffectForTutorial(enabledEffectSlotInQuickSlot)
      enabledEffectSlotInQuickSlot = nil
    end
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
    audioPostEvent_SystemUi(4, 12)
    self._nextStep = self._nextStep + 1
    self._currentProgress = 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.handleOpenedInventory = function(self)
  -- function num : 0_17
  if self._currentStep == 1 then
    self:eventCallOpenedInventory()
  else
    if self._currentStep == -1 then
      self:eventCallExceptionOpenedInventory()
    end
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.handleClosedInventory = function(self)
  -- function num : 0_18
  self:eventCallExceptionClosedInventory()
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.handleUpdateInventorySlotData = function(self, slot, slotItemKey)
  -- function num : 0_19
  if self._currentStep == 1 or self._currentStep == 2 then
    self:eventCallAddEffectInventoryBeginnerPotion(slot, slotItemKey)
  end
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.handleInventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_20
  if self._currentStep == 1 then
    self:eventCallCompareInventoryBeginnerPotionItemKey(rClickedItemKey)
  end
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.handleUpdateQuickSlotPerFrame = function(self, slot, quickSlotItemKey)
  -- function num : 0_21
  if self._currentStep == 2 then
    self:eventCallAddEffectQuickSlot(slot, quickSlotItemKey)
  end
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InventoryAndQuickSlot.handleQuickSlotClick = function(self, clickedItemKey)
  -- function num : 0_22
  if self._currentStep == 2 then
    self:eventCallCompareUsedQuickSlotItemKey(clickedItemKey)
  end
end


