-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase7_findrequesttarget.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_FindRequestTarget = {_phaseNo = 7, _currentStep = 0, _nextStep = 0, _currentProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {88, 349}
, _startLimitLevel = 15, 
_questData = {
[1] = {_questGroupNo = 650, _questId = 3}
}
}
-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.checkPossibleForPhaseStart = function(self, stepNo)
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

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_FindRequestTarget:startStep() typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  classType = (getSelfPlayer()):getClassType()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(false)
  PaGlobal_TutorialManager:setAllowMainQuestWidget(false)
  PaGlobal_TutorialUiManager:setShowAllDefaultUi(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  FGlobal_Panel_Radar_Show(true)
  Panel_TimeBar:SetShow(true, true)
  GameTips_Show()
  GameTips_Reposition()
  Panel_SkillCommand:SetShow(true, true)
  FGlobal_NewQuickSlot_Update()
  QuickSlot_UpdateData()
  Panel_UIMain:SetShow(true, true)
  Panel_SelfPlayerExpGage:SetShow(true, false)
  FGlobal_Panel_MainStatus_User_Bar_Show()
  FGlobal_ClassResource_SetShowControl(true)
  Panel_CheckedQuest:SetShow(true, false)
  Panel_MainQuest:SetShow(false, false)
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.endPhase = function(self)
  -- function num : 0_4
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialManager:setAllowMainQuestWidget(true)
  Panel_MainQuest:SetShow(true, true)
  PaGlobal_TutorialManager:endTutorial()
end

local result = false
-- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5 , upvalues : result
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    result = self:updateStepOpenQuestWindow(deltaTime)
  end
  if result == true then
    result = false
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStepOpenQuestWindow()
  else
    if self._currentStep == 2 then
      self:changeStepSuggestCallBlackSpirit()
    end
  end
end

local isNeedToCheckUpdateTime = true
-- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.changeStepOpenQuestWindow = function(self)
  -- function num : 0_7 , upvalues : isNeedToCheckUpdateTime
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_76"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_77"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_78"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_79"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        FGlobal_Panel_Radar_Show_AddEffect()
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_80"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_81"), false, FGlobal_Panel_Radar_GetPosX() - 300, FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY())
  end
)
      else
        if self._currentProgress == 4 then
          isNeedToCheckUpdateTime = true
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_82"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_83"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
        else
          if self._currentProgress == 5 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_84"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_85"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.updateStepOpenQuestWindow = function(self, deltaTime)
  -- function num : 0_8 , upvalues : isNeedToCheckUpdateTime
  if self._currentProgress == 4 and isNeedToCheckUpdateTime == true then
    if self._updateTime > 4 then
      self._updateTime = 0
      ;
      (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setShowAll(false)
      isNeedToCheckUpdateTime = false
    end
    self._updateTime = self._updateTime + deltaTime
  else
    if self._currentProgress == 5 then
      if self._updateTime > 4 then
        self._updateTime = 0
        return true
      end
      self._updateTime = self._updateTime + deltaTime
    end
  end
  return false
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.eventCallShowQuestNewWindow = function(self, isShow)
  -- function num : 0_9
  -- DECOMPILER ERROR at PC8: Unhandled construct in 'MakeBoolean' P1

  if isShow == true and self._currentProgress == 1 then
    audioPostEvent_SystemUi(4, 12)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
  if isShow == false and self._currentProgress == 2 then
    audioPostEvent_SystemUi(4, 12)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.eventCallRadarMouseOn = function(self)
  -- function num : 0_10
  if self._currentProgress == 3 then
    audioPostEvent_SystemUi(4, 12)
    FGlobal_Panel_Radar_Show_AddEffect()
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

local isSatisfiedCondition = false
-- DECOMPILER ERROR at PC63: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.eventCallCheckQuestCondition = function(self)
  -- function num : 0_11 , upvalues : isSatisfiedCondition
  if self._currentProgress <= 4 and isSatisfiedCondition == false then
    self._currentProgress = 4
    local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId)
    if isSatisfy == true then
      isSatisfiedCondition = true
      audioPostEvent_SystemUi(4, 12)
      self._currentProgress = 1
      self._nextStep = self._nextStep + 1
    end
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.changeStepSuggestCallBlackSpirit = function(self)
  -- function num : 0_12 , upvalues : isSatisfiedCondition
  if self._currentProgress == 1 then
    isSatisfiedCondition = false
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):showSuggestCallSpiritUi()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  end
end

local isClearQuest = false
-- DECOMPILER ERROR at PC72: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.eventCallClearBlackSpiritQuest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_13 , upvalues : isClearQuest
  if self._currentProgress == 1 and questGroupNo == ((self._questData)[1])._questGroupNo and questId == ((self._questData)[1])._questId then
    isClearQuest = true
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.eventCallAfterBlackSpiritDialogClose = function(self)
  -- function num : 0_14 , upvalues : isClearQuest
  if self._currentProgress == 1 and isClearQuest == true then
    isClearQuest = false
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.handleEventQuestUpdateNotify = function(self, isAccept, questNoRaw)
  -- function num : 0_15
  local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(questNoRaw)
  if ((self._currentStep == 1 and isAccept ~= true) or self._currentStep == 2) and isAccept == false then
    self:eventCallClearBlackSpiritQuest(isAccept, questGroupNo, questId)
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.handleAfterAndPopFlush = function(self)
  -- function num : 0_16
  if self._currentStep == 2 then
    self:eventCallAfterBlackSpiritDialogClose()
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.handleShowQuestNewWindow = function(self, isShow)
  -- function num : 0_17
  if self._currentStep == 1 then
    self:eventCallShowQuestNewWindow(isShow)
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.handleRadarMouseOn = function(self)
  -- function num : 0_18
  if self._currentStep == 1 then
    self:eventCallRadarMouseOn()
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_FindRequestTarget.handleQuestWidgetUpdate = function(self)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallCheckQuestCondition()
  end
end


