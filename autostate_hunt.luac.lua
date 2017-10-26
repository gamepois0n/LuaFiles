-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_hunt.luac 

-- params : ...
-- function num : 0
AutoHuntState_Type = {NONE = 0, EXISTNEARMONSTER = 1}
AutoState_Hunt = {_state = AutoStateType.HUNT, _reserveReason = AutoHuntState_Type.NONE, _pressDelay = 0, _satisCheckTime = 3}
-- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.init = function(self)
  -- function num : 0_0
  self._reserveReason = AutoHuntState_Type.NONE
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.start = function(self)
  -- function num : 0_1
  if ToClient_getAutoMode() ~= (CppEnums.Client_AutoControlStateType).BATTLE then
    ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).BATTLE)
  end
  FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_HUNT_START"))
  PaGlobal_AutoQuestMsg:AniStart()
  FGlobal_AutoQuest_KeyViewer_Show()
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_StopHunt_AccessBlackSpiritclick
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.update = function(self, deltaTime)
  -- function num : 0_2
  self._pressDelay = self._pressDelay + deltaTime
  if self._pressDelay < self._satisCheckTime then
    return 
  end
  self._pressDelay = 0
  FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_HUNT_HUNTING"))
  local questList = ToClient_GetQuestList()
  if questList == nil or questList:isMainQuestClearAll() == true then
    return 
  end
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo ~= nil and uiQuestInfo:isSatisfied() == true then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
  -- DECOMPILER ERROR at PC54: Unhandled construct in 'MakeBoolean' P1

  if self._reserveReason == AutoHuntState_Type.EXISTNEARMONSTER and ToClient_Auto_CheckExistNearMonster(300) == false then
    FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_HUNT_CHANGESTATE_DUETO_CANTFIND_TARGET"))
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
  if Auto_FindNearQuestMonster() == false then
    FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_HUNT_CHANGESTATE_DUETO_CANTFIND_TARGET"))
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.endProc = function(self)
  -- function num : 0_3
  ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).NONE)
  self._reserveReason = AutoHuntState_Type.NONE
  PaGlobal_AutoQuestMsg:AniStop()
  ;
  ((PaGlobal_AutoQuestMsg._ui)._staticBlackSpirit):EraseAllEffect()
  ;
  ((PaGlobal_AutoQuestMsg._ui)._staticBlackSpirit):AddEffect("fN_DarkSpirit_Idle_2_AutoQuest", true, -50, -70)
  FGlobal_AutoQuest_KeyViewer_Hide()
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

AutoState_Hunt.setReserveReason = function(self, reason)
  -- function num : 0_4
  self._reserveReason = reason
end

AutoState_StopHunt_AccessBlackSpiritclick = function()
  -- function num : 0_5
  Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
end


