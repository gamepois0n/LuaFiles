-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_dialoginteraction.luac 

-- params : ...
-- function num : 0
local AutoDialogInteractionState_Type = {NONE = 0, ESCAPE = 1, MOUSE_MOVING = 2, KEYBOARD_R = 3, ACCEPT_QUEST = 4, SELECT_REWARD = 5, COMPLETE_QUEST = 6, ACCEPT_CONFIRM = 7, SELECTLIST_QUEST = 8, NEEDTOLEARN_KNOWLEDGE = 9}
AutoState_DialogInteraction = {_state = AutoStateType.DIALOG_INTERACTION, _interactionState = AutoDialogInteractionState_Type.NONE, _pressDelay = 0, _printTime = 3, _uiMode = nil, _targetName = ""}
local AutoState_MouseMoving_TargetButton = {NONE = 0, DIALOG_ACCEPT_BUTTON = 1, DIALOG_REWARD_BUTTON = 2}
-- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.init = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.start = function(self)
  -- function num : 0_1 , upvalues : AutoDialogInteractionState_Type, AutoState_MouseMoving_TargetButton
  ToClient_GetKnowledgeSize()
  self._interactionState = AutoDialogInteractionState_Type.NONE
  self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._targetName = ""
  self._uiMode = GetUIMode()
  self:checkChangeState()
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.update = function(self, deltaTime)
  -- function num : 0_2 , upvalues : AutoDialogInteractionState_Type
  if ToClient_isCheckRenderModeDialog() == false then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
  if _uiMode ~= (Defines.UIMode).eUIMode_NpcDialog or (Defines.UIMode).eUIMode_NpcDialog == GetUIMode() then
    self._uiMode = (Defines.UIMode).eUIMode_NpcDialog
    if self._uiMode ~= (Defines.UIMode).eUIMode_NpcDialog then
      self:checkChangeState()
    end
  else
    return 
  end
  self._pressDelay = self._pressDelay + deltaTime
  if self._printTime < self._pressDelay then
    self._pressDelay = 0
    if self._interactionState == AutoDialogInteractionState_Type.ESCAPE then
      FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_ESCAPE"))
    else
      if self._interactionState == AutoDialogInteractionState_Type.ACCEPT_QUEST then
        FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_ACCEPT_QUEST"))
      else
        if self._interactionState == AutoDialogInteractionState_Type.KEYBOARD_R then
          FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_KEYBOARD_R"))
        else
          if self._interactionState == AutoDialogInteractionState_Type.SELECT_REWARD then
            FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_SELECT_REWARD"))
          else
            if self._interactionState == AutoDialogInteractionState_Type.COMPLETE_QUEST then
              FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_COMPLETE_QUEST"))
            else
              if self._interactionState == AutoDialogInteractionState_Type.ACCEPT_CONFIRM then
                FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_ACCEPT_CONFIRM"))
              else
                if self._interactionState == AutoDialogInteractionState_Type.SELECTLIST_QUEST then
                  FGlobal_AutoQuestBlackSpiritMessage("\'" .. self._targetName .. "\'" .. PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_ACCEPT_CONFIRM"))
                else
                  if self._interactionState == AutoDialogInteractionState_Type.NEEDTOLEARN_KNOWLEDGE then
                    FGlobal_AutoQuestBlackSpiritMessage(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_NEEDTOLEARN_KNOWLEDGE", "knowledgeName", self._targetName, "buttonName", self._targetName2))
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if ToClient_isCheckRenderModeDialog() == false then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return 
  end
  self:MouseUpdate()
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.endProc = function(self)
  -- function num : 0_3
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.checkChangeState = function(self)
  -- function num : 0_4 , upvalues : AutoDialogInteractionState_Type, AutoState_MouseMoving_TargetButton
  self._interactionState = AutoDialogInteractionState_Type.ESCAPE
  self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._pressDelay = self._printTime
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    _PA_LOG("�\128규보", "dialogData == nil, AutoState_DialogInteraction")
    return 
  end
  local reward = dialogData:getSelectRewardCount()
  local bcount = dialogData:getFuncButtonCount()
  local newMainQuest = dialogData:isHaveAcceptMainQuest()
  local questButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
  if questButtonIndex ~= -1 and newMainQuest == true then
    self._interactionState = AutoDialogInteractionState_Type.ACCEPT_QUEST
    self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.DIALOG_ACCEPT_BUTTON
    return 
  end
  if isQuestComplete() == true or dialogData:getDialogState() == (CppEnums.DialogState).eDialogState_QuestComplete then
    if reward > 0 then
      self._interactionState = AutoDialogInteractionState_Type.SELECT_REWARD
      self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.DIALOG_REWARD_BUTTON
    else
      self._interactionState = AutoDialogInteractionState_Type.COMPLETE_QUEST
    end
    return 
  end
  local nDlgButtoncount = dialogData:getDialogButtonCount()
  if isNextButtonShow() == false and newMainQuest == true then
    for i = 0, nDlgButtoncount - 1 do
      local dialogButtonLink = dialogData:getDialogButtonAt(i)
      local questStaticStatus = dialogButtonLink:getQuestStaticStatus()
      if dialogButtonLink ~= nil and questStaticStatus ~= nil and questStaticStatus:getQuestType() == (CppEnums.QuestType).eQuestType_BlackSpirit and ToClient_isProgressingQuest((questStaticStatus:getQuestNo())._group, (questStaticStatus:getQuestNo())._quest) == false then
        self._interactionState = AutoDialogInteractionState_Type.SELECTLIST_QUEST
        self._targetName = (dialogButtonLink:getQuestStaticStatus()):getTitle()
        return 
      end
    end
  end
  do
    if isNextButtonShow() == true then
      self._interactionState = AutoDialogInteractionState_Type.KEYBOARD_R
      return 
    end
    _PA_LOG("�\128규보", "-- �\128식을 얻어야하�\148 상황이라�\180;")
    local questList = ToClient_GetQuestList()
    local uiQuestInfo = questList:getMainQuestInfo()
    do
      local knowledgeList = uiQuestInfo:getKnowledgeList()
      for i = 0, knowledgeList._size - 1 do
        local keyRaw = knowledgeList:getKnowledgeKey(i)
        _PA_LOG("�\128규보", "--   " .. tostring(keyRaw) .. "   " .. tostring(ToClient_HavePushKnowledge(keyRaw)) .. "    " .. tostring(ToClient_IsLearnedKnowledge(keyRaw)))
        if ToClient_HavePushKnowledge(keyRaw) == true and ToClient_IsLearnedKnowledge(keyRaw) == false then
          self._interactionState = AutoDialogInteractionState_Type.NEEDTOLEARN_KNOWLEDGE
          self._targetName = knowledgeList:getKnowledgeName(i)
          self._targetName2 = knowledgeList:getKnowledgeButtonName(i)
          _PA_LOG("�\128규보", "--wltlr" .. tostring(self._targetName) .. "  " .. tostring(self._targetName2))
          return 
        end
      end
      _PA_LOG("�\128규보", "-- �\128식끝")
      -- DECOMPILER ERROR at PC217: Unhandled construct in 'MakeBoolean' P3

      if (reward == 0 and bcount ~= 0) or isNextButtonShow() == true then
        self._interactionState = AutoDialogInteractionState_Type.ESCAPE
        return 
      end
      if isVisibleAcceptButton() == true then
        self._interactionState = AutoDialogInteractionState_Type.ACCEPT_CONFIRM
        return 
      end
    end
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.MouseUpdate = function(self)
  -- function num : 0_5 , upvalues : AutoState_MouseMoving_TargetButton, AutoDialogInteractionState_Type
  if FromClient_IsClientFocused() == false then
    return 
  end
  if isMouseMove() == true then
    self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
    return 
  end
  if self._mouseMovingTargetButton == AutoState_MouseMoving_TargetButton.DIALOG_ACCEPT_BUTTON then
    local pos = FGlobal_Dialog_GetFuncPositionNewQuestButton((CppEnums.ContentsType).Contents_NewQuest)
    local posX = pos._PosX + 10
    local posY = pos._PosY + Panel_Npc_Dialog:GetPosY() + 10
    if pos._Return == false then
      _PA_LOG("�\128규보", "MouseUpdate, 새로�\180 의뢰 버튼�\132 찾을 �\152 없다")
    end
    if pos._Return == false or Auto_MouseMove(posX, posY) == false then
      self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
    end
  else
    do
      if self._mouseMovingTargetButton == AutoState_MouseMoving_TargetButton.DIALOG_REWARD_BUTTON then
        local pos = FGlobal_getSelectRewardPosition()
        if Auto_MouseMove(pos._PosX, pos._PosY) == false then
          self._interactionState = AutoDialogInteractionState_Type.COMPLETE_QUEST
          self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
          _PA_LOG("�\128규보", "DIALOG_REWARD_BUTTON NONE")
        else
          self._interactionState = AutoDialogInteractionState_Type.DIALOG_REWARD_BUTTON
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.NotifyChangeDialog = function(self)
  -- function num : 0_6
  _PA_LOG("�\128규보", "be NotifyChangeDialog")
  self:checkChangeState()
end


