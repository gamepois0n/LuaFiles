-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_move.luac 

-- params : ...
-- function num : 0
AutoMoveState_Type = {NONE = 0, TO_NPC_FOR_START_QUEST = 1, TO_NPC_FOR_FINISH_QUEST = 2, SANDWICHED = 3, TO_TOWN_DUE_FULLINVEN = 4, TO_TOWN_DUE_TOOHEAVY = 5}
AutoState_Move = {_state = AutoStateType.MOVE, _moveflag = AutoMoveState_Type.None, _reserveReason = AutoMoveState_Type.None, _pressDelay = 0, _pressDelay_forHalfSecond = 0, _printTime = 3}
-- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Move.init = function(self)
  -- function num : 0_0
  self._moveflag = AutoMoveState_Type.None
  self._reserveReason = AutoMoveState_Type.None
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Move.start = function(self)
  -- function num : 0_1
  self._moveflag = self._reserveReason
  if self._moveflag == AutoMoveState_Type.TO_TOWN_DUE_FULLINVEN or self._moveflag == AutoMoveState_Type.TO_TOWN_DUE_TOOHEAVY then
    self._pressDelay = self._printTime
  end
  self._pressDelay_forHalfSecond = 0
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Move.update = function(self, deltaTime)
  -- function num : 0_2
  self._pressDelay = self._pressDelay + deltaTime
  if self._printTime < self._pressDelay then
    self._pressDelay = 0
    if self._moveflag == AutoMoveState_Type.TO_TOWN_DUE_FULLINVEN then
      FGlobal_AutoQuestBlackSpiritMessage("인벤토리�\128 �\128득차�\156 안전�\156 장소�\156 �\128환중입니다~")
    else
      if self._moveflag == AutoMoveState_Type.TO_TOWN_DUE_TOOHEAVY then
        FGlobal_AutoQuestBlackSpiritMessage("소지 무게량이 너무 무거�\140 안전�\156 장소�\156 �\128환중입니다~")
      else
        FGlobal_AutoQuestBlackSpiritMessage("오토�\156 인한 이동중입니다~")
      end
    end
  end
  local navi = ToClient_currentNaviisMainQuest()
  if navi == false then
    _PA_LOG("�\128규보", "(navi == false)")
    FromClient_Auto_EndNaviMove()
    return 
  end
  if (getSelfPlayer()):isNavigationMoving() == false then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
  self._pressDelay_forHalfSecond = self._pressDelay_forHalfSecond + deltaTime
  if self._pressDelay_forHalfSecond > 0.5 then
    self._pressDelay_forHalfSecond = 0
    local length = ToClient_getPhysicalSpeedforFIndway()
    if length < 35 then
      self._moveflag = AutoMoveState_Type.SANDWICHED
      if ToClient_pushStuckPostion() then
        if ToClient_Auto_IsClimbAble() ~= true or ToClient_Auto_CheckExistNearMonster(300) == true then
          ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).BATTLE)
          FromClient_Auto_NotifyChangetoBattle_dueMobBlockWay()
        else
          ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).FINDWAY)
        end
        _PA_LOG("�\128규보", "length < 35      NaviEndPosDist: " .. tostring(ToClient_getNaviEndPointDist()))
        return 
      end
    end
  end
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Move.endProc = function(self)
  -- function num : 0_3
  self._reserveReason = AutoMoveState_Type.None
  ToClient_StopNavi()
  ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).NONE)
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Move.setReserveReason = function(self, reason)
  -- function num : 0_4
  self._reserveReason = reason
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Move.isReservation = function(self)
  -- function num : 0_5
  if self._reserveReason == AutoMoveState_Type.TO_TOWN_DUE_FULLINVEN or self._reserveReason == AutoMoveState_Type.TO_TOWN_DUE_TOOHEAVY then
    return true
  end
  return false
end


