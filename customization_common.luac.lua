-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\customization_common.luac 

-- params : ...
-- function num : 0
globalcurrentclassType = -2
globalcurrentuiId = -2
globalcheckSlider = false
globalisCustomizationPicking = false
setGlobalCheck = function(sliderflag)
  -- function num : 0_0
  globalcheckSlider = sliderflag
end

setSliderValue = function(SliderControl, value, valueMin, valueMax)
  -- function num : 0_1
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
  -- function num : 0_2
  local ratio = SliderControl:GetControlPos()
  local range = valueMax - valueMin
  if range < 0 then
    range = 0
  end
  return (math.floor)(ratio * range + valueMin)
end

local clearGroupCustomizedBonInfoPostProcessList = (Array.new)()
pushClearGroupCustomizedBonInfoPostFunction = function(functor)
  -- function num : 0_3 , upvalues : clearGroupCustomizedBonInfoPostProcessList
  clearGroupCustomizedBonInfoPostProcessList:push_back(functor)
end

clearGroupCustomizedBonInfoLua = function()
  -- function num : 0_4 , upvalues : clearGroupCustomizedBonInfoPostProcessList
  clearGroupCustomizedBoneInfo()
  for key,value in pairs(clearGroupCustomizedBonInfoPostProcessList) do
    value()
  end
end

add_CurrentHistory = function()
  -- function num : 0_5
  if checkType == 3 then
    return 
  end
  if globalisCustomizationPicking == false then
    globalcheckSlider = false
  end
  ToClient_addHistory()
  SetHistroyList()
  setCurrentActive()
end


