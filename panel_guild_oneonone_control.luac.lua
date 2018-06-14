-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\oneonone\panel_guild_oneonone_control.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_OneOnOne_Control = {
_ui = {}
}
local GetGuildWrapper = function(guildNo)
  -- function num : 0_0
  local guildWrapper = nil
  local isAlliance = false
  guildWrapper = ToClient_GetGuildAllianceWrapperbyNo(guildNo)
  if guildWrapper ~= nil then
    isAlliance = true
  else
    guildWrapper = ToClient_GetGuildWrapperByGuildNo(guildNo)
  end
  return isAlliance, guildWrapper
end

local GetTeamKind = function(isAlliance)
  -- function num : 0_1
  if isAlliance == true then
    return PAGetString(Defines.StringSheet_GAME, "LUA_WORD_GUILDALLIANCE")
  else
    return PAGetString(Defines.StringSheet_GAME, "LUA_WORD_GUILD")
  end
end

local TruncateHpRate = function(value)
  -- function num : 0_2
  value = value * 10
  value = (math.floor)(value)
  return value * 0.1
end

FromClient_GuildTeamBattle_End = function(result, isAttackTeamWin, attackGuildNo, defenceGuildNo, attackTeamHpRate, defenceTeamHpRate)
  -- function num : 0_3 , upvalues : GetTeamKind, TruncateHpRate
  local message = {main = "", sub = "", addMsg = ""}
  local attackTeamInfo = ToClient_GetGuildTeamBattleAttackTeam()
  local defenceTeamInfo = ToClient_GetGuildTeamBattleDefenceTeam()
  local strAttackTeamName = attackTeamInfo:getTeamName()
  local strDefenceTeamName = defenceTeamInfo:getTeamName()
  local strAttackTeamKind = GetTeamKind(attackTeamInfo:isAlliance())
  local strDefenceTeamKind = GetTeamKind(defenceTeamInfo:isAlliance())
  local msgType = 95
  if isAttackTeamWin == true then
    message.sub = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ATTACKTEAMWIN_MAIN", "attackTeamName", strAttackTeamName, "attackTeamKind", strAttackTeamKind)
  else
    message.sub = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_DEFENCETEAMWIN_MAIN", "defenceTeamName", strDefenceTeamName, "defenceTeamKind", defenceTeamKind)
  end
  if __eGuildTeamBattleResult_WinNormal == result or __eGuildTeamBattleResult_WinByTimeout == result or __eGuildTeamBattleResult_WinByNoMaster == result or __eGuildTeamBattleResult_Draw == result then
    local winTeamInfo, loseTeamInfo = nil, nil
    if isAttackTeamWin == true then
      winTeamInfo = attackTeamInfo
      loseTeamInfo = defenceTeamInfo
    else
      winTeamInfo = defenceTeamInfo
      loseTeamInfo = attackTeamInfo
    end
    local strWinTeamName = ""
    local strLoseTeamName = ""
    local strWinPlayerName = ""
    local strLosePlayerName = ""
    strWinTeamName = winTeamInfo:getTeamName()
    strWinPlayerName = winTeamInfo:getPlayerName(0)
    strLoseTeamName = loseTeamInfo:getTeamName()
    strLosePlayerName = loseTeamInfo:getPlayerName(0)
    if winTeamInfo:isAlliance() == true and loseTeamInfo:isAlliance() == true then
      message.main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_DEFEATMESSAGE_ALLIANCE_VS_ALLIANCE", "teamName1", strWinTeamName, "playerName1", strWinPlayerName, "teamName2", strLoseTeamName, "playerName2", strLosePlayerName)
    else
      if winTeamInfo:isAlliance() == false and loseTeamInfo:isAlliance() == true then
        message.main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_DEFEATMESSAGE_GUILD_VS_ALLIANCE", "teamName1", strWinTeamName, "playerName1", strWinPlayerName, "teamName2", strLoseTeamName, "playerName2", strLosePlayerName)
      else
        if winTeamInfo:isAlliance() == true and loseTeamInfo:isAlliance() == false then
          message.main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_DEFEATMESSAGE_ALLIANCE_VS_GUILD", "teamName1", strWinTeamName, "playerName1", strWinPlayerName, "teamName2", strLoseTeamName, "playerName2", strLosePlayerName)
        else
          message.main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_DEFEATMESSAGE_GUILD_VS_GUILD", "teamName1", strWinTeamName, "playerName1", strWinPlayerName, "teamName2", strLoseTeamName, "playerName2", strLosePlayerName)
        end
      end
    end
    if ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == true then
      msgType = 99
    else
      msgType = 95
    end
  else
    do
      if __eGuildTeamBattleResult_DefenceTeamNotRespond == result then
        message.main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_NOTMATCHED_SUB_NOTRESPONSE", "attackTeamName", strAttackTeamName, "attackTeamKind", strAttackTeamKind, "defenceTeamName", strDefenceTeamName, "defenceTeamKind", strDefenceTeamKind)
        if ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == true then
          msgType = 98
        else
          msgType = 94
        end
      else
        if __eGuildTeamBattleResult_Rejected == result then
          message.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_NOTMATCHED_SUB_REJECTED")
          if ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == true then
            msgType = 98
          else
            msgType = 94
          end
        else
          return 
        end
      end
      Proc_ShowMessage_Ack_For_RewardSelect(message, 4, msgType, false)
      if __eGuildTeamBattleResult_WinByTimeout == result or __eGuildTeamBattleResult_Draw == result then
        attackTeamHpRate = TruncateHpRate(attackTeamHpRate)
        defenceTeamHpRate = TruncateHpRate(defenceTeamHpRate)
        local msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_END_SUB_TIMEOUTWIN", "attackTeamHpRate", attackTeamHpRate, "defenceTeamHpRate", defenceTeamHpRate)
        if msg ~= "" and msg ~= nil then
          Proc_ShowMessage_Ack(msg)
        end
      end
    end
  end
