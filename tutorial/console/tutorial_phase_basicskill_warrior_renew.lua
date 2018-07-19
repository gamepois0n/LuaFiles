PaGlobal_TutorialPhase_BasicSkill_Warrior = {
  _phaseNo = 6,
  _currentType = 0,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 1,
  _updateTime = 0,
  _isPhaseOpen = true,
  _isSkippable = true,
  _regionKeyRawList = {88, 349},
  _startLimitLevel = 15,
  _totalScoldingCount = 3,
  _usedSkillCount = 0,
  _totalSkillCount = 2,
  _usedComboCount = 0,
  _totalComboCount = 2,
  _currentClearCount = 0,
  _totalClearCount = 2,
  _skillNoList = {
    [1] = {
      349,
      350,
      351,
      705
    },
    [2] = {
      1144,
      712,
      1145
    },
    [3] = {
      1027,
      1136,
      1137
    }
  },
  _questData = {
    [1] = {_questGroupNo = 650, _questId = 3}
  }
}
function PaGlobal_TutorialPhase_BasicSkill_Warrior:checkPossibleForPhaseStart(stepNo)
  if false == self._isPhaseOpen then
    _PA_LOG("\234\179\189\235\175\188\236\154\176", "\237\138\156\237\134\160\235\166\172\236\150\188 Phase\234\176\128 \235\139\171\237\152\128\236\158\136\236\156\188\235\175\128\235\161\156 \237\138\156\237\134\160\235\166\172\236\150\188\236\157\132 \236\139\156\236\158\145\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    _PA_LOG("\234\179\189\235\175\188\236\154\176", "\237\138\156\237\134\160\235\166\172\236\150\188 \236\139\156\236\158\145 \234\176\128\235\138\165 \236\151\172\235\182\128 \234\178\128\236\130\172\236\164\145\236\151\144 selfPlayer\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164! _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local currentRegionKeyRaw = selfPlayer:getRegionKeyRaw()
  local isPossiblePhaseRegion = false
  for index, value in pairs(self._regionKeyRawList) do
    if value == currentRegionKeyRaw then
      isPossiblePhaseRegion = true
      break
    end
  end
  if false == isPossiblePhaseRegion then
    _PA_LOG("\234\179\189\235\175\188\236\154\176", "\237\138\156\237\134\160\235\166\172\236\150\188\236\157\180 \234\176\128\235\138\165\237\149\156 \236\167\128\236\151\173\236\157\180 \236\149\132\235\139\136\235\175\128\235\161\156 \237\138\156\237\134\160\235\166\172\236\150\188\236\157\132 \236\139\164\237\150\137\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if self._startLimitLevel < getSelfPlayer():get():getLevel() then
    _PA_LOG("\234\179\189\235\175\188\236\154\176", "\236\186\144\235\166\173\237\132\176\236\157\152 \235\160\136\235\178\168\236\157\180 " .. tostring(self._startLimitLevel) .. "\235\165\188 \236\180\136\234\179\188\237\150\136\236\156\188\235\175\128\235\161\156 \237\138\156\237\134\160\235\166\172\236\150\188\236\157\132 \236\167\132\237\150\137\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:startPhase(stepNo, typeNo)
  if false == self:checkPossibleForPhaseStart(stepNo) then
    return
  end
  local isSkippable = self:checkSkippablePhase()
  if true == isSkippable and false == PaGlobal_TutorialManager:isDoingTutorial() then
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo, typeNo)
  else
    self:startPhaseXXX(stepNo, typeNo)
  end
end
local navigationGuideParam
function PaGlobal_TutorialPhase_BasicSkill_Warrior:startPhaseXXX(stepNo, typeNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("\234\179\189\235\175\188\236\154\176", "PaGlobal_TutorialPhase_BasicSkill_Warrior:startStep() typeNo : " .. tostring(typeNo))
  self._currentType = typeNo
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  if 1 == self._currentType then
    classType = getSelfPlayer():getClassType()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
    PaGlobal_TutorialManager:setAllowMainQuestWidget(false)
    navigationGuideParam = NavigationGuideParam()
    navigationGuideParam._isAutoErase = false
    ToClient_DeleteNaviGuideByGroup()
    worldmapNavigatorStart(float3(-140505.36, 1157.95, 113244.4), navigationGuideParam, false, false, true)
    PaGlobal_TutorialUiManager:setShowAllDefaultUi(false)
    PaGlobal_TutorialUiManager:hideAllTutorialUi()
  end
  PaGlobal_TutorialUiManager:getUiHeadlineMessage():resetClearStepEffect()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial_Renew:SetShow(true, true)
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:endPhase()
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
  PaGlobal_TutorialManager:startNextPhase()
end
local result = false
function PaGlobal_TutorialPhase_BasicSkill_Warrior:updatePerFrame(deltaTime)
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if 1 == self._currentType then
    if 1 == self._currentStep then
      result = self:updateTryBasicSkill(deltaTime)
    elseif 2 == self._currentStep then
      result = self:updateTrySkillCombo(deltaTime)
    elseif 3 == self._currentStep then
      result = false
    end
  end
  if true == result then
    self._nextStep = self._nextStep + 1
  end
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:handleChangeStep(currentStep)
  if 1 == self._currentType then
    if 1 == self._currentStep then
      self:changeStepTryBasicSkill()
    elseif 2 == self._currentStep then
      self:changeStepTrySkillCombo()
    elseif 3 == self._currentStep then
      self:changeStepSuggestCallBlackSpirit()
    elseif 4 == self._currentStep then
      self:endPhase()
    end
  end
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:showUiScoldingTooManyKeyInput()
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("", PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PRESSEDKEY_DARKSPIRIT"))
  end)
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:changeStepTryBasicSkill()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_BASESKILLTUTORIAL_PURPOSE_1"), "")
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setSkillText(self._currentProgress, PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_INTERFACE_ACTION_Tab_1"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_PURPOSE_BATTLE_STEP1_COMMAND"))
  elseif 2 == self._currentProgress then
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_BASESKILLTUTORIAL_PURPOSE_2"), "")
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setSkillText(self._currentProgress, PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_INTERFACE_ACTION_Mouse_LB_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_PURPOSE_BATTLE_STEP2_COMMAND"))
  elseif 3 == self._currentProgress then
    if self._totalSkillCount == self._usedSkillCount then
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(3)
    elseif self._totalSkillCount < self._usedSkillCount then
      return
    end
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP7") .. " ( " .. self._usedSkillCount .. " / " .. self._totalSkillCount .. " )")
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setSkillText(self._currentProgress, PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_WARRIOR_COMBO_0_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_BASESKILLTUTORIAL_WARRIOR_1"))
  elseif 4 == self._currentProgress then
    if self._totalSkillCount == self._usedSkillCount then
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(4)
    elseif self._totalSkillCount < self._usedSkillCount then
      return
    end
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP7") .. " ( " .. self._usedSkillCount .. " / " .. self._totalSkillCount .. " )")
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setSkillText(self._currentProgress, PAGetString(Defines.StringSheet_GAME, "NEW_TUTORIAL_COMBO_01"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_BASESKILLTUTORIAL_WARRIOR_2"))
  end
end
local isPressedTab = false
local mouseLUpCount = 0
local isBlackSpiritScolding = false
function PaGlobal_TutorialPhase_BasicSkill_Warrior:updateTryBasicSkill(deltaTime)
  if 1 == self._currentProgress then
    if true == keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_WeaponInOut) then
      isPressedTab = true
    end
    if true == keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_Attack1) then
      isPressedMouseL = true
    end
    if true == isPressedTab then
      isPressedTab = false
      audioPostEvent_SystemUi(4, 12)
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(1)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  elseif 2 == self._currentProgress then
    if true == keyCustom_IsUp_Action(CppEnums.ActionInputType.ActionInputType_Attack1) then
      mouseLUpCount = mouseLUpCount + 1
      if self._totalScoldingCount < mouseLUpCount and false == isBlackSpiritScolding then
        isBlackSpiritScolding = true
        self:showUiScoldingTooManyKeyInput()
      end
    end
    if true == keyCustom_IsPressed_Action(CppEnums.ActionInputType.ActionInputType_Attack1) then
      self._updateTime = self._updateTime + deltaTime
    end
    if self._updateTime > 2.25 then
      audioPostEvent_SystemUi(4, 12)
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(2)
      if true == isBlackSpiritScolding then
        isBlackSpiritScolding = false
        PaGlobal_TutorialUiManager:getUiBlackSpirit():setShowAll(false)
      end
      audioPostEvent_SystemUi(4, 12)
      self._updateTime = 0
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
      return false
    end
  elseif 3 == self._currentProgress then
    if self._totalSkillCount <= self._usedSkillCount then
      self._updateTime = self._updateTime + deltaTime
      if self._updateTime > 1.25 then
        prevInputCombination = false
        isInputCombinationChanged = false
        self._usedSkillCount = 0
        self._updateTime = 0
        self._currentProgress = self._currentProgress + 1
        self:handleChangeStep(self._currentStep)
      end
    end
  elseif 4 == self._currentProgress and self._totalSkillCount <= self._usedSkillCount then
    self._updateTime = self._updateTime + deltaTime
    if self._updateTime > 1.25 then
      prevInputCombination = false
      isInputCombinationChanged = false
      self._usedSkillCount = 0
      self._updateTime = 0
      self._currentProgress = 1
      return true
    end
  end
  return false
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:eventCallUsedSkill_TryBasicSkill(skillWrapper)
  local skillNo = skillWrapper:getSkillNo()
  local listNo = 0
  if 3 == self._currentProgress then
    listNo = 1
  elseif 4 == self._currentProgress then
    listNo = 2
  else
    return
  end
  for key, value in pairs(self._skillNoList[listNo]) do
    if skillNo == value then
      audioPostEvent_SystemUi(4, 12)
      self._usedSkillCount = self._usedSkillCount + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:changeStepTrySkillCombo()
  if self._totalComboCount < self._usedComboCount then
    return
  end
  self._currentClearCount = 0
  PaGlobal_TutorialUiManager:getUiHeadlineMessage():resetClearStepEffect(true)
  PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP6") .. " ( " .. self._usedComboCount .. " / " .. self._totalComboCount .. " )")
  PaGlobal_TutorialUiManager:getUiHeadlineMessage():setSkillText(1, PAGetString(Defines.StringSheet_GAME, "NEW_TUTORIAL_COMBO_03"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_BASESKILLTUTORIAL_WARRIOR_3"))
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:updateTrySkillCombo(deltaTime)
  if self._totalComboCount <= self._usedComboCount then
    if 1.75 < self._updateTime then
      self._updateTime = 0
      self._usedComboCount = 0
      return true
    end
    self._updateTime = self._updateTime + deltaTime
  elseif 2 == self._currentClearCount then
    if self._updateTime > 1.25 then
      self._updateTime = 0
      self:handleChangeStep(self._currentStep)
    end
    self._updateTime = self._updateTime + deltaTime
  end
  return false
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:eventCallUsedSkill_TrySkillCombo(skillWrapper)
  local listNo = 0
  local skillNo = skillWrapper:getSkillNo()
  if 0 == self._currentClearCount then
    listNo = 3
  elseif 1 == self._currentClearCount then
    listNo = 1
  else
    return
  end
  for key, value in pairs(self._skillNoList[listNo]) do
    if skillNo == value then
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(self._currentClearCount + 1)
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():setSkillText(2, PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_WARRIOR_COMBO_0_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_BASESKILLTUTORIAL_WARRIOR_1"))
      self._currentClearCount = self._currentClearCount + 1
      audioPostEvent_SystemUi(4, 12)
      if self._currentClearCount == self._totalClearCount then
        self._usedComboCount = self._usedComboCount + 1
        PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP6") .. " ( " .. self._usedComboCount .. " / " .. self._totalComboCount .. " )")
      end
    end
  end
end
local isAcceptedQuest = false
local isClearQuest = false
function PaGlobal_TutorialPhase_BasicSkill_Warrior:changeStepSuggestCallBlackSpirit()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiManager:getUiBlackSpirit():showSuggestCallSpiritUi()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  end
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:eventCallAcceptBlackSpiritQuest(isAccept, questGroupNo, questId)
  if 1 == self._currentProgress and questGroupNo == self._questData[1]._questGroupNo and questId == self._questData[1]._questId then
    isAcceptedQuest = true
  end
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:eventCallAfterBlackSpiritDialogClose()
  if 1 == self._currentProgress and true == isAcceptedQuest then
    isAcceptedQuest = false
    Panel_CheckedQuest:SetShow(false)
    Panel_CheckedQuest:SetShow(true, true)
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:handleEventQuestUpdateNotify(isAccept, questNoRaw)
  local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(questNoRaw)
  if 1 == self._currentType and 3 == self._currentStep and true == isAccept then
    self:eventCallAcceptBlackSpiritQuest(isAccept, questGroupNo, questId)
  end
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:handleAfterAndPopFlush()
  if 1 == self._currentType and 3 == self._currentStep then
    self:eventCallAfterBlackSpiritDialogClose()
  end
end
function PaGlobal_TutorialPhase_BasicSkill_Warrior:handleEventSelfPlayerUsedSkill(skillWrapper)
  if nil ~= skillWrapper and 1 == self._currentType then
    if 1 == self._currentStep then
      self:eventCallUsedSkill_TryBasicSkill(skillWrapper)
    elseif 2 == self._currentStep then
      self:eventCallUsedSkill_TrySkillCombo(skillWrapper)
    end
  end
end
