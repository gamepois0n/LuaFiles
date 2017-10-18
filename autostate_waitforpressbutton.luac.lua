-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\autostate_waitforpressbutton.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local AutoState_MouseMoving_TargetButton = {NONE = 0, AUTO_NAVI_BUTTON = 1}
AutoState_WaitForPressButton = {_state = AutoStateType.WAIT_FOR_PRESSBUTTON, 
MAINSTATE = {NONE = 0, NORMAL = 1, NEED_TO_MOVE = 2, NEED_TO_HUNT = 3}
, 
SUBSTATE = {NONE = 0, MOUSE_L = 1, MOUSE_L_FOR_DIALOG = 2, KEYBOARD_R = 3, MOUSE_MOVING = 4, SELET_REWARD = 5, SHOW_MOUSE = 6, ESCAPE = 7, NAVIGATION_T = 8, AUTONAVIMOVE_CLICK = 9, MOUSE_L_FOR_ACCEPT = 10, NPC_INTERACTION_R = 11}
, _mainState = 0, _subState = 0, _pressDelay = 0, _printTime = 3, _updateChangeDelay = 0, _updateChangeTime = 1, _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE, _mouseVisible = false, _meetToggle = false, _meetNpcActorKey = 0, _meetNpcActorName = ""}
-- DECOMPILER ERROR at PC44: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.init = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.start = function(self)
  -- function num : 0_1 , upvalues : AutoState_MouseMoving_TargetButton, IM
  self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._mainState = (self.MAINSTATE).NONE
  self._subState = (self.SUBSTATE).NONE
  self._mouseVisible = (UI.Get_ProcessorInputMode)() == IM.eProcessorInputMode_GameMode
  self._meetNpcActorKey = 0
  self:checkChangeState()
  self._renderingModeChange = ToClient_isCheckRenderModeDialog()
  self._meetToggle = ToClient_checkNearMeetNPC()
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.printMessage = function(self)
  -- function num : 0_2
  if self._mainState == (AutoState_WaitForPressButton.MAINSTATE).NORMAL then
    if self._subState == (AutoState_WaitForPressButton.SUBSTATE).MOUSE_L then
      FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOUSE_L"))
    else
      if self._subState == (AutoState_WaitForPressButton.SUBSTATE).MOUSE_L_FOR_DIALOG then
        FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOUSE_L_FOR_DIALOG"))
      else
        if self._subState == (AutoState_WaitForPressButton.SUBSTATE).MOUSE_L_FOR_ACCEPT then
          FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOUSE_L_FOR_ACCEPT"))
        else
          if self._subState == (AutoState_WaitForPressButton.SUBSTATE).KEYBOARD_R then
            FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_KEYBOARD_R"))
          else
            if self._subState == (AutoState_WaitForPressButton.SUBSTATE).MOUSE_MOVING then
              FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOUSE_L_FOR_DIALOG"))
            else
              if self._subState == (AutoState_WaitForPressButton.SUBSTATE).SELET_REWARD then
                FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_SELET_REWARD"))
              else
                if self._subState == (AutoState_WaitForPressButton.SUBSTATE).SHOW_MOUSE then
                  FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_SHOW_MOUSE"))
                else
                  if self._subState == (AutoState_WaitForPressButton.SUBSTATE).NAVIGATION_T then
                    FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOVE_POSSESSEDBY_BLACKSPIRIT"))
                  else
                    if self._subState == (AutoState_WaitForPressButton.SUBSTATE).NPC_INTERACTION_R then
                      FGlobal_AutoQuestBlackSpiritMessage(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_NPC_INTERACTION_R", "characterKey", self._meetNpcActorName, "InteractionKey", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction)))
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  else
    if self._mainState == (AutoState_WaitForPressButton.MAINSTATE).NEED_TO_MOVE then
      if self._subState == (AutoState_WaitForPressButton.SUBSTATE).NPC_INTERACTION_R then
        FGlobal_AutoQuestBlackSpiritMessage(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_NPC_INTERACTION_R", "characterKey", self._meetNpcActorName, "InteractionKey", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction)))
      else
        FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_MOVE_POSSESSEDBY_BLACKSPIRIT"))
      end
    else
      if self._mainState == (AutoState_WaitForPressButton.MAINSTATE).NEED_TO_HUNT then
        FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_ATTACK_POSSESSEDBY_BLACKSPIRIT"))
      end
    end
  end
  if self._subState == (AutoState_WaitForPressButton.SUBSTATE).NPC_INTERACTION_R then
    FGlobal_AutoQuestBlackSpiritMessage(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_NPC_INTERACTION_R", "characterKey", self._meetNpcActorName, "InteractionKey", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction)))
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.update = function(self, deltaTime)
  -- function num : 0_3 , upvalues : IM
  self._pressDelay = self._pressDelay + deltaTime
  self._updateChangeDelay = self._updateChangeDelay + deltaTime
  self:MouseUpdate()
  if self._printTime < self._pressDelay then
    self._pressDelay = 0
    self:printMessage()
  end
  if self._updateChangeTime < self._updateChangeDelay then
    self._updateChangeDelay = 0
    local questList = ToClient_GetQuestList()
    local uiQuestInfo = questList:getMainQuestInfo()
    if self._mainState == (self.MAINSTATE).NEED_TO_MOVE and (Auto_IsPlayerInsideQuestArea(uiQuestInfo) == 0 or Auto_FindNearQuestMonster() == true) then
      self:checkChangeState()
      return 
    else
      if self._mainState == (self.MAINSTATE).NEED_TO_HUNT and (Auto_IsPlayerInsideQuestArea(uiQuestInfo) ~= 0 or Auto_FindNearQuestMonster() == false) then
        self:checkChangeState()
        return 
      end
    end
    if uiQuestInfo._isCleared then
      local isAccepted = uiQuestInfo._isProgressing
    end
    if self._subState == (AutoState_WaitForPressButton.SUBSTATE).NPC_INTERACTION_R and ToClient_checkNearMeetNPC() == false then
      self:checkChangeState()
    else
      if (uiQuestInfo:isSatisfied() == 0 or isAccepted == false) and ToClient_checkNearMeetNPC() ~= 0 then
        self:checkChangeState()
      end
    end
  end
  do
    local mouseVisible = (UI.Get_ProcessorInputMode)() == IM.eProcessorInputMode_GameMode
    if mouseVisible ~= self._mouseVisible then
      self._mouseVisible = mouseVisible
      self:checkChangeState()
      return 
    end
    if ToClient_isCheckRenderModeDialog() == true then
      Auto_TransferState(AutoStateType.DIALOG_INTERACTION)
      return 
    end
    local questList = ToClient_GetQuestList()
    local uiQuestInfo = questList:getMainQuestInfo()
    do
      if uiQuestInfo:isjustMeetNpc() == true then
        local meetToggle = ToClient_checkNearMeetNPC()
        if self._meetToggle ~= meetToggle then
          self._meetToggle = meetToggle
          return 
        end
      end
      -- DECOMPILER ERROR: 4 unprocessed JMP targets
    end
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.endProc = function(self)
  -- function num : 0_4
  self._mainState = (self.MAINSTATE).NONE
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = nil
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.checkChangeState = function(self)
  -- function num : 0_5 , upvalues : IM, AutoState_MouseMoving_TargetButton
  self:statesInit()
  local questList = ToClient_GetQuestList()
  if questList == nil then
    _PA_ASSERT(false, "Quest 정보�\128 nil입니�\164..AutoState_WaitForPressButton:start")
    return 
  end
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo == nil then
    return 
  end
  local navi = ToClient_currentNaviisMainQuest()
  local isAccepted = 1
  local selfPlayer = (getSelfPlayer()):get()
  if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    isAccepted = 0
  end
  local questCondition = nil
  if uiQuestInfo:isSatisfied() == true then
    questCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
  else
    if isAccepted == 0 then
      questCondition = QuestConditionCheckType.eQuestConditionCheckType_NotAccept
    else
      questCondition = QuestConditionCheckType.eQuestConditionCheckType_Progress
    end
  end
  local isComplete = questCondition == QuestConditionCheckType.eQuestConditionCheckType_Complete
  local questStatic = questList_getQuestStatic((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest)
  local accecptNpc = (questStatic:getAccecptNpc()):get()
  local isCompleteBlackSpirit = questStatic:isCompleteBlackSpirit()
  local resIsPlayerInsideQuestArea = Auto_IsPlayerInsideQuestArea(uiQuestInfo)
  do
    local isPlayerInsideQuestArea = resIsPlayerInsideQuestArea == 0
    if isAccepted == 0 then
      if accecptNpc ~= 0 then
        self:setMainState((self.MAINSTATE).NEED_TO_MOVE)
      else
        self:setMainState((self.MAINSTATE).NORMAL)
      end
    elseif isComplete == false then
      if Auto_FindNearQuestMonster() == true then
        self:setMainState((self.MAINSTATE).NEED_TO_HUNT)
      else
        self:setMainState((self.MAINSTATE).NEED_TO_MOVE)
        if isPlayerInsideQuestArea == true and AutoState_ExceptionGuide:checkException((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest) == true then
          Auto_TransferState(AutoStateType.EXCEPTION_GUIDE)
          return 
        end
      end
    else
      -- DECOMPILER ERROR at PC137: Unhandled construct in 'MakeBoolean' P3

      if (isComplete == true and isCompleteBlackSpirit == true) or isComplete ~= false or isComplete == false and accecptNpc == 0 and isCompleteBlackSpirit == true then
        self:setMainState((self.MAINSTATE).NORMAL)
      else
        self:setMainState((self.MAINSTATE).NORMAL)
      end
    end
    self._pressDelay = self._printTime
    if navi == true and ToClient_getNaviEndPointDist() > 200 and (self.MAINSTATE).NEED_TO_HUNT ~= self._mainState then
      self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).NAVIGATION_T)
      -- DECOMPILER ERROR at PC163: Confused about usage of register: R4 in 'UnsetPending'

      PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_NeedToMove_AccessBlackSpiritclick
      return 
    end
    if self._mainState ~= (self.MAINSTATE).NEED_TO_MOVE or isAccepted ~= 0 or accecptNpc ~= 0 then
      do
        local meetNpcKey = ToClient_checkNearMeetNPC()
        if meetNpcKey ~= 0 then
          self._meetNpcActorKey = meetNpcKey
          self._meetNpcActorName = (getNpcActor(self._meetNpcActorKey)):getName()
          self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).NPC_INTERACTION_R)
          return 
        end
        if (UI.Get_ProcessorInputMode)() == IM.eProcessorInputMode_GameMode then
          self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).SHOW_MOUSE)
          return 
        end
        if uiQuestInfo:isSatisfied() == 0 then
          self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).MOUSE_MOVING)
          self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.AUTO_NAVI_BUTTON
          return 
        end
        if self._mainState == (self.MAINSTATE).NORMAL then
          self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).MOUSE_MOVING)
          self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.AUTO_NAVI_BUTTON
        end
        -- DECOMPILER ERROR: 17 unprocessed JMP targets
      end
    end
  end
