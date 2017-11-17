-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_tutorial.luac 

-- params : ...
-- function num : 0
AutoState_Tutorial = {_state = AutoStateType.TUTORIAL, _curMsgIndex = 0}
-- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Tutorial.init = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Tutorial.start = function(self)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_Tutorial_AccessBlackSpiritclick
  self._curMsgIndex = 0
  AutoState_Tutorial_AccessBlackSpiritclick()
end

-- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Tutorial.update = function(self, deltaTime)
  -- function num : 0_2
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Tutorial.endProc = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = nil
  self._curMsgIndex = 0
end

AutoState_Tutorial_AccessBlackSpiritclick = function()
  -- function num : 0_4
  local self = AutoState_Tutorial
  if self._curMsgIndex == 0 then
    FGlobal_AutoQuestBlackSpiritMessage("[TEST] 튜토리얼 시작. 버튼 누르�\180 다음 메세�\128 나옵니다. ")
  else
    if self._curMsgIndex == 1 then
      FGlobal_AutoQuestBlackSpiritMessage("[TEST] 튜토리얼 설명, ...불라불라....")
    else
      if self._curMsgIndex == 2 then
        FGlobal_AutoQuestBlackSpiritMessage("[TEST] 튜토리얼 설명 �\157 한번�\148 버튼 누르�\180 진행 �\160 꺼에�\148. ")
      else
        Auto_TransferState(AutoStateType.EXCEPTION_GUIDE)
        return 
      end
    end
  end
  self._curMsgIndex = self._curMsgIndex + 1
end


