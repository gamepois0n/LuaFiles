-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\arsha\panel_arsha_teamwidget.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_Arsha_TeamWidget:SetShow(false)
local arshaPvPWidget = {roundWing = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_RoundWing"), freeWing = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_FreeWing"), roundCenter = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_RoundCenter"), freeCenter = (UI.getChildControl)(Panel_Arsha_TeamWidget, "Static_FreeCenter"), fightState = (CppEnums.CompetitionFightState).eCompetitionFightState_Done, matchType = (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round}
arshaPvPWidget.roundTime = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_RoundTime")
arshaPvPWidget.roundCount = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_RoundCount")
arshaPvPWidget.leftPoint = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_LeftPoint")
arshaPvPWidget.rightPoint = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_RightPoint")
arshaPvPWidget.leftParty = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_LeftParty")
arshaPvPWidget.rightParty = (UI.getChildControl)(arshaPvPWidget.roundCenter, "StaticText_RightParty")
arshaPvPWidget.freeTime = (UI.getChildControl)(arshaPvPWidget.freeCenter, "StaticText_FreeTime")
arshaPvPWidget.freeLiveTeam = (UI.getChildControl)(arshaPvPWidget.freeCenter, "StaticText_LiveTeam")
local saveAScore = 0
local saveBScore = 0
local teamCheck = false
local savedMatchType = 0
ArshaPvP_Widget_Init = function()
  -- function num : 0_0 , upvalues : arshaPvPWidget
  local self = arshaPvPWidget
  local team = ""
  local teamA = 0
  local teamB = 0
  if ToClient_CompetitionMatchType() == 0 then
    (self.roundWing):SetShow(true)
    ;
    (self.roundCenter):SetShow(true)
    ;
    (self.freeWing):SetShow(false)
    ;
    (self.freeCenter):SetShow(false)
  else
    ;
    (self.roundWing):SetShow(false)
    ;
    (self.roundCenter):SetShow(false)
    ;
    (self.freeWing):SetShow(true)
    ;
    (self.freeCenter):SetShow(true)
  end
  teamA = ToClient_GetRoundTeamScore(1)
  teamB = ToClient_GetRoundTeamScore(2)
  local teamA_Info = ToClient_GetTeamListAt(0)
  local teamB_Info = ToClient_GetTeamListAt(1)
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
end

ArshaPvP_Widget_Show = function()
  -- function num : 0_1 , upvalues : arshaPvPWidget
  local self = arshaPvPWidget
  if ToClient_CompetitionMatchType() == 0 then
    (self.roundWing):SetShow(true)
    ;
    (self.roundCenter):SetShow(true)
    ;
    (self.freeWing):SetShow(false)
    ;
    (self.freeCenter):SetShow(false)
    Panel_Arsha_TeamWidget:SetShow(true)
  else
    if ToClient_CompetitionMatchType() == 1 then
      (self.roundWing):SetShow(false)
      ;
      (self.roundCenter):SetShow(false)
      ;
      (self.freeCenter):SetShow(true)
      ;
      (self.freeWing):SetShow(true)
      Panel_Arsha_TeamWidget:SetShow(true)
    end
  end
end

ArshaPvP_Widget_Hide = function()
  -- function num : 0_2
  if Panel_Arsha_TeamWidget:GetShow() then
    Panel_Arsha_TeamWidget:GetShow(false)
  end
end

