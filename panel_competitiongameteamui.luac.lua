-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\competitiongame\panel_competitiongameteamui.luac 

-- params : ...
-- function num : 0
Panel_CompetitionGame_TeamUi:SetShow(false)
local UI_color = Defines.Color
local teamMemberBg = (UI.getChildControl)(Panel_CompetitionGame_TeamUi, "Static_TeamMemberBg")
local team1 = 0
local team2 = 1
local teamMemberUi = {}
for index = 0, (CppEnums.CompetitionFreeForAll).eFreeForAllTeamLimit - 1 do
  teamMemberUi[index] = {}
end
local teamMember = {_classIcon = (UI.getChildControl)(teamMemberBg, "Static_ClassIcon"), _level = (UI.getChildControl)(teamMemberBg, "StaticText_Level"), _progressBg = (UI.getChildControl)(teamMemberBg, "Static_Hp_ProgressBg"), _hpProgress = (UI.getChildControl)(teamMemberBg, "Static_Hp_Progress"), _name = (UI.getChildControl)(teamMemberBg, "StaticText_CharacterName"), _myBorder = (UI.getChildControl)(teamMemberBg, "Static_MyInfoBorder"), _leftUserCount = (UI.getChildControl)(teamMemberBg, "StaticText_LeftCount")}
local controlTexture = {path = "New_UI_Common_ForLua/Window/Pvp/pvp_etc.dds", 
classIcon = {
[team1] = {
[(CppEnums.ClassType).ClassType_Warrior] = {291, 251, 320, 280}
, 
[(CppEnums.ClassType).ClassType_Ranger] = {355, 251, 384, 280}
, 
[(CppEnums.ClassType).ClassType_Sorcerer] = {3, 251, 32, 280}
, 
[(CppEnums.ClassType).ClassType_Giant] = {227, 251, 256, 280}
, 
[(CppEnums.ClassType).ClassType_Tamer] = {323, 251, 352, 280}
, 
[(CppEnums.ClassType).ClassType_BladeMaster] = {35, 251, 64, 280}
, 
[(CppEnums.ClassType).ClassType_BladeMasterWomen] = {67, 251, 96, 280}
, 
[(CppEnums.ClassType).ClassType_Valkyrie] = {259, 251, 288, 280}
, 
[(CppEnums.ClassType).ClassType_NinjaWomen] = {131, 251, 160, 280}
, 
[(CppEnums.ClassType).ClassType_NinjaMan] = {99, 251, 128, 280}
, 
[(CppEnums.ClassType).ClassType_Wizard] = {195, 251, 224, 280}
, 
[(CppEnums.ClassType).ClassType_WizardWomen] = {163, 251, 192, 280}
, 
[(CppEnums.ClassType).ClassType_DarkElf] = {387, 251, 416, 280}
}
, 
[team2] = {
[(CppEnums.ClassType).ClassType_Warrior] = {291, 219, 320, 248}
, 
[(CppEnums.ClassType).ClassType_Ranger] = {355, 219, 384, 248}
, 
[(CppEnums.ClassType).ClassType_Sorcerer] = {3, 219, 32, 248}
, 
[(CppEnums.ClassType).ClassType_Giant] = {227, 219, 256, 248}
, 
[(CppEnums.ClassType).ClassType_Tamer] = {323, 219, 352, 248}
, 
[(CppEnums.ClassType).ClassType_BladeMaster] = {35, 219, 64, 248}
, 
[(CppEnums.ClassType).ClassType_BladeMasterWomen] = {67, 219, 96, 248}
, 
[(CppEnums.ClassType).ClassType_Valkyrie] = {259, 219, 288, 248}
, 
[(CppEnums.ClassType).ClassType_NinjaWomen] = {131, 219, 160, 248}
, 
[(CppEnums.ClassType).ClassType_NinjaMan] = {99, 219, 128, 248}
, 
[(CppEnums.ClassType).ClassType_Wizard] = {195, 219, 224, 248}
, 
[(CppEnums.ClassType).ClassType_WizardWomen] = {163, 219, 192, 248}
, 
[(CppEnums.ClassType).ClassType_DarkElf] = {387, 219, 416, 248}
}
}
, 
teamBg = {
[team1] = {1, 87, 187, 126}
, 
[team2] = {1, 46, 187, 85}
}
, 
border = {
[team1] = {117, 1, 156, 40}
, 
[team2] = {158, 1, 197, 40}
}
, 
progress = {
[team1] = {33, 29, 41, 36}
, 
[team2] = {46, 29, 54, 36}
}
, 
progressBg = {
[team1] = {78, 26, 94, 41}
, 
[team2] = {96, 26, 112, 41}
}
}
CompetitionGame_TeamUi_Create = function()
  -- function num : 0_0
  if ToClient_CompetitionMatchType() == 0 then
    CompetitionGame_TeamUi_Round()
  else
    CompetitionGame_TeamUi_FreeForAll()
  end
