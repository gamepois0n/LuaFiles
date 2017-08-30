-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildbattle_point.luac 

-- params : ...
-- function num : 0
Panel_GuidlBattle_Point:SetShow(false)
PaGlobal_GuildBattlePoint = {_guildAName = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Left"), _guildBName = (UI.getChildControl)(Panel_GuidlBattle_Point, "StaticText_Right"), _guildAPoint = nil, _guildBPoint = nil, 
_round = {}
, _roundNumber = 0, _isShow = false}
-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.guildBattleTimer = function(self, time)
  -- function num : 0_1
  local min = (math.floor)(time / 60)
  local sec = time % 60
  ;
  ((self._round)._timer):SetText(tostring(min) .. tostring(" : ") .. tostring(sec))
  if not self._isShow then
    self:changeState()
  end
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattlePoint.changeState = function(self)
  -- function num : 0_2
  local state = ToClient_getGuildBattleState()
  local isJoinNow = ToClient_getJoinGuildBattle()
  if isJoinNow then
    Panel_GuidlBattle_Point:SetShow(true)
    self._isShow = true
  end
  if state == 1 then
    ((self._round)._bg):SetText("�\128비중")
  else
    if state == 2 then
      self._roundNumber = self._roundNumber + 1
      ;
      ((self._round)._bg):SetText("라운�\156 " .. tostring(self._roundNumber))
    end
  end
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

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

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

