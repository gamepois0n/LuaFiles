-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_animationeasingfun.luac 

-- params : ...
-- function num : 0
PaGlobal_AnimationEasingFun_linear = function(timeDelta)
  -- function num : 0_0
  return timeDelta
end

PaGlobal_AnimationEasingFun_easeInQuad = function(timeDelta)
  -- function num : 0_1
  return timeDelta * timeDelta
end

PaGlobal_AnimationEasingFun_easeOutQuad = function(timeDelta)
  -- function num : 0_2
  return timeDelta * (2 - timeDelta)
end

PaGlobal_AnimationEasingFun_easeInOutQuad = function(timeDelta)
  -- function num : 0_3
  timeDelta = timeDelta * 2
  if timeDelta < 1 then
    return 0.5 * (timeDelta) * (timeDelta)
  end
  timeDelta = timeDelta - 1
  return -0.5 * ((timeDelta) * (timeDelta - 2) - 1)
end

PaGlobal_AnimationEasingFun_easeInCubic = function(timeDelta)
  -- function num : 0_4
  return timeDelta * timeDelta * timeDelta
end

PaGlobal_AnimationEasingFun_easeOutCubic = function(timeDelta)
  -- function num : 0_5
  timeDelta = timeDelta - 1
  return (timeDelta) * (timeDelta) * (timeDelta) + 1
end

PaGlobal_AnimationEasingFun_easeInOutCubic = function(timeDelta)
  -- function num : 0_6
  if timeDelta < 0.5 then
    return 4 * timeDelta * timeDelta * timeDelta
  end
  timeDelta = timeDelta - 1
  return 4 * (timeDelta) * (timeDelta) * (timeDelta) + 1
end

PaGlobal_AnimationEasingFun_easeInQuart = function(timeDelta)
  -- function num : 0_7
  return timeDelta * timeDelta * timeDelta * timeDelta
end

PaGlobal_AnimationEasingFun_easeOutQuart = function(timeDelta)
  -- function num : 0_8
  timeDelta = timeDelta - 1
  return 1 - (timeDelta) * (timeDelta) * (timeDelta) * (timeDelta)
end

PaGlobal_AnimationEasingFun_easeInOutQuart = function(timeDelta)
  -- function num : 0_9
  if timeDelta < 0.5 then
    return 8 * timeDelta * timeDelta * timeDelta * timeDelta
  end
  timeDelta = timeDelta - 1
  return 1 - 8 * (timeDelta) * (timeDelta) * (timeDelta) * (timeDelta)
end

PaGlobal_AnimationEasingFun_easeInQuint = function(timeDelta)
  -- function num : 0_10
  return timeDelta * timeDelta * timeDelta * timeDelta * timeDelta
end

PaGlobal_AnimationEasingFun_easeOutQuint = function(timeDelta)
  -- function num : 0_11
  timeDelta = timeDelta - 1
  return 1 + (timeDelta) * (timeDelta) * (timeDelta) * (timeDelta) * (timeDelta)
end

PaGlobal_AnimationEasingFun_easeInOutQuint = function(timeDelta)
  -- function num : 0_12
  timeDelta = timeDelta / 1 / 2
  if timeDelta < 1 then
    return 0.5 * (timeDelta) * (timeDelta) * (timeDelta) * (timeDelta) * (timeDelta)
  end
  timeDelta = timeDelta - 2
  return 0.5 * ((timeDelta) * (timeDelta) * (timeDelta) * (timeDelta) * (timeDelta) + 2)
end

PaGlobal_AnimationEasingFun_easeInBack = function(timeDelta)
  -- function num : 0_13
  local s = 1.70158
  return timeDelta * timeDelta * ((s + 1) * timeDelta - s)
end

PaGlobal_AnimationEasingFun_easeOutBack = function(timeDelta)
  -- function num : 0_14
  local s = 1.70158
  timeDelta = timeDelta - 1
  return (timeDelta) * (timeDelta) * ((s + 1) * (timeDelta) + s) + 1
end

PaGlobal_AnimationEasingFun_easeInOutBack = function(timeDelta)
  -- function num : 0_15
  local s = 1.70158
  timeDelta = timeDelta / 1 / 2
  if timeDelta < 1 then
    s = s * 1.525
    return 0.5 * (timeDelta * (timeDelta) * ((s + 1) * (timeDelta) - s))
  end
  timeDelta = timeDelta - 2
  local postFix = timeDelta
  s = s * 1.525
  return 0.5 * (postFix * (timeDelta) * ((s + 1) * (timeDelta) + s) + 2)
end

PaGlobal_AnimationEasingFun_easeOutBounce = function(timeDelta)
  -- function num : 0_16
  if timeDelta < 0.36363636363636 then
    return 7.5625 * timeDelta * timeDelta
  else
    if timeDelta < 0.72727272727273 then
      timeDelta = timeDelta - 0.54545454545455
      local postFix = timeDelta
      return 7.5625 * postFix * (timeDelta) + 0.75
    else
      do
        if timeDelta < 0.90909090909091 then
          timeDelta = timeDelta - 0.81818181818182
          local postFix = timeDelta
          return 7.5625 * postFix * (timeDelta) + 0.9375
        else
          do
            timeDelta = timeDelta - 0.95454545454545
            local postFix = timeDelta
            do return 7.5625 * postFix * (timeDelta) + 0.984375 end
          end
        end
      end
    end
  end
end

PaGlobal_AnimationEasingFun_easeInBounce = function(timeDelta)
  -- function num : 0_17
  return 1 - PaGlobal_AnimationEasingFun_easeOutBounce(1 - timeDelta)
end

PaGlobal_AnimationEasingFun_easeInOutBounce = function(timeDelta)
  -- function num : 0_18
  if timeDelta < 0.5 then
    return PaGlobal_AnimationEasingFun_easeInBounce(timeDelta * 2) * 0.5
  else
    return PaGlobal_AnimationEasingFun_easeOutBounce(timeDelta * 2 - 1) * 0.5 + 0.5
  end
end

PaGlobal_AnimationEasingFun_easeOutQuadFragments = function(timeDelta, fragments)
  -- function num : 0_19
  local fixtimeDelta = timeDelta - 1.2
  return -fragments * fixtimeDelta * fixtimeDelta + fragments
end


