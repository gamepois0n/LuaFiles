Panel_ConsoleKeyGuide:SetShow(ToClient_isConsole())
local _panel = Panel_ConsoleKeyGuide
local _actionType = CppEnums.ActionInputType
local ConsoleKeyGuide = {
  _ui = {
    _keyGuide = {}
  },
  _guideState = {
    battle = 0,
    common = 1,
    cameraMode = 2,
    crouch = 3,
    creep = 4,
    rideHorse = 5,
    rideShip = 6,
    watchingMode = 7,
    searchMode = 8,
    fishingIdleMode = 9,
    fishingWaitHookMode = 10,
    fishingStartHook = 11,
    fishingHookMini1 = 12,
    fishingHookMini2 = 13,
    rideCarriage = 14,
    screenshotGuide = 15,
    swimmingMode = 16,
    swimWaitMode = 17,
    swimRestMode = 18,
    miniGameMode = 19,
    matchlock = 20,
    packing = 21,
    undefined = 999
  },
  _actionStringTable = {},
  _isChange = false,
  _beforeState = -1,
  _glowFontColor = 4278190080,
  _maxConsoleGuideType = 0,
  _gapY = 40,
  _gapX = 45,
  _gapIconX = 15,
  _specifyGuideState = nil,
  _manualGuideState = nil
}
local _consoleUIIconName = {
  buttonA = 0,
  buttonX = 1,
  buttonY = 2,
  buttonB = 3,
  buttonRSC = 4,
  buttonLSC = 5,
  buttonRSM = 6,
  buttonLSM = 7,
  buttonLB = 8,
  buttonRB = 9,
  buttonLT = 10,
  buttonRT = 11,
  buttonStart = 12,
  IconPlus = 13,
  IconOr = 14,
  buttonDpad = 15,
  buttonDpadUp = 16,
  buttonDpadDown = 17,
  buttonDpadLeft = 18,
  buttonDpadRight = 19
}
local _consoleUIIconUV = {
  [0] = {
    x1 = 1,
    y1 = 1,
    x2 = 45,
    y2 = 45
  },
  {
    x1 = 136,
    y1 = 1,
    x2 = 180,
    y2 = 45
  },
  {
    x1 = 46,
    y1 = 1,
    x2 = 90,
    y2 = 45
  },
  {
    x1 = 91,
    y1 = 1,
    x2 = 135,
    y2 = 45
  },
  {
    x1 = 46,
    y1 = 91,
    x2 = 90,
    y2 = 135
  },
  {
    x1 = 1,
    y1 = 91,
    x2 = 45,
    y2 = 135
  },
  {
    x1 = 91,
    y1 = 46,
    x2 = 135,
    y2 = 90
  },
  {
    x1 = 136,
    y1 = 46,
    x2 = 180,
    y2 = 90
  },
  {
    x1 = 91,
    y1 = 136,
    x2 = 135,
    y2 = 180
  },
  {
    x1 = 136,
    y1 = 136,
    x2 = 180,
    y2 = 180
  },
  {
    x1 = 46,
    y1 = 181,
    x2 = 90,
    y2 = 225
  },
  {
    x1 = 1,
    y1 = 181,
    x2 = 45,
    y2 = 225
  },
  {
    x1 = 46,
    y1 = 46,
    x2 = 90,
    y2 = 90
  },
  {
    x1 = 91,
    y1 = 181,
    x2 = 103,
    y2 = 225
  },
  {
    x1 = 104,
    y1 = 181,
    x2 = 116,
    y2 = 225
  },
  {
    x1 = 181,
    y1 = 181,
    x2 = 225,
    y2 = 225
  },
  {
    x1 = 181,
    y1 = 136,
    x2 = 225,
    y2 = 180
  },
  {
    x1 = 181,
    y1 = 46,
    x2 = 225,
    y2 = 90
  },
  {
    x1 = 181,
    y1 = 91,
    x2 = 225,
    y2 = 135
  },
  {
    x1 = 181,
    y1 = 1,
    x2 = 225,
    y2 = 45
  }
}
local _miniGamePanel = {
  [1] = Panel_Global_Manual,
  [2] = Panel_MiniGame_Timing,
  [3] = Panel_Minigame_Gradient,
  [4] = Panel_RhythmGame,
  [5] = Panel_RhythmGame_Drum,
  [6] = Panel_BattleGauge,
  [7] = Panel_MiniGame_Gradient_Y
}
function ConsoleKeyGuide:init()
  self:initActionString()
  self._ui.guideBg = UI.getChildControl(_panel, "Static_KeyGuideBg")
  self._ui.consoleUITemplate = UI.getChildControl(self._ui.guideBg, "Static_ConsoleKey")
  self._ui.keyStringTemplate = UI.getChildControl(self._ui.guideBg, "StaticText_KeyDesc")
  self:updateGuide()
  self:hideAllGuide()
  self:registEvent()
