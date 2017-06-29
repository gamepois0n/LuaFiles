-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\savagedefence\savagedefencegame.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local towerHp = -1
local nextwavetime = 0
local currenttime = 0
local currentwave = 0
FromClient_StartSavageDefenceWave = function()
  -- function num : 0_0 , upvalues : currentwave, currenttime, nextwavetime
  local nextWaveCount = ToClient_SavageDefenceNextWave()
  local isNextStartTime = ToClient_SavageDefenceNextTime()
  currentwave = ToClient_SavageDefenceNextWave() - 1
  currenttime = nextwavetime
  SavageDefenceMember_UpdateCurrentWave(currentwave)
  nextwavetime = nextwavetime + isNextStartTime
  local isMsg = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEGAME_MESSAGE", "time", tostring(isNextStartTime), "wave", tostring(nextWaveCount)), sub = "", addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(isMsg, 6, 67)
end

FromClient_UpdatePerFrame = function(deltatime)
  -- function num : 0_1 , upvalues : towerHp, currentwave, currenttime, nextwavetime
  local currenttowerhp = ToClient_SavageDefenceTowerHp()
  if currenttowerhp ~= towerHp then
    SavageDefenceMember_UpdateTowerHp()
    towerHp = currenttowerhp
  end
  if currentwave ~= ToClient_SavageDefenceNextWave() then
    currenttime = currenttime + deltatime
    if nextwavetime <= currenttime then
      currentwave = ToClient_SavageDefenceNextWave()
      currenttime = nextwavetime
      SavageDefenceMember_UpdateCurrentWave(currentwave)
    end
  end
end

registerEvent("FromClient_StartSavageDefenceWave", "FromClient_StartSavageDefenceWave")
registerEvent("FromClient_UpdatePerFrame", "FromClient_UpdatePerFrame")

