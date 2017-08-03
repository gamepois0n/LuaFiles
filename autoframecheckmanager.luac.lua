-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\autoquest\autoframecheckmanager.luac 

-- params : ...
-- function num : 0
local enTimeValue = {Second = 1, RunningTime = 6, StandingTime = 24, StandingTime_Half = 12}
local enCameraValue = {UpdateCameraYaw = 0.015, SetCameraPich_Low = -0.2, SetCameraPich_High = 0.35, ForLogAngle = 0.1, GoalArea = 200, BreakArea = 50}
local AutoFrameCheckManager = {_isOn = false, _isRpeat = false, _nowRepeatCount = 0, _maxRepeatCount = 0, _minFrame = 25, _prevTick = 0, _cameraYaw = 0, _cameraPitch = 0, _isStop = true, _index = 0, _maxIndex = 0, 
_PositionList = {}
, _oldPositionX = 0, _oldPositionY = 0, _oldPositionZ = 0, _logPositionX = 0, _logPositionY = 0, _logPositionZ = 0, _logCameraYaw = 0, _accumulateFrame = 0, _accumulateCount = 0, _isCaptured = false}
setStandingTime = function(value)
  -- function num : 0_0 , upvalues : enTimeValue
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  enTimeValue.StandingTime = value
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  enTimeValue.StandingTime_Half = value / 2
end

setRunningTime = function(value)
  -- function num : 0_1 , upvalues : enTimeValue
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  enTimeValue.RunningTime = value
end

setUpdateCameraYaw = function(value)
  -- function num : 0_2 , upvalues : enCameraValue
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  enCameraValue.UpdateCameraYaw = value
end

AutoFrameCheckManager.FrameCheck = function(self)
  -- function num : 0_3 , upvalues : AutoFrameCheckManager, enCameraValue
  local nowFrame = ToClient_getFPS()
  self._accumulateFrame = self._accumulateFrame + nowFrame
  self._accumulateCount = self._accumulateCount + 1
  if nowFrame < AutoFrameCheckManager._minFrame then
    local selfPlayer = getSelfPlayer()
    local nowPositionX = (selfPlayer:get()):getPositionX()
    local nowPositionY = (selfPlayer:get()):getPositionY()
    local nowPositionZ = (selfPlayer:get()):getPositionZ()
    if self._logPositionX == nowPositionX and self._logPositionY == nowPositionY and self._logPositionZ == nowPositionY then
      return 
    end
    local fixedYaw = (math.abs)(self._logCameraYaw - self._cameraYaw)
    if fixedYaw < enCameraValue.ForLogAngle then
      return 
    end
    local TargetPosition = (self._PositionList)[self._index]
    self._logPositionX = nowPositionX
    self._logPositionY = nowPositionY
    self._logPositionZ = nowPositionZ
    self._logCameraYaw = self._cameraYaw
    local logString = (string.format)("NowCycle[%d] FrameLow[%d] Position[%f/%f/%f] CameraYaw[%f] avgFrame[%d]", self._nowRepeatCount + 1, nowFrame, nowPositionX, nowPositionY, nowPositionZ, self._cameraYaw, self._accumulateFrame / self._accumulateCount)
    local logString2 = (string.format)("TargetPosition[%f/%f/%f] (%s)", TargetPosition._goalX, TargetPosition._goalY, TargetPosition._goalZ, TargetPosition._where)
    local screenShotString = (string.format)("_Position(%f/%f/%f)", nowPositionX, nowPositionY, nowPositionZ)
    _PA_SVN_LOG(logString)
    _PA_SVN_LOG(logString2)
    if self._isCaptured == false then
      ToClient_CaptureByFrameCheck()
      self._isCaptured = true
    end
  end
end