end
function ConsoleKeyGuide:updateGuide()
  self._ui._keyGuide[self._guideState.battle] = self:makeNewGuide(self._guideState.battle)
  self._ui._keyGuide[self._guideState.common] = self:makeNewGuide(self._guideState.common)
  self._ui._keyGuide[self._guideState.screenshotGuide] = self:makeNewGuide(self._guideState.screenshotGuide)
  self._ui._keyGuide[self._guideState.cameraMode] = self:makeNewGuide(self._guideState.cameraMode)
  self._ui._keyGuide[self._guideState.crouch] = self:makeNewGuide(self._guideState.crouch)
  self._ui._keyGuide[self._guideState.creep] = self:makeNewGuide(self._guideState.creep)
  self._ui._keyGuide[self._guideState.rideHorse] = self:makeNewGuide(self._guideState.rideHorse)
  self._ui._keyGuide[self._guideState.rideShip] = self:makeNewGuide(self._guideState.rideShip)
  self._ui._keyGuide[self._guideState.watchingMode] = self:makeNewGuide(self._guideState.watchingMode)
  self._ui._keyGuide[self._guideState.searchMode] = self:makeNewGuide(self._guideState.searchMode)
  self._ui._keyGuide[self._guideState.fishingIdleMode] = self:makeNewGuide(self._guideState.fishingIdleMode)
  self._ui._keyGuide[self._guideState.fishingWaitHookMode] = self:makeNewGuide(self._guideState.fishingWaitHookMode)
  self._ui._keyGuide[self._guideState.fishingStartHook] = self:makeNewGuide(self._guideState.fishingStartHook)
  self._ui._keyGuide[self._guideState.fishingHookMini1] = self:makeNewGuide(self._guideState.fishingHookMini1)
  self._ui._keyGuide[self._guideState.fishingHookMini2] = self:makeNewGuide(self._guideState.fishingHookMini2)
  self._ui._keyGuide[self._guideState.rideCarriage] = self:makeNewGuide(self._guideState.rideCarriage)
  self._ui._keyGuide[self._guideState.swimmingMode] = self:makeNewGuide(self._guideState.swimmingMode)
  self._ui._keyGuide[self._guideState.swimWaitMode] = self:makeNewGuide(self._guideState.swimWaitMode)
  self._ui._keyGuide[self._guideState.swimRestMode] = self:makeNewGuide(self._guideState.swimRestMode)
  self._ui._keyGuide[self._guideState.matchlock] = self:makeNewGuide(self._guideState.matchlock)
  self._ui._keyGuide[self._guideState.packing] = self:makeNewGuide(self._guideState.packing)
  self._ui._keyGuide[self._guideState.undefined] = self:makeNewGuide(self._guideState.undefined)
end
function ConsoleKeyGuide:initActionString()
  self._actionStringTable[_actionType.ActionInputType_Attack1] = "Main attack"
  self._actionStringTable[_actionType.ActionInputType_Attack2] = "Secondary attack"
  self._actionStringTable[_actionType.ActionInputType_WeaponInOut] = "Put Away Weapon"
  self._actionStringTable[_actionType.ActionInputType_Jump] = "Jump"
  self._actionStringTable[_actionType.ActionInputType_Dash] = "Sprint"
  self._actionStringTable[_actionType.ActionInputType_Interaction] = "Interact"
  self._actionStringTable[_actionType.ActionInputType_Kick] = "Kick(Combat Action 1)"
  self._actionStringTable[_actionType.ActionInputType_CrouchOrSkill] = "Block(Combat Action 2)"
  self._actionStringTable[_actionType.ActionInputType_GrabOrGuard] = "Grapple(Combat Action 3)"
