-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\fullsizemode.luac 

-- params : ...
-- function num : 0
FullSizeMode = {}
-- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

FullSizeMode.isFullSizeWindowOn = false
-- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

FullSizeMode.fullSizeWindow = 0
-- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

FullSizeMode.fullSizeModeEnum = {Worldmap = 0, MentalKnowledge = 1, Intimacy = 2, Dialog = 3}
setFullSizeMode = function(isFull, fullSizePanel)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  FullSizeMode.isFullSizeWindowOn = isFull
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  if isFull then
    FullSizeMode.fullSizeWindow = fullSizePanel
  end
end

isFullSizeModeAble = function(fullSizePanel)
  -- function num : 0_1
  if not FullSizeMode.isFullSizeWindowOn then
    return true
  else
    return FullSizeMode.fullSizeWindow == fullSizePanel
  end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end