end

FromClient_GuildTeamBattle_RequestDone = function(attackTeamInfo, defenceTeamInfo)
  -- function num : 0_4
  local strAttackTeamName = attackTeamInfo:getTeamName()
  local strDefenceTeamName = defenceTeamInfo:getTeamName()
  local strAttackPlayerName = attackTeamInfo:getPlayerName(0)
  local strDefencePlayerName = defenceTeamInfo:getPlayerName(0)
  local isAttackAlliance = attackTeamInfo:isAlliance()
  local isDefenceAlliance = defenceTeamInfo:isAlliance()
  local msgMain = ""
  local msgSub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTBATTLE_MAIN")
  if isAttackAlliance == true and isDefenceAlliance == true then
    msgMain = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTED_ALLIANCE_VS_ALLIANCE", "attackTeamName", strAttackTeamName, "attackPlayerName", strAttackPlayerName, "defenceTeamName", strDefenceTeamName)
  else
    if isAttackAlliance == false and isDefenceAlliance == true then
      msgMain = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTED_GUILD_VS_ALLIANCE", "attackTeamName", strAttackTeamName, "attackPlayerName", strAttackPlayerName, "defenceTeamName", strDefenceTeamName)
    else
      if isAttackAlliance == true and isDefenceAlliance == false then
        msgMain = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTED_ALLIANCE_VS_GUILD", "attackTeamName", strAttackTeamName, "attackPlayerName", strAttackPlayerName, "defenceTeamName", strDefenceTeamName)
      else
        msgMain = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTED_GUILD_VS_GUILD", "attackTeamName", strAttackTeamName, "attackPlayerName", strAttackPlayerName, "defenceTeamName", strDefenceTeamName)
      end
    end
  end
  local message = {main = msgMain, sub = msgSub, addMsg = ""}
  local msgType = 96
  if ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == false then
    msgType = 92
  else
    msgType = 96
  end
  Proc_ShowMessage_Ack_For_RewardSelect(message, 5, msgType, false)
end