end
function ConsoleKeyGuide:registEvent()
  registerEvent("onScreenResize", "PaGlobalFunc_ConsoleKeyGuide_SetPos")
  registerEvent("EventSelfPlayerRideOn", "PaGlobalFunc_ConsoleKeyGuide_SetRideState()")
  registerEvent("EventSelfPlayerRideOff", "PaGlobalFunc_ConsoleKeyGuide_SetRideState()")
  registerEvent("EventQuestSearch", "PaGlobalFunc_ConsoleKeyGuide_SetSearchState()")
end
function ConsoleKeyGuide:setGlowFont(control)
  control:useGlowFont(true, "SubTitleFont_14_Glow", self._glowFontColor)
end
function ConsoleKeyGuide:setGuide(currentState)
  if currentState == self._beforeState then
  end
  if self._guideState.undefined == currentState then
    ConsoleKeyGuide:hideAllGuide()
    return
  end
  if true == PaGlobal_TutorialManager:isDoingTutorial() then
    ConsoleKeyGuide:hideAllGuide()
    return
  end
  self._beforeState = currentState
  for index = 0, self._maxConsoleGuideType - 1 do
    if nil ~= self._ui._keyGuide[index] then
      self._ui._keyGuide[index].guideBg:SetShow(index == currentState)
    end
  end
end
function ConsoleKeyGuide:hideAllGuide()
  for index = 0, self._maxConsoleGuideType - 1 do
    if nil ~= self._ui._keyGuide[index] then
      self._ui._keyGuide[index].guideBg:SetShow(false)
    end
  end
