-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tutorial\panel_tutorialmenu.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialMenu = {_isFold = true, _lastButtonPosY = 0, _topMarginSize = 20, _marginSize = 10, 
_ui = {_panel = Panel_TutorialMenu, _buttonTutorialMenu = nil, _staticTutorialMenuBg = nil, _buttonTutorialStart1 = nil, _buttonTutorialStart2 = nil}
, _refWeightOverUi = nil}
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_TutorialMenu")
registerEvent("onScreenResize", "FromClient_onScreenResize_TutorialMenu")
FromClient_luaLoadComplete_TutorialMenu = function()
  -- function num : 0_0
  PaGlobal_TutorialMenu:initialize()
end

FromClient_onScreenResize_TutorialMenu = function()
  -- function num : 0_1
  PaGlobal_TutorialMenu:onScreenResize()
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.onScreenResize = function(self)
  -- function num : 0_2
  if ((self._ui)._panel):GetShow() == true then
    self:alignPosByPivotUi()
  end
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.initialize = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._buttonTutorialMenu = (UI.getChildControl)(Panel_TutorialMenu, "Button_TutorialMenu")
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTutorialMenuBg = (UI.getChildControl)((self._ui)._buttonTutorialMenu, "Static_TutorialMenuBg")
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonTutorialStart1 = (UI.getChildControl)((self._ui)._staticTutorialMenuBg, "Button_TutorialStart_1")
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonTutorialStart2 = (UI.getChildControl)((self._ui)._staticTutorialMenuBg, "Button_TutorialStart_2")
  self._isFold = true
  self:setShow(false, false)
  self:alignPosByPivotUi()
  self._refWeightOverUi = PaGlobalPlayerWeightList.weight
  ;
  ((self._ui)._buttonTutorialMenu):addInputEvent("Mouse_LUp", "PaGlobal_TutorialMenu:handleClickedMenuButton()")
  ;
  ((self._ui)._buttonTutorialStart1):addInputEvent("Mouse_LUp", "PaGlobal_TutorialMenu:handleClickedTutorialStartButton(1)")
  ;
  ((self._ui)._buttonTutorialStart2):addInputEvent("Mouse_LUp", "PaGlobal_TutorialMenu:handleClickedTutorialStartButton(2)")
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.setPosX = function(self, posX)
  -- function num : 0_4
  ((self._ui)._panel):SetPosX(posX)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.setPosY = function(self, posY)
  -- function num : 0_5
  ((self._ui)._panel):SetPosY(posY)
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.setShow = function(self, bShow, bShowAni)
  -- function num : 0_6
  if bShow == true then
    self:alignPosByPivotUi()
  end
  Panel_TutorialMenu:SetShow(bShow, bShowAni)
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.checkShowCondition = function(self)
  -- function num : 0_7
  local selfPlayer = getSelfPlayer()
  local playerLevel = (selfPlayer:get()):getLevel()
  if self._refWeightOverUi ~= nil and (self._refWeightOverUi):GetShow() == true and PaGlobal_TutorialPhase_ItemSell._isPhaseOpen == true and playerLevel >= 10 and playerLevel <= 40 then
    return true
  end
  if Panel_NewEquip:GetShow() == true and PaGlobal_TutorialPhase_NewItemEquip._isPhaseOpen == true and playerLevel >= 6 and playerLevel <= 49 then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.alignPosByPivotUi = function(self)
  -- function num : 0_8
  local pivotUi = nil
  local posX = 0
  local posY = 0
  if self._refWeightOverUi ~= nil and (self._refWeightOverUi):GetShow() == true then
    pivotUi = self._refWeightOverUi
    posX = Panel_Endurance:GetPosX() + pivotUi:GetPosX() + pivotUi:GetSizeX() / 2 - ((self._ui)._buttonTutorialMenu):GetSizeX() / 2
    posY = Panel_Endurance:GetPosY() + pivotUi:GetPosY() + pivotUi:GetSizeY() + pivotUi:GetSizeY() / 2
  end
  if pivotUi == nil then
    pivotUi = Panel_NewEquip
    posX = pivotUi:GetPosX() + pivotUi:GetSizeX() - ((self._ui)._buttonTutorialMenu):GetSizeX()
    posY = pivotUi:GetPosY() + pivotUi:GetSizeY()
  end
  self:setPosX(posX)
  self:setPosY(posY)
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.handleClickedMenuButton = function(self)
  -- function num : 0_9
  if self._isFold == true then
    self:unfoldTutorialMenu()
  else
    if self._isFold == false then
      self:foldTutorialMenu()
    end
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.handleClickedTutorialStartButton = function(self, buttonIndex)
  -- function num : 0_10
  if buttonIndex == 1 then
    PaGlobal_TutorialManager:startTutorial(16)
  else
    if buttonIndex == 2 then
      PaGlobal_TutorialManager:startTutorial(17)
    end
  end
  self:foldTutorialMenu()
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.foldTutorialMenu = function(self)
  -- function num : 0_11
  self._isFold = true
  ;
  ((self._ui)._staticTutorialMenuBg):SetShow(false, true)
  ;
  ((self._ui)._buttonTutorialStart1):SetShow(false, true)
  ;
  ((self._ui)._buttonTutorialStart2):SetShow(false, true)
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.unfoldTutorialMenu = function(self)
  -- function num : 0_12
  self._isFold = false
  ;
  ((self._ui)._staticTutorialMenuBg):SetShow(true, true)
  local orderNum = 1
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if self._refWeightOverUi ~= nil and (self._refWeightOverUi):GetShow() == true and PaGlobal_TutorialPhase_ItemSell._isPhaseOpen == true and playerLevel >= 10 and playerLevel <= 40 then
    self:alignPosTutorialStartButton((self._ui)._buttonTutorialStart2, orderNum)
    orderNum = orderNum + 1
  end
  if Panel_NewEquip:GetShow() == true and PaGlobal_TutorialPhase_NewItemEquip._isPhaseOpen == true and playerLevel >= 6 and playerLevel <= 49 then
    self:alignPosTutorialStartButton((self._ui)._buttonTutorialStart1, orderNum)
    orderNum = orderNum + 1
  end
  local bgSizeX = ((self._ui)._staticTutorialMenuBg):GetSizeX()
  local bgSizeY = self._lastButtonPosY + self._topMarginSize * 2
  ;
  ((self._ui)._staticTutorialMenuBg):SetSize(bgSizeX, bgSizeY)
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialMenu.alignPosTutorialStartButton = function(self, tutorialStartButton, orderNum)
  -- function num : 0_13
  if tutorialStartButton == nil then
    _PA_LOG("곽민�\176", "튜토리얼 시작 버튼 정렬 : tutorialStartButton�\180 nil 입니�\164.")
    return 
  end
  if orderNum < 1 then
    _PA_LOG("곽민�\176", "튜토리얼 시작 버튼 정렬 : orderNum�\128 1 이상이어�\188 합니�\164.")
    return 
  end
  if orderNum == 1 then
    self._marginSize = 0
  else
    self._marginSize = 10
  end
  local posX = tutorialStartButton:GetPosX()
  local posY = self._topMarginSize + (orderNum - 1) * (tutorialStartButton:GetSizeY() + self._marginSize)
  self._lastButtonPosY = posY + self._topMarginSize
  tutorialStartButton:SetPosX(posX)
  tutorialStartButton:SetPosY(posY)
  tutorialStartButton:SetShow(true, true)
end


