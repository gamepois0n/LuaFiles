-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\auto\autostate_waitforpressbutton.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local AutoState_WaitforState = {NONE = 0, MOUSE_L = 1, MOUSE_L_FOR_DIALOG = 2, KEYBOARD_R = 3, MOUSE_MOVING = 4, SELET_REWARD = 5, SHOW_MOUSE = 6, ESCAPE = 7, NAVIGATION_T = 8, AUTONAVIMOVE_CLICK = 9, MOUSE_L_FOR_ACCEPT = 10, NPC_INTERACTION_R = 11}
local AutoState_MouseMoving_TargetButton = {NONE = 0, AUTO_NAVI_BUTTON = 1}
AutoState_WaitForPressButton = {_state = AutoStateType.WAIT_FOR_PRESSBUTTON, _pressDelay = 0, _printTime = 3, _waitState = AutoState_WaitforState.NONE, _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE, _mouseVisible = false, _meetToggle = false}
-- DECOMPILER ERROR at PC33: Confused about usage of register: R3 in 'UnsetPending'

AutoState_WaitForPressButton.init = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R3 in 'UnsetPending'

AutoState_WaitForPressButton.start = function(self)
  -- function num : 0_1 , upvalues : AutoState_WaitforState, IM
  _waitState = AutoState_WaitforState.NONE
  AutoState_WaitForPressButton:checkChangeState()
  _mouseVisible = (UI.Get_ProcessorInputMode)() == IM.eProcessorInputMode_GameMode
  _renderingModeChange = ToClient_isCheckRenderModeDialog()
  _meetToggle = ToClient_checkNearMeetNPC()
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R3 in 'UnsetPending'

AutoState_WaitForPressButton.update = function(self, deltaTime)
  -- function num : 0_2 , upvalues : AutoState_WaitforState, IM
  self._pressDelay = self._pressDelay + deltaTime
  self:MouseUpdate()
  if self._printTime < self._pressDelay then
    self._pressDelay = 0
    if _waitState == AutoState_WaitforState.MOUSE_L then
      FGlobal_AutoQuestBlackSpiritMessage("퀘스�\184 진행�\132 위해 버튼�\132 클릭~")
    else
      if _waitState == AutoState_WaitforState.MOUSE_L_FOR_DIALOG then
        FGlobal_AutoQuestBlackSpiritMessage("퀘스�\184 진행�\132 위해 버튼 클릭~ ")
      else
        if _waitState == AutoState_WaitforState.MOUSE_L_FOR_ACCEPT then
          FGlobal_AutoQuestBlackSpiritMessage("퀘스트를 수락해볼까요~ ")
        else
          if _waitState == AutoState_WaitforState.KEYBOARD_R then
            FGlobal_AutoQuestBlackSpiritMessage("R키를 눌러 인터렉션 하세요~")
          else
          end
        end
      end
    end
  end
  if _waitState ~= AutoState_WaitforState.MOUSE_MOVING or _waitState == AutoState_WaitforState.SELET_REWARD then
    FGlobal_AutoQuestBlackSpiritMessage("선택 보상�\132 고르세요~")
  else
    if _waitState == AutoState_WaitforState.SHOW_MOUSE then
      FGlobal_AutoQuestBlackSpiritMessage("컨트�\164 �\164 누르세요~")
    else
      if _waitState == AutoState_WaitforState.NAVIGATION_T then
        FGlobal_AutoQuestBlackSpiritMessage("T버튼�\132 눌르세용~")
      else
        if _waitState == AutoState_WaitforState.NPC_INTERACTION_R then
          FGlobal_AutoQuestBlackSpiritMessage("목표 NPC�\128 인터렉션 하세요~")
        end
      end
    end
  end
  local mouseVisible = (UI.Get_ProcessorInputMode)() == IM.eProcessorInputMode_GameMode
  if mouseVisible ~= _mouseVisible then
    _mouseVisible = mouseVisible
    AutoState_WaitForPressButton:checkChangeState()
  end
  if ToClient_isCheckRenderModeDialog() == true then
    Auto_TransferState(AutoStateType.DIALOG_INTERACTION)
  end
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  do
    if uiQuestInfo:isjustMeetNpc() == true then
      local meetToggle = ToClient_checkNearMeetNPC()
      if _meetToggle ~= meetToggle then
        _meetToggle = meetToggle
        AutoState_WaitForPressButton:checkChangeState()
      end
    end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R3 in 'UnsetPending'

