-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_dialoginteraction.luac 

-- params : ...
-- function num : 0
local AutoDialogInteractionState_Type = {NONE = 0, ESCAPE = 1, MOUSE_MOVING = 2, KEYBOARD_R = 3, ACCEPT_QUEST = 4, SELECT_REWARD = 5, COMPLETE_QUEST = 6, ACCEPT_CONFIRM = 7, SELECTLIST_QUEST = 8}
AutoState_DialogInteraction = {_state = AutoStateType.DIALOG_INTERACTION, _interactionState = AutoDialogInteractionState_Type.NONE, _pressDelay = 0, _printTime = 3, _uiMode = nil, _targetQuestName = ""}
local AutoState_MouseMoving_TargetButton = {NONE = 0, DIALOG_ACCEPT_BUTTON = 1, DIALOG_REWARD_BUTTON = 2}
-- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.init = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.start = function(self)
  -- function num : 0_1 , upvalues : AutoDialogInteractionState_Type, AutoState_MouseMoving_TargetButton
  self._interactionState = AutoDialogInteractionState_Type.NONE
  self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._targetQuestName = ""
  self._uiMode = GetUIMode()
  self:checkChangeState()
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

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
                  FGlobal_AutoQuestBlackSpiritMessage("\'" .. self._targetQuestName .. "\'" .. PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DIALOG_ACCEPT_CONFIRM"))
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

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.endProc = function(self)
  -- function num : 0_3
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.checkChangeState = function(self)
  -- function num : 0_4 , upvalues : AutoDialogInteractionState_Type, AutoState_MouseMoving_TargetButton
  self._interactionState = AutoDialogInteractionState_Type.ESCAPE
  self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._pressDelay = self._printTime
  local questButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    _PA_LOG("�\128규보", "dialogData == nil, AutoState_DialogInteraction")
    return 
  end
  local reward = dialogData:getSelectRewardCount()
  local bcount = dialogData:getFuncButtonCount()
  local newquest = dialogData:isHaveAcceptMainQuest()
  if isQuestComplete() == true or dialogData:getDialogState() == (CppEnums.DialogState).eDialogState_QuestComplete then
    if reward > 0 then
      self._interactionState = AutoDialogInteractionState_Type.SELECT_REWARD
      self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.DIALOG_REWARD_BUTTON
    else
      self._interactionState = AutoDialogInteractionState_Type.COMPLETE_QUEST
    end
    return 
  end
  if isVisibleDisplayQuestButton() == false and isNextButtonShow() == false then
    local nDlgButtoncount = dialogData:getDialogButtonCount()
    if nDlgButtoncount ~= 0 then
      for i = 0, nDlgButtoncount - 1 do
        local dialogButtonLink = dialogData:getDialogButtonAt(i)
        if dialogButtonLink ~= nil and dialogButtonLink:getQuestStaticStatus() ~= nil and (dialogButtonLink:getQuestStaticStatus()):getQuestType() == (CppEnums.QuestType).eQuestType_BlackSpirit then
          self._interactionState = AutoDialogInteractionState_Type.SELECTLIST_QUEST
          self._targetQuestName = (dialogButtonLink:getQuestStaticStatus()):getTitle()
          return 
        end
      end
    end
  end
  do
    if reward == 0 and bcount ~= 0 and not newquest then
      self._interactionState = AutoDialogInteractionState_Type.ESCAPE
      return 
    end
    if questButtonIndex ~= -1 then
      self._interactionState = AutoDialogInteractionState_Type.ACCEPT_QUEST
      self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.DIALOG_ACCEPT_BUTTON
      return 
    end
    if isVisibleDisplayQuestButton() == true or isNextButtonShow() == true then
      self._interactionState = AutoDialogInteractionState_Type.KEYBOARD_R
      return 
    end
    if isVisibleAcceptButton() == true then
      self._interactionState = AutoDialogInteractionState_Type.ACCEPT_CONFIRM
      return 
    end
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.MouseUpdate = function(self)
  -- function num : 0_5 , upvalues : AutoState_MouseMoving_TargetButton, AutoDialogInteractionState_Type
  if FromClient_IsClientFocused() == false then
    return 
  end
  if self._mouseMovingTargetButton == AutoState_MouseMoving_TargetButton.DIALOG_ACCEPT_BUTTON then
    local pos = FGlobal_Dialog_GetFuncPositionNewQuestButton((CppEnums.ContentsType).Contents_NewQuest)
    local posX = pos._PosX + 10
    local posY = pos._PosY + Panel_Npc_Dialog:GetPosY() + 10
    if Auto_MouseMove(posX, posY) == false then
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

-- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.NotifyChangeDialog = function(self)
  -- function num : 0_6
  _PA_LOG("�\128규보", "be NotifyChangeDialog")
  self:checkChangeState()
end


