-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase19_extractionenchantstone.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_ExtractionEnchantStone = {_phaseNo = 19, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = false, _buttonExtraction_EnchantStone = (UI.getChildControl)(Panel_Window_Extraction, "Button_Extraction_EnchantStone"), _buttonExtraction_Crystal = (UI.getChildControl)(Panel_Window_Extraction, "Button_Extraction_Crystal"), _buttonExtraction_Cloth = (UI.getChildControl)(Panel_Window_Extraction, "Button_Extraction_Cloth")}
-- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

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
  if PaGlobal_TutorialManager:isDoingTutorial() == true or PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true or PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return false
  end
  local pcPosition = (selfPlayer:get()):getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  if (regionInfo:get()):isSafeZone() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_DO_SAFEZONE"))
    return false
  end
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel < 40 or playerLevel > 56 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOLEVEL_ACK"))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.addEffectExtractionDialogButton = function(self, extractionDialogButton)
  -- function num : 0_2
  if self.extractionDialogButton ~= nil then
    (self.extractionDialogButton):EraseAllEffect()
    ;
    (self.extractionDialogButton):AddEffect("UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eraseAllEffectExtractionDialogButton = function(self, extractionDialogButton)
  -- function num : 0_3
  if self.extractionDialogButton ~= nil then
    (self.extractionDialogButton):EraseAllEffect()
    ;
    (self.extractionDialogButton):AddEffect("UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.startPhase = function(self, stepNo)
  -- function num : 0_4
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

-- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.startPhaseXXX = function(self, stepNo)
  -- function num : 0_5
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_ExtractionEnchantStone:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
  self._updateTime = 0
  self._buttonExtraction_EnchantStone = PaGlobal_Extraction:getExtractionButtonEnchantStone()
  self._buttonExtraction_Crystal = PaGlobal_Extraction:getExtractionButtonCrystal()
  self._buttonExtraction_Cloth = PaGlobal_Extraction:getExtractionButtonCloth()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  FGlobal_Dialog_SetAllowTutorialPanelShow(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.endPhase = function(self)
  -- function num : 0_6
  (self._buttonExtraction_EnchantStone):EraseAllEffect()
  ;
  (self._buttonExtraction_Crystal):EraseAllEffect()
  ;
  (self._buttonExtraction_Cloth):EraseAllEffect()
  ;
  (PaGlobal_ExtractionEnchantStone:getButtonExtractionApply()):EraseAllEffect()
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Extract)
  if funcButtonIndex ~= -1 then
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  end
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.updatePerFrame = function(self, deltaTime)
  -- function num : 0_7
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleChangeStep = function(self, currentStep)
  -- function num : 0_8
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.toNextProgress = function(self)
  -- function num : 0_9
  if isGameTypeEnglish() then
    if self._currentProgress == 10 then
      self._currentProgress = 14
    else
      self._currentProgress = self._currentProgress + 1
    end
  else
    self._currentProgress = self._currentProgress + 1
  end
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.toNextStep = function(self)
  -- function num : 0_10
  self._currentProgress = 1
  if isGameTypeEnglish() then
    if self._nextStep == 10 then
      self._nextStep = 14
    else
      self._nextStep = self._nextStep + 1
    end
  else
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.toStep = function(self, destStep, destProgress)
  -- function num : 0_11
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

-- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.setEffectDialogButtonByType = function(self, funcButtonType)
  -- function num : 0_12
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(funcButtonType)
  if funcButtonIndex == -1 then
    return false
  end
  FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  return true
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.eraseAllEffectDialogButtonByType = function(self, funcButtonType)
  -- function num : 0_13
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(funcButtonType)
  if funcButtonIndex == -1 then
    return false
  end
  FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  return true
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.changeStep1 = function(self)
  -- function num : 0_14
  local westString1 = "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_69"
  local westString2 = "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_70"
  if isGameTypeEnglish() then
    westString1 = "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_117"
    westString2 = "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_118"
  end
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_43"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_44"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      self:setEffectDialogButtonByType((CppEnums.ContentsType).Contents_Extract)
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_45"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_46"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    else
      if self._currentProgress == 3 then
        (self._buttonExtraction_EnchantStone):AddEffect("UI_ArrowMark02", true, 0, -50)
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_47"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_48"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_49"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_50"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
        else
          if self._currentProgress == 5 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_51"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_52"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_53"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_54"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
            else
              if self._currentProgress == 7 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_55"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_56"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
              else
                if self._currentProgress == 8 then
                  (PaGlobal_ExtractionEnchantStone:getButtonExtractionApply()):EraseAllEffect()
                  ;
                  (self._buttonExtraction_EnchantStone):EraseAllEffect()
                  ;
                  (self._buttonExtraction_Crystal):AddEffect("UI_ArrowMark02", true, 0, -50)
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_57"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_58"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
                else
                  if self._currentProgress == 9 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_8
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_59"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_60"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                  else
                    if self._currentProgress == 10 then
                      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_9
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_61"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_62"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                    else
                      if self._currentProgress == 11 then
                        (self._buttonExtraction_Crystal):EraseAllEffect()
                        ;
                        (self._buttonExtraction_Cloth):AddEffect("UI_ArrowMark02", true, 0, -50)
                        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_10
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_63"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_64"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
                      else
                        if self._currentProgress == 12 then
                          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_11
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_65"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_66"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                        else
                          if self._currentProgress == 13 then
                            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_12
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_67"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_68"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                          else
                            if self._currentProgress == 14 then
                              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_13 , upvalues : westString1, westString2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, westString1), PAGetString(Defines.StringSheet_GAME, westString2), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
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
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ShowDialog = function(self, dialogData)
  -- function num : 0_15
  if (self._currentProgress == 3 or self._currentProgress == 4 or self._currentProgress == 5) and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Extract)
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
    FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  end
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ClickedExitButton = function(self, talker)
  -- function num : 0_16
  self:endPhase()
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_17
  _PA_LOG("곽민�\176", "funcButtonType : " .. tostring(funcButtonType))
  if (CppEnums.ContentsType).Contents_Extract ~= funcButtonType then
    self:endPhase()
  end
  if self._currentProgress < 3 then
    self._currentProgress = 3
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1OpenExtractionPanel = function(self, isShow)
  -- function num : 0_18
  if isShow == false then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ClickExtractionEnchantStoneButton = function(self, isShow)
  -- function num : 0_19
  if isShow == false then
    return 
  end
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

