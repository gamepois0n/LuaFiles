-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\customization\customization_common.luac 

-- params : ...
-- function num : 0
setSliderValue = function(SliderControl, value, valueMin, valueMax)
  -- function num : 0_0
  local range = valueMax - valueMin
  if value < valueMin then
    value = valueMin
  end
  if valueMax < value then
    value = valueMax
  end
  if range <= 0 then
    SliderControl:SetControlPos(50)
  else
    SliderControl:SetControlPos((value - valueMin) / range * 100)
  end
end

getSliderValue = function(SliderControl, valueMin, valueMax)
  -- function num : 0_1
  local ratio = SliderControl:GetControlPos()
  local range = valueMax - valueMin
  if range < 0 then
    range = 0
  end
  return (math.floor)(ratio * range + valueMin)
end

local clearGroupCustomizedBonInfoPostProcessList = (Array.new)()
pushClearGroupCustomizedBonInfoPostFunction = function(functor)
  -- function num : 0_2 , upvalues : clearGroupCustomizedBonInfoPostProcessList
  clearGroupCustomizedBonInfoPostProcessList:push_back(functor)
end

clearGroupCustomizedBonInfoLua = function()
  -- function num : 0_3 , upvalues : clearGroupCustomizedBonInfoPostProcessList
  clearGroupCustomizedBoneInfo()
  for key,value in pairs(clearGroupCustomizedBonInfoPostProcessList) do
    value()
  end
end

add_CurrentHistory = function()
  -- function num : 0_4
  ToClient_addHistory()
end


