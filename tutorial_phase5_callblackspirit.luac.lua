-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase5_callblackspirit.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_CallBlackSpirit = {_phaseNo = 5, _currentStep = 0, _nextStep = 0, _currentProgress = 1, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {88, 349}
, _startLimitLevel = 15, 
_questData = {
[1] = {_questGroupNo = 650, _questId = 1}
, 
[2] = {_questGroupNo = 650, _questId = 2}
}
, 
_posData = {[1] = float3(-140042, 1181.99, 117240.02), [2] = float3(-140212, 1157.95, 114325)}
, 
_NpcKeyData = {[1] = 40720, [2] = 40603}
, 
_lastSpiritUiData = {_posX = 0, _posY = 0, _isLeftSideBubble = false, _stringBlack = nil, _stringYellow = nil}
}
local classType = nil
local isAcceptedQuest = false
local isClearQuest = false
-- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.checkPossibleForPhaseStart = function(self, stepNo)
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

-- DECOMPILER ERROR at PC57: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC64: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3 , upvalues : classType
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_CallBlackSpirit:startPhase()")
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
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
  FGlobal_NewQuickSlot_Update()
  QuickSlot_UpdateData()
  Panel_MainStatus_User_Bar:SetShow(true, false)
  FGlobal_ClassResource_SetShowControl(true)
  Panel_UIMain:SetShow(true, true)
  if stepNo ~= 1 then
    Panel_CheckedQuest:SetShow(true, false)
  end
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.endPhase = function(self)
  -- function num : 0_4
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialManager:startNextPhase()
end

local result = nil
-- DECOMPILER ERROR at PC71: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 2 or self._currentStep == 3 then
    self:showSuggestInteraction(self:updateCheckInteraction())
  end
end

