-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_exceptionguide.luac 

-- params : ...
-- function num : 0
AutoState_ExceptionGuide = {_state = AutoStateType.DEAD, 
_targetQuestList = {
{652, 2}
, 
{655, 5}
, 
{652, 8}
, 
{653, 6}
, 
{653, 7}
, 
{657, 2}
, 
{658, 2}
, 
{658, 3}
}
, 
_targetQuestListNoHunt = {
{652, 3}
}
, _uiQuestInfo = nil}
-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.init = function(self)
  -- function num : 0_0
  self._uiQuestInfo = nil
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.start = function(self)
  -- function num : 0_1
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo == nil or self:checkException((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest) == false then
    _PA_LOG("�\128규보", "AutoState_ExceptionGuide�\144 등록되지 않은 퀘스트는 실행�\160 �\152 없다   " .. tostring((uiQuestInfo:getQuestNo())._group) .. "    " .. tostring((uiQuestInfo:getQuestNo())._quest))
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
  self._uiQuestInfo = uiQuestInfo
  FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_EXCEPTIONGUIDE_" .. tostring((uiQuestInfo:getQuestNo())._group) .. "_" .. tostring((uiQuestInfo:getQuestNo())._quest) .. "_2"))
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.update = function(self, deltaTime)
  -- function num : 0_2
  if (self._uiQuestInfo):isSatisfied() == true then
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
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.endProc = function(self)
  -- function num : 0_3
  self._uiQuestInfo = nil
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.checkException = function(self, groupNo, questNo)
  -- function num : 0_4
  for _,tempQuest in pairs(self._targetQuestList) do
    if tempQuest[1] == groupNo and tempQuest[2] == questNo then
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

AutoState_ExceptionGuide.noHunt = function(self, groupNo, questNo)
  -- function num : 0_5
  for _,tempQuest in pairs(self._targetQuestListNoHunt) do
    if tempQuest[1] == groupNo and tempQuest[2] == questNo then
      return true
    end
  end
  return false
end


