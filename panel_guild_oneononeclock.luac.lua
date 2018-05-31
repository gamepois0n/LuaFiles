-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\oneonone\panel_guild_oneononeclock.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_OneOnOneClock = {
_ui = {_panel = Panel_Guild_OneOnOneClock, _staticCenter_Bg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Center"), _staticLeftBg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Left"), _staticRightBg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Right"), _staticText_Title = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Center"), _staticText_RingoutAlert = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_RingoutTimeCheck")}
, _lastTerritoryKey = -1, _lastRemainTime = -1, _ringoutTimeAccum = 0}
local GetTeamKind = function(isAlliance)
  -- function num : 0_0
  if isAlliance == true then
    return PAGetString(Defines.StringSheet_GAME, "LUA_WORD_GUILDALLIANCE")
  else
    return PAGetString(Defines.StringSheet_GAME, "LUA_WORD_GUILD")
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.Open = function(self)
  -- function num : 0_1 , upvalues : GetTeamKind
  local ui = self._ui
  if __eGuildTeamBattleState_Teleport == state then
    (ui._staticText_Time):SetText("05:00")
  end
  local attackTeam = ToClient_GetGuildTeamBattleAttackTeam()
  ;
  (ui._staticText_LeftTeamName):SetText(attackTeam:getTeamName() .. " " .. GetTeamKind(attackTeam:isAlliance()))
  local defenceTeam = ToClient_GetGuildTeamBattleDefenceTeam()
  ;
  (ui._staticText_RightTeamName):SetText(defenceTeam:getTeamName() .. " " .. GetTeamKind(defenceTeam:isAlliance()))
  Panel_Guild_OneOnOneClock:SetShow(true)
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.IsShow = function(self)
  -- function num : 0_2
  return Panel_Guild_OneOnOneClock:GetShow()
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.Close = function(self)
  -- function num : 0_3
  Panel_Guild_OneOnOneClock:SetShow(false)
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.UpdateClock = function(self, state, remainSec)
  -- function num : 0_4
  local ui = self._ui
  if remainSec < 0 then
    return 
  end
  if __eGuildTeamBattleState_Fight == state then
    local clockTime = convertSecondsToClockTime(remainSec)
    ;
    (ui._staticText_Time):SetText(clockTime)
    ;
    (ui._staticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_FIGHTING"))
  else
    do
      if __eGuildTeamBattleState_Teleport == state then
        (ui._staticText_Time):SetText("05:00")
        ;
        (ui._staticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_WAITING"))
      else
        self:Close()
      end
    end
  end
end

FromClient_Guild_OneOnOneClock_Initialize = function()
  -- function num : 0_5
  local ui = PaGlobal_Guild_OneOnOneClock._ui
  ui._staticText_Time = (UI.getChildControl)(ui._staticCenter_Bg, "StaticText_Time")
  ui._staticText_LeftTeamName = (UI.getChildControl)(ui._staticLeftBg, "StaticText_LeftCharacterName")
  ui._staticText_RightTeamName = (UI.getChildControl)(ui._staticRightBg, "StaticText_RightCharacterName")
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Guild_OneOnOneClock._lastTerritoryKey = -1
end

FGlobal_UpdateOneOnOneClock_TimeUpdate = function(state, remainSec)
  -- function num : 0_6
  local ui = PaGlobal_Guild_OneOnOneClock._ui
  local self = PaGlobal_Guild_OneOnOneClock
  self:UpdateClock(state, remainSec)
  if __eGuildTeamBattleState_Teleport == state then
    if (ToClient_IsSelfInGuildTeamBattle() == true or ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == true) and remainSec ~= self._lastRemainTime then
      if remainSec > 0 and remainSec % 10 == 0 then
        local msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_WAITING_MAIN", "remainSec", remainSec), sub = "", addMsg = ""}
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 3, false)
      else
        do
          do
            if remainSec > 0 and remainSec <= 5 then
              local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_STARTSOON"), sub = tostring(remainSec), addMsg = ""}
              Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 5, 62, false)
            end
            -- DECOMPILER ERROR at PC67: Confused about usage of register: R4 in 'UnsetPending'

            PaGlobal_Guild_OneOnOneClock._lastRemainTime = remainSec
            -- DECOMPILER ERROR at PC86: Unhandled construct in 'MakeBoolean' P1

            if ToClient_IsDoingGuildTeamBattleRingout() == true and ToClient_IsSelfInGuildTeamBattle() == false then
              (ui._staticText_RingoutAlert):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ILLEGALENTERANCE_MAIN", "remainSec", ToClient_GetGuildTeamBattleRingoutTime()))
              ;
              (ui._staticText_RingoutAlert):SetShow(true)
            end
            ;
            (ui._staticText_RingoutAlert):SetShow(false)
            if __eGuildTeamBattleState_Fight == state then
              if ToClient_IsDoingGuildTeamBattleRingout() == true then
                if ToClient_IsSelfInGuildTeamBattle() == true then
                  (ui._staticText_RingoutAlert):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_RINGOUT_MAIN", "remainSec", ToClient_GetGuildTeamBattleRingoutTime()))
                else
                  ;
                  (ui._staticText_RingoutAlert):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ILLEGALENTERANCE_MAIN", "remainSec", ToClient_GetGuildTeamBattleRingoutTime()))
                end
                ;
                (ui._staticText_RingoutAlert):SetShow(true)
              else
                ;
                (ui._staticText_RingoutAlert):SetShow(false)
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_UpdateOneOnOneClock_OnStateChange = function(state)
  -- function num : 0_7
  if __eGuildTeamBattleState_Teleport == state or __eGuildTeamBattleState_Fight == state then
    PaGlobal_Guild_OneOnOneClock:Open()
  else
    PaGlobal_Guild_OneOnOneClock:Close()
  end
