-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\rendermode\rendermode.luac 

-- params : ...
-- function num : 0
RenderModeWrapper = {}
-- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

RenderModeWrapper.__index = RenderModeWrapper
local RenderModeCloseList = (Array.new)()
-- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

RenderModeWrapper.new = function(order, renderModeList, isAppending)
  -- function num : 0_0 , upvalues : RenderModeCloseList
  if renderModeList == nil then
    return nil
  end
  if order == nil then
    return nil
  end
  if isAppending == nil then
    isAppending = false
  end
  local newWrapper = {}
  setmetatable(newWrapper, RenderModeWrapper)
  newWrapper:setKey(-1)
  newWrapper._isAppending = isAppending
  newWrapper._order = order
  newWrapper._renderModeValue = PAUIRenderModeBitSet(renderModeList)
  newWrapper._closeFunctor = nil
  newWrapper._preFunctor = nil
  RenderModeCloseList:push_back(newWrapper)
  return newWrapper
end

-- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

RenderModeWrapper.setKey = function(self, key)
  -- function num : 0_1
  self._renderModekey = key
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

RenderModeWrapper.getKey = function(self)
  -- function num : 0_2
  return self._renderModekey
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

RenderModeWrapper.setClosefunctor = function(self, renderMode, functor)
  -- function num : 0_3
  self._closeFunctor = functor
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

RenderModeWrapper.setPrefunctor = function(self, renderMode, functor)
  -- function num : 0_4
  self._preFunctor = functor
end

RenderModeAllClose = function()
  -- function num : 0_5 , upvalues : RenderModeCloseList
  for key,value in pairs(RenderModeCloseList) do
    if value:getKey() ~= -1 then
      (value._closeFunctor)()
    end
  end
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

RenderModeWrapper.set = function(self)
  -- function num : 0_6
  if self._preFunctor ~= nil then
    (self._preFunctor)()
  end
  self:reset()
  self:setKey(ToClient_SetUIRenderMode(self._order, self._renderModeValue))
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

RenderModeWrapper.reset = function(self)
  -- function num : 0_7
  if self._renderModekey == nil or self._renderModekey < 0 then
    return 
  end
  ToClient_ResetRenderMode(self._renderModekey)
  self._renderModekey = -1
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

RenderModeWrapper.setRenderMode = function(self, renderModeList)
  -- function num : 0_8
  if renderModeList == nil then
    return 
  end
  self._renderModeValue = PAUIRenderModeBitSet(renderModeList)
end

local default_renderModeList = {(Defines.RenderMode).eRenderMode_Default}
CheckRenderModebyGameMode = function(nextRenderModeList)
  -- function num : 0_9 , upvalues : default_renderModeList
  return CheckRenderMode(nextRenderModeList, default_renderModeList)
end

CheckRenderMode = function(nextRenderModeList, renderModeArray)
  -- function num : 0_10
  for key,renderModevalue in pairs(nextRenderModeList) do
    for key2,arrayValue in pairs(renderModeArray) do
      if renderModevalue == arrayValue then
        return true
      end
    end
  end
  return false
end


