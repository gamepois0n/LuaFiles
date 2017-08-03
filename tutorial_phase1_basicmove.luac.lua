-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase1_basicmove.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_BasicMove = {_phaseNo = 1, _currentStep = 0, _nextStep = 1, _currentProgress = 1, _updateTime = 0, 
_classStringData = {}
, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {88, 349}
, _startLimitLevel = 15}
local classType = 0
-- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.checkPossibleForPhaseStart = function(self, stepNo)
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

-- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3 , upvalues : classType
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_BasicMove:startPhase() stepNo : " .. tostring(stepNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  classType = (getSelfPlayer()):getClassType()
  Panel_Tutorial:SetShow(true, true)
  FGlobal_NewQuickSlot_Update()
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
  PaGlobal_TutorialUiManager:repositionScreen()
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.endPhase = function(self)
  -- function num : 0_4
  self._currentStep = 0
  self._nextStep = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:startNextPhase()
end

local result = nil
-- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5 , upvalues : result
  if self._nextStep ~= self._currentStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    result = self:updateBlackSpiritTalk(deltaTime)
  else
    if self._currentStep == 2 then
      result = self:updateBasicMove(deltaTime)
    end
  end
  if result == true then
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if currentStep == 1 then
    self:changeStepBlackSpiritTalk()
  else
    if currentStep == 2 then
      self:changeStepBasicMove()
    else
      if currentStep == 3 then
        self:endPhase()
      end
    end
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.changeStepBlackSpiritTalk = function(self)
  -- function num : 0_7
  (getSelfPlayer()):setActionChart("TUTORIAL_WAIT_STEP1")
  Panel_QuickSlot:SetShow(false, false)
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.updateBlackSpiritTalk = function(self, deltaTime)
  -- function num : 0_8 , upvalues : classType
  self._updateTime = self._updateTime + deltaTime
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_0 , upvalues : self, classType
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, ((self._classStringData)[classType])[1]), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    self._updateTime = 0
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == 2 and 4 * timeRatio < self._updateTime then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_1 , upvalues : self, classType
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, ((self._classStringData)[classType])[2]), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
      self._updateTime = 0
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    else
      if self._currentProgress == 3 and 4 * timeRatio < self._updateTime then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_2 , upvalues : self, classType
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, ((self._classStringData)[classType])[3]), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
        self._updateTime = 0
        self._currentProgress = self._currentProgress + 1
        self:handleChangeStep(self._currentStep)
      else
        if self._currentProgress == 4 and 4 * timeRatio < self._updateTime then
          self._updateTime = 0
          self._currentProgress = 1
          return true
        end
      end
    end
  end
  return false
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.changeStepBasicMove = function(self)
  -- function num : 0_9
  if getSelfPlayer() ~= nil then
    (getSelfPlayer()):setActionChart("TUTORIAL_WAIT_STEP2")
  end
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(false)
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_2"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_W")
  end
)
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove.updateBasicMove = function(self, deltaTime)
  -- function num : 0_10
  if self._currentProgress == 1 then
    if self._updateTime < 1.5 * timeRatio then
      local isPress = keyCustom_IsPressed_Action((CppEnums.ActionInputType).ActionInputType_MoveFront)
      if isPress then
        self._updateTime = self._updateTime + deltaTime
      end
      ;
      (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_W", true)
    else
      do
        audioPostEvent_SystemUi(4, 12)
        ;
        (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(true)
        ;
        (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(false)
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_3"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_4"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_A", "_bubbleKey_S", "_bubbleKey_D")
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addOverBubbleKey("_bubbleKey_W", "_bubbleKey_S")
  end
)
        self._updateTime = 0
        self._currentProgress = self._currentProgress + 1
        if self._currentProgress == 2 then
          if self._updateTime < 2 * timeRatio then
            (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_W", true)
            ;
            (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_A", true)
            ;
            (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_S", true)
            ;
            (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_D", true)
            if not keyCustom_IsPressed_Action((CppEnums.ActionInputType).ActionInputType_MoveFront) and not keyCustom_IsPressed_Action((CppEnums.ActionInputType).ActionInputType_MoveBack) and not keyCustom_IsPressed_Action((CppEnums.ActionInputType).ActionInputType_MoveLeft) then
              local isPress = keyCustom_IsPressed_Action((CppEnums.ActionInputType).ActionInputType_MoveRight)
            end
            if isPress then
              self._updateTime = self._updateTime + deltaTime
            end
          else
            do
              if getSelfPlayer() ~= nil then
                (getSelfPlayer()):setActionChart("TUTORIAL_WAIT_STEP3")
              end
              audioPostEvent_SystemUi(4, 12)
              ;
              (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(true)
              ;
              (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(false)
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MOVE_STEP2_DARKSPIRIT"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_5"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_Shift", "_bubbleKey_W")
  end
)
              self._updateTime = 0
              self._currentProgress = self._currentProgress + 1
              if self._currentProgress == 3 then
                if self._updateTime < 2 * timeRatio then
                  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_W", true)
                  ;
                  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggle("_button_Shift", true)
                  if keyCustom_IsPressed_Action(0) then
                    local isPress = keyCustom_IsPressed_Action(6)
                  end
                  if isPress then
                    self._updateTime = self._updateTime + deltaTime
                  end
                else
                  do
                    audioPostEvent_SystemUi(4, 12)
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MOVE_STEP3_DARKSPIRIT"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
    ;
    (PaGlobal_TutorialUiManager:getUiKeyButton()):disappearAll()
  end
)
                    if getSelfPlayer() ~= nil then
                      (getSelfPlayer()):setActionChart("TUTORIAL_END")
                    end
                    self._updateTime = 0
                    self._currentProgress = self._currentProgress + 1
                    if self._currentProgress == 4 then
                      if 2 * timeRatio < self._updateTime then
                        return true
                      end
                      self._updateTime = self._updateTime + deltaTime
                    end
                    return false
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

-- DECOMPILER ERROR at PC192: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicMove._classStringData = {
[(CppEnums.ClassType).ClassType_Warrior] = {"TUTORIAL_MOVE_WARRIOR_TALK1", "TUTORIAL_MOVE_WARRIOR_TALK2", "TUTORIAL_MOVE_WARRIOR_TALK3"}
, 
[(CppEnums.ClassType).ClassType_Ranger] = {"TUTORIAL_MOVE_RANGER_TALK1", "TUTORIAL_MOVE_RANGER_TALK2", "TUTORIAL_MOVE_RANGER_TALK3"}
, 
[(CppEnums.ClassType).ClassType_Sorcerer] = {"TUTORIAL_MOVE_SORCERER_TALK1", "TUTORIAL_MOVE_SORCERER_TALK2", "TUTORIAL_MOVE_SORCERER_TALK3"}
, 
[(CppEnums.ClassType).ClassType_Giant] = {"TUTORIAL_MOVE_GIANT_TALK1", "TUTORIAL_MOVE_GIANT_TALK2", "TUTORIAL_MOVE_GIANT_TALK3"}
, 
[(CppEnums.ClassType).ClassType_Tamer] = {"LUA_TUTORIAL_MOVE_TAMER_TALK1", "LUA_TUTORIAL_MOVE_TAMER_TALK2", "LUA_TUTORIAL_MOVE_TAMER_TALK3"}
, 
[(CppEnums.ClassType).ClassType_BladeMaster] = {"LUA_TUTORIAL_MOVE_BLADEMASTER_TALK1", "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK2", "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK3"}
, 
[(CppEnums.ClassType).ClassType_BladeMasterWomen] = {"LUA_TUTORIAL_MOVE_BLADEMASTER_TALK1", "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK2", "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK3"}
, 
[(CppEnums.ClassType).ClassType_Valkyrie] = {"LUA_TUTORIAL_MOVE_VALKYRIE_TALK1", "LUA_TUTORIAL_MOVE_VALKYRIE_TALK2", "LUA_TUTORIAL_MOVE_VALKYRIE_TALK3"}
, 
[(CppEnums.ClassType).ClassType_Wizard] = {"TUTORIAL_MOVE_WIZRAD_TALK1", "TUTORIAL_MOVE_WIZRAD_TALK2", "TUTORIAL_MOVE_WIZRAD_TALK3"}
, 
[(CppEnums.ClassType).ClassType_WizardWomen] = {"TUTORIAL_MOVE_WIZRAD_TALK1", "TUTORIAL_MOVE_WIZRAD_TALK2", "TUTORIAL_MOVE_WIZRAD_TALK3"}
, 
[(CppEnums.ClassType).ClassType_NinjaWomen] = {"TUTORIAL_MOVE_NINJA_TALK1", "TUTORIAL_MOVE_NINJA_TALK2", "TUTORIAL_MOVE_NINJA_TALK3"}
, 
[(CppEnums.ClassType).ClassType_NinjaMan] = {"TUTORIAL_MOVE_NINJA_TALK1", "TUTORIAL_MOVE_NINJA_TALK2", "TUTORIAL_MOVE_NINJA_TALK3"}
, 
[(CppEnums.ClassType).ClassType_DarkElf] = {"TUTORIAL_MOVE_DARKELF_TALK1", "TUTORIAL_MOVE_DARKELF_TALK2", "TUTORIAL_MOVE_DARKELF_TALK3"}
, 
[(CppEnums.ClassType).ClassType_Combattant] = {"TUTORIAL_MOVE_DARKELF_TALK1", "TUTORIAL_MOVE_DARKELF_TALK2", "TUTORIAL_MOVE_DARKELF_TALK3"}
, 
[(CppEnums.ClassType).ClassType_CombattantWomen] = {"TUTORIAL_MOVE_DARKELF_TALK1", "TUTORIAL_MOVE_DARKELF_TALK2", "TUTORIAL_MOVE_DARKELF_TALK3"}
}

