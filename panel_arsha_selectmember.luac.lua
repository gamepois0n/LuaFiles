-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\arsha\panel_arsha_selectmember.luac 

-- params : ...
-- function num : 0
Panel_Arsha_SelectMember = {
_ui = {_btn_WinClose = (UI.getChildControl)(Panel_Window_ArshaSelectMember, "Button_Win_Close"), _staticText_Title = (UI.getChildControl)(Panel_Window_ArshaSelectMember, "StaticText_Title"), _static_TopBg = (UI.getChildControl)(Panel_Window_ArshaSelectMember, "Static_TopBg"), _static_Bg = (UI.getChildControl)(Panel_Window_ArshaSelectMember, "Static_Bg"), _static_BottomBg = (UI.getChildControl)(Panel_Window_ArshaSelectMember, "Static_BottomBg")}
, _attendUserNoTemp = toInt64(-1, -1)}
local EnableControl = function(target, isEnable)
  -- function num : 0_0
  if isEnable == true then
    target:SetEnable(true)
    target:SetMonoTone(false)
    target:SetIgnore(false)
  else
    target:SetEnable(false)
    target:SetMonoTone(true)
    target:SetIgnore(true)
  end
end

local EnableText = function(targetText, isEnable)
  -- function num : 0_1
  if isEnable == true then
    targetText:SetFontAlpha(1)
  else
    targetText:SetFontAlpha(0.65)
  end
end

