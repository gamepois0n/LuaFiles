-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase16_newitemequip.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_NewItemEquip = {_phaseNo = 16, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 2, _updateTime = 0, _isPhaseOpen = false, _isSkippable = true, _startLimitLevel = 9, _itemSlot = nil, _equipSuccess = false, _isAleadyClear = false, 
_questData = {
[1] = {_questGroupNo = 652, _questId = 8}
}
, _knownlegdeNo = 3004}
-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("조재�\144", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    _PA_LOG("조재�\144", "튜토리얼 시작 �\128�\165 여부 �\128사중�\144 selfPlayer�\128 없습니다! _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if self._startLimitLevel < ((getSelfPlayer()):get()):getLevel() then
    _PA_LOG("조재�\144", "캐릭터의 레벨�\180 " .. tostring(self._startLimitLevel) .. "�\188 초과했으�\128�\156 튜토리얼�\132 진행하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if questList_isClearQuest(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId) == true then
    _PA_LOG("조재�\144", "_questGroupNo" .. tostring(((self._questData)[1])._questGroupNo) .. "_questId" .. tostring(((self._questData)[1])._questId) .. "�\188 완료하여 튜토리얼�\132 진행하지 않습니다.")
    return false
  end
  if self._isAleadyClear == true then
    return false
  end
  if isLearnMentalCardForAlchemy(self._knownlegdeNo) == true then
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("조재�\144", "PaGlobal_TutorialPhase_NewItemEquip:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
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

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.endPhase = function(self)
  -- function num : 0_4
  self._isAleadyClear = true
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.progressException = function(self, processNo)
  -- function num : 0_9
  self._currentProgress = processNo
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.changeStep1 = function(self)
  -- function num : 0_10
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\164! 좋은 아이템을 획득 했어.", "전투�\188 멈추�\160 잠시 �\128�\169<I>�\132 열어 �\144", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_Inventory:addSlotEffectForTutorial(self._slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\128 무기�\148 우리�\188 �\148 강하�\140 해줄 �\131 같아.", "아이템을 마우�\164 우클릭으�\156 장착해보�\144!", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("잘했�\180! 좋은 장비�\188 획득하면,\n항상 이렇�\140 바로 확인하면 �\148 강해�\128�\148 �\184 잊지 말라�\172.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
      else
        if self._currentProgress == -1 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_10_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\140.. 조금 조용�\156 곳으�\156 �\128�\144.", "�\128�\156 �\128�\169(I) 열어�\144", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
          self:progressException(2)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.eventCallStep1ClosedInventory = function(self)
  -- function num : 0_11
  if self._currentProgress < 3 then
    self:progressException(-1)
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_12
  if self._currentProgress == 3 then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.eventCallStep1OpenedInventory = function(self)
  -- function num : 0_13
  if self._currentProgress == 1 then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.eventCallStep1NewEquipInInventory = function(self, slot)
  -- function num : 0_14
  self._slot = slot
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.eventCallStep1InventorySlotRClickgetSlotNo = function(self, SlotNo)
  -- function num : 0_15
  if (self._slot)._slotNo == SlotNo then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.eventCallStep1InventorySlotRClickgetSlotNo = function(self, SlotNo)
  -- function num : 0_16
  if (self._slot)._slotNo == SlotNo then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.handleNewEquipInInventory = function(self, slot)
  -- function num : 0_17
  self:eventCallStep1NewEquipInInventory(slot)
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.handleOpenedInventory = function(self)
  -- function num : 0_18
  self:eventCallStep1OpenedInventory()
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.handleClosedInventory = function(self)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1ClosedInventory()
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.handleInventorySlotRClickgetSlotNo = function(self, SlotNo)
  -- function num : 0_20
  self:eventCallStep1InventorySlotRClickgetSlotNo(SlotNo)
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_NewItemEquip.handleMouseLUpBubble = function(self)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