end

FGlobal_UpdateOneOnOneClock_TurnOnOff = function(regionInfo)
  -- function num : 0_8 , upvalues : GetTeamKind
  local state = ToClient_GetGuildTeamBattleState()
  local territoryKey = regionInfo:getTerritoryKeyRaw()
  -- DECOMPILER ERROR at PC20: Unhandled construct in 'MakeBoolean' P1

  if (__eGuildTeamBattleState_Teleport == state or __eGuildTeamBattleState_Fight == state) and PaGlobal_Guild_OneOnOneClock._lastTerritoryKey ~= territoryKey then
    if ToClient_IsSelfPlayerInGuildTeamBattleTerritory() == true then
      local attackTeamInfo = ToClient_GetGuildTeamBattleAttackTeam()
      local defenceTeamInfo = ToClient_GetGuildTeamBattleDefenceTeam()
      local message = {main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_INGMESSAGE_SUB", "attackTeamName", attackTeamInfo:getTeamName(), "attackTeamKind", GetTeamKind(attackTeamInfo:isAlliance()), "defenceTeamName", defenceTeamInfo:getTeamName(), "defenceTeamKind", GetTeamKind(defenceTeamInfo:isAlliance())), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_INGMESSAGE_MAIN", "territoryName", regionInfo:getTerritoryName()), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93)
      PaGlobal_Guild_OneOnOneClock:Open()
    else
      do
        PaGlobal_Guild_OneOnOneClock:Close()
        PaGlobal_Guild_OneOnOneClock:Close()
        -- DECOMPILER ERROR at PC72: Confused about usage of register: R3 in 'UnsetPending'

        PaGlobal_Guild_OneOnOneClock._lastTerritoryKey = territoryKey
      end
    end
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_Guild_OneOnOneClock_Initialize")
registerEvent("FromClient_GuildTeamBattle_RequestDone", "FromClient_GuildTeamBattle_RequestDone_ClosePanel")
registerEvent("FromClient_UpdateGuildTeamBattleTime", "FGlobal_UpdateOneOnOneClock_TimeUpdate")
registerEvent("FromClient_GuildTeamBattle_StateChanged", "FGlobal_UpdateOneOnOneClock_OnStateChange")
registerEvent("selfPlayer_regionChanged", "FGlobal_UpdateOneOnOneClock_TurnOnOff")

