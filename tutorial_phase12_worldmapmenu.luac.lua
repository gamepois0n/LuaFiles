-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase12_worldmapmenu.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_WorldmapMenu = {_phaseNo = 12, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 0, _updateTime = 0, _isPhaseOpen = true, _isSkippable = false, _tempTargetUi = nil, _eventTempControl = nil, _longWaitTime = 20, 
_cityWaypointKeyList = {1, 301, 601, 1101, 1301}
}
-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("곽민�\176", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true or PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true or PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return false
  end
  local foundCount = 0
  for key,value in pairs(self._cityWaypointKeyList) do
    if checkSelfplayerNode(value, false) == true then
      foundCount = foundCount + 1
    end
  end
  if foundCount == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_CANTSTART_NOTFOUNDCITY"))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_WorldmapMenu:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 1
  self._updateTime = 0
  self._longWaitTime = 20
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

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.endPhase = function(self)
  -- function num : 0_4
  if self._eventTempControl ~= nil then
    (self._eventTempControl):SetShow(false, false)
  end
  FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal)
  FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage)
  FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
  self:eraseAllEffectAllSearchResultUi()
  self:eraseAllEffectAllModeButton()
  self:eraseAllEffectAllCheckButton()
  PaGlobal_TutorialUiBlackSpirit:setIgnoreBubble(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    self:updateStep1(deltaTime)
  else
    if self._currentStep == 2 then
      self:updateStep2(deltaTime)
    end
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  else
    if self._currentStep == 2 then
      self:changeStep2()
    end
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.toStep = function(self, destStep, destProgress)
  -- function num : 0_9
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
  if self._currentStep == self._nextStep then
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.setEffectAllSearchResultUi = function(self, effectName, isLoop, offsetX, offsetY)
  -- function num : 0_10
  for index = 0, FGlobal_WorldmapMain_GetSearchingResultCount() - 1 do
    local resultUiByIndex = FGlobal_WorldmapMain_GetSearchResultUiPool(index)
    if resultUiByIndex ~= nil then
      resultUiByIndex:EraseAllEffect()
      resultUiByIndex:AddEffect(effectName, isLoop, offsetX, offsetY)
    end
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eraseAllEffectAllSearchResultUi = function(self)
  -- function num : 0_11
  for index = 0, FGlobal_WorldmapMain_GetSearchingResultCount() - 1 do
    local resultUiByIndex = FGlobal_WorldmapMain_GetSearchResultUiPool(index)
    if resultUiByIndex ~= nil then
      resultUiByIndex:EraseAllEffect()
    end
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.setEffectAllModeButton = function(self)
  -- function num : 0_12
  local worldmapModeButtonList = FGlobal_WorldmapMain_GetWorldmapModeButtonList()
  for key,value in pairs(worldmapModeButtonList) do
    value:EraseAllEffect()
    value:AddEffect("UI_ItemInstall", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eraseAllEffectAllModeButton = function(self)
  -- function num : 0_13
  local worldmapModeButtonList = FGlobal_WorldmapMain_GetWorldmapModeButtonList()
  for key,value in pairs(worldmapModeButtonList) do
    value:EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.setEffectAllCheckButton = function(self)
  -- function num : 0_14
  local worldmapFilterCheckButtonList = FGlobal_WorldmapMain_GetWorldmapCheckButtonList()
  for key,value in pairs(worldmapFilterCheckButtonList) do
    value:EraseAllEffect()
    value:AddEffect("UI_ItemInstall_Gold", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eraseAllEffectAllCheckButton = function(self)
  -- function num : 0_15
  local worldmapFilterCheckButtonList = FGlobal_WorldmapMain_GetWorldmapCheckButtonList()
  for key,value in pairs(worldmapFilterCheckButtonList) do
    value:EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.changeStep1 = function(self)
  -- function num : 0_16
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_63"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_64"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_65"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
      self._tempTargetUi = (UI.getChildControl)(Panel_WorldMap_Main, "MainMenu_Bg")
      self._eventTempControl = FGlobal_WorldmapMain_GetOrCreateEventTempControl("Mouse_On", self._tempTargetUi, Panel_WorldMap_Main)
      if self._eventTempControl ~= nil then
        (self._eventTempControl):SetShow(true, true)
      end
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_66"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_67"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
        if self._eventTempControl ~= nil then
          (self._eventTempControl):SetShow(false, false)
        end
        FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal)
        FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal, "UI_WorldMap_Ping01", true, 0, 0)
        FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal, "UI_ItemJewel02", true, 0, 0)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_68"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_69"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
          FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage)
          FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage, "UI_WorldMap_Ping01", true, 0, 0)
          FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage, "UI_ItemJewel02", true, 0, 0)
        else
          if self._currentProgress == 5 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_70"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_71"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
            FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
            FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city, "UI_WorldMap_Ping01", true, 0, 0)
            FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city, "UI_ItemJewel02", true, 0, 0)
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_72"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_73"), false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.2, true)
  end
)
              self:setEffectAllSearchResultUi("UI_ButtonLineRight_Blue", true, -10, 0)
              FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
              FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city, "UI_WorldMap_Ping02", true, 0, 0)
              FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city, "UI_ItemJewel02", true, 0, 0)
            else
              if self._currentProgress == 7 then
                self._updateTime = 0
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_74"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
              else
                if self._currentProgress == -1 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_75"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_76"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
                else
                  if self._currentProgress == -2 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_8
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_77"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_78"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
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
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.updateStep1 = function(self, deltaTime)
  -- function num : 0_17
  if self._currentProgress == 2 then
    FGlobal_WorldmapMain_PerFrameAlphaAnimationEventTempControl(0.4, 0.9, deltaTime * 7.5)
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_18
  if self._currentProgress == -1 then
    self._currentProgress = self._prevProgress
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_19
  if self._currentProgress >= 1 and self._currentProgress <= 7 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == -2 then
      self._currentProgress = -1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep1NodeLClick = function(self, uiNodeButton)
  -- function num : 0_20
  if self._currentProgress >= 1 and self._currentProgress <= 7 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -2
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_21
  if self._currentProgress == -2 then
    self._currentProgress = self._prevProgress
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep1WorldmapMainEventTempControl = function(self)
  -- function num : 0_22
  if self._currentProgress == 2 then
    if self._eventTempControl ~= nil then
      (self._eventTempControl):SetShow(false, false)
    end
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep1ClickedGrandWorldMapSearchNodeType = function(self, typeIndex)
  -- function num : 0_23
  -- DECOMPILER ERROR at PC12: Unhandled construct in 'MakeBoolean' P1

  if self._currentProgress == 3 and (FGlobal_WorldmapMain_GetWorldmapNodeType()).normal == typeIndex then
    FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal)
    self:toNextProgress()
  end
  -- DECOMPILER ERROR at PC28: Unhandled construct in 'MakeBoolean' P1

  if self._currentProgress == 4 and (FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage == typeIndex then
    FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage)
    self:toNextProgress()
  end
  if self._currentProgress == 5 and (FGlobal_WorldmapMain_GetWorldmapNodeType()).city == typeIndex then
    FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep1ClickedGrandWorldmapGotoNodeFocus = function(self, resultIndex)
  -- function num : 0_24
  if self._currentProgress == 6 then
    FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
    self:eraseAllEffectAllSearchResultUi()
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_25
  if self._currentProgress == 7 then
    self:toNextStep()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.changeStep2 = function(self)
  -- function num : 0_26
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_26_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_79"), "", false, getScreenSizeX() * 0.6, getScreenSizeY() * 0.2, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_26_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_80"), "", false, getScreenSizeX() * 0.6, getScreenSizeY() * 0.2, false)
  end
)
      self:eraseAllEffectAllModeButton()
      self:setEffectAllModeButton()
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_26_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_81"), "", false, getScreenSizeX() * 0.6, getScreenSizeY() * 0.2, false)
  end
)
        self:eraseAllEffectAllModeButton()
        self:eraseAllEffectAllCheckButton()
        self:setEffectAllCheckButton()
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_26_3 , upvalues : self
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_82") .. (string.format)("%.2f\n\n", self._longWaitTime - self._updateTime) .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_83"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_84"), false, getScreenSizeX() * 0.6, getScreenSizeY() * 0.2, true)
  end
)
        else
          if self._currentProgress == 5 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_26_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_85"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
            self:eraseAllEffectAllModeButton()
            self:eraseAllEffectAllCheckButton()
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_26_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_86"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
            else
              if self._currentProgress == -1 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_26_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_87"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_88"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
              else
                if self._currentProgress == -2 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_26_7
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

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.updateStep2 = function(self, deltaTime)
  -- function num : 0_27
  if self._currentProgress == 4 then
    if self._longWaitTime * timeRatio < self._updateTime then
      self._updateTime = 0
      self._longWaitTime = 20
      self:toNextProgress()
    end
    self:handleChangeStep(self._currentProgress)
    self._updateTime = self._updateTime + deltaTime
  end
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep2WorldMapOpenComplete = function(self)
  -- function num : 0_28
  if self._currentProgress == -1 then
    self._currentProgress = self._prevProgress
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep2WorldMapImmediatelyClose = function(self)
  -- function num : 0_29
  if self._currentProgress >= 1 and self._currentProgress <= 4 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == -2 then
      self._currentProgress = -1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep2NodeLClick = function(self, uiNodeButton)
  -- function num : 0_30
  if self._currentProgress >= 1 and self._currentProgress <= 4 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -2
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep2ResetTownMode = function(self)
  -- function num : 0_31
  if self._currentProgress == -2 then
    self._currentProgress = self._prevProgress
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.eventCallStep2MouseLUpBubble = function(self)
  -- function num : 0_32
  if self._currentProgress == 6 then
    self:endPhase()
  else
    if self._currentProgress == 3 then
      self:eraseAllEffectAllModeButton()
      self:eraseAllEffectAllCheckButton()
      self:setEffectAllModeButton()
      self:setEffectAllCheckButton()
    end
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC122: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleWorldMapOpenComplete = function(self)
  -- function num : 0_33
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  else
    if self._currentStep == 2 then
      self:eventCallStep2WorldMapOpenComplete()
    end
  end