AutoFrameCheckManager.isArriveGoalbyPosition = function(self, X, Y, Z)
  -- function num : 0_4 , upvalues : enCameraValue
  local selfPlayer = getSelfPlayer()
  local nowPositionX = (selfPlayer:get()):getPositionX()
  local nowPositionY = (selfPlayer:get()):getPositionY()
  local nowPositionZ = (selfPlayer:get()):getPositionZ()
  local fixedPositionX = (math.abs)(X - nowPositionX)
  local fixedPositionY = (math.abs)(Y - nowPositionY)
  local fixedPositionZ = (math.abs)(Z - nowPositionZ)
  if fixedPositionX < enCameraValue.GoalArea and fixedPositionY < enCameraValue.GoalArea and fixedPositionZ < enCameraValue.GoalArea then
    return true
  end
  return false
end

AutoFrameCheckManager.RunningStop = function(self)
  -- function num : 0_5
  local selfPlayer = getSelfPlayer()
  local nowPositionX = (selfPlayer:get()):getPositionX()
  local nowPositionY = (selfPlayer:get()):getPositionY()
  local nowPositionZ = (selfPlayer:get()):getPositionZ()
  local position = float3(nowPositionX, nowPositionY, nowPositionZ)
  ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
end

AutoFrameCheckManager.AutoFrameCheck = function(self)
  -- function num : 0_6 , upvalues : enTimeValue, enCameraValue
  if self._maxIndex <= 0 then
    return 
  end
  local nowTick = (os.time)()
  local deltaTick = nowTick - self._prevTick
  if deltaTick < enTimeValue.Second then
    return 
  end
  local X = ((self._PositionList)[self._index])._goalX
  local Y = ((self._PositionList)[self._index])._goalY
  local Z = ((self._PositionList)[self._index])._goalZ
  local NowWhere = ((self._PositionList)[self._index])._where
  local selfPlayer = getSelfPlayer()
  if self:isArriveGoalbyPosition(X, Y, Z) == true then
    ToClient_StopNavi()
    self._index = self._index + 1
    if self._maxIndex <= self._index then
      if self._isRpeat == true then
        self._index = 0
        self._nowRepeatCount = self._nowRepeatCount + 1
        if self._maxRepeatCount <= self._nowRepeatCount and self._maxRepeatCount ~= 0 then
          OffFrameCheck()
          return 
        end
      else
        OffFrameCheck()
        return 
      end
    end
    local X1 = ((self._PositionList)[self._index])._goalX
    local Y1 = ((self._PositionList)[self._index])._goalY
    local Z1 = ((self._PositionList)[self._index])._goalZ
    local Position = float3(X1, Y1, Z1)
    ToClient_WorldMapNaviStart(Position, NavigationGuideParam(), false, true)
    self._isStop = true
    self._prevTick = (os.time)()
    return 
  end
  do
    if self._isStop == true and enTimeValue.StandingTime < deltaTick then
      self._isStop = false
      local position = float3(X, Y, Z)
      ToClient_NaviReStart()
      selfPlayerSetCameraPich(-0.4)
      self._prevTick = (os.time)()
      return 
    end
    do
      if self._isStop == true and deltaTick < enTimeValue.StandingTime then
        if not IsSelfPlayerWaitAction() then
          ToClient_StopNavi()
          return 
        end
        self:FrameCheck()
        self._cameraYaw = self._cameraYaw + enCameraValue.UpdateCameraYaw
        selfPlayerSetCameraYaw(self._cameraYaw)
        if deltaTick < enTimeValue.StandingTime_Half then
          self._cameraPitch = enCameraValue.SetCameraPich_High
        else
          self._cameraPitch = enCameraValue.SetCameraPich_Low
        end
        selfPlayerSetCameraPich(self._cameraPitch)
        return 
      end
      if self._isStop == false and enTimeValue.RunningTime < deltaTick then
        self._isStop = true
        self._cameraYaw = 0
        self._cameraPitch = 0
        self._cameraRoll = 0
        self._prevTick = (os.time)()
        self._isCaptured = false
        ToClient_StopNavi()
        return 
      end
    end
  end
end

AutoFrameCheckManager_UpdatePerFrame = function()
  -- function num : 0_7 , upvalues : AutoFrameCheckManager
  if AutoFrameCheckManager._isOn == false then
    return 
  end
  AutoFrameCheckManager:AutoFrameCheck()
end

