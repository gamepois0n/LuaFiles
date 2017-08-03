-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_dialoginteraction.luac 

-- params : ...
-- function num : 0
local AutoDialogInteractionState_Type = {NONE = 0, ESCAPE = 1, MOUSE_MOVING = 2, KEYBOARD_R = 3, ACCEPT_QUEST = 4, SELECT_REWARD = 5, COMPLETE_QUEST = 6, ACCEPT_CONFIRM = 7}
AutoState_DialogInteraction = {_state = AutoStateType.DIALOG_INTERACTION, _interactionState = AutoDialogInteractionState_Type.NONE, _pressDelay = 0, _printTime = 3, _uiMode = nil}
local AutoState_MouseMoving_TargetButton = {NONE = 0, DIALOG_ACCEPT_BUTTON = 1, DIALOG_REWARD_BUTTON = 2}
-- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.init = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.start = function(self)
  -- function num : 0_1 , upvalues : AutoDialogInteractionState_Type, AutoState_MouseMoving_TargetButton
  _interactionState = AutoDialogInteractionState_Type.NONE
  _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  _uiMode = GetUIMode()
  AutoState_DialogInteraction:checkChangeState()
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.update = function(self, deltaTime)
  -- function num : 0_2 , upvalues : AutoDialogInteractionState_Type
  if _uiMode ~= (Defines.UIMode).eUIMode_NpcDialog or (Defines.UIMode).eUIMode_NpcDialog == GetUIMode() then
    _uiMode = (Defines.UIMode).eUIMode_NpcDialog
    AutoState_DialogInteraction:checkChangeState()
  else
    return 
  end
  self._pressDelay = self._pressDelay + deltaTime
  if self._printTime < self._pressDelay then
    self._pressDelay = 0
    if _interactionState == AutoDialogInteractionState_Type.ESCAPE then
      FGlobal_AutoQuestBlackSpiritMessage("ESC 누르세요~")
      Proc_ShowMessage_Ack("ESC 누르세요~")
    else
      if _interactionState == AutoDialogInteractionState_Type.ACCEPT_QUEST then
        FGlobal_AutoQuestBlackSpiritMessage("의뢰 버튼�\132 누르세용~")
        Proc_ShowMessage_Ack("의뢰 버튼�\132 누르세용~")
      else
        if _interactionState == AutoDialogInteractionState_Type.KEYBOARD_R then
          FGlobal_AutoQuestBlackSpiritMessage("퀘스트를 받는 중입니다, R키를 눌러 인터렉션 하세요~")
          Proc_ShowMessage_Ack("퀘스트를 받는 중입니다, R키를 눌러 인터렉션 하세요~")
        else
          if _interactionState == AutoDialogInteractionState_Type.SELECT_REWARD then
            FGlobal_AutoQuestBlackSpiritMessage("보상�\132 선택하세요~")
            Proc_ShowMessage_Ack("보상�\132 선택하세요~")
          else
            if _interactionState == AutoDialogInteractionState_Type.COMPLETE_QUEST then
              FGlobal_AutoQuestBlackSpiritMessage("퀘스트를 완료하세요~~")
              Proc_ShowMessage_Ack("퀘스트를 완료하세요~~")
            else
              if _interactionState == AutoDialogInteractionState_Type.ACCEPT_CONFIRM then
                FGlobal_AutoQuestBlackSpiritMessage("퀘스트를�\188 수락하세요~~")
                Proc_ShowMessage_Ack("퀘스트를�\188 수락하세요~~")
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
  end
  self:MouseUpdate()
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.endProc = function(self)
  -- function num : 0_3
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.checkChangeState = function(self)
  -- function num : 0_4 , upvalues : AutoDialogInteractionState_Type, AutoState_MouseMoving_TargetButton
  _interactionState = AutoDialogInteractionState_Type.ESCAPE
  _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._pressDelay = self._printTime
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData ~= nil then
    local reward = dialogData:getBaseRewardCount()
    local bcount = dialogData:getFuncButtonCount()
    local newquest = dialogData:isHaveAcceptMainQuest()
    if reward == 0 and bcount ~= 0 and not newquest then
      _interactionState = AutoDialogInteractionState_Type.ESCAPE
      return 
    end
    if isQuestComplete() == true then
      if reward > 0 then
        _interactionState = AutoDialogInteractionState_Type.SELECT_REWARD
        _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.DIALOG_REWARD_BUTTON
      else
        _interactionState = AutoDialogInteractionState_Type.COMPLETE_QUEST
      end
      return 
    end
  end
  do
    local questButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
    if questButtonIndex ~= -1 then
      _interactionState = AutoDialogInteractionState_Type.ACCEPT_QUEST
      _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.DIALOG_ACCEPT_BUTTON
      return 
    end
    if isVisibleDisplayQuestButton() == true or isNextButtonShow() == true then
      _interactionState = AutoDialogInteractionState_Type.KEYBOARD_R
      _PA_LOG("�\128규보", "DisplayQuestButton")
      return 
    end
    if isVisibleAcceptButton() == true then
      _PA_LOG("�\128규보", "AcceptButton")
      _interactionState = AutoDialogInteractionState_Type.ACCEPT_CONFIRM
      return 
    end
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.MouseUpdate = function(self)
  -- function num : 0_5 , upvalues : AutoState_MouseMoving_TargetButton, AutoDialogInteractionState_Type
  if FromClient_IsClientFocused() == false then
    return 
  end
  if _mouseMovingTargetButton == AutoState_MouseMoving_TargetButton.DIALOG_ACCEPT_BUTTON then
    local pos = FGlobal_Dialog_GetFuncPositionNewQuestButton((CppEnums.ContentsType).Contents_NewQuest)
    local posX = pos._PosX + 10
    local posY = pos._PosY + Panel_Npc_Dialog:GetPosY() + 10
    if Auto_MouseMove(posX, posY) == false then
      _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
    end
  else
    do
      if _mouseMovingTargetButton == AutoState_MouseMoving_TargetButton.DIALOG_REWARD_BUTTON then
        local pos = FGlobal_getSelectRewardPosition()
        if Auto_MouseMove(pos._PosX, pos._PosY) == false then
          _interactionState = AutoDialogInteractionState_Type.COMPLETE_QUEST
          _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
        else
          _interactionState = AutoDialogInteractionState_Type.DIALOG_REWARD_BUTTON
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R2 in 'UnsetPending'

AutoState_DialogInteraction.NotifyChangeDialog = function(self)
  -- function num : 0_6
  _PA_LOG("�\128규보", "be NotifyChangeDialog")
  AutoState_DialogInteraction:checkChangeState()
end