end

CompetitionGame_FreeForAllSlotReset = function()
  -- function num : 0_1
  for i = 0, (CppEnums.CompetitionFreeForAll).eFreeForAllTeamLimit - 1 do
    CompetitionGame_StatSlotSetShow(0, i, false)
  end
end

CompetitionGame_StatSlotSetShow = function(teamIndex, userIndex, isVisible)
  -- function num : 0_2 , upvalues : teamMemberUi
  if (teamMemberUi[teamIndex])[userIndex] ~= nil then
    (((teamMemberUi[teamIndex])[userIndex])._teamBg):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._border):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._classIcon):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._level):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._progress):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._progressBg):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._name):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._leftUserCount):SetShow(isVisible)
  end
end

CompetitionGame_TeamUi_Round = function()
  -- function num : 0_3 , upvalues : teamMember, teamMemberBg, teamMemberUi, controlTexture
  _PA_LOG("LUA_COMPETITION", "CompetitionGame_TeamUi_Round() 호출")
  local playerWrapper = getSelfPlayer()
  local myTeamNo = playerWrapper:getCompetitionTeamNo()
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  ;
  (teamMember._myBorder):SetShow(true)
  ;
  (teamMember._classIcon):SetShow(true)
  ;
  (teamMember._level):SetShow(true)
  ;
  (teamMember._hpProgress):SetShow(true)
  teamMemberBg:SetShow(true)
  ;
  (teamMember._progressBg):SetShow(true)
  ;
  (teamMember._name):SetShow(true)
  ;
  (teamMember._leftUserCount):SetShow(true)
  CompetitionGameTeamUI_StatSlotClose_Round()
  for Index = 0, teamCount - 1 do
    local teamInfo = ToClient_GetTeamListAt(Index)
    local teamNo = teamInfo:getTeamNo()
    local teamUserCount = ToClient_GetTeamUserInfoCount(teamNo)
    local textureIndex = 0
    if myTeamNo == teamNo then
      textureIndex = 1
    end
    for userIndex = 0, teamUserCount - 1 do
      if (teamMemberUi[teamNo - 1])[userIndex] == nil then
        local temp = {}
        temp._teamBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CompetitionGame_TeamUi, "CompetitionGame_TeamBg_" .. Index .. "_" .. userIndex)
        CopyBaseProperty(teamMemberBg, temp._teamBg)
        ;
        (temp._teamBg):SetPosY((teamMemberBg:GetSizeY() + 5) * userIndex)
        ;
        (temp._teamBg):SetPosX((teamMemberBg:GetSizeX() + 5) * Index)
        ;
        (temp._teamBg):ChangeTextureInfoName(controlTexture.path)
        local x1, y1, x2, y2 = setTextureUV_Func(temp._teamBg, ((controlTexture.teamBg)[textureIndex])[1], ((controlTexture.teamBg)[textureIndex])[2], ((controlTexture.teamBg)[textureIndex])[3], ((controlTexture.teamBg)[textureIndex])[4])
        ;
        ((temp._teamBg):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (temp._teamBg):setRenderTexture((temp._teamBg):getBaseTexture())
        temp._classIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassIcon_" .. Index .. "_" .. userIndex)
        CopyBaseProperty(teamMember._classIcon, temp._classIcon)
        temp._level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_TeamClassLevel_" .. Index .. "_" .. userIndex)
        CopyBaseProperty(teamMember._level, temp._level)
        temp._progressBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassProgressBg_" .. Index .. "_" .. userIndex)
        CopyBaseProperty(teamMember._progressBg, temp._progressBg)
        ;
        (temp._progressBg):ChangeTextureInfoName(controlTexture.path)
        local x1, y1, x2, y2 = setTextureUV_Func(temp._progressBg, ((controlTexture.progressBg)[textureIndex])[1], ((controlTexture.progressBg)[textureIndex])[2], ((controlTexture.progressBg)[textureIndex])[3], ((controlTexture.progressBg)[textureIndex])[4])
        ;
        ((temp._progressBg):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (temp._progressBg):setRenderTexture((temp._progressBg):getBaseTexture())
        temp._progress = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, temp._teamBg, "CompetitionGame_TeamClassProgress_" .. Index .. "_" .. userIndex)
        CopyBaseProperty(teamMember._hpProgress, temp._progress)
        ;
        (temp._progress):ChangeTextureInfoName(controlTexture.path)
        local x1, y1, x2, y2 = setTextureUV_Func(temp._progress, ((controlTexture.progress)[textureIndex])[1], ((controlTexture.progress)[textureIndex])[2], ((controlTexture.progress)[textureIndex])[3], ((controlTexture.progress)[textureIndex])[4])
        ;
        ((temp._progress):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (temp._progress):setRenderTexture((temp._progress):getBaseTexture())
        temp._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_TeamClassName_" .. Index .. "_" .. userIndex)
        CopyBaseProperty(teamMember._name, temp._name)
        temp._leftUserCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_LeftUserCount_" .. Index .. "_" .. userIndex)
        CopyBaseProperty(teamMember._leftUserCount, temp._leftUserCount)
        temp._border = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassBorder_" .. Index .. "_" .. userIndex)
        CopyBaseProperty(teamMember._myBorder, temp._border)
        ;
        (temp._border):ChangeTextureInfoName(controlTexture.path)
        local x1, y1, x2, y2 = setTextureUV_Func(temp._border, ((controlTexture.border)[textureIndex])[1], ((controlTexture.border)[textureIndex])[2], ((controlTexture.border)[textureIndex])[3], ((controlTexture.border)[textureIndex])[4])
        ;
        ((temp._border):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (temp._border):setRenderTexture((temp._border):getBaseTexture())
        -- DECOMPILER ERROR at PC396: Confused about usage of register: R32 in 'UnsetPending'

        ;
        (teamMemberUi[teamNo - 1])[userIndex] = temp
      else
        do
          do
            ;
            (((teamMemberUi[teamNo - 1])[userIndex])._teamBg):SetPosY((teamMemberBg:GetSizeY() + 5) * userIndex)
            ;
            (((teamMemberUi[teamNo - 1])[userIndex])._teamBg):SetPosX((teamMemberBg:GetSizeX() + 5) * Index)
            CompetitionGame_StatSlotSetShow(teamNo - 1, userIndex, true)
            -- DECOMPILER ERROR at PC427: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC427: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC427: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    CompetitionGame_TeamUI_Setting(teamNo, teamUserCount)
  end
  ;
  (teamMember._myBorder):SetShow(false)
  ;
  (teamMember._classIcon):SetShow(false)
  ;
  (teamMember._level):SetShow(false)
  ;
  (teamMember._hpProgress):SetShow(false)
  teamMemberBg:SetShow(false)
  ;
  (teamMember._progressBg):SetShow(false)
  ;
  (teamMember._name):SetShow(false)
  ;
  (teamMember._leftUserCount):SetShow(false)
  CompetitionGameTeamUI_Open()
end

CompetitionGame_TeamUi_FreeForAll = function()
  -- function num : 0_4 , upvalues : teamMember, teamMemberBg, teamMemberUi, controlTexture
  _PA_LOG("LUA_COMPETITION", "CompetitionGame_TeamUi_FreeForAll() 호출")
  local playerWrapper = getSelfPlayer()
  local myTeamNo = playerWrapper:getCompetitionTeamNo()
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  ;
  (teamMember._myBorder):SetShow(true)
  ;
  (teamMember._classIcon):SetShow(true)
  ;
  (teamMember._level):SetShow(true)
  ;
  (teamMember._hpProgress):SetShow(true)
  teamMemberBg:SetShow(true)
  ;
  (teamMember._progressBg):SetShow(true)
  ;
  (teamMember._name):SetShow(true)
  ;
  (teamMember._leftUserCount):SetShow(true)
  CompetitionGame_FreeForAllSlotReset()
  for teamIndex = 0, teamCount - 1 do
    local teamInfo = ToClient_GetTeamListAt(teamIndex)
    local teamNo = teamInfo:getTeamNo()
    local textureIndex = 0
    if myTeamNo == teamNo then
      textureIndex = 1
    end
    if (teamMemberUi[0])[teamNo - 1] == nil then
      local temp = {}
      temp._teamBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CompetitionGame_TeamUi, "CompetitionGame_TeamBg_" .. teamIndex)
      CopyBaseProperty(teamMemberBg, temp._teamBg)
      ;
      (temp._teamBg):SetPosY((teamMemberBg:GetSizeY() + 5) * teamIndex)
      ;
      (temp._teamBg):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(temp._teamBg, ((controlTexture.teamBg)[textureIndex])[1], ((controlTexture.teamBg)[textureIndex])[2], ((controlTexture.teamBg)[textureIndex])[3], ((controlTexture.teamBg)[textureIndex])[4])
      ;
      ((temp._teamBg):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (temp._teamBg):setRenderTexture((temp._teamBg):getBaseTexture())
      temp._classIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassIcon_" .. teamIndex)
      CopyBaseProperty(teamMember._classIcon, temp._classIcon)
      temp._level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_TeamClassLevel_" .. teamIndex)
      CopyBaseProperty(teamMember._level, temp._level)
      temp._progressBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassProgressBg_" .. teamIndex)
      CopyBaseProperty(teamMember._progressBg, temp._progressBg)
      ;
      (temp._progressBg):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(temp._progressBg, ((controlTexture.progressBg)[textureIndex])[1], ((controlTexture.progressBg)[textureIndex])[2], ((controlTexture.progressBg)[textureIndex])[3], ((controlTexture.progressBg)[textureIndex])[4])
      ;
      ((temp._progressBg):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (temp._progressBg):setRenderTexture((temp._progressBg):getBaseTexture())
      temp._progress = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, temp._teamBg, "CompetitionGame_TeamClassProgress_" .. teamIndex)
      CopyBaseProperty(teamMember._hpProgress, temp._progress)
      ;
      (temp._progress):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(temp._progress, ((controlTexture.progress)[textureIndex])[1], ((controlTexture.progress)[textureIndex])[2], ((controlTexture.progress)[textureIndex])[3], ((controlTexture.progress)[textureIndex])[4])
      ;
      ((temp._progress):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (temp._progress):setRenderTexture((temp._progress):getBaseTexture())
      temp._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_TeamClassName_" .. teamIndex)
      CopyBaseProperty(teamMember._name, temp._name)
      temp._leftUserCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_LeftUserCount_" .. teamIndex)
      CopyBaseProperty(teamMember._leftUserCount, temp._leftUserCount)
      temp._border = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassBorder_" .. teamIndex)
      CopyBaseProperty(teamMember._myBorder, temp._border)
      ;
      (temp._border):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(temp._border, ((controlTexture.border)[textureIndex])[1], ((controlTexture.border)[textureIndex])[2], ((controlTexture.border)[textureIndex])[3], ((controlTexture.border)[textureIndex])[4])
      ;
      ((temp._border):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (temp._border):setRenderTexture((temp._border):getBaseTexture())
      -- DECOMPILER ERROR at PC365: Confused about usage of register: R27 in 'UnsetPending'

      ;
      (teamMemberUi[0])[teamNo - 1] = temp
    else
      do
        do
          ;
          (((teamMemberUi[0])[teamNo - 1])._teamBg):SetPosY((teamMemberBg:GetSizeY() + 5) * teamIndex)
          CompetitionGame_StatSlotSetShow(0, teamNo - 1, true)
          CompetitionGame_TeamUI_Setting(teamNo, 0)
          -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (teamMember._myBorder):SetShow(false)
  ;
  (teamMember._classIcon):SetShow(false)
  ;
  (teamMember._level):SetShow(false)
  ;
  (teamMember._hpProgress):SetShow(false)
  teamMemberBg:SetShow(false)
  ;
  (teamMember._progressBg):SetShow(false)
  ;
  (teamMember._name):SetShow(false)
  ;
  (teamMember._leftUserCount):SetShow(false)
  CompetitionGameTeamUI_Open()
end

CompetitionGame_TeamUI_Setting = function(teamNo, userCount)
  -- function num : 0_5
  if ToClient_CompetitionMatchType() == 0 then
    CompetitionGame_TeamUI_Setting_Round(teamNo, userCount)
  else
    CompetitionGame_TeamUI_Setting_FreeForAll(teamNo)
  end
end

CompetitionGame_TeamUI_Setting_Round = function(teamNo, userCount)
  -- function num : 0_6 , upvalues : teamMemberUi, controlTexture, UI_color
  _PA_LOG("LUA_COMPETITION", "CompetitionGame_TeamUI_Setting_Round() 호출")
  local myTeamNo = (getSelfPlayer()):getCompetitionTeamNo()
  local myUserNo = ((getSelfPlayer()):get()):getUserNo()
  local teamIndex = teamNo - 1
  local textureIndex = 0
  if myTeamNo == teamNo then
    textureIndex = 1
  end
  local hpPercent = 0
  for index = 0, userCount - 1 do
    local userSlot = (teamMemberUi[teamIndex])[index]
    local userInfo = ToClient_GetTeamUserInfoAt(teamNo, index)
    if userInfo ~= nil and userSlot ~= nil then
      local classType = userInfo:getCharacterClass()
      ;
      (userSlot._classIcon):SetShow(true)
      ;
      (userSlot._classIcon):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(userSlot._classIcon, (((controlTexture.classIcon)[textureIndex])[classType])[1], (((controlTexture.classIcon)[textureIndex])[classType])[2], (((controlTexture.classIcon)[textureIndex])[classType])[3], (((controlTexture.classIcon)[textureIndex])[classType])[4])
      ;
      ((userSlot._classIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (userSlot._classIcon):setRenderTexture((userSlot._classIcon):getBaseTexture())
      hpPercent = userInfo:getHP() / userInfo:getMaxHP() * 100
      _PA_LOG("LUA_COMPETITION", "Name : " .. userInfo:getCharacterName())
      ;
      (userSlot._level):SetShow(true)
      ;
      (userSlot._level):SetText(userInfo:getCharacterLevel())
      ;
      (userSlot._progress):SetProgressRate(0)
      ;
      (userSlot._name):SetText(userInfo:getCharacterName())
      ;
      (userSlot._name):SetFontColor(UI_color.C_FFEFEFEF)
      ;
      (userSlot._leftUserCount):SetShow(false)
      if userInfo:getUserNo() == myUserNo then
        (userSlot._border):SetShow(true)
      else
        ;
        (userSlot._border):SetShow(false)
      end
    end
  end
end

CompetitionGame_TeamUI_Setting_FreeForAll = function(teamNo)
  -- function num : 0_7 , upvalues : teamMemberUi, UI_color
  _PA_LOG("LUA_COMPETITION", "CompetitionGame_TeamUI_Setting_FreeForAll() 호출")
  local myTeamNo = (getSelfPlayer()):getCompetitionTeamNo()
  local myUserNo = ((getSelfPlayer()):get()):getUserNo()
  local teamIndex = teamNo - 1
  local textureIndex = 0
  if myTeamNo == teamNo then
    textureIndex = 1
  end
  local hpPercent = 0
  local userSlot = (teamMemberUi[0])[teamIndex]
  local leaderInfo = ToClient_GetTeamLeaderInfo(teamNo)
  if leaderInfo ~= nil and userSlot ~= nil then
    local classType = leaderInfo:getCharacterClass()
    ;
    (userSlot._classIcon):SetShow(false)
    hpPercent = leaderInfo:getHP() / leaderInfo:getMaxHP() * 100
    ;
    (userSlot._progress):SetProgressRate(0)
    ;
    (userSlot._name):SetText("Team. " .. leaderInfo:getCharacterName())
    ;
    (userSlot._name):SetFontColor(UI_color.C_FFEFEFEF)
    ;
    (userSlot._level):SetShow(false)
    ;
    (userSlot._leftUserCount):SetShow(true)
    if leaderInfo:getUserNo() == myUserNo then
      (userSlot._border):SetShow(true)
    else
      ;
      (userSlot._border):SetShow(false)
    end
  end
end

FromClient_UpdateUserHP = function()
  -- function num : 0_8
  if ToClient_CompetitionMatchType() == 0 then
    FromClient_UpdateUserHP_Round()
  else
    FromClient_UpdateUserHP_FreeForAll()
  end
end

FromClient_UpdateUserHP_Round = function()
  -- function num : 0_9 , upvalues : teamMemberUi, UI_color
  local hpPercent = 0
  local teamUserCount = 0
  local teamIndex = 0
  local teamNo = 0
  local teamInfo = nil
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  for Index = 0, teamCount - 1 do
    teamInfo = ToClient_GetTeamListAt(Index)
    teamNo = teamInfo:getTeamNo()
    teamUserCount = ToClient_GetTeamUserInfoCount(teamNo)
    teamIndex = teamNo - 1
    local beforeTeamCnt = #teamMemberUi[teamIndex] + 1
    _PA_LOG("허관", "teamNo : " .. tostring(teamNo) .. " UserCount : " .. tostring(teamUserCount) .. " ArrCount : " .. tostring(beforeTeamCnt))
    if teamUserCount ~= beforeTeamCnt then
      CompetitionGame_TeamUi_Create()
    end
    for userIndex = 0, teamUserCount - 1 do
      _PA_LOG("LUA_COMPETITION", "teamIndex : " .. tostring(Index) .. " || teamCount : " .. tostring(teamUserCount) .. "|| Index : " .. tostring(userIndex))
      local userSlot = (teamMemberUi[teamIndex])[userIndex]
      local userInfo = ToClient_GetTeamUserInfoAt(teamNo, userIndex)
      if userSlot == nil then
        CompetitionGame_TeamUi_Create()
      end
      if userInfo ~= nil and userSlot ~= nil then
        hpPercent = userInfo:getHP() / userInfo:getMaxHP() * 100
        ;
        (userSlot._progress):SetProgressRate(hpPercent)
        if hpPercent <= 0 then
          (userSlot._name):SetFontColor(UI_color.C_FFC4BEBE)
        end
      end
    end
  end
end

FromClient_UpdateUserHP_FreeForAll = function()
  -- function num : 0_10 , upvalues : teamMemberUi, UI_color
  local hpPercent = 0
  local teamNo = 0
  local teamIndex = 0
  local teamInfo = nil
  local totalUserCount = 0
  local deadUserCount = 0
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  for Index = 0, teamCount - 1 do
    teamInfo = ToClient_GetTeamListAt(Index)
    teamNo = teamInfo:getTeamNo()
    hpPercent = ToClient_GetTeamTotalHpPercent(teamNo)
    teamIndex = teamNo - 1
    totalUserCount = ToClient_GetTeamUserInfoCount(teamNo)
    deadUserCount = ToClient_GetTeamDeadUserCount(teamNo)
    local userSlot = (teamMemberUi[0])[teamIndex]
    if userSlot == nil then
      CompetitionGame_TeamUi_Create()
    end
    if userSlot ~= nil then
      (userSlot._progress):SetProgressRate(hpPercent)
      if hpPercent <= 0 then
        (userSlot._name):SetFontColor(UI_color.C_FFC4BEBE)
      end
      ;
      (userSlot._leftUserCount):SetText(tostring(totalUserCount - deadUserCount))
      if totalUserCount - deadUserCount <= 1 then
        (userSlot._leftUserCount):SetFontColor(UI_color.C_FFFF0000)
      else
        ;
        (userSlot._leftUserCount):SetFontColor(UI_color.C_FFFFFFFF)
      end
    end
  end
end

CompetitionGameTeamUI_StatSlotClose_Round = function()
  -- function num : 0_11 , upvalues : teamMemberUi
  local teamUserCount = 0
  local teamIndex = 0
  local teamNo = 0
  local teamInfo = nil
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  local beforeTeamCnt = 0
  for Index = 0, teamCount - 1 do
    teamInfo = ToClient_GetTeamListAt(Index)
    teamNo = teamInfo:getTeamNo()
    teamUserCount = ToClient_GetTeamUserInfoCount(teamNo)
    teamIndex = teamNo - 1
    beforeTeamCnt = #teamMemberUi[teamIndex] + 1
    _PA_LOG("허관", "teamNo : " .. tostring(teamNo) .. " UserCount : " .. tostring(teamUserCount))
    for userIndex = 0, beforeTeamCnt - 1 do
      CompetitionGame_StatSlotSetShow(teamIndex, userIndex, false)
    end
  end
end

CompetitionGameTeamUI_StatSlotClose_FreeForAll = function()
  -- function num : 0_12
  local teamNo = 0
  local teamIndex = 0
  local teamInfo = nil
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  for Index = 0, teamCount - 1 do
    teamInfo = ToClient_GetTeamListAt(Index)
    teamNo = teamInfo:getTeamNo()
    teamIndex = teamNo - 1
    CompetitionGame_StatSlotSetShow(0, teamIndex, false)
  end
end

CompetitionGameTeamUI_Open = function()
  -- function num : 0_13
  Panel_CompetitionGame_TeamUi:SetShow(true)
  local selfActorKeyRaw = (getSelfPlayer()):getActorKey()
  if (getSelfPlayer()):isPartyMemberActorKey(selfActorKeyRaw) == true then
    Panel_Party:SetShow(false)
  end
end

CompetitionGameTeamUI_Close = function()
  -- function num : 0_14
  Panel_CompetitionGame_TeamUi:SetShow(false)
  local selfActorKeyRaw = (getSelfPlayer()):getActorKey()
  if (getSelfPlayer()):isPartyMemberActorKey(selfActorKeyRaw) == true then
    Panel_Party:SetShow(true)
  end
  if ToClient_CompetitionMatchType() == 0 then
    CompetitionGameTeamUI_StatSlotClose_Round()
  else
    CompetitionGameTeamUI_StatSlotClose_FreeForAll()
  end
end

registerEvent("FromClient_UpdateUserHP", "FromClient_UpdateUserHP")

