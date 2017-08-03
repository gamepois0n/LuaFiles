-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\npcworker\workerluawrapper.luac 

-- params : ...
-- function num : 0
local workerNoUndefined = 0
local appliedStat = NpcWorkerSkillAppliedStat()
local checkData = PlantWorkerPassiveSkillCheckData(appliedStat)
local workerWrapper = {}
workerWrapper.__index = workerWrapper
workerWrapper.init = function(self, workerNoRaw, callReflesh)
  -- function num : 0_0
  self:initOnly(workerNoRaw, callReflesh)
  self:setClientValue()
end

workerWrapper.initOnly = function(self, workerNoRaw, callReflesh)
  -- function num : 0_1
  self._workerNoRaw = workerNoRaw
  if callReflesh == nil then
    self._callReflesh = true
  else
    self._callReflesh = callReflesh
  end
end

workerWrapper.reflesh = function(self)
  -- function num : 0_2
  if self._callReflesh == false then
    return 
  end
  self:setClientValue()
end

workerWrapper.isWorking = function(self)
  -- function num : 0_3
  do return self._workingWrapper ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

workerWrapper.isValid = function(self)
  -- function num : 0_4
  do return self._workerWrapper ~= nil and (self._workerWrapper):get() ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

workerWrapper.setClientValue = function(self)
  -- function num : 0_5
  self._workerWrapper = ToClient_getNpcWorkerByWorkerNo(self._workerNoRaw)
  self._workingWrapper = ToClient_getNpcWorkingByWorkerNo(self._workerNoRaw)
end

workerWrapper.getWorkerWrapper = function(self)
  -- function num : 0_6
  return self._workerWrapper
end

workerWrapper.getWorkingCount = function(self)
  -- function num : 0_7
  self:reflesh()
  return self:getWorkingCountXXX()
end

workerWrapper.getWorkingCountXXX = function(self)
  -- function num : 0_8
  return ToClient_getNpcWorkerWorkingCount(self._workerNoRaw)
end

workerWrapper.getLeftWorkingTime = function(self)
  -- function num : 0_9
  self:reflesh()
  return self:getLeftWorkingTimeXXX(getServerUtc64())
end

workerWrapper.getLeftWorkingTimeXXX = function(self, serverUtc64)
  -- function num : 0_10
  if self:isWorking() == false then
    return 0
  end
  return Int64toInt32((self._workingWrapper):getLeftWorkTime(serverUtc64))
end

workerWrapper.isWorkTimeUnlimitXXX = function(self)
  -- function num : 0_11
  if self:isWorking() == false then
    return true
  end
  return (self._workingWrapper):isWorkTimeUnlimit()
end

workerWrapper.getTotalWorkTime = function(self)
  -- function num : 0_12
  self:reflesh()
  return self:getTotalWorkTimeXXX(getServerUtc64())
end

workerWrapper.getTotalWorkTimeXXX = function(self, serverUtc64)
  -- function num : 0_13
  if self:isWorking() == false then
    return 0
  end
  return Int64toInt32((self._workingWrapper):getTotalWorkTime(serverUtc64))
end

workerWrapper.getWorkingState = function(self)
  -- function num : 0_14
  self:reflesh()
  return self:getWorkingStateXXX()
end

workerWrapper.getWorkingStateXXX = function(self)
  -- function num : 0_15
  if self:isWorking() == false then
    return (CppEnums.NpcWorkingState).eNpcWorkingState_Undefined
  end
  return (self._workingWrapper):getWorkingState()
end

workerWrapper.currentProgressPercents = function(self)
  -- function num : 0_16
  self:reflesh()
  if self:isWorking() == false then
    return 0
  end
  if self:isWorkTimeUnlimitXXX() then
    return 0
  end
  local serverUtc64 = getServerUtc64()
  local working_LeftTime = self:getLeftWorkingTimeXXX(serverUtc64)
  local working_TotalTime = self:getTotalWorkTimeXXX(serverUtc64)
  if working_TotalTime == 0 then
    return 0
  end
  return 100 - working_LeftTime / working_TotalTime * 100
end

