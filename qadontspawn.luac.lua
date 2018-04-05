-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\qasupport\qadontspawn.luac 

-- params : ...
-- function num : 0
DontSpawn = function(value)
  -- function num : 0_0
  local rv = ToClient_DontSpawn(value, false)
  if rv == 0 then
    _PA_LOG("DontSpawn", "CharacterKey : " .. tostring(value) .. "Success")
  else
    _PA_LOG("DontSpawn", "CharacterKey : " .. tostring(value) .. " Failed")
  end
end

DontSpawnLoop = function(startValue, endValue)
  -- function num : 0_1
  for ii = startValue, endValue do
    DontSpawn(ii)
  end
end

ExecuteMonster1 = function()
  -- function num : 0_2
  monsterA()
  monsterB()
  monsterC()
end

ExecuteMonster2 = function()
  -- function num : 0_3
  monsterD()
  monsterE()
end

ExecuteMonster3 = function()
  -- function num : 0_4
  monsterG()
  monsterH()
  monsterI()
end

ExecuteMonster4 = function()
  -- function num : 0_5
  monsterJ()
  monsterK()
  monsterK()
end

ExecuteMonster5 = function()
  -- function num : 0_6
  monsterKK()
  monsterL()
  monsterN()
end

monsterA = function()
  -- function num : 0_7
  for ii = 20001, 20047 do
    DontSpawn(ii)
  end
end

monsterB = function()
  -- function num : 0_8
  for ii = 20584, 20598 do
    DontSpawn(ii)
  end
end

monsterC = function()
  -- function num : 0_9
  for ii = 24001, 24255 do
    DontSpawn(ii)
  end
end

monsterD = function()
  -- function num : 0_10
  for ii = 20048, 20553 do
    DontSpawn(ii)
  end
end

monsterE = function()
  -- function num : 0_11
  for ii = 22005, 22064 do
    DontSpawn(ii)
  end
end

monsterG = function()
  -- function num : 0_12
  for ii = 20101, 20762 do
    DontSpawn(ii)
  end
end

monsterH = function()
  -- function num : 0_13
  for ii = 22056, 22079 do
    DontSpawn(ii)
  end
end

monsterI = function()
  -- function num : 0_14
  for ii = 24004, 24248 do
    DontSpawn(ii)
  end
end

monsterJ = function()
  -- function num : 0_15
  for ii = 20601, 20765 do
    DontSpawn(ii)
  end
end

monsterK = function()
  -- function num : 0_16
  for ii = 24148, 24320 do
    DontSpawn(ii)
  end
end

monsterKK = function()
  -- function num : 0_17
  for ii = 21001, 21347 do
    DontSpawn(ii)
  end
end

monsterL = function()
  -- function num : 0_18
  for ii = 24011, 24284 do
    DontSpawn(ii)
  end
end

monsterN = function()
  -- function num : 0_19
  for ii = 21501, 21675 do
    DontSpawn(ii)
  end
end

QADontSpawn = function()
  -- function num : 0_20
  DontSpawn(100)
  DontSpawnLoop(200, 300)
end


