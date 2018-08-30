PaGlobal_SniperGame = {
  _ui = {
    _panel = Panel_SniperGame,
    _hole = UI.getChildControl(Panel_SniperGame, "Static_BG_SniperGame"),
    _crossHair = UI.getChildControl(Panel_SniperGame, "Static_CrossHair"),
    _deviationMark = UI.getChildControl(Panel_SniperGame, "Static_Deviation"),
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
  ui._hole:ComputePos()
  ui._breathContainer:ComputePos()
  ui._breathContainer:SetPosY(0.8 * screenSizeY)
end
function PaGlobal_SniperGame:SetBreathingGauge(gaugeSize, isHoldingBreath)
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
function PaGlobal_SniperGame:StartSearchMode()
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  self._ui._crossHair:SetShow(false)
  self._ui._deviationMark:SetShow(false)
  self:UpdateCrossHairPos(0)
  self:OnScreenResize(screenSizeX, screenSizeY)
  Panel_SniperGame:SetShow(true)
end
function PaGlobal_SniperGame:StartAimMiniGame()
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
  ui._deviationMark:SetSize(gameInfo:getRadius(), gameInfo:getRadius())
  ui._deviationMark:SetPosXY(crossHairPosX - ui._deviationMark:GetSizeX() * 0.5 - 1, crossHairPosY - ui._deviationMark:GetSizeY() * 0.5 - 1)
  local breathGaugeSize = gameInfo:getRemainedBreathing() / 5
  if __eSniperGameState_AimMiniGame == gameState then
    if true == gameInfo:isCrossHairOnTarget() then
      setTextureUV(ui._deviationMark, 2, 2, 121, 121)
    else
      setTextureUV(ui._deviationMark, 123, 2, 242, 121)
    end
  end
  if breathGaugeSize < 0 then
    breathGaugeSize = 0
  end
  self:SetBreathingGauge(breathGaugeSize, gameState == __eSniperGameState_AimMiniGame)
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
  local self = PaGlobal_SniperGame
  self._breathAndContainerRatio = 1 - self._breathXOffset * 2 / self._ui._breathContainer:GetSizeX()
  self._ui._breath = UI.getChildControl(self._ui._breathContainer, "Static_BG_Breath")
  self._ui._breath:SetSize(self._ui._breath:GetSizeX(), self._ui._breathContainer:GetSizeY() * 0.5)
  self._ui._breath:ComputePos()
  self._ui._impactPointForDebug = UI.getChildControl(PaGlobal_SniperGame._ui._deviationMarkForDebug, "Static_ImpactPoint")
  self._ui._impactPointForDebug:SetPosXY(30, 30)
  Panel_SniperGame:RegisterUpdateFunc("FGlobal_Update_SniperGame_PerFrame")
  local crossHairDiameter = PaGlobal_SniperGame._ui._crossHair:GetSizeX()
  ToClient_SniperGame_SetMaxRangeForCrossHair(500)
  ToClient_SniperGame_SetCrossHairRadiusParam(20, 120, crossHairDiameter * 0.6, crossHairDiameter * 0.812)
  PaGlobal_SniperGame._ui._deviationMark:SetShow(false)
  PaGlobal_SniperGame._ui._crossHair:SetShow(false)
  PaGlobal_SniperGame._ui._breath:SetShow(true)
  PaGlobal_SniperGame._ui._breathContainer:SetShow(true)
  PaGlobal_SniperGame._ui._deviationMarkForDebug:SetShow(false)
  PaGlobal_SniperGame._ui._impactPointForDebug:SetShow(false)
  if true == ToClient_IsDevelopment() then
    PaGlobal_SniperGame._ui._debugText:SetShow(true)
    PaGlobal_SniperGame._ui._middlePointDev:SetShow(true)
  else
    PaGlobal_SniperGame._ui._debugText:SetShow(false)
    PaGlobal_SniperGame._ui._middlePointDev:SetShow(false)
  end
end
function PaGlobal_SniperGame:StartShootingAnimation(duration, scaleRate)
  local ui = self._ui
  addClosingAnimation(ui._hole, duration, scaleRate)
end
function FGlobal_Update_SniperGame_PerFrame(deltaTime)
  PaGlobal_SniperGame:UpdateCrossHairPos(deltaTime)
end
function ToggleSniperDebugInfo()
  if true == PaGlobal_SniperGame._showDebugInfo then
    PaGlobal_SniperGame._showDebugInfo = false
  else
    PaGlobal_SniperGame._showDebugInfo = true
  end
end