workerWrapper.getWorkStringOnlyTarget = function(self)
  -- function num : 0_17
  self:reflesh()
  local workString = ""
  if self:isWorking() then
    local working_LeftTime = 0
    local isWorkTimeUnlimit = self:isWorkTimeUnlimitXXX()
    if isWorkTimeUnlimit == false then
      working_LeftTime = self:getLeftWorkingTimeXXX(getServerUtc64())
    end
    if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantZone) or (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouse) or (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouseLargeCraft) then
      local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(self._workerNoRaw)
      if esSSW ~= nil then
        workString = "(" .. (self._workingWrapper):getWorkingNodeName() .. ")"
      end
    else
      do
        if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantBuliding) then
          local name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_BULDINGTYPE_FORTRESS")
          local characterSSW = (self._workingWrapper):getBuildingCharacterInfo()
          if characterSSW ~= nil then
            name = characterSSW:getName()
          end
          workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " <PAColor0xffd0ee68>[" .. name .. "]<PAOldColor>"
        else
          do
            if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_Upgrade) then
              workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_UPGRADE")
            else
              if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_GuildHouseLargeCraft) then
                local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(self._workerNoRaw)
                if esSSW ~= nil then
                  local _leftWorkCount = self:getWorkingCountXXX()
                  if _leftWorkCount > 0 then
                    workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " [" .. esSSW:getDescription() .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_LEFTWORKCOUNT", "leftWorkCount", _leftWorkCount + 1) .. "]"
                  else
                    workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " [" .. esSSW:getDescription() .. "]"
                  end
                end
              else
                do
                  if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_HarvestWorking) then
                    if isWorkTimeUnlimit == false then
                      workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000))
                    end
                    local workingState = self:getWorkingStateXXX()
                    if (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_MoveTo == workingState then
                      workString = workString .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_GOHARVEST")
                    else
                      if (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_Working == workingState then
                        workString = workString .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_HARVESTMANAGING")
                      else
                        if (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_Return == workingState then
                          workString = workString .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_GOHOME")
                        end
                      end
                    end
                  end
                  do
                    if self:getIsAuctionInsert() then
                      workString = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_MARKETREGIST")
                    else
                      workString = ""
                    end
                    return workString
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

workerWrapper.getWorkString = function(self)
  -- function num : 0_18
  self:reflesh()
  local workString = ""
  if self:isWorking() then
    local working_LeftTime = 0
    local isWorkTimeUnlimit = self:isWorkTimeUnlimitXXX()
    if isWorkTimeUnlimit == false then
      working_LeftTime = self:getLeftWorkingTimeXXX(getServerUtc64())
    end
    if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantZone) or (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouse) or (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouseLargeCraft) then
      local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(self._workerNoRaw)
      if esSSW ~= nil then
        local _leftWorkCount = self:getWorkingCountXXX()
        if _leftWorkCount > 0 then
          workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " [" .. esSSW:getDescription() .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_LEFTWORKCOUNT", "leftWorkCount", _leftWorkCount + 1) .. "]"
        else
          workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " [" .. esSSW:getDescription() .. "]"
        end
      end
    else
      do
        if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantBuliding) then
          local name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_BULDINGTYPE_FORTRESS")
          local characterSSW = (self._workingWrapper):getBuildingCharacterInfo()
          if characterSSW ~= nil then
            name = characterSSW:getName()
          end
          workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " <PAColor0xffd0ee68>[" .. name .. "]<PAOldColor>"
        else
          do
            if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_Upgrade) then
              workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_UPGRADE")
            else
              if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_GuildHouseLargeCraft) then
                local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(self._workerNoRaw)
                if esSSW ~= nil then
                  local _leftWorkCount = self:getWorkingCountXXX()
                  if _leftWorkCount > 0 then
                    workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " [" .. esSSW:getDescription() .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_LEFTWORKCOUNT", "leftWorkCount", _leftWorkCount + 1) .. "]"
                  else
                    workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000)) .. " [" .. esSSW:getDescription() .. "]"
                  end
                end
              else
                do
                  if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_HarvestWorking) then
                    if isWorkTimeUnlimit == false then
                      workString = ((Util.Time).timeFormatting)((math.ceil)(working_LeftTime / 1000))
                    end
                    local workingState = self:getWorkingStateXXX()
                    if (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_MoveTo == workingState then
                      workString = workString .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_GOHARVEST")
                    else
                      if (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_Working == workingState then
                        workString = workString .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_HARVESTMANAGING")
                      else
                        if (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_Return == workingState then
                          workString = workString .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_GOHOME")
                        end
                      end
                    end
                  end
                  do
                    if self:getIsAuctionInsert() then
                      workString = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_MARKETREGIST")
                    else
                      local workerRegionWrapper = ToClient_getRegionInfoWrapper((self._workerWrapper):get())
                      local isWorkInTrade = (self._workerWrapper):isWorkerInWorkerTrade()
                      if isWorkInTrade == true then
                        workString = "일꾼 무역 �\145"
                      else
                        workString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERLUAWRAPPER_WORKER_WAITING", "getAreaName", workerRegionWrapper:getAreaName())
                      end
                    end
                    do
                      return workString
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

workerWrapper.getWorkingType = function(self)
  -- function num : 0_19
  self:reflesh()
  local workingType = nil
  if self:isWorking() then
    if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantZone) then
      workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_PlantZone
    else
      if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_Upgrade) then
        workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_Upgrade
      else
        if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouse) then
          workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouse
        else
          if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_ChangeTown) then
            workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_ChangeTown
          else
            if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantBuliding) then
              workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_PlantBuliding
            else
              if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_RegionManaging) then
                workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_RegionManaging
              else
                if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouseLargeCraft) then
                  workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouseLargeCraft
                else
                  if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_HouseParty) then
                    workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_HouseParty
                  else
                    if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_GuildHouseLargeCraft) then
                      workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_GuildHouseLargeCraft
                    else
                      if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_HarvestWorking) then
                        workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_HarvestWorking
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  else
    workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_Count
  end
  return workingType