end
function ConsoleKeyGuide:makeNewGuide(state_)
  local newGuide = {}
  newGuide.guideBg = UI.createAndCopyBasePropertyControl(_panel, "Static_KeyGuideBg", _panel, "GuideBg_" .. state_)
  newGuide.consoleUI = {}
  newGuide.keyString = {}
  newGuide.guideIdx = 0
  newGuide.state = state_
  if state_ == self._guideState.battle then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Attack2, "Secondary attack")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Attack1, "Main attack")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Interaction, "Interact")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "Jump")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "Sprint")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_WeaponInOut, "Put Away Weapon")
  elseif state_ == self._guideState.common then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "Jump")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "Sprint")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_WeaponInOut, "(hold) Adjust Camera")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_WeaponInOut, "Draw Weapon")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSC
    }, "Auto run")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_CrouchOrSkill, "Crouch")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "(hold) Interact with users")
  elseif state_ == self._guideState.screenshotGuide then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonB
    }, "Back")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonY
    }, "Take a photo")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRB
    }, "Increase area")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRT
    }, "Decrease area")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSM
    }, "Move")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSM
    }, "Camera")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSM,
      _consoleUIIconName.IconPlus,
      _consoleUIIconName.buttonLT
    }, "Zoom")
  elseif state_ == self._guideState.cameraMode then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonDpad
    }, "Move Camera")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSM
    }, "Zoom In / Zoom out")
  elseif state_ == self._guideState.crouch then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "Roll")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_WeaponInOut, "Draw Weapon")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSC
    }, "Auto run")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "Creep")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_CrouchOrSkill, "Stand up")
  elseif state_ == self._guideState.creep then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "Crouch")
  elseif state_ == self._guideState.rideHorse then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "(On sprint) Jump")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "Sprint")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSC
    }, "(hold) Adjust Camera")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSC
    }, "Auto run")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Interaction, "Ride off")
  elseif state_ == self._guideState.rideShip then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSC
    }, "(hold) Adjust Camera")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSC
    }, "Auto run")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonY
    }, "Ride off")
  elseif state_ == self._guideState.watchingMode then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonB
    }, "Close")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRT
    }, "Camera Speed Fast")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRB
    }, "Camera Speed Slow")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonX
    }, "Change Camera Speed")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSM,
      _consoleUIIconName.IconPlus,
      _consoleUIIconName.buttonA
    }, "Move Camera Faster ")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSM,
      _consoleUIIconName.IconPlus,
      _consoleUIIconName.buttonLT
    }, "Zoom In / Zoom out")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSM,
      _consoleUIIconName.IconPlus,
      _consoleUIIconName.buttonLT
    }, "Move Camera( Up / Down )")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSM
    }, "Change Camera Viewpoint")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSM
    }, "Move Camera")
  elseif state_ == self._guideState.searchMode then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSM,
      _consoleUIIconName.IconPlus,
      _consoleUIIconName.buttonLT
    }, "Zoom In / Zoom out")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSM
    }, "Change Viewpoint")
  elseif state_ == self._guideState.fishingIdleMode then
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "Start fishing")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "(hold)Start fishing")
  elseif state_ == self._guideState.fishingWaitHookMode then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRT
    }, "Cancel")
  elseif state_ == self._guideState.fishingStartHook then
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "Hook")
  elseif state_ == self._guideState.fishingHookMini1 then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonA
    }, "Hook")
  elseif state_ == self._guideState.fishingHookMini2 then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonDpad
    }, "Input")
  elseif state_ == self._guideState.rideCarriage then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonRSC
    }, "(hold) Adjust Camera")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLSC
    }, "Auto run")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonY
    }, "Ride off")
  elseif state_ == self._guideState.swimmingMode then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "Submerge")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "Sprint")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_WeaponInOut, "(hold) Adjust Camera")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "(hold) Interact with users")
  elseif state_ == self._guideState.swimWaitMode then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonStart
    }, "Menu")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_WeaponInOut, "(hold) Adjust Camera")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "(hold) Interact with users")
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLB
    }, "Rest Mode")
  elseif state_ == self._guideState.swimRestMode then
    self:addGuide(newGuide, {
      _consoleUIIconName.buttonLB
    }, "Swim Mode")
  elseif state_ == self._guideState.matchlock then
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Attack1, "Fire")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Jump, "Crouch / Stand up")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_Dash, "Sprint")
    self:addCustomizableGuide(newGuide, _actionType.ActionInputType_WeaponInOut, "(hold) Adjust Camera")
  else
    if state_ == self._guideState.packing then
      self:addGuide(newGuide, {
        _consoleUIIconName.buttonY
      }, "Put down")
    else
    end
  end
  self._maxConsoleGuideType = self._maxConsoleGuideType + 1
  return newGuide
end
function ConsoleKeyGuide:addGuide(newGuide, consoleUI_, keyString_)
  if nil == newGuide then
    return
  end
  local tableConsoleUI = {}
  local iconGapX = -self._gapX
  for index = 1, #consoleUI_ do
    local uiIcon = UI.createAndCopyBasePropertyControl(self._ui.guideBg, "Static_ConsoleKey", newGuide.guideBg, "ConsoleKey_" .. newGuide.state .. newGuide.guideIdx .. index)
    local uiIdx = consoleUI_[index]
    local x1, y1, x2, y2 = setTextureUV_Func(uiIcon, _consoleUIIconUV[uiIdx].x1, _consoleUIIconUV[uiIdx].y1, _consoleUIIconUV[uiIdx].x2, _consoleUIIconUV[uiIdx].y2)
    uiIcon:getBaseTexture():setUV(x1, y1, x2, y2)
    uiIcon:setRenderTexture(uiIcon:getBaseTexture())
    if uiIdx == _consoleUIIconName.IconPlus or uiIdx == _consoleUIIconName.IconOr then
      uiIcon:SetSize(12, 44)
      iconGapX = iconGapX + self._gapIconX
    else
      iconGapX = iconGapX + self._gapX
    end
    uiIcon:SetPosX(uiIcon:GetPosX() - iconGapX)
    uiIcon:SetPosY(uiIcon:GetPosY() - newGuide.guideIdx * self._gapY)
    tableConsoleUI[index] = uiIcon
  end
  local tableString = UI.createAndCopyBasePropertyControl(self._ui.guideBg, "StaticText_KeyDesc", newGuide.guideBg, "String_" .. newGuide.state .. newGuide.guideIdx)
  tableString:SetText(keyString_)
  tableString:SetPosY(tableString:GetPosY() - newGuide.guideIdx * self._gapY)
  self:setGlowFont(tableString)
  newGuide.consoleUI[newGuide.guideIdx] = tableConsoleUI
  newGuide.keyString[newGuide.guideIdx] = tableString
  newGuide.guideIdx = newGuide.guideIdx + 1
