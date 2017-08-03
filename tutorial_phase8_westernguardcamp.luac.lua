-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase8_westernguardcamp.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_WesternGuardCamp = {_phaseNo = 8, _currentStep = 0, _nextStep = 0, _currentProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, _startLimitLevel = 15, 
_questData = {
[1] = {_questGroupNo = 653, _questId = 5}
, 
[2] = {_questGroupNo = 1001, _questId = 71}
}
, 
_regionKeyRawList = {[1] = 9, [2] = 10}
}
local uiQuestIconGuideImage = (UI.getChildControl)(Panel_Tutorial, "Static_QuestImage")
local setQuestIconGuideImage = function(posX, posY)
  -- function num : 0_0 , upvalues : uiQuestIconGuideImage
  local uiQuestIconGuideImageSizeX = uiQuestIconGuideImage:GetSizeX()
  local uiQuestIconGuideImageSizeY = uiQuestIconGuideImage:GetSizeY()
  uiQuestIconGuideImage:SetPosX(posX - uiQuestIconGuideImageSizeX * 0.5)
  uiQuestIconGuideImage:SetPosY(posY - uiQuestIconGuideImageSizeY * 0.5)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_1
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

-- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.checkSkippablePhase = function(self)
  -- function num : 0_2
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.startPhase = function(self, stepNo)
  -- function num : 0_3
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

-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.startPhaseXXX = function(self, stepNo)
  -- function num : 0_4
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_WesternGuardCamp:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
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
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.endPhase = function(self)
  -- function num : 0_5 , upvalues : uiQuestIconGuideImage
  self._currentProgress = 1
  self._currentStep = 0
  self._nextStep = 1
  if uiQuestIconGuideImage:GetShow() == true then
    uiQuestIconGuideImage:SetIgnore(true)
    local aniInfo = (UIAni.AlphaAnimation)(0, uiQuestIconGuideImage, 0, 0.25)
    aniInfo:SetHideAtEnd(true)
    PaGlobal_TutorialUiMasking:hideQuestMasking()
  end
  do
    Panel_CheckedQuest:EraseAllEffect()
    PaGlobal_CheckedQuest:eraseEffectQuestNaviButtonForTutorial()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
    PaGlobal_TutorialManager:endTutorial()
  end
end

local result = false
-- DECOMPILER ERROR at PC51: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.updatePerFrame = function(self, deltaTime)
  -- function num : 0_6 , upvalues : result
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    result = self:updateStepMeetTargetNpc(deltaTime)
  end
  if result == true then
    result = false
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleChangeStep = function(self, currentStep)
  -- function num : 0_7
  if self._currentStep == 1 then
    self:changeStepMeetTargetNpc()
  else
    if self._currentStep == 2 then
      self:changeStepTryAutoNaviButton()
    else
      if self._currentStep == 3 then
        self:changeStepMeetCompleteNpc()
      end
    end
  end
end

