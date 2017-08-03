-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase9_ancientstonechamber.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_AncientStoneChamber = {_phaseNo = 9, _currentStep = 0, _nextStep = 0, _currentProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = false, _startLimitLevel = 15, 
_questData = {
[1] = {_questGroupNo = 653, _questId = 7}
}
, 
_regionKeyRawList = {[1] = 137}
}
-- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.checkPossibleForPhaseStart = function(self, stepNo)
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

-- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_AncientStoneChamber:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  classType = (getSelfPlayer()):getClassType()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
  self:eventCallStep1QuestWidgetUpdate()
  self:updatePerFrame(0)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.endPhase = function(self)
  -- function num : 0_4
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

local result = false
-- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5 , upvalues : result
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    result = self:updateStepInteractionStatue(deltaTime)
  end
  if result == true then
    result = false
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStepInteractionStatue()
  else
    if self._currentStep == 2 then
      self:endPhase()
    end
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.changeStepInteractionStatue = function(self)
  -- function num : 0_7
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_17"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_18"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_19"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_20"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_21"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_22"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_R")
  end
)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_23"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_24"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_R")
  end
)
        else
          if self._currentProgress == 5 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_25"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_26"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_R")
  end
)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.updateStepInteractionStatue = function(self, deltaTime)
  -- function num : 0_8
  if self._currentProgress <= 3 then
    if self._updateTime > 2.5 then
      self._updateTime = 0
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
    self._updateTime = self._updateTime + deltaTime
  end
  return false
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.eventCallStep1QuestWidgetUpdate = function(self)
  -- function num : 0_9
  local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId)
  if isSatisfy == true then
    self._currentProgress = 5
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.eventCallClearQuest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_10
  if questGroupNo == ((self._questData)[1])._questGroupNo and questId == ((self._questData)[1])._questId then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.handleRegionChanged = function(self, regionInfo)
  -- function num : 0_11
  local regionKeyRaw = regionInfo:getRegionKey()
  if regionKeyRaw == -1 then
    self:endPhase()
  end
  local isPossibleTutorialRegion = false
  for index,value in pairs(self._regionKeyRawList) do
    if value == regionKeyRaw then
      isPossibleTutorialRegion = true
      break
    end
  end
  do
    if isPossibleTutorialRegion == false then
      self:endPhase()
    end
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.handleQuestWidgetUpdate = function(self)
  -- function num : 0_12
  if self._currentStep == 1 then
    self:eventCallStep1QuestWidgetUpdate()
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_AncientStoneChamber.handleEventQuestUpdateNotify = function(self, isAccept, questNoRaw)
  -- function num : 0_13
  local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(questNoRaw)
  if self._currentStep == 1 and isAccept == false then
    self:eventCallClearQuest(isAccept, questGroupNo, questId)
  end
end