CreateListContent_Arsha_AttendMember = function(content, userIdx)
  -- function num : 0_2 , upvalues : EnableControl
  local myTeamNo = ToClient_GetMyTeamNo()
  local teamInfo = ToClient_GetArshaTeamInfo(myTeamNo)
  if teamInfo == nil then
    return 
  end
  local userInfo = ToClient_GetTeamUserInfoAt(myTeamNo, Int64toInt32(userIdx))
  if userInfo == nil then
    return 
  end
  local isAttendSet = ToClient_IsMyTeamAttendSetted()
  local isDead = userInfo:isDeadInPersonalMatch()
  local selectedUserInfo = ToClient_GetEntryInfoByUserNo(Panel_Arsha_SelectMember._attendUserNoTemp)
  local userNo = userInfo:getUserNo()
  local selectedUserNo = -1
  if selectedUserInfo ~= nil then
    selectedUserNo = selectedUserInfo:getUserNo()
  end
  local checkBtn_AsAttend = (UI.getChildControl)(content, "CheckButton_SelectAttend")
  local static_ClassIcon = (UI.getChildControl)(content, "Static_ClassIcon")
  local staticText_Level = (UI.getChildControl)(content, "StaticText_Level")
  local staticText_Name = (UI.getChildControl)(content, "StaticText_CharacterName")
  local staticText_State = (UI.getChildControl)(content, "StaticText_State")
  local staticTeamMasterIcon = (UI.getChildControl)(content, "Static_TeamMasterIcon")
  local classSymbomInfo = (CppEnums.ClassType_Symbol)[userInfo:getCharacterClass()]
  static_ClassIcon:ChangeTextureInfoName(classSymbomInfo[1])
  local x1, y1, x2, y2 = setTextureUV_Func(static_ClassIcon, classSymbomInfo[2], classSymbomInfo[3], classSymbomInfo[4], classSymbomInfo[5])
  ;
  (static_ClassIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
  static_ClassIcon:setRenderTexture(static_ClassIcon:getBaseTexture())
  staticText_Name:SetText(userInfo:getCharacterName())
  staticText_Level:SetText(tostring(userInfo:getCharacterLevel()))
  do
    local isEnable = true
    if isAttendSet == true then
      _PA_LOG("아르샤의�\189", "selected:" .. Int64toInt32(Panel_Arsha_SelectMember._attendUserNoTemp) .. " vs userNo:" .. Int64toInt32(userNo))
      EnableControl(checkBtn_AsAttend, false)
      checkBtn_AsAttend:SetCheck(selectedUserNo == userNo)
      if selectedUserNo == userNo then
        staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_ENTRYSTATUS_FIGHTING"))
      elseif userInfo:isDeadInPersonalMatch() == true then
        staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_ENTRYSTATUS_DEFEATTED"))
      else
        staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_ENTRYSTATUS_WAITING"))
      end
    else
      EnableControl(checkBtn_AsAttend, true)
      checkBtn_AsAttend:SetShow(true)
      if userInfo:isDeadInPersonalMatch() == true then
        staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_ENTRYSTATUS_DEFEATTED"))
        checkBtn_AsAttend:SetShow(false)
      else
        staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_ENTRYSTATUS_WAITING"))
        if selectedUserInfo == nil then
          checkBtn_AsAttend:SetCheck(false)
        else
          checkBtn_AsAttend:SetCheck(selectedUserNo == userNo)
        end
      end
      checkBtn_AsAttend:addInputEvent("Mouse_LUp", "Panel_Arsha_SelectMember:SetAttendMemberTemp(" .. Int64toInt32(userIdx) .. ")")
    end
    staticTeamMasterIcon:SetShow(false)
    if ToClient_Arsha_IsMySelfTeamMaster() == false then
      checkBtn_AsAttend:SetShow(false)
      if userNo == teamInfo:getTeamMaster() then
        staticTeamMasterIcon:SetShow(true)
      end
    end
    -- DECOMPILER ERROR: 10 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

Panel_Arsha_SelectMember.OpenPanel = function(self)
  -- function num : 0_3
  _PA_LOG("아르샤의�\189", "Panel_Arsha_SelectMember:Show")
  Panel_Window_ArshaSelectMember:SetShow(true)
  Panel_Window_ArshaSelectMember:SetPosXY(200, 200)
  self:UpdateMemberList()
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

Panel_Arsha_SelectMember.ClosePanel = function(self)
  -- function num : 0_4
  Panel_Window_ArshaSelectMember:SetShow(false)
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

Panel_Arsha_SelectMember.Initialize = function(self)
  -- function num : 0_5
  local ui = self._ui
  ui._staticText_Line = (UI.getChildControl)(ui._static_Bg, "StaticText_Line")
  ui._staticText_CheckTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_CheckTitle")
  ui._staticText_ClassTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_ClassTitle")
  ui._staticText_LevelTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_LevelTitle")
  ui._staticText_NameTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_NameTitle")
  ui._staticText_StateTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_StateTitle")
  ui._list_entryMembers = (UI.getChildControl)(ui._static_Bg, "List2_Member")
  ui._btn_ConfirmAttend = (UI.getChildControl)(ui._static_BottomBg, "Button_Adjust")
  ui._staticText_OurTeamState = (UI.getChildControl)(ui._static_BottomBg, "StaticText_OurTeamState")
  ;
  (ui._btn_ConfirmAttend):addInputEvent("Mouse_LUp", "Panel_Arsha_SelectMember:ConfirmAttendMember()")
  ;
  (ui._list_entryMembers):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CreateListContent_Arsha_AttendMember")
  ;
  (ui._list_entryMembers):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Personal == ToClient_CompetitionMatchType() and (CppEnums.CompetitionFightState).eCompetitionFightState_SelectAttend == ToClient_CompetitionFightState() then
    Panel_Arsha_SelectMember:OpenPanel()
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R2 in 'UnsetPending'

Panel_Arsha_SelectMember.UpdateMemberList = function(self)
  -- function num : 0_6 , upvalues : EnableControl
  local ui = self._ui
  local myTeamNo = ToClient_GetMyTeamNo()
  local isAttendSetted = ToClient_IsMyTeamAttendSetted()
  if isAttendSetted == true then
    local attendUserInfo = ToClient_GetArshaAttendUserInfo(myTeamNo)
    if attendUserInfo == nil then
      return 
    end
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R5 in 'UnsetPending'

    Panel_Arsha_SelectMember._attendUserNoTemp = attendUserInfo:getUserNo()
    EnableControl(ui._btn_ConfirmAttend, false)
  else
    do
      EnableControl(ui._btn_ConfirmAttend, true)
      local ListTeamACount = ToClient_GetTeamUserInfoCount(myTeamNo)
      ;
      ((ui._list_entryMembers):getElementManager()):clearKey()
      if ListTeamACount > 0 then
        for idx = 0, ListTeamACount - 1 do
          ((ui._list_entryMembers):getElementManager()):pushKey(idx)
        end
      end
      do
        if isAttendSetted == true then
          (ui._staticText_OurTeamState):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING_OTHERATTEND"))
        else
          if ToClient_Arsha_IsMySelfTeamMaster() == true then
            (ui._staticText_OurTeamState):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_SELECT_AND_CONFIRM"))
          else
            ;
            (ui._staticText_OurTeamState):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_SELECTING_OURATTEND"))
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R2 in 'UnsetPending'

Panel_Arsha_SelectMember.SetAttendMemberTemp = function(self, userIdx)
  -- function num : 0_7
  local myTeamNo = ToClient_GetMyTeamNo()
  local teamInfo = ToClient_GetArshaTeamInfo(myTeamNo)
  if teamInfo == nil then
    return 
  end
  local userInfo = ToClient_GetTeamUserInfoAt(myTeamNo, userIdx)
  if userInfo == nil then
    return 
  end
  local userNo = userInfo:getUserNo()
  _PA_LOG("아르샤의�\189", "SetAttendMemberTemp = " .. Int64toInt32(userNo))
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R6 in 'UnsetPending'

  Panel_Arsha_SelectMember._attendUserNoTemp = userNo
  self:UpdateMemberList()
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

Panel_Arsha_SelectMember.ConfirmAttendMember = function(self)
  -- function num : 0_8
  local myTeamNo = ToClient_GetMyTeamNo()
  ToClient_SelectPersonalMatchAttend(self._attendUserNoTemp, myTeamNo)
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R2 in 'UnsetPending'

Panel_Arsha_SelectMember.Clear = function(self)
  -- function num : 0_9
  self._attendUserNoTemp = toInt64(-1, -1)
end

FromClient_SelectAttendTimeAlert = function(second)
  -- function num : 0_10
  local msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_SELECTATTEND_TIMEALERT", "sec", second)
  if msg ~= nil and msg ~= "" then
    Proc_ShowMessage_Ack(msg)
  end
end

FromClient_PersonalMatchAttendSetted = function(userNo, teamNo)
  -- function num : 0_11
  local teamInfo = ToClient_GetArshaTeamInfo(teamNo)
  if teamInfo == nil then
    return 
  end
  local entryInfo = ToClient_GetEntryInfoByUserNo(userNo)
  if entryInfo == nil then
    return 
  end
  local teamName = ""
  teamName = teamInfo:getTeamName()
  if teamName == "" then
    if teamNo == 1 then
      teamName = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
    else
      teamName = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
    end
  end
  local msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ARSHA_TEAMATTEND_SELECTED", "playerName", entryInfo:getCharacterName(), "teamName", teamName)
  if msg ~= nil and msg ~= "" then
    Proc_ShowMessage_Ack(msg)
  end
end

FromClient_PersonalMatchMasterSetted = function(userNo, teamNo, isAutoSelected)
  -- function num : 0_12
  local teamInfo = ToClient_GetArshaTeamInfo(teamNo)
  if teamInfo == nil then
    return 
  end
  local entryInfo = ToClient_GetEntryInfoByUserNo(userNo)
  if entryInfo == nil then
    return 
  end
  local teamName = ""
  teamName = teamInfo:getTeamName()
  if teamName == "" then
    if teamNo == 1 then
      teamName = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
    else
      teamName = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
    end
  end
  local msg = ""
  if isAutoSelected == true then
    msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAMMASTER_CHANGED", "teamName", teamName, "playerName", entryInfo:getCharacterName())
  else
    msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ARSHA_TEAMMASTER_SELECTED", "playerName", entryInfo:getCharacterName(), "teamName", teamName)
  end
  if msg ~= nil and msg ~= "" then
    Proc_ShowMessage_Ack(msg)
  end
  local selfPlayer = getSelfPlayer()
  local fightState = ToClient_CompetitionFightState()
  if selfPlayer ~= nil and (selfPlayer:get()):getUserNo() == userNo and (CppEnums.CompetitionFightState).eCompetitionFightState_SelectAttend == fightState then
    Panel_Arsha_SelectMember:OpenPanel()
  end
end

FromClient_luaLoadComplete_Arsha_SelectMemeber = function()
  -- function num : 0_13
  Panel_Arsha_SelectMember:Initialize()
end

FromClient_ArshaMyAttendSetResult = function(isSuccess, userNo)
  -- function num : 0_14
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R2 in 'UnsetPending'

  if isSuccess == true then
    Panel_Arsha_SelectMember._attendUserNoTemp = userNo
  else
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

    Panel_Arsha_SelectMember._attendUserNoTemp = toInt64(-1, -1)
  end
  Panel_Arsha_SelectMember:UpdateMemberList()
end

FromClient_ResetArshaSelectAttendUI = function()
  -- function num : 0_15
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Arsha_SelectMember._attendUserNoTemp = toInt64(-1, -1)
end

FromClient_ArshaTeamAttendOut_ResetSelectMemberUI = function(teamNo)
  -- function num : 0_16
  local myTeamNo = ToClient_GetMyTeamNo()
  if myTeamNo == teamNo then
    local msg = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_MYTEAM_ATTEND_ESCAPED")
    if msg ~= nil and msg ~= "" then
      Proc_ShowMessage_Ack(msg)
    end
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_RESELECT_ATTEND")
    if msg ~= nil and msg ~= "" then
      Proc_ShowMessage_Ack(msg)
    end
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R3 in 'UnsetPending'

    Panel_Arsha_SelectMember._attendUserNoTemp = toInt64(-1, -1)
    Panel_Arsha_SelectMember:UpdateMemberList()
  else
    do
      local msg = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_OTHERTEAM_ATTEND_ESCAPED")
      if msg ~= nil and msg ~= "" then
        Proc_ShowMessage_Ack(msg)
      end
    end
  end
end

FromClient_UpdateEntryList_UpdateMember = function()
  -- function num : 0_17
  Panel_Arsha_SelectMember:UpdateMemberList()
end

FromClient_UpdateTeamScore_ClearLoseTeam = function(teamNum, scoreValue, round, winTeamHP, loseTeamHP)
  -- function num : 0_18
  if teamNum == 0 then
    Panel_Arsha_SelectMember:Clear()
  else
    if ToClient_GetMyTeamNo() ~= teamNum then
      Panel_Arsha_SelectMember:Clear()
    end
  end
end

registerEvent("FromClient_SelectAttendTimeAlert", "FromClient_SelectAttendTimeAlert")
registerEvent("FromClient_PersonalMatchAttendSetted", "FromClient_PersonalMatchAttendSetted")
registerEvent("FromClient_PersonalMatchMasterSetted", "FromClient_PersonalMatchMasterSetted")
registerEvent("FromClient_ArshaMyAttendSetResult", "FromClient_ArshaMyAttendSetResult")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Arsha_SelectMemeber")
registerEvent("FromClient_FirstMatchStart", "FromClient_ResetArshaSelectAttendUI")
registerEvent("FromClient_ArshaTeamAttendOut", "FromClient_ArshaTeamAttendOut_ResetSelectMemberUI")
registerEvent("FromClient_UpdateEntryList", "FromClient_UpdateEntryList_UpdateMember")
registerEvent("FromClient_UpdateTeamScore", "FromClient_UpdateTeamScore_ClearLoseTeam")

