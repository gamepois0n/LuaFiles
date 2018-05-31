-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\oneonone\panel_guild_oneonone_control.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_OneOnOne_Control = {
_ui = {_panel_remoteRequest = Panel_Guild_OneOnOneRemoteRequest, _requestOpenButton = Panel_Guild_OneOnOneRemoteRequest}
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
  if isAttackTeamWin == true then
    message.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ATTACKTEAMWIN_MAIN")
  else
    message.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_DEFENCETEAMWIN_MAIN")
  end
  local attackTeamInfo = ToClient_GetGuildTeamBattleAttackTeam()
  local defenceTeamInfo = ToClient_GetGuildTeamBattleDefenceTeam()
  local msgType = 95
  if __eGuildTeamBattleResult_WinNormal == result or __eGuildTeamBattleResult_WinByTimeout == result or __eGuildTeamBattleResult_WinByNoMaster == result or __eGuildTeamBattleResult_Draw == result then
    if isAttackTeamWin == true then
      message.sub = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_WINNER_MESSAGE_ATTACK", "playerName1", attackTeamInfo:getPlayerName(0), "playerName2", attackTeamInfo:getPlayerName(1), "teamName", attackTeamInfo:getTeamName(), "teamType", GetTeamKind(attackTeamInfo:isAlliance()))
    else
      message.sub = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_WINNER_MESSAGE_DEFENCE", "playerName1", defenceTeamInfo:getPlayerName(0), "playerName2", defenceTeamInfo:getPlayerName(1), "teamName", defenceTeamInfo:getTeamName(), "teamType", GetTeamKind(defenceTeamInfo:isAlliance()))
    end
  else
    if __eGuildTeamBattleResult_DefenceTeamNotRespond == result then
      message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_NOTMATCHED_SUB_NOTRESPONSE")
      msgType = 94
    else
      if __eGuildTeamBattleResult_Rejected == result then
        message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_NOTMATCHED_SUB_REJECTED")
        msgType = 94
      else
        return 
      end
    end
  end
  Proc_ShowMessage_Ack_For_RewardSelect(message, 4, msgType)
  if __eGuildTeamBattleResult_WinByTimeout == result or __eGuildTeamBattleResult_Draw == result then
    attackTeamHpRate = TruncateHpRate(attackTeamHpRate)
    defenceTeamHpRate = TruncateHpRate(defenceTeamHpRate)
    local msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_END_SUB_TIMEOUTWIN", "attackTeamHpRate", attackTeamHpRate, "defenceTeamHpRate", defenceTeamHpRate)
    if msg ~= "" and msg ~= nil then
      Proc_ShowMessage_Ack(msg)
    end
  end
end

FromClient_GuildTeamBattle_RequestDone = function(attackTeamInfo, defenceTeamInfo)
  -- function num : 0_4 , upvalues : GetTeamKind
  local strAttackTeamName = attackTeamInfo:getTeamName()
  local strAttackTeamKind = GetTeamKind(attackTeamInfo:isAlliance())
  local strDefenceTeamName = defenceTeamInfo:getTeamName()
  local strDefenceTeamKind = GetTeamKind(defenceTeamInfo:isAlliance())
  local msgMain = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTBATTLE_MAIN")
  local msgSub = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTBATTLE_SUB", "attackTeamName", strAttackTeamName, "attackTeamKind", strAttackTeamKind, "defenceTeamName", strDefenceTeamName, "defenceTeamKind", strDefenceTeamKind)
  local message = {main = msgMain, sub = msgSub, addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 92)
end

FromClient_GuildTeamBattle_AcceptDone = function(attackTeamInfo, defenceTeamInfo)
  -- function num : 0_5 , upvalues : GetTeamKind
  local strAttackTeamName = attackTeamInfo:getTeamName()
  local strAttackTeamKind = GetTeamKind(attackTeamInfo:isAlliance())
  local strDefenceTeamName = defenceTeamInfo:getTeamName()
  local strDefenceTeamKind = GetTeamKind(defenceTeamInfo:isAlliance())
  local msgMain = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ACCEPTED_MAIN")
  local msgSub = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ACCEPTED_SUB", "attackTeamName", strAttackTeamName, "attackTeamKind", strAttackTeamKind, "defenceTeamName", strDefenceTeamName, "defenceTeamKind", strDefenceTeamKind)
  local message = {main = msgMain, sub = msgSub, addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93)
end

FromClient_GuildTeamBattle_StateChanged = function(state, param1)
  -- function num : 0_6
  if __eGuildTeamBattleState_Requesting ~= state then
    FGlobal_GuildTeamBattle_CloseRequestPanel()
  end
  if __eGuildTeamBattleState_Accepting ~= state then
    FGlobal_GuildTeamBattle_CloseAcceptPanel()
  end
  if __eGuildTeamBattleState_Requesting ~= state then
    ((PaGlobal_Guild_OneOnOne_Control._ui)._btn_OpenRequestPanel):SetShow(true)
  end
  if __eGuildTeamBattleState_Idle == state then
    return 
  else
    if __eGuildTeamBattleState_Requesting == state then
      local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REQUESTBATTLE_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTREQUESTING_SUB"), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 92)
    else
      do
        if __eGuildTeamBattleState_Accepting == state then
          local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTACCEPTING_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTACCEPTING_SUB"), addMsg = ""}
          Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93)
        else
          do
            if __eGuildTeamBattleState_Teleport == state then
              local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ATTENDTELEPORTED_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ATTENDTELEPORTED_SUB"), addMsg = ""}
              Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93)
            else
              do
                if __eGuildTeamBattleState_Fight == state then
                  local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_FIGHTSTART_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_FIGHTSTART_SUB"), addMsg = ""}
                  Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93)
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
                      Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 94)
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
  -- function num : 0_7
  local ui = PaGlobal_Guild_OneOnOne_Control._ui
  local state = ToClient_GetGuildTeamBattleState()
  if __eGuildTeamBattleState_Requesting == state then
    if ToClient_IsAbleRequestGuildTeamBattle() == true then
      (ui._panel_remoteRequest):SetShow(true)
    else
      ;
      (ui._panel_remoteRequest):SetShow(false)
      if Panel_Guild_OneOnOneRequest:GetShow() == true then
        FGlobal_GuildTeamBattle_CloseRequestPanel()
      end
    end
  else
    ;
    (ui._panel_remoteRequest):SetShow(false)
    if Panel_Guild_OneOnOneRequest:GetShow() == true then
      FGlobal_GuildTeamBattle_CloseRequestPanel()
    end
  end
  -- DECOMPILER ERROR at PC52: Unhandled construct in 'MakeBoolean' P1

  if __eGuildTeamBattleState_Teleport ~= state and __eGuildTeamBattleState_Fight ~= state and PaGlobal_Guild_OneOnOneClock:IsShow() == true then
    PaGlobal_Guild_OneOnOneClock:Close()
  end
  if ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == false then
    PaGlobal_Guild_OneOnOneClock:Close()
  else
    if PaGlobal_Guild_OneOnOneClock:IsShow() == false then
      PaGlobal_Guild_OneOnOneClock:Open()
    end
  end
end

FromClient_Guild_OneOnOneControl_Initialize = function()
  -- function num : 0_8
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  (PaGlobal_Guild_OneOnOne_Control._ui)._btn_OpenRequestPanel = (UI.getChildControl)(Panel_Guild_OneOnOneRemoteRequest, "Button_Open")
  ;
  ((PaGlobal_Guild_OneOnOne_Control._ui)._btn_OpenRequestPanel):addInputEvent("Mouse_LUp", "FGlobal_OpenGuildTeamBattle_RequestPanel_Open()")
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
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 4, 93)
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
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 4, 93)
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

