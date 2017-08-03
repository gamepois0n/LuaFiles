-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_phase11_worldmapbuyhouse.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_WorldmapBuyHouse = {_phaseNo = 11, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 0, _updateTime = 0, _isPhaseOpen = true, _isSkippable = false, _currentHouseKey = -1, 
_purchaseableHouseButtonList = {}
, 
_nodeWaypointKeyList = {1, 301, 601, 1101, 1301, 61, 604, 608, 602, 302, 1141, 1319, 1314, 1343, 1380, 1002}
}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("곽민�\176", "튜토리얼 Phase�\128 닫혀있으�\128�\156 튜토리얼�\132 시작하지 않습니다. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true or PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true or PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_WorldmapBuyHouse:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.endPhase = function(self)
  -- function num : 0_4
  self._purchaseableHouseButtonList = {}
  if self._currentHouseKey ~= -1 then
    HouseControlManager:EraseAllEffectGroupTypeButtonByHouseKey(self._currentHouseKey, (CppEnums.eHouseUseType).Empty)
  end
  HouseControlManager:EraseAllEffectBuyButton()
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialUiBlackSpirit:setIgnoreBubble(true)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.toStep = function(self, destStep, destProgress)
  -- function num : 0_9
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.setEffectNodeWaypointKeyList = function(self, waypointKey)
  -- function num : 0_10
  for index,value in ipairs(self._nodeWaypointKeyList) do
    FGlobal_WorldmapMain_EraseAllEffectUiNodeButtonByWaypointKey(value)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_ArrowMark02", true, 0, -50)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.changeStep1 = function(self)
  -- function num : 0_11
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_45"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_46"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == -1 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_47"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_48"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    else
      if self._currentProgress == 2 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_49"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
      else
        if self._currentProgress == 3 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_50"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
        else
          if self._currentProgress == 4 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_51"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
          else
            if self._currentProgress == 5 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_52"), "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
            else
              if self._currentProgress == 6 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_53"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_54"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
                self:setEffectNodeWaypointKeyList()
              else
                if self._currentProgress == 7 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_55"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_56"), false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, true)
  end
)
                else
                  if self._currentProgress == 8 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_8
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_57"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_58"), false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, true)
  end
)
                  else
                    if self._currentProgress == 9 then
                      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_9
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_59"), "", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, false)
  end
)
                    else
                      if self._currentProgress == 10 then
                        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_10
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_60"), "", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, false)
  end
)
                      else
                        if self._currentProgress == 11 then
                          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_11
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_61"), "", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, false)
  end
)
                        else
                          if self._currentProgress == 12 then
                            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_11_12
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_62"), "", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, false)
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

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_12
  if self._currentProgress == -1 then
    if self._prevProgress >= 6 and self._prevProgress <= 8 then
      self._currentProgress = 6
      self:handleChangeStep(self._currentStep)
      self:setEffectNodeWaypointKeyList()
    else
      self._currentProgress = self._prevProgress
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_13
  if self._currentHouseKey ~= -1 then
    HouseControlManager:EraseAllEffectGroupTypeButtonByHouseKey(self._currentHouseKey, (CppEnums.eHouseUseType).Empty)
    HouseControlManager:EraseAllEffectBuyButton()
    HouseControlManager:SetEnableBuyButton(true)
    HouseControlManager:SetEnableChangeUseTypeButton(true)
  end
  self._currentHouseKey = -1
  if self._currentProgress <= 8 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1NodeLClick = function(self, uiNodeButton)
  -- function num : 0_14
  self._purchaseableHouseButtonList = {}
  if self._currentProgress == 6 then
    for index,value in ipairs(self._nodeWaypointKeyList) do
      if value == uiNodeButton:getWaypointKey() then
        self:toNextProgress()
        return 
      end
    end
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1HouseHoldButtonSetBaseTexture = function(self, uiHouseButton)
  -- function num : 0_15
  if self._currentProgress == 7 or self._currentProgress == 8 then
    if uiHouseButton == nil then
      return 
    end
    local houseInfoSSW = uiHouseButton:FromClient_getStaticStatus()
    if houseInfoSSW == nil then
      _PA_ASSERT(false, "하이델_집구�\164 튜토리얼 : 집의 고정정보�\188 찾을 �\152 없습니다.")
      return 
    end
    local houseKey = houseInfoSSW:getHouseKey()
    if ToClient_IsMyHouse(houseKey) == false and houseInfoSSW:isPurchasable((CppEnums.eHouseUseType).Depot) == true then
      (table.insert)(self._purchaseableHouseButtonList, uiHouseButton)
    end
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1SetTownMode = function(self, waypointKey)
  -- function num : 0_16
  if self._currentProgress == 7 or self._currentProgress == 8 then
    for index,value in ipairs(self._purchaseableHouseButtonList) do
      value:EraseAllEffect()
      value:AddEffect("UI_ArrowMark01", true, 30, -30)
      value:AddEffect("UI_ItemInstall", true, 0, 0)
    end
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_17
  self._purchaseableHouseButtonList = {}
  if self._currentProgress >= 6 and self._currentProgress <= 8 then
    self:setEffectNodeWaypointKeyList()
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1LClickedWorldMapHouse = function(self, uiHouseButton)
  -- function num : 0_18
  FGlobal_Set_HousePanelPos_ForWorldmapTutorial()
  if uiHouseButton:FromClient_getStaticStatus() == nil then
    _PA_ASSERT(false, "하이델_집구�\164 튜토리얼 : 선택�\156 집의 고정정보�\188 찾을 �\152 없습니다.")
    return 
  end
  local houseInfoSSW = uiHouseButton:FromClient_getStaticStatus()
  local houseKey = (uiHouseButton:FromClient_getStaticStatus()):getHouseKey()
  self._currentHouseKey = houseKey
  if (self._currentProgress == 7 or self._currentProgress == 8) and ToClient_IsMyHouse(houseKey) == false and houseInfoSSW:isPurchasable((CppEnums.eHouseUseType).Depot) == true then
    HouseControlManager:EraseAllEffectGroupTypeButtonByHouseKey(houseKey, (CppEnums.eHouseUseType).Empty)
    HouseControlManager:AddEffectGroupTypeButtonByHouseKey(houseKey, (CppEnums.eHouseUseType).Empty, "UI_ArrowMark07", true, 0, 25)
    if self._currentProgress == 7 then
      self:toNextProgress()
    end
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1CloseHouseControl = function(self)
  -- function num : 0_19
  if self._currentHouseKey ~= -1 then
    HouseControlManager:EraseAllEffectGroupTypeButtonByHouseKey(self._currentHouseKey, (CppEnums.eHouseUseType).Empty)
    HouseControlManager:EraseAllEffectBuyButton()
    HouseControlManager:SetEnableBuyButton(true)
    HouseControlManager:SetEnableChangeUseTypeButton(true)
  end
  self._currentHouseKey = -1
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1ClickedHouseControlSetUseType = function(self, index, groupType)
  -- function num : 0_20
  if self._currentProgress == 8 then
    if self._currentHouseKey == -1 then
      return 
    end
    local uiHouseButton = ToClient_findHouseButtonByKey(self._currentHouseKey)
    if (CppEnums.eHouseUseType).Empty == groupType then
      HouseControlManager:EraseAllEffectGroupTypeButtonByHouseKey(self._currentHouseKey, (CppEnums.eHouseUseType).Empty)
      HouseControlManager:EraseAllEffectBuyButton()
      HouseControlManager:AddEffectBuyButton("UI_ArrowMark07", true, 50, 25)
      self:toNextProgress()
    else
      HouseControlManager:EraseAllEffectGroupTypeButtonByHouseKey(self._currentHouseKey, (CppEnums.eHouseUseType).Empty)
      HouseControlManager:AddEffectGroupTypeButtonByHouseKey(self._currentHouseKey, (CppEnums.eHouseUseType).Empty, "UI_ArrowMark07", true, 0, 25)
      HouseControlManager:EraseAllEffectBuyButton()
    end
  end
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_21
  if self._currentProgress == 12 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleWorldMapOpenComplete = function(self)
  -- function num : 0_22
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_23
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  end
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleHouseHoldButtonSetBaseTexture = function(self, uiHouseButton)
  -- function num : 0_24
  if self._currentStep == 1 then
    self:eventCallStep1HouseHoldButtonSetBaseTexture(uiHouseButton)
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_25
  if self._currentStep == 1 then
    self:eventCallStep1NodeLClick(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleSetTownMode = function(self, waypointKey)
  -- function num : 0_26
  if self._currentStep == 1 then
    self:eventCallStep1SetTownMode(waypointKey)
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleResetTownMode = function(self)
  -- function num : 0_27
  self:eventCallStep1ResetTownMode()
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleLClickedWorldMapHouse = function(self, uiHouseButton)
  -- function num : 0_28
  if self._currentStep == 1 then
    self:eventCallStep1LClickedWorldMapHouse(uiHouseButton)
  end
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleClickedHouseControlSetUseType = function(self, index, groupType)
  -- function num : 0_29
  if self._currentStep == 1 then
    self:eventCallStep1ClickedHouseControlSetUseType(index, groupType)
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleCloseHouseControl = function(self)
  -- function num : 0_30
  if self._currentStep == 1 then
    self:eventCallStep1CloseHouseControl()
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBuyHouse.handleMouseLUpBubble = function(self)
  -- function num : 0_31
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


