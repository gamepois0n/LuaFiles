-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\competitiongame\panel_competitiongame.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
Panel_CompetitionGame:SetShow(false)
local competitionGame = {edit_Name = (UI.getChildControl)(Panel_CompetitionGame, "Edit_CharacterName"), btn_Summon = (UI.getChildControl)(Panel_CompetitionGame, "Button_Summon"), btn_Close = (UI.getChildControl)(Panel_CompetitionGame, "Button_Close"), _btn_Start = (UI.getChildControl)(Panel_CompetitionGame, "Button_StartGame"), _btn_Pause = (UI.getChildControl)(Panel_CompetitionGame, "Button_PauseGame"), _btn_AllResurrection = (UI.getChildControl)(Panel_CompetitionGame, "Button_AllPlayerResurrection"), _btn_InviteList = (UI.getChildControl)(Panel_CompetitionGame, "Button_InviteList"), _btn_OpenOrClose = (UI.getChildControl)(Panel_CompetitionGame, "Button_OpenOrClose"), _list2 = (UI.getChildControl)(Panel_CompetitionGame, "List2_GamescomList"), _chk_Observer = (UI.getChildControl)(Panel_CompetitionGame, "CheckBox_Observer"), _btn_TargetScore = (UI.getChildControl)(Panel_CompetitionGame, "Button_TargetScore"), _txt_TargetScore = (UI.getChildControl)(Panel_CompetitionGame, "StaticText_TargetScore"), _btn_TimeLimit = (UI.getChildControl)(Panel_CompetitionGame, "Button_TimeLimit"), _txt_TimeLimit = (UI.getChildControl)(Panel_CompetitionGame, "StaticText_TimeLimit"), _radioBtn_RoundMode = (UI.getChildControl)(Panel_CompetitionGame, "RadioButton_RoundMode"), _radioBtn_FreeForAll = (UI.getChildControl)(Panel_CompetitionGame, "RadioButton_FreeForAll"), _list2 = (UI.getChildControl)(Panel_CompetitionGame, "List2_GamescomList"), _list2_Observer = (UI.getChildControl)(Panel_CompetitionGame, "List2_GamescomListObserver"), _targetScore = 3, _timeLimit = 300, _levelLimit = 58, _maxPartyMemberCount = 5, maxTeamCount = 999}
CompetitionGame_Init = function()
  -- function num : 0_0 , upvalues : competitionGame
  local self = competitionGame
  ;
  (self._list2):changeAnimationSpeed(10)
  ;
  (self._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CompetitionGame_ListUpdate")
  ;
  (self._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self._list2_Observer):changeAnimationSpeed(10)
  ;
  (self._list2_Observer):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CompetitionGame_ListUpdate_Observer")
  ;
  (self._list2_Observer):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  _targetScore = ToClient_GetTargetScore()
  _timeLimit = ToClient_CompetitionMatchTimeLimit()
  ;
  (self._txt_TargetScore):SetText(_targetScore)
  ;
  (self._txt_TimeLimit):SetText(_timeLimit)
end

local selectedKey = -1
CompetitionGame_ListUpdate = function(contents, key)
  -- function num : 0_1 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
  _txt_Level:SetShow(true)
  _txt_Level:SetPosX(17)
  _txt_Level:SetPosY(5)
  local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
  _txt_Class:SetShow(true)
  _txt_Class:SetPosX(110)
  _txt_Class:SetPosY(5)
  local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
  _txt_Name:SetShow(true)
  _txt_Name:SetPosX(340)
  _txt_Name:SetPosY(5)
  local _txt_TeamNo = (UI.getChildControl)(contents, "StaticText_TeamNo")
  _txt_TeamNo:SetShow(true)
  local _btn_TeamSet = (UI.getChildControl)(contents, "Button_TeamSet")
  _btn_TeamSet:SetShow(true)
  local _btn_Kick = (UI.getChildControl)(contents, "Button_MemberKick")
  _btn_Kick:SetShow(true)
  local _btn_Resurrection = (UI.getChildControl)(contents, "Button_MemberResurrection")
  _btn_Resurrection:SetShow(true)
  local entryListInfo = ToClient_GetEntryListAt(idx)
  if entryListInfo ~= nil then
    local userNo = entryListInfo:getUserNo()
    local userLevel = entryListInfo:getCharacterLevel()
    local userClass = entryListInfo:getCharacterClass()
    local userName = entryListInfo:getUserName()
    local characterName = entryListInfo:getCharacterName()
    local teamNo = entryListInfo:getTeamNo()
    _txt_Level:SetText(userLevel)
    _txt_Class:SetText(getCharacterClassName(userClass))
    _txt_Name:SetText(userName .. "(" .. characterName .. ")")
    _txt_TeamNo:SetText(teamNo)
    _btn_TeamSet:addInputEvent("Mouse_LUp", "FGlobal_CompetitionTeamSet_Open(" .. userNo .. ", " .. teamNo .. ", false)")
    _btn_Resurrection:addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGame_Resurrection(" .. idx .. ")")
    _btn_Kick:addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGame_Kick(" .. idx .. ", false)")
  end
end

CompetitionGame_ListUpdate_Observer = function(contents, key)
  -- function num : 0_2 , upvalues : competitionGame
  local self = competitionGame
  local idx = Int64toInt32(key)
  local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
  _txt_Level:SetShow(true)
  _txt_Level:SetPosX(17)
  _txt_Level:SetPosY(5)
  local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
  _txt_Class:SetShow(true)
  _txt_Class:SetPosX(110)
  _txt_Class:SetPosY(5)
  local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
  _txt_Name:SetShow(true)
  _txt_Name:SetPosX(340)
  _txt_Name:SetPosY(5)
  local _txt_TeamNo = (UI.getChildControl)(contents, "StaticText_TeamNo")
  _txt_TeamNo:SetShow(false)
  local _btn_TeamSet = (UI.getChildControl)(contents, "Button_TeamSet")
  _btn_TeamSet:SetShow(false)
  local _btn_Kick = (UI.getChildControl)(contents, "Button_MemberKick")
  _btn_Kick:SetShow(true)
  local observerListInfo = ToClient_GetObserverListAt(idx)
  if observerListInfo ~= nil then
    local userNo = observerListInfo:getUserNo()
    local userLevel = observerListInfo:getCharacterLevel()
    local userClass = observerListInfo:getCharacterClass()
    local userName = observerListInfo:getUserName()
    local characterName = observerListInfo:getCharacterName()
    local teamNo = observerListInfo:getTeamNo()
    _txt_Level:SetText(userLevel)
    _txt_Class:SetText(getCharacterClassName(userClass))
    _txt_Name:SetText(userName .. "(" .. characterName .. ")")
    _txt_TeamNo:SetText(teamNo)
    _btn_TeamSet:addInputEvent("Mouse_LUp", "FGlobal_CompetitionTeamSet_Open(" .. userNo .. ", " .. teamNo .. ", true)")
    _btn_Kick:addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGame_Kick(" .. idx .. ", true)")
  end
end

CompetitionGame_SelectedUpdate = function()
  -- function num : 0_3 , upvalues : competitionGame
  local self = competitionGame
  local entryListCount = 0
  ;
  ((self._list2):getElementManager()):clearKey()
  if entryListCount > 0 then
    for idx = 0, entryListCount - 1 do
      ((self._list2):getElementManager()):pushKey(toInt64(0, idx))
    end
  end
  do
    local observerListCount = ToClient_GetObserverListCount()
    ;
    ((self._list2_Observer):getElementManager()):clearKey()
    if observerListCount > 0 then
      for idx = 0, observerListCount - 1 do
        ((self._list2_Observer):getElementManager()):pushKey(toInt64(0, idx))
      end
    end
  end
end

HandleClicked_CompetitionGame_Summon = function()
  -- function num : 0_4 , upvalues : competitionGame
  local self = competitionGame
  if not ToClient_SelfPlayerIsGM() then
    return 
  end
  local characterName = (self.edit_Name):GetEditText()
  local isObserver = (self._chk_Observer):IsCheck()
  if characterName == nil or characterName == "" then
    return 
  end
  ToClient_RequestInviteCompetition(characterName, isObserver)
  ClearFocusEdit()
end

FGlobal_CompetitionGame_ChangeTeam = function(teamNo, userNo, isObserver)
  -- function num : 0_5
  if teamNo == -1 then
    txt_teamNo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_OBSERVER"))
  else
    txt_teamNo:SetText(tostring(teamNo))
  end
  ToClient_RequestSetTeam(userNo, teamNo)
  ClearFocusEdit()
end

FGlobal_CompetitionGame_TargetScore = function(score)
  -- function num : 0_6 , upvalues : competitionGame
  local self = competitionGame
  self._targetScore = score
  ;
  (self._txt_TargetScore):SetText(score)
  HandleClicked_ChangeCompetitionOption()
end

FGlobal_CompetitionGame_TimeLimit = function(timeLimit)
  -- function num : 0_7 , upvalues : competitionGame
  local self = competitionGame
  self._timeLimit = timeLimit
  ;
  (self._txt_TimeLimit):SetText(timeLimit)
  HandleClicked_ChangeCompetitionOption()
end

HandleClicked_CompetitionGame_Kick = function(idx, isObserver)
  -- function num : 0_8
  local entryListInfo = ToClient_GetEntryListAt(idx)
  local observerListInfo = ToClient_GetObserverListAt(idx)
  if isObserver then
    competitionListInfo = ToClient_GetObserverListAt(idx)
  else
    competitionListInfo = ToClient_GetEntryListAt(idx)
  end
  if competitionListInfo == nil then
    return 
  end
  local userNo_s64 = competitionListInfo:getUserNo()
  local userCharacterName = competitionListInfo:getCharacterName()
  local KickUserCompetition = function()
    -- function num : 0_8_0 , upvalues : userNo_s64
    ToClient_RequestLeavePlayer(userNo_s64)
  end

  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_USERKICK_MESSAGEBOX", "name", userCharacterName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = KickUserCompetition, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_CompetitionGame_Resurrection = function(idx)
  -- function num : 0_9
  if idx == nil then
    return 
  end
  local entryListInfo = ToClient_GetEntryListAt(idx)
  local userNo_s64 = entryListInfo:getUserNo()
  local userCharacterName = entryListInfo:getCharacterName()
  local userResurrectionExecute = function()
    -- function num : 0_9_0 , upvalues : userNo_s64
    ToClient_RequestRebirthPlayer(userNo_s64)
  end

  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_USERRESURRECSTION_MESSAGEBOX", "name", userCharacterName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = userResurrectionExecute, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FromClient_ResponseEntryList = function()
  -- function num : 0_10 , upvalues : competitionGame
  local self = competitionGame
  CompetitionGame_SelectedUpdate()
end

FromClient_UpdateEntryList = function()
  -- function num : 0_11 , upvalues : competitionGame
  local self = competitionGame
  CompetitionGame_SelectedUpdate()
end

FromClient_ResponseObserverList = function()
  -- function num : 0_12 , upvalues : competitionGame
  local self = competitionGame
  CompetitionGame_SelectedUpdate()
end

FromClient_UpdateObserverList = function()
  -- function num : 0_13 , upvalues : competitionGame
  local self = competitionGame
  CompetitionGame_SelectedUpdate()
end

FromClient_InviteCompetiton = function(hostCharacterName, isObserver)
  -- function num : 0_14 , upvalues : competitionGame
  local self = competitionGame
  local InviteCompetition = function()
    -- function num : 0_14_0 , upvalues : isObserver
    ToClient_ResponseInviteCompetition(true, isObserver)
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_INVITE_FIGHTER")
  if isObserver then
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_INVITE_OBSERVER")
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_INVITE_FIGHTER")
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = InviteCompetition, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_CompetitionGame_EditText = function()
  -- function num : 0_15 , upvalues : competitionGame
  local self = competitionGame
  ;
  (self.edit_Name):SetEditText("", true)
  SetFocusEdit(self.edit_Name)
end

HandleClicked_competitionGameEditSetFocus = function()
  -- function num : 0_16 , upvalues : competitionGame, IM
  local self = competitionGame
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(self.edit_Name)
  ;
  (self.edit_Name):SetEditText((self.edit_Name):GetEditText(), true)
end

HandleClicked_CompetitionGame_GameStart = function()
  -- function num : 0_17 , upvalues : competitionGame
  local self = competitionGame
  ToClient_RequestSetFight((CppEnums.CompetitionFightState).eCompetitionFightState_Wait, self._targetScore)
end

HandleClicked_CompetitionGame_Pause = function()
  -- function num : 0_18
  ToClient_RequestSetFight((CppEnums.CompetitionFightState).eCompetitionFightState_Stop)
end

HandleClicked_CompetitionGame_Done = function()
  -- function num : 0_19
  ToClient_RequestSetFight((CppEnums.CompetitionFightState).eCompetitionFightState_Done)
end

HandleClicked_CompetitionGame_AllPlayerResurrection = function()
  -- function num : 0_20
  ToClient_RequestRebirthPlayerAll()
end

CompetitionGame_Entry = function()
  -- function num : 0_21
  ToClient_RequestEnterCompetitionHost()
end

FGlobal_CompetitionGame_NormalUser_Out = function()
  -- function num : 0_22
  ToClient_RequestLeaveMyself()
end

FGlobal_CompetitionGame_Open = function()
  -- function num : 0_23 , upvalues : selectedKey
  CompetitionGame_SelectedUpdate()
  Panel_CompetitionGame:SetShow(true)
  RefreshMatchModeButton()
  selectedKey = -1
end

FGlobal_CompetitionGame_Close = function()
  -- function num : 0_24
  Panel_CompetitionGame:SetShow(false)
  FGlobal_CompetitionTeamSet_Close()
end

HandleClicked_ModeChange = function(matchMode)
  -- function num : 0_25 , upvalues : competitionGame
  local self = competitionGame
  ToClient_CompetitionMatchTypeChange(matchMode)
  RefreshMatchModeButton()
end

HandleClicked_ChangeCompetitionOption = function()
  -- function num : 0_26 , upvalues : competitionGame
  local self = competitionGame
  if ToClient_IsCompetitionHost() == true then
    local isOpen = ToClient_IsCompetitionOpen_HostOnly()
    ToClient_RequestCompetitionOption(not isOpen, self._timeLimit, self._targetScore, self._levelLimit, self._maxPartyMemberCount)
  end
end

FromClient_IsMyTeamResult = function(isWin)
  -- function num : 0_27
  local msg = {main = "", sub = "", addMsg = ""}
  if isWin == true then
    msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_WIN_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_WIN_SUB"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 45, false)
  else
    msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_LOSE_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_WIN_SUB"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 46, false)
  end
end

FromClient_RoundReady = function(currentRound, countDown)
  -- function num : 0_28
  _PA_LOG("정태�\164", "이벤�\184")
  if countDown == 0 then
    return 
  end
  local msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ROUND", "round", currentRound), sub = countDown, addMsg = ""}
  Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 5, 62, false)
