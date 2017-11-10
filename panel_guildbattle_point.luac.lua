-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildbattle_point.luac 

-- params : ...
-- function num : 0
Panel_GuidlBattle_Point:SetShow(false)
PaGlobal_GuildBattlePoint = {_guildAName = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Left"), _guildBName = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Right"), _guildAPoint = nil, _guildBPoint = nil, 
_round = {}
, _isShow = false}
-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.initilize = function(self)
  -- function num : 0_0
  local round = {}
  round._bg = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Center")
  round._timer = (UI.getChildControl)(round._bg, "StaticText_Time")
  self._round = round
  self._isShow = false
  self._guildAPoint = (UI.getChildControl)(self._guildAName, "StaticText_LeftPoint")
  self._guildBPoint = (UI.getChildControl)(self._guildBName, "StaticText_RightPoint")
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.guildBattleTimer = function(self, time)
  -- function num : 0_1
  local min = (math.floor)(time / 60)
  local sec = time % 60
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

-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.Close = function(self)
  -- function num : 0_3
  Panel_GuidlBattle_Point:SetShow(false)
  self._isShow = false
end

FromClient_guildBattlePointTimer = function(time)
  -- function num : 0_4
  PaGlobal_GuildBattlePoint:guildBattleTimer(time)
end

FromClient_guildBattlePointChange = function()
  -- function num : 0_5
  PaGlobal_GuildBattlePoint:changeState()
end

FromClient_unjoinGuildBattle = function()
  -- function num : 0_6
  PaGlobal_GuildBattlePoint:Close()
end

registerEvent("FromClient_guildBattleTimer", "FromClient_guildBattlePointTimer")
registerEvent("FromClient_guildBattleStateChange", "FromClient_guildBattlePointChange")
registerEvent("FromClient_unjoinGuildBattle", "FromClient_unjoinGuildBattle")
PaGlobal_GuildBattlePoint:initilize()

