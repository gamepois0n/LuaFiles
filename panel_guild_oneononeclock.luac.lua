-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\oneonone\panel_guild_oneononeclock.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_OneOnOneClock = {
_ui = {_panel = Panel_Guild_OneOnOneClock, _staticCenter_Bg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Center"), _staticLeftBg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Left"), _staticRightBg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Right")}
, _lastTerritoryKey = -1}
local GetTeamKind = function(isAlliance)
  -- function num : 0_0
  if isAlliance == true then
    return PAGetString(Defines.StringSheet_GAME, "LUA_WORD_GUILDALLIANCE")
  else
    return PAGetString(Defines.StringSheet_GAME, "LUA_WORD_GUILD")
  end
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.Open = function(self)
  -- function num : 0_1 , upvalues : GetTeamKind
  if ToClient_IsGuildTeamBattleInfoSet() == false then
    Panel_Guild_OneOnOneClock:SetShow(false)
    return 
  end
  Panel_Guild_OneOnOneClock:SetShow(true)
  local ui = self._ui
  local attackTeam = ToClient_GetGuildTeamBattleAttackTeam()
  ;
  (ui._staticText_LeftTeamName):SetText(attackTeam:getTeamName() .. " " .. GetTeamKind(attackTeam:isAlliance()))
  local defenceTeam = ToClient_GetGuildTeamBattleDefenceTeam()
  ;
  (ui._staticText_RightTeamName):SetText(defenceTeam:getTeamName() .. " " .. GetTeamKind(defenceTeam:isAlliance()))
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.IsShow = function(self)
  -- function num : 0_2
  return Panel_Guild_OneOnOneClock:GetShow()
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.Close = function(self)
  -- function num : 0_3
  Panel_Guild_OneOnOneClock:SetShow(false)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.UpdateClock = function(self, state, remainSec)
  -- function num : 0_4
  local ui = self._ui
  if remainSec < 0 then
    return 
  end
  local state = ToClient_GetGuildTeamBattleState()
  if state == 4 then
    if self:IsShow() == false then
      self:Open()
    end
    local clockTime = convertSecondsToClockTime(remainSec)
    ;
    (ui._staticText_Time):SetText(clockTime)
  else
    do
      if state == 3 then
        if self:IsShow() == false then
          self:Open()
        end
        ;
        (ui._staticText_Time):SetText("05:00")
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
  PaGlobal_Guild_OneOnOneClock:UpdateClock(state, remainSec)
end

FGlobal_UpdateOneOnOneClock_OnStateChange = function(state)
  -- function num : 0_7
  if state ~= 4 and state ~= 5 then
    PaGlobal_Guild_OneOnOneClock:Close()
  end
end

FGlobal_UpdateOneOnOneClock_TurnOnOff = function(regionInfo)
  -- function num : 0_8 , upvalues : GetTeamKind
  local state = ToClient_GetGuildTeamBattleState()
  local territoryKey = regionInfo:getTerritoryKeyRaw()
  -- DECOMPILER ERROR at PC18: Unhandled construct in 'MakeBoolean' P1

  if (state == 4 or state == 5) and PaGlobal_Guild_OneOnOneClock._lastTerritoryKey ~= territoryKey then
    if ToClient_GetStartSiegeTerritoryKey() == territoryKey then
      local attackTeamInfo = ToClient_GetGuildTeamBattleAttackTeam()
      local defenceTeamInfo = ToClient_GetGuildTeamBattleDefenceTeam()
      local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_INGMESSAGE_MAIN"), sub = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_INGMESSAGE_SUB", "territoryName", regionInfo:getTerritoryName(), "attackTeamName", attackTeamInfo:getTeamName(), "attackTeamKind", GetTeamKind(attackTeamInfo:isAlliance()), "defenceTeamName", defenceTeamInfo:getTeamName(), "defenceTeamKind", GetTeamKind(defenceTeamInfo:isAlliance())), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(message, 4, 93)
      PaGlobal_Guild_OneOnOneClock:Open()
      -- DECOMPILER ERROR at PC62: Confused about usage of register: R6 in 'UnsetPending'

      PaGlobal_Guild_OneOnOneClock._lastTerritoryKey = territoryKey
    else
      do
        PaGlobal_Guild_OneOnOneClock:Close()
        -- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

        PaGlobal_Guild_OneOnOneClock._lastTerritoryKey = -1
        PaGlobal_Guild_OneOnOneClock:Close()
        -- DECOMPILER ERROR at PC74: Confused about usage of register: R3 in 'UnsetPending'

        PaGlobal_Guild_OneOnOneClock._lastTerritoryKey = -1
      end
    end
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_Guild_OneOnOneClock_Initialize")
registerEvent("FromClient_OpenGuildTeamBattle_RequestPanel", "PaGlobal_Guild_OneOnOne_Clock:Open()")
registerEvent("FromClient_GuildTeamBattle_RequestDone", "FromClient_GuildTeamBattle_RequestDone_ClosePanel")
registerEvent("FromClient_UpdateGuildTeamBattleTime", "FGlobal_UpdateOneOnOneClock_TimeUpdate")
registerEvent("FromClient_GuildTeamBattle_StateChanged", "FGlobal_UpdateOneOnOneClock_OnStateChange")
registerEvent("selfPlayer_regionChanged", "FGlobal_UpdateOneOnOneClock_TurnOnOff")

