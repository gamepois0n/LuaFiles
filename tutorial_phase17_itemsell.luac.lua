-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase17_itemsell.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_ItemSell = {_phaseNo = 17, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, _startLimitLevel = 15, 
_regionKeyRawList = {5}
, 
_talkerCharacterKeyData = {[1] = 40063}
, _radioButtonSell = nil}
-- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.checkPossibleForPhaseStart = function(self, stepNo)
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

-- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_ItemSell:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
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
  Panel_Tutorial:SetShow(true, false)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.endPhase = function(self)
  -- function num : 0_4
  FGlobal_EraseAllEffect_DialogButton((CppEnums.ContentsType).Contents_Shop)
  if self._radioButtonSell ~= nil then
    (self._radioButtonSell):EraseAllEffect()
  end
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.toStep = function(self, destStep, destProgress)
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

-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.setEffectDialogButtonByType = function(self, funcButtonType)
  -- function num : 0_10
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(funcButtonType)
  if funcButtonIndex == -1 then
    return false
  end
  FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  return true
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.changeStep1 = function(self)
  -- function num : 0_11
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("여긴 벨리아라�\148 시골 마을이네.", "그럼 잠시 정비�\188 하는 �\140 어때?", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\128�\165 중요�\156 �\180 �\164 �\128방을 비우�\148 일이�\188.\n무겁�\140 들고 다니�\180 아무것도 �\160 �\152 없잖�\132.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\128 에일린이라는 �\128석과 다시 말을 걸어 �\144.", "그리�\160 상점 기능�\132 이용해보�\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
        worldmapNavigatorStart(float3(7110.16, -6524.66, 71263.8), NavigationGuideParam(), false, false, true)
      else
        if self._currentProgress == 4 then
          Panel_Tutorial:SetShow(true, true)
          local spiritPosX = 0
          do
            local spiritPosY = 0
            if Panel_Window_NpcShop:GetShow() == true then
              spiritPosX = Panel_Window_NpcShop:GetPosX() + Panel_Window_NpcShop:GetPosX() * 0.3
              spiritPosY = Panel_Window_NpcShop:GetPosY() + Panel_Window_NpcShop:GetSizeY() * 1.05
            else
              if Panel_Window_NpcShop:GetShow() == false then
                spiritPosX = getScreenSizeX() * 0.5 - 20
                spiritPosY = getScreenSizeY() * 0.5 - 300
              end
            end
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_3 , upvalues : spiritPosX, spiritPosY
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("잘했�\180. 네게 필요 없는 전리품은 NPC에게 팔아버리라구.", "�\128방을 정리하는 �\180 모험에서 제일 중요하니�\140 말이�\188.", false, spiritPosX, spiritPosY, true)
  end
)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.eventCallStep1ShowDialog = function(self, dialogData)
  -- function num : 0_12
  if self._currentProgress == 3 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:setEffectDialogButtonByType((CppEnums.ContentsType).Contents_Shop)
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.eventCallStep1ClickedExitButton = function(self, talker)
  -- function num : 0_13
  if self._currentProgress == 4 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.eventCall1NpcShopUpdateContent = function(self, isShowSellButton)
  -- function num : 0_14
  if self._currentProgress == 3 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self._radioButtonSell = FGlobal_NpcShop_GetRadioButtonByIndex(1)
    if self._radioButtonSell ~= nil then
      (self._radioButtonSell):AddEffect("UI_ArrowMark08", true, 0, 50)
    end
  end
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.eventCallStep1NpcShopTabButtonClick = function(self, tabIndex)
  -- function num : 0_15
  if self._currentProgress == 3 and tabIndex == 1 then
    if self._radioButtonSell ~= nil then
      (self._radioButtonSell):EraseAllEffect()
    end
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_16
  if self._currentProgress == 4 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.handleBeforeShowDialog = function(self)
  -- function num : 0_17
  if self._currentStep == 2 then
    self:eventCallStep2BeforeShowDialog()
  end
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.handleShowDialog = function(self, dialogData)
  -- function num : 0_18
  if self._currentStep == 1 then
    self:eventCallStep1ShowDialog(dialogData)
  end
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.handleClickedExitButton = function(self, talker)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1ClickedExitButton(talker)
  end
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.handleNpcShopUpdateContent = function(self, isShowSellButton)
  -- function num : 0_20
  if self._currentStep == 1 then
    self:eventCall1NpcShopUpdateContent(isShowSellButton)
  end
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.handleNpcShopTabButtonClick = function(self, tabIndex)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1NpcShopTabButtonClick(tabIndex)
  end
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSell.handleMouseLUpBubble = function(self)
  -- function num : 0_22
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


