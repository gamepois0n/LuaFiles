local PaGlobal_SniperGame = {
  _ui = {
    _panel = Panel_SniperGame,
    _hole = UI.getChildControl(Panel_SniperGame, "Static_BG_SniperGame"),
    _crossHair = UI.getChildControl(Panel_SniperGame, "Static_CrossHair"),
    _deviationMark = UI.getChildControl(Panel_SniperGame, "Static_Deviation"),
    _resultMessage = UI.getChildControl(Panel_SniperGame, "StaticText_ResultMessage"),
    _debugText = UI.getChildControl(Panel_SniperGame, "MultilineText_Debug")
  },
  _renderMode = nil,
  _gameMode = 0
}
local crossHairScale = 1
local setTextureUV = function(iconControl, iconIdx, leftX, topY, xCount, iconSize)
  local x1, y1, x2, y2
  x1 = leftX + (iconSize + 1) * (iconIdx % xCount)
  y1 = topY + (iconSize + 1) * math.floor(iconIdx / xCount)
  x2 = x1 + iconSize
  y2 = y1 + iconSize
  x1, y1, x2, y2 = setTextureUV_Func(iconControl, x1, y1, x2, y2)
  iconControl:getBaseTexture():setUV(x1, y1, x2, y2)
  iconControl:setRenderTexture(iconControl:getBaseTexture())
end
function PaGlobal_SniperGame:Open()
  local ui = self._ui
  self._renderMode:set()
  ui._panel:SetSize(getScreenSizeX(), getScreenSizeY())
  ui._hole:SetSize(getScreenSizeX(), getScreenSizeY())
  ui._panel:SetPosXY(0, 0)
  Panel_SniperGame:SetShow(true)
  self:UpdateCrossHairPos(0)
end
function PaGlobal_SniperGame:Close()
  Panel_SniperGame:SetShow(false)
  self._renderMode:reset()
end
function PaGlobal_SniperGame:ShowHitAnimation()
end
function PaGlobal_SniperGame:CloseSliently()
  Panel_SniperGame:SetShow(false)
end
function PaGlobal_SniperGame:SetScaleAllUI(scale)
  local ui = self._ui
  local centerX = ui._panel:GetSizeX() * 0.5
  local centerY = ui._panel:GetSizeY() * 0.5
  ui._hole:SetScale(scale, scale)
  ui._hole:SetPosXY(centerX - ui._hole:GetSizeX() * 0.5, centerY - ui._hole:GetSizeY() * 0.5)
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
  ui._deviationMark:SetPosXY(crossHairPosX - ui._deviationMark:GetSizeX() * 0.5, crossHairPosY - ui._deviationMark:GetSizeX() * 0.5)
  if __eSniperGameState_AimMiniGame == gameState then
    setTextureUV(ui._deviationMark, 0, 2, 2, 2, 119)
  else
    setTextureUV(ui._deviationMark, 0, 123, 2, 2, 119)
  end
  if true == ToClient_IsDevelopment() then
    local characterWrapper = ToClient_SniperGame_GetHittedCharacterActor()
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
      local desiredFOV = ToClient_SniperGame_GetDeisredFOV()
      ui._debugText:SetText([[

ActorKey : ]] .. actorKey .. [[

Name : ]] .. name .. [[

Distance : ]] .. distance .. [[

HitPart : ]] .. hitPartName .. [[

FOV : ]] .. desiredFOV)
    else
      ui._debugText:SetText("\237\131\128\234\178\159 \236\151\134\236\157\140")
    end
  end
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
local addUpDownAnimation = function(control, duration, deltaY)
  local anim1 = control:addMoveAnimation(0, duration, 4)
  anim1:SetStartPosition(control:GetPosX(), control:GetPosY())
  anim1:SetEndPosition(control:GetPosX(), control:GetPosY() + deltaY)
end
function PaGlobal_SniperGame:StartShootingAnimation(duration, scaleRate)
  local ui = self._ui
  addClosingAnimation(ui._hole, duration, scaleRate)
end
function FGlobal_Update_SniperGame_PerFrame(deltaTime)
  PaGlobal_SniperGame:UpdateCrossHairPos(deltaTime)
end
function OpenSniperGameFromAction()
  ToClient_SniperGame_StartPlay()
  PaGlobal_SniperGame:Open()
