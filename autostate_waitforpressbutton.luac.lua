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
, _mainState = 0, _subState = 0, _pressDelay = 0, _printTime = 3, _updateChangeDelay = 0, _updateChangeTime = 1, _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE, _mouseVisible = false, _meetToggle = false}
-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.init = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.start = function(self)
  -- function num : 0_1 , upvalues : AutoState_MouseMoving_TargetButton, IM
  self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._mainState = (self.MAINSTATE).NONE
  self._subState = (self.SUBSTATE).NONE
  self:checkChangeState()
  self._mouseVisible = (UI.Get_ProcessorInputMode)() == IM.eProcessorInputMode_GameMode
  self._renderingModeChange = ToClient_isCheckRenderModeDialog()
  self._meetToggle = ToClient_checkNearMeetNPC()
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R2 in 'UnsetPending'

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
                      FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_NPC_INTERACTION_R"))
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
        FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_NPC_INTERACTION_R"))
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
    FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WAITFORBUTTON_NPC_INTERACTION_R"))
  end
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R2 in 'UnsetPending'

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
    if self._mainState == (self.MAINSTATE).NEED_TO_MOVE and Auto_IsPlayerInsideQuestArea(uiQuestInfo) == 0 then
      self:checkChangeState()
      return 
    else
      if self._mainState == (self.MAINSTATE).NEED_TO_HUNT and (Auto_IsPlayerInsideQuestArea(uiQuestInfo) ~= 0 or Auto_FindNearQuestMonster() == false) then
        self:checkChangeState()
        return 
      end
    end
    local uiQuestInfo = questList:getMainQuestInfo()
    if uiQuestInfo._isCleared then
      local isAccepted = uiQuestInfo._isProgressing
    end
    if self._subState == (AutoState_WaitForPressButton.SUBSTATE).NPC_INTERACTION_R and ToClient_checkNearMeetNPC() == false then
      self:checkChangeState()
    else
      if (uiQuestInfo:isSatisfied() == 0 or isAccepted == false) and ToClient_checkNearMeetNPC() == true then
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

-- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.endProc = function(self)
  -- function num : 0_4
  self._mainState = (self.MAINSTATE).NONE
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = nil
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.checkChangeState = function(self)
  -- function num : 0_5 , upvalues : IM, AutoState_MouseMoving_TargetButton
  self:statesInit()
  local questList = ToClient_GetQuestList()
  if questList == nil then
    _PA_ASSERT(false, "Quest ì •ë³´ê°\128 nilìž…ë‹ˆë‹\164..AutoState_WaitForPressButton:start")
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
  do
    do
      local isCompleteBlackSpirit = questStatic:isCompleteBlackSpirit()
      if isComplete == false and Auto_IsPlayerInsideQuestArea(uiQuestInfo) == 0 then
        if Auto_FindNearQuestMonster() == true then
          self:setMainState((self.MAINSTATE).NEED_TO_HUNT)
          -- DECOMPILER ERROR at PC82: Confused about usage of register: R11 in 'UnsetPending'

          PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_NeedToHunt_AccessBlackSpiritclick
        else
          self:setMainState((self.MAINSTATE).NEED_TO_MOVE)
          if navi == false then
            HandleClicked_QuestWindow_FindWay((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest, questCondition, false)
            -- DECOMPILER ERROR at PC102: Confused about usage of register: R11 in 'UnsetPending'

            PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_NeedToMove_AccessBlackSpiritclick
          end
        end
      elseif isAccepted == 0 and accecptNpc ~= 0 then
        self:setMainState((self.MAINSTATE).NEED_TO_MOVE)
        _PA_LOG("ê¹\128ê·œë³´", tostring(navi) .. ", " .. tostring(questStatic:isCompleteBlackSpirit()))
        if navi == false and questStatic:isCompleteBlackSpirit() == false then
          HandleClicked_QuestWindow_FindWay((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest, questCondition, false)
        end
      else
        -- DECOMPILER ERROR at PC158: Unhandled construct in 'MakeBoolean' P3

        if (isComplete == true and isCompleteBlackSpirit) or isComplete ~= false or isComplete == false and accecptNpc == 0 and isCompleteBlackSpirit then
          self:setMainState((self.MAINSTATE).NORMAL)
        elseif Auto_IsPlayerInsideQuestArea(uiQuestInfo) == -1 then
          self:setMainState((self.MAINSTATE).NEED_TO_MOVE)
          if navi == false and questStatic:isCompleteBlackSpirit() == false then
            HandleClicked_QuestWindow_FindWay((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest, questCondition, false)
          end
          -- DECOMPILER ERROR at PC187: Confused about usage of register: R11 in 'UnsetPending'

          PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_NeedToMove_AccessBlackSpiritclick
        else
          _PA_LOG("ê¹\128ê·œë³´", "elseëœ\184")
          self:setMainState((self.MAINSTATE).NORMAL)
        end
      end
      self._pressDelay = self._printTime
      if navi == true and ToClient_getNaviEndPointDist() > 200 and (self.MAINSTATE).NEED_TO_HUNT ~= self._mainState then
        self:setWaitState((AutoState_WaitForPressButton.SUBSTATE).NAVIGATION_T)
        -- DECOMPILER ERROR at PC217: Confused about usage of register: R4 in 'UnsetPending'

        PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_NeedToMove_AccessBlackSpiritclick
        return 
      end
      if (self._mainState == (self.MAINSTATE).NEED_TO_MOVE and isAccepted == 0 and accecptNpc == 0) or ToClient_checkNearMeetNPC() == true then
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

AutoState_NeedToMove_AccessBlackSpiritclick = function()
  -- function num : 0_6
  ToClient_NaviReStart()
end

AutoState_NeedToHunt_AccessBlackSpiritclick = function()
  -- function num : 0_7
  Auto_TransferState(AutoStateType.HUNT)
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.MouseUpdate = function(self)
  -- function num : 0_8 , upvalues : AutoState_MouseMoving_TargetButton
  if FromClient_IsClientFocused() == false or self._subState ~= (AutoState_WaitForPressButton.SUBSTATE).MOUSE_MOVING then
    return 
  end
  if self._mouseMovingTargetButton == AutoState_MouseMoving_TargetButton.AUTO_NAVI_BUTTON then
    local questWidget = PaGlobal_MainQuest._uiAutoNaviBtn
    local posX = Panel_MainQuest:GetPosX() + questWidget:GetPosX() + questWidget:GetSizeX() / 2
    local posY = Panel_MainQuest:GetPosY() + questWidget:GetPosY() + questWidget:GetSizeY() / 2
    if Auto_MouseMove(posX, posY) == false then
      local questList = ToClient_GetQuestList()
      local uiQuestInfo = questList:getMainQuestInfo()
      if uiQuestInfo:isSatisfied() == true then
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

-- DECOMPILER ERROR at PC73: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.setWaitState = function(self, waitState)
  -- function num : 0_9
  self._subState = waitState
  self._pressDelay = self._printTime
  local strSUBSTATE = {"MOUSE_L", "MOUSE_L_FOR_DIALOG", "KEYBOARD_R", "MOUSE_MOVING", "SELET_REWARD", "SHOW_MOUSE", "ESCAPE", "NAVIGATION_T", "AUTONAVIMOVE_CLICK", "MOUSE_L_FOR_ACCEPT", "NPC_INTERACTION_R"; [0] = "NONE"}
  _PA_LOG("ê¹\128ê·œë³´", "Wait_Change : " .. tostring(self._subState) .. "   " .. tostring(strSUBSTATE[waitState]))
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.setMainState = function(self, mainState)
  -- function num : 0_10
  self._mainState = mainState
  local strMainState = {"NORMAL", "NEED_TO_MOVE", "NEED_TO_HUNT"; [0] = "NONE"}
  _PA_LOG("ê¹\128ê·œë³´", "Main_Change : " .. tostring(self._mainState) .. "   " .. tostring(strMainState[mainState]))
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R2 in 'UnsetPending'

AutoState_WaitForPressButton.statesInit = function(self)
  -- function num : 0_11 , upvalues : AutoState_MouseMoving_TargetButton
  self._mainState = (AutoState_WaitForPressButton.MAINSTATE).NONE
  self._subState = (AutoState_WaitForPressButton.SUBSTATE).NONE
  self._mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
  self._pressDelay = self._printTime + 1
end


