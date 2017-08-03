-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\competitiongame\panel_competitiongameforteamchange.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_CompetitionGameForTeamChange:SetShow(false)
local competitionGameForTeamChange = {_list_TeamA = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "List2_CompetitionGameTeamA"), _list_TeamB = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "List2_CompetitionGameTeamB"), _list_Entry = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "List2_CompetitionGameWait"), _list_Observer = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "List2_CompetitionGameObserver"), _btn_TeamA = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "Button_SetTeamA"), _btn_TeamB = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "Button_SetTeamB"), _btn_TeamWait = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "Button_SetTeamWait"), _btn_TeamObserver = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "Button_SetTeamObserver"), _btn_leaveCompetition = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "Button_LeaveCompetitionSelf"), _btn_Close = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "Button_Close"), _btn_ForHost = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "Button_ForHost"), _txt_Timer = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "StaticText_Timer"), _txt_TeamA = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "StaticText_TeamA"), _txt_TeamB = (UI.getChildControl)(Panel_CompetitionGameForTeamChange, "StaticText_TeamB")}
FGlobal_CompetitionGameForTeamChange_Open = function()
  -- function num : 0_0 , upvalues : competitionGameForTeamChange
  local self = competitionGameForTeamChange
  FromClient_UpdateTeamUserList()
  HandleChangeOption_ForTeamChange()
  if ToClient_IsCompetitionHost() or ToClient_IsCompetitionAssistant() then
    (self._btn_ForHost):SetShow(true)
  else
    ;
    (self._btn_ForHost):SetShow(false)
  end
  local matchMode = ToClient_CompetitionMatchType()
  do
    local isCanChangeTeam = not ToClient_IsMyselfInEntryUser() or matchMode == 0
    ;
    (self._btn_TeamA):SetShow(isCanChangeTeam)
    ;
    (self._btn_TeamB):SetShow(isCanChangeTeam)
    ;
    (self._btn_TeamWait):SetShow(isCanChangeTeam)
    Panel_CompetitionGameForTeamChange:SetShow(true)
    ;
    (self._btn_TeamObserver):SetShow(false)
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

CompetitionGameForTeamChange_Init = function()
  -- function num : 0_1 , upvalues : competitionGameForTeamChange
  local self = competitionGameForTeamChange
  ;
  (self._list_TeamA):changeAnimationSpeed(10)
  ;
  (self._list_TeamA):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CompetitionGame_TeamA_Update")
  ;
  (self._list_TeamA):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self._list_TeamB):changeAnimationSpeed(10)
  ;
  (self._list_TeamB):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CompetitionGame_TeamB_Update")
  ;
  (self._list_TeamB):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self._list_Entry):changeAnimationSpeed(10)
  ;
  (self._list_Entry):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CompetitionGame_Entry_Update")
  ;
  (self._list_Entry):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self._list_Observer):changeAnimationSpeed(10)
  ;
  (self._list_Observer):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CompetitionGame_Observer_Update")
  ;
  (self._list_Observer):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_CompetitionGameForTeamChange_Close()")
  ;
  (self._btn_ForHost):addInputEvent("Mouse_LUp", "FGlobal_CompetitionGameForHost_Open()")
  if ToClient_IsCompetitionHost() then
    (self._btn_ForHost):SetShow(true)
  else
    ;
    (self._btn_ForHost):SetShow(false)
  end
end

