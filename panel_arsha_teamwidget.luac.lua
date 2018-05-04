-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\arsha\panel_arsha_teamwidget.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_Arsha_TeamWidget:SetShow(false)
local arshaPvPWidget = {roundWing = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_RoundWing"), freeWing = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_FreeWing"), roundCenter = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_RoundCenter"), freeCenter = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_FreeCenter"), personalWing = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_PersonalMatchWing"), personalCenter = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_PersonalMatchCenter"), fightState = (CppEnums.CompetitionFightState).eCompetitionFightState_Done, matchType = (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round}
arshaPvPWidget.roundTime = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_RoundTime")
arshaPvPWidget.roundCount = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_RoundCount")
arshaPvPWidget.leftPoint = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_LeftPoint")
arshaPvPWidget.rightPoint = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_RightPoint")
arshaPvPWidget.leftParty = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_LeftParty")
arshaPvPWidget.rightParty = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_RightParty")
arshaPvPWidget.freeTime = (UI.getChildControl)(arshaPvPWidget.freeCenter, "StaticText_FreeTime")
arshaPvPWidget.freeLiveTeam = (UI.getChildControl)(arshaPvPWidget.freeCenter, "StaticText_LiveTeam")
arshaPvPWidget.personalMatchTime = (UI.getChildControl)(arshaPvPWidget.personalCenter, "StaticText_PersonalMatchTime")
arshaPvPWidget.personalRoundCount = (UI.getChildControl)(arshaPvPWidget.personalCenter, "StaticText_RoundCount")
arshaPvPWidget.personalLeftPoint = (UI.getChildControl)(arshaPvPWidget.personalCenter, "StaticText_LeftPoint")
arshaPvPWidget.personalRightPoint = (UI.getChildControl)(arshaPvPWidget.personalCenter, "StaticText_RightPoint")
arshaPvPWidget.personalLeftParty = (UI.getChildControl)(arshaPvPWidget.personalCenter, "StaticText_LeftParty")
arshaPvPWidget.personalRightParty = (UI.getChildControl)(arshaPvPWidget.personalCenter, "StaticText_RightParty")
local saveAScore = 0
local saveBScore = 0
local teamCheck = false
local savedMatchType = 0
local hideAndShowWingWidget = function()
  -- function num : 0_0 , upvalues : arshaPvPWidget
  local self = arshaPvPWidget
  ;
  (self.roundWing):SetShow(false)
  ;
  (self.roundCenter):SetShow(false)
  ;
  (self.freeWing):SetShow(false)
  ;
  (self.freeCenter):SetShow(false)
  ;
  (self.personalWing):SetShow(false)
  ;
  (self.personalCenter):SetShow(false)
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round == ToClient_CompetitionMatchType() then
    (self.roundWing):SetShow(true)
    ;
    (self.roundCenter):SetShow(true)
  else
    if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_FreeForAll == ToClient_CompetitionMatchType() then
      (self.freeWing):SetShow(true)
      ;
      (self.freeCenter):SetShow(true)
    else
      if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Personal == ToClient_CompetitionMatchType() then
        (self.personalWing):SetShow(true)
        ;
        (self.personalCenter):SetShow(true)
      end
    end
  end
end

