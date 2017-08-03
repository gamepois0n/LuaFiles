-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\reconnectaction\horseriding.luac 

-- params : ...
-- function num : 0
local enStatus = {CALL = 0, RIDE = 1, RUN = 2, END = 3}
local HorseRiding = {_preTick = 0, _isStartHorseRiding = false, _nowStatus = enStatus.CALL, _oldStatus = enStatus.CALL}
FromClient_StartReconnectAtion = function()
  -- function num : 0_0 , upvalues : HorseRiding, enStatus
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  HorseRiding._isStartHorseRiding = true
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  HorseRiding._nowStatus = enStatus.CALL
end

ReconnectAction_HorseCall = function()
  -- function num : 0_1
  Servant_Call(0)
end

ReconnectAction_HorseRide = function()
  -- function num : 0_2
  interaction_processInteraction((CppEnums.InteractionType).InteractionType_Ride)
end

ReconnectAction_HorseRun = function()
  -- function num : 0_3
  ToClient_SettingLoopNavi(NavigationGuideParam())
  ToClient_NaviReStart()
  FGlobal_ToggleServantAutoCarrot()
end

registerEvent("FromClient_StartReconnectAtion", "FromClient_StartReconnectAtion")
Update_ReconnectHorse = function()
  -- function num : 0_4 , upvalues : HorseRiding, enStatus
  if HorseRiding._isStartHorseRiding == false then
    return 
  end
  if FrameControl_FiveSecond() == false or IsSelfPlayerWaitAction() == false then
    return 
  end
  local self = HorseRiding
  if enStatus.CALL == self._nowStatus then
    ReconnectAction_HorseCall()
    self._nowStatus = enStatus.RIDE
  else
    if enStatus.RIDE == self._nowStatus then
      ReconnectAction_HorseRide()
      self._nowStatus = enStatus.RUN
    else
      if enStatus.RUN == self._nowStatus then
        ReconnectAction_HorseRun()
        self._nowStatus = enStatus.END
      else
        if enStatus.END == self._nowStatus then
          self._isStartHorseRiding = false
        end
      end
    end
  end
end

FrameControl_FiveSecond = function()
  -- function num : 0_5 , upvalues : HorseRiding
  local self = HorseRiding
  local nowTick = (os.time)()
  if self._preTick == 0 then
    self._preTick = nowTick
    return false
  end
  if nowTick - self._preTick < 5 then
    return false
  end
  self._preTick = nowTick
  return true
end

registerEvent("FromClient_ReconnectAlert_Show", "FromClient_ReconnectAlert_Show")
registerEvent("FromClient_ReconnectAlert_Hide", "FromClient_ReconnectAlert_Hide")
FromClient_ReconnectAlert_Show = function()
  -- function num : 0_6
  _PA_LOG("민혁", "FromClient_ReconnectAlert_Show 호출되었습니�\164.")
  local messageBoxtitle = PAGetString(Defines.StringSheet_GAME, "GUILD_MESSAGEBOX_TITLE")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_AUTO_RECONNECT")
  local messageBoxData = {title = messageBoxtitle, content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_HIGH}
  ;
  (MessageBox.showMessageBox)(messageBoxData, "middle")
end

FromClient_ReconnectAlert_Hide = function()
  -- function num : 0_7
  _PA_LOG("민혁", "FromClient_ReconnectAlert_Hide 호출되었습니�\164.")
  postProcessMessageData()
end