local selectedKey = -1
CompetitionGame_TeamA_Update = function(contents, key)
  -- function num : 0_2 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local matchMode = (ToClient_CompetitionMatchType())
  local waitListInfo = nil
  if matchMode == 0 then
    waitListInfo = ToClient_GetTeamUserInfoAt(1, idx)
  else
    local teamInfo = ToClient_GetTeamListAt(idx)
    if teamInfo == nil then
      return 
    end
    waitListInfo = ToClient_GetTeamLeaderInfo(teamInfo:getTeamNo())
  end
  do
    if waitListInfo ~= nil then
      local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
      _txt_Level:SetShow(true)
      _txt_Level:SetPosX(7)
      _txt_Level:SetPosY(5)
      local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
      _txt_Class:SetShow(true)
      _txt_Class:SetPosX(75)
      _txt_Class:SetPosY(5)
      local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
      _txt_Name:SetShow(true)
      _txt_Name:SetPosX(246)
      _txt_Name:SetPosY(5)
      local _btn_TeamSet = (UI.getChildControl)(contents, "Button_TeamSet")
      local _btn_Kick = (UI.getChildControl)(contents, "Button_MemberKick")
      local _btn_AssistantSet = (UI.getChildControl)(contents, "Button_AssistantSet")
      _btn_TeamSet:SetShow(false)
      _btn_Kick:SetShow(false)
      _btn_AssistantSet:SetShow(false)
      if ToClient_IsCompetitionHost() or ToClient_IsCompetitionAssistant() then
        _btn_Kick:SetShow(true)
      end
      if ToClient_IsCompetitionHost() then
        _btn_TeamSet:SetShow(true)
        _btn_AssistantSet:SetShow(true)
      end
      local matchMode = ToClient_CompetitionMatchType()
      if matchMode == 1 then
        _btn_TeamSet:SetShow(false)
      end
      local teamNo = waitListInfo:getTeamNo()
      local userNo = waitListInfo:getUserNo()
      local userLevel = waitListInfo:getCharacterLevel()
      local userClass = waitListInfo:getCharacterClass()
      local userName = waitListInfo:getUserName()
      local characterName = waitListInfo:getCharacterName()
      local isAssistant = waitListInfo:isAssistant()
      _txt_Level:SetText(userLevel)
      _txt_Class:SetText(getCharacterClassName(userClass))
      _txt_Name:SetText(userName .. "(" .. characterName .. ")")
      if waitListInfo:isHost() then
        _txt_Name:SetFontColor((Defines.Color).C_FFFFD237)
      else
        if waitListInfo:isAssistant() then
          _txt_Name:SetFontColor((Defines.Color).C_FFB5FF6D)
        else
          _txt_Name:SetFontColor((Defines.Color).C_FFFFFFFF)
        end
      end
      _btn_Kick:addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGameForTeamChange_Kick(" .. tostring(userNo) .. ")")
      _btn_TeamSet:addInputEvent("Mouse_LUp", "FGlobal_CompetitionTeamSet_Open(" .. tostring(userNo) .. ", " .. teamNo .. ", false)")
      _btn_AssistantSet:addInputEvent("Mouse_LUp", "FGlobal_ChangeAssistant(" .. tostring(userNo) .. ", " .. tostring(not isAssistant) .. ")")
    end
  end
end

CompetitionGame_TeamB_Update = function(contents, key)
  -- function num : 0_3 , upvalues : selectedKey
  _PA_LOG("LUA_COMPETITION", "CompetitionGame_TeamB_Update : START")
  local idx = Int64toInt32(key)
  selectedKey = idx
  local matchMode = (ToClient_CompetitionMatchType())
  local waitListInfo = nil
  if matchMode == 0 then
    _PA_LOG("LUA_COMPETITION", "CompetitionGame_TeamB_Update : TeamB Info")
    waitListInfo = ToClient_GetTeamUserInfoAt(2, idx)
  else
    _PA_LOG("LUA_COMPETITION", "CompetitionGame_TeamB_Update : AllEntry Info")
    waitListInfo = ToClient_GetEntryListAt(idx)
  end
  _PA_LOG("LUA_COMPETITION", "CompetitionGame_TeamB_Update : ING...")
  if waitListInfo ~= nil then
    local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
    _txt_Level:SetShow(true)
    _txt_Level:SetPosX(7)
    _txt_Level:SetPosY(0)
    local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
    _txt_Class:SetShow(true)
    _txt_Class:SetPosX(75)
    _txt_Class:SetPosY(0)
    local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
    _txt_Name:SetShow(true)
    _txt_Name:SetPosX(246)
    _txt_Name:SetPosY(0)
    local _btn_TeamSet = (UI.getChildControl)(contents, "Button_TeamSet")
    local _btn_Kick = (UI.getChildControl)(contents, "Button_MemberKick")
    local _btn_AssistantSet = (UI.getChildControl)(contents, "Button_AssistantSet")
    _btn_TeamSet:SetShow(false)
    _btn_Kick:SetShow(false)
    _btn_AssistantSet:SetShow(false)
    if ToClient_IsCompetitionHost() or ToClient_IsCompetitionAssistant() then
      _btn_Kick:SetShow(true)
    end
    if ToClient_IsCompetitionHost() then
      _btn_TeamSet:SetShow(true)
      _btn_AssistantSet:SetShow(true)
    end
    local matchMode = ToClient_CompetitionMatchType()
    if matchMode == 1 then
      _btn_TeamSet:SetShow(false)
    end
    local teamNo = waitListInfo:getTeamNo()
    local userNo = waitListInfo:getUserNo()
    local userLevel = waitListInfo:getCharacterLevel()
    local userClass = waitListInfo:getCharacterClass()
    local userName = waitListInfo:getUserName()
    local characterName = waitListInfo:getCharacterName()
    local isAssistant = waitListInfo:isAssistant()
    _txt_Level:SetText(userLevel)
    _txt_Class:SetText(getCharacterClassName(userClass))
    _txt_Name:SetText(userName .. "(" .. characterName .. ")")
    if waitListInfo:isHost() then
      _txt_Name:SetFontColor((Defines.Color).C_FFFFD237)
    else
      if waitListInfo:isAssistant() then
        _txt_Name:SetFontColor((Defines.Color).C_FFB5FF6D)
      else
        _txt_Name:SetFontColor((Defines.Color).C_FFFFFFFF)
      end
    end
    _btn_Kick:addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGameForTeamChange_Kick(" .. tostring(userNo) .. ")")
    _btn_TeamSet:addInputEvent("Mouse_LUp", "FGlobal_CompetitionTeamSet_Open(" .. tostring(userNo) .. ", " .. teamNo .. ", false)")
    _btn_AssistantSet:addInputEvent("Mouse_LUp", "FGlobal_ChangeAssistant(" .. tostring(userNo) .. ", " .. tostring(not isAssistant) .. ")")
  end
