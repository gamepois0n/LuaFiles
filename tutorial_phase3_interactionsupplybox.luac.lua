-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase3_interactionsupplybox.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_InteractionSupplyBox = {_phaseNo = 3, _currentStep = 0, _nextStep = 0, _currentProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {88, 349}
, _startLimitLevel = 15}
local supplyBoxCharacterKey = 35634
local beginnerPotion = 502
local navigationGuideParam, classType = nil, nil
-- DECOMPILER ERROR at PC20: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.checkPossibleForPhaseStart = function(self, stepNo)
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

-- DECOMPILER ERROR at PC23: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC30: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3 , upvalues : classType
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_InteractionSupplyBox:startPhase()")
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  classType = (getSelfPlayer()):getClassType()
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
  ToClient_DeleteNaviGuideByGroup()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(false)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(false)
  PaGlobal_TutorialManager:setAllowMainQuestWidget(false)
  PaGlobal_TutorialUiManager:setShowAllDefaultUi(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  FGlobal_NewQuickSlot_Update()
  FGlobal_Panel_Radar_Show(true)
  Panel_TimeBar:SetShow(true, false)
  GameTips_Show()
  GameTips_Reposition()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.endPhase = function(self)
  -- function num : 0_4
  self._currentStep = 0
  self._nextStep = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:startNextPhase()
end

local result = nil
-- DECOMPILER ERROR at PC38: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5 , upvalues : result
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    result = self:updateWaitMainStatusUserBarComment(deltaTime)
  else
    if self._currentStep == 2 then
      result = false
    else
      if self._currentStep == 3 then
        result = self:updateCheckInteraction(deltaTime)
      else
        if self._currentStep == 4 then
          self:endPhase()
        end
      end
    end
  end
  if result == true then
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStepWaitMainStatusUserBarComment()
  else
    if self._currentStep == 2 then
      self:changeStepMoveDestination()
    else
      if self._currentStep == 3 then
        self:changeStepCheckInteraction()
      end
    end
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.changeStepWaitMainStatusUserBarComment = function(self)
  -- function num : 0_7
  FGlobal_Panel_MainStatus_User_Bar_Show()
  FGlobal_ClassResource_SetShowControl(true)
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_88"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_89"), true, Panel_MainStatus_User_Bar:GetPosX() + Panel_MainStatus_User_Bar:GetSizeX() * 1.1, Panel_MainStatus_User_Bar:GetPosY() - Panel_MainStatus_User_Bar:GetSizeY())
  end
)
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.updateWaitMainStatusUserBarComment = function(self, deltaTime)
  -- function num : 0_8
  if 6 * timeRatio < self._updateTime then
    self._updateTime = 0
    self._nextStep = self._nextStep + 1
  end
  self._updateTime = self._updateTime + deltaTime
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.changeStepMoveDestination = function(self)
  -- function num : 0_9 , upvalues : navigationGuideParam
  navigationGuideParam = NavigationGuideParam()
  if self._currentProgress == 1 then
    worldmapNavigatorStart(float3(-156384.67, -518.35, 134599.7), navigationGuideParam, false, false, true)
    FGlobal_Panel_Radar_Show_AddEffect()
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_90"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_91"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      worldmapNavigatorStart(float3(-153560.58, -300.81, 134786.77), navigationGuideParam, false, false, true)
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_92"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_93"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    end
  end
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.eventCallDeleteNavigationGuide = function(self, key)
  -- function num : 0_10
  if self._currentProgress == 1 then
    audioPostEvent_SystemUi(4, 12)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == 2 then
      self._nextStep = self._nextStep + 1
    end
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.changeStepCheckInteraction = function(self)
  -- function num : 0_11 , upvalues : navigationGuideParam
  navigationGuideParam = NavigationGuideParam()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  navigationGuideParam._isAutoErase = false
  worldmapNavigatorStart(float3(-151500.78, -243.44, 132849.84), navigationGuideParam, false, false, true)
end

local currentInteractableActor, isMatchCharacterKey = nil, nil
-- DECOMPILER ERROR at PC65: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.updateCheckInteraction = function(self)
  -- function num : 0_12 , upvalues : currentInteractableActor, isMatchCharacterKey, supplyBoxCharacterKey
  currentInteractableActor = interaction_getInteractable()
  isMatchCharacterKey = false
  if supplyBoxCharacterKey ~= currentInteractableActor:getCharacterKeyRaw() then
    isMatchCharacterKey = currentInteractableActor == nil
    if isMatchCharacterKey == false then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_32"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_68"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    elseif isMatchCharacterKey == true then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_36"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_37"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_R")
  end
)
    end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

local gainedBeginnerPotion = false
local isFinish = false
-- DECOMPILER ERROR at PC72: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.eventCallClickedSupplyBoxExitButton = function(self, talker)
  -- function num : 0_13 , upvalues : supplyBoxCharacterKey, gainedBeginnerPotion
  if talker ~= nil and talker:getCharacterKey() == supplyBoxCharacterKey then
    Inventory_SetCheckRadioButtonNormalInventory(true)
    Inventory_updateSlotData()
    if gainedBeginnerPotion == true then
      return true
    end
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.handleUpdateInventorySlotData = function(self, slot, slotItemKey)
  -- function num : 0_14 , upvalues : beginnerPotion, gainedBeginnerPotion
  if slotItemKey == beginnerPotion then
    gainedBeginnerPotion = true
  end
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.handleClickedExitButton = function(self, talker)
  -- function num : 0_15 , upvalues : isFinish
  if self._currentStep == 3 then
    isFinish = self:eventCallClickedSupplyBoxExitButton(talker)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.handleAfterAndPopFlush = function(self)
  -- function num : 0_16 , upvalues : isFinish
  if isFinish == true then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_TutorialPhase_InteractionSupplyBox.handleDeleteNavigationGuide = function(self, key)
  -- function num : 0_17
  if self._currentStep == 2 then
    self:eventCallDeleteNavigationGuide(key)
  end
end