end

workerWrapper.getName = function(self)
  -- function num : 0_20
  self:reflesh()
  return (self._workerWrapper):getName()
end

workerWrapper.getLevel = function(self)
  -- function num : 0_21
  self:reflesh()
  return ((self._workerWrapper):get()):getLevel()
end

workerWrapper.getExperience = function(self)
  -- function num : 0_22
  self:reflesh()
  return ((self._workerWrapper):get()):getExperience()
end

workerWrapper.getMaxExperience = function(self)
  -- function num : 0_23
  self:reflesh()
  return ((self._workerWrapper):get()):getMaxExperience()
end

workerWrapper.getHomeWaypoint = function(self)
  -- function num : 0_24
  self:reflesh()
  return ((self._workerWrapper):get()):getHomeWaypoint()
end

workerWrapper.getActionPoint = function(self)
  -- function num : 0_25
  self:reflesh()
  return self:getActionPointXXX()
end

workerWrapper.getActionPointXXX = function(self)
  -- function num : 0_26
  return ((self._workerWrapper):get()):getActionPoint()
end

workerWrapper.getMaxActionPoint = function(self)
  -- function num : 0_27
  self:reflesh()
  return self:getMaxActionPointXXX()
end

workerWrapper.getMaxActionPointXXX = function(self)
  -- function num : 0_28
  return (((self._workerWrapper):get()):getWorkerStaticStatus())._actionPoint
end

workerWrapper.getActionPointPercents = function(self)
  -- function num : 0_29
  self:reflesh()
  return self:getActionPointXXX() / self:getMaxActionPointXXX() * 100
end

workerWrapper.getGrade = function(self)
  -- function num : 0_30
  self:reflesh()
  return self:getGradeXXX()
end

workerWrapper.getGradeXXX = function(self)
  -- function num : 0_31
  return (((((self._workerWrapper):get()):getWorkerStaticStatus()):getCharacterStaticStatus())._gradeType):get()
end

workerWrapper.getUpgradePoint = function(self)
  -- function num : 0_32
  self:reflesh()
  return ((self._workerWrapper):get()):getUpgradePoint()
end

workerWrapper.getGradeToColor = function(self)
  -- function num : 0_33
  local grade = self:getGradeXXX()
  if (CppEnums.CharacterGradeType).CharacterGradeType_Normal == grade then
    return (Defines.Color).C_FFC4BEBE
  else
    if (CppEnums.CharacterGradeType).CharacterGradeType_Elite == grade then
      return (Defines.Color).C_FF5DFF70
    else
      if (CppEnums.CharacterGradeType).CharacterGradeType_Hero == grade then
        return (Defines.Color).C_FF4B97FF
      else
        if (CppEnums.CharacterGradeType).CharacterGradeType_Legend == grade then
          return (Defines.Color).C_FFFFC832
        else
          if (CppEnums.CharacterGradeType).CharacterGradeType_Boss == grade then
            return (Defines.Color).C_FFFF6C00
          else
            if (CppEnums.CharacterGradeType).CharacterGradeType_Assistant == grade then
              return (Defines.Color).C_FFC4BEBE
            end
          end
        end
      end
    end
  end
  return (Defines.Color).C_FFC4BEBE
end