end

FGlobal_CompetitionGameForHost_ChangeTeam = function(teamNo, userNo, isObserver)
  -- function num : 0_4
  if teamNo == -1 then
    txt_teamNo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_OBSERVER"))
  end
  ToClient_RequestSetTeam(userNo, teamNo)
  ClearFocusEdit()
end

CompetitionGame_Entry_Update = function(contents, key)
  -- function num : 0_5 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local waitListInfo = ToClient_GetTeamUserInfoAt(0, idx)
  if waitListInfo ~= nil and waitListInfo:getTeamNo() == 0 then
    local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
    _txt_Level:SetShow(true)
    _txt_Level:SetPosX(17)
    _txt_Level:SetPosY(5)
    local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
    _txt_Class:SetShow(true)
    _txt_Class:SetPosX(90)
    _txt_Class:SetPosY(5)
    local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
    _txt_Name:SetShow(true)
    _txt_Name:SetPosX(210)
    _txt_Name:SetPosY(5)
    local _btn_TeamSet = (UI.getChildControl)(contents, "Button_TeamSet")
    local _btn_Kick = (UI.getChildControl)(contents, "Button_MemberKick")
    local _btn_AssistantSet = (UI.getChildControl)(contents, "Button_AssistantSet")
    _btn_TeamSet:SetShow(false)
    _btn_Kick:SetShow(false)
    _btn_AssistantSet:SetShow(false)
    if ToClient_IsCompetitionHost() or ToClient_IsCompetitionAssistant() then
      _btn_Kick:SetShow(true)
    end
    if ToClient_IsCompetitionHost() then
      _btn_TeamSet:SetShow(true)
      _btn_AssistantSet:SetShow(true)
    end
    local matchMode = ToClient_CompetitionMatchType()
    if matchMode == 1 then
      _btn_TeamSet:SetShow(false)
    end
    local teamNo = waitListInfo:getTeamNo()
    local userNo = waitListInfo:getUserNo()
    local userLevel = waitListInfo:getCharacterLevel()
    local userClass = waitListInfo:getCharacterClass()
    local userName = waitListInfo:getUserName()
    local characterName = waitListInfo:getCharacterName()
    local isAssistant = waitListInfo:isAssistant()
    _txt_Level:SetText(userLevel)
    _txt_Class:SetText(getCharacterClassName(userClass))
    _txt_Name:SetText(userName .. "(" .. characterName .. ")")
    if waitListInfo:isHost() then
      _txt_Name:SetFontColor((Defines.Color).C_FFFFD237)
    else
      if waitListInfo:isAssistant() then
        _txt_Name:SetFontColor((Defines.Color).C_FFB5FF6D)
      else
        _txt_Name:SetFontColor((Defines.Color).C_FFFFFFFF)
      end
    end
    _btn_Kick:addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGameForTeamChange_Kick(" .. tostring(userNo) .. ")")
    _btn_TeamSet:addInputEvent("Mouse_LUp", "FGlobal_CompetitionTeamSet_Open(" .. tostring(userNo) .. ", " .. teamNo .. ", false)")
    _btn_AssistantSet:addInputEvent("Mouse_LUp", "FGlobal_ChangeAssistant(" .. tostring(userNo) .. ", " .. tostring(not isAssistant) .. ")")
  end
