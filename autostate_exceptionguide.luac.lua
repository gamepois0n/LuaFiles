-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_exceptionguide.luac 

-- params : ...
-- function num : 0
AutoState_ExceptionGuide = {_state = AutoStateType.DEAD, _pressDelay = 0, _printTime = 3, 
_targetQuestList = {
{655, 5}
}
, 
_uiQuestInfo = {}
, 
_currentQuest = {}
}
-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.init = function(self)
  -- function num : 0_0
  self._currentQuest = {}
  self._uiQuestInfo = {}
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.start = function(self)
  -- function num : 0_1
  self._pressDelay = self._printTime
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo == nil or self:checkException((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest) == false then
    _PA_LOG("�\128규보", "AutoState_ExceptionGuide�\144 등록되지 않은 퀘스트는 실행�\160 �\152 없다   " .. tostring((uiQuestInfo:getQuestNo())._group) .. "    " .. tostring((uiQuestInfo:getQuestNo())._quest))
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
  self._currentQuest = {(uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest}
  self._uiQuestInfo = uiQuestInfo
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.update = function(self, deltaTime)
  -- function num : 0_2
  self._pressDelay = self._pressDelay + deltaTime
  if self._printTime < self._pressDelay then
    self._pressDelay = 0
    FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_EXCEPTIONGUIDE_" .. tostring((self._currentQuest)[1]) .. "_" .. tostring((self._currentQuest)[2])))
  end
  if (self._uiQuestInfo):isSatisfied() == true then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
  local questCondition = nil
  if isAccepted == 0 then
    questCondition = QuestConditionCheckType.eQuestConditionCheckType_NotAccept
  else
    questCondition = QuestConditionCheckType.eQuestConditionCheckType_Progress
  end
  do
    local isComplete = questCondition == QuestConditionCheckType.eQuestConditionCheckType_Complete
    if isComplete == true then
      Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
      return 
    end
    if Auto_FindNearQuestMonster() == true then
      Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
      return 
    end
    if Auto_IsPlayerInsideQuestArea(self._uiQuestInfo) ~= 0 then
      Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
      return 
    end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.endProc = function(self)
  -- function num : 0_3
  self._currentQuest = {}
  self._uiQuestInfo = {}
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.checkException = function(self, groupNo, questNo)
  -- function num : 0_4
  for _,tempQuest in pairs(self._targetQuestList) do
    if tempQuest[1] == groupNo and tempQuest[2] == questNo then
      return true
    end
  end
  return false
end