end
function ConsoleKeyGuide:addCustomizableGuide(newGuide, actionInputType, actionString)
  local padKeyName = keyCustom_GetString_ActionPad(actionInputType)
  if "" == padKeyName then
    return
  end
  local iconName = PaGlobalFunc_ConsoleKeyGuide_ConvertKeyToIconIndex(padKeyName)
  self:addGuide(newGuide, {iconName}, actionString, true)
end
local crouchActionString = {
  "HUNKERDOWN_WAIT",
  "HUNKERDOWN_START",
  "HUNKERDOWN_FRONT",
  "HUNKERDOWN_LEFT",
  "HUNKERDOWN_RIGHT",
  "HUNKERDOWN_BACK",
  "HUNKERDOWN_FRONT_Speed",
  "HUNKERDOWN_LEFT_Speed",
  "HUNKERDOWN_RIGHT_Speed",
  "HUNKERDOWN_BACK_Speed",
  "HUNKERDOWN_ROLL_F",
  "HUNKERDOWN_ROLL_F_CONTIUE",
  "HUNKERDOWN_ROLL_L",
  "HUNKERDOWN_ROLL_R",
  "HUNKERDOWN_ROLL_B",
  "HUNKERDOWN_AUTORUN"
}
local creepActionString = {
  "HUNKERDOWN_CREEP_WAIT",
  "HUNKERDOWN_CREEP_START",
  "HUNKERDOWN_CREEP_FRONT",
  "HUNKERDOWN_CREEP_LEFT",
  "HUNKERDOWN_CREEP_RIGHT",
  "HUNKERDOWN_CREEP_BACK",
  "HUNKERDOWN_CREEP_FRONT_Speed",
  "HUNKERDOWN_CREEP_LEFT_Speed",
  "HUNKERDOWN_CREEP_RIGHT_Speed",
  "HUNKERDOWN_CREEP_BACK_Speed"
}
function ConsoleKeyGuide:getState()
  if ToClient_isCameraControlModeForConsole() and true ~= Panel_Widget_ScreenShotFrame:GetShow() then
    return self._guideState.cameraMode
  end
  if true == isObserverMode() then
    return self._guideState.watchingMode
  end
  if GetUIMode() == Defines.UIMode.eUIMode_NpcDialog then
    if nil ~= self._specifyGuideState and self._specifyGuideState == self._guideState.searchMode then
      return self._specifyGuideState
    end
    if PaGlobalFunc_SearchMode_IsSearchMode() then
      return self._guideState.searchMode
    end
    return self._guideState._undefined
  end
  if getInputMode() == CppEnums.EProcessorInputMode.eProcessorInputMode_GameMode then
    if nil ~= self._manualGuideState then
      return self._manualGuideState
    end
    if nil ~= self._specifyGuideState and self._specifyGuideState ~= self._guideState.crouch and self._specifyGuideState ~= self._guideState.creep then
      return self._specifyGuideState
    end
    if true == IsSelfPlayerSwimmingAction() then
      if true == ToClient_SelfPlayerCheckAction("Swimming_Recovery") then
        return self._guideState.swimRestMode
      end
      if true == IsSelfPlayerSwimmingWaitAction() then
        return self._guideState.swimWaitMode
      end
      return self._guideState.swimmingMode
    end
    if ToClient_isWeaponOutForConsole() then
      return self._guideState.battle
    else
      return self._guideState.common
    end
  elseif Panel_Widget_ScreenShotFrame:GetShow() then
    return self._guideState.screenshotGuide
  end
  return self._guideState.undefined
