-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase20_wallriding.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_WallRiding = {_phaseNo = 20, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 2, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {41}
, 
_questData = {
[1] = {_questGroupNo = 658, _questId = 8}
}
}
local uiWallRidingGuideImage = (UI.getChildControl)(Panel_Tutorial, "Static_KeyTutorialImage")
local setQuestIconGuideImage = function(posX, posY)
  -- function num : 0_0 , upvalues : uiWallRidingGuideImage
  local uiWallRidingGuideImageSizeX = uiWallRidingGuideImage:GetSizeX()
  local uiWallRidingGuideImageSizeY = uiWallRidingGuideImage:GetSizeY()
  uiWallRidingGuideImage:SetPosX(posX - uiWallRidingGuideImageSizeX * 0.5)
  uiWallRidingGuideImage:SetPosY(posY - uiWallRidingGuideImageSizeY * 0.5)
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_1
  if self._isPhaseOpen == false then
    _PA_LOG("조재�\144", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    _PA_LOG("조재�\144", "튜토리얼 시작 �\128�\165 여부 �\128사중�\144 selfPlayer�\128 없습니다! _phaseNo : " .. tostring(self._phaseNo))
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
      _PA_LOG("곽민�\176", "튜토리얼�\180 �\128능한 �\128�\173(마법사의 제단)�\180 아니�\128�\156 튜토리얼�\132 실행하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    if questList_isClearQuest(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId) == true then
      _PA_LOG("조재�\144", "_questGroupNo" .. tostring(((self._questData)[1])._questGroupNo) .. "_questId" .. tostring(((self._questData)[1])._questId) .. "�\188 완료하여 튜토리얼�\132 진행하지 않습니다.")
      return false
    end
    return true
  end
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.checkSkippablePhase = function(self)
  -- function num : 0_2
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.startPhaseXXX = function(self, stepNo)
  -- function num : 0_4
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("조재�\144", "PaGlobal_TutorialPhase_WallRiding:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  FGlobal_Dialog_SetAllowTutorialPanelShow(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.endPhase = function(self)
  -- function num : 0_5
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.updatePerFrame = function(self, deltaTime)
  -- function num : 0_6
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.handleChangeStep = function(self, currentStep)
  -- function num : 0_7
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.toNextProgress = function(self)
  -- function num : 0_8
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.toNextStep = function(self)
  -- function num : 0_9
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.progressException = function(self, processNo)
  -- function num : 0_10
  self._currentProgress = processNo
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.changeStep1 = function(self)
  -- function num : 0_11 , upvalues : setQuestIconGuideImage, uiWallRidingGuideImage
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_71"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_72"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      setQuestIconGuideImage(getScreenSizeX() * 0.5, getScreenSizeY() * 0.5)
      uiWallRidingGuideImage:SetAlpha(0.5)
      uiWallRidingGuideImage:SetShow(true)
      ;
      (UIAni.AlphaAnimation)(1, uiWallRidingGuideImage, 0, 1.5)
      uiWallRidingGuideImage:SetIgnore(false)
      uiWallRidingGuideImage:addInputEvent("Mouse_LUp", "PaGlobal_TutorialPhase_WallRiding:handleMouseLUp_QuestIconGuideImage()")
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_73"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_74"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 320)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_75"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_76"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
      end
    end
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.eventCallStep1RegionChanged = function(self, regionInfo)
  -- function num : 0_12
  local currentRegionKey = regionInfo:getRegionKey()
  for index,value in pairs(self._regionKeyRawList) do
    if value ~= currentRegionKey then
      self:endPhase()
      return 
    end
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_13
  if self._currentProgress == 1 then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.eventCallStep1EventQuestUpdateNotify = function(self)
  -- function num : 0_14
  if PaGlobal_TutorialManager:isSatisfiedQuestCondition(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId) == true then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.handleMouseLUp_QuestIconGuideImage = function(self)
  -- function num : 0_15 , upvalues : uiWallRidingGuideImage
  uiWallRidingGuideImage:SetIgnore(true)
  local aniInfo = (UIAni.AlphaAnimation)(0, uiWallRidingGuideImage, 0, 0.25)
  aniInfo:SetHideAtEnd(true)
  self:toNextProgress()
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.handleRegionChanged = function(self, regionInfo)
  -- function num : 0_16
  self:eventCallStep1RegionChanged(regionInfo)
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.handleMouseLUpBubble = function(self)
  -- function num : 0_17
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_WallRiding.handleQuestWidgetUpdate = function(self)
  -- function num : 0_18
  self:eventCallStep1EventQuestUpdateNotify()
end