FGlobal_ArshaPvP_Widget_Show = function()
  -- function num : 0_3 , upvalues : saveAScore, saveBScore
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
  -- function num : 0_4 , upvalues : arshaPvPWidget, savedMatchType
  local self = arshaPvPWidget
  local isMyselfInArena = ToClient_IsMyselfInArena()
  if isMyselfInArena == false then
    return 
  end
  local teamA = 0
  local teamB = 0
  local isTeam = ToClient_GetMyTeamNo()
  local isFightType = ToClient_CompetitionFightState()
  ;
  (self.leftPoint):SetShow(true)
  ;
  (self.rightPoint):SetShow(true)
  savedMatchType = ToClient_CompetitionMatchType()
  self.matchType = savedMatchType
  if ToClient_CompetitionMatchType() == 0 then
    teamA = ToClient_GetRoundTeamScore(1)
    teamB = ToClient_GetRoundTeamScore(2)
  else
    ;
    (self.leftPoint):SetShow(false)
    ;
    (self.rightPoint):SetShow(false)
    ;
    (self.freeLiveTeam):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_TEAMWIDGET_FREELIVETEAMSCORE", "targetScore", ToClient_GetTargetScore()))
  end
  if (CppEnums.CompetitionFightState).eCompetitionFightState_Fight == isFightType then
    local isShowTeamInfo = true
    if ToClient_CompetitionMatchType() == 1 then
      isShowTeamInfo = false
      ;
      (self.roundWing):SetShow(false)
      ;
      (self.roundCenter):SetShow(false)
      ;
      (self.freeWing):SetShow(true)
      ;
      (self.freeCenter):SetShow(true)
    else
      ;
      (self.roundWing):SetShow(true)
      ;
      (self.roundCenter):SetShow(true)
      ;
      (self.freeWing):SetShow(false)
      ;
      (self.freeCenter):SetShow(false)
      ;
      (self.leftPoint):SetShow(true)
      ;
      (self.rightPoint):SetShow(true)
      ;
      (self.leftParty):SetShow(true)
      ;
      (self.rightParty):SetShow(true)
    end
    Panel_Arsha_TeamWidget:SetShow(true)
  else
    do
      if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == isFightType then
        Panel_Arsha_TeamWidget:SetShow(true)
        if ToClient_CompetitionMatchType() == 1 then
          isShowTeamInfo = false
          ;
          (self.freeWing):SetShow(true)
          ;
          (self.freeCenter):SetShow(true)
          ;
          (self.roundWing):SetShow(false)
          ;
          (self.roundCenter):SetShow(false)
        else
          ;
          (self.roundWing):SetShow(true)
          ;
          (self.roundCenter):SetShow(true)
          ;
          (self.freeWing):SetShow(false)
          ;
          (self.freeCenter):SetShow(false)
          ;
          (self.leftPoint):SetShow(true)
          ;
          (self.rightPoint):SetShow(true)
          ;
          (self.leftParty):SetShow(true)
          ;
          (self.rightParty):SetShow(true)
        end
      else
        if (CppEnums.CompetitionFightState).eCompetitionFightState_Wait == isFightType then
          if ToClient_CompetitionMatchType() == 1 then
            (self.roundWing):SetShow(false)
            ;
            (self.roundCenter):SetShow(false)
            ;
            (self.freeWing):SetShow(true)
            ;
            (self.freeCenter):SetShow(true)
          else
            ;
            (self.roundWing):SetShow(true)
            ;
            (self.roundCenter):SetShow(true)
            ;
            (self.freeWing):SetShow(false)
            ;
            (self.freeCenter):SetShow(false)
            ;
            (self.leftPoint):SetShow(true)
            ;
            (self.rightPoint):SetShow(true)
            ;
            (self.leftParty):SetShow(true)
            ;
            (self.rightParty):SetShow(true)
          end
          Panel_Arsha_TeamWidget:SetShow(true)
        else
          if ToClient_IsMyselfInArena() then
            Panel_Arsha_TeamWidget:SetShow(true)
          else
            Panel_Arsha_TeamWidget:SetShow(false)
          end
          if ToClient_CompetitionMatchType() == 1 then
            (self.roundWing):SetShow(false)
            ;
            (self.roundCenter):SetShow(false)
            ;
            (self.freeWing):SetShow(true)
            ;
            (self.freeCenter):SetShow(true)
          else
            ;
            (self.roundWing):SetShow(true)
            ;
            (self.roundCenter):SetShow(true)
            ;
            (self.freeWing):SetShow(false)
            ;
            (self.freeCenter):SetShow(false)
            ;
            (self.leftPoint):SetShow(true)
            ;
            (self.rightPoint):SetShow(true)
            ;
            (self.leftParty):SetShow(true)
            ;
            (self.rightParty):SetShow(true)
          end
        end
      end
      local teamA_Info = ToClient_GetTeamListAt(0)
      local teamB_Info = ToClient_GetTeamListAt(1)
      local teamA_Name = ""
      local teamB_Name = ""
      if teamA_Info ~= nil and teamB_Info ~= nil then
        teamA_Name = teamA_Info:getTeamName()
        teamB_Name = teamB_Info:getTeamName()
      end
      if teamA_Name == "" or teamB_Name == "" then
        teamA_Name = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_A_TEAM")
        teamB_Name = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_B_TEAM")
      end
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
      local option = getArshaPvpOption()
      ;
      (self.freeTime):SetText(convertSecondsToClockTime(option._timeLimit))
      ;
      (self.roundTime):SetText(convertSecondsToClockTime(option._timeLimit))
    end
  end