end
function FGlobal_KeyGuideTypeCheck(deltaTime)
  if false == _ContentsGroup_RenewUI then
    return
  end
  if true == PaGlobalFunc_ConsoleKeyGuide_IsHideGuideException() then
    ConsoleKeyGuide:hideAllGuide()
    return
  end
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  local currentState = ConsoleKeyGuide:getState()
  self:setGuide(currentState)
end
function PaGlobalFunc_ConsoleKeyGuide_IsHideGuideException()
  for ii = 1, #_miniGamePanel do
    if true == _miniGamePanel[ii]:GetShow() then
      return true
    end
  end
  if true == PaGlobal_TutorialManager:isDoingTutorial() then
    return true
  end
  if nil ~= Panel_QuickMenuCustom and true == PaGlobal_QuickMenuSetting_GetShow() then
    return true
  end
  if nil ~= Panel_Window_Menu_Renew and true == Panel_Window_Menu_Renew:GetShow() then
    return true
  end
  if nil ~= Panel_Widget_Chatting_Renew and true == Panel_Widget_Chatting_Renew:GetShow() then
    return true
  end
  if Defines.UIMode.eUIMode_NpcDialog_Dummy == GetUIMode() then
    return true
  end
  return false
end
function PaGlobalFunc_ConsoleKeyGuide_Init()
  if false == ToClient_isConsole() then
    return
  end
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  self:init()
end
function PaGlobalFunc_ConsoleKeyGuide_ConvertKeyToIconIndex(keyName)
  local iconIdx
  if "LeftShoulder" == keyName then
    iconIdx = _consoleUIIconName.buttonLB
  elseif "RightShoulder" == keyName then
    iconIdx = _consoleUIIconName.buttonRB
  elseif "A" == keyName then
    iconIdx = _consoleUIIconName.buttonA
  elseif "B" == keyName then
    iconIdx = _consoleUIIconName.buttonB
  elseif "X" == keyName then
    iconIdx = _consoleUIIconName.buttonX
  elseif "Y" == keyName then
    iconIdx = _consoleUIIconName.buttonY
  elseif "LTrigger" == keyName then
    iconIdx = _consoleUIIconName.buttonLT
  elseif "RTrigger" == keyName then
    iconIdx = _consoleUIIconName.buttonRT
  elseif "LeftThumb" == keyName then
    iconIdx = _consoleUIIconName.buttonLSC
  elseif "RightThumb" == keyName then
    iconIdx = _consoleUIIconName.buttonRSC
  elseif "Start" == keyName then
    iconIdx = _consoleUIIconName.buttonStart
  end
  return iconIdx
end
function PaGlobalFunc_ConsoleKeyGuide_RefreshGuide()
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
end
function PaGlobalFunc_ConsoleKeyGuide_SetState(state_)
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  self._specifyGuideState = state_
end
function PaGlobalFunc_ConsoleKeyGuide_SetManualState(state_)
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  self._manualGuideState = state_
end
function PaGlobalFunc_ConsoleKeyGuide_SetRideState()
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
  local actorKeyRaw = selfProxy:getRideVehicleActorKeyRaw()
  local vehicleProxy = getVehicleActor(actorKeyRaw)
  if nil == vehicleProxy then
    self._specifyGuideState = nil
  else
    local vehicleType = vehicleProxy:get():getVehicleType()
    if CppEnums.VehicleType.Type_Horse == vehicleType or CppEnums.VehicleType.Type_Camel == vehicleType or CppEnums.VehicleType.Type_Donkey == vehicleType or CppEnums.VehicleType.Type_Elephant == vehicleType or CppEnums.VehicleType.Type_RidableBabyElephant == vehicleType then
      self._specifyGuideState = self._guideState.rideHorse
    elseif CppEnums.VehicleType.Type_Carriage == vehicleType or CppEnums.VehicleType.Type_CowCarriage == vehicleType then
      self._specifyGuideState = self._guideState.rideCarriage
    elseif CppEnums.VehicleType.Type_Boat == vehicleType or CppEnums.VehicleType.Type_Raft == vehicleType or CppEnums.VehicleType.Type_FishingBoat == vehicleType or CppEnums.VehicleType.Type_SailingBoat == vehicleType or CppEnums.VehicleType.Type_PersonalBattleShip == vehicleType or CppEnums.VehicleType.Type_PersonTradeShip == vehicleType or CppEnums.VehicleType.Type_CashPersonalTradeShip == vehicleType or CppEnums.VehicleType.Type_CashPersonalBattleShip == vehicleType or CppEnums.VehicleType.Type_PersonalBoat == vehicleType then
      self._specifyGuideState = self._guideState.rideShip
    else
      self._specifyGuideState = nil
    end
  end
