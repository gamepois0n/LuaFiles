-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase18_enchant.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_Enchant = {_phaseNo = 18, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = false, 
_talkerCharacterKeyData = {[1] = 0}
, 
_questData = {
[1] = {_questGroupNo = 653, _questId = 6}
}
, _equipSlotIcon = nil, _materialSlotIcon = nil, _buttonEnchantApply = nil, _buttonSureSuccess = nil}
-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("곽민�\176", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true or PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true or PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
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
  local pcPosition = (selfPlayer:get()):getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  if (regionInfo:get()):isSafeZone() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_DO_SAFEZONE"))
    return false
  end
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel < 25 or playerLevel > 53 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOLEVEL_ACK"))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
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
  FGlobal_Dialog_SetAllowTutorialPanelShow(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.endPhase = function(self)
  -- function num : 0_4
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Enchant)
  if funcButtonIndex ~= -1 then
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  end
  if self._equipSlotIcon ~= nil then
    (self._equipSlotIcon):EraseAllEffect()
  end
  if self._materialSlotIcon ~= nil then
    (self._materialSlotIcon):EraseAllEffect()
  end
  if self._buttonEnchantApply ~= nil then
    (self._buttonEnchantApply):EraseAllEffect()
  end
  if self._buttonSureSuccess ~= nil then
    (self._buttonSureSuccess):EraseAllEffect()
  end
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.changeStep1 = function(self)
  -- function num : 0_11
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_19"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_20"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Enchant)
      if funcButtonIndex ~= -1 then
        FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
      end
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_21"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_22"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    else
      do
        if self._currentProgress == 3 then
          local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Enchant)
          if funcButtonIndex ~= -1 then
            FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
          end
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_23"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_24"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
        else
          do
            if self._currentProgress == 4 then
              self._equipSlotIcon = (PaGlobal_Enchant:getTargetItemSlot()).icon
              if self._equipSlotIcon ~= nil then
                (self._equipSlotIcon):AddEffect("UI_ArrowMark02", true, 0, -50)
                ;
                (self._equipSlotIcon):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
              end
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_25"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_26"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
            else
              if self._currentProgress == 5 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_27"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_28"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
              else
                if self._currentProgress == 6 then
                  self._equipSlotIcon = (PaGlobal_Enchant:getTargetItemSlot()).icon
                  if self._equipSlotIcon ~= nil then
                    (self._equipSlotIcon):EraseAllEffect()
                  end
                  self._materialSlotIcon = (PaGlobal_Enchant:getMaterialSlot()).icon
                  if self._materialSlotIcon ~= nil then
                    (self._materialSlotIcon):AddEffect("UI_ArrowMark02", true, 0, -50)
                    ;
                    (self._materialSlotIcon):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
                  end
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_29"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_30"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
                else
                  if self._currentProgress == 7 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_31"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_32"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
                  else
                    if self._currentProgress == 8 then
                      self._buttonEnchantApply = (PaGlobal_Enchant:get())._uiButtonApply
                      if self._buttonEnchantApply ~= nil then
                        (self._buttonEnchantApply):AddEffect("UI_ArrowMark02", true, 0, -50)
                        ;
                        (self._buttonEnchantApply):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
                      end
                      if self._materialSlotIcon ~= nil then
                        (self._materialSlotIcon):EraseAllEffect()
                      end
                      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_33"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_34"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
                    else
                      if self._currentProgress == 9 then
                        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_8
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_35"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_36"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
                      else
                        if self._currentProgress == 10 then
                          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_9
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_37"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_38"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
                        else
                          if self._currentProgress == 11 then
                            self._buttonSureSuccess = (PaGlobal_Enchant:get())._uiButtonSureSuccess
                            if self._buttonSureSuccess ~= nil then
                              (self._buttonSureSuccess):AddEffect("UI_ArrowMark02", true, 0, -50)
                              ;
                              (self._buttonSureSuccess):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
                            end
                            if self._buttonEnchantApply ~= nil then
                              (self._buttonEnchantApply):EraseAllEffect()
                            end
                            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_10
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_39"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_40"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
  end
)
                          else
                            if self._currentProgress == 12 then
                              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_11
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_41"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_42"), true, Panel_Window_Enchant:GetPosX() + Panel_Window_Enchant:GetSizeX() * 1.1, Panel_Window_Enchant:GetPosY() - Panel_Window_Enchant:GetSizeY() * 0.025, false)
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

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1ShowDialog = function(self, dialogData)
  -- function num : 0_12
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1ClickedExitButton = function(self, talker)
  -- function num : 0_13
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_14
  if (CppEnums.ContentsType).Contents_Enchant ~= funcButtonType then
    self:endPhase()
  end
  if self._currentProgress == 2 and (CppEnums.ContentsType).Contents_Enchant == funcButtonType then
    self._currentProgress = 3
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1CloseEnchantWindow = function(self)
  -- function num : 0_15
  if self._currentProgress > 2 then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_16
  if self._currentProgress == 12 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleShowDialog = function(self, dialogData)
  -- function num : 0_17
  if self._currentStep == 1 then
    self:eventCallStep1ShowDialog(dialogData)
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleClickedExitButton = function(self, talker)
  -- function num : 0_18
  if self._currentStep == 1 then
    self:eventCallStep1ClickedExitButton(talker)
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1ClickedDialogFuncButton(funcButtonType)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleCloseEnchantWindow = function(self)
  -- function num : 0_20
  if self._currentStep == 1 then
    self:eventCallStep1CloseEnchantWindow()
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Enchant.handleMouseLUpBubble = function(self)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


