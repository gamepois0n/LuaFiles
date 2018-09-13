PaGlobal_SniperGame = {
  _ui = {
    _panel = Panel_SniperGame,
    _hole = UI.getChildControl(Panel_SniperGame, "Static_BG_SniperGame"),
    _blackboxes = {},
    _crossHair = UI.getChildControl(Panel_SniperGame, "Static_CrossHair"),
    _deviationMark = UI.getChildControl(Panel_SniperGame, "Static_Deviation"),
    _deviationArea = {},
    _resultMessage = UI.getChildControl(Panel_SniperGame, "StaticText_ResultMessage"),
    _breathContainer = UI.getChildControl(Panel_SniperGame, "Static_BG_BreathContainer"),
    _breath = nil,
    _debugText = UI.getChildControl(Panel_SniperGame, "MultilineText_Debug"),
    _deviationMarkForDebug = UI.getChildControl(Panel_SniperGame, "Static_Deviation_ForResult"),
    _impactPointForDebug = nil,
    _middlePointDev = UI.getChildControl(Panel_SniperGame, "Static_MiddlePoint_ForDev")
  },
  _breathXOffset = 4,
  _resultMessageShowTime = 0,
  _breathAndContainerRatio = 1,
  _showDebugInfo = false
}
local _isInitialized = false
local _holeTargetX, _holeTargetY
local _holeSize = 1500
local _holeAniSpeed = 100
local self = PaGlobal_SniperGame
local setTextureUV = function(iconControl, leftX, topY, rightX, bottomY)
  leftX, topY, rightX, bottomY = setTextureUV_Func(iconControl, leftX, topY, rightX, bottomY)
  iconControl:getBaseTexture():setUV(leftX, topY, rightX, bottomY)
  iconControl:setRenderTexture(iconControl:getBaseTexture())
end
local addClosingAnimation = function(control, duration, scaleRate)
  local xSize = control:GetSizeX()
  local ySize = control:GetSizeY()
  local anim1 = control:addMoveAnimation(0, duration, 4)
  anim1:SetStartPosition(control:GetPosX(), control:GetPosY())
  anim1:SetEndPosition(control:GetPosX() - xSize * scaleRate * 0.5, control:GetPosY() - ySize * scaleRate * 0.5)
  local anim3 = control:addScaleAnimation(0, duration, 4)
  anim3:SetStartScale(1)
  anim3:SetEndScale(1 + scaleRate)
end
function PaGlobal_SniperGame:Close()
  Panel_SniperGame:SetShow(false)
end
function PaGlobal_SniperGame:OnScreenResize(screenSizeX, screenSizeY)
  local ui = self._ui
  ui._panel:SetSize(screenSizeX, screenSizeY)
  ui._panel:SetPosXY(0, 0)
  ui._hole:SetSize(_holeSize, _holeSize)
  ui._breathContainer:ComputePos()
  ui._breathContainer:SetPosY(0.9 * screenSizeY)
  if not _isInitialized then
    return
  end
  ui._blackboxes[1]:SetSize(screenSizeX + _holeSize * 3, _holeSize)
  ui._blackboxes[2]:SetSize(_holeSize, screenSizeY + _holeSize * 3)
  ui._blackboxes[3]:SetSize(screenSizeX + _holeSize * 3, _holeSize)
  ui._blackboxes[4]:SetSize(_holeSize, screenSizeY + _holeSize * 3)
  ui._blackboxes[1]:SetSpanSize(0, -(_holeSize - 5))
  ui._blackboxes[2]:SetSpanSize(-(_holeSize - 5), 0)
  ui._blackboxes[3]:SetSpanSize(0, -(_holeSize - 5))
  ui._blackboxes[4]:SetSpanSize(-(_holeSize - 5), 0)
  ui._blackboxes[1]:ComputePos()
  ui._blackboxes[2]:ComputePos()
  ui._blackboxes[3]:ComputePos()
  ui._blackboxes[4]:ComputePos()
end
function PaGlobal_SniperGame:SetBreathingGauge(gaugeSize, isHoldingBreath, deltaTime)
  local ui = self._ui
  local containerSizeX = ui._breathContainer:GetSizeX()
  local offsetX = ui._breathContainer:GetSizeX() * (1 - self._breathAndContainerRatio) / 2
  local maxSizeX = containerSizeX * self._breathAndContainerRatio
  local maxSizeY = ui._breath:GetSizeY()
  ui._breath:SetPosX(offsetX)
  ui._breath:SetSize(maxSizeX * gaugeSize, maxSizeY)
  if true == isHoldingBreath then
    setTextureUV(ui._breath, 181, 662, 631, 672)
  else
    setTextureUV(ui._breath, 181, 651, 631, 661)
  end