workerWrapper.getGradeToColorString = function(self)
  -- function num : 0_34
  local grade = self:getGradeXXX()
  if (CppEnums.CharacterGradeType).CharacterGradeType_Normal == grade then
    return "<PAColor0xffc4bebe>"
  else
    if (CppEnums.CharacterGradeType).CharacterGradeType_Elite == grade then
      return "<PAColor0xFF5DFF70>"
    else
      if (CppEnums.CharacterGradeType).CharacterGradeType_Hero == grade then
        return "<PAColor0xFF4B97FF>"
      else
        if (CppEnums.CharacterGradeType).CharacterGradeType_Legend == grade then
          return "<PAColor0xFFFFC832>"
        else
          if (CppEnums.CharacterGradeType).CharacterGradeType_Boss == grade then
            return "<PAColor0xFFFF6C00>"
          else
            if (CppEnums.CharacterGradeType).CharacterGradeType_Assistant == grade then
              return "<PAColor0xffc4bebe>"
            end
          end
        end
      end
    end
  end
  return "<PAColor0xffc4bebe>"
end

workerWrapper.requestUpgrade = function(self)
  -- function num : 0_35
  return ToClient_requestStartUpgrade(self._workerNoRaw)
end

workerWrapper.isUpgradable = function(self)
  -- function num : 0_36
  self:reflesh()
  return ((self._workerWrapper):get()):isUpgradable()
end

workerWrapper.getIsAuctionInsert = function(self)
  -- function num : 0_37
  self:reflesh()
  return ((self._workerWrapper):get()):getIsAuctionInsert()
end

workerWrapper.isSellable = function(self)
  -- function num : 0_38
  self:reflesh()
  return ((self._workerWrapper):get()):isSellable()
end

workerWrapper.checkValidWorkerPrice = function(self, price)
  -- function num : 0_39
  self:reflesh()
  do return ((self._workerWrapper):get()):checkValidWorkerPrice(toInt64(0, price)) == 0 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

workerWrapper.getWorkerMinPrice = function(self)
  -- function num : 0_40
  self:reflesh()
  return Int64toInt32((self._workerWrapper):getWorkerMinPrice())
end

workerWrapper.getWorkerMaxPrice = function(self)
  -- function num : 0_41
  self:reflesh()
  return Int64toInt32((self._workerWrapper):getWorkerMaxPrice())
end

workerWrapper.getMoveSpeedWithSkill = function(self, workingType, houseUseType, waypointKey)
  -- function num : 0_42
  self:reflesh()
  if self._workerWrapper == nil or (self._workerWrapper):get() == nil then
    return 0
  end
  local checkData = ((self._workerWrapper):get()):getStaticSkillCheckData()
  checkData:set(workingType, houseUseType, waypointKey)
  checkData._diceCheckForceSuccess = true
  return (self._workerWrapper):getMoveSpeedWithSkill(checkData)
end

workerWrapper.getMoveSpeed = function(self)
  -- function num : 0_43
  self:reflesh()
  return ((self._workerWrapper):get()):getMoveSpeed()
end

workerWrapper.getWorkEfficienceWithSkill = function(self, workingType, houseUseType, waypointKey, productCategory)
  -- function num : 0_44
  self:reflesh()
  if self._workerWrapper == nil or (self._workerWrapper):get() == nil then
    return 0
  end
  local checkData = ((self._workerWrapper):get()):getStaticSkillCheckData()
  checkData:set(workingType, houseUseType, waypointKey)
  checkData._diceCheckForceSuccess = true
  return (self._workerWrapper):getWorkEfficienceWithSkill(checkData, productCategory)
end

workerWrapper.getWorkEfficiency = function(self, productCategory)
  -- function num : 0_45
  self:reflesh()
  return ((self._workerWrapper):get()):getWorkEfficiency(productCategory)
end

workerWrapper.getLuckWithSkill = function(self, workingType, houseUseType, waypointKey)
  -- function num : 0_46
  self:reflesh()
  if self._workerWrapper == nil or (self._workerWrapper):get() == nil then
    return 0
  end
  local checkData = ((self._workerWrapper):get()):getStaticSkillCheckData()
  checkData:set(workingType, houseUseType, waypointKey)
  checkData._diceCheckForceSuccess = true
  return (self._workerWrapper):getLuckWithSkill(checkData)
end

