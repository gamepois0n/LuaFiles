-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_hunt.luac 

-- params : ...
-- function num : 0
AutoHuntState_Type = {NONE = 0, EXISTNEARMONSTER = 1}
AutoState_Hunt = {_state = AutoStateType.HUNT, _reserveReason = AutoHuntState_Type.NONE, _pressDelay = 0, _satisCheckTime = 3}
-- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.init = function(self)
  -- function num : 0_0
  _reserveReason = AutoHuntState_Type.NONE
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.start = function(self)
  -- function num : 0_1
  if ToClient_getAutoMode() ~= (CppEnums.Client_AutoControlStateType).BATTLE then
    ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).BATTLE)
  end
  FGlobal_AutoQuestBlackSpiritMessage("자동 사냥 시작")
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.update = function(self, deltaTime)
  -- function num : 0_2
  self._pressDelay = self._pressDelay + deltaTime
  if self._pressDelay < self._satisCheckTime then
    return 
  end
  self._pressDelay = 0
  FGlobal_AutoQuestBlackSpiritMessage("자동 사냥 중입니다")
  local questList = ToClient_GetQuestList()
  if questList:isMainQuestClearAll() == true then
    return 
  end
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo ~= nil and uiQuestInfo:isSatisfied() == true then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    _PA_LOG("�\128규보", "AutoState_Hunt - TransterState -> WAIT_FOR_PRESSBUTTON(uiQuestInfo:isSatisfied)")
    return 
  end
  -- DECOMPILER ERROR at PC48: Unhandled construct in 'MakeBoolean' P1

  if _reserveReason == AutoHuntState_Type.EXISTNEARMONSTER and ToClient_Auto_CheckExistNearMonster(300) == false then
    FGlobal_AutoQuestBlackSpiritMessage("주변�\144 �\128상이 없어�\156 상태�\188 전환합니�\164")
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    _PA_LOG("�\128규보", "AutoState_Hunt - TransterState -> WAIT_FOR_PRESSBUTTON(ToClient_Auto_CheckExistNearMonster(300))")
  end
  local selfPlayer = (getSelfPlayer()):get()
  if Auto_FindNearQuestMonster() == false then
    FGlobal_AutoQuestBlackSpiritMessage("주변�\144 �\128상이 없어�\156 상태�\188 전환합니�\164")
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    _PA_LOG("�\128규보", "AutoState_Hunt - TransterState -> WAIT_FOR_PRESSBUTTON(findNearQuestMonster())")
    return 
  end
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.endProc = function(self)
  -- function num : 0_3
  ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).NONE)
  _reserveReason = AutoHuntState_Type.NONE
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.setReserveReason = function(self, reason)
  -- function num : 0_4
  _reserveReason = reason
end


