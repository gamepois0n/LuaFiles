-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_dead.luac 

-- params : ...
-- function num : 0
local AutoDeadState_Type = {NONE = 0}
AutoState_Dead = {_state = AutoStateType.DEAD, _pressDelay = 0, _printTime = 3}
-- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

AutoState_Dead.init = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

AutoState_Dead.start = function(self)
  -- function num : 0_1
  _pressDelay = _printTime
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

AutoState_Dead.update = function(self, deltaTime)
  -- function num : 0_2
  self._pressDelay = self._pressDelay + deltaTime
  if self._printTime < self._pressDelay then
    self._pressDelay = 0
    FGlobal_AutoQuestBlackSpiritMessage("죽으셨습니다, 조건�\132 확인�\132 �\128활해주세�\148")
  end
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

AutoState_Dead.endProc = function(self)
  -- function num : 0_3
end


