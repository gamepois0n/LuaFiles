-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase13_hidelworldmap_worker.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_HidelWorldmap_Worker = {_currentStep = 0, _nextStep = 0, _currentProgress = 1, _prevProgress = 1, _updateTime = 0, _isSkippable = true, 
_waypointKeyData = {[1] = 323, [2] = 439}
, 
_talkerCharacterKeyData = {[1] = 41085}
, 
_itemKeyData = {[1] = 64200}
, 
_questData = {}
}
-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.startPhase = function(self, stepNo)
  -- function num : 0_0
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_HidelWorldmap_Worker:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
  self._updateTime = 0
  classType = (getSelfPlayer()):getClassType()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, false)
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.endPhase = function(self)
  -- function num : 0_1
  self._currentProgress = 1
  self._currentStep = 0
  self._nextStep = 1
  FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap})
  FGlobal_Dialog_SetRenderMode({(Defines.RenderMode).eRenderMode_Dialog})
  FGlobal_EraseAllEffect_ExitButton()
  FGlobal_NodeMenu_SetEnableNodeUnlinkButton(true)
  PaGlobal_TutorialUiBlackSpirit:setShowAll(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.updatePerFrame = function(self, deltaTime)
  -- function num : 0_2
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleChangeStep = function(self, currentStep)
  -- function num : 0_3
  if self._currentStep == 1 then
    self:changeStep1()
  else
    if self._currentStep == 2 then
      self:changeStep2()
    else
      if self._currentStep == 3 then
        self:changeStep3()
      end
    end
  end
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.toNextProgress = function(self)
  -- function num : 0_4
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.toNextStep = function(self)
  -- function num : 0_5
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.toStep = function(self, destStep, destProgress)
  -- function num : 0_6
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

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.addEffectUiNodeButtonByWaypointKey = function(self, waypointKey)
  -- function num : 0_7
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if uiNodeButton ~= nil then
    uiNodeButton:EraseAllEffect()
    uiNodeButton:AddEffect("UI_ArrowMark02", true, 0, -50)
    uiNodeButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eraseAllEffectUiNodeButtonByWaypointKey = function(self, waypointKey)
  -- function num : 0_8
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if uiNodeButton ~= nil then
    uiNodeButton:EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.changeStep1 = function(self)
  -- function num : 0_9
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("일꾼 계약서를 받았�\176.\n사용해서 일꾼�\132 고용해보�\144.", "<I>키로 �\128방을 열어�\156\n계약서를 <우클�\173>으로 사용해보�\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiMasking:hideQuestMasking()
      FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap, (Defines.RenderMode).eRenderMode_Tutorial})
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("좋아. 이제 고용�\156 일꾼�\132 확인해보�\144.", "우선 <M>키로 월드맵을 열어�\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        local bottomWorkerButton = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_WorkerList")
        bottomWorkerButton:EraseAllEffect()
        bottomWorkerButton:AddEffect("UI_ArrowMark02", true, 0, -50)
        bottomWorkerButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("오른�\189 하단�\144 표시�\156 일꾼 목록 버튼�\180 보이�\128?", "일꾼 목록 버튼�\132 왼클�\173 해봐.", true, getScreenSizeX() * 0.75, getScreenSizeY() * 0.65)
  end
)
      else
        do
          if self._currentProgress == 4 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("고용�\156 일꾼�\180 보일거야.\n일꾼�\132 고용하면 여러�\128�\128 일을 �\128�\160 시킬 �\152 있어.", "확인했으�\180 <ESC>키나 <M>키를 눌러 월드맵을 닫아.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
          else
            if self._currentProgress == 5 then
              local bottomWorkerButton = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_WorkerList")
              bottomWorkerButton:EraseAllEffect()
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이제 모레�\176 농장으로 �\128�\156 일꾼에게 일을 시켜보자.", "<M>키를 눌러 월드맵을 열어�\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
            else
              do
                if self._currentProgress == 6 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("표시�\156 모레�\176 거대 농장�\180 보이�\128?", "모레�\176 거대 농장 거점�\132 우클�\173 해봐.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
                else
                  if self._currentProgress == 7 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("잘했�\180. 목적�\128�\188 찾아�\128려면 월드맵을 닫아야겠�\128?", "이동해야하니�\140 <ESC>�\152 <M>키를 눌러 월드맵을 닫아.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
                  else
                    if self._currentProgress == -1 then
                      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\156 벌써 �\128도를 닫는거지?", "<M>키를 눌러 월드맵을 열어�\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
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

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1AddEffectEmploymentContract = function(self, slot, slotItemKey)
  -- function num : 0_10
  if self._currentProgress == 1 and (self._itemKeyData)[1] == slotItemKey then
    PaGlobal_Inventory:addSlotEffectForTutorial(slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1InventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_11
  if self._currentProgress == 1 and (self._itemKeyData)[1] == rClickedItemKey then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1WorldMapOpen = function(self)
  -- function num : 0_12
  if self._currentProgress == 2 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == -1 then
      self._currentProgress = self._prevProgress
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1GrandWorldMap_CheckPopup = function(self, openPanelEnum, popupPanel)
  -- function num : 0_13
  if self._currentProgress == 3 and openPanelEnum == 5 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_14
  if self._currentProgress == 3 or self._currentProgress == 6 then
    self._prevProgress = self._currentProgress
    self:toStep(1, -1)
  else
    if self._currentProgress == 4 then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    else
      if self._currentProgress == 7 then
        FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap})
        if isExploreUpgradable((self._waypointKeyData)[1]) == true then
          if isWithdrawablePlant((self._waypointKeyData)[1]) == true then
            self:toStep(3)
          else
            if isWithdrawablePlant((self._waypointKeyData)[1]) == false then
              self:toNextStep()
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_15
  if self._currentProgress == 5 then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == 6 then
      self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
    end
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_16
  if self._currentProgress == 6 then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1RClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_17
  if self._currentProgress == 6 and (self._waypointKeyData)[1] == uiNodeButton:getWaypointKey() then
    self:eraseAllEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.changeStep2 = function(self)
  -- function num : 0_18
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("길안내를 따라�\128�\180 <탐험 거점 �\128리자>메르시안�\144 모레�\176 에게 도달하게 될거�\188.", "길안내를 따라 �\128상을 찾아 말을 걸어보자.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\156 �\128화를 중단했어?\n메르시안�\144 모레티에�\140 말을 걸어.", "�\128화메뉴중�\144 \'탐험 거점 �\128�\172\'버튼�\132 눌러보자.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap, (Defines.RenderMode).eRenderMode_Tutorial})
        local positionTarget = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
        do
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_2 , upvalues : positionTarget
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\180 �\128역에�\156 무역�\132 하고 싶으�\180 공헌도를 투자해야�\188.", "왼쪽 위에 표시�\156 \'공헌�\132 투자\'버튼�\132 눌러보자.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0.5)
  end
)
        end
      else
        do
          while 1 do
            if self._currentProgress == 4 then
              if ToClient_isTownMode() == true then
                FGlobal_WorldMapWindowEscape()
                -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이제 거점간에 연결�\156 선이 붉어�\132 것이 보이�\128?\n이렇�\140 되면 �\144 거점�\180 연결된거�\188.\n이것�\180 너의 �\171 거점 연결�\180 되겠�\176.", "이제 <ESC>키나 <M>키를 눌러 월드맵을 닫아.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep2ShowDialog = function(self, dialogData)
  -- function num : 0_19
  do
    -- DECOMPILER ERROR at PC14: Unhandled construct in 'MakeBoolean' P1

    if self._currentProgress == 1 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
    if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
    end
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep2ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_20
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() and (CppEnums.ContentsType).Contents_Explore == funcButtonType then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep2EventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_21
  if self._currentProgress == 3 and (self._waypointKeyData)[1] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep2WorldMapImmediatelyClose = function(self)
  -- function num : 0_22
  if self._currentProgress == 4 then
    FGlobal_Worldmap_ResetRenderMode()
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.changeStep3 = function(self)
  -- function num : 0_23
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이제 일꾼에게 일을 시킬 �\128비를 �\180 보자.", "\'메르시안�\144 모레�\176\'에게 �\128�\156 말을 걸어�\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("생산 거점�\144 투자 �\180 볼거�\188.\n메르시안�\144 모레티와�\152 �\128화메뉴중�\144 알맞�\128 것이 있지.", "\'탐험 거점 �\128�\172\'버튼�\132 눌러보자.", false, getScreenSizeX() * 0.45, getScreenSizeY() * 0.4)
  end
)
    else
      if self._currentProgress == 3 then
        self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[2])
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("표시�\156 생산 거점�\180 보이�\128?", "\'�\128 재배\'생산 거점�\132 왼클�\173 해봐.", true, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.6)
  end
)
      else
        if self._currentProgress == 4 then
          local positionTarget = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
          do
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_3 , upvalues : positionTarget
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\180 거점에서 생산�\132 하고 싶으�\180 공헌도를 투자해야�\188.", "왼쪽 위에 표시�\156 \'공헌�\132 투자\'버튼�\132 눌러보자.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0.5)
  end
)
          end
        else
          do
            if self._currentProgress == 5 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("고용�\156 일꾼 목록�\180 보이�\128?\n일꾼에게 일을 시켜보자.", "작업 시작 버튼�\132 눌러�\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
            else
              if self._currentProgress == 6 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이런식으�\156 일꾼�\132 생산 거점�\144 보내�\156 일을 시킬 �\152 있어.\n일꾼�\180 일을 하는동안 �\140 모험�\132 계속 �\160 �\152 있지.", "이제 <ESC>키나 <M>키로 월드맵을 닫고 모험�\132 계속하도�\157 �\180.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
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

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3InteractionShow = function(self, actorProxyWrapper)
  -- function num : 0_24
  local isTargetNpc = false
  if self._currentProgress == 1 then
    local actorProxyWrapper = interaction_getInteractable()
    if actorProxyWrapper ~= nil and (self._talkerCharacterKeyData)[1] == actorProxyWrapper:getCharacterKeyRaw() then
      isTargetNpc = true
    end
    if isTargetNpc == true then
      FGlobal_Dialog_SetRenderMode({(Defines.RenderMode).eRenderMode_Dialog, (Defines.RenderMode).eRenderMode_Tutorial})
    else
      FGlobal_Dialog_SetRenderMode({(Defines.RenderMode).eRenderMode_Dialog})
    end
  end
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3ShowDialog = function(self, dialogData)
  -- function num : 0_25
  do
    -- DECOMPILER ERROR at PC14: Unhandled construct in 'MakeBoolean' P1

    if self._currentProgress == 1 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
    if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
    end
  end
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_26
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap, (Defines.RenderMode).eRenderMode_Tutorial})
    if (CppEnums.ContentsType).Contents_Explore == funcButtonType then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3NodeLClick = function(self, uiNodeButton)
  -- function num : 0_27
  if self._currentProgress == 3 and (self._waypointKeyData)[2] == uiNodeButton:getWaypointKey() then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3SetTownMode = function(self, waypointKey)
  -- function num : 0_28
  if self._currentProgress == 3 and (self._waypointKeyData)[1] == waypointKey then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[2])
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3EventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_29
  if self._currentProgress == 4 and (self._waypointKeyData)[2] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3ClickPlantdoWork = function(self, plantKey, workingCount)
  -- function num : 0_30
  if self._currentProgress == 5 then
    _PA_LOG("곽민�\176", "plantKey:getWaypointKey() : " .. tostring(plantKey:getWaypointKey()) .. " / workingCount : " .. tostring(workingCount))
    if (self._waypointKeyData)[2] == plantKey:getWaypointKey() then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3WorldMapImmediatelyClose = function(self)
  -- function num : 0_31
  if self._currentProgress == 6 then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleBeforeWorldmapOpen = function(self)
  -- function num : 0_32
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpen()
  end
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleWorldMapOpenComplete = function(self)
  -- function num : 0_33
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleUpdateInventorySlotData = function(self, slot, slotItemKey)
  -- function num : 0_34
  if self._currentStep == 1 then
    self:eventCallStep1AddEffectEmploymentContract(slot, slotItemKey)
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleInventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_35
  if self._currentStep == 1 then
    self:eventCallStep1InventorySlotRClick(rClickedItemKey)
  end
