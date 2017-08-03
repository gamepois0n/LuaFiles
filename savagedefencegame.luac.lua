-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\savagedefence\savagedefencegame.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local nextWaveCount = 0
FromClient_StartSavageDefenceWave = function()
  -- function num : 0_0 , upvalues : nextWaveCount
  nextWaveCount = ToClient_SavageDefenceNextWave()
  local nextwaveTime = ToClient_SavageDefenceNextTime()
  if nextWaveCount == 1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_START"))
  end
  local isMsg = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEGAME_MESSAGE", "time", tostring(nextwaveTime), "wave", tostring(nextWaveCount)), sub = "", addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(isMsg, 6, 67)
end

FromClient_EndSavageDefenceWave = function(isMaxProcess)
  -- function num : 0_1
  if isMaxProcess == false then
    local Msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_FAIL_END"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_MOVE_CHANNEL"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(Msg, 5, 73, false)
  else
    do
      local Msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_SUCCESS_GAME"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_MOVE_CHANNEL"), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(Msg, 5, 72, false)
    end
  end
end

FromClient_SavageDefenceNotifyBossMonster = function(charactername)
  -- function num : 0_2
end

FromClient_UpdateSavageDefenceData = function(remainTime)
  -- function num : 0_3 , upvalues : nextWaveCount
  SavageDefenceWave_UpdateWaveTime(remainTime, nextWaveCount)
end

FromClient_OpenSavageDefenceUI = function()
  -- function num : 0_4
  SavageDefenceMember_Open(true)
  SavageDefenceTowerHp_Open()
  SavageDefenceWave_Open()
end

FromClient_OpenSavageDefenceUI()
registerEvent("FromClient_joinSavageDefence", "FromClient_OpenSavageDefenceUI")
registerEvent("FromClient_StartSavageDefenceWave", "FromClient_StartSavageDefenceWave")
registerEvent("FromClient_EndSavageDefenceWave", "FromClient_EndSavageDefenceWave")
registerEvent("FromClient_SavageDefenceNotifyBossMonster", "FromClient_SavageDefenceNotifyBossMonster")
registerEvent("FromClient_UpdateSavageDefenceData", "FromClient_UpdateSavageDefenceData")

