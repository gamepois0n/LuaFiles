-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_control_pool.luac 

-- params : ...
-- function num : 0
ControlPool = {}
-- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

ControlPool.__index = ControlPool
-- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

ControlPool.createPool = function(parent)
  -- function num : 0_0
  if parent == nil then
    return nil
  end
  local newPool = {}
  setmetatable(newPool, ControlPool)
  newPool._parent = parent
  newPool.poolMapByControlType = {}
  newPool.poolMap = {}
  return newPool
end

-- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

ControlPool.addCategory = function(self, id, controlType, template, controlID)
  -- function num : 0_1
  local pool = (self.poolMap)[id]
  if pool ~= nil then
    return false
  end
  local poolInfo = {_template = template, _type = controlType, _count = 0, _controlID = controlID, _pool = (Array.new)()}
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (self.poolMap)[id] = poolInfo
  local managePool = (self.poolMapByControlType)[controlType]
  if managePool == nil then
    managePool = {}
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self.poolMapByControlType)[controlType] = managePool
  end
  managePool[id] = poolInfo._pool
end

-- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

ControlPool.hasCategory = function(self, id)
  -- function num : 0_2
  do return (self.poolMap)[id] ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

ControlPool.getControlTypePool = function(self, controlType)
  -- function num : 0_3
  local weakRefPool = (self.poolMapByControlType)[controlType]
  for _,pool in pairs(weakRefPool) do
    if pool:length() > 0 then
      return pool:pop_back()
    end
  end
  return nil
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

ControlPool.getOrCreateControl = function(self, id)
  -- function num : 0_4
  local poolInfo = (self.poolMap)[id]
  if poolInfo == nil then
    return nil
  end
  if (poolInfo._pool):length() > 0 then
    return (poolInfo._pool):pop_back()
  else
    local sameTypeControl = self:getControlTypePool(poolInfo._type)
    if sameTypeControl ~= nil then
      if poolInfo._template ~= nil then
        CopyBaseProperty(poolInfo._template, sameTypeControl)
      end
      return sameTypeControl
    else
      poolInfo._count = poolInfo._count + 1
      local newControl = (UI.createControl)(poolInfo._type, self._parent, poolInfo._controlID .. poolInfo._count)
      if newControl ~= nil then
        if poolInfo._template ~= nil then
          CopyBaseProperty(poolInfo._template, newControl)
        end
        newControl:SetShow(false)
        return newControl
      end
      return nil
    end
  end
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

ControlPool.returnToPool = function(self, id, control)
  -- function num : 0_5
  local poolInfo = (self.poolMap)[id]
  if poolInfo == nil then
    return false
  end
  control:SetShow(false)
  ;
  (poolInfo._pool):push_back(control)
  return true
end


