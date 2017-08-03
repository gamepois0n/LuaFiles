-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\autoquest\autoquestmanager.luac 

-- params : ...
-- function num : 0
enMouseMoveValue = {UpdateMoveSize = 8}
stateTypeValue = {idle = 0, startQuestToNpc = 1, endQuestToNpc = 2, doingQuest = 3, autoNaviButton = 4, needToDialog = 5, stuckescpae = 6, needToMeetRelationNPC = 7}
QuestProgress = {clear = 0, progressing = 1, start = 2}
pressButton = {default = 0, mouseL = 1, keyboarR = 2, mouseMoving = 4, selectreward = 5, showMouse = 6, escape = 7, navigationT = 8}
PaGlobal_AutoQuestManager = {_doAutoQuest = false, _stateType = stateTypeValue.idle, _questProgress = QuestProgress.clear, _mouseAutoMove = false, _doDialog = false, _doAutoHunt = false, _autoMove = false, _currentQuestGroup = 0, _currentQuestId = 0, _delay = 0, _isjustmeetNPC = false, _isSummonBoss = false, _pressButton = pressButton.default, _pressDelay = 0}
-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuestManager.init = function(self)
  -- function num : 0_0
  self._doAutoQuest = false
  self._stateType = stateTypeValue.idle
  self._questProgress = QuestProgress.clear
  self._mouseAutoMove = false
  self._doDialog = false
  self._doAutoHunt = false
  self._autoMove = false
  self._currentQuestGroup = 0
  self._currentQuestId = 0
  self._delay = 0
  self._pressButton = pressButton.default
  self._pressDelay = 0
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuestManager.UpdatePerFrame = function(self, deltaTime)
  -- function num : 0_1
  if not self._doAutoQuest then
    return 
  end
  if self._mouseAutoMove then
    self:mouseProgress()
  end
  if self._doDialog then
    self:dialogProgress()
  end
  if self._pressButton ~= pressButton.default and self._pressButton ~= pressButton.mouseMoving then
    self:waitForPressButton()
  end
  self._pressDelay = self._pressDelay + deltaTime
  self._delay = self._delay + deltaTime
  if self._delay < 1 then
    return 
  end
  self._delay = 0
  self:updateAutoQuest(deltaTime)
  self:usePotion()
end

