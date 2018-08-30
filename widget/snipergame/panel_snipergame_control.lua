local PaGlobal_SniperGame_Control = {_renderMode = nil}
function PaGlobal_SniperGame_Control:Open()
  PaGlobal_SniperGame:StartSearchMode()
  self._renderMode:set()
end
function PaGlobal_SniperGame_Control:Close()
  PaGlobal_SniperGame:Close()
  PaGlobal_SniperGame_Result:Close()
  self._renderMode:reset()
end
function SniperGame_Open_FromAction()
  ToClient_SniperGame_StartPlay()
  PaGlobal_SniperGame_Control:Open()
end
function SniperGame_Close_FromAction()
  ToClient_SniperGame_StopPlay()
  PaGlobal_SniperGame_Control:Close()
end
function FromClient_SniperGame_StateBegin_Process(state)
  if state == __eSniperGameState_Idle then
    PaGlobal_SniperGame:Close()
    PaGlobal_SniperGame_Result:Close()
  elseif state == __eSniperGameState_Searching then
    PaGlobal_SniperGame:StartSearchMode()
    PaGlobal_SniperGame_Result:Close()
  elseif state == __eSniperGameState_AimMiniGame then
    PaGlobal_SniperGame:StartAimMiniGame()
    PaGlobal_SniperGame_Result:Close()
  elseif state == __eSniperGameState_WaitBeforeCheck then
    PaGlobal_SniperGame:StartShootingAnimation(0.12, 0.06)
  elseif state == __eSniperGameState_CheckResult then
    PaGlobal_SniperGame:Close()
    PaGlobal_SniperGame_Result:Open()
  elseif state == __eSniperGameState_WaitToReload then
    PaGlobal_SniperGame:Close()
  elseif state == __eSniperGameState_Reloading then
    PaGlobal_SniperGame:Close()
    PaGlobal_SniperGame_Result:Close()
  end
end
function FromClient_SniperGame_StateEnd_Process(state)
  if state == __eSniperGameState_AimMiniGame then
    PaGlobal_SniperGame_Result:ClearResult()
  end
end
function FromClient_SniperGame_ImpactResult_Process(devitaionRadius, desiredScreenPos, hittedScreenPos, hitPartType)
  PaGlobal_SniperGame_Result:UpdateShootResult(devitaionRadius, desiredScreenPos, hittedScreenPos, hitPartType)
end
function onScreenResize_SniperGame_Process()
  PaGlobal_SniperGame:OnScreenResize(getScreenSizeX(), getScreenSizeY())
  PaGlobal_SniperGame_Result:OnScreenResize(getScreenSizeX(), getScreenSizeY())
end
function FromClient_SniperGame_Missed_Process(devitaionRadius, desiredScreenPos, hittedScreenPos)
  PaGlobal_SniperGame_Result:UpdateMissResult(devitaionRadius, desiredScreenPos, hittedScreenPos)
end
function FromClient_luaLoadComplete_SniperGame()
  local self = PaGlobal_SniperGame_Control
  self._renderMode = RenderModeWrapper.new(100, {
    Defines.RenderMode.eRenderMode_SniperGame
  }, false)
  self._renderMode:setClosefunctor(PaGlobal_SniperGame_Control._renderMode, SniperGame_Close_FromAction)
  PaGlobal_SniperGame:Initialize()
  PaGlobal_SniperGame_Result:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_SniperGame")
registerEvent("FromClient_SniperGame_StateBegin", "FromClient_SniperGame_StateBegin_Process")
registerEvent("FromClient_SniperGame_StateEnd", "FromClient_SniperGame_StateEnd_Process")
registerEvent("FromClient_SniperGame_ImpactResult", "FromClient_SniperGame_ImpactResult_Process")
registerEvent("FromClient_SniperGame_Missed", "FromClient_SniperGame_Missed_Process")
registerEvent("onScreenResize", "onScreenResize_SniperGame_Process")
ActionChartEventBindFunction(9996, SniperGame_Open_FromAction)
ActionChartEventBindFunction(9997, SniperGame_Close_FromAction)