-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ClickExtractionCrystalButton = function(self, isShow)
  -- function num : 0_20
  if isShow == false then
    return 
  end
  if (self._currentProgress ~= 9 and self._currentProgress ~= 10) or self._currentProgress == 8 then
    self._currentProgress = 9
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1ClickExtractionClothButton = function(self, isShow)
  -- function num : 0_21
  if isShow == false then
    return 
  end
  if (self._currentProgress ~= 12 and self._currentProgress ~= 13) or self._currentProgress == 11 then
    self._currentProgress = 12
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_22
  if self._currentProgress == 14 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleShowDialog = function(self, dialogData)
  -- function num : 0_23
  if self._currentStep == 1 then
    self:eventCallStep1ShowDialog(dialogData)
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleClickedExitButton = function(self, talker)
  -- function num : 0_24
  if self._currentStep == 1 then
    self:eventCallStep1ClickedExitButton(talker)
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_25
  if self._currentStep == 1 then
    self:eventCallStep1ClickedDialogFuncButton(funcButtonType)
  end
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleOpenExtractionPanel = function(self, isShow)
  -- function num : 0_26
  if self._currentStep == 1 then
    self:eventCallStep1OpenExtractionPanel(isShow)
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleClickExtractionEnchantStoneButton = function(self, isShow)
  -- function num : 0_27
  if self._currentStep == 1 then
    self:eventCallStep1ClickExtractionEnchantStoneButton(isShow)
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleClickExtractionCrystalButton = function(self, isShow)
  -- function num : 0_28
  if self._currentStep == 1 then
    self:eventCallStep1ClickExtractionCrystalButton(isShow)
  end
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleClickExtractionClothButton = function(self, isShow)
  -- function num : 0_29
  if self._currentStep == 1 then
    self:eventCallStep1ClickExtractionClothButton(isShow)
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ExtractionEnchantStone.handleMouseLUpBubble = function(self)
  -- function num : 0_30
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


