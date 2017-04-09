-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase19_extractionenchantstone.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_ExtractionEnchantStone = {_phaseNo = 19, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {187}
, 
_talkerCharacterKeyData = {[1] = 43433}
, 
_targerWeaponItemKeyList = {10011, 10070, 10142, 10143, 10211, 10270, 10342, 10343, 10411, 10470, 10542, 10543, 10611, 10670, 10742, 10743, 11361, 11423, 13042, 13043, 13142, 13143, 13211, 13270, 13311, 13370, 14411, 14470, 14542, 14543, 14642, 14643}
, _targetEnchantLevel = 1, _buttonExtraction_EnchantStone = (UI.getChildControl)(Panel_Window_Extraction, "Button_Extraction_EnchantStone")}
-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.checkPossibleForPhaseStart = function(self, stepNo)
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
  local hasItem = false
  for index,value in ipairs(self._targerWeaponItemKeyList) do
    if PaGlobal_Inventory:findItemWrapper((CppEnums.ItemWhereType).eInventory, value, 1) ~= nil then
      hasItem = true
      break
    end
  end
  do
    if hasItem == false then
      _PA_LOG("곽민�\176", "추출�\144 필요�\156 아이�\156(바스티어 무기+1�\149)�\132 소지하고 있지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
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
      return true
    end
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_ExtractionEnchantStone:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
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

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.endPhase = function(self)
  -- function num : 0_4
  (self._buttonExtraction_EnchantStone):EraseAllEffect()
  ;
  (PaGlobal_ExtractionEnchantStone:getButtonExtractionApply()):EraseAllEffect()
  FGlobal_EraseAllEffect_DialogButton((CppEnums.ContentsType).Contents_Shop)
  if self._radioButtonSell ~= nil then
    (self._radioButtonSell):EraseAllEffect()
  end
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    self:updateStep1(deltaTime)
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.toStep = function(self, destStep, destProgress)
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

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.setEffectDialogButtonByType = function(self, funcButtonType)
  -- function num : 0_10
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(funcButtonType)
  if funcButtonIndex == -1 then
    return false
  end
  FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  return true
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.changeStep1 = function(self)
  -- function num : 0_11
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("잠재�\165 돌파�\148 정말 잘했�\180.", "�\128�\156 �\176 아니�\128? 그럼 추출�\144 �\128해서�\132 배워보자.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("추출�\128 쉽게 말해 블랙스톤�\132 돌려받는 기능이야.", "+1�\180 �\156 무기�\188 추출하면 블랙스톤 1개를 돌려받을 �\152 있지.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
    else
      if self._currentProgress == 3 then
        worldmapNavigatorStart(float3(-133003.98, 2729.52, -46023.2), NavigationGuideParam(), false, false, true)
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\180 �\144 필요 없이 당장 해보�\144.", "여기 주변�\144 그랜빌이라는 �\128석이 있어. 찾아�\128�\144!", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\152 도착했군. 그랜빌과 �\128화하�\160,", "[추출]이라�\148 버튼�\132 이용하면 �\188", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
    ;
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addBubbleKey("_bubbleKey_R")
  end
)
        else
          if self._currentProgress == 5 then
            Panel_Tutorial:SetShow(true, true)
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("그래 잘했�\180. 그럼 여기�\144 +1 바스티어 무기�\188 올려�\144", "그리�\160 추출�\132 누르�\180 블랙스톤�\132 돌려받을 �\152 있어.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이제 �\128방을 보면 추출�\156 블랙스톤�\180 있을 거야.", "어때? 쉽게 진행�\160 �\152 있겠�\128?", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
            else
              if self._currentProgress == 7 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("만약 잠재력이 돌파�\156 무기�\188 쓰다�\128 네가 �\148 좋은 무기�\188 얻었�\132 �\140,\n추출�\132 하고 새로�\180 무기�\188 �\144 잠재�\165 돌파하면 되는 거야.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
              else
                if self._currentProgress == 8 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이제 구조�\148 �\152 알겠�\128?\n�\148 강해�\128�\176 위해! 잠재�\165 돌파�\128 추출�\132 �\152 활용하라�\172.", "그럼 즐거�\180 모험 되길 바라! 의뢰�\188 완료�\180!", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
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

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.updateStep1 = function(self, deltaTime)
  -- function num : 0_12
  if self._currentProgress ~= 3 and self._currentProgress ~= 4 then
    return 
  end
  local currentInteractableActor = interaction_getInteractable()
  local isMatchCharacterKey = false
  if currentInteractableActor:getCharacterKeyRaw() ~= (self._talkerCharacterKeyData)[1] then
    do
      isMatchCharacterKey = currentInteractableActor == nil
      -- DECOMPILER ERROR at PC25: Unhandled construct in 'MakeBoolean' P1

      if isMatchCharacterKey == true and self._currentProgress == 3 then
        self._currentProgress = 4
        self:handleChangeStep(self._currentStep)
      end
      if isMatchCharacterKey == false and self._currentProgress == 4 then
        self._currentProgress = 3
        self:handleChangeStep(self._currentStep)
      end
      -- DECOMPILER ERROR: 4 unprocessed JMP targets
    end
  end
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ShowDialog = function(self, dialogData)
  -- function num : 0_13
  if (self._currentProgress == 3 or self._currentProgress == 4 or self._currentProgress == 5) and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Extract)
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
    FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ClickedExitButton = function(self, talker)
  -- function num : 0_14
  if (self._currentProgress == 3 or self._currentProgress == 4 or self._currentProgress == 5) and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self._currentProgress = 3
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1OpenExtractionPanel = function(self, isShow)
  -- function num : 0_15
  if (self._currentProgress == 3 or self._currentProgress == 4) and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() and isShow == true then
    local buttonExtraction_EnchantStone = (UI.getChildControl)(Panel_Window_Extraction, "Button_Extraction_EnchantStone")
    buttonExtraction_EnchantStone:EraseAllEffect()
    buttonExtraction_EnchantStone:AddEffect("UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ClickExtractionEnchantStoneButton = function(self)
  -- function num : 0_16
  if self._currentProgress == 3 or self._currentProgress == 4 or self._currentProgress == 5 then
    (PaGlobal_ExtractionEnchantStone:getButtonExtractionApply()):EraseAllEffect()
    ;
    (PaGlobal_ExtractionEnchantStone:getButtonExtractionApply()):AddEffect("UI_ArrowMark06", true, -70, 0)
    ;
    (PaGlobal_ExtractionEnchantStone:getButtonExtractionApply()):AddEffect("UI_ArrowMark04", true, 70, 0)
  end
  if self._currentProgress == 3 or self._currentProgress == 4 then
    self._currentProgress = 5
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ApplyExtractionEnchantStone = function(self)
  -- function num : 0_17
  if self._currentProgress == 5 then
    self._currentProgress = 6
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_18
  if self._currentProgress == 8 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleShowDialog = function(self, dialogData)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1ShowDialog(dialogData)
  end
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleClickedExitButton = function(self, talker)
  -- function num : 0_20
  if self._currentStep == 1 then
    self:eventCallStep1ClickedExitButton(talker)
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleOpenExtractionPanel = function(self, isShow)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1OpenExtractionPanel(isShow)
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleClickExtractionEnchantStoneButton = function(self)
  -- function num : 0_22
  if self._currentStep == 1 then
    self:eventCallStep1ClickExtractionEnchantStoneButton()
  end
end

-- DECOMPILER ERROR at PC130: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleApplyExtractionEnchantStone = function(self)
  -- function num : 0_23
  if self._currentStep == 1 then
    self:eventCallStep1ApplyExtractionEnchantStone()
  end
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleExtractionEnchantStoneResultShow = function(self)
  -- function num : 0_24
  if self._currentProgress == 5 then
    (self._buttonExtraction_EnchantStone):EraseAllEffect()
    self._currentProgress = 6
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC136: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleInventoryDelete = function(self, itemWrapper, deleteWhereType, deleteSlotNo)
  -- function num : 0_25
  if itemWrapper == nil then
    return 
  end
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  local enchantLevel = ((itemWrapper:get()):getKey()):getEnchantLevel()
  for index,value in ipairs(self._targerWeaponItemKeyList) do
    if value == itemKey and enchantLevel == self._targetEnchantLevel then
      self:endPhase()
      _PA_LOG("곽민�\176", "추출�\144 필요�\156 아이�\156(바스티어 무기+1�\149)�\132 버렸으므�\156 튜토리얼�\132 종료합니�\164. _phaseNo : " .. tostring(self._phaseNo))
      return 
    end
  end
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleMouseLUpBubble = function(self)
  -- function num : 0_26
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