end
function PaGlobal_SniperGame:animateHolePos(deltaTime)
  local control = self._ui._hole
  if nil == control or nil == _holeTargetY or nil == _holeTargetX then
    return
  end
  local currentPosX = control:GetPosX()
  local currentPosY = control:GetPosY()
  local distanceX = _holeTargetX - currentPosX
  local distanceY = _holeTargetY - currentPosY
  local accX = distanceX / 100 * deltaTime * _holeAniSpeed
  local accY = distanceY / 100 * deltaTime * _holeAniSpeed
  control:SetPosXY(currentPosX + accX, currentPosY + accY)
end
function PaGlobal_SniperGame:StartSearchMode()
  local gameInfo = ToClient_SniperGame_GetGameInfo()
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  local sen = gameInfo:getRotationSensitivity()
  ToClient_SniperGame_SetRotationSensitivity(2.0E-4)
  self._ui._crossHair:SetShow(false)
  self._ui._deviationMark:SetShow(false)
  self:UpdateCrossHairPos(0)
  self:OnScreenResize(screenSizeX, screenSizeY)
  self._ui._hole:SetPosXY(screenSizeX * 0.5 - _holeSize * 0.5, screenSizeY)
  _holeAniSpeed = 500
  _holeTargetX = screenSizeX * 0.5 - _holeSize * 0.5
  _holeTargetY = screenSizeY * 0.5 - _holeSize * 0.5
  Panel_SniperGame:SetShow(true)
end
function PaGlobal_SniperGame:StartAimMiniGame()
  _holeAniSpeed = 100
  ToClient_SniperGame_VaryXYOffset(0, 0)
  self._ui._crossHair:SetShow(true)
  self._ui._deviationMark:SetShow(true)
end
function PaGlobal_SniperGame:UpdateCrossHairPos(deltaTime)
  local ui = self._ui
  local centerX = ui._panel:GetPosX() + ui._panel:GetSizeX() * 0.5
  local centerY = ui._panel:GetPosY() + ui._panel:GetSizeY() * 0.5
  local gameInfo = ToClient_SniperGame_GetGameInfo()
  local crossHairPosX = centerX + gameInfo:getXOffset()
  local crossHairPosY = centerY + gameInfo:getYOffset()
  local gameState = ToClient_SniperGame_GetGameState()
  ui._crossHair:SetPosXY(crossHairPosX - ui._crossHair:GetSizeX() * 0.5, crossHairPosY - ui._crossHair:GetSizeY() * 0.5)
  ui._deviationMark:SetSize(gameInfo:getRadius() + 38, gameInfo:getRadius() + 38)
  for ii = 1, #ui._deviationArea do
    ui._deviationArea[ii]:ComputePos()
  end
  ui._deviationMark:SetPosXY(crossHairPosX - ui._deviationMark:GetSizeX() * 0.5, crossHairPosY - ui._deviationMark:GetSizeY() * 0.5)
  local breathGaugeSize = gameInfo:getRemainedBreathing() / 5
  if __eSniperGameState_AimMiniGame == gameState then
    if true == gameInfo:isCrossHairOnTarget() then
      setTextureUV(ui._deviationMark, 519, 2, 547, 30)
    else
      setTextureUV(ui._deviationMark, 548, 2, 576, 30)
    end
  end
  if breathGaugeSize < 0 then
    breathGaugeSize = 0
  end
  if true == ui._crossHair:GetShow() then
    _holeTargetX = crossHairPosX - _holeSize * 0.5
    _holeTargetY = crossHairPosY - _holeSize * 0.5
  else
    _holeTargetX = centerX - _holeSize * 0.5
    _holeTargetY = centerY - _holeSize * 0.5
  end
  self:animateHolePos(deltaTime)
  self:SetBreathingGauge(breathGaugeSize, gameState == __eSniperGameState_AimMiniGame, deltaTime)
  if true == ToClient_IsDevelopment() then
    if false == self._showDebugInfo then
      ui._debugText:SetShow(false)
      ui._middlePointDev:SetShow(false)
    else
      ui._debugText:SetShow(true)
      ui._middlePointDev:SetShow(true)
      ui._middlePointDev:SetPosXY(centerX - ui._middlePointDev:GetSizeX() / 2, centerY - ui._middlePointDev:GetSizeY() / 2)
      local characterWrapper = ToClient_SniperGame_GetHittedCharacterActor()
      local debugMessage = ""
      if nil ~= characterWrapper then
        local selfPlayer = getSelfPlayer()
        local actorKey = characterWrapper:get():getActorKeyRaw()
        local name = characterWrapper:getName()
        local targetPos = characterWrapper:get():getPosition()
        local distance = -1
        if nil ~= selfPlayer then
          local selfPos = selfPlayer:get():getPosition()
          selfPos.x = selfPos.x - targetPos.x
          selfPos.y = selfPos.y - targetPos.y
          selfPos.z = selfPos.z - targetPos.z
          distance = math.sqrt(selfPos.x * selfPos.x + selfPos.y * selfPos.y + selfPos.z * selfPos.z)
        end
        local hitPartName = ToClient_SniperGame_GetHitPartName_DEV()
        if nil == hitPartName then
          hitPartName = "\236\151\134\236\157\140"
        end
        local distanceStr = string.format("%.3f", distance)
        local desiredFOV = string.format("%.3f", ToClient_SniperGame_GetDeisredFOV())
        local currentAccuracy = ToClient_SniperGame_GetShootAccuracy()
        local remainedBreath = string.format("%.3f", gameInfo:getRemainedBreathing())
        debugMessage = [[

ActorKey : ]] .. actorKey .. [[

Name : ]] .. name .. [[

Distance : ]] .. distanceStr .. [[

HitPart : ]] .. hitPartName .. [[

FOV : ]] .. desiredFOV .. "\n\236\160\149\237\153\149\235\143\132 : " .. currentAccuracy .. "\n\237\152\184\237\157\161 : " .. remainedBreath
      else
        debugMessage = "\237\131\128\234\178\159 \236\151\134\236\157\140"
      end
      ui._debugText:SetText(debugMessage)
      ui._debugText:SetPosXY(centerX + 250, centerY - 250)
    end
  end
