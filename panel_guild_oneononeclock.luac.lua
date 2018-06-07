-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\oneonone\panel_guild_oneononeclock.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_OneOnOneClock = {
_ui = {_panel = Panel_Guild_OneOnOneClock, _staticCenter_Bg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Center"), _staticText_AttackTeamName = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Left"), _staticText_DefenceTeamName = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Right"), _staticText_Title = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_Center"), _staticText_AlertMessageBg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_AlertMessageBg"), _staticText_NoticeMessageBg = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_NoticeMessageBg"), _staticText_AttackPlayerName = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_LeftCharacterName"), _staticText_DefencePlayerName = (UI.getChildControl)(Panel_Guild_OneOnOneClock, "StaticText_RightCharacterName")}
, _lastTerritoryKey = -1, _lastRemainTime = -1, _ringoutTimeAccum = 0}
local GetTeamKind = function(isAlliance)
  -- function num : 0_0
  if isAlliance == true then
    return PAGetString(Defines.StringSheet_GAME, "LUA_WORD_GUILDALLIANCE")
  else
    return PAGetString(Defines.StringSheet_GAME, "LUA_WORD_GUILD")
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.Open = function(self)
  -- function num : 0_1
  local ui = self._ui
  local state = ToClient_GetGuildTeamBattleState()
  if __eGuildTeamBattleState_Teleport == state then
    (ui._staticText_Time):SetText("05:00")
  end
  self:UpdateData()
  Panel_Guild_OneOnOneClock:SetShow(true)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.UpdateData = function(self)
  -- function num : 0_2 , upvalues : GetTeamKind
  local ui = self._ui
  local attackTeam = ToClient_GetGuildTeamBattleAttackTeam()
  ;
  (ui._staticText_AttackTeamName):SetText(attackTeam:getTeamName() .. " " .. GetTeamKind(attackTeam:isAlliance()))
  local defenceTeam = ToClient_GetGuildTeamBattleDefenceTeam()
  ;
  (ui._staticText_DefenceTeamName):SetText(defenceTeam:getTeamName() .. " " .. GetTeamKind(defenceTeam:isAlliance()))
  if attackTeam:isDefined() == true then
    (ui._staticText_AttackPlayerName):SetText(attackTeam:getPlayerName(0))
    ;
    (ui._staticText_AttackTeamName):SetShow(true)
    ;
    (ui._staticText_DefenceTeamName):SetShow(true)
  else
    ;
    (ui._staticText_AttackPlayerName):SetText("-")
    ;
    (ui._staticText_AttackTeamName):SetShow(false)
    ;
    (ui._staticText_DefenceTeamName):SetShow(false)
  end
  if defenceTeam:isDefined() == true then
    (ui._staticText_DefencePlayerName):SetText(defenceTeam:getPlayerName(0))
  else
    ;
    (ui._staticText_DefencePlayerName):SetText("-")
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.IsShow = function(self)
  -- function num : 0_3
  return Panel_Guild_OneOnOneClock:GetShow()
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.Close = function(self)
  -- function num : 0_4
  Panel_Guild_OneOnOneClock:SetShow(false)
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Guild_OneOnOneClock.UpdateClock = function(self, state, remainSec)
  -- function num : 0_5
  local ui = self._ui
  local clockTime = convertSecondsToClockTime(remainSec)
  if __eGuildTeamBattleState_Requesting == state then
    (ui._staticText_Time):SetText(clockTime)
    local attackTeam = ToClient_GetGuildTeamBattleAttackTeam()
    if attackTeam:isDefined() == false then
      (ui._staticText_Title):SetText("�\128장전 신청 �\145")
      ;
      (ui._staticText_NoticeMessage):SetText("시간 내에 공성�\128�\152 출전자가 직접 �\128장전�\132 신청해야 합니�\164.")
      ;
      (ui._staticText_NoticeMessageBg):SetShow(true)
    else
      ;
      (ui._staticText_Title):SetText("�\128장전 신청 완료")
      ;
      (ui._staticText_NoticeMessage):SetText("잠시 �\132 수성�\128에게 1분간 �\128장전�\132 수락�\160 �\152 있는 시간�\180 주어집니�\164.")
      ;
      (ui._staticText_NoticeMessageBg):SetShow(true)
    end
    self:UpdateData()
  else
    do
      if __eGuildTeamBattleState_Accepting == state then
        (ui._staticText_Time):SetText(clockTime)
        local defenceTeam = ToClient_GetGuildTeamBattleDefenceTeam()
        if defenceTeam:isDefined() == false then
          (ui._staticText_Title):SetText("�\128장전 수락 �\145")
          ;
          (ui._staticText_NoticeMessage):SetText("시간 내에 수성�\128�\180 공성�\128�\152 �\128장전 신청�\144 응하�\128 않으�\180 수성�\128�\180 패배�\156 것으�\156 처리됩니�\164.")
          ;
          (ui._staticText_NoticeMessageBg):SetShow(true)
        else
          ;
          (ui._staticText_Title):SetText("�\128장전 성사")
          ;
          (ui._staticText_NoticeMessage):SetText("잠시 후부�\176 출전자들에게 전투�\188 �\128비할 �\152 있는 시간 1분이 주어집니�\164.")
          ;
          (ui._staticText_NoticeMessageBg):SetShow(true)
        end
        self:UpdateData()
      else
        do
          if __eGuildTeamBattleState_Teleport == state then
            (ui._staticText_Title):SetText("전투 �\128�\132 �\145")
            ;
            (ui._staticText_NoticeMessage):SetText(remainSec .. "�\136 후에 전투�\128 시작됩니�\164. 출전자들�\128 전투�\188 �\128비해주시�\176 바랍니다.")
            ;
            (ui._staticText_NoticeMessageBg):SetShow(true)
            self:UpdateData()
          else
            if __eGuildTeamBattleState_Fight == state then
              (ui._staticText_Title):SetText("�\128장전 진행 �\145")
              ;
              (ui._staticText_Time):SetText(clockTime)
              ;
              (ui._staticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_FIGHTING"))
              ;
              (ui._staticText_NoticeMessageBg):SetShow(false)
              self:UpdateData()
            else
              self:Close()
            end
          end
          if Panel_RewardSelect_NakMessage:GetShow() == true then
            (ui._staticText_NoticeMessageBg):SetShow(false)
          end
        end
      end
    end
  end
end

FromClient_Guild_OneOnOneClock_Initialize = function()
  -- function num : 0_6
  local ui = PaGlobal_Guild_OneOnOneClock._ui
  ui._staticText_Time = (UI.getChildControl)(ui._staticCenter_Bg, "StaticText_Time")
  ui._staticText_AlertMessage = (UI.getChildControl)(ui._staticText_AlertMessageBg, "StaticText_AlertMessage")
  ui._staticText_NoticeMessage = (UI.getChildControl)(ui._staticText_NoticeMessageBg, "StaticText_NoticeMessage")
  ;
  (ui._staticText_AlertMessageBg):SetShow(false)
  ;
  (ui._staticText_NoticeMessageBg):SetShow(false)
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Guild_OneOnOneClock._lastTerritoryKey = -1
end

FGlobal_UpdateOneOnOneClock_TimeUpdate = function(state, remainSec)
  -- function num : 0_7
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
            self._lastRemainTime = remainSec
            -- DECOMPILER ERROR at PC85: Unhandled construct in 'MakeBoolean' P1

            if ToClient_IsDoingGuildTeamBattleRingout() == true and ToClient_IsSelfInGuildTeamBattle() == false then
              (ui._staticText_AlertMessage):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ILLEGALENTERANCE_MAIN", "remainSec", ToClient_GetGuildTeamBattleRingoutTime()))
              ;
              (ui._staticText_AlertMessage):SetShow(true)
            end
            ;
            (ui._staticText_AlertMessage):SetShow(false)
            if __eGuildTeamBattleState_Fight == state then
              if ToClient_IsDoingGuildTeamBattleRingout() == true then
                if ToClient_IsSelfInGuildTeamBattle() == true then
                  (ui._staticText_AlertMessage):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_RINGOUT_MAIN", "remainSec", ToClient_GetGuildTeamBattleRingoutTime()))
                else
                  ;
                  (ui._staticText_AlertMessage):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ILLEGALENTERANCE_MAIN", "remainSec", ToClient_GetGuildTeamBattleRingoutTime()))
                end
                ;
                (ui._staticText_AlertMessage):SetShow(true)
              else
                ;
                (ui._staticText_AlertMessage):SetShow(false)
              end
            end
          end
        end
      end
    end
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
registerEvent("selfPlayer_regionChanged", "FGlobal_UpdateOneOnOneClock_TurnOnOff")

