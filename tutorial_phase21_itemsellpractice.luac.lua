-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase21_itemsellpractice.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_ItemSellPractice = {_phaseNo = 21, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = false, _radioButtonSell = nil, _npcShopSpiritPosX = 0, _npcShopSpiritPosY = 0, _buttonSellAll = nil}
-- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("곽민�\176", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true or PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true or PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
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
  if playerLevel < 10 or playerLevel > 40 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOLEVEL_ACK"))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_ItemSellPractice:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
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

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.endPhase = function(self)
  -- function num : 0_4
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Shop)
  if funcButtonIndex ~= -1 then
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  end
  if self._radioButtonSell ~= nil then
    (self._radioButtonSell):EraseAllEffect()
  end
  if self._buttonSellAll ~= nil then
    (self._buttonSellAll):EraseAllEffect()
  end
  if self._checkButton_Warehouse ~= nil then
    (self._checkButton_Warehouse):EraseAllEffect()
  end
  if self._checkButton_Inventory ~= nil then
    (self._checkButton_Inventory):EraseAllEffect()
  end
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.toStep = function(self, destStep, destProgress)
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

PaGlobal_TutorialPhase_ItemSellPractice.setEffectDialogButtonByType = function(self, funcButtonType)
  -- function num : 0_10
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(funcButtonType)
  if funcButtonIndex == -1 then
    return false
  end
  FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  return true
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.calcSpiritPosForNpcShopWindow = function(self)
  -- function num : 0_11
  local spiritPosX = 0
  local spiritPosY = 0
  spiritPosX = Panel_Window_NpcShop:GetPosX() + Panel_Window_NpcShop:GetSizeX() * 0.8
  spiritPosY = Panel_Window_NpcShop:GetPosY() + Panel_Window_NpcShop:GetSizeY() * 1.025
  return spiritPosX, spiritPosY
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.changeStep1 = function(self)
  -- function num : 0_12
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_77"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_78"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      self:setEffectDialogButtonByType((CppEnums.ContentsType).Contents_Shop)
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_79"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_80"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    else
      if self._currentProgress == 3 then
        local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Shop)
        if funcButtonIndex ~= -1 then
          FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
        end
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_81"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_82"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
      else
        do
          if self._currentProgress == 4 then
            self._radioButtonSell = FGlobal_NpcShop_GetRadioButtonByIndex(1)
            if self._radioButtonSell ~= nil then
              (self._radioButtonSell):AddEffect("UI_ArrowMark08", true, 0, 50)
              ;
              (self._radioButtonSell):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
            end
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_83"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_84"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
          else
            if self._currentProgress == 5 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_85"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_86"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
            else
              if self._currentProgress == 6 then
                self._buttonSellAll = (FGlobal_NpcShop_GetNpcShop()).buttonSellAll
                if self._buttonSellAll ~= nil then
                  (self._buttonSellAll):AddEffect("UI_ArrowMark02", true, 0, -50)
                  ;
                  (self._buttonSellAll):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
                end
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_87"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_88"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
              else
                if self._currentProgress == 7 then
                  if self._buttonSellAll ~= nil then
                    (self._buttonSellAll):EraseAllEffect()
                  end
                  self._checkButton_Inventory = (FGlobal_NpcShop_GetNpcShop()).checkButton_Inventory
                  self._checkButton_Warehouse = (FGlobal_NpcShop_GetNpcShop()).checkButton_Warehouse
                  if self._checkButton_Inventory ~= nil then
                    (self._checkButton_Inventory):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
                    ;
                    (self._checkButton_Inventory):AddEffect("UI_ArrowMark06", true, -50, 0)
                  end
                  if self._checkButton_Warehouse ~= nil then
                    (self._checkButton_Warehouse):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
                    ;
                    (self._checkButton_Warehouse):AddEffect("UI_ArrowMark06", true, -50, 0)
                  end
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_89"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_90"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                else
                  if self._currentProgress == 8 then
                    if self._checkButton_Warehouse ~= nil then
                      (self._checkButton_Warehouse):EraseAllEffect()
                    end
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_91"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_92"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                  else
                    if self._currentProgress == 9 then
                      if self._checkButton_Inventory ~= nil then
                        (self._checkButton_Inventory):EraseAllEffect()
                      end
                      if self._checkButton_Warehouse ~= nil then
                        (self._checkButton_Warehouse):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
                        ;
                        (self._checkButton_Warehouse):AddEffect("UI_ArrowMark06", true, -50, 0)
                      end
                      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_8
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_93"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_94"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                    else
                      if self._currentProgress == 10 then
                        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_9
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_95"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_96"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                      else
                        if self._currentProgress == 11 then
                          if self._checkButton_Warehouse ~= nil then
                            (self._checkButton_Warehouse):EraseAllEffect()
                          end
                          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_10
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_97"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_98"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
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

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.eventCallStep1ClickedExitButton = function(self, talker)
  -- function num : 0_13
  self:endPhase()
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.eventCallStep1ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_14
  if (CppEnums.ContentsType).Contents_Shop ~= funcButtonType then
    self:endPhase()
  end
  if self._currentProgress == 2 and (CppEnums.ContentsType).Contents_Shop == funcButtonType then
    self._currentProgress = 3
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.eventCallStep1NpcShopWindowClose = function(self)
  -- function num : 0_15
  if self._currentProgress > 2 then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.eventCallStep1NpcShopTabButtonClick = function(self, tabIndex)
  -- function num : 0_16
  if self._currentProgress == 4 then
    if tabIndex == 1 then
      if self._radioButtonSell ~= nil then
        (self._radioButtonSell):EraseAllEffect()
      end
      self._currentProgress = 5
      self:handleChangeStep(self._currentStep)
    else
      if self._radioButtonSell ~= nil then
        (self._radioButtonSell):AddEffect("UI_ArrowMark08", true, 0, 50)
        ;
        (self._radioButtonSell):AddEffect("UI_WorldMap_Ping01", true, 0, 0)
      end
    end
  else
    if self._currentProgress >= 5 and tabIndex ~= 1 then
      self:endPhase()
    end
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_17
  if self._currentProgress == 11 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.handleClickedExitButton = function(self, talker)
  -- function num : 0_18
  if self._currentStep == 1 then
    self:eventCallStep1ClickedExitButton(talker)
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.handleNpcShopWindowClose = function(self)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1NpcShopWindowClose()
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.handleNpcShopTabButtonClick = function(self, tabIndex)
  -- function num : 0_20
  if self._currentStep == 1 then
    self:eventCallStep1NpcShopTabButtonClick(tabIndex)
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1ClickedDialogFuncButton(funcButtonType)
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_ItemSellPractice.handleMouseLUpBubble = function(self)
  -- function num : 0_22
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


