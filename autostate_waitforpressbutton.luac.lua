-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\auto\autostate_waitforpressbutton.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
AutoState_WaitForPressButton = {_state = AutoStateType.WAIT_FOR_PRESSBUTTON, 
_mainState = {None = 0, Normal = 1, Hunt = 2, Move = 3}
, _curMainState = 0, _curMsgIndex = 0, _updateTime = 1, _updateCurTime = 0, _isUpdateMouse = false, _isCompleteEffectOn = false, _btnPosX = 0, _btnPosY = 0, _isQuestSatisfied = false, _isNotAcceptQuest = false, _isExceptionQuest = false, _isNoHunt = false}
-- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.init = function(self)
  -- function num : 0_0
  local questWidget = PaGlobal_MainQuest._uiAutoNaviBtn
  self._btnPosX = Panel_MainQuest:GetPosX() + questWidget:GetPosX() + questWidget:GetSizeX() / 2
  self._btnPosY = Panel_MainQuest:GetPosY() + questWidget:GetPosY() + questWidget:GetSizeY() / 2
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.start = function(self)
  -- function num : 0_1
  self._questList = ToClient_GetQuestList()
  self._isUpdateMouse = false
  self._updateCurTime = 1
  self._curMainState = (self._mainState).None
  self._curMsgIndex = 0
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.update = function(self, deltaTime)
  -- function num : 0_2
  self:updateMouse(deltaTime)
  self._updateCurTime = self._updateCurTime + deltaTime
  if self._updateCurTime < self._updateTime then
    return 
  end
  self._updateCurTime = 0
  self._uiQuestInfo = (self._questList):getMainQuestInfo()
  self._isQuestSatisfied = (self._uiQuestInfo):isSatisfied()
  self._isNotAcceptQuest = (self._uiQuestInfo)._isCleared == false and (self._uiQuestInfo)._isProgressing == false
  self._isExceptionQuest = AutoState_ExceptionGuide:checkException(((self._uiQuestInfo):getQuestNo())._group, ((self._uiQuestInfo):getQuestNo())._quest)
  self._isNoHunt = AutoState_ExceptionGuide:noHunt(((self._uiQuestInfo):getQuestNo())._group, ((self._uiQuestInfo):getQuestNo())._quest)
  if self:enableMoveState() == true then
    self:setMainState((self._mainState).Move)
  elseif Auto_FindNearQuestMonster() == true and self._isNoHunt == false then
    self:setMainState((self._mainState).Hunt)
  else
    self:updateNormal(deltaTime)
  end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.endProc = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = nil
  self._curMainState = (self._mainState).None
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.updateNormal = function(self, deltaTime)
  -- function num : 0_4
  self:setMainState((self._mainState).Normal)
  if self._isExceptionQuest == true and self._isNotAcceptQuest == false then
    _PA_LOG("박규나_Auto", "updateNormal EXCEPTION_GUIDE")
    Auto_TransferState(AutoStateType.EXCEPTION_GUIDE)
  else
    if ToClient_isCheckRenderModeDialog() == true then
      _PA_LOG("박규나_Auto", "updateNormal DIALOG_INTERACTION")
      Auto_TransferState(AutoStateType.DIALOG_INTERACTION)
    else
      self:checkNormalState()
    end
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.checkNormalState = function(self)
  -- function num : 0_5 , upvalues : IM
  local meetNpcKey = ToClient_checkNearMeetNPC()
  if meetNpcKey ~= 0 then
    _PA_LOG("박규나_Auto", "updateNormal meetNpcKey")
    local meetNpcActorName = (getNpcActor(meetNpcKey)):getOriginalName()
    self:updateMessage(3, false, PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_NPC_INTERACTION_R", "characterKey", meetNpcActorName, "InteractionKey", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction)))
  else
    do
      if self._isQuestSatisfied == true then
        _PA_LOG("박규나_Auto", "updateNormal isSatisfied")
        self:SetShowCompleteEffect(true)
        if (UI.Get_ProcessorInputMode)() == IM.eProcessorInputMode_GameMode then
          self:updateMessage(4, false, PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_SHOW_MOUSE"))
        else
          self:updateMessage(5, true, PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOUSE_L_FOR_DIALOG"))
        end
      else
        if isVisibleAcceptButton() == true then
          self:updateMessage(6, false, "[TEST] isVisibleAcceptButton �\180 뭐여?")
        else
          if self._isNotAcceptQuest == true then
            self:SetShowCompleteEffect(true)
            self:updateMessage(7, true, "[TEST] 퀘스�\184 미수�\189 상태입니�\164. 의뢰�\188 받아 주세�\148.")
          else
            self:SetShowCompleteEffect(false)
            self:updateMessage(100, false, PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WANG"))
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.updateMessage = function(self, idx, isMouseUpdate, message)
  -- function num : 0_6
  if idx == self._curMsgIndex then
    return 
  end
  self._curMsgIndex = idx
  FGlobal_AutoQuestBlackSpiritMessage(message)
  self._isUpdateMouse = isMouseUpdate
  _PA_LOG("박규나_Auto", "Message : " .. tostring(message))
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.updateMouse = function(self, deltaTime)
  -- function num : 0_7
  if self._isUpdateMouse == false then
    return 
  end
  if FromClient_IsClientFocused() == false then
    return 
  end
  if isMouseMove() == true then
    self._isUpdateMouse = false
  end
  if Auto_MouseMove(self._btnPosX, self._btnPosY) == false then
    self._isUpdateMouse = false
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.setMainState = function(self, idx)
  -- function num : 0_8
  if idx == self._curMainState then
    return false
  end
  self._curMainState = idx
  self:SetShowCompleteEffect(false)
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

  if idx == (self._mainState).Normal then
    PaGlobal_AutoQuestMsg._accessBlackSpiritClick = nil
  else
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

    if idx == (self._mainState).Hunt then
      PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_Hunt_AccessBlackSpiritclick
      self:updateMessage(1, false, PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_ATTACK_POSSESSEDBY_BLACKSPIRIT"))
    else
      -- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

      if idx == (self._mainState).Move then
        PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_Move_AccessBlackSpiritclick
        if self._isExceptionQuest == true then
          self:updateMessage(2, false, PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_EXCEPTIONGUIDE_" .. tostring(((self._uiQuestInfo):getQuestNo())._group) .. "_" .. tostring(((self._uiQuestInfo):getQuestNo())._quest) .. "_0"))
        else
          self:updateMessage(3, false, PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOVE_POSSESSEDBY_BLACKSPIRIT"))
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
  -- function num : 0_9
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
  -- function num : 0_10
  Auto_TransferState(AutoStateType.HUNT)
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.SetShowCompleteEffect = function(self, isShow)
  -- function num : 0_11
  -- DECOMPILER ERROR at PC7: Unhandled construct in 'MakeBoolean' P1

  if isShow == false and self._isCompleteEffectOn == true then
    Panel_MainQuest:EraseAllEffect()
    self._isCompleteEffectOn = false
  end
  if self._isCompleteEffectOn == false and Panel_AutoQuest:IsShow() == true then
    Panel_MainQuest:AddEffect("fUI_QuestComplete_01A", true, 122, -12)
    self._isCompleteEffectOn = true
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

AutoState_WaitForPressButton.enableMoveState = function(self)
  -- function num : 0_12
  if self._isQuestSatisfied == true then
    return false
  else
    if self._isNotAcceptQuest == true then
      return false
    else
      if ToClient_checkNearMeetNPC() ~= 0 then
        return false
      else
        if Auto_IsPlayerInsideQuestArea(self._uiQuestInfo) == 0 then
          return false
        else
          return true
        end
      end
    end
  end
end