FGlobal_AutoFrameCheck_setMinFrame = function(frame)
  -- function num : 0_8 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  AutoFrameCheckManager._minFrame = frame
end

FGlobal_AutoFrameCheck_addPositionList = function(X, Y, Z, strWhere)
  -- function num : 0_9 , upvalues : AutoFrameCheckManager
  local nowIndex = AutoFrameCheckManager._maxIndex
  local tempString = ""
  if strWhere ~= nil then
    tempString = strWhere
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R6 in 'UnsetPending'

  AutoFrameCheckManager._maxIndex = AutoFrameCheckManager._maxIndex + 1
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (AutoFrameCheckManager._PositionList)[nowIndex] = {_goalX = X, _goalY = Y, _goalZ = Z, _where = tempString}
end

FGlobal_AutoFrameCheck_resetPositionList = function()
  -- function num : 0_10 , upvalues : AutoFrameCheckManager
  FGlobal_AutoFrameCheck_Stop()
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._index = 0
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._maxIndex = 0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._prevTick = 0
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._PositionList = {}
end

FGlobal_AutoFrameCheck_Start = function()
  -- function num : 0_11 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._index = 0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._nowRepeatCount = 0
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._prevTick = 0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._isCaptured = false
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._accumulateCount = 0
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._accumulateFrame = 0
  local X = ((AutoFrameCheckManager._PositionList)[AutoFrameCheckManager._index])._goalX
  local Y = ((AutoFrameCheckManager._PositionList)[AutoFrameCheckManager._index])._goalY
  local Z = ((AutoFrameCheckManager._PositionList)[AutoFrameCheckManager._index])._goalZ
  local Position = float3(X, Y, Z)
  ToClient_WorldMapNaviStart(Position, NavigationGuideParam(), false, true)
  _PA_SVN_LOG("############################ AutoFrameCheck Start!! ####################################")
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R4 in 'UnsetPending'

  AutoFrameCheckManager._isOn = true
end

FGlobal_AutoFrameCheck_Stop = function()
  -- function num : 0_12 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._isOn = false
end

FGlobal_setAutoFrameCheckRepeat = function(value)
  -- function num : 0_13 , upvalues : AutoFrameCheckManager
  if value < 0 then
    _PA_SVN_LOG("FGlobal_setAutoFrameCheckRepeat 함수�\144 0 이하 값이 들어오면 안됩니다!!!")
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  if value == 0 then
    AutoFrameCheckManager._isRpeat = true
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    AutoFrameCheckManager._maxRepeatCount = value
  else
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

    AutoFrameCheckManager._isRpeat = true
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

    AutoFrameCheckManager._maxRepeatCount = value
  end
end

OnFrameCheck = function()
  -- function num : 0_14 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._isOn = true
end

OffFrameCheck = function()
  -- function num : 0_15 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._isOn = false
  _PA_SVN_LOG("############################ AutoFrameCheck End!! ####################################")
end

testAutoQuestStart = function()
  -- function num : 0_16
  setRunningTime(8)
  setStandingTime(2)
  FGlobal_setAutoFrameCheckRepeat(0)
  FGlobal_AutoFrameCheck_setMinFrame(80)
  FGlobal_AutoFrameCheck_addPositionList(-309323.09375, 13343.671875, -370570.78125)
  FGlobal_AutoFrameCheck_addPositionList(-306090.40625, 13897.889648, -366944.25)
  FGlobal_AutoFrameCheck_addPositionList(-289764.21875, 16052.167969, -363110.46875)
  FGlobal_AutoFrameCheck_Start()
end

testAutoQuestEnd = function()
  -- function num : 0_17
  FGlobal_AutoFrameCheck_resetPositionList()
end

setYaw = function(value)
  -- function num : 0_18
  selfPlayerSetCameraYaw(value)
end

ToClient_StopNavi = function()
  -- function num : 0_19
  ToClient_NaviMoveStop(true)
end

ToClient_ReStartNavi = function()
  -- function num : 0_20
  ToClient_NaviReStart()
end

CCAP = function()
  -- function num : 0_21
  ToClient_CaptureByFrameCheck()
end