end
function CloseSniperGameFromAction()
  ToClient_SniperGame_StopPlay()
  PaGlobal_SniperGame:Close()
end
function Test_SniperGame_Open()
  if false == ToClient_IsDevelopment() then
    return
  end
  ToClient_SniperGame_StartPlay()
  PaGlobal_SniperGame:Open()
end
function Test_SniperGame_Close()
  if false == ToClient_IsDevelopment() then
    return
  end
  ToClient_SniperGame_StopPlay()
  PaGlobal_SniperGame:Close()
end
function Test_Shake(duration, scale)
  if false == ToClient_IsDevelopment() then
    return
  end
  PaGlobal_SniperGame:StartShootingAnimation(duration, scale)
end
function FromClient_luaLoadComplete_SniperGame()
  if true == ToClient_IsDevelopment() then
    PaGlobal_SniperGame._ui._debugText:SetShow(true)
  end
  PaGlobal_SniperGame._renderMode = RenderModeWrapper.new(100, {
    Defines.RenderMode.eRenderMode_SniperGame
  }, false)
  PaGlobal_SniperGame._renderMode:setClosefunctor(PaGlobal_SniperGame._renderMode, CloseSniperGameFromAction)
  Test_SniperGame_Close()
  Panel_SniperGame:RegisterUpdateFunc("FGlobal_Update_SniperGame_PerFrame")
  ToClient_SniperGame_SetDesiredFOV(0.25)
  ToClient_SniperGame_SetRotationSensitivity(0.002)
  ToClient_SniperGame_SetTranslationSensitivity(0.35)
  ToClient_SniperGame_SetMaxRangeForCrossHair(500)
  ToClient_SniperGame_SetMaximumCrossHairRadius(crossHairScale * 120)
  ToClient_SniperGame_SetMinimumCrossHairRadius(crossHairScale * 50)
  PaGlobal_SniperGame._ui._crossHair:SetSize(crossHairScale * PaGlobal_SniperGame._ui._crossHair:GetSizeXOrigin(), crossHairScale * PaGlobal_SniperGame._ui._crossHair:GetSizeYOrigin())
  ToClient_SniperGame_SetGameMode(PaGlobal_SniperGame._gameMode)
  if 0 == PaGlobal_SniperGame._gameMode then
    PaGlobal_SniperGame._ui._deviationMark:SetShow(true)
    PaGlobal_SniperGame._ui._crossHair:SetShow(true)
  elseif 1 == PaGlobal_SniperGame._gameMode then
    PaGlobal_SniperGame._ui._deviationMark:SetShow(false)
    PaGlobal_SniperGame._ui._crossHair:SetShow(false)
    ToClient_SniperGame_SetGameMode1MinMaxRandomRadiusRate(0.2, 0.6)
    ToClient_SniperGame_SetCrossHairShrinkSpeed(0.3)
  end
end
function FromClient_SniperGame_StateBegin_Process(state)
  if state == __eSniperGameState_Searching then
    PaGlobal_SniperGame:Open()
  elseif state == __eSniperGameState_Reloading then
    PaGlobal_SniperGame:CloseSliently()
  elseif state == __eSniperGameState_WaitToReload then
    PaGlobal_SniperGame:CloseSliently()
  elseif state == __eSniperGameState_WaitToCheck then
    PaGlobal_SniperGame:StartShootingAnimation(0.12, 0.06)
  elseif state == __eSniperGameState_AimMiniGame then
    PaGlobal_SniperGame._ui._crossHair:SetShow(true)
    PaGlobal_SniperGame._ui._deviationMark:SetShow(true)
  end
end
function FromClient_SniperGame_StateEnd_Process(state)
  if state == __eSniperGameState_AimMiniGame then
    PaGlobal_SniperGame._ui._crossHair:SetShow(false)
    PaGlobal_SniperGame._ui._deviationMark:SetShow(false)
  end
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_SniperGame")
registerEvent("FromClient_SniperGame_StateBegin", "FromClient_SniperGame_StateBegin_Process")
registerEvent("FromClient_SniperGame_StateEnd", "FromClient_SniperGame_StateEnd_Process")
ActionChartEventBindFunction(9996, OpenSniperGameFromAction)
ActionChartEventBindFunction(9997, CloseSniperGameFromAction)
