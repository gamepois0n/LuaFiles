-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildbattle_point.luac 

-- params : ...
-- function num : 0
Panel_GuidlBattle_Point:SetShow(false)
PaGlobal_GuildBattlePoint = {_guildAName = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Left"), _guildBName = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Right"), _guildAPoint = nil, _guildBPoint = nil, 
_round = {}
, _isShow = false, _perFrmaeTimer = 0, _nextStateTime = 0, _maxTime = 0, _timerPause = false}
-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.initilize = function(self)
  -- function num : 0_0
  local round = {}
  round._bg = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Center")
  round._timer = (UI.getChildControl)(round._bg, "StaticText_Time")
  self._round = round
  self._isShow = false
  self._guildAPoint = (UI.getChildControl)(self._guildAName, "StaticText_LeftPoint")
  self._guildBPoint = (UI.getChildControl)(self._guildBName, "StaticText_RightPoint")
  self:changeState()
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.guildBattleTimer = function(self, time)
  -- function num : 0_1
  local min = (math.floor)(time / 60)
  local sec = (math.floor)(time % 60)
  local zero = "0"
  if time <= 0 then
    min = 0
    sec = 0
  end
  if sec < 10 then
    ((self._round)._timer):SetText(tostring(min) .. tostring(" : ") .. zero .. tostring(sec))
  else
    ;
    ((self._round)._timer):SetText(tostring(min) .. tostring(" : ") .. tostring(sec))
  end
  local state = ToClient_getGuildBattleState()
  if state ~= 1 and state ~= 2 then
    ((self._round)._timer):SetText("00 : 00")
  end
  if not self._isShow then
    self:changeState()
  end
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.changeState = function(self)
  -- function num : 0_2
  local state = ToClient_getGuildBattleState()
  local isJoinNow = ToClient_getJoinGuildBattle()
  if isJoinNow then
    Panel_GuidlBattle_Point:SetShow(true)
    self._isShow = true
  end
  if state == 1 then
    ((self._round)._bg):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_READY"))
  else
    if state == 2 then
      local round = ToClient_getGuildBattleCurrentRound()
      ;
      ((self._round)._bg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_ROUND", "round", round))
    else
      do
        ;
        ((self._round)._bg):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
        local guildA = ToClient_getCurrentServerGuildBattleInfo(0)
        local guildB = ToClient_getCurrentServerGuildBattleInfo(1)
        if guildA ~= nil and guildB ~= nil then
          (self._guildAName):SetText(guildA:getName())
          ;
          (self._guildBName):SetText(guildB:getName())
          ;
          (self._guildAPoint):SetText(guildA:winPoint())
          ;
          (self._guildBPoint):SetText(guildB:winPoint())
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.Close = function(self)
  -- function num : 0_3
  Panel_GuidlBattle_Point:SetShow(false)
  self._isShow = false
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.SetTimer = function(self, next, max)
  -- function num : 0_4
  self._nextStateTime = max
  self._maxTime = max
  self._timerPause = false
  self:guildBattleTimer(self._nextStateTime)
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.UpdatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._timerPause then
    return 
  end
  self._perFrmaeTimer = self._perFrmaeTimer + deltaTime
  self._nextStateTime = self._nextStateTime - deltaTime
  if self._perFrmaeTimer > 1 then
    if self._maxTime <= 0 then
      return 
    end
    if self._nextStateTime <= 0 then
      ToClient_guildBattleTimerEvent()
      self._timerPause = true
    end
    self:guildBattleTimer(self._nextStateTime)
    self._perFrmaeTimer = 0
  end
end

FGlobal_GuildBattlePoint_UpdatePerFrame = function(deltaTime)
  -- function num : 0_6
  PaGlobal_GuildBattlePoint:UpdatePerFrame(deltaTime)
end

FromClient_guildBattlePointTimer = function(time, max)
  -- function num : 0_7
  PaGlobal_GuildBattlePoint:SetTimer(time, max)
end

FromClient_guildBattlePointChange = function()
  -- function num : 0_8
  PaGlobal_GuildBattlePoint:changeState()
end

FromClient_unjoinGuildBattle = function()
  -- function num : 0_9
  PaGlobal_GuildBattlePoint:Close()
end

GuildBattlePoint_LuaLoadComplete = function()
  -- function num : 0_10
  PaGlobal_GuildBattlePoint:initilize()
  ToClient_GuildBattleInfoUpdate()
end

registerEvent("FromClient_guildBattleTimer", "FromClient_guildBattlePointTimer")
registerEvent("FromClient_guildBattleStateChange", "FromClient_guildBattlePointChange")
registerEvent("FromClient_unjoinGuildBattle", "FromClient_unjoinGuildBattle")
registerEvent("FromClient_luaLoadComplete", "GuildBattlePoint_LuaLoadComplete")

