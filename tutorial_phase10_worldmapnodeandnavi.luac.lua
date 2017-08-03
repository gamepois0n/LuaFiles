-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase10_worldmapnodeandnavi.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_WorldmapNodeAndNavi = {_phaseNo = 10, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 0, _updateTime = 0, _isPhaseOpen = true, _isSkippable = false, 
_nodeWaypointKeyList = {1, 301, 601, 1101, 1301, 61, 604, 608, 602, 302, 1141, 1319, 1314, 1343, 1380, 1002}
}
-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("곽민�\176", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true or PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true or PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.startPhase = function(self, stepNo)
  -- function num : 0_2
  if self:checkPossibleForPhaseStart(stepNo) == false then
    return 
  end
  local isSkippable = self:checkSkippablePhase()
  if isSkippable == true and PaGlobal_TutorialManager:isDoingTutorial() == false then
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo)
  else
    self:startPhaseXXX(stepNo)
  end
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_WorldmapNodeAndNavi:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.endPhase = function(self)
  -- function num : 0_4
  PaGlobal_TutorialUiBlackSpirit:setIgnoreBubble(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStepSuggestOpenWorldmap()
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.toStep = function(self, destStep, destProgress)
  -- function num : 0_9
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.setEffectNodeWaypointKeyList = function(self)
  -- function num : 0_10
  for index,value in ipairs(self._nodeWaypointKeyList) do
    FGlobal_WorldmapMain_EraseAllEffectUiNodeButtonByWaypointKey(value)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_ArrowMark02", true, 0, -50)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.eraseAllEffectNodeWaypointKeyList = function(self)
  -- function num : 0_11
  for index,value in ipairs(self._nodeWaypointKeyList) do
    FGlobal_WorldmapMain_EraseAllEffectUiNodeButtonByWaypointKey(value)
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.changeStepSuggestOpenWorldmap = function(self)
  -- function num : 0_12
  if self._currentProgress == 1 then
    toClient_FadeIn(0.75)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_31"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_32"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_33"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_34"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
        self:setEffectNodeWaypointKeyList()
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_35"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_36"), false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.6, true)
  end
)
          self:eraseAllEffectNodeWaypointKeyList()
        else
          if self._currentProgress == 5 then
            ToClient_DeleteNaviGuideByGroup()
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_37"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_38"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_39"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_40"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
            else
              if self._currentProgress == -1 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_41"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_42"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
              else
                if self._currentProgress == -2 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_43"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_44"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
                end
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_13
  if self._currentProgress == 4 then
    self:setEffectNodeWaypointKeyList()
  else
    if self._currentProgress == -1 then
      if self._prevProgress >= 5 then
        self._currentProgress = 5
      else
        self._currentProgress = 1
      end
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.eventCallStep1NodeLClick = function(self, uiNodeButton)
  -- function num : 0_14
  if self._currentProgress ~= 3 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -2
  else
    if self._currentProgress == 3 then
      local isMatchWaypointKey = false
      for index,value in ipairs(self._nodeWaypointKeyList) do
        if value == uiNodeButton:getWaypointKey() then
          isMatchWaypointKey = true
          break
        end
      end
      do
        do
          if isMatchWaypointKey == true then
            self._currentProgress = self._currentProgress + 1
          else
            self._prevProgress = self._currentProgress
            self._currentProgress = -2
          end
          self:handleChangeStep(self._currentStep)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_15
  if self._currentProgress >= 3 and self._currentProgress < 4 then
    self:setEffectNodeWaypointKeyList()
  else
    if self._currentProgress == 4 then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    else
      if self._currentProgress == -2 then
        if self._prevProgress < 3 then
          self._currentProgress = 1
        else
          if self._prevProgress == 4 then
            self._currentProgress = 3
          else
            self._currentProgress = self._prevProgress
          end
        end
        self:handleChangeStep(self._currentStep)
      end
    end
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.eventCallStep1RClickWorldmapPanel = function(self)
  -- function num : 0_16
  if self._currentProgress == 5 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_17
  if self._currentProgress >= 1 and self._currentProgress < 6 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == 6 then
      self:endPhase()
    end
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_18
  if self._currentProgress == 6 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.handleWorldMapOpenComplete = function(self)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_20
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  end
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1NodeLClick(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.handleRClickWorldmapPanel = function(self, pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  -- function num : 0_22
  if self._currentStep == 1 then
    self:eventCallStep1RClickWorldmapPanel()
  end
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.handleRClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_23
  if self._currentStep == 1 then
    self:eventCallStep1RClickWorldmapPanel()
  end
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.handleResetTownMode = function(self)
  -- function num : 0_24
  self:eventCallStep1ResetTownMode()
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapNodeAndNavi.handleMouseLUpBubble = function(self)
  -- function num : 0_25
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


