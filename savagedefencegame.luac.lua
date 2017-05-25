-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\savagedefence\savagedefencegame.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
FromClient_StartSavageDefenceWave = function()
  -- function num : 0_0
  local nextWaveCount = ToClient_SavageDefenceNextWave()
  local isNextStartTime = ToClient_SavageDefenceNextTime()
  local isMsg = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEGAME_MESSAGE", "time", tostring(isNextStartTime), "wave", tostring(nextWaveCount)), sub = "", addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(isMsg, 6, 67)
end

registerEvent("FromClient_StartSavageDefenceWave", "FromClient_StartSavageDefenceWave")