local isAcceptQuest = false
-- DECOMPILER ERROR at PC61: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.changeStepMeetTargetNpc = function(self)
  -- function num : 0_8 , upvalues : isAcceptQuest, setQuestIconGuideImage, uiQuestIconGuideImage
  if self._currentProgress == 1 then
    isAcceptQuest = false
    ToClient_DeleteNaviGuideByGroup()
    setQuestIconGuideImage(getScreenSizeX() * 0.5, getScreenSizeY() * 0.5)
    uiQuestIconGuideImage:SetAlpha(0.5)
    uiQuestIconGuideImage:SetShow(true)
    PaGlobal_TutorialUiMasking:showSpiritMasking()
    ;
    (UIAni.AlphaAnimation)(1, uiQuestIconGuideImage, 0, 1.5)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_01") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_02"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 330)
  end
)
    uiQuestIconGuideImage:addInputEvent("Mouse_LUp", "PaGlobal_TutorialPhase_WesternGuardCamp:handleMouseLUp_QuestIconGuideImage()")
    uiQuestIconGuideImage:SetIgnore(true)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_03") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_04"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 330)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_05"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_06"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 330)
  end
)
        uiQuestIconGuideImage:SetIgnore(false)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiMasking:hideQuestMasking()
          uiQuestIconGuideImage:SetIgnore(true)
          local navigationGuideParam = NavigationGuideParam()
          ToClient_DeleteNaviGuideByGroup()
          worldmapNavigatorStart(float3(-65010.1, -4053.25, 43990.1), navigationGuideParam, false, false, true)
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_07"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_08"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.updateStepMeetTargetNpc = function(self, deltaTime)
  -- function num : 0_9
  if self._currentProgress < 3 then
    if 2.5 * timeRatio < self._updateTime then
      self._updateTime = 0
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
    self._updateTime = self._updateTime + deltaTime
  end
  return false
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.eventCallAcceptStep1Quest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_10 , upvalues : isAcceptQuest
  if questGroupNo == ((self._questData)[2])._questGroupNo and questId == ((self._questData)[2])._questId then
    isAcceptQuest = true
  end
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.eventCallAfterStep1DialogClose = function(self)
  -- function num : 0_11 , upvalues : isAcceptQuest
  if isAcceptQuest == true then
    isAcceptQuest = false
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.addEffectQuestFindNaviButtonForTutorial = function(self, questGroupNo, questId)
  -- function num : 0_12
  local questUiInfoInPanelCheckedQuest = PaGlobal_CheckedQuest:findShownQuestUiInCheckedQuest(questGroupNo, questId)
  if questUiInfoInPanelCheckedQuest ~= nil then
    PaGlobal_CheckedQuest:addEffectQuestFindNaviButtonForTutorial(questUiInfoInPanelCheckedQuest)
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.changeStepTryAutoNaviButton = function(self)
  -- function num : 0_13 , upvalues : uiQuestIconGuideImage
  if self._currentProgress == 1 then
    uiQuestIconGuideImage:SetShow(false)
    if Panel_CheckedQuest:GetShow() == false then
      Panel_CheckedQuest:SetShow(true, true)
    end
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_09"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_10"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    Panel_CheckedQuest:AddEffect("UI_Tutorial_MouseMove", true, 140, -115)
  else
    if self._currentProgress == 2 then
      self:addEffectQuestFindNaviButtonForTutorial(((self._questData)[2])._questGroupNo, ((self._questData)[2])._questId)
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_11"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_12"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_27"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_28"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
      end
    end
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.eventCallQuestWidgetMouseOver = function(self, show)
  -- function num : 0_14
  if self._currentProgress == 1 and show == true then
    Panel_CheckedQuest:EraseAllEffect()
    audioPostEvent_SystemUi(4, 12)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.eventCallClickQuestWidgetFindTarget = function(self, questGroupNo, questId, condition, isAuto)
  -- function num : 0_15
  if questGroupNo == ((self._questData)[2])._questGroupNo and questId == ((self._questData)[2])._questId then
    audioPostEvent_SystemUi(4, 12)
    PaGlobal_CheckedQuest:eraseEffectQuestNaviButtonForTutorial()
    _PA_LOG("곽민�\176", "길찾�\176 버튼 클릭 questGroupNo : " .. tostring(questGroupNo) .. " / questId : " .. tostring(questId) .. " / condition : " .. tostring(condition) .. " / isAuto : " .. tostring(isAuto))
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.eventCallStep2QuestWidgetUpdate = function(self)
  -- function num : 0_16
  local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(((self._questData)[2])._questGroupNo, ((self._questData)[2])._questId)
  if isSatisfy == true then
    audioPostEvent_SystemUi(4, 12)
    Panel_CheckedQuest:EraseAllEffect()
    PaGlobal_CheckedQuest:eraseEffectQuestNaviButtonForTutorial()
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.eventCallStep2QuestWidgetScrollEvent = function(self, isDown)
  -- function num : 0_17
  if self._currentProgress == 2 then
    PaGlobal_CheckedQuest:eraseEffectQuestNaviButtonForTutorial()
    self:addEffectQuestFindNaviButtonForTutorial(((self._questData)[2])._questGroupNo, ((self._questData)[2])._questId)
  end
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.changeStepMeetCompleteNpc = function(self)
  -- function num : 0_18
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_15"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_16"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.eventCallClearStep3Quest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_19
  if questGroupNo == ((self._questData)[2])._questGroupNo and questId == ((self._questData)[2])._questId then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleRegionChanged = function(self, regionInfo)
  -- function num : 0_20
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

-- DECOMPILER ERROR at PC103: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleEventQuestUpdateNotify = function(self, isAccept, questNoRaw)
  -- function num : 0_21
  local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(questNoRaw)
  if self._currentStep == 1 and isAccept == true then
    self:eventCallAcceptStep1Quest(isAccept, questGroupNo, questId)
  else
    if self._currentStep == 3 and isAccept == false then
      self:eventCallClearStep3Quest(isAccept, questGroupNo, questId)
    end
  end
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleAfterAndPopFlush = function(self)
  -- function num : 0_22
  if self._currentStep == 1 then
    self:eventCallAfterStep1DialogClose()
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleQuestWidgetMouseOver = function(self, show)
  -- function num : 0_23
  if self._currentStep == 2 then
    self:eventCallQuestWidgetMouseOver(show)
  end
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleClickedQuestWidgetFindTarget = function(self, questGroupNo, questId, condition, isAuto)
  -- function num : 0_24
  if self._currentStep == 2 then
    self:eventCallClickQuestWidgetFindTarget(questGroupNo, questId, condition, isAuto)
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleQuestWidgetUpdate = function(self)
  -- function num : 0_25
  if self._currentStep == 2 then
    self:eventCallStep2QuestWidgetUpdate()
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleQuestWidgetScrollEvent = function(self, isDown)
  -- function num : 0_26
  if self._currentStep == 2 then
    self:eventCallStep2QuestWidgetScrollEvent(isDown)
  end
end

-- DECOMPILER ERROR at PC122: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_WesternGuardCamp.handleMouseLUp_QuestIconGuideImage = function(self)
  -- function num : 0_27 , upvalues : uiQuestIconGuideImage
  audioPostEvent_SystemUi(4, 12)
  uiQuestIconGuideImage:SetIgnore(true)
  local aniInfo = (UIAni.AlphaAnimation)(0, uiQuestIconGuideImage, 0, 0.25)
  aniInfo:SetHideAtEnd(true)
  PaGlobal_TutorialUiMasking:hideQuestMasking()
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end


