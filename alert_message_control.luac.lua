-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\alert\alert_message_control.luac 

-- params : ...
-- function num : 0
FGlobal_Show_WillJoinBattleGround_Alert = function(sec)
  -- function num : 0_0
  local msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WILLUNJOIN_BATTLEGROUND_BY_BOSSMONSTER", "sec", sec)
  FGlobal_Show_AlertMessage(msg, 4)
end

registerEvent("FromClient_WillUnjoinBattleGround", "FGlobal_Show_WillJoinBattleGround_Alert")