end
function ConsoleKeyGuide:setSearchState()
  if false == ToClient_isConsole() then
    return
  end
  PaGlobalFunc_ConsoleKeyGuide_SetPos()
  PaGlobalFunc_ConsoleKeyGuide_SetState(self._guideState.searchMode)
  self:setGuide(self._guideState.searchMode)
end
function PaGlobalFunc_ConsoleKeyGuide_SetSearchState()
  ConsoleKeyGuide:setSearchState()
end
function PaGlobalFunc_ConsoleKeyGuide_SetFishingIdleMode()
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  if false == ToClient_isConsole() then
    return
  end
  PaGlobalFunc_ConsoleKeyGuide_SetPos()
  PaGlobalFunc_ConsoleKeyGuide_SetState(self._guideState.fishingIdleMode)
  self:setGuide(self._guideState.fishingIdleMode)
end
function PaGlobalFunc_ConsoleKeyGuide_SetFishingWaitHookMode()
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  if false == ToClient_isConsole() then
    return
  end
  PaGlobalFunc_ConsoleKeyGuide_SetPos()
  PaGlobalFunc_ConsoleKeyGuide_SetState(self._guideState.fishingWaitHookMode)
  self:setGuide(self._guideState.fishingWaitHookMode)
end
function PaGlobalFunc_ConsoleKeyGuide_SetfishingStartHook()
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  if false == ToClient_isConsole() then
    return
  end
  PaGlobalFunc_ConsoleKeyGuide_SetPos()
  PaGlobalFunc_ConsoleKeyGuide_SetState(self._guideState.fishingStartHook)
  self:setGuide(self._guideState.fishingStartHook)
end
function PaGlobalFunc_ConsoleKeyGuide_SetfishingHookMini1()
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  if false == ToClient_isConsole() then
    return
  end
  PaGlobalFunc_ConsoleKeyGuide_SetPos()
  PaGlobalFunc_ConsoleKeyGuide_SetState(self._guideState.fishingHookMini1)
  self:setGuide(self._guideState.fishingHookMini1)
end
function PaGlobalFunc_ConsoleKeyGuide_SetfishingHookMini2()
  local self = ConsoleKeyGuide
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ConsoleKeyGuide")
    return
  end
  if false == ToClient_isConsole() then
    return
  end
  PaGlobalFunc_ConsoleKeyGuide_SetPos()
  PaGlobalFunc_ConsoleKeyGuide_SetState(self._guideState.fishingHookMini2)
  self:setGuide(self._guideState.fishingHookMini2)
end
function PaGlobalFunc_ConsoleKeyGuide_On()
  local currentState = ConsoleKeyGuide:getState()
  ConsoleKeyGuide:setGuide(currentState)
end
function PaGlobalFunc_ConsoleKeyGuide_Off()
  ConsoleKeyGuide:hideAllGuide()