end

CompetitionGame_Event = function()
  -- function num : 0_29 , upvalues : competitionGame
  local self = competitionGame
  ;
  (self.edit_Name):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGame_EditText()")
  ;
  (self.btn_Summon):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGame_Summon()")
  ;
  (self.edit_Name):RegistReturnKeyEvent("HandleClicked_CompetitionGame_Summon()")
  ;
  (self.btn_Close):addInputEvent("Mouse_LUp", "FGlobal_CompetitionGame_Close()")
  ;
  (self._btn_Start):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGame_GameStart()")
  ;
  (self._btn_Pause):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGame_Done()")
  ;
  (self._btn_AllResurrection):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGame_AllPlayerResurrection()")
  ;
  (self._btn_TargetScore):addInputEvent("Mouse_LUp", "FGlobal_CompetitionTargetScoreSet_Open(true)")
  ;
  (self._btn_TimeLimit):addInputEvent("Mouse_LUp", "FGlobal_CompetitionTargetScoreSet_Open(false)")
  ;
  (self._radioBtn_RoundMode):addInputEvent("Mouse_LUp", "HandleClicked_ModeChange(" .. (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round .. ")")
  ;
  (self._radioBtn_FreeForAll):addInputEvent("Mouse_LUp", "HandleClicked_ModeChange(" .. (CppEnums.CompetitionMatchType).eCompetitionMatchMode_FreeForAll .. ")")
  registerEvent("FromClient_InviteCompetiton", "FromClient_InviteCompetiton")
  registerEvent("FromClient_IsMyTeamResult", "FromClient_IsMyTeamResult")
  registerEvent("FromClient_RoundReady", "FromClient_RoundReady")
end

CompetitionGame_Init()
CompetitionGame_Event()

