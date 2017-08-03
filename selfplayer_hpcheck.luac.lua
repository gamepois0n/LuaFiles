-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\selfplayer_hpcheck.luac 

-- params : ...
-- function num : 0
local enumRate = {rate_40over = 0, rate_20over = 1, rate_else = 2}
local rateType = enumRate.rate_40over
SelfPlayer_HpCheck_SoundFunction = function(actorKeyRaw, hp, maxHp)
  -- function num : 0_0 , upvalues : enumRate, rateType
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  if (actorProxyWrapper:get()):isSelfPlayer() == false then
    return 
  end
  local rate = hp / maxHp * 100
  do
    local currRateType = nil
    if rate >= 40 then
      currRateType = enumRate.rate_40over
    else
      if rate >= 20 then
        currRateType = enumRate.rate_20over
      else
        currRateType = enumRate.rate_else
      end
    end
    if currRateType == rateType then
      return 
    end
    if currRateType < rateType then
      rateType = currRateType
      return 
    end
    rateType = currRateType
    if (enumRate.rate_20over ~= rateType or enumRate.rate_else == rateType) then
    end
  end
end

registerEvent("hpChanged", "SelfPlayer_HpCheck_SoundFunction")

