-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase11_hidelworldmap_house.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_HidelWorldmap_House = {_currentStep = 0, _nextStep = 0, _currentProgress = 1, _prevProgress = 1, _updateTime = 0, _isSkippable = true, _currentHouseKey = -1, 
_purchaseableHouseButtonList = {}
, 
_nodeWaypointKeyList = {1, 301, 601, 1101, 1301, 61, 604, 608, 602, 302, 1141, 1319, 1314, 1343, 1380, 1002}
}
-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.startPhase = function(self, stepNo)
  -- function num : 0_0
  _PA_LOG("곽민�\176", "PaGlobal_TutorialPhase_HidelWorldmap_House:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
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

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.endPhase = function(self)
  -- function num : 0_1
  self._currentProgress = 1
  self._currentStep = 0
  self._nextStep = 1
  self._purchaseableHouseButtonList = {}
  if self._currentHouseKey ~= -1 then
    HouseControlManager:EraseAllEffectGroupTypeButtonByHouseKey(self._currentHouseKey, (CppEnums.eHouseUseType).Empty)
  end
  HouseControlManager:EraseAllEffectBuyButton()
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialUiBlackSpirit:setIgnoreBubble(true)
  PaGlobal_TutorialUiBlackSpirit:setShowAll(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.updatePerFrame = function(self, deltaTime)
  -- function num : 0_2
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleChangeStep = function(self, currentStep)
  -- function num : 0_3
  if self._currentStep == 1 then
    self:changeStep1()
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.toNextProgress = function(self)
  -- function num : 0_4
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.toNextStep = function(self)
  -- function num : 0_5
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.toStep = function(self, destStep, destProgress)
  -- function num : 0_6
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.setEffectNodeWaypointKeyList = function(self, waypointKey)
  -- function num : 0_7
  for index,value in ipairs(self._nodeWaypointKeyList) do
    FGlobal_WorldmapMain_EraseAllEffectUiNodeButtonByWaypointKey(value)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_ArrowMark02", true, 0, -50)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.changeStep1 = function(self)
  -- function num : 0_8
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("좋아. 주거�\128�\128 궁금하다 이거�\128?", "설명�\132 계속 듣고싶으�\180 �\180 말풍선을 클릭해봐.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == -1 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\156 벌써 월드맵을 닫는거지?", "어서 <M>키로 월드맵을 열어!", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
    else
      if self._currentProgress == 2 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("주거�\128�\148 나만�\152 집인�\176...(주거�\128 개요 설명)...�\128�\172 1", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
      else
        if self._currentProgress == 3 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("그래�\156 주거�\128�\128 있으�\180...(요리/연금�\177 설명)...�\128�\172 2", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
        else
          if self._currentProgress == 4 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("심지어는...(�\128�\172/속옷/기타기능 설명)...�\128�\172 3", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
          else
            if self._currentProgress == 5 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("이제 주거�\128�\144 �\128해서 �\128�\169 알았으니 구매하는 방법�\132 알려줄게.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
            else
              if self._currentProgress == 6 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("집을 구매�\160 �\152 있는 거점중에 몇군데를 눈에 띄게 표시해봤�\180.", "표시�\156 거점�\145 마음�\144 드는곳을 왼클�\173 해봐.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
                self:setEffectNodeWaypointKeyList()
              else
                if self._currentProgress == 7 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("표시�\156 파란 집들�\180 보이�\128? 구매�\128 �\128능한 집들이야.\n하지�\140 주거�\128�\152 경우에는 어떤 집이라도 구매�\128 �\128능하�\128.", "마음�\144 드는 집을 왼클�\173 해봐.", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, true)
  end
)
                else
                  if self._currentProgress == 8 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_8
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("좋아. 집은 원하�\148 용도�\144 따라 조건�\132 충족하면 구매�\160 �\152 있어.", "�\128금은 주거�\128�\188 선택�\180 �\144.", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, true)
  end
)
                  else
                    if self._currentProgress == 9 then
                      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_9
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("용도�\188 선택했으�\180 구매�\160 �\152 있어.\n구매하면 이제�\128터는 너의 집이 되는거야.", "", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, false)
  end
)
                    else
                      if self._currentProgress == 10 then
                        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_10
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("�\144, 구매�\156 집은 언제든지 매각�\160 �\152 있어.", "", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, false)
  end
)
                      else
                        if self._currentProgress == 11 then
                          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_11
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("구매�\144 쓰인 공헌도도 모두 돌려받으니까, 맘껏 이용하라�\160.", "", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, false)
  end
)
                        else
                          if self._currentProgress == 12 then
                            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_8_12
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("그럼, 궁금한것�\180 생기�\180 다시 불러�\152.", "[튜토리얼 종료]", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.05, false)
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

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_9
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

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_10
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

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1NodeLClick = function(self, uiNodeButton)
  -- function num : 0_11
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

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1HouseHoldButtonSetBaseTexture = function(self, uiHouseButton)
  -- function num : 0_12
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

-- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1SetTownMode = function(self, waypointKey)
  -- function num : 0_13
  if self._currentProgress == 7 or self._currentProgress == 8 then
    for index,value in ipairs(self._purchaseableHouseButtonList) do
      value:EraseAllEffect()
      value:AddEffect("UI_ArrowMark01", true, 30, -30)
      value:AddEffect("UI_ItemInstall", true, 0, 0)
    end
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_14
  self._purchaseableHouseButtonList = {}
  if self._currentProgress >= 6 and self._currentProgress <= 8 then
    self:setEffectNodeWaypointKeyList()
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1LClickedWorldMapHouse = function(self, uiHouseButton)
  -- function num : 0_15
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

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1CloseHouseControl = function(self)
  -- function num : 0_16
  if self._currentHouseKey ~= -1 then
    HouseControlManager:EraseAllEffectGroupTypeButtonByHouseKey(self._currentHouseKey, (CppEnums.eHouseUseType).Empty)
    HouseControlManager:EraseAllEffectBuyButton()
    HouseControlManager:SetEnableBuyButton(true)
    HouseControlManager:SetEnableChangeUseTypeButton(true)
  end
  self._currentHouseKey = -1
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1ClickedHouseControlSetUseType = function(self, index, groupType)
  -- function num : 0_17
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

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_18
  if self._currentProgress == 12 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleWorldMapOpenComplete = function(self)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_20
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  end
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleHouseHoldButtonSetBaseTexture = function(self, uiHouseButton)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1HouseHoldButtonSetBaseTexture(uiHouseButton)
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_22
  if self._currentStep == 1 then
    self:eventCallStep1NodeLClick(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleSetTownMode = function(self, waypointKey)
  -- function num : 0_23
  if self._currentStep == 1 then
    self:eventCallStep1SetTownMode(waypointKey)
  end
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleResetTownMode = function(self)
  -- function num : 0_24
  self:eventCallStep1ResetTownMode()
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleLClickedWorldMapHouse = function(self, uiHouseButton)
  -- function num : 0_25
  if self._currentStep == 1 then
    self:eventCallStep1LClickedWorldMapHouse(uiHouseButton)
  end
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleClickedHouseControlSetUseType = function(self, index, groupType)
  -- function num : 0_26
  if self._currentStep == 1 then
    self:eventCallStep1ClickedHouseControlSetUseType(index, groupType)
  end
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleCloseHouseControl = function(self)
  -- function num : 0_27
  if self._currentStep == 1 then
    self:eventCallStep1CloseHouseControl()
  end
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_House.handleMouseLUpBubble = function(self)
  -- function num : 0_28
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


