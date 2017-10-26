-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_waitforpressbutton.luac 

-- params : ...
-- function num : 0
AutoState_WaitForPressButton = {_state = AutoStateType.WAIT_FOR_PRESSBUTTON, 
_mainState = {None = 0, Normal = 1, Hunt = 2, Move = 3}
, _curMainState = 0, _updateTime = 1, _updateCurTime = 0, _isUpdateMouse = false, _btnPosX = 0, _btnPosY = 0}
-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.init = function(self)
  -- function num : 0_0
  local questWidget = PaGlobal_MainQuest._uiAutoNaviBtn
  self._btnPosX = Panel_MainQuest:GetPosX() + questWidget:GetPosX() + questWidget:GetSizeX() / 2
  self._btnPosY = Panel_MainQuest:GetPosY() + questWidget:GetPosY() + questWidget:GetSizeY() / 2
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.start = function(self)
  -- function num : 0_1
  self._questList = ToClient_GetQuestList()
  self._isUpdateMouse = false
  self._updateCurTime = 1
  self._curMainState = (self._mainState).None
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.update = function(self, deltaTime)
  -- function num : 0_2
  self:updateMouse(deltaTime)
  self._updateCurTime = self._updateCurTime + deltaTime
  if self._updateCurTime < self._updateTime then
    return 
  end
  self._updateCurTime = 0
  self._uiQuestInfo = (self._questList):getMainQuestInfo()
  if Auto_IsPlayerInsideQuestArea(self._uiQuestInfo) == 0 then
    if Auto_FindNearQuestMonster() == true then
      self:setMainState((self._mainState).Hunt)
    else
      self:updateNormal(deltaTime)
    end
  else
    if self:enableMoveState() == true then
      self:setMainState((self._mainState).Move)
    else
      self:updateNormal(deltaTime)
    end
  end
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.endProc = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = nil
  self._curMainState = (self._mainState).None
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.updateNormal = function(self, deltaTime)
  -- function num : 0_4
  if self:setMainState((self._mainState).Normal) == false then
    return 
  end
  if AutoState_ExceptionGuide:checkException(((self._uiQuestInfo):getQuestNo())._group, ((self._uiQuestInfo):getQuestNo())._quest) == true then
    _PA_LOG("박규나_Auto", "updateNormal EXCEPTION_GUIDE")
    Auto_TransferState(AutoStateType.EXCEPTION_GUIDE)
    return 
  end
  if ToClient_isCheckRenderModeDialog() == true then
    _PA_LOG("박규나_Auto", "updateNormal DIALOG_INTERACTION")
    Auto_TransferState(AutoStateType.DIALOG_INTERACTION)
    return 
  end
  local meetNpcKey = ToClient_checkNearMeetNPC()
  if meetNpcKey ~= 0 then
    _PA_LOG("박규나_Auto", "updateNormal meetNpcKey")
    local meetNpcActorName = (getNpcActor(meetNpcKey)):getName()
    FGlobal_AutoQuestBlackSpiritMessage(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_NPC_INTERACTION_R", "characterKey", meetNpcActorName, "InteractionKey", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction)))
  else
    do
      if (self._uiQuestInfo):isSatisfied() == true then
        _PA_LOG("박규나_Auto", "updateNormal isSatisfied")
        self:questCompleteMarkEffect(120, -50)
        FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOUSE_L_FOR_DIALOG"))
      else
        if isVisibleAcceptButton() == true then
          FGlobal_AutoQuestBlackSpiritMessage("[TEST] isVisibleAcceptButton �\180 뭐여?")
        else
          if (self._uiQuestInfo)._isCleared == false and (self._uiQuestInfo)._isProgressing == false then
            FGlobal_AutoQuestBlackSpiritMessage("[TEST] 의뢰�\128 없는 상태..?")
          else
            FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WANG"))
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.updateMouse = function(self, deltaTime)
  -- function num : 0_5
  if self._isUpdateMouse == false then
    return 
  end
  if FromClient_IsClientFocused() == false then
    return 
  end
  _PA_LOG("박규나_Auto", "updateMouse")
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.setMainState = function(self, idx)
  -- function num : 0_6
  if idx == self._curMainState then
    return false
  end
  self._curMainState = idx
  if Panel_AutoQuest:IsShow() == true then
    Panel_MainQuest:EraseAllEffect()
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  if idx == (self._mainState).Normal then
    PaGlobal_AutoQuestMsg._accessBlackSpiritClick = nil
  else
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

    if idx == (self._mainState).Hunt then
      PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_Hunt_AccessBlackSpiritclick
      FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_ATTACK_POSSESSEDBY_BLACKSPIRIT"))
    else
      -- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

      if idx == (self._mainState).Move then
        PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_Move_AccessBlackSpiritclick
        if AutoState_ExceptionGuide:checkException(((self._uiQuestInfo):getQuestNo())._group, ((self._uiQuestInfo):getQuestNo())._quest) == true then
          FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_EXCEPTIONGUIDE_" .. tostring(((self._uiQuestInfo):getQuestNo())._group) .. "_" .. tostring(((self._uiQuestInfo):getQuestNo())._quest) .. "_0"))
        else
          FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOVE_POSSESSEDBY_BLACKSPIRIT"))
        end
      else
        _PA_LOG("박규나_Auto", "[ERROR] setMainState : " .. tostring(idx))
      end
    end
  end
  local mainStateSting = {"Normal", "Hunt", "Move"; [0] = "None"}
  _PA_LOG("박규나_Auto", "setMainState : " .. tostring(mainStateSting[idx]) .. " , ClickFunc : " .. tostring(PaGlobal_AutoQuestMsg._accessBlackSpiritClick))
  return true
end

AutoState_Move_AccessBlackSpiritclick = function()
  -- function num : 0_7
  _PA_LOG("박규나_Auto", "AutoState_Move_AccessBlackSpiritclick")
  local self = AutoState_WaitForPressButton
  local questCondition = nil
  if (self._uiQuestInfo):isSatisfied() == true then
    questCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
  else
    questCondition = QuestConditionCheckType.eQuestConditionCheckType_Progress
  end
  if ToClient_currentNaviisMainQuest() == false then
    _QuestWidget_FindTarget_DrawMapPath(((self._uiQuestInfo):getQuestNo())._group, ((self._uiQuestInfo):getQuestNo())._quest, questCondition, false)
  else
    if ToClient_getNaviEndPointDist() < 300 then
      ToClient_DeleteNaviGuideByGroup(0)
      _QuestWidget_FindTarget_DrawMapPath(((self._uiQuestInfo):getQuestNo())._group, ((self._uiQuestInfo):getQuestNo())._quest, questCondition, false)
    end
  end
  ToClient_NaviReStart()
end

AutoState_Hunt_AccessBlackSpiritclick = function()
  -- function num : 0_8
  Auto_TransferState(AutoStateType.HUNT)
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.questCompleteMarkEffect = function(self, posX, posY)
  -- function num : 0_9
  if Panel_AutoQuest:IsShow() == true then
    Panel_MainQuest:AddEffect("UI_ArrowMark02", true, posX, posY)
  else
    _PA_LOG("박규나_Auto", " Panel_AutoQuest 꺼져 있어....")
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

AutoState_WaitForPressButton.enableMoveState = function(self)
  -- function num : 0_10
  if (self._uiQuestInfo):isSatisfied() == true then
    return false
  else
    if (self._uiQuestInfo)._isProgressing == false and (self._uiQuestInfo)._isCleared == false then
      return false
    else
      return true
    end
  end
end