AutoState_WaitForPressButton.endProc = function(self)
  -- function num : 0_3
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R3 in 'UnsetPending'

AutoState_WaitForPressButton.checkChangeState = function(self)
  -- function num : 0_4 , upvalues : AutoState_WaitforState, IM, AutoState_MouseMoving_TargetButton
  local questList = ToClient_GetQuestList()
  if questList == nil then
    _PA_ASSERT(false, "Quest 정보�\128 nil입니�\164..AutoState_WaitForPressButton:start")
    return 
  end
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo == nil then
    return 
  end
  self._pressDelay = self._printTime
  local navi = ToClient_currentNaviisMainQuest()
  if navi == true and ToClient_getNaviEndPointDist() > 200 then
    self:setWaitState(AutoState_WaitforState.NAVIGATION_T)
    return 
  end
  if ToClient_checkNearMeetNPC() == true then
    self:setWaitState(AutoState_WaitforState.NPC_INTERACTION_R)
    return 
  end
  if (UI.Get_ProcessorInputMode)() == IM.eProcessorInputMode_GameMode then
    self:setWaitState(AutoState_WaitforState.SHOW_MOUSE)
    return 
  end
  if uiQuestInfo:getQuestDistance() == 0 then
    self:setWaitState(AutoState_WaitforState.MOUSE_MOVING)
    _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.AUTO_NAVI_BUTTON
    return 
  end
  if uiQuestInfo:isSatisfied() == 0 then
    self:setWaitState(AutoState_WaitforState.MOUSE_MOVING)
    _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.AUTO_NAVI_BUTTON
    return 
  end
  self:setWaitState(AutoState_WaitforState.MOUSE_MOVING)
  _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.AUTO_NAVI_BUTTON
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R3 in 'UnsetPending'

AutoState_WaitForPressButton.MouseUpdate = function(self)
  -- function num : 0_5 , upvalues : AutoState_WaitforState, AutoState_MouseMoving_TargetButton
  if FromClient_IsClientFocused() == false or _waitState ~= AutoState_WaitforState.MOUSE_MOVING then
    return 
  end
  if _mouseMovingTargetButton == AutoState_MouseMoving_TargetButton.AUTO_NAVI_BUTTON then
    local questWidget = PaGlobal_MainQuest._uiAutoNaviBtn
    local posX = Panel_MainQuest:GetPosX() + questWidget:GetPosX() + questWidget:GetSizeX() / 2
    local posY = Panel_MainQuest:GetPosY() + questWidget:GetPosY() + questWidget:GetSizeY() / 2
    if Auto_MouseMove(posX, posY) == false then
      local questList = ToClient_GetQuestList()
      local uiQuestInfo = questList:getMainQuestInfo()
      if uiQuestInfo:isSatisfied() == true then
        self:setWaitState(AutoState_WaitforState.MOUSE_L_FOR_DIALOG)
      else
        if isVisibleAcceptButton() == true then
          self:setWaitState(AutoState_WaitforState.MOUSE_L_FOR_ACCEPT)
        else
          self:setWaitState(AutoState_WaitforState.MOUSE_L)
        end
      end
      _mouseMovingTargetButton = AutoState_MouseMoving_TargetButton.NONE
    end
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R3 in 'UnsetPending'

AutoState_WaitForPressButton.setWaitState = function(self, waitState)
  -- function num : 0_6
  _waitState = waitState
  self._pressDelay = self._printTime
  _PA_LOG("�\128규보", "Wait_Change : " .. tostring(_waitState))
end


