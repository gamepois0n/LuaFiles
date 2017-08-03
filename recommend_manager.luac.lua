-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\cashshopalert\recommend_manager.luac 

-- params : ...
-- function num : 0
Recommend_TYPE = {TYPE_INVENTORY = 0, TYPE_PET = 1, TYPE_WEIGHT = 2, COUNTOFTYPE = 3}
PaGlobal_RecommendManager = {_savedDelay = 0, _recommendDelay = 3600, _recommendedBefore = false, _FromRecommendManager = false, _expforCheckInCombat = 0, _type = 0, _nowRecommendedType = 0, MAXSLOT = 192, _limitedLevel = 20}
-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

if isGameTypeTaiwan() then
  PaGlobal_RecommendManager._limitedLevel = 50
end
local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
-- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.registEventHandler = function(self)
  -- function num : 0_0
  registerEvent("FromClient_isRecommedCash", "IsRecommendCash")
end

FGlobal_RecommendManager_UpdatePerFrame = function(deltaTime)
  -- function num : 0_1 , upvalues : gameOptionSetting
  if gameOptionSetting:getCashAlert() == true then
    return 
  end
  PaGlobal_RecommendManager:updatePerFrame(deltaTime)
end

FGlobal_CashShopAlert_UpdatePerFrame = function(deltaTime)
  -- function num : 0_2 , upvalues : gameOptionSetting
  if gameOptionSetting:getCashAlert() == true then
    return 
  end
  PaGlobal_RecommendManager:ShowPanel(deltaTime)
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.ShowPanel = function(self, deltaTime)
  -- function num : 0_3
  if Panel_CashShopAlert:GetShow() then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if (selfPlayer:get()):getLevel() <= self._limitedLevel then
    return 
  end
  self._savedDelay = self._savedDelay + deltaTime
  if self._recommendDelay < self._savedDelay then
    self._recommendedBefore = false
    self._savedDelay = 0
  end
  if self._recommendedBefore == true then
    return 
  end
  if self._savedDelay % 5 > 1 then
    return 
  end
  if not Panel_CashShopAlert:GetShow() then
    for key,value in pairs(Recommend_TYPE) do
      if self:ProcessRecommend(value) == true then
        self._type = value
        Panel_CashShopAlert_Show()
        return 
      end
    end
  end
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.updatePerFrame = function(self, deltaTime)
  -- function num : 0_4
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if (selfPlayer:get()):getLevel() <= self._limitedLevel then
    return 
  end
  self._savedDelay = self._savedDelay + deltaTime
  if self._recommendDelay < self._savedDelay then
    self._recommendedBefore = false
    self._savedDelay = 0
  end
  if self._recommendedBefore == true then
    return 
  end
  if self._savedDelay % 2 > 1 then
    return 
  end
  self._type = (self._type + 1) % Recommend_TYPE.COUNTOFTYPE
  self:ProcessRecommend(self._type)
  return 
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.GetNowRecommendType = function(self)
  -- function num : 0_5
  return self._nowRecommendedType
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.isFromRecommend = function(self)
  -- function num : 0_6
  return self._FromRecommendManager
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.UsedFromRecommend = function(self)
  -- function num : 0_7
  self._FromRecommendManager = false
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.ClickedRecommendButton = function(self)
  -- function num : 0_8
  self._recommendedBefore = true
  self._FromRecommendManager = true
  self._savedDelay = 0
  self._expforCheckInCombat = 0
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.ProcessRecommend = function(self, type)
  -- function num : 0_9
  -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

  if Recommend_TYPE.TYPE_INVENTORY == type and self:getInventoryisFull() == true then
    self:ChangeRecommendIconTexture(type)
    return true
  end
  -- DECOMPILER ERROR at PC24: Unhandled construct in 'MakeBoolean' P1

  if Recommend_TYPE.TYPE_PET == type and self:getHavePetNow() == true then
    self:ChangeRecommendIconTexture(type)
    return true
  end
  if Recommend_TYPE.TYPE_WEIGHT == type and self:getWeightisFull() == true then
    self:ChangeRecommendIconTexture(type)
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.ChangeRecommendIconTexture = function(self, type)
  -- function num : 0_10
  self._nowRecommendedType = type
  self._recommendedBefore = true
  self._savedDelay = 0
  Panel_CashShopAlert:ChangeTexture(type)
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RecommendManager.getInventoryisFull = function(self)
  -- function num : 0_11
  local size = (((getSelfPlayer()):get()):getInventory()):size()
  if self.MAXSLOT <= size then
    return false
  end
  do
    local cnt = (((getSelfPlayer()):get()):getInventory()):getFreeCount()
    do return cnt == 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

local weightItemList = {604, 605, 606, 607}
-- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_RecommendManager.getWeightisFull = function(self)
  -- function num : 0_12 , upvalues : weightItemList
  local mylimit = false
  for key,value in pairs(weightItemList) do
    if (getIngameCashMall()):getRemainingLimitCount(value) ~= 0 then
      mylimit = true
    end
  end
  if mylimit == false then
    return false
  end
  local selfPlayer = (getSelfPlayer()):get()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  do
    local sumtotalWeight = allWeight / maxWeight * 100
    do return sumtotalWeight >= 100 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_RecommendManager.getHavePetNow = function(self)
  -- function num : 0_13
  local HavePet = ToClient_getPetUnsealedList() + ToClient_getPetSealedList() ~= 0
  if HavePet then
    return false
  end
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
  if isSafeZone then
    if self._expforCheckInCombat ~= 0 then
      self._expforCheckInCombat = 0
    end
    return false
  end
  do
    local nowexp = ((getSelfPlayer()):get()):getExp_s64()
    if self._expforCheckInCombat == 0 then
      self._expforCheckInCombat = nowexp
    end
    if self._expforCheckInCombat ~= nowexp then
      self._expforCheckInCombat = nowexp
      return true
    end
    do return false end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Recommend_Manager")
FromClient_luaLoadComplete_Recommend_Manager = function()
  -- function num : 0_14 , upvalues : gameOptionSetting
  if gameOptionSetting:getCashAlert() == true then
    return 
  end
  Panel_CashShopAlert:RegisterUpdateFunc("FGlobal_RecommendManager_UpdatePerFrame")
  Panel_UIMain:RegisterUpdateFunc("FGlobal_CashShopAlert_UpdatePerFrame")
end


