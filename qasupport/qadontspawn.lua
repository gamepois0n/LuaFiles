function DontSpawn(value)
  local rv = ToClient_DontSpawn(value, false)
  if 0 == rv then
    _PA_LOG("DontSpawn", "CharacterKey : " .. tostring(value) .. "Success")
  else
    _PA_LOG("DontSpawn", "CharacterKey : " .. tostring(value) .. " Failed")
  end
end
function DontSpawnLoop(startValue, endValue)
  for ii = startValue, endValue do
    DontSpawn(ii)
  end
end
function ExecuteMonster1()
  monsterA()
  monsterB()
  monsterC()
end
function ExecuteMonster2()
  monsterD()
  monsterE()
end
function ExecuteMonster3()
  monsterG()
  monsterH()
  monsterI()
end
function ExecuteMonster4()
  monsterJ()
  monsterK()
  monsterK()
end
function ExecuteMonster5()
  monsterKK()
  monsterL()
  monsterN()
end
function monsterA()
  for ii = 20001, 20047 do
    DontSpawn(ii)
  end
end
function monsterB()
  for ii = 20584, 20598 do
    DontSpawn(ii)
  end
end
function monsterC()
  for ii = 24001, 24255 do
    DontSpawn(ii)
  end
end
function monsterD()
  for ii = 20048, 20553 do
    DontSpawn(ii)
  end
end
function monsterE()
  for ii = 22005, 22064 do
    DontSpawn(ii)
  end
end
function monsterG()
  for ii = 20101, 20762 do
    DontSpawn(ii)
  end
end
function monsterH()
  for ii = 22056, 22079 do
    DontSpawn(ii)
  end
end
function monsterI()
  for ii = 24004, 24248 do
    DontSpawn(ii)
  end
end
function monsterJ()
  for ii = 20601, 20765 do
    DontSpawn(ii)
  end
end
function monsterK()
  for ii = 24148, 24320 do
    DontSpawn(ii)
  end
end
function monsterKK()
  for ii = 21001, 21347 do
    DontSpawn(ii)
  end
end
function monsterL()
  for ii = 24011, 24284 do
    DontSpawn(ii)
  end
end
function monsterN()
  for ii = 21501, 21675 do
    DontSpawn(ii)
  end
end
function QADontSpawn()
  DontSpawn(100)
  DontSpawnLoop(200, 300)
end