local svvv = nil
-- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_AutoQuestManager.updateAutoQuest = function(self, deltaTime)
  -- function num : 0_2 , upvalues : svvv
  nnntest = 0
  if nnntest == 0 then
    nnntest = 1
    svvv = TTTTTTT
    svvv:Update()
    svvv = DDDDDDD
    svvv:Update()
  end
  local questList = ToClient_GetQuestList()
  if questList:isMainQuestClearAll() == true then
    return 
  end
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo ~= nil then
    local questNo = uiQuestInfo:getQuestNo()
    self._currentQuestGroup = questNo._group
    self._currentQuestId = questNo._quest
    local isAccepted = 1
    if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
      isAccepted = 0
    end
    if uiQuestInfo:isSatisfied() == true then
      self._questProgress = QuestProgress.clear
    else
      if isAccepted == 0 then
        self._questProgress = QuestProgress.start
      else
        self._questProgress = QuestProgress.progressing
      end
    end
    self._isjustmeetNPC = uiQuestInfo:isjustMeetNpc()
    if self._questProgress ~= QuestProgress.clear then
      self._isSummonBoss = uiQuestInfo:isSummonBoss()
    end
    -- DECOMPILER ERROR at PC78: Unhandled construct in 'MakeBoolean' P1

    if self._doAutoHunt and self._questProgress == QuestProgress.clear then
      self._doAutoHunt = false
      ToClient_changeAutoMode(0)
      self._stateType = stateTypeValue.endQuestToNpc
      self:showmouseorT()
    end
    if not self._autoMove and not self._mouseAutoMove and self._stateType ~= stateTypeValue.needToDialog and not ToClient_isCheckRenderModeDialog() then
      self:showmouseorT()
    end
    local speed = ToClient_getPhysicalSpeedforFIndway()
    if speed < 35 and self._autoMove then
      self._stateType = stateTypeValue.stuckescpae
      if ToClient_pushStuckPostion() then
        ToClient_changeAutoMode(2)
        _PA_LOG("�\128규보", "do pushStuckPostion")
      end
    end
  end
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_AutoQuestManager.talkingToNpc = function(self)
  -- function num : 0_3
  if self._questProgress == QuestProgress.clear then
    self._stateType = stateTypeValue.endQuestToNpc
  else
    if self._questProgress == QuestProgress.progressing then
      self._stateType = stateTypeValue.startQuestToNpc
    else
      self._stateType = stateTypeValue.startQuestToNpc
    end
  end
  self._doDialog = true
  self._mouseAutoMove = true
  _PA_LOG("�\128규보", "PaGlobal_AutoQuestManager:talkingToNpc()")
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_AutoQuestManager.mouseProgress = function(self)
  -- function num : 0_4
  if self._stateType == stateTypeValue.autoNaviButton then
    local questWidget = PaGlobal_MainQuest._uiAutoNaviBtn
    local posX = Panel_MainQuest:GetPosX() + questWidget:GetPosX() + questWidget:GetSizeX() / 2
    local posY = Panel_MainQuest:GetPosY() + questWidget:GetPosY() + questWidget:GetSizeY() / 2
    if self:moveMouse(posX, posY) == false then
      if self._pressButton ~= pressButton.mouseL then
        self._pressButton = pressButton.mouseL
      end
      if self._questProgress == QuestProgress.clear then
        if self:waitForPressButton() then
          self._stateType = stateTypeValue.endQuestToNpc
          self._autoMove = true
        end
        local QuestStatic = questList_getQuestStatic(self._currentQuestGroup, self._currentQuestId)
        if QuestStatic ~= nil and QuestStatic:isCompleteBlackSpirit() then
          self._stateType = stateTypeValue.needToDialog
          self._autoMove = false
          self._pressButton = pressButton.mouseL
        end
      else
        do
          if self._questProgress == QuestProgress.progressing and self:waitForPressButton() then
            self._stateType = stateTypeValue.startQuestToNpc
            self._mouseAutoMove = false
            self._stateType = stateTypeValue.doingQuest
            self._autoMove = true
          end
          if self:waitForPressButton() then
            self._stateType = stateTypeValue.startQuestToNpc
            self._autoMove = true
          end
          do
            local QuestStatic = questList_getQuestStatic(self._currentQuestGroup, self._currentQuestId)
            if QuestStatic ~= nil and QuestStatic:isCompleteBlackSpirit() then
              self._stateType = stateTypeValue.needToDialog
              self._autoMove = false
              self._pressButton = pressButton.mouseL
            end
            if self._stateType == stateTypeValue.startQuestToNpc then
              local buttonPosition = FGlobal_Dialog_GetFuncPositionNewQuestButton()
              if buttonPosition._Return == false then
                return 
              end
              self._pressButton = pressButton.mouseMoving
              if self:moveMouse(buttonPosition._PosX + 65, Panel_Npc_Dialog:GetPosY() + buttonPosition._PosY + 18) == false then
                self._stateType = stateTypeValue.doingQuest
                if self._pressButton ~= pressButton.keyboarR then
                  self._pressButton = pressButton.keyboarR
                  self._mouseAutoMove = false
                end
              end
            else
              do
                if self._stateType == stateTypeValue.endQuestToNpc then
                  if self._autoMove then
                    return 
                  end
                  local npcData = ToClient_GetCurrentDialogData()
                  if npcData == nil then
                    return 
                  end
                  local selCount = 0
                  local QuestStatic = questList_getQuestStatic(self._currentQuestGroup, self._currentQuestId)
                  if QuestStatic ~= nil then
                    selCount = QuestStatic:getQuestSelectRewardCount()
                  end
                  if selCount ~= 0 then
                    local buttonPosition = FGlobal_getSelectRewardPosition()
                    if buttonPosition._Return == false then
                      return 
                    end
                    if self:moveMouse(buttonPosition._PosX, buttonPosition._PosY) == false then
                      self._stateType = stateTypeValue.idle
                      self._pressButton = pressButton.selectreward
                      self._mouseAutoMove = false
                    end
                  else
                    do
                      if self._pressButton ~= pressButton.keyboarR then
                        self._pressButton = pressButton.keyboarR
                      end
                      self._mouseAutoMove = false
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

-- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_AutoQuestManager.dialogProgress = function(self)
  -- function num : 0_5
  if self._mouseAutoMove then
    return 
  end
  local npcData = ToClient_GetCurrentDialogData()
  if npcData ~= nil then
    local reward = npcData:getBaseRewardCount()
    local bcount = npcData:getFuncButtonCount()
    local newquest = npcData:isHaveAcceptMainQuest()
    if reward == 0 and bcount ~= 0 and not newquest then
      self._pressButton = pressButton.escape
    end
  end
  do
    if not ToClient_isCheckRenderModeDialog() then
      self._doDialog = false
      self._mouseAutoMove = true
      _PA_LOG("�\128규보", "PaGlobal_AutoQuestManager:dialogProgress()")
      self:showmouseorT()
    end
  end
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_AutoQuestManager.stuckEscape = function(self)
  -- function num : 0_6
  ToClient_changeAutoMode(0)
  self._autoMove = true
  self._pressButton = pressButton.default
  local questList = ToClient_GetQuestList()
  if questList:isMainQuestClearAll() == true then
    return 
  end
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo ~= nil then
    local questNo = uiQuestInfo:getQuestNo()
    self._currentQuestGroup = questNo._group
    self._currentQuestId = questNo._quest
    local isAccepted = 1
    if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
      isAccepted = 0
    end
    self._stateType = stateTypeValue.doingQuest
    if uiQuestInfo:isSatisfied() == true then
      self._questProgress = QuestProgress.clear
      self._stateType = stateTypeValue.endQuestToNpc
    else
      if isAccepted == 0 then
        self._questProgress = QuestProgress.start
        self._stateType = stateTypeValue.startQuestToNpc
      else
        self._questProgress = QuestProgress.progressing
        self._stateType = stateTypeValue.doingQuest
      end
    end
  end