end

CompetitionGame_Observer_Update = function(contents, key)
  -- function num : 0_6 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local waitListInfo = ToClient_GetObserverListAt(idx)
  if waitListInfo ~= nil then
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
    _txt_Name:SetPosX(230)
    _txt_Name:SetPosY(5)
    local _btn_AssistantSet = (UI.getChildControl)(contents, "Button_AssistantSet")
    local _btn_TeamSet = (UI.getChildControl)(contents, "Button_TeamSet")
    _btn_TeamSet:SetShow(false)
    local _btn_Kick = (UI.getChildControl)(contents, "Button_MemberKick")
    _btn_TeamSet:SetShow(false)
    _btn_Kick:SetShow(false)
    _btn_AssistantSet:SetShow(false)
    if ToClient_IsCompetitionHost() or ToClient_IsCompetitionAssistant() then
      _btn_Kick:SetShow(true)
    end
    if ToClient_IsCompetitionHost() then
      _btn_AssistantSet:SetShow(true)
    end
    local teamNo = waitListInfo:getTeamNo()
    local userNo = waitListInfo:getUserNo()
    local userLevel = waitListInfo:getCharacterLevel()
    local userClass = waitListInfo:getCharacterClass()
    local userName = waitListInfo:getUserName()
    local characterName = waitListInfo:getCharacterName()
    local isAssistant = waitListInfo:isAssistant()
    _txt_Level:SetText(userLevel)
    _txt_Class:SetText(getCharacterClassName(userClass))
    _txt_Name:SetText(userName .. "(" .. characterName .. ")")
    if waitListInfo:isHost() then
      _txt_Name:SetFontColor((Defines.Color).C_FFFFD237)
    else
      if waitListInfo:isAssistant() then
        _txt_Name:SetFontColor((Defines.Color).C_FFB5FF6D)
      else
        _txt_Name:SetFontColor((Defines.Color).C_FFFFFFFF)
      end
    end
    _btn_Kick:addInputEvent("Mouse_LUp", "HandleClicked_CompetitionGameForTeamChange_Kick(" .. tostring(userNo) .. ")")
    _btn_TeamSet:addInputEvent("Mouse_LUp", "FGlobal_CompetitionTeamSet_Open(" .. tostring(userNo) .. ", " .. teamNo .. ", false)")
    _btn_AssistantSet:addInputEvent("Mouse_LUp", "FGlobal_ChangeAssistant(" .. tostring(userNo) .. ", " .. tostring(not isAssistant) .. ")")
  end
end

CompetitionGame_AliveUser = function(contents, key)
  -- function num : 0_7 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local waitListInfo = ToClient_GetTeamUserInfoAt(0, idx)
  if waitListInfo ~= nil and waitListInfo:getTeamNo() == 0 then
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
    _txt_Name:SetPosX(230)
    _txt_Name:SetPosY(5)
    local teamNo = waitListInfo:getTeamNo()
    local userNo = waitListInfo:getUserNo()
    local userLevel = waitListInfo:getCharacterLevel()
    local userClass = waitListInfo:getCharacterClass()
    local userName = waitListInfo:getUserName()
    local characterName = waitListInfo:getCharacterName()
    _txt_Level:SetText(userLevel)
    _txt_Class:SetText(getCharacterClassName(userClass))
    _txt_Name:SetText(userName .. "(" .. characterName .. ")")
  end
end

