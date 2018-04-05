-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guildbattle_joinmember.luac 

-- params : ...
-- function num : 0
PaGlobal_GuildBattle_JoinMember = {
_ui = {_staticInmyChannel = (UI.getChildControl)(Panel_GuildBattle_JoinMember, "Static_InMyChannelBG"), _textTitle = nil, _textDesc = nil}
}
-- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle_JoinMember.initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._textTitle = (UI.getChildControl)((self._ui)._staticInmyChannel, "StaticText_Title")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._textDesc = (UI.getChildControl)((self._ui)._staticInmyChannel, "StaticText_Desc")
  ;
  ((self._ui)._textTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_WAITING"))
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle_JoinMember.Update = function(self)
  -- function num : 0_1
  if ToClient_isPersonalBattle() == false then
    Panel_GuildBattle_JoinMember:SetShow(false)
    return 
  end
  if __eGuildBattleGameMode_Count == ToClient_GuildBattle_GetCurrentMode() then
    Panel_GuildBattle_JoinMember:SetShow(false)
    return 
  end
  if ToClient_GuildBattle_GetCurrentState() ~= 0 then
    Panel_GuildBattle_JoinMember:SetShow(false)
    return 
  else
    Panel_GuildBattle_JoinMember:SetShow(true)
  end
  local curChannelData = getCurrentChannelServerData()
  if curChannelData == nil then
    Panel_GuildBattle_JoinMember:SetShow(false)
    return 
  end
  local inMyChannelName = getChannelName(curChannelData._worldNo, curChannelData._serverNo)
  ;
  ((self._ui)._textDesc):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_OPENWAR_INMYCHANNEL", "inMyChannelName", inMyChannelName, "inCount", ToClient_GetcurrentTotalJoinCount()))
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle_JoinMember.Show = function(self, isShow)
  -- function num : 0_2
  Panel_GuildBattle_JoinMember:SetShow(isShow)
  if isShow == true then
    self:Update()
  end
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle_JoinMember.IsShow = function(self)
  -- function num : 0_3
  return Panel_GuildBattle_JoinMember:GetShow()
end

FromClient_UpdateGuildBattleJoinCount = function()
  -- function num : 0_4
  if ToClient_isPersonalBattle() == true then
    PaGlobal_GuildBattle_JoinMember:Show(true)
  end
end

FromClient_luaLoadComplete_GuildBattle_JoinMember = function()
  -- function num : 0_5
  PaGlobal_GuildBattle_JoinMember:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_GuildBattle_JoinMember")
registerEvent("FromClient_UpdateGuildBattleJoinCount", "FromClient_UpdateGuildBattleJoinCount")