end

local VCK = CppEnums.VirtualKeyCode
local UIT = CppEnums.UiInputType
local GlobalKeyBinder_CheckCustomKeyPressed = function(uiInputType)
  -- function num : 0_7 , upvalues : VCK
  do return keyCustom_IsDownOnce_Ui(uiInputType) and ((not GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_MENU) and not isPhotoMode())) end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

local GlobalKeyBinder_CheckKeyPressed = function(keyCode)
  -- function num : 0_8
  return isKeyDown_Once(keyCode)
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.waitForPressButton = function(self)
  -- function num : 0_9 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK
  if self._pressButton == pressButton.default then
    return true
  end
  if self._pressButton == pressButton.mouseMoving then
    return false
  end
  if self._stateType == stateTypeValue.needToDialog then
    if ToClient_isCheckRenderModeDialog() then
      self:talkingToNpc()
      self._pressButton = pressButton.default
      return true
    end
    if self._pressDelay > 3 then
      if self._pressButton == pressButton.mouseL then
        Proc_ShowMessage_Ack("자동이동 클릭")
      else
        if self._pressButton == pressButton.keyboarR then
          Proc_ShowMessage_Ack("R키를 눌러 인터렉션 하세�\148")
        else
          if self._pressButton == pressButton.selectreward then
            Proc_ShowMessage_Ack("선택 보상")
          else
            if self._pressButton == pressButton.showMouse then
              Proc_ShowMessage_Ack("컨트�\164 �\164")
            else
              if self._pressButton == pressButton.escape then
                Proc_ShowMessage_Ack("ESC�\140")
              else
                if self._pressButton == pressButton.navigationT then
                  Proc_ShowMessage_Ack("T버튼�\132 눌르세용")
                end
              end
            end
          end
        end
      end
      self._pressDelay = 0
    end
    return false
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_CONTROL) and self._pressButton == pressButton.showMouse then
    self._mouseAutoMove = true
    self._pressButton = pressButton.mouseMoving
    return true
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_LBUTTON) and self._pressButton == pressButton.mouseL then
    self._pressButton = pressButton.default
    return true
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_LBUTTON) and self._pressButton == pressButton.selectreward then
    self._pressButton = pressButton.keyboarR
    return true
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_T) and self._pressButton == pressButton.navigationT then
    self._pressButton = pressButton.default
    return true
  end
  if self._pressDelay > 3 then
    if self._pressButton == pressButton.mouseL then
      Proc_ShowMessage_Ack("자동이동 클릭")
    else
      if self._pressButton == pressButton.keyboarR then
        Proc_ShowMessage_Ack("R 눌러�\156 의를 받거�\152 완료")
        PaGlobal_AutoQuestManager:stopreasonFullinventory()
      else
        if self._pressButton == pressButton.selectreward then
          Proc_ShowMessage_Ack("선택 보상�\132 고르세요")
        else
          if self._pressButton == pressButton.showMouse then
            Proc_ShowMessage_Ack("컨트�\164 �\164 누르세요")
          else
            if self._pressButton == pressButton.escape then
              Proc_ShowMessage_Ack("ESC�\140")
            else
              if self._pressButton == pressButton.navigationT then
                Proc_ShowMessage_Ack("T버튼�\132 눌르세용")
              end
            end
          end
        end
      end
    end
    self._pressDelay = 0
  end
  return false
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.moveMouse = function(self, PosX, PosY)
  -- function num : 0_10
  if PosX < 0 or PosY < 0 then
    return true
  end
  local nowX = getMousePosX()
  local nowY = getMousePosY()
  if enMouseMoveValue.UpdateMoveSize < (math.abs)(nowX - PosX) then
    if nowX < PosX then
      nowX = nowX + enMouseMoveValue.UpdateMoveSize
    else
      if PosX < nowX then
        nowX = nowX - enMouseMoveValue.UpdateMoveSize
      end
    end
  end
  if enMouseMoveValue.UpdateMoveSize < (math.abs)(nowY - PosY) then
    if nowY < PosY then
      nowY = nowY + enMouseMoveValue.UpdateMoveSize
    else
      if PosY < nowY then
        nowY = nowY - enMouseMoveValue.UpdateMoveSize
      end
    end
  end
  ToClient_setMousePosition(nowX, nowY)
  if (math.abs)(nowX - PosX) <= enMouseMoveValue.UpdateMoveSize and (math.abs)(nowY - PosY) <= enMouseMoveValue.UpdateMoveSize then
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.QuestAcceptorClear = function(self, isAccept, questNoRaw)
  -- function num : 0_11
  if self._doAutoQuest then
    self:updateAutoQuest(0)
  end
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.summonBoss = function(self)
  -- function num : 0_12
  if self._doAutoQuest then
    ToClient_changeAutoMode(1)
    self._doAutoHunt = true
    self._isSummonBoss = false
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.showmouseorT = function(self)
  -- function num : 0_13
  local navi = ToClient_currentNaviisMainQuest()
  if navi then
    self._pressButton = pressButton.navigationT
  else
    self._pressButton = pressButton.showMouse
    self._stateType = stateTypeValue.autoNaviButton
    _PA_LOG("�\128규보", "showmouseorT  " .. (debug.traceback)())
  end
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.getQuestIdByQuestNoRaw = function(self, questNoRaw)
  -- function num : 0_14
  return (math.floor)(questNoRaw / 65536)
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.getQuestGroupNoByQuestNoRaw = function(self, questNoRaw)
  -- function num : 0_15
  return questNoRaw % 65536
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.stopreasonFullinventory = function(self)
  -- function num : 0_16
  local cnt = (((getSelfPlayer()):get()):getInventory()):getFreeCount()
  if cnt == 0 then
    self._doAutoQuest = false
    ToClient_changeAutoMode(0)
    Proc_ShowMessage_Ack("인벤토리�\128 �\128�\157 차서 오토 퀘스트를 정지 합니�\164.")
  end
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.usePotion = function(self)
  -- function num : 0_17
  local selfPlayer = (getSelfPlayer()):get()
  local hp = selfPlayer:getHp()
  local maxhp = selfPlayer:getMaxHp()
  local mp = selfPlayer:getMp()
  local maxmp = selfPlayer:getMaxMp()
  local usehp = false
  local usemp = false
  if hp / maxhp < 0.5 then
    usehp = true
  end
  if mp / maxmp < 0.5 then
    usemp = true
  end
  local inventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  if usehp then
    tempItemEnchantKey = ItemEnchantKey(502, 0)
    slotValue = inventory:getSlot(tempItemEnchantKey)
    if slotValue == 255 then
      do
        if isMoving == false then
          local position = float3(quest.progressX, quest.progressY, quest.progressZ)
          ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
          isMoving = true
        end
        do return  end
        do
          local remainTime = getItemCooltime((CppEnums.ItemWhereType).eInventory, slotValue)
          if remainTime == 0 then
            inventoryUseItem((CppEnums.ItemWhereType).eInventory, slotValue, 0, true)
          end
          if usemp then
            tempItemEnchantKey = ItemEnchantKey(591, 0)
            slotValue = inventory:getSlot(tempItemEnchantKey)
            if slotValue == 255 then
              do
                if isMoving == false then
                  local position = float3(quest.progressX, quest.progressY, quest.progressZ)
                  ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
                  isMoving = true
                end
                do return  end
                local remainTime = getItemCooltime((CppEnums.ItemWhereType).eInventory, slotValue)
                if remainTime == 0 then
                  inventoryUseItem((CppEnums.ItemWhereType).eInventory, slotValue, 0, true)
                end
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.stopAuotoByUserControl = function(self)
  -- function num : 0_18
  if self._stateType ~= stateTypeValue.stuckescpae and self._doAutoQuest and self._autoMove then
    Proc_ShowMessage_Ack("유저 컨트�\164 때문�\144 오토 정지.")
    self:stopAuoto()
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_AutoQuestManager.stopAuoto = function(self)
  -- function num : 0_19
  self:init()
  ToClient_changeAutoMode(0)
end

autoQuest_StartAuto = function()
  -- function num : 0_20
  _PA_LOG("�\128규보", "autoQuest_StartAuto")
  PaGlobal_AutoQuestManager:init()
  ToClient_changeAutoMode(0)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._doAutoQuest = true
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._autoMove = false
  PaGlobal_AutoQuestManager:updateAutoQuest(0)
end

autoQuest_StopAuto = function()
  -- function num : 0_21
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._doAutoQuest = false
  ToClient_changeAutoMode(0)
end

testway = function()
  -- function num : 0_22
  ToClient_changeAutoMode(2)
end

testres = function()
  -- function num : 0_23
  ToClient_NaviReStart()
end