workerWrapper.getAdditionalRepeatCount = function(self, workingType, houseUseType, waypointKey, itemExchangeKeyRaw)
  -- function num : 0_47
  self:reflesh()
  if self._workerWrapper == nil or (self._workerWrapper):get() == nil then
    return 0
  end
  local checkData = ((self._workerWrapper):get()):getStaticSkillCheckData()
  checkData:set(workingType, houseUseType, waypointKey)
  checkData:setItemExchangeStaticStatus(ItemExchangeKey(itemExchangeKeyRaw))
  checkData._diceCheckForceSuccess = true
  return (self._workerWrapper):getAdditionalRepeatCount(checkData)
end

workerWrapper.getLuck = function(self)
  -- function num : 0_48
  self:reflesh()
  return ((self._workerWrapper):get()):getLuck()
end

workerWrapper.getWorkerIcon = function(self)
  -- function num : 0_49
  self:reflesh()
  return getWorkerIcon(((self._workerWrapper):get()):getWorkerStaticStatus())
end

workerWrapper.getWorkerDefaultSkillStaticStatus = function(self)
  -- function num : 0_50
  self:reflesh()
  return ((self._workerWrapper):get()):getWorkerDefaultSkillStaticStatus()
end

workerWrapper.getSkillCount = function(self)
  -- function num : 0_51
  self:reflesh()
  return ((self._workerWrapper):get()):getSkillCount()
end

workerWrapper.foreachSkillList = function(self, functor)
  -- function num : 0_52
  if functor == nil then
    return 
  end
  self:reflesh()
  local skillCount = ((self._workerWrapper):get()):getSkillCount()
  for index = 0, skillCount - 1 do
    local skillSSW = ((self._workerWrapper):get()):getWorkerSkillStaticStatusByIndex(index)
    local isStop = functor(index, skillSSW)
    if isStop then
      return 
    end
  end
end

workerWrapper.getSkillSSW = function(self, idx)
  -- function num : 0_53
  self:reflesh()
  local skillSSW = ((self._workerWrapper):get()):getWorkerSkillStaticStatusByIndex(idx)
  return skillSSW
end

workerWrapper.isMine = function(self)
  -- function num : 0_54
  do return ToClient_getNpcWorkerByWorkerNo(self._workerNoRaw) ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

workerWrapper.getIsSellable = function(self)
  -- function num : 0_55
  self:reflesh()
  return (self._workerWrapper):getIsSellable()
end

workerWrapper.isWorkerRepeatable = function(self)
  -- function num : 0_56
  self:reflesh()
  return (self._workerWrapper):isWorkerRepeatable()
end

workerWrapper.getWorkerRepeatableWorkingWrapper = function(self)
  -- function num : 0_57
  self:reflesh()
  return (self._workerWrapper):getWorkerRepeatableWorkingWrapper()
end

workerWrapper.isWorkingable = function(self, toWaypointKey)
  -- function num : 0_58
  self:reflesh()
  if self._workerWrapper == nil then
    return false
  end
  return (self._workerWrapper):isWorkingable(toWaypointKey)
end

workerWrapper.checkPossibleChangesSkillKey = function(self)
  -- function num : 0_59
  self:reflesh()
  if self._workerWrapper == nil then
    return false
  end
  return (self._workerWrapper):checkPossibleChangesSkillKey()
end

workerWrapper.getNeedExperienceByChangeSkill = function(self)
  -- function num : 0_60
  self:reflesh()
  if self._workerWrapper == nil then
    return 0
  end
  return (self._workerWrapper):getNeedExperienceByChangeSkill()
end

workerWrapper.getWorkingNodeDescXXX = function(self)
  -- function num : 0_61
  local workString = ""
  if self:isWorking() then
    local working_LeftTime = 0
    local isWorkTimeUnlimit = self:isWorkTimeUnlimitXXX()
    if isWorkTimeUnlimit == false then
      working_LeftTime = self:getLeftWorkingTimeXXX(getServerUtc64())
    end
    if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantZone) then
      local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(self._workerNoRaw)
      if esSSW ~= nil then
        workString = (self._workingWrapper):getWorkingNodeDesc()
      end
    else
      do
        do
          if (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouse) or (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouseLargeCraft) or (self._workingWrapper):isType((CppEnums.NpcWorkingType).eNpcWorkingType_GuildHouseLargeCraft) then
            local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(self._workerNoRaw)
            if esSSW ~= nil then
              workString = (self._workingWrapper):getWorkingNodeName()
            end
          end
          workString = ""
          return workString
        end
      end
    end
  end
end

workerWrapper.getWorkingNodeDesc = function(self)
  -- function num : 0_62
  self:reflesh()
  return self:getWorkingNodeDescXXX()
end

