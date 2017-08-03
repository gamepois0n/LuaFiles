-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\global_fromactionchart_luaevent.luac 

-- params : ...
-- function num : 0
local functor = {}
FromClient_ActionChartEvent = function(actorKeyRaw, eventNo, isSelfPlayer)
  -- function num : 0_0 , upvalues : functor
  local aFunction = functor[eventNo]
  if aFunction ~= nil then
    aFunction(actorKeyRaw, isSelfPlayer)
  end
end

ActionChartEventBindFunction = function(eventNo, insertFunctor)
  -- function num : 0_1 , upvalues : functor
  if functor[eventNo] ~= nil then
    _PA_ASSERT(false, "잘못�\156 ActionChart이벤트를 삽입하였습니�\164. ActionChartEventBindFunction 함수�\152 첫번�\184 인자�\188 확인�\180 주세�\148.")
  else
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

    functor[eventNo] = insertFunctor
  end
end

registerEvent("FromClient_ActionChartEvent", "FromClient_ActionChartEvent")

