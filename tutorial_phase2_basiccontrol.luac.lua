-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase2_basiccontrol.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_BasicControl = {_phaseNo = 2, _currentStep = 0, _nextStep = 0, _currentProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {88, 349}
, _startLimitLevel = 15}
local uiRotateArrow = (UI.getChildControl)(Panel_Tutorial, "Static_RotateArrow")
local uiCtrlGuide = (UI.getChildControl)(Panel_Tutorial, "Static_CtrlGuide")
local uiClickButton = (UI.getChildControl)(Panel_Tutorial, "StaticText_ClickButton")
local setPosClickButton = function(posX, posY)
  -- function num : 0_0 , upvalues : uiClickButton
  local uiClickButtonSizeX = uiClickButton:GetSizeX()
  local uiClickButtonSizeY = uiClickButton:GetSizeY()
  uiClickButton:SetPosX(posX - uiClickButtonSizeX * 0.5)
  uiClickButton:SetPosY(posY - uiClickButtonSizeY * 0.5)
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.checkPossibleForPhaseStart = function(self, stepNo)
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

-- DECOMPILER ERROR at PC37: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.checkSkippablePhase = function(self)
  -- function num : 0_2
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC43: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.startPhaseXXX = function(self, stepNo)
  -- function num : 0_4
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_BasicControl:startPhase()")
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
  FGlobal_NewQuickSlot_Update()
  ToClient_DeleteNaviGuideByGroup()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(false)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(false)
  PaGlobal_TutorialManager:setAllowMainQuestWidget(false)
  PaGlobal_TutorialUiManager:setShowAllDefaultUi(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.endPhase = function(self)
  -- function num : 0_5 , upvalues : uiRotateArrow, uiCtrlGuide, uiClickButton
  self._currentStep = 0
  self._nextStep = 1
  uiRotateArrow:SetShow(false)
  uiCtrlGuide:SetShow(false)
  uiClickButton:SetShow(false)
  PaGlobal_TutorialManager:startNextPhase()
end

local result, currentInputMode = nil, nil
-- DECOMPILER ERROR at PC54: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.updatePerFrame = function(self, deltaTime)
  -- function num : 0_6 , upvalues : result
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    result = self:updateLookAround(deltaTime)
  else
    if self._currentStep == 2 then
      result = self:updateClickButton(deltaTime)
    else
      if self._currentStep == 3 then
        result = self:updateWaitMinimapComment(deltaTime)
      end
    end
  end
  if result == true then
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.handleChangeStep = function(self, currentStep)
  -- function num : 0_7
  if currentStep == 1 then
    self:changeStepLookAround()
  else
    if currentStep == 2 then
      self:changeStepClickButton()
    else
      if currentStep == 3 then
        self:changeStepWaitMinimapComment()
      else
        if currentStep == 4 then
          self:endPhase()
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.changeStepLookAround = function(self)
  -- function num : 0_8 , upvalues : uiRotateArrow
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_60"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_61"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  uiRotateArrow:SetAlpha(0)
  uiRotateArrow:SetShow(true)
  uiRotateArrow:SetPosX(getScreenSizeX() * 0.5 - uiRotateArrow:GetSizeX() * 0.5)
  uiRotateArrow:SetPosY(getScreenSizeY() * 0.475 - uiRotateArrow:GetSizeX() * 0.5)
  ;
  (UIAni.AlphaAnimation)(1, uiRotateArrow, 0, 0.75)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.updateLookAround = function(self, deltaTime)
  -- function num : 0_9
  if 8 * timeRatio < self._updateTime then
    audioPostEvent_SystemUi(4, 12)
    self._updateTime = 0
    return true
  end
  self._updateTime = self._updateTime + deltaTime
  return false
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.changeStepClickButton = function(self)
  -- function num : 0_10 , upvalues : uiRotateArrow, uiCtrlGuide, uiClickButton, setPosClickButton
  if self._currentProgress == 1 then
    uiRotateArrow:SetShow(false)
    ;
    (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_62"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_63"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    uiCtrlGuide:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, uiCtrlGuide, 0, 0.75)
    uiCtrlGuide:SetShow(true)
    uiCtrlGuide:SetPosX(getScreenSizeX() * 0.85 - uiCtrlGuide:GetSizeX() * 0.5)
    uiCtrlGuide:SetPosY(getScreenSizeY() * 0.8 - uiCtrlGuide:GetSizeY() * 0.5)
    uiClickButton:SetAlpha(0)
    uiClickButton:SetShow(true)
    ;
    (UIAni.AlphaAnimation)(1, uiClickButton, 0, 1.5)
    setPosClickButton(getScreenSizeX() * 0.5, getScreenSizeY() * 0.5)
    uiClickButton:SetText("1 / 3")
    uiClickButton:addInputEvent("Mouse_LUp", "PaGlobal_TutorialPhase_BasicControl:handleMouseLUp_PracticeButton()")
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_64"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_65"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
      setPosClickButton(getScreenSizeX() * 0.5 - 150, getScreenSizeY() * 0.5 - 150)
      uiClickButton:SetAlpha(0)
      ;
      (UIAni.AlphaAnimation)(1, uiClickButton, 0, 0.5)
      uiClickButton:SetText("2 / 3")
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_66"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_67"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
        setPosClickButton(FGlobal_Panel_Radar_GetPosX() + FGlobal_Panel_Radar_GetSizeX() * 0.5, FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() * 0.5)
        uiClickButton:SetAlpha(0)
        ;
        (UIAni.AlphaAnimation)(1, uiClickButton, 0, 0.5)
        uiClickButton:SetText("3 / 3")
      end
    end
  end
end

local isUiMode = nil
-- DECOMPILER ERROR at PC77: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.updateClickButton = function(self, deltaTime)
  -- function num : 0_11 , upvalues : currentInputMode, isUiMode
  currentInputMode = (UI.Get_ProcessorInputMode)()
  isUiMode = (CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode == currentInputMode
  if isUiMode == true then
    (PaGlobal_TutorialUiManager:getUiMasking()):showSpiritMasking()
  elseif isUiMode == false then
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
  end
  do return false end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.changeStepWaitMinimapComment = function(self)
  -- function num : 0_12 , upvalues : uiClickButton
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_86"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_87"), false, FGlobal_Panel_Radar_GetPosX(), FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY())
  end
)
  ;
  (UIAni.AlphaAnimation)(0, uiClickButton, 0, 0.25)
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
  FGlobal_Panel_Radar_Show_AddEffect()
  Panel_TimeBar:SetShow(true, true)
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.updateWaitMinimapComment = function(self, deltaTime)
  -- function num : 0_13
  if 6 * timeRatio < self._updateTime + deltaTime then
    self._updateTime = 0
    return true
  end
  self._updateTime = self._updateTime + deltaTime
  return false
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicControl.handleMouseLUp_PracticeButton = function(self)
  -- function num : 0_14 , upvalues : uiCtrlGuide
  audioPostEvent_SystemUi(4, 12)
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
  if self._currentProgress > 3 then
    (UIAni.AlphaAnimation)(0, uiCtrlGuide, 0, 0.75)
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
  end
end


