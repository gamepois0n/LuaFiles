-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\automanager.luac 

-- params : ...
-- function num : 0
AutoStateType = {IDLE = 1, MOVE = 2, WAIT_FOR_PRESSBUTTON = 3, HUNT = 4, DIALOG_INTERACTION = 5, DEAD = 6}
AutoStateName = {"IDLE", "MOVE", "Wait_For_PressButton", "Hunt", "Dialog_Interaction", "Dead"}
PaGlobal_AutoManager = {_ActiveState = false, 
_stateUnit = {}
, 
_storageStateUnit = {}
, _questNo = -1, _updateDelay = 0, _updateTime = 3}
-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.init = function(self)
  -- function num : 0_0
  AutoState_Idle:init()
  AutoState_Move:init()
  AutoState_Hunt:init()
  AutoState_WaitForPressButton:init()
  AutoState_DialogInteraction:init()
  AutoState_Dead:init()
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.IDLE] = AutoState_Idle
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.MOVE] = AutoState_Move
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.HUNT] = AutoState_Hunt
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.WAIT_FOR_PRESSBUTTON] = AutoState_WaitForPressButton
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.DIALOG_INTERACTION] = AutoState_DialogInteraction
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._storageStateUnit)[AutoStateType.DEAD] = AutoState_Dead
  self._ActiveState = false
  self._stateUnit = AutoState_WaitForPressButton
  _questNo = -1
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.start = function(self)
  -- function num : 0_2
  local questList = ToClient_GetQuestList()
  if questList == nil then
    _PA_ASSERT(false, "Quest 정보�\128 nil입니�\164..AutoState_WaitForPressButton:start")
    return 
  end
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo == nil then
    FGlobal_AutoQuestBlackSpiritMessage(" 현재로서�\148 메인퀘스�\184 동선으로 오토�\128 진행된다;메인퀘스�\184 없다�\180 시작�\160 �\152 없다;")
    self:stop()
    return 
  end
  self:init()
  self._ActiveState = true
  ;
  (self._stateUnit):start()
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  self._questNo = uiQuestInfo:getQuestNo()
  FGlobal_AutoQuestBlackSpiritMessage("오토�\128 시작 되었습니�\164")
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.stop = function(self)
  -- function num : 0_3
  self._ActiveState = false
  ToClient_changeAutoMode((CppEnums.Client_AutoControlStateType).NONE)
end

Auto_FrameMove = function(deltaTime)
  -- function num : 0_4
  PaGlobal_AutoManager:frameMove(deltaTime)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.checkException = function(self)
  -- function num : 0_5
  PaGlobal_AutoManager:checkReturnToTown()
  PaGlobal_AutoManager:checkUseToRecoverPosion()
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

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
            quickSlot_UseSlot(i)
            FGlobal_AutoQuestBlackSpiritMessage("오토�\156 인한 물약 사용, 설정�\156 수치보다 HP�\128 떨어�\184 물약�\132 사용했습니다.")
          end
        end
      end
    end
  end
end

Auto_TransferState = function(typeState)
  -- function num : 0_8
  _PA_LOG("�\128규보", "before: " .. AutoStateName[(PaGlobal_AutoManager._stateUnit)._state] .. "    after: " .. AutoStateName[typeState])
  _PA_LOG("�\128규보", "traceBack:" .. (debug.traceback)())
  if (PaGlobal_AutoManager._stateUnit)._state == typeState then
    return 
  end
  ;
  (PaGlobal_AutoManager._stateUnit):endProc()
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoManager.isDialoging = function(self)
  -- function num : 0_11
  if self._ActiveState == true and self._stateUnit ~= nil and (PaGlobal_AutoManager._stateUnit)._state == AutoStateType.DIALOG_INTERACTION then
    return true
  end
  return false
end