end
function PaGlobalFunc_ConsoleKeyGuide_SetPos()
  if false == PaGlobalFunc_SearchMode_IsSearchMode() then
    _panel:SetPosX(getScreenSizeX() - _panel:GetSizeX() - 50)
    _panel:SetPosY(getScreenSizeY() - _panel:GetSizeY() - 50)
  elseif true == _ContentsGroup_RenewUI_SearchMode then
    _panel:SetPosX(getScreenSizeX() - PaGlobalFunc_MainDialog_Right_GetSizeX() - _panel:GetSizeX() / 2 - 50)
    _panel:SetPosY(getScreenSizeY() / 2 - _panel:GetSizeY() / 2 - 50)
  end
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_ConsoleKeyGuide_Init")
function PaGlobalFunc_ConsoleKeyGuide_GetKeyGuideIconUV(key)
  local IconIndex = _consoleUIIconName[key]
  if nil == IconIndex then
    return 0, 0, 0, 0
  end
  local IconUV = _consoleUIIconUV[IconIndex]
  if nil == IconUV then
    return 0, 0, 0, 0
  end
  return IconUV.x1, IconUV.y1, IconUV.x2, IconUV.y2
end
CONSOLEKEYGUID_ALIGN_TYPE = {
  eALIGN_TYPE_LEFT = 0,
  eALIGN_TYPE_RIGHT = 1,
  eALIGN_TYPE_CENTER = 2,
  eALIGN_TYPE_TOP = 3,
  eALIGN_TYPE_MIDDLE = 4,
  eALIGN_TYPE_BOTTOM = 5,
  eALIGN_TYPE_COUNT = 6
}
function PaGlobalFunc_ConsoleKeyGuide_Rod_Check()
  local rightHandItemWrapper = ToClient_getEquipmentItem(0)
  local primWeaponIsFishingRod
  if nil ~= rightHandItemWrapper then
    primWeaponIsFishingRod = 44 == rightHandItemWrapper:getStaticStatus():getEquipType()
  end
  if true == primWeaponIsFishingRod then
    PaGlobalFunc_ConsoleKeyGuide_SetFishingIdleMode()
  else
    Panel_ConsoleKeyGuide:SetShow(true)
    PaGlobalFunc_ConsoleKeyGuide_SetState()
    PaGlobalFunc_ConsoleKeyGuide_On()
  end
end
function PaGlobalFunc_ConsoleKeyGuide_SetAlign(listKeyGuid, parentControl, alignType, keySize, keySpace)
  local defualtKeySize = 44
  local defualtKeySpace = 20
  if #listKeyGuid < 1 or nil == parentControl then
    return
  end
  local parantSizeX = parentControl:GetSizeX()
  local parantSizeY = parentControl:GetSizeY()
  if nil == keySize then
    keySize = defualtKeySize
  end
  if nil == keySpace then
    keySpace = defualtKeySpace
  end
  local space = keySize + keySpace
  if nil == alignType or alignType < 0 or alignType >= CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_COUNT then
    keySpaalignTypece = CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_LEFT == alignType then
    local length = keySpace
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosX(length)
        length = length + space + value:GetTextSizeX()
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT == alignType then
    local reversedTable = {}
    local keyCount = #listKeyGuid
    for key, value in ipairs(listKeyGuid) do
      reversedTable[keyCount + 1 - key] = value
    end
    local length = parantSizeX
    for key, value in ipairs(reversedTable) do
      if true == value:GetShow() then
        local spaceFromRight = value:GetTextSizeX() + space
        length = length - spaceFromRight
        value:SetPosX(length)
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_CENTER == alignType then
    local totalSizeX = 0
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        totalSizeX = totalSizeX + space + value:GetTextSizeX()
      end
    end
    local startPosX = (parantSizeX - totalSizeX) / 2
    local length = startPosX
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosX(length)
        length = length + space + value:GetTextSizeX()
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_TOP == alignType then
    local length = keySpace
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosY(length)
        length = length + space
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_MIDDLE == alignType then
    local totalSizeY = 0
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        totalSizeY = totalSizeY + space
      end
    end
    local startPosY = (parantSizeY - totalSizeY) / 2
    local length = startPosY
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosY(length)
        length = length + space
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_BOTTOM == alignType then
    local totalSizeY = 0
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        totalSizeY = totalSizeY + space
      end
    end
    local startPosY = parantSizeY - totalSizeY
    local length = startPosY
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosY(length)
        length = length + space
      end
    end
  end
end