CompetitionGameForTeamChange_SelectedUpdate_Round = function()
  -- function num : 0_8 , upvalues : competitionGameForTeamChange
  local self = competitionGameForTeamChange
  local ListCount = ToClient_GetTeamUserInfoCount(1)
  ;
  ((self._list_TeamA):getElementManager()):clearKey()
  if ListCount > 0 then
    for idx = 0, ListCount - 1 do
      ((self._list_TeamA):getElementManager()):pushKey(toInt64(0, idx))
    end
  end
  do
    local ListCount = ToClient_GetTeamUserInfoCount(2)
    ;
    ((self._list_TeamB):getElementManager()):clearKey()
    if ListCount > 0 then
      for idx = 0, ListCount - 1 do
        ((self._list_TeamB):getElementManager()):pushKey(toInt64(0, idx))
      end
    end
    do
      local ListCount = ToClient_GetTeamUserInfoCount(0)
      ;
      ((self._list_Entry):getElementManager()):clearKey()
      if ListCount > 0 then
        for idx = 0, ListCount - 1 do
          ((self._list_Entry):getElementManager()):pushKey(toInt64(0, idx))
        end
      end
      do
        local ListCount = ToClient_GetObserverListCount()
        ;
        ((self._list_Observer):getElementManager()):clearKey()
        if ListCount > 0 then
          for idx = 0, ListCount - 1 do
            ((self._list_Observer):getElementManager()):pushKey(toInt64(0, idx))
          end
        end
        do
          ;
          (self._txt_TeamA):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A"))
          ;
          (self._txt_TeamB):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B"))
        end
      end
    end
  end
end

CompetitionGameForTeamChange_SelectedUpdate_FreeForAll = function()
  -- function num : 0_9 , upvalues : competitionGameForTeamChange
  local self = competitionGameForTeamChange
  local ListCount = ToClient_GetTeamUserInfoCount(0)
  ;
  ((self._list_Entry):getElementManager()):clearKey()
  if ListCount > 0 then
    for idx = 0, ListCount - 1 do
      ((self._list_Entry):getElementManager()):pushKey(toInt64(0, idx))
    end
  end
  do
    local tempidx = 0
    local alluser = ToClient_GetTeamListCountWithOutZero()
    ;
    ((self._list_TeamA):getElementManager()):clearKey()
    if alluser > 0 then
      for idx = 0, alluser - 1 do
        ((self._list_TeamA):getElementManager()):pushKey(toInt64(0, idx))
      end
    end
    do
      _PA_LOG("LUA_COMPETITION", "CompetitionGameForTeamChange_SelectedUpdate_FreeForAll : TeamB STart")
      local ListCount = ToClient_GetEntryListCount()
      ;
      ((self._list_TeamB):getElementManager()):clearKey()
      if ListCount > 0 then
        for idx = 0, ListCount - 1 do
          ((self._list_TeamB):getElementManager()):pushKey(toInt64(0, idx))
        end
      end
      do
        _PA_LOG("LUA_COMPETITION", "CompetitionGameForTeamChange_SelectedUpdate_FreeForAll : TeamB End")
        local ListCount = ToClient_GetObserverListCount()
        ;
        ((self._list_Observer):getElementManager()):clearKey()
        if ListCount > 0 then
          for idx = 0, ListCount - 1 do
            ((self._list_Observer):getElementManager()):pushKey(toInt64(0, idx))
          end
        end
        do
          ;
          (self._txt_TeamA):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_PARTY_LEADER"))
          ;
          (self._txt_TeamB):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_PARTY_ALL_USER"))
        end
      end
    end
  end
end

FGlobal_CompetitionGameForTeamChange_Close = function()
  -- function num : 0_10
  Panel_CompetitionGameForTeamChange:SetShow(false)
end

FGlobal_ChangeAssistant = function(userNo_s64, isAssistant)
  -- function num : 0_11
  local ChangeAssistantUser = function()
    -- function num : 0_11_0 , upvalues : userNo_s64, isAssistant
    ToClient_RequestChangeAssistans(userNo_s64, isAssistant)
  end

  local userinfo = ToClient_GetCompetitionDefinedUser(userNo_s64)
  local characterName = ""
  if userinfo ~= nil then
    characterName = userinfo:getCharacterName()
  end
  local message = nil
  if isAssistant == true then
    message = "LUA_COMPETITION_REQUEST_SET_ASSISTANT"
  else
    message = "LUA_COMPETITION_REQUEST_RELEASE_ASSISTANT"
  end
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, message, "name", characterName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = ChangeAssistantUser, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FromClient_UpdateTeamUserList = function()
  -- function num : 0_12
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round == ToClient_CompetitionMatchType() then
    CompetitionGameForTeamChange_SelectedUpdate_Round()
  else
    CompetitionGameForTeamChange_SelectedUpdate_FreeForAll()
  end
