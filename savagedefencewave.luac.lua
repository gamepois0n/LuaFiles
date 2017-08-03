-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\savagedefence\savagedefencewave.luac 

-- params : ...
-- function num : 0
Panel_SavageDefenceWave:SetShow(false)
local SavageDefenceWave = {_wavecount = (UI.getChildControl)(Panel_SavageDefenceWave, "StaticText_WaveCount"), _waveTime = (UI.getChildControl)(Panel_SavageDefenceWave, "StaticText_WaveTime"), _nextwavecount = 0, _remainTime = -1, _alertMsg = false}
SavageDefenceWave_Open = function()
  -- function num : 0_0 , upvalues : SavageDefenceWave
  if not ToClient_getPlayNowSavageDefence() then
    return 
  end
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  SavageDefenceWave._alertMsg = false
  ;
  (SavageDefenceWave._wavecount):SetText("0")
  ;
  (SavageDefenceWave._waveTime):SetText("00 : 00")
  Panel_SavageDefenceWave:SetShow(true)
  SavageDefenceWave:SetPosition()
end

SavageDefenceWave.SetPosition = function(self)
  -- function num : 0_1
  local pivotY = Panel_SavageDefenceShop:GetSizeX() / 2
  Panel_SavageDefenceWave:SetPosX(getScreenSizeX() - pivotY * 1.5)
  Panel_SavageDefenceWave:SetPosY(Panel_SavageDefenceShop:GetPosY() - Panel_SavageDefenceWave:GetSizeY())
end

SavageDefenceWave_UpdateWaveData = function(wavecount)
  -- function num : 0_2 , upvalues : SavageDefenceWave
  (SavageDefenceWave._wavecount):SetText(tostring(wavecount))
end

SavageDefenceWave_UpdateWaveTime = function(deltaTime, wavecount)
  -- function num : 0_3 , upvalues : SavageDefenceWave
  if deltaTime < 0 then
    deltaTime = 0
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

  if SavageDefenceWave._alertMsg == false and SavageDefenceWave._nextwavecount == 1 and deltaTime <= 0 then
    SavageDefenceWave._alertMsg = true
    local Msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_WAVE_START"), sub = "", addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(Msg, 5, 74, false)
  end
  do
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

    if SavageDefenceWave._nextwavecount ~= wavecount then
      SavageDefenceWave._nextwavecount = wavecount
      ;
      (SavageDefenceWave._wavecount):SetText(tostring(wavecount))
    end
    if SavageDefenceWave._remainTime ~= deltaTime then
      (SavageDefenceWave._waveTime):SetText(SavageDefenceWave_GetTimeFormat(deltaTime))
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R2 in 'UnsetPending'

      SavageDefenceWave._remainTime = deltaTime
    end
  end
end

SavageDefenceWave_GetTimeFormat = function(remainTime)
  -- function num : 0_4
  local strminute = "00"
  local standardMinute = 60
  local remainSeconds = remainTime % standardMinute
  local remainMinute = remainTime - remainSeconds
  if standardMinute <= remainTime then
    strminute = SavageDefenceWave_GetTimeUnit(remainMinute / standardMinute)
  end
  local strsecond = SavageDefenceWave_GetTimeUnit(remainSeconds)
  return strminute .. " : " .. strsecond
end

SavageDefenceWave_GetTimeUnit = function(timedata)
  -- function num : 0_5
  local str = "00"
  if timedata < 10 then
    str = "0" .. tostring(timedata)
  else
    str = tostring(timedata)
  end
  return str
end

SavageDefenceWave_jumpWave = function(index)
  -- function num : 0_6
  ToClient_RequestWaveJumpReq(index)
end