end

AutoState_NeedToMove_AccessBlackSpiritclick = function()
  -- function num : 0_6
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  local resIsPlayerInsideQuestArea = Auto_IsPlayerInsideQuestArea(uiQuestInfo)
  local isPlayerInsideQuestArea = resIsPlayerInsideQuestArea == 0
  local questStatic = (questList_getQuestStatic((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest))
  do
    local questCondition = nil
    if uiQuestInfo:isSatisfied() == true then
      questCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
    elseif isAccepted == 0 then
      questCondition = QuestConditionCheckType.eQuestConditionCheckType_NotAccept
    else
      questCondition = QuestConditionCheckType.eQuestConditionCheckType_Progress
    end
    if ToClient_currentNaviisMainQuest() == false then
      _QuestWidget_FindTarget_DrawMapPath((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest, questCondition, false)
    elseif ToClient_getNaviEndPointDist() < 500 then
      ToClient_DeleteNaviGuideByGroup(0)
      _QuestWidget_FindTarget_DrawMapPath((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest, questCondition, false)
    end
    ToClient_NaviReStart()
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

AutoState_NeedToHunt_AccessBlackSpiritclick = function()
  -- function num : 0_7
  Auto_TransferState(AutoStateType.HUNT)
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.MouseUpdate = function(self)
  -- function num : 0_8 , upvalues : AutoState_MouseMoving_TargetButton
  if FromClient_IsClientFocused() == false or self._subState ~= (AutoState_WaitForPressButton.SUBSTATE).MOUSE_MOVING then
    return 
  end
  if self._mouseMovingTargetButton == AutoState_MouseMoving_TargetButton.AUTO_NAVI_BUTTON then
    local questWidget = PaGlobal_MainQuest._uiAutoNaviBtn
    local posX = Panel_MainQuest:GetPosX()
    local posY = Panel_MainQuest:GetPosY()
    if questWidget:GetShow() == true then
      posX = posX + questWidget:GetPosX() + questWidget:GetSizeX() / 2
      posY = posY + questWidget:GetPosY() + questWidget:GetSizeY() / 2
    else
      posX = posX + 25
      posY = posY + 10
      _PA_LOG("�\128규보", "MouseUpdate, 오토네비 버튼�\132 찾을 �\152 없다")
    end
    if Auto_MouseMove(posX, posY) == false then
      local questList = ToClient_GetQuestList()
      local uiQuestInfo = questList:getMainQuestInfo()
      if uiQuestInfo:isSatisfied() == true or not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
        self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).MOUSE_L_FOR_DIALOG)
      else
        if isVisibleAcceptButton() == true then
          self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).MOUSE_L_FOR_ACCEPT)
        else
          self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).MOUSE_L)
        end
      end
      self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
    end
  end
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.setWaitState = function(self, waitState)
  -- function num : 0_9
  self._subState = waitState
  self._pressDelay = self._printTime
  local strSUBSTATE = {"MOUSE_L", "MOUSE_L_FOR_DIALOG", "KEYBOARD_R", "MOUSE_MOVING", "SELET_REWARD", "SHOW_MOUSE", "ESCAPE", "NAVIGATION_T", "AUTONAVIMOVE_CLICK", "MOUSE_L_FOR_ACCEPT", "NPC_INTERACTION_R"; [0] = "NONE"}
  _PA_LOG("�\128규보", "Wait_Change : " .. tostring(self._subState) .. "   " .. tostring(strSUBSTATE[waitState]))
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.setMainState = function(self, mainState)
  -- function num : 0_10
  self._mainState = mainState
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  if (self.MAINSTATE).NEED_TO_MOVE == mainState then
    PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_NeedToMove_AccessBlackSpiritclick
  else
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

    if (self.MAINSTATE).NEED_TO_HUNT == mainState then
      PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_NeedToHunt_AccessBlackSpiritclick
    end
  end
  local strMainState = {"NORMAL", "NEED_TO_MOVE", "NEED_TO_HUNT"; [0] = "NONE"}
  _PA_LOG("�\128규보", "Main_Change : " .. tostring(self._mainState) .. "   " .. tostring(strMainState[mainState]))
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.statesInit = function(self)
  -- function num : 0_11 , upvalues : AutoState_MouseMoving_TargetButton
  self._mainState = (AutoState_WaitForPressButton.MAINSTATE).NONE
  self._subState = (AutoState_WaitForPressButton.SUBSTATE).NONE
  self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._pressDelay = self._printTime + 1
end