end

HandleClicked_CompetitionTeamChange = function(teamNo)
  -- function num : 0_13
  local userNo = ((getSelfPlayer()):get()):getUserNo()
  ToClient_RequestSetTeam(userNo, teamNo)
end

HandleUpdateMatchTime = function(limitTime, matchTime)
  -- function num : 0_14 , upvalues : competitionGameForTeamChange
  local self = competitionGameForTeamChange
  ;
  (self._txt_Timer):SetText(limitTime - matchTime)
end

HandleChangeMode = function()
  -- function num : 0_15 , upvalues : competitionGameForTeamChange
  _PA_LOG("LUA_COMPETITION", "HandleChangeMode : START")
  local self = competitionGameForTeamChange
  if Panel_CompetitionGameForTeamChange:GetShow() == false then
    _PA_LOG("LUA_COMPETITION", "HandleChangeMode : END1")
    return 
  end
  FGlobal_CompetitionGameForTeamChange_Close()
  FGlobal_CompetitionGameForTeamChange_Open()
  _PA_LOG("LUA_COMPETITION", "HandleChangeMode : END2")
end

HandleClicked_CompetitionGameForTeamChange_Kick = function(userNo_s64)
  -- function num : 0_16
  local userinfo = (ToClient_GetCompetitionDefinedUser(userNo_s64))
  local characterName = nil
  if userinfo ~= nil then
    characterName = userinfo:getCharacterName()
  end
  local KickUserCompetition = function()
    -- function num : 0_16_0 , upvalues : userNo_s64
    ToClient_RequestLeavePlayer(userNo_s64)
  end

  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_USERKICK_MESSAGEBOX", "name", characterName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = KickUserCompetition, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FromClient_UpdateTeamScore = function(teamNum, scoreValue, round)
  -- function num : 0_17
  if teamNum == 0 then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAMSCORE_DRAW", "currentRound", round))
  else
    local matchMode = ToClient_CompetitionMatchType()
    if matchMode == 0 then
      local teamAlphabet = "B"
      if teamNum == 1 then
        teamAlphabet = "A"
      end
      Proc_ShowMessage_Ack(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAMSCORE", "currentRound", round, "teamNo", teamAlphabet, "score", scoreValue))
    else
      do
        if matchMode == 1 then
          local leaderInfo = ToClient_GetTeamLeaderInfo(teamNum)
          Proc_ShowMessage_Ack(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAMSCORE", "currentRound", round, "teamNo", leaderInfo:getUserName(), "score", scoreValue))
        end
      end
    end
  end
end

FromClient_WaitBeforeFight = function()
  -- function num : 0_18
end

FromClient_CompetitionMatchDone = function(teamNo, rank)
  -- function num : 0_19
  if teamNo == 0 then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_MATCH_DONE_DRAW", "teamNo", teamNo))
    return 
  end
  local matchMode = ToClient_CompetitionMatchType()
  if matchMode == 0 then
    local teamAlphabet = "B"
    if teamNo == 1 then
      teamAlphabet = "A"
    end
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_MATCH_DONE", "teamNo", teamAlphabet))
  else
    do
      if matchMode == 1 then
        local leaderInfo = ToClient_GetTeamLeaderInfo(teamNo)
        if leaderInfo ~= nil then
          Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_COMPETITION_MATCH_DONE_FREEFORALL", "rank", rank, "leaderName", leaderInfo:getCharacterName()))
        end
      end
    end
  end
end

HandleChangeOption_ForTeamChange = function()
  -- function num : 0_20 , upvalues : competitionGameForTeamChange
  _PA_LOG("LUA_COMPETITION", "HandleChangeOption_ForTeamChange : START")
  local self = competitionGameForTeamChange
  local matchMode = ToClient_CompetitionMatchType()
  local targetScore = ToClient_GetTargetScore()
  if matchMode == 0 then
    (self._txt_Timer):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_COMPETITION_ROUND_SCORE_DESC", "totalRound", targetScore * 2 - 1, "targetRound", targetScore))
    if targetScore == 1 then
      (self._txt_Timer):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_SINGLEROUND"))
    end
  else
    if matchMode == 1 then
      (self._txt_Timer):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_FREEFORALL_SCORE_DESC", "targetCount", targetScore))
    end
  end
  if targetScore <= 0 then
    (self._txt_Timer):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_ERROR_SCORE"))
  end
  _PA_LOG("LUA_COMPETITION", "HandleChangeOption_ForTeamChange : END")
end

HandleTestFunc = function()
  -- function num : 0_21
  FGlobal_CompetitionGameForTeamChange_Open()
end

HandleJoinNewPlayer = function(characterName, isEntryUser)
  -- function num : 0_22
  if isEntryUser then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_JOINNEWPLAYER_ENTRY", "characterName", characterName))
  else
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_JOINNEWPLAYER_OBSERVER", "characterName", characterName))
  end
end

HandleAnyUserDead = function(deadUserInfo, attackerUserInfo)
  -- function num : 0_23
  if attackerUserInfo == nil then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_USERDEAD_SELF", "characterName", deadUserInfo:getCharacterName()))
  else
    Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_COMPETITION_USERDEAD_ATTACKED", "attackerName", attackerUserInfo:getCharacterName(), "deadUserName", deadUserInfo:getCharacterName()))
  end
end

FromClient_EntryUserChangeTeam = function(userInfo)
  -- function num : 0_24
  local matchMode = ToClient_CompetitionMatchType()
  if matchMode ~= 0 or userInfo == nil then
    return 
  end
  local teamAlphabet = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_WAITINGLIST")
  if userInfo:getTeamNo() == 1 then
    teamAlphabet = "A"
  else
    if userInfo:getTeamNo() == 2 then
      teamAlphabet = "B"
    end
  end
  local message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_COMPETITION_USER_CHANGETEAM", "characterName", userInfo:getCharacterName(), "teamNo", teamAlphabet)
  chatting_sendMessage("", message, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
end

FromClient_GetOutUserFromCompetition = function(outUserInfo)
  -- function num : 0_25
  if outUserInfo == nil then
    return 
  end
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GETOUT_FROM_COMPETITION", "characterName", outUserInfo:getCharacterName()))
end

CompetitionGameForTeamChange_Event = function()
  -- function num : 0_26 , upvalues : competitionGameForTeamChange
  local self = competitionGameForTeamChange
  ;
  (self._btn_TeamA):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionTeamChange(" .. 1 .. ")")
  ;
  (self._btn_TeamB):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionTeamChange(" .. 2 .. ")")
  ;
  (self._btn_TeamWait):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionTeamChange(" .. 0 .. ")")
  ;
  (self._btn_leaveCompetition):addInputEvent("Mouse_LUp", "ToClient_RequestLeaveMyself()")
  registerEvent("FromClient_UpdateObserverList", "FromClient_UpdateTeamUserList")
  registerEvent("FromClient_UpdateEntryList", "FromClient_UpdateTeamUserList")
  registerEvent("FromClient_ChangeMatchType", "HandleChangeMode")
  registerEvent("FromClient_UpdateTeamScore", "FromClient_UpdateTeamScore")
  registerEvent("FromClient_WaitBeforeFight", "FromClient_WaitBeforeFight")
  registerEvent("FromClient_CompetitionMatchDone", "FromClient_CompetitionMatchDone")
  registerEvent("FromClient_ChangeMatchType", "HandleChangeOption_ForTeamChange")
  registerEvent("FromClient_CompetitionOptionChanged", "HandleChangeOption_ForTeamChange")
  registerEvent("FromClient_JoinNewPlayer", "HandleJoinNewPlayer")
  registerEvent("FromClient_KillHistory", "HandleAnyUserDead")
  registerEvent("FromClient_EntryUserChangeTeam", "FromClient_EntryUserChangeTeam")
  registerEvent("FromClient_GetOutUserFromCompetition", "FromClient_GetOutUserFromCompetition")
end

CompetitionGameForTeamChange_Init()
CompetitionGameForTeamChange_Event()