end

ArshaPvP_Match_ScoreReset = function()
  -- function num : 0_5 , upvalues : arshaPvPWidget
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
  -- function num : 0_6 , upvalues : arshaPvPWidget, delayTime, competitionGameDeltaTime
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
  -- function num : 0_7
  if self.matchType == (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round then
    self:_upadteTimerWidget(self.roundTime)
  else
    if self.matchType == (CppEnums.CompetitionMatchType).eCompetitionMatchMode_FreeForAll then
      self:_upadteTimerWidget(self.freeTime)
    end
  end
  Panel_Arsha_TeamWidget:ComputePos()
end

arshaPvPWidget._upadteTimerWidget = function(self, targetControl)
  -- function num : 0_8
  local warTime = ToClient_CompetitionRemainMatchTime()
  if warTime > 0 then
    targetControl:SetText(convertSecondsToClockTime(warTime))
  else
    targetControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
  end
end

FromClient_UpdateFightState = function(fightState)
  -- function num : 0_9 , upvalues : arshaPvPWidget
  local self = arshaPvPWidget
  if fightState == nil or fightState == "" then
    return 
  end
  self.fightState = fightState
  ArshaPvP_Widget_Init()
  if (CppEnums.CompetitionFightState).eCompetitionFightState_Fight == fightState then
    local isShowTeamInfo = true
    if ToClient_CompetitionMatchType() == 1 then
      isShowTeamInfo = false
      ;
      (self.roundWing):SetShow(false)
      ;
      (self.roundCenter):SetShow(false)
      ;
      (self.freeWing):SetShow(true)
      ;
      (self.freeCenter):SetShow(true)
    else
      ;
      (self.roundWing):SetShow(true)
      ;
      (self.roundCenter):SetShow(true)
      ;
      (self.freeWing):SetShow(false)
      ;
      (self.freeCenter):SetShow(false)
      ;
      (self.leftPoint):SetShow(true)
      ;
      (self.rightPoint):SetShow(true)
      ;
      (self.leftParty):SetShow(true)
      ;
      (self.rightParty):SetShow(true)
    end
    CompetitionGame_TeamUi_Create()
    Panel_Arsha_TeamWidget:SetShow(true)
    local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_START_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_START_SUB"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 56, false)
  else
    do
      if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == fightState then
        Panel_Arsha_TeamWidget:SetShow(true)
        CompetitionGameTeamUI_Close()
        local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_STOP_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_STOP_SUB"), addMsg = ""}
        Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 57, false)
        if ToClient_CompetitionMatchType() == 1 then
          isShowTeamInfo = false
          ;
          (self.freeWing):SetShow(true)
          ;
          (self.freeCenter):SetShow(true)
          ;
          (self.roundWing):SetShow(false)
          ;
          (self.roundCenter):SetShow(false)
        else
          ;
          (self.roundWing):SetShow(true)
          ;
          (self.roundCenter):SetShow(true)
          ;
          (self.freeWing):SetShow(false)
          ;
          (self.freeCenter):SetShow(false)
          ;
          (self.leftPoint):SetShow(true)
          ;
          (self.rightPoint):SetShow(true)
          ;
          (self.leftParty):SetShow(true)
          ;
          (self.rightParty):SetShow(true)
        end
      else
        do
          if (CppEnums.CompetitionFightState).eCompetitionFightState_Wait == fightState then
            if ToClient_CompetitionMatchType() == 1 then
              (self.roundWing):SetShow(false)
              ;
              (self.roundCenter):SetShow(false)
              ;
              (self.freeWing):SetShow(true)
              ;
              (self.freeCenter):SetShow(true)
            else
              ;
              (self.roundWing):SetShow(true)
              ;
              (self.roundCenter):SetShow(true)
              ;
              (self.freeWing):SetShow(false)
              ;
              (self.freeCenter):SetShow(false)
              ;
              (self.leftPoint):SetShow(true)
              ;
              (self.rightPoint):SetShow(true)
              ;
              (self.leftParty):SetShow(true)
              ;
              (self.rightParty):SetShow(true)
            end
            CompetitionGameTeamUI_Close()
            Panel_Arsha_TeamWidget:SetShow(true)
          else
            if ToClient_IsMyselfInArena() then
              Panel_Arsha_TeamWidget:SetShow(true)
            else
              Panel_Arsha_TeamWidget:SetShow(false)
            end
            if ToClient_CompetitionMatchType() == 1 then
              (self.roundWing):SetShow(false)
              ;
              (self.roundCenter):SetShow(false)
              ;
              (self.freeWing):SetShow(true)
              ;
              (self.freeCenter):SetShow(true)
            else
              ;
              (self.roundWing):SetShow(true)
              ;
              (self.roundCenter):SetShow(true)
              ;
              (self.freeWing):SetShow(false)
              ;
              (self.freeCenter):SetShow(false)
              ;
              (self.leftPoint):SetShow(true)
              ;
              (self.rightPoint):SetShow(true)
              ;
              (self.leftParty):SetShow(true)
              ;
              (self.rightParty):SetShow(true)
            end
          end
        end
      end
    end
  end
