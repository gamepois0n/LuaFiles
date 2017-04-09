-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase18_enchant.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_Enchant = {_phaseNo = 18, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, 
_talkerCharacterKeyData = {[1] = 0}
, 
_questData = {
[1] = {_questGroupNo = 653, _questId = 6}
}
, 
_targerWeaponItemKeyList = {10011, 10070, 10142, 10143, 10211, 10270, 10342, 10343, 10411, 10470, 10542, 10543, 10611, 10670, 10742, 10743, 11361, 11423, 13042, 13043, 13142, 13143, 13211, 13270, 13311, 13370, 14411, 14470, 14542, 14543, 14642, 14643}
, _exclusiveEnchantStoneItemKey = 16003}
-- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("곽민�\176", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if questList_isClearQuest(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId) == false then
    _PA_LOG("곽민�\176", "[각성]에다나의 흔적 퀘스트를 완료하지 않으�\180 강화�\188 �\160 �\152 없으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    _PA_LOG("곽민�\176", "튜토리얼 시작 �\128�\165 여부 �\128사중�\144 selfPlayer�\128 없습니다! _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local inventory = (selfPlayer:get()):getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local hasItem = false
  for index,value in ipairs(self._targerWeaponItemKeyList) do
    if toInt64(0, 0) ~= inventory:getItemCount_s64(ItemEnchantKey(value, 0)) and toInt64(0, 0) ~= inventory:getItemCount_s64(ItemEnchantKey(self._exclusiveEnchantStoneItemKey, 0)) then
      hasItem = true
      break
    end
  end
  do
    if hasItem == false then
      _PA_LOG("곽민�\176", "필요�\156 아이�\156(바스티어 무기+0�\149 and 블랙스톤(바스티어))�\132 소지하고 있지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    local pcPosition = (selfPlayer:get()):getPosition()
    local regionInfo = getRegionInfoByPosition(pcPosition)
    if (regionInfo:get()):isSafeZone() == false then
      Proc_ShowMessage_Ack("안전 �\128역에�\156 다시 시도�\180 주세�\148.")
      return false
    end
    return true
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_Enchant:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
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

-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.endPhase = function(self)
  -- function num : 0_4
  FGlobal_EraseAllEffect_DialogButton((CppEnums.ContentsType).Contents_Shop)
  if self._radioButtonSell ~= nil then
    (self._radioButtonSell):EraseAllEffect()
  end
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.toStep = function(self, destStep, destProgress)
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

-- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.setEffectDialogButtonByType = function(self, funcButtonType)
  -- function num : 0_10
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(funcButtonType)
  if funcButtonIndex == -1 then
    return false
  end
  FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  return true
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.changeStep1 = function(self)
  -- function num : 0_11
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("새로�\180 의뢰�\188 받았�\176.\n이번에는 무기 잠재�\165 돌파�\188 배울 차례�\188.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("블랙스톤�\132 이용�\180 무기�\152 잠재력을 돌파시키�\180,\n�\128금보�\164 훨씬 좋은 성능�\132 발휘�\160 �\152 있지.", "그럼 �\160 소환(단축�\164 /)하고 잠재�\165 돌파 버튼�\132 눌러 �\144", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    else
      if self._currentProgress == 3 then
        Panel_Tutorial:SetShow(true, true)
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("잘했�\180. 그럼 바스티어 무기�\188 강하�\140 만들어보�\144.\n�\128방에 바스티어 무기�\188 넣고, 잠재�\165 돌파 창에 바스티어 무기�\188 올려�\144.", "그리�\160 블랙스톤(바스티어)�\188 올려�\156 돌파�\188 누르�\180 �\188", false, Panel_Window_Enchant:GetPosX(), Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.4, true)
  end
)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("그래! 바로 그거�\188! �\148 강력�\156 무기�\188 얻을 �\152 있었�\176.", "그럼 �\180 창을 닫고 바스티어 무기�\188 장착해봐. 강력�\156 힘을 느껴 보라�\172!\n(튜토리얼 종료)", false, Panel_Window_Enchant:GetPosX(), Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.4, false)
  end
)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1ShowDialog = function(self, dialogData)
  -- function num : 0_12
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Enchant)
    FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1ClickedExitButton = function(self, talker)
  -- function num : 0_13
  if self._currentProgress == 3 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self._currentProgress = 2
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_14
  if self._currentProgress == 2 and (CppEnums.ContentsType).Contents_Enchant == funcButtonType then
    self._currentProgress = 3
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1EnchantResultShow = function(self, resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_15
  if self._currentProgress == 3 and resultType == 0 then
    local itemWrapper = getInventoryItemByType(mainWhereType, mainSlotNo)
    local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
    local itemEnchantLevel = ((itemWrapper:get()):getKey()):getEnchantLevel()
    for index,value in ipairs(self._targerWeaponItemKeyList) do
      if value == itemKey then
        self:toNextProgress()
        return 
      end
    end
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_16
  if self._currentProgress == 4 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleShowDialog = function(self, dialogData)
  -- function num : 0_17
  if self._currentStep == 1 then
    self:eventCallStep1ShowDialog(dialogData)
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleClickedExitButton = function(self, talker)
  -- function num : 0_18
  if self._currentStep == 1 then
    self:eventCallStep1ClickedExitButton(talker)
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1ClickedDialogFuncButton(funcButtonType)
  end
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleEnchantResultShow = function(self, resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_20
  if self._currentStep == 1 then
    self:eventCallStep1EnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleMouseLUpBubble = function(self)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