end

-- DECOMPILER ERROR at PC130: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleGrandWorldMap_CheckPopup = function(self, openPanelEnum, popupPanel)
  -- function num : 0_36
  if self._currentStep == 1 then
    self:eventCallStep1GrandWorldMap_CheckPopup(openPanelEnum, popupPanel)
  end
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_37
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  else
    if self._currentStep == 2 then
      self:eventCallStep2WorldMapImmediatelyClose()
    else
      if self._currentStep == 3 then
        self:eventCallStep3WorldMapImmediatelyClose()
      end
    end
  end
end

-- DECOMPILER ERROR at PC136: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleResetTownMode = function(self)
  -- function num : 0_38
  if self._currentStep == 1 then
    self:eventCallStep1ResetTownMode()
  end
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_39
  if self._currentStep == 3 then
    self:eventCallStep3NodeLClick(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC142: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleRClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_40
  if self._currentStep == 1 then
    self:eventCallStep1RClickWorldMapNode(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC145: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleInteractionShow = function(self, actorProxyWrapper)
  -- function num : 0_41
  if self._currentStep == 3 then
    self:eventCallStep3InteractionShow(actorProxyWrapper)
  end
end

-- DECOMPILER ERROR at PC148: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleShowDialog = function(self, dialogData)
  -- function num : 0_42
  if self._currentStep == 2 then
    self:eventCallStep2ShowDialog(dialogData)
  else
    if self._currentStep == 3 then
      self:eventCallStep3ShowDialog(dialogData)
    end
  end
end

-- DECOMPILER ERROR at PC151: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_43
  if self._currentStep == 2 then
    self:eventCallStep2ClickedDialogFuncButton(funcButtonType)
  else
    if self._currentStep == 3 then
      self:eventCallStep3ClickedDialogFuncButton(funcButtonType)
    end
  end
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleEventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_44
  if self._currentStep == 2 then
    self:eventCallStep2EventUpdateExplorationNode(waypointKey)
  else
    if self._currentStep == 3 then
      self:eventCallStep3EventUpdateExplorationNode(waypointKey)
    end
  end
end

-- DECOMPILER ERROR at PC157: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleClickPlantdoWork = function(self, plantKey, workingCount)
  -- function num : 0_45
  if self._currentStep == 3 then
    self:eventCallStep3ClickPlantdoWork(plantKey, workingCount)
  end
end

-- DECOMPILER ERROR at PC160: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleSetTownMode = function(self, waypointKey)
  -- function num : 0_46
  if self._currentStep == 3 then
    self:eventCallStep3SetTownMode(waypointKey)
  end
end