local getWorkerWrapperOnlyInit = function(workerNoRaw, callReflesh)
  -- function num : 0_63 , upvalues : workerNoUndefined, workerWrapper
  if workerNoRaw == nil or workerNoUndefined == workerNoRaw then
    return nil
  end
  local copyValue = {}
  setmetatable(copyValue, workerWrapper)
  copyValue:initOnly(workerNoRaw, callReflesh)
  return copyValue
end

getWorkerWrapper = function(workerNoRaw, callReflesh)
  -- function num : 0_64 , upvalues : workerNoUndefined, workerWrapper
  if workerNoRaw == nil or workerNoUndefined == workerNoRaw then
    return nil
  end
  local copyValue = {}
  setmetatable(copyValue, workerWrapper)
  copyValue:init(workerNoRaw, callReflesh)
  if copyValue:isValid() == false then
    return nil
  end
  return copyValue
end

getWorkerWrapperByAuction = function(workerNoRaw, callReflesh)
  -- function num : 0_65 , upvalues : workerNoUndefined, workerWrapper
  if workerNoRaw == nil or workerNoUndefined == workerNoRaw then
    return nil
  end
  local copyValue = {}
  setmetatable(copyValue, workerWrapper)
  copyValue.setClientValue = function(self)
    -- function num : 0_65_0
    self._workerWrapper = (RequestGetAuctionInfo()):getWorkerWrapper(self._workerNoRaw)
    self._workingWrapper = nil
  end

  copyValue:init(workerNoRaw, callReflesh)
  if copyValue:isValid() == false then
    return nil
  end
  return copyValue
end

getGuildHouseWaitWorkerWrapperList = function(receipeKeyRaw)
  -- function num : 0_66 , upvalues : getWorkerWrapperOnlyInit
  local wrapperList = (Array.new)()
  local count = ToClient_getGuildHouseLargeCraftWaitWorkerListCount(receipeKeyRaw) - 1
  for index = 0, count do
    local workerNoRaw = ToClient_getGuildHouseLargeCraftWorkerIndex(index)
    local workerLuaWrapper = getWorkerWrapperOnlyInit(workerNoRaw, true)
    if workerLuaWrapper ~= nil then
      wrapperList:push_back({wrapper = workerLuaWrapper, NoRaw = workerNoRaw})
    end
  end
  return wrapperList
end

getGuildHouseWorkingWorkerWrapperList = function(receipeKeyRaw, exchangeKeyRaw)
  -- function num : 0_67 , upvalues : getWorkerWrapperOnlyInit
  local wrapperList = (Array.new)()
  local count = ToClient_getGuildHouseLargeCraftWorkingWorkerListCount(receipeKeyRaw, exchangeKeyRaw) - 1
  for index = 0, count do
    local workerNoRaw = ToClient_getGuildHouseLargeCraftWorkerIndex(index)
    local workerLuaWrapper = getWorkerWrapperOnlyInit(workerNoRaw, true)
    if workerLuaWrapper ~= nil then
      wrapperList:push_back({wrapper = workerLuaWrapper, NoRaw = workerNoRaw})
    end
  end
  return wrapperList
end

getWaitWorkerFullList = function(plantKey)
  -- function num : 0_68
  local plantArray = (Array.new)()
  local workerArray = (Array.new)()
  if plantKey ~= nil then
    plantArray:push_back(plantKey)
  else
    local plantConut = ToCleint_getHomePlantKeyListCount()
    for plantIdx = 0, plantConut - 1 do
      local plantKeyRaw = ToCleint_getHomePlantKeyListByIndex(plantIdx)
      local plantKey = PlantKey()
      plantKey:setRaw(plantKeyRaw)
      plantArray:push_back(plantKey)
    end
  end
  do
    local plantSort_do = function(a, b)
    -- function num : 0_68_0
    do return a:get() < b:get() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

    ;
    (table.sort)(plantArray, plantSort_do)
    for plantRawIdx = 1, #plantArray do
      local plantKey = plantArray[plantRawIdx]
      local plantWorkerCount = ToClient_getPlantWaitWorkerListCount(plantKey, 0)
      local workerHouseCount = ToClient_getTownWorkerMaxCapacity(plantKey)
      if workerHouseCount < plantWorkerCount then
        plantWorkerCount = workerHouseCount
      end
      for workerIdx = 0, plantWorkerCount - 1 do
        local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(plantKey, workerIdx)
        workerArray:push_back(workerNoRaw)
      end
    end
    return workerArray
  end
end