end

-- DECOMPILER ERROR at PC125: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_34
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  else
    if self._currentStep == 2 then
      self:eventCallStep2WorldMapImmediatelyClose()
    end
  end
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleWorldmapMainEventTempControl = function(self)
  -- function num : 0_35
  if self._currentStep == 1 then
    self:eventCallStep1WorldmapMainEventTempControl()
  end
end

-- DECOMPILER ERROR at PC131: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleClickedGrandWorldMapSearchNodeType = function(self, typeIndex)
  -- function num : 0_36
  if self._currentStep == 1 then
    self:eventCallStep1ClickedGrandWorldMapSearchNodeType(typeIndex)
  end
end

-- DECOMPILER ERROR at PC134: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleClickedGrandWorldmapGotoNodeFocus = function(self, resultIndex)
  -- function num : 0_37
  if self._currentStep == 1 then
    self:eventCallStep1ClickedGrandWorldmapGotoNodeFocus(resultIndex)
  end
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_38
  if self._currentStep == 1 then
    self:eventCallStep1NodeLClick(uiNodeButton)
  else
    if self._currentStep == 2 then
      self:eventCallStep2NodeLClick(uiNodeButton)
    end
  end
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleResetTownMode = function(self)
  -- function num : 0_39
  if self._currentStep == 1 then
    self:eventCallStep1ResetTownMode()
  else
    if self._currentStep == 2 then
      self:eventCallStep2ResetTownMode()
    end
  end
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapMenu.handleMouseLUpBubble = function(self)
  -- function num : 0_40
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  else
    if self._currentStep == 2 then
      self:eventCallStep2MouseLUpBubble()
    end
  end
end