end
function PaGlobal_SniperGame:Initialize()
  self._ui._blackboxes = {
    UI.getChildControl(self._ui._hole, "Static_BlackBox1"),
    UI.getChildControl(self._ui._hole, "Static_BlackBox2"),
    UI.getChildControl(self._ui._hole, "Static_BlackBox3"),
    UI.getChildControl(self._ui._hole, "Static_BlackBox4")
  }
  self._ui._deviationArea = {
    UI.getChildControl(self._ui._deviationMark, "Static_Deviation1"),
    UI.getChildControl(self._ui._deviationMark, "Static_Deviation2"),
    UI.getChildControl(self._ui._deviationMark, "Static_Deviation3"),
    UI.getChildControl(self._ui._deviationMark, "Static_Deviation4")
  }
  self._ui._deviationArea[2]:SetRotate(math.pi * 0.5)
  self._ui._deviationArea[3]:SetRotate(math.pi * 1.5)
  self._ui._deviationArea[4]:SetRotate(math.pi)
  self._breathAndContainerRatio = 1 - self._breathXOffset * 2 / self._ui._breathContainer:GetSizeX()
  self._ui._breath = UI.getChildControl(self._ui._breathContainer, "Static_BG_Breath")
  self._ui._breath:SetSize(self._ui._breath:GetSizeX(), self._ui._breathContainer:GetSizeY() * 0.5)
  self._ui._breath:ComputePos()
  self._ui._impactPointForDebug = UI.getChildControl(self._ui._deviationMarkForDebug, "Static_ImpactPoint")
  self._ui._impactPointForDebug:SetPosXY(30, 30)
  Panel_SniperGame:RegisterUpdateFunc("FGlobal_Update_SniperGame_PerFrame")
  local crossHairDiameter = self._ui._crossHair:GetSizeX()
  ToClient_SniperGame_SetMaxRangeForCrossHair(500)
  ToClient_SniperGame_SetCrossHairRadiusParam(20, 120, crossHairDiameter * 0.6, crossHairDiameter * 0.812)
  self._ui._deviationMark:SetShow(false)
  self._ui._crossHair:SetShow(false)
  self._ui._breath:SetShow(true)
  self._ui._breathContainer:SetShow(true)
  self._ui._deviationMarkForDebug:SetShow(false)
  self._ui._impactPointForDebug:SetShow(false)
  if true == ToClient_IsDevelopment() then
    self._ui._debugText:SetShow(true)
    self._ui._middlePointDev:SetShow(true)
  else
    self._ui._debugText:SetShow(false)
    self._ui._middlePointDev:SetShow(false)
  end
  _isInitialized = true
end
function PaGlobal_SniperGame:StartShootingAnimation(duration, scaleRate)
  local ui = self._ui
  addClosingAnimation(ui._hole, duration, scaleRate)
end
function FGlobal_Update_SniperGame_PerFrame(deltaTime)
  self:UpdateCrossHairPos(deltaTime)
end
function ToggleSniperDebugInfo()
  if true == self._showDebugInfo then
    self._showDebugInfo = false
  else
    self._showDebugInfo = true
  end
end
