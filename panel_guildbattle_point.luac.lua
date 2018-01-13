-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildbattle_point.luac 

-- params : ...
-- function num : 0
local BattleStates = {Idle = 0, Join = 1, SelectEntry = 2, SelectAttend = 3, Ready = 4, Fight = 5, End = 6, Teleport = 7}
local BattleModes = {Normal = 0, OneOne = 1, All = 2}
PaGlobal_GuildBattlePoint = {_guildAName = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Left"), _guildBName = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Right"), _oneonePointBg = (UI.getChildControl)(Panel_GuidlBattle_Point, "Static_OneOneScore"), _guildAPoint = nil, _guildBPoint = nil, 
_round = {}
, _perFrmaeTimer = 0, _nextStateTime = 0, _maxTime = 0, _timerPause = false}
-- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattlePoint.initilize = function(self)
  -- function num : 0_0
  local round = {}
  round._bg = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Center")
  round._timer = (UI.getChildControl)(round._bg, "StaticText_Time")
  round._staticText_BattleMode = (UI.getChildControl)(round._bg, "StaticText_BattleMode")
  round._staticText_BattleStateDetail = (UI.getChildControl)(round._bg, "StaticText_BattleStateDetail")
  self._round = round
  self._guildAPoint = (UI.getChildControl)(self._guildAName, "StaticText_LeftPoint")
  self._guildBPoint = (UI.getChildControl)(self._guildBName, "StaticText_RightPoint")
  self._guildASurvivorCount = (UI.getChildControl)(self._guildAName, "StaticText_LeftNumSurvivor")
  self._guildBSurvivorCount = (UI.getChildControl)(self._guildBName, "StaticText_RightNumSurvivor")
  self._guildAOneOnePoint = (UI.getChildControl)(self._oneonePointBg, "StaticText_LeftOneOneScore")
  self._guildBOneOnePoint = (UI.getChildControl)(self._oneonePointBg, "StaticText_RightOneOneScore")
  ;
  (self._guildASurvivorCount):SetShow(false)
  ;
  (self._guildBSurvivorCount):SetShow(false)
  ;
  (self._oneonePointBg):SetShow(false)
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattlePoint.ShowSurvivorCount = function(self, isShow)
  -- function num : 0_1
  (self._guildASurvivorCount):SetShow(isShow)
  ;
  (self._guildBSurvivorCount):SetShow(isShow)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattlePoint.ShowOneOnePoint = function(self, isShow)
  -- function num : 0_2
  (self._oneonePointBg):SetShow(isShow)
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattlePoint.UpdateRemainTime = function(self)
  -- function num : 0_3
  local time = ToClient_GuildBattle_GetRemainTime()
  if time < 0 then
    time = 0
  end
  local min = (math.floor)(time / 60)
  local sec = (math.floor)(time % 60)
  local zero = "0"
  if sec < 10 then
    ((self._round)._timer):SetText(tostring(min) .. tostring(" : ") .. zero .. tostring(sec))
  else
    ;
    ((self._round)._timer):SetText(tostring(min) .. tostring(" : ") .. tostring(sec))
  end
  if self:IsShow() == true then
    self:UpdateRoundAndScore()
  end
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattlePoint.UpdateRoundAndScore = function(self)
  -- function num : 0_4 , upvalues : BattleStates, BattleModes
  local battleState = ToClient_GuildBattle_GetCurrentState()
  local battleMode = ToClient_GuildBattle_GetCurrentMode()
  local round = ToClient_GuildBattle_GetBattleCurrentRound()
  local guildA = ToClient_GuildBattle_GetCurrentServerGuildBattleInfo(0)
  local guildB = ToClient_GuildBattle_GetCurrentServerGuildBattleInfo(1)
  ;
  ((self._round)._staticText_BattleStateDetail):SetShow(false)
  if battleState == BattleStates.Idle then
    ((self._round)._bg):SetText("")
  else
    if battleState == BattleStates.Join then
      ((self._round)._bg):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLESTATE_JOIN"))
    else
      if battleState == BattleStates.Ready then
        ((self._round)._bg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ROUND", "round", round))
        ;
        ((self._round)._staticText_BattleStateDetail):SetShow(true)
        ;
        ((self._round)._staticText_BattleStateDetail):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_READYSTATE_SHORT"))
      else
        if battleState == BattleStates.SelectEntry then
          ((self._round)._bg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ROUND", "round", round))
          ;
          ((self._round)._staticText_BattleStateDetail):SetShow(true)
          ;
          ((self._round)._staticText_BattleStateDetail):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SELECTENTRY_SHORT"))
        else
          if battleState == BattleStates.SelectAttend then
            ((self._round)._bg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ROUND", "round", round))
            ;
            ((self._round)._staticText_BattleStateDetail):SetShow(true)
            ;
            ((self._round)._staticText_BattleStateDetail):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SELECTATTEND_SHORT"))
          else
            if battleState == BattleStates.Fight then
              ((self._round)._bg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ROUND", "round", round))
            else
              if battleState == BattleStates.End then
                ((self._round)._bg):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
              else
                if battleState == BattleStates.Teleport then
                  ((self._round)._bg):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLESTATE_TELEPORT"))
                else
                  ;
                  ((self._round)._bg):SetText(PAGetString(Defines.StringSheet_GAME, ""))
                end
              end
            end
          end
        end
      end
    end
  end
  ;
  ((self._round)._staticText_BattleMode):SetShow(false)
  if battleState == BattleStates.Fight or battleState == BattleStates.SelectEntry or battleState == BattleStates.SelectAttend or battleState == BattleStates.Ready then
    ((self._round)._staticText_BattleMode):SetShow(true)
    if battleMode == BattleModes.Normal then
      ((self._round)._staticText_BattleMode):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLEMODE_NORMAL"))
    else
      if battleMode == BattleModes.OneOne then
        ((self._round)._staticText_BattleMode):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLEMODE_ONEONE"))
      else
        if battleMode == BattleModes.All then
          ((self._round)._staticText_BattleMode):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLEMODE_ALL"))
        else
          ;
          ((self._round)._staticText_BattleMode):SetText("")
        end
      end
    end
  end
  ;
  (self._guildASurvivorCount):SetShow(false)
  ;
  (self._guildBSurvivorCount):SetShow(false)
  ;
  (self._oneonePointBg):SetShow(false)
  if guildA ~= nil and guildB ~= nil then
    (self._guildAName):SetText(guildA:getName())
    ;
    (self._guildBName):SetText(guildB:getName())
    ;
    (self._guildAPoint):SetText(guildA:winPoint())
    ;
    (self._guildBPoint):SetText(guildB:winPoint())
    -- DECOMPILER ERROR at PC304: Unhandled construct in 'MakeBoolean' P1

    if battleMode == BattleModes.Normal and battleState == BattleStates.Fight then
      (self._guildASurvivorCount):SetShow(true)
      ;
      (self._guildBSurvivorCount):SetShow(true)
      local guildASurvivorCount = guildA:getNumSurvivors()
      local guildBSurvivorCount = guildB:getNumSurvivors()
      ;
      (self._guildASurvivorCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SURVIVORCOUNT", "count", tostring(guildASurvivorCount)))
      ;
      (self._guildBSurvivorCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SURVIVORCOUNT", "count", tostring(guildBSurvivorCount)))
    end
  end
  do
    -- DECOMPILER ERROR at PC361: Unhandled construct in 'MakeBoolean' P1

    if battleMode == BattleModes.OneOne and (battleState == BattleStates.Fight or battleState == BattleStates.Ready or battleState == BattleStates.Teleport or battleState == BattleStates.SelectAttend) then
      (self._oneonePointBg):SetShow(true)
      ;
      (self._guildAOneOnePoint):SetText(guildA:getModeWinScore())
      ;
      (self._guildBOneOnePoint):SetText(guildB:getModeWinScore())
    end
    if battleMode == BattleModes.All and battleState == BattleStates.Fight then
      (self._guildASurvivorCount):SetShow(true)
      ;
      (self._guildBSurvivorCount):SetShow(true)
      local guildASurvivorCount = guildA:getNumSurvivors()
      local guildBSurvivorCount = guildB:getNumSurvivors()
      ;
      (self._guildASurvivorCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SURVIVORCOUNT", "count", tostring(guildASurvivorCount)))
      ;
      (self._guildBSurvivorCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SURVIVORCOUNT", "count", tostring(guildBSurvivorCount)))
    end
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattlePoint.Show = function(self, isShow)
  -- function num : 0_5
  Panel_GuidlBattle_Point:SetShow(isShow)
  if isShow == true then
    self:UpdateRoundAndScore()
  end
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattlePoint.IsShow = function(self)
  -- function num : 0_6
  return Panel_GuidlBattle_Point:GetShow()
end

FromClient_guildBattlePointTimer = function(time, max)
  -- function num : 0_7
  PaGlobal_GuildBattlePoint:SetTimer(time, max)
end

FromClient_unjoinGuildBattle = function()
  -- function num : 0_8
  PaGlobal_GuildBattlePoint:PaGlobal_GuildBattlePoint()
end

GuildBattlePoint_LuaLoadComplete = function()
  -- function num : 0_9
  PaGlobal_GuildBattlePoint:initilize()
  Panel_GuidlBattle_Point:SetShow(false)
end

registerEvent("FromClient_luaLoadComplete", "GuildBattlePoint_LuaLoadComplete")

