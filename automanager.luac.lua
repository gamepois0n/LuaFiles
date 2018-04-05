-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\auto\automanager.luac 

-- params : ...
-- function num : 0
AutoStateType = {MOVE = 1, WAIT_FOR_PRESSBUTTON = 2, HUNT = 3, DIALOG_INTERACTION = 4, DEAD = 5, EXCEPTION_GUIDE = 6, TUTORIAL = 7}
PaGlobal_AutoManager = {_ActiveState = false, _stateUnit = nil, 
_storageStateUnit = {}
, _questNo = -1, _updateDelay = 0, _updateTime = 3}
-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.init = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  (self._storageStateUnit)[AutoStateType.MOVE] = AutoState_Move
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.HUNT] = AutoState_Hunt
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.WAIT_FOR_PRESSBUTTON] = AutoState_WaitForPressButton
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.DIALOG_INTERACTION] = AutoState_DialogInteraction
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.DEAD] = AutoState_Dead
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.EXCEPTION_GUIDE] = AutoState_ExceptionGuide
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.TUTORIAL] = AutoState_Tutorial
  for _,v in pairs(self._storageStateUnit) do
    v:init()
  end
  self._ActiveState = false
  self._stateUnit = nil
  self._questNo = -1
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.frameMove = function(self, deltaTime)
  -- function num : 0_1
  if self._ActiveState == false then
    return 
  end
  if self._stateUnit == nil then
    return 
  end
  ;
  (self._stateUnit):update(deltaTime)
  self._updateDelay = deltaTime + self._updateDelay
  if self._updateTime < self._updateDelay then
    self._updateDelay = 0
    self:checkException()
  end
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.start = function(self, isTutorialStart)
  -- function num : 0_2
  if ToClient_AutoPlay_UseableAutoPlay() == false then
    return 
  end
  local questList = ToClient_GetQuestList()
  if questList == nil then
    _PA_ASSERT(false, "Quest 정보�\128 nil입니�\164..AutoState_WaitForPressButton:start")
    return 
  end
  PaGlobal_AutoQuestMsg:SetShow(true)
  ;
  ((PaGlobal_AutoQuestMsg._ui)._staticBlackSpirit):EraseAllEffect()
  ;
  ((PaGlobal_AutoQuestMsg._ui)._staticBlackSpirit):AddEffect("fN_DarkSpirit_Idle_2_AutoQuest", true, -50, -70)
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo == nil then
    FGlobal_AutoQuestBlackSpiritMessage(" 현재로서�\148 메인퀘스�\184 동선으로 오토�\128 진행된다;메인퀘스�\184 없다�\180 시작�\160 �\152 없다;")
    self:stop()
    return 
  end
  self:init()
  self._ActiveState = true
  if isTutorialStart == true then
    self._stateUnit = AutoState_Tutorial
  else
    self._stateUnit = AutoState_WaitForPressButton
  end
  ;
  (self._stateUnit):start()
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  self._questNo = uiQuestInfo:getQuestNo()
  PaGlobal_AutoQuestMsg:AniStop()
  ToClient_AutoPlayerStart()
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.stop = function(self)
  -- function num : 0_3
  self._ActiveState = false
  ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).NONE)
  ToClient_AutoPlayerStop()
  Panel_MainQuest:EraseAllEffect()
  PaGlobal_AutoQuestMsg:SetShow(false)
end

Auto_FrameMove = function(deltaTime)
  -- function num : 0_4
  PaGlobal_AutoManager:frameMove(deltaTime)
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.checkException = function(self)
  -- function num : 0_5
  PaGlobal_AutoManager:checkReturnToTown()
  PaGlobal_AutoManager:checkUseToRecoverPosion()
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.checkReturnToTown = function(self)
  -- function num : 0_6
  if (self._stateUnit)._state == AutoStateType.MOVE and AutoState_Move:isReservation() == true then
    return 
  end
  local needToReturn = false
  local reserveReason = -1
  if getInventoryFreeCount() < 1 then
    needToReturn = true
    reserveReason = AutoMoveState_Type.TO_TOWN_DUE_FULLINVEN
  else
    if getWeightLevel() > 0 then
      needToReturn = true
      reserveReason = AutoMoveState_Type.TO_TOWN_DUE_TOOHEAVY
    end
  end
  if needToReturn == true then
    AutoState_Move:setReserveReason(reserveReason)
    local pos3D = getNearTownRegionPos()
    ToClient_WorldMapNaviStart(pos3D, NavigationGuideParam(), false, true)
    ToClient_NaviReStart()
  end
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.checkUseToRecoverPosion = function(self)
  -- function num : 0_7
  local selfPlayer = (getSelfPlayer()):get()
  local hp = selfPlayer:getHp()
  local maxhp = selfPlayer:getMaxHp()
  if hp / maxhp > 0.5 then
    return 
  end
  for i = 0, 19 do
    local quickSlotInfo = getQuickSlotItem(i)
    if quickSlotInfo ~= nil and ((CppEnums.QuickSlotType).eItem == quickSlotInfo._type or (CppEnums.QuickSlotType).eCashItem == quickSlotInfo._type) then
      local itemKey = (quickSlotInfo._itemKey):get()
      for hpIdx = 0, #potionData.hp - 1 do
        if itemKey == (potionData.hp)[hpIdx] then
          local inventoryType = QuickSlot_GetInventoryTypeFrom(quickSlotInfo._type)
          local inventory = selfPlayer:getInventoryByType(inventoryType)
          local invenSlotNo = inventory:getSlot(quickSlotInfo._itemKey)
          local itemInfoWrapper = (getInventoryItemByType(inventoryType, invenSlotNo))
          local itemInfo = nil
          if itemInfoWrapper ~= nil then
            itemInfo = itemInfoWrapper:get()
          end
          if itemInfo ~= nil and itemInfo:getCount_s64() ~= 0 and quickSlot_UseSlot(i) == false then
            FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_DRUG_POTION"))
          end
        end
      end
    end
  end
end

Auto_TransferState = function(typeState)
  -- function num : 0_8
  local self = PaGlobal_AutoManager
  if self._ActiveState == false then
    return 
  end
  do
    if self._stateUnit == nil then
      local traceString = (debug.traceback)()
      traceString = (string.gsub)(traceString, "d:/output/dev/UI_Data/Script/", "")
      _PA_LOG("박규�\152", "traceBack:" .. traceString)
      return 
    end
    if (self._stateUnit)._state == typeState then
      return 
    end
    ;
    (self._stateUnit):endProc()
    self._stateUnit = (self._storageStateUnit)[typeState]
    ;
    (self._stateUnit):start()
  end
end

Auto_QuestClearNotify = function(questNo)
  -- function num : 0_9
  local self = PaGlobal_AutoManager
  if self._ActiveState and self._questNo == questNo then
    self:stop()
    FGlobal_AutoQuestBlackSpiritMessage("퀘스트가 완료되어 오토 종료")
  end
end

Auto_NotifyChangeDialog = function()
  -- function num : 0_10
  local self = PaGlobal_AutoManager
  if self._ActiveState and (self._stateUnit)._state == AutoStateType.DIALOG_INTERACTION then
    AutoState_DialogInteraction:NotifyChangeDialog()
  end
end


