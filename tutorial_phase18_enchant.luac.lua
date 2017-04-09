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
    _PA_LOG("๊ณฝ๋ฏผ์\176", "ํํ ๋ฆฌ์ผ Phase๊ฐ\128 ๋ซํ์์ผ๋ฏ\128๋ก\156 ํํ ๋ฆฌ์ผ์\132 ์์ํ์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if questList_isClearQuest(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId) == false then
    _PA_LOG("๊ณฝ๋ฏผ์\176", "[๊ฐ์ฑ]์๋ค๋์ ํ์  ํ์คํธ๋ฅผ ์๋ฃํ์ง ์์ผ๋ฉ\180 ๊ฐํ๋ฅ\188 ํ\160 ์\152 ์์ผ๋ฏ\128๋ก\156 ํํ ๋ฆฌ์ผ์\132 ์์ํ์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    _PA_LOG("๊ณฝ๋ฏผ์\176", "ํํ ๋ฆฌ์ผ ์์ ๊ฐ\128๋\165 ์ฌ๋ถ ๊ฒ\128์ฌ์ค์\144 selfPlayer๊ฐ\128 ์์ต๋๋ค! _phaseNo : " .. tostring(self._phaseNo))
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
      _PA_LOG("๊ณฝ๋ฏผ์\176", "ํ์ํ\156 ์์ดํ\156(๋ฐ์คํฐ์ด ๋ฌด๊ธฐ+0๊ฐ\149 and ๋ธ๋์คํค(๋ฐ์คํฐ์ด))์\132 ์์งํ๊ณ  ์์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    local pcPosition = (selfPlayer:get()):getPosition()
    local regionInfo = getRegionInfoByPosition(pcPosition)
    if (regionInfo:get()):isSafeZone() == false then
      Proc_ShowMessage_Ack("์์  ์ง\128์ญ์์\156 ๋ค์ ์๋ํ\180 ์ฃผ์ธ์\148.")
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
    _PA_LOG("๊ณฝ๋ฏผ์\176", "ํํ ๋ฆฌ์ผ phase(" .. tostring(self._phaseNo) .. ")๊ฐ\128 ๋ณด์ค ์ํ ํํ ๋ฆฌ์ผ์\132 ์ข๋ฃ์ํด! _phaseNo : " .. tostring(self._phaseNo))
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
  _PA_LOG("๊ณฝ๋ฏผ์\176", "PaGlobal_TutorialPhase_Enchant:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
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
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์๋ก์\180 ์๋ขฐ๋ฅ\188 ๋ฐ์๊ต\176.\n์ด๋ฒ์๋ ๋ฌด๊ธฐ ์ ์ฌ๋ \165 ๋ํ๋ฅ\188 ๋ฐฐ์ธ ์ฐจ๋ก์\188.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๋ธ๋์คํค์\132 ์ด์ฉํ\180 ๋ฌด๊ธฐ์\152 ์ ์ฌ๋ ฅ์ ๋ํ์ํค๋ฉ\180,\n์ง\128๊ธ๋ณด๋\164 ํจ์ฌ ์ข์ ์ฑ๋ฅ์\132 ๋ฐํํ\160 ์\152 ์์ง.", "๊ทธ๋ผ ๋\160 ์ํ(๋จ์ถํ\164 /)ํ๊ณ  ์ ์ฌ๋ \165 ๋ํ ๋ฒํผ์\132 ๋๋ฌ ๋ด\144", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    else
      if self._currentProgress == 3 then
        Panel_Tutorial:SetShow(true, true)
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180. ๊ทธ๋ผ ๋ฐ์คํฐ์ด ๋ฌด๊ธฐ๋ฅ\188 ๊ฐํ๊ฒ\140 ๋ง๋ค์ด๋ณด์\144.\n๊ฐ\128๋ฐฉ์ ๋ฐ์คํฐ์ด ๋ฌด๊ธฐ๋ฅ\188 ๋ฃ๊ณ , ์ ์ฌ๋ \165 ๋ํ ์ฐฝ์ ๋ฐ์คํฐ์ด ๋ฌด๊ธฐ๋ฅ\188 ์ฌ๋ ค๋ด\144.", "๊ทธ๋ฆฌ๊ณ\160 ๋ธ๋์คํค(๋ฐ์คํฐ์ด)๋ฅ\188 ์ฌ๋ ค์\156 ๋ํ๋ฅ\188 ๋๋ฅด๋ฉ\180 ๋\188", false, Panel_Window_Enchant:GetPosX(), Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.4, true)
  end
)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ทธ๋! ๋ฐ๋ก ๊ทธ๊ฑฐ์\188! ๋\148 ๊ฐ๋ ฅํ\156 ๋ฌด๊ธฐ๋ฅ\188 ์ป์ ์\152 ์์๊ต\176.", "๊ทธ๋ผ ์\180 ์ฐฝ์ ๋ซ๊ณ  ๋ฐ์คํฐ์ด ๋ฌด๊ธฐ๋ฅ\188 ์ฅ์ฐฉํด๋ด. ๊ฐ๋ ฅํ\156 ํ์ ๋๊ปด ๋ณด๋ผ๊ต\172!\n(ํํ ๋ฆฌ์ผ ์ข๋ฃ)", false, Panel_Window_Enchant:GetPosX(), Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.4, false)
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