FromClient_GuildTeamBattle_AcceptDone = function(attackTeamInfo, defenceTeamInfo)
  -- function num : 0_5 , upvalues : GetTeamKind
  local strAttackTeamName = attackTeamInfo:getTeamName()
  local strAttackTeamKind = GetTeamKind(attackTeamInfo:isAlliance())
  local strDefenceTeamName = defenceTeamInfo:getTeamName()
  local strDefenceTeamKind = GetTeamKind(defenceTeamInfo:isAlliance())
  local strDefencePlayerName = defenceTeamInfo:getPlayerName(0)
  local msgMain = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ACCEPTED_SUB", "attackTeamName", strAttackTeamName, "attackTeamKind", strAttackTeamKind, "defenceTeamName", strDefenceTeamName, "defenceTeamKind", strDefenceTeamKind)
  local msgSub = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ACCEPTED", "defenceTeamName", strDefenceTeamName, "defenceTeamKind", strDefenceTeamKind, "defencePlayerName", strDefencePlayerName)
  local message = {main = msgMain, sub = msgSub, addMsg = ""}
  local msgType = 97
  if ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == true then
    msgType = 97
  else
    msgType = 93
  end
  Proc_ShowMessage_Ack_For_RewardSelect(message, 5, msgType, false)
end

local checkHideOrShowPanel = function(state)
  -- function num : 0_6
  if ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == false then
    PaGlobal_Guild_OneOnOneClock:Close()
    return 
  end
  if __eGuildTeamBattleState_Idle == state then
    PaGlobal_Guild_OneOnOneClock:Close()
  else
    if __eGuildTeamBattleState_Preparing == state then
      PaGlobal_Guild_OneOnOneClock:Close()
    else
      if __eGuildTeamBattleState_Requesting == state then
        PaGlobal_Guild_OneOnOneClock:Open()
      else
        if __eGuildTeamBattleState_Accepting == state then
          PaGlobal_Guild_OneOnOneClock:Open()
        else
          if __eGuildTeamBattleState_Teleport == state then
            PaGlobal_Guild_OneOnOneClock:Open()
          else
            if __eGuildTeamBattleState_Fight == state then
              PaGlobal_Guild_OneOnOneClock:Open()
            else
              if __eGuildTeamBattleState_End == state then
                PaGlobal_Guild_OneOnOneClock:Close()
              else
                PaGlobal_Guild_OneOnOneClock:Close()
                return 
              end
            end
          end
        end
      end
    end
  end
end

FromClient_GuildTeamBattle_StateChanged = function(state, param1)
  -- function num : 0_7 , upvalues : checkHideOrShowPanel, GetTeamKind
  checkHideOrShowPanel(state)
  if __eGuildTeamBattleState_Idle == state then
    PaGlobal_Radar_GuildTeamBattleAlert(false)
  else
    if __eGuildTeamBattleState_Preparing == state then
      local territoryKeyRaw = ToClient_GetStartSiegeTerritoryKey()
      local territoryKey = getTerritoryByIndex(territoryKeyRaw)
      local territoryName = getTerritoryNameByKey(territoryKey)
      local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTREQUESTINGSOON_MAIN"), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTREQUESTINGSOON_SUB", "territoryName", territoryName), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 92, false)
      PaGlobal_Radar_GuildTeamBattleAlert(false)
    else
      do
        if __eGuildTeamBattleState_Requesting == state then
          local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTBATTLE_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTREQUESTING_SUB"), addMsg = ""}
          Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 92, false)
          PaGlobal_Radar_GuildTeamBattleAlert(true)
        else
          do
            if __eGuildTeamBattleState_Accepting == state then
              local defenceTeamInfo = ToClient_GetGuildTeamBattleDefenceTeam()
              local strDefenceTeamName = defenceTeamInfo:getTeamName()
              local strDefenceTeamKind = GetTeamKind(defenceTeamInfo:isAlliance())
              local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTACCEPTING_MAIN"), sub = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTACCEPTING_SUB", "defenceTeamName", strDefenceTeamName, "defenceTeamKind", strDefenceTeamKind), addMsg = ""}
              Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93, false)
              PaGlobal_Radar_GuildTeamBattleAlert(true)
            else
              do
                if __eGuildTeamBattleState_Teleport == state then
                  local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ATTENDTELEPORTED_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ATTENDTELEPORTED_SUB"), addMsg = ""}
                  Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93, false)
                  PaGlobal_Radar_GuildTeamBattleAlert(true)
                else
                  do
                    if __eGuildTeamBattleState_Fight == state then
                      local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_FIGHTSTART_MAIN"), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_FIGHTSTART_SUB", "minute", 3), addMsg = ""}
                      Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93, false)
                      PaGlobal_Radar_GuildTeamBattleAlert(true)
                    else
                      do
                        if __eGuildTeamBattleState_End == state then
                          local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_NOTMATCHED_MAIN"), sub = "", addMsg = ""}
                          local stoppedReason = Int64toInt32(param1)
                          if __eGuildTeamBattleStopReason_NoAttend == stoppedReason then
                            message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_NOTMATCHED_SUB_TIMEOUT")
                          else
                            if __eGuildTeamBattleStopReason_InternalError == stoppedReason then
                              message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_NOTMATCHED_SUB_TIMEOUT")
                            else
                              if __eGuildTeamBattleStopReason_DefenceTeamNotRespond == stoppedReason then
                                return 
                              else
                                return 
                              end
                            end
                          end
                          Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 94, false)
                          PaGlobal_Radar_GuildTeamBattleAlert(false)
                        else
                          do
                            PaGlobal_Radar_GuildTeamBattleAlert(false)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_GuildTeamBattle_RegularCheck = function()
  -- function num : 0_8 , upvalues : checkHideOrShowPanel
  local ui = PaGlobal_Guild_OneOnOne_Control._ui
  local state = ToClient_GetGuildTeamBattleState()
  if __eGuildTeamBattleState_Preparing == state then
    if ToClient_IsDoingGuildTeamBattleRingout() == true then
      PaGlobal_Guild_OneOnOneAlert:Show(ToClient_GetRemainTimeGuildTeamBattleState())
    else
      PaGlobal_Guild_OneOnOneAlert:Hide()
    end
  else
    PaGlobal_Guild_OneOnOneAlert:Hide()
  end
  checkHideOrShowPanel(state)
