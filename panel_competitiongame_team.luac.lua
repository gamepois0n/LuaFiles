-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\competitiongame\panel_competitiongame_team.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local isLocalwarOpen = ToClient_IsContentsGroupOpen("43")
local _txt_LocalWarTime = (UI.getChildControl)(Panel_CompetitionGame_Team, "StaticText_TimeLine")
local _txt_CompetitionGameTeamA = (UI.getChildControl)(Panel_CompetitionGame_Team, "StaticText_TeamBlackDesert")
local _txt_CompetitionGameTeamB = (UI.getChildControl)(Panel_CompetitionGame_Team, "StaticText_TeamRedDesert")
local _txt_TeamA = (UI.getChildControl)(Panel_CompetitionGame_Team, "StaticText_MyTeamBlack")
local _txt_TeamB = (UI.getChildControl)(Panel_CompetitionGame_Team, "StaticText_MyTeamRed")
local _txt_ScoreTeamA = (UI.getChildControl)(Panel_CompetitionGame_Team, "StaticText_RoundScore_Black")
local _txt_ScoreTeamB = (UI.getChildControl)(Panel_CompetitionGame_Team, "StaticText_RoundScore_Red")
local _icon_TeamBlackBuff = (UI.getChildControl)(Panel_CompetitionGame_Team, "Static_BlackTeamBuff")
local _icon_TeamRedBuff = (UI.getChildControl)(Panel_CompetitionGame_Team, "Static_RedTeamBuff")
_icon_TeamBlackBuff:SetShow(false)
_icon_TeamRedBuff:SetShow(false)
local saveAScore = 0
local saveBScore = 0
local teamCheck = false
CompetitionGameTeam_MyTeam_Init = function()
  -- function num : 0_0 , upvalues : _txt_TeamA, _txt_TeamB
  local team = ""
  _txt_TeamA:SetShow(false)
  _txt_TeamB:SetShow(false)
  if ToClient_CompetitionMatchType() == 0 then
    if ToClient_GetMyTeamNo() == 1 then
      _txt_TeamA:SetShow(true)
    else
      if ToClient_GetMyTeamNo() == 2 then
        _txt_TeamB:SetShow(true)
      end
    end
  else
    Panel_CompetitionGame_Team:SetShow(false)
  end
end

CompetitionGameTeam_Show = function()
  -- function num : 0_1
  if ToClient_CompetitionMatchType() == 1 then
    CompetitionGameTeam_Hide()
    return 
  end
  if not Panel_CompetitionGame_Team:GetShow() then
    Panel_CompetitionGame_Team:SetShow(true)
  else
    CompetitionGameTeam_Hide()
    return 
  end
end

CompetitionGameTeam_Hide = function()
  -- function num : 0_2
  if Panel_CompetitionGame_Team:GetShow() then
    Panel_CompetitionGame_Team:GetShow(false)
  end
end

FGlobal_CompetitionGameTeam_Show = function()
  -- function num : 0_3 , upvalues : saveAScore, saveBScore
  if ToClient_GetMyTeamNo() == -2 then
    CompetitionGameTeam_Hide()
    return 
  end
  saveAScore = 0
  saveBScore = 0
  CompetitionGameTeam_Show()
  CompetitionGameTeam_Update()
end

CompetitionGameTeam_Update = function()
  -- function num : 0_4 , upvalues : _txt_ScoreTeamA, _txt_ScoreTeamB, saveAScore, saveBScore, _txt_CompetitionGameTeamA, _txt_CompetitionGameTeamB
  local teamA = 0
  local teamB = 0
  local isTeam = ToClient_GetMyTeamNo()
  _txt_ScoreTeamA:SetShow(true)
  _txt_ScoreTeamB:SetShow(true)
  if ToClient_CompetitionMatchType() == 0 then
    teamA = ToClient_GetRoundTeamScore(1)
    teamB = ToClient_GetRoundTeamScore(2)
  else
    _txt_ScoreTeamA:SetShow(false)
    _txt_ScoreTeamB:SetShow(false)
  end
  if saveAScore < teamA then
    saveAScore = teamA
  end
  if saveBScore < teamB then
    saveBScore = teamB
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
    teamA_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
    teamB_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
  end
  _txt_CompetitionGameTeamA:SetText(teamA_Name)
  _txt_CompetitionGameTeamB:SetText(teamB_Name)
  _txt_ScoreTeamA:SetText(teamA)
  _txt_ScoreTeamB:SetText(teamB)
end

local saveLocalWarTime = 0
local delayTime = 1
local competitionGameDeltaTime = 0
CompetitionGameTeam_TimeUpdate = function(deltaTime)
  -- function num : 0_5 , upvalues : competitionGameDeltaTime, delayTime, saveLocalWarTime, _txt_LocalWarTime
  competitionGameDeltaTime = competitionGameDeltaTime + deltaTime
  if delayTime <= competitionGameDeltaTime then
    local warTime = ToClient_CompetitionMatchTimeLimit() - ToClient_CompetitionMatchTime()
    if saveLocalWarTime > 0 and warTime == 0 then
      _txt_LocalWarTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
    end
    saveLocalWarTime = warTime
    if warTime == 0 then
      if ToClient_GetLocalwarState() == 1 then
        _txt_LocalWarTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
      end
      return 
    end
    local warTimeMinute = (math.floor)(warTime / 60)
    local warTimeSecond = warTime % 60
    if warTimeMinute < 10 then
      warTimeMinute = "0" .. warTimeMinute
    end
    if warTimeSecond < 10 then
      warTimeSecond = "0" .. warTimeSecond
    end
    competitionGameDeltaTime = 0
    _txt_LocalWarTime:SetText(tostring(warTimeMinute) .. " : " .. tostring(warTimeSecond))
  end
end

FromClient_UpdateFightState = function(isFight)
  -- function num : 0_6 , upvalues : _txt_CompetitionGameTeamA, _txt_CompetitionGameTeamB, _txt_ScoreTeamA, _txt_ScoreTeamB
  if isFight == nil or isFight == "" then
    return 
  end
  CompetitionGameTeam_MyTeam_Init()
  if (CppEnums.CompetitionFightState).eCompetitionFightState_Fight == isFight then
    local isShowTeamInfo = true
    if ToClient_CompetitionMatchType() == 1 then
      isShowTeamInfo = false
    end
    _txt_CompetitionGameTeamA:SetShow(isShowTeamInfo)
    _txt_CompetitionGameTeamB:SetShow(isShowTeamInfo)
    _txt_ScoreTeamA:SetShow(isShowTeamInfo)
    _txt_ScoreTeamB:SetShow(isShowTeamInfo)
    Panel_CompetitionGame_Team:SetShow(true)
    local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_START_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_START_SUB"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 56, false)
  else
    do
      if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == isFight then
        Panel_CompetitionGame_Team:SetShow(false)
        local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_STOP_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_FIGHTSTATE_STOP_SUB"), addMsg = ""}
        Proc_ShowMessage_Ack_For_RewardSelect(message, 5, 57, false)
      else
        do
          Panel_CompetitionGame_Team:SetShow(false)
        end
      end
    end
  end
end

CompetitionGameTeam_Repos = function()
  -- function num : 0_7
  Panel_CompetitionGame_Team:SetPosX(getScreenSizeX() / 2 - Panel_CompetitionGame_Team:GetSizeX() / 2)
  Panel_CompetitionGame_Team:SetPosY(0)
end

CompetitionGameTeam_Init = function()
  -- function num : 0_8
  if ToClient_GetMyTeamNo() == -2 then
    CompetitionGameTeam_Hide()
    return 
  end
end


