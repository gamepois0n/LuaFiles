-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase10_veliaworldmap.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_VeliaWorldmap = {_currentStep = 0, _nextStep = 0, _currentProgress = 1, _prevProgress = 1, _lastProgress = 6, _updateTime = 0, _isSkippable = true, 
_talkerCharacterKeyData = {[1] = 40044, [2] = 40012}
, 
_nodeWaypointKeyList = {1, 301, 601, 1101, 1301, 61, 604, 608, 602, 302, 1141, 1319, 1314, 1343, 1380, 1002}
}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.startPhase = function(self, stepNo)
  -- function num : 0_0
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_VeliaWorldmap:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
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

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.endPhase = function(self)
  -- function num : 0_1
  self._currentProgress = 1
  self._currentStep = 0
  self._nextStep = 1
  self._prevProgress = 1
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialUiBlackSpirit:setShowAll(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.updatePerFrame = function(self, deltaTime)
  -- function num : 0_2
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleChangeStep = function(self, currentStep)
  -- function num : 0_3
  if self._currentStep == 1 then
    self:changeStepSuggestOpenWorldmap()
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.toNextProgress = function(self)
  -- function num : 0_4
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.toNextStep = function(self)
  -- function num : 0_5
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.toStep = function(self, destStep, destProgress)
  -- function num : 0_6
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.setEffectNodeWaypointKeyList = function(self)
  -- function num : 0_7
  for index,value in ipairs(self._nodeWaypointKeyList) do
    FGlobal_WorldmapMain_EraseAllEffectUiNodeButtonByWaypointKey(value)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_ArrowMark02", true, 0, -50)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eraseAllEffectNodeWaypointKeyList = function(self)
  -- function num : 0_8
  for index,value in ipairs(self._nodeWaypointKeyList) do
    FGlobal_WorldmapMain_EraseAllEffectUiNodeButtonByWaypointKey(value)
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.changeStepSuggestOpenWorldmap = function(self)
  -- function num : 0_9
  if self._currentProgress == 1 then
    toClient_FadeIn(0.75)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\140 �\180 �\140 까지 눈에 보이�\148 길만 달려왔지? 이것�\128 �\180 세상�\152 �\128도야.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("단순�\136 위치�\140 보여주는 것이 아니�\188\n아주 유용�\156 기능들이 많아.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이제�\128�\176 사용법을 익혀보자.\n거점중에 몇군데를 눈에 띄게 표시해봤�\180.", "화살표가 표시�\156 거점�\132 왼클�\173 해봐.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
        self:setEffectNodeWaypointKeyList()
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("잘했�\180. 거점�\132 �\128 �\148 자세�\136 �\188 �\152 있고,\n창고�\128 있다�\180 소지금도 �\188 �\152 있지.", "�\164 살펴봤으�\180 <ESC>버튼�\132 눌러 월드�\156 빠져나가�\144.", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.6, true)
  end
)
          self:eraseAllEffectNodeWaypointKeyList()
        else
          if self._currentProgress == 5 then
            ToClient_DeleteNaviGuideByGroup()
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이제�\148 목적�\128�\188 �\128정하는법�\132 알려주지.", "월드�\181 거점이나 바닥 아무곳이�\152 마우�\164 우클릭을 �\180 �\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("잘했�\180. 그렇�\140 안내�\156 길찾기를 보고\n목적�\128까지 쉽게 찾아�\136 �\152 있으�\136 �\152 활용하라�\160.", "이제 <ESC>키나 <M>키로 월드맵을 닫고 하던 �\188 �\144.\n[튜토리얼 종료]", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
              self._lastProgress = self._currentProgress
            else
              if self._currentProgress == -1 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\156 벌써 월드맵을 닫는거지?", "어서 <M>키로 월드맵을 열어!", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
              else
                if self._currentProgress == -2 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("내가 말한곳은 �\180 이곳�\180 아니�\188.", "<ESC>키로 다시 월드�\156 돌아�\128.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
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

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_10
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

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1NodeLClick = function(self, uiNodeButton)
  -- function num : 0_11
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

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_12
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

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1RClickWorldmapPanel = function(self)
  -- function num : 0_13
  if self._currentProgress == 5 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_14
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

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_15
  if self._lastProgress == self._currentProgress then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleWorldMapOpenComplete = function(self)
  -- function num : 0_16
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_17
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_18
  if self._currentStep == 1 then
    self:eventCallStep1NodeLClick(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleRClickWorldmapPanel = function(self, pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1RClickWorldmapPanel()
  end
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleResetTownMode = function(self)
  -- function num : 0_20
  self:eventCallStep1ResetTownMode()
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleMouseLUpBubble = function(self)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