local currentInteractableActor, isMatchCharacterKey = nil, nil
-- DECOMPILER ERROR at PC77: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.updateCheckInteraction = function(self)
  -- function num : 0_6 , upvalues : currentInteractableActor, isMatchCharacterKey
  currentInteractableActor = interaction_getInteractable()
  isMatchCharacterKey = false
  if self._currentStep == 2 then
    if (self._NpcKeyData)[1] ~= currentInteractableActor:getCharacterKeyRaw() then
      isMatchCharacterKey = currentInteractableActor == nil
      if (self._NpcKeyData)[2] ~= currentInteractableActor:getCharacterKeyRaw() then
        isMatchCharacterKey = self._currentStep ~= 3
        do return isMatchCharacterKey end
        -- DECOMPILER ERROR: 4 unprocessed JMP targets
      end
    end
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.showSuggestInteraction = function(self, isInteractable)
  -- function num : 0_7
  if isInteractable == false then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_0 , upvalues : self
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial((self._lastSpiritUiData)._stringBlack, (self._lastSpiritUiData)._stringYellow, (self._lastSpiritUiData)._isLeftSideBubble, (self._lastSpiritUiData)._posX, (self._lastSpiritUiData)._posY)
  end
)
  else
    if isInteractable == true then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_21"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_22"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_R")
  end
)
    end
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.handleChangeStep = function(self, currentStep)
  -- function num : 0_8
  if currentStep == 1 then
    self:changeStepSuggestCallBlackSpirit()
  else
    if currentStep == 2 then
      (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
      self:changeStepFollowQuest()
    else
      if currentStep == 3 then
        self:changeStepFindSkillInstructor()
      else
        if currentStep == 4 then
          self:endPhase()
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.changeStepSuggestCallBlackSpirit = function(self)
  -- function num : 0_9
  if self._currentProgress == 1 then
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):showSuggestCallSpiritUi()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  end
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallAddEffectRequestButton = function(self, dialogData)
  -- function num : 0_10 , upvalues : isAcceptedQuest
  if isAcceptedQuest == false then
    local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
    FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallAcceptBlackSpiritQuest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_11 , upvalues : isAcceptedQuest
  if self._currentProgress == 1 and questGroupNo == ((self._questData)[1])._questGroupNo and questId == ((self._questData)[1])._questId then
    isAcceptedQuest = true
    local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
    FGlobal_EraseAllEffect_ExitButton()
    FGlobal_AddEffect_ExitButton("UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallAfterBlackSpiritDialogClose = function(self)
  -- function num : 0_12 , upvalues : isAcceptedQuest
  if self._currentProgress == 1 and isAcceptedQuest == true then
    isAcceptedQuest = false
    FGlobal_EraseAllEffect_ExitButton()
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.changeStepFollowQuest = function(self)
  -- function num : 0_13 , upvalues : isAcceptedQuest
  if self._currentProgress == 1 then
    isAcceptedQuest = false
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
    Panel_CheckedQuest:SetShow(false)
    Panel_CheckedQuest:SetShow(true, true)
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._stringBlack = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_72")
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._stringYellow = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_73")
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._isLeftSideBubble = false
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._posX = Panel_CheckedQuest:GetPosX()
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._posY = Panel_CheckedQuest:GetPosY() + Panel_CheckedQuest:GetPosY() * 0.25
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_0 , upvalues : self
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial((self._lastSpiritUiData)._stringBlack, (self._lastSpiritUiData)._stringYellow, (self._lastSpiritUiData)._isLeftSideBubble, (self._lastSpiritUiData)._posX, (self._lastSpiritUiData)._posY)
  end
)
    Panel_CheckedQuest:AddEffect("UI_Tutorial_MouseMove", true, 140, -115)
  else
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

    if self._currentProgress == 2 then
      (self._lastSpiritUiData)._stringBlack = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_74")
      -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (self._lastSpiritUiData)._stringYellow = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_75")
      -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (self._lastSpiritUiData)._isLeftSideBubble = false
      -- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (self._lastSpiritUiData)._posX = Panel_CheckedQuest:GetPosX()
      -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (self._lastSpiritUiData)._posY = Panel_CheckedQuest:GetPosY() + Panel_CheckedQuest:GetPosY() * 0.25
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_1 , upvalues : self
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial((self._lastSpiritUiData)._stringBlack, (self._lastSpiritUiData)._stringYellow, (self._lastSpiritUiData)._isLeftSideBubble, (self._lastSpiritUiData)._posX, (self._lastSpiritUiData)._posY)
  end
)
    end
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallQuestWidgetMouseOver = function(self, show)
  -- function num : 0_14
  if self._currentProgress == 1 and show == true then
    Panel_CheckedQuest:EraseAllEffect()
    audioPostEvent_SystemUi(4, 12)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallClearBlackSpiritQuest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_15 , upvalues : isClearQuest
  if self._currentProgress <= 2 then
    self._currentProgress = 2
    Panel_CheckedQuest:EraseAllEffect()
    if questGroupNo == ((self._questData)[1])._questGroupNo and questId == ((self._questData)[1])._questId then
      isClearQuest = true
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_EraseAllEffect_ExitButton()
      FGlobal_AddEffect_ExitButton("UI_ArrowMark02", true, 0, -50)
    end
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallAcceptFindSkillInstructorQuest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_16 , upvalues : isClearQuest, isAcceptedQuest
  if self._currentProgress <= 2 then
    self._currentProgress = 2
    Panel_CheckedQuest:EraseAllEffect()
    if questGroupNo == ((self._questData)[2])._questGroupNo and questId == ((self._questData)[2])._questId then
      isClearQuest = true
      isAcceptedQuest = true
      FGlobal_EraseAllEffect_ExitButton()
      FGlobal_AddEffect_ExitButton("UI_ArrowMark02", true, 0, -50)
    end
  end
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallAfterNpcDialogClose = function(self)
  -- function num : 0_17 , upvalues : isClearQuest, isAcceptedQuest
  if self._currentProgress == 2 and isClearQuest == true and isAcceptedQuest == true then
    isClearQuest = false
    isAcceptedQuest = false
    FGlobal_EraseAllEffect_ExitButton()
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC123: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.changeStepFindSkillInstructor = function(self)
  -- function num : 0_18 , upvalues : isAcceptedQuest
  if self._currentProgress == 1 then
    isAcceptedQuest = false
    FGlobal_Panel_LowLevelGuide_MovePlay_FindWay()
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._stringBlack = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_6")
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._stringYellow = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_7")
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._isLeftSideBubble = false
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._posX = getScreenSizeX() * 0.5 + 150
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._lastSpiritUiData)._posY = getScreenSizeY() * 0.5 - 200
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_0 , upvalues : self
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial((self._lastSpiritUiData)._stringBlack, (self._lastSpiritUiData)._stringYellow, (self._lastSpiritUiData)._isLeftSideBubble, (self._lastSpiritUiData)._posX, (self._lastSpiritUiData)._posY)
  end
)
    FGlobal_DailyStamp_ShowCheck()
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallClearFindSkillInstructorQuest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_19 , upvalues : isClearQuest
  if self._currentProgress == 1 and questGroupNo == ((self._questData)[2])._questGroupNo and questId == ((self._questData)[2])._questId then
    isClearQuest = true
    local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
    FGlobal_EraseAllEffect_ExitButton()
    FGlobal_AddEffect_ExitButton("UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC132: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.eventCallAfterSkillInstructorDialogClose = function(self)
  -- function num : 0_20 , upvalues : isClearQuest, isAcceptedQuest
  if self._currentProgress == 1 and isClearQuest == true then
    Panel_SelfPlayerExpGage:SetShow(true, true)
    isClearQuest = false
    isAcceptedQuest = false
    FGlobal_EraseAllEffect_ExitButton()
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC135: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.handleEventQuestUpdateNotify = function(self, isAccept, questNoRaw)
  -- function num : 0_21
  local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(questNoRaw)
  if self._currentStep == 1 and isAccept == true then
    self:eventCallAcceptBlackSpiritQuest(isAccept, questGroupNo, questId)
  else
    if self._currentStep == 2 and isAccept == false then
      self:eventCallClearBlackSpiritQuest(isAccept, questGroupNo, questId)
    else
      if self._currentStep == 2 and isAccept == true then
        self:eventCallAcceptFindSkillInstructorQuest(isAccept, questGroupNo, questId)
      else
        if self._currentStep == 3 and isAccept == false then
          self:eventCallClearFindSkillInstructorQuest(isAccept, questGroupNo, questId)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.handleAfterAndPopFlush = function(self)
  -- function num : 0_22
  if self._currentStep == 1 then
    self:eventCallAfterBlackSpiritDialogClose()
  else
    if self._currentStep == 2 then
      self:eventCallAfterNpcDialogClose()
    else
      if self._currentStep == 3 then
        self:eventCallAfterSkillInstructorDialogClose()
      end
    end
  end
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.handleQuestWidgetMouseOver = function(self, show)
  -- function num : 0_23
  if self._currentStep == 2 then
    self:eventCallQuestWidgetMouseOver(show)
  end
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_CallBlackSpirit.handleShowDialog = function(self, dialogData)
  -- function num : 0_24
  if self._currentStep == 1 or self._currentStep == 2 then
    self:eventCallAddEffectRequestButton(dialogData)
  end
end


