-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\auto_clientcall.luac 

-- params : ...
-- function num : 0
FromClient_AutoStart = function()
  -- function num : 0_0
  PaGlobal_AutoManager:start()
end

FromClient_AutoStop = function()
  -- function num : 0_1
  FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_END"))
  PaGlobal_AutoManager:stop()
end

FromClient_Auto_StartNaviMove = function()
  -- function num : 0_2
  local navi = ToClient_currentNaviisMainQuest()
  if navi or AutoState_Move:isReservation() == true then
    Auto_TransferState(AutoStateType.MOVE)
  end
end

FromClient_Auto_EndNaviMove = function()
  -- function num : 0_3
  if ToClient_getAutoMode() == (CppEnums.Client_AutoControlStateType).BATTLE then
    Auto_TransferState(AutoStateType.HUNT)
    return 
  end
  if PaGlobal_AutoManager._stateUnit ~= nil and (PaGlobal_AutoManager._stateUnit)._state == AutoStateType.MOVE and AutoState_Move:isReservation() == true then
    FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_EXCEPTIONCONDITION"))
    PaGlobal_AutoManager:stop()
    return 
  end
  if ToClient_getNaviEndPointDist() < 200 and Auto_FindNearQuestMonster() == true then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
  else
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
  end
end

FromClient_Auto_EndNaviMove_dueUserControl = function()
  -- function num : 0_4
end

FromClient_Auto_SomeQuestClear = function(questNo)
  -- function num : 0_5
  Auto_QuestClearNotify(questNo)
end

FromClient_Auto_FindWayEnd = function()
  -- function num : 0_6
  FromClient_Auto_EndNaviMove()
end

FromClient_Auto_NotifyChangetoBattle_dueMobBlockWay = function()
  -- function num : 0_7
  AutoState_Hunt:setReserveReason(AutoHuntState_Type.EXISTNEARMONSTER)
  Auto_TransferState(AutoStateType.HUNT)
end

FromClient_Auto_NotifyDead = function()
  -- function num : 0_8
  Auto_TransferState(AutoStateType.DEAD)
end

FromClient_Auto_NotifyRevive = function()
  -- function num : 0_9
  if PaGlobal_AutoManager._ActiveState == true then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
  end
end

registerEvent("FromClient_Auto_StartNaviMove", "FromClient_Auto_StartNaviMove")
registerEvent("FromClient_Auto_EndNaviMove", "FromClient_Auto_EndNaviMove")
registerEvent("FromClient_Auto_EndNaviMove_dueUserControl", "FromClient_Auto_EndNaviMove_dueUserControl")
registerEvent("FromClient_Auto_SomeQuestClear", "FromClient_Auto_SomeQuestClear")
registerEvent("FromClient_AutoStart", "FromClient_AutoStart")
registerEvent("FromClient_AutoStop", "FromClient_AutoStop")
registerEvent("FromClient_Auto_FindWayEnd", "FromClient_Auto_FindWayEnd")
registerEvent("FromClient_Auto_NotifyChangetoBattle_dueMobBlockWay", "FromClient_Auto_NotifyChangetoBattle_dueMobBlockWay")
registerEvent("FromClient_Auto_NotifyDead", "FromClient_Auto_NotifyDead")
registerEvent("FromClient_Auto_NotifyRevive", "FromClient_Auto_NotifyRevive")

