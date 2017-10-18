-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\automanager.luac 

-- params : ...
-- function num : 0
AutoStateType = {IDLE = 1, MOVE = 2, WAIT_FOR_PRESSBUTTON = 3, HUNT = 4, DIALOG_INTERACTION = 5, DEAD = 6, EXCEPTION_GUIDE = 7}
AutoStateName = {"IDLE", "MOVE", "WAIT_FOR_PRESSBUTTON", "HUNT", "DIALOG_INTERACTION", "DEAD", "EXCEPTION_GUIDE"}
PaGlobal_AutoManager = {_ActiveState = false, 
_stateUnit = {}
, 
_storageStateUnit = {}
, _questNo = -1, _updateDelay = 0, _updateTime = 3}
-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.init = function(self)
  -- function num : 0_0
  AutoState_Idle:init()
  AutoState_Move:init()
  AutoState_Hunt:init()
  AutoState_WaitForPressButton:init()
  AutoState_DialogInteraction:init()
  AutoState_Dead:init()
  AutoState_ExceptionGuide:init()
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.IDLE] = AutoState_Idle
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.MOVE] = AutoState_Move
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.HUNT] = AutoState_Hunt
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.WAIT_FOR_PRESSBUTTON] = AutoState_WaitForPressButton
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.DIALOG_INTERACTION] = AutoState_DialogInteraction
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.DEAD] = AutoState_Dead
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.EXCEPTION_GUIDE] = AutoState_ExceptionGuide
  self._ActiveState = false
  self._stateUnit = {}
  _questNo = -1
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.frameMove = function(self, deltaTime)
  -- function num : 0_1
  if self._ActiveState == false or self._stateUnit == nil then
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

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.start = function(self)
  -- function num : 0_2
  if ToClient_IsContentsGroupOpen("301") == false then
    return 
  end
  local questList = ToClient_GetQuestList()
  if questList == nil then
    _PA_ASSERT(false, "Quest 정보�\128 nil입니�\164..AutoState_WaitForPressButton:start")
    return 
  end
  ;
  ((PaGlobal_AutoQuestMsg._ui)._staticBlackSpirit):SetShow(true)
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
  self._stateUnit = AutoState_WaitForPressButton
  ;
  (self._stateUnit):start()
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  self._questNo = uiQuestInfo:getQuestNo()
  FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_START"))
  PaGlobal_AutoQuestMsg:AniStop()
  FGlobal_AutoQuestBlakcSpirit_Hide()
  ToClient_AutoPlayerStart()
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.stop = function(self)
  -- function num : 0_3
  _PA_LOG("�\128규보", "Auto stop")
  self._ActiveState = false
  ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).NONE)
  ToClient_AutoPlayerStop()
  FGlobal_AutoQuestBlakcSpirit_Hide()
end

Auto_FrameMove = function(deltaTime)
  -- function num : 0_4
  PaGlobal_AutoManager:frameMove(deltaTime)
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.checkException = function(self)
  -- function num : 0_5
  PaGlobal_AutoManager:checkReturnToTown()
  PaGlobal_AutoManager:checkUseToRecoverPosion()
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.checkUseToRecoverPosion = function(self)
  -- function num : 0_7
  local selfPlayer = (getSelfPlayer()):get()
  local hp = selfPlayer:getHp()
  local maxhp = selfPlayer:getMaxHp()
  if hp / maxhp < 0.5 then
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
end

Auto_TransferState = function(typeState)
  -- function num : 0_8
  if PaGlobal_AutoManager._stateUnit == false then
    return 
  end
  if PaGlobal_AutoManager._stateUnit ~= nil then
    _PA_LOG("�\128규보", "before: " .. AutoStateName[(PaGlobal_AutoManager._stateUnit)._state] .. "    after: " .. AutoStateName[typeState])
  end
  local traceString = (debug.traceback)()
  traceString = (string.gsub)(traceString, "d:/output/dev/UI_Data/Script/", "")
  _PA_LOG("�\128규보", "traceBack:" .. traceString)
  if (PaGlobal_AutoManager._stateUnit)._state == typeState then
    return 
  end
  ;
  (PaGlobal_AutoManager._stateUnit):endProc()
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

  PaGlobal_AutoManager._stateUnit = (PaGlobal_AutoManager._storageStateUnit)[typeState]
  ;
  (PaGlobal_AutoManager._stateUnit):start()
end

Auto_QuestClearNotify = function(questNo)
  -- function num : 0_9
  if PaGlobal_AutoManager._ActiveState and PaGlobal_AutoManager._questNo == questNo then
    PaGlobal_AutoManager:stop()
    FGlobal_AutoQuestBlackSpiritMessage("퀘스트가 완료되어 오토 종료")
  end
end

Auto_NotifyChangeDialog = function()
  -- function num : 0_10
  if PaGlobal_AutoManager._ActiveState and (PaGlobal_AutoManager._stateUnit)._state == AutoStateType.DIALOG_INTERACTION then
    AutoState_DialogInteraction:NotifyChangeDialog()
  end
end