end

ArshaPvP_Widget_Repos = function()
  -- function num : 0_10
  Panel_Arsha_TeamWidget:SetPosX(getScreenSizeX() / 2 - Panel_Arsha_TeamWidget:GetSizeX() / 2)
  Panel_Arsha_TeamWidget:SetPosY(0)
end

ArshaPvP_Widget_SubInit = function()
  -- function num : 0_11
  if ToClient_GetMyTeamNo() == -2 then
    ArshaPvP_Widget_Hide()
    return 
  end
end

FromClient_WaitTimeAlert = function(second)
  -- function num : 0_12
  local msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_WAIT_BEFORE_FIGHT", "waitTime", second)
  if msg ~= nil and msg ~= "" then
    Proc_ShowMessage_Ack(msg)
  end
end

ArshaPvP_Widget_LualoadComplete = function()
  -- function num : 0_13
  FGlobal_ArshaPvP_Widget_Show()
  ArshaPvP_Widget_Update()
end

ArshaPvP_Widget_Init()
ArshaPvP_Widget_SubInit()
registerEvent("FromClient_luaLoadComplete", "ArshaPvP_Widget_LualoadComplete")
registerEvent("onScreenResize", "ArshaPvP_Widget_Repos")
registerEvent("FromClient_UpdateFightState", "FromClient_UpdateFightState")
registerEvent("FromClient_UpdateTeamScore", "ArshaPvP_Widget_Update")
registerEvent("FromClient_FirstMatchStart", "ArshaPvP_Match_ScoreReset")
registerEvent("FromClient_WaitTimeAlert", "FromClient_WaitTimeAlert")
Panel_Arsha_TeamWidget:RegisterUpdateFunc("ArshaPvP_Widget_PerframeMain")