ArshaPvP_Widget_Init = function()
  -- function num : 0_1 , upvalues : arshaPvPWidget, hideAndShowWingWidget
  local self = arshaPvPWidget
  local team = ""
  local teamA = 0
  local teamB = 0
  hideAndShowWingWidget()
  teamA = ToClient_GetRoundTeamScore(1)
  teamB = ToClient_GetRoundTeamScore(2)
  local teamA_Info, teamB_Info = nil, nil
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round == ToClient_CompetitionMatchType() then
    teamA_Info = ToClient_GetTeamListAt(0)
    teamB_Info = ToClient_GetTeamListAt(1)
  else
    if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Personal == ToClient_CompetitionMatchType() then
      teamA_Info = ToClient_GetArshaTeamInfo(1)
      teamB_Info = ToClient_GetArshaTeamInfo(2)
    end
  end
  local teamA_Name = ""
  local teamB_Name = ""
  if teamA_Info ~= nil and teamB_Info ~= nil then
    teamA_Name = teamA_Info:getTeamName()
    teamB_Name = teamB_Info:getTeamName()
  end
  if teamA_Name == "" or teamB_Name == "" then
    teamA_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
    teamB_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
  end
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round == ToClient_CompetitionMatchType() then
    (self.leftParty):SetText(teamA_Name)
    ;
    (self.rightParty):SetText(teamB_Name)
    ;
    (self.leftPoint):SetText(teamA)
    ;
    (self.rightPoint):SetText(teamB)
    ;
    (self.roundCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_USER_OPTION_ROUND_FORCOUNT", "targetScore", ToClient_GetTargetScore()))
  else
    if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Personal == ToClient_CompetitionMatchType() then
      (self.personalRoundCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_PERSONALMODE"))
      ;
      (self.personalLeftParty):SetText(teamA_Name)
      ;
      (self.personalRightParty):SetText(teamB_Name)
      if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == ToClient_CompetitionFightState() then
        (self.personalLeftPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
        ;
        (self.personalRightPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
      else
        if teamA_Info ~= nil and teamB_Info ~= nil then
          local teamAAliveCount = teamA_Info:getAliveAttendCount()
          local teamBAliveCount = teamB_Info:getAliveAttendCount()
          ;
          (self.personalLeftPoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ALIVECOUNT_SCORE", "aliveCount", teamAAliveCount))
          ;
          (self.personalRightPoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ALIVECOUNT_SCORE", "aliveCount", teamBAliveCount))
        else
          do
            ;
            (self.personalLeftPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
            ;
            (self.personalRightPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
          end
        end
      end
    end
  end
end

ArshaPvP_Widget_Show = function()
  -- function num : 0_2 , upvalues : hideAndShowWingWidget
  hideAndShowWingWidget()
  Panel_Arsha_TeamWidget:SetShow(true)
end

ArshaPvP_Widget_Hide = function()
  -- function num : 0_3
  if Panel_Arsha_TeamWidget:GetShow() then
    Panel_Arsha_TeamWidget:GetShow(false)
  end
end

FGlobal_ArshaPvP_Widget_Show = function()
  -- function num : 0_4 , upvalues : saveAScore, saveBScore
  if ToClient_GetMyTeamNo() == -2 then
    ArshaPvP_Widget_Hide()
    return 
  end
  saveAScore = 0
  saveBScore = 0
  ArshaPvP_Widget_Show()
  ArshaPvP_Widget_Update()
end

ArshaPvP_Widget_Update = function()
  -- function num : 0_5 , upvalues : arshaPvPWidget, savedMatchType, hideAndShowWingWidget
  local self = arshaPvPWidget
  local isMyselfInArena = ToClient_IsMyselfInArena()
  if isMyselfInArena == false then
    return 
  end
  local isTeam = ToClient_GetMyTeamNo()
  local isFightType = ToClient_CompetitionFightState()
  ;
  (self.leftPoint):SetShow(true)
  ;
  (self.rightPoint):SetShow(true)
  savedMatchType = ToClient_CompetitionMatchType()
  self.matchType = savedMatchType
  if (CppEnums.CompetitionFightState).eCompetitionFightState_Fight == isFightType then
    hideAndShowWingWidget()
    Panel_Arsha_TeamWidget:SetShow(true)
  else
    if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == isFightType then
      Panel_Arsha_TeamWidget:SetShow(true)
      hideAndShowWingWidget()
    else
      if (CppEnums.CompetitionFightState).eCompetitionFightState_Wait == isFightType then
        hideAndShowWingWidget()
        Panel_Arsha_TeamWidget:SetShow(true)
      else
        if ToClient_IsMyselfInArena() then
          Panel_Arsha_TeamWidget:SetShow(true)
        else
          Panel_Arsha_TeamWidget:SetShow(false)
        end
        hideAndShowWingWidget()
      end
    end
  end
  local teamA_Info, teamB_Info = nil, nil
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round == ToClient_CompetitionMatchType() then
    teamA_Info = ToClient_GetTeamListAt(0)
    teamB_Info = ToClient_GetTeamListAt(1)
  else
    if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Personal == ToClient_CompetitionMatchType() then
      teamA_Info = ToClient_GetArshaTeamInfo(1)
      teamB_Info = ToClient_GetArshaTeamInfo(2)
    end
  end
  local teamA_Name = ""
  local teamB_Name = ""
  if teamA_Info ~= nil and teamB_Info ~= nil then
    teamA_Name = teamA_Info:getTeamName()
    teamB_Name = teamB_Info:getTeamName()
  end
  if teamA_Name == "" or teamB_Name == "" then
    teamA_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
    teamB_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
  end
  if ToClient_CompetitionMatchType() == 0 then
    local teamA = ToClient_GetRoundTeamScore(1)
    local teamB = ToClient_GetRoundTeamScore(2)
    ;
    (self.leftParty):SetText(teamA_Name)
    ;
    (self.rightParty):SetText(teamB_Name)
    ;
    (self.leftPoint):SetText(teamA)
    ;
    (self.rightPoint):SetText(teamB)
    ;
    (self.roundCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_USER_OPTION_ROUND_FORCOUNT", "targetScore", ToClient_GetTargetScore()))
  else
    do
      if ToClient_CompetitionMatchType() == 1 then
        (self.leftPoint):SetShow(false)
        ;
        (self.rightPoint):SetShow(false)
        ;
        (self.freeLiveTeam):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_TEAMWIDGET_FREELIVETEAMSCORE", "targetScore", ToClient_GetTargetScore()))
      else
        if ToClient_CompetitionMatchType() == 2 then
          (self.personalLeftParty):SetText(teamA_Name)
          ;
          (self.personalRightParty):SetText(teamB_Name)
          if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == ToClient_CompetitionFightState() then
            (self.personalLeftPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
            ;
            (self.personalRightPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
          else
            if teamA_Info ~= nil and teamB_Info ~= nil then
              local teamAAliveCount = teamA_Info:getAliveAttendCount()
              local teamBAliveCount = teamB_Info:getAliveAttendCount()
              ;
              (self.personalLeftPoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ALIVECOUNT_SCORE", "aliveCount", teamAAliveCount))
              ;
              (self.personalRightPoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ALIVECOUNT_SCORE", "aliveCount", teamBAliveCount))
            else
              do
                ;
                (self.personalLeftPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
                ;
                (self.personalRightPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
                ;
                (self.personalRoundCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_PERSONALMODE"))
                local option = getArshaPvpOption()
                ;
                (self.freeTime):SetText(convertSecondsToClockTime(option._timeLimit))
                ;
                (self.roundTime):SetText(convertSecondsToClockTime(option._timeLimit))
                ;
                (self.personalMatchTime):SetText(convertSecondsToClockTime(option._timeLimit))
              end
            end
          end
        end
      end
    end
  end
end

FromClient_UpdatePersonalMatchScore = function()
  -- function num : 0_6 , upvalues : arshaPvPWidget
  local self = arshaPvPWidget
  if ToClient_CompetitionMatchType() ~= 2 then
    return 
  end
  local teamA_Info = ToClient_GetArshaTeamInfo(1)
  local teamB_Info = ToClient_GetArshaTeamInfo(2)
  if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == ToClient_CompetitionFightState() then
    (self.personalLeftPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
    ;
    (self.personalRightPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
  else
    if teamA_Info ~= nil and teamB_Info ~= nil then
      local teamAAliveCount = teamA_Info:getAliveAttendCount()
      local teamBAliveCount = teamB_Info:getAliveAttendCount()
      ;
      (self.personalLeftPoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ALIVECOUNT_SCORE", "aliveCount", teamAAliveCount))
      ;
      (self.personalRightPoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ALIVECOUNT_SCORE", "aliveCount", teamBAliveCount))
    else
      do
        ;
        (self.personalLeftPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
        ;
        (self.personalRightPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
      end
    end
  end
end

ArshaPvP_Match_ScoreReset = function()
  -- function num : 0_7 , upvalues : arshaPvPWidget
  local self = arshaPvPWidget
  ;
  (self.leftPoint):SetText(0)
  ;
  (self.rightPoint):SetText(0)
end

local saveLocalWarTime = 0
local delayTime = 1
local competitionGameDeltaTime = 0
ArshaPvP_Widget_PerframeMain = function(deltaTime)
  -- function num : 0_8 , upvalues : arshaPvPWidget, delayTime, competitionGameDeltaTime
  local self = arshaPvPWidget
  do
    local isPlaying = self.fightState == (CppEnums.CompetitionFightState).eCompetitionFightState_Fight
    if not isPlaying then
      return 
    end
    if competitionGameDeltaTime + deltaTime < delayTime then
      competitionGameDeltaTime = competitionGameDeltaTime + deltaTime
      return 
    end
    competitionGameDeltaTime = 0
    self:updateTimerWidget()
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

arshaPvPWidget.updateTimerWidget = function(self)
  -- function num : 0_9
  if self.matchType == (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round then
    self:_upadteTimerWidget(self.roundTime)
  else
    if self.matchType == (CppEnums.CompetitionMatchType).eCompetitionMatchMode_FreeForAll then
      self:_upadteTimerWidget(self.freeTime)
    else
      if self.matchType == (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Personal then
        self:_upadteTimerWidget(self.personalMatchTime)
      end
    end
  end
  Panel_Arsha_TeamWidget:ComputePos()
end

arshaPvPWidget._upadteTimerWidget = function(self, targetControl)
  -- function num : 0_10
  local warTime = ToClient_CompetitionRemainMatchTime()
  if warTime > 0 then
    targetControl:SetText(convertSecondsToClockTime(warTime))
  else
    targetControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
  end
end

FromClient_UpdateFightState = function(fightState, isShowingResultMessage)
  -- function num : 0_11 , upvalues : arshaPvPWidget, hideAndShowWingWidget
  local self = arshaPvPWidget
  if fightState == nil or fightState == "" then
    return 
  end
  self.fightState = fightState
  ArshaPvP_Widget_Init()
  Panel_Arsha_SelectMember:ClosePanel()
  if (CppEnums.CompetitionFightState).eCompetitionFightState_Fight == fightState then
    hideAndShowWingWidget()
    CompetitionGame_TeamUi_Create()
    Panel_Arsha_TeamWidget:SetShow(true)
    local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_START_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_START_SUB"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 56, false)
  else
    do
      if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == fightState then
        Panel_Arsha_TeamWidget:SetShow(true)
        CompetitionGameTeamUI_Close()
        Panel_Arsha_SelectMember:Clear()
        do
          if isShowingResultMessage == false then
            local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_STOP_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_STOP_SUB"), addMsg = ""}
            Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 57, false)
          end
          hideAndShowWingWidget()
          ;
          (self.personalLeftPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
          ;
          (self.personalRightPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_WAITING"))
          if (CppEnums.CompetitionFightState).eCompetitionFightState_Wait == fightState then
            hideAndShowWingWidget()
            CompetitionGameTeamUI_Close()
            Panel_Arsha_TeamWidget:SetShow(true)
          else
            if (CppEnums.CompetitionFightState).eCompetitionFightState_SelectAttend == fightState then
              CompetitionGameTeamUI_Close()
              if ToClient_GetMyTeamNo() > 0 then
                Panel_Arsha_SelectMember:OpenPanel()
              end
              hideAndShowWingWidget()
            else
              if ToClient_IsMyselfInArena() then
                Panel_Arsha_TeamWidget:SetShow(true)
              else
                Panel_Arsha_TeamWidget:SetShow(false)
              end
              hideAndShowWingWidget()
            end
          end
        end
      end
    end
  end
end

ArshaPvP_Widget_Repos = function()
  -- function num : 0_12
  Panel_Arsha_TeamWidget:SetPosX(getScreenSizeX() / 2 - Panel_Arsha_TeamWidget:GetSizeX() / 2)
  Panel_Arsha_TeamWidget:SetPosY(0)
end

ArshaPvP_Widget_SubInit = function()
  -- function num : 0_13
  if ToClient_GetMyTeamNo() == -2 then
    ArshaPvP_Widget_Hide()
    return 
  end
end

FromClient_WaitTimeAlert = function(second)
  -- function num : 0_14
  local msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_WAIT_BEFORE_FIGHT", "waitTime", second)
  if msg ~= nil and msg ~= "" then
    Proc_ShowMessage_Ack(msg)
  end
end

FromClient_ArshaTeamMasterOut = function(teamNo)
  -- function num : 0_15
  if teamNo == ToClient_GetMyTeamNo() then
    local msg = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_MYTEAM_MASTER_ESCAPED")
    if msg ~= nil and msg ~= "" then
      Proc_ShowMessage_Ack(msg)
    end
  else
    do
      do return  end
    end
  end
end

ArshaPvP_Widget_LualoadComplete = function()
  -- function num : 0_16
  FGlobal_ArshaPvP_Widget_Show()
  ArshaPvP_Widget_Update()
end

FromClient_ArshaDebuff = function()
  -- function num : 0_17
end

FromClient_ArshaPersonalMatchDebuff_Message = function(debuffTeamNo)
  -- function num : 0_18
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Personal ~= ToClient_CompetitionMatchType() then
    return 
  end
  if debuffTeamNo ~= 1 and debuffTeamNo ~= 2 then
    return 
  end
  local teamInfo = ToClient_GetArshaTeamInfo(debuffTeamNo)
  if teamInfo == nil then
    return 
  end
  local userInfo = ToClient_GetEntryInfoByUserNo(teamInfo:getAttendPlayer())
  if userInfo == nil then
    return 
  end
  local teamName = teamInfo:getTeamName()
  if teamName == "" then
    if debuffTeamNo == 1 then
      teamName = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
    else
      teamName = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
    end
  end
  local msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ARSHAPERSONALMATCH_DEBUFF_APPLIED", "teamName", teamName, "playerName", userInfo:getCharacterName())
  Proc_ShowMessage_Ack(msg)
end

ArshaPvP_Widget_Init()
ArshaPvP_Widget_SubInit()
registerEvent("FromClient_luaLoadComplete", "ArshaPvP_Widget_LualoadComplete")
registerEvent("onScreenResize", "ArshaPvP_Widget_Repos")
registerEvent("FromClient_UpdateFightState", "FromClient_UpdateFightState")
registerEvent("FromClient_UpdateTeamScore", "ArshaPvP_Widget_Update")
registerEvent("FromClient_UpdatePersonalMatchAliveAttendCount", "FromClient_UpdatePersonalMatchScore")
registerEvent("FromClient_FirstMatchStart", "ArshaPvP_Match_ScoreReset")
registerEvent("FromClient_WaitTimeAlert", "FromClient_WaitTimeAlert")
registerEvent("FromClient_ArshaTeamMasterOut", "FromClient_ArshaTeamMasterOut")
registerEvent("FromClient_ArshaDebuff", "FromClient_ArshaDebuff")
registerEvent("FromClient_ArshaPersonalMatchDebuff", "FromClient_ArshaPersonalMatchDebuff_Message")
Panel_Arsha_TeamWidget:RegisterUpdateFunc("ArshaPvP_Widget_PerframeMain")

