-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase13_hidel_findnearnpc.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_Hidel_FindNearNpc = {_phaseNo = 13, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 0, _updateTime = 0, _isPhaseOpen = true, _isSkippable = false, 
_talkerCharacterKeyData = {[1] = 41051, [2] = 41056}
}
-- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("곽민�\176", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_Hidel_FindNearNpc:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.endPhase = function(self)
  -- function num : 0_4
  FGlobal_TownNpcNavi_EraseAllEffect()
  ;
  (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(7)):EraseAllEffect()
  ;
  (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16)):EraseAllEffect()
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  else
    if self._currentStep == 2 then
      self:changeStep2()
    else
      if self._currentStep == 3 then
        self:changeStep3()
      else
        if self._currentStep == 4 then
          self:changeStep4()
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
  self:updatePerFrame(0)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.toStep = function(self, destStep, destProgress)
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

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.changeStep1 = function(self)
  -- function num : 0_10
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_89"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_90"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_91"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
      end
    end
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_11
  if self._currentProgress == 3 then
    self:toNextStep()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.changeStep2 = function(self)
  -- function num : 0_12
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_92"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_93"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
    FGlobal_TownNpcNavi_AddEffect("UI_Tutorial_MouseMove", true, 0, 0)
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):showChildControlMasking(Panel_Widget_TownNpcNavi, FGlobal_TownNpcNavi_GetFindNaviButton())
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_94"), "", true, Panel_NpcNavi:GetPosX() - Panel_NpcNavi:GetSizeX() / 3, Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY() / 3, false)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_95"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_96"), true, Panel_NpcNavi:GetPosX() - Panel_NpcNavi:GetSizeX() / 3, Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY() / 3, true)
  end
)
        ToClient_DeleteNaviGuideByGroup(0)
        if Panel_NpcNavi:GetShow() == false then
          Panel_NpcNavi:SetShow(true, true)
        end
        FGlobal_TownNpcNavi_EraseAllEffect()
        FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
        ;
        (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(7)):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
        ;
        (PaGlobal_TutorialUiManager:getUiMasking()):showChildControlMasking(Panel_NpcNavi, FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(7))
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_97"), "", true, Panel_NpcNavi:GetPosX() - Panel_NpcNavi:GetSizeX() / 3, Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY() / 3, false)
  end
)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep2NpcNavi_ShowToggle = function(self, isShow)
  -- function num : 0_13
  if self._currentProgress == 1 and isShow == true then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep2ClickedTownNpcIconNaviStart = function(self, spawnType, isAuto)
  -- function num : 0_14
  if self._currentProgress == 3 and (CppEnums.SpawnType).eSpawnType_TradeMerchant == spawnType then
    FGlobal_TownNpcNavi_EraseAllEffect()
    ;
    (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(7)):EraseAllEffect()
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
    FGlobal_NpcNavi_HideAni()
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep2MouseLUpBubble = function(self)
  -- function num : 0_15
  if self._currentProgress == 4 then
    self:toNextStep()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.changeStep3 = function(self)
  -- function num : 0_16
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_16_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_98"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_99"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    ToClient_DeleteNaviGuideByGroup(0)
    worldmapNavigatorStart(float3(38530.9, -995.69, -29238.2), NavigationGuideParam(), false, false, true)
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep3ShowDialog = function(self, dialogData)
  -- function num : 0_17
  if self._currentProgress == 1 then
    if dialog_getTalkNpcKey() == 0 then
      _PA_LOG("곽민�\176", "�\128화중�\184 NPC�\164 값이 0�\180 나왔�\164! NPC정보�\128 없거�\152 정상적으�\156 정보�\188 받지 못했�\140!")
      return 
    end
    if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      self:toNextStep()
    end
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.changeStep4 = function(self)
  -- function num : 0_18
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_100"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_101"), true, Panel_NpcNavi:GetPosX() - Panel_NpcNavi:GetSizeX() / 3, Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY() / 3, true)
  end
)
    ToClient_DeleteNaviGuideByGroup(0)
    if Panel_NpcNavi:GetShow() == false then
      Panel_NpcNavi:SetShow(true, true)
    end
    FGlobal_TownNpcNavi_EraseAllEffect()
    FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
    ;
    (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16)):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
  else
    if self._currentProgress == 2 then
      self._updateTime = 0
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_102"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_103"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
      if Panel_NpcNavi:GetShow() == true then
        Panel_NpcNavi:SetShow(false, true)
      end
      FGlobal_TownNpcNavi_EraseAllEffect()
      ;
      (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16)):EraseAllEffect()
      ;
      (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
    end
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep4ClickedExitButton = function(self, talker)
  -- function num : 0_19
  if self._currentProgress == 1 and (self._talkerCharacterKeyData)[2] == talker:getCharacterKey() then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep4MouseLUpBubble = function(self)
  -- function num : 0_20
  if self._currentProgress == 2 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleRegionChanged = function(self, regionInfo)
  -- function num : 0_21
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleNpcNavi_ShowToggle = function(self, isShow)
  -- function num : 0_22
  if self._currentStep == 2 then
    self:eventCallStep2NpcNavi_ShowToggle(isShow)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleClickedTownNpcIconNaviStart = function(self, spawnType, isAuto)
  -- function num : 0_23
  if self._currentStep == 2 then
    self:eventCallStep2ClickedTownNpcIconNaviStart(spawnType, isAuto)
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleShowDialog = function(self, dialogData)
  -- function num : 0_24
  if self._currentStep == 3 then
    self:eventCallStep3ShowDialog(dialogData)
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleClickedExitButton = function(self, talker)
  -- function num : 0_25
  if self._currentStep == 4 then
    self:eventCallStep4ClickedExitButton(talker)
  end
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleMouseLUpBubble = function(self)
  -- function num : 0_26
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  else
    if self._currentStep == 2 then
      self:eventCallStep2MouseLUpBubble()
    else
      if self._currentStep == 4 then
        self:eventCallStep4MouseLUpBubble()
      end
    end
  end
end