end

FGlobal_GuildTeamBattle_RingoutPlayer = function(isAttackTeam, playerIndex)
  -- function num : 0_9 , upvalues : GetTeamKind
  local teamInfo = nil
  if isAttackTeam == true then
    teamInfo = ToClient_GetGuildTeamBattleAttackTeam()
  else
    teamInfo = ToClient_GetGuildTeamBattleDefenceTeam()
  end
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_PLAYERRINGOUT_MAIN"), sub = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_PLAYERRINGOUT_SUB", "teamName", teamInfo:getTeamName(), "teamKind", GetTeamKind(teamInfo:isAlliance()), "playerName", teamInfo:getPlayerName(playerIndex)), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 4, 93, false)
end

FGlobal_GuildTeamBattle_RingoutAlert = function()
  -- function num : 0_10
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_RINGOUTSELF"))
end

FGlobal_GuildTeamBattle_AttendLogout = function(isAttackTeam, playerIndex)
  -- function num : 0_11 , upvalues : GetTeamKind
  local teamInfo = nil
  if isAttackTeam == true then
    teamInfo = ToClient_GetGuildTeamBattleAttackTeam()
  else
    teamInfo = ToClient_GetGuildTeamBattleDefenceTeam()
  end
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ATTENDANCE_LOGOUT_MAIN"), sub = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ATTENDANCE_LOGOUT_SUB", "teamName", teamInfo:getTeamName(), "teamKind", GetTeamKind(teamInfo:isAlliance()), "playerName", teamInfo:getPlayerName(playerIndex)), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 4, 93, false)
end

FromClient_Guild_OneOnOneControl_Initialize = function()
  -- function num : 0_12
end

registerEvent("FromClient_luaLoadComplete", "FromClient_Guild_OneOnOneControl_Initialize")
registerEvent("FromClient_GuildTeamBattle_End", "FromClient_GuildTeamBattle_End")
registerEvent("FromClient_GuildTeamBattle_RequestDone", "FromClient_GuildTeamBattle_RequestDone")
registerEvent("FromClient_GuildTeamBattle_AcceptDone", "FromClient_GuildTeamBattle_AcceptDone")
registerEvent("FromClient_GuildTeamBattle_StateChanged", "FromClient_GuildTeamBattle_StateChanged")
registerEvent("FromClient_GuildTeamBattle_CheckOpenRequest", "FGlobal_GuildTeamBattle_RegularCheck")
registerEvent("FromClient_UpdateGuildTeamBattle_RingoutPlayer", "FGlobal_GuildTeamBattle_RingoutPlayer")
registerEvent("FromClient_GuildTeamBattle_RingoutAlert", "FGlobal_GuildTeamBattle_RingoutAlert")
registerEvent("FromClient_GuildTeamBattle_AttendLogout", "FGlobal_GuildTeamBattle_AttendLogout")

