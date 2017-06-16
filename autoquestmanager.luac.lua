-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\autoquest\autoquestmanager.luac 

-- params : ...
-- function num : 0
local enMouseMoveValue = {UpdateMoveSize = 8}
local stateTypeValue = {idle = 0, startQuestToNpc = 1, endQuestToNpc = 2, doingQuest = 3, autoNaviButton = 4, needToDialog = 5, stuckescpae = 6, needToMeetRelationNPC = 7}
local QuestProgress = {clear = 0, progressing = 1, start = 2}
local pressButton = {default = 0, mouseL = 1, keyboarR = 2, mouseMoving = 4, selectreward = 5, showMouse = 6, escape = 7, navigationT = 8}
local PaGlobal_AutoQuestManager = {_doAutoQuest = false, _stateType = stateTypeValue.idle, _questProgress = QuestProgress.clear, _mouseAutoMove = false, _doDialog = false, _doAutoHunt = false, _autoMove = false, _currentQuestGroup = 0, _currentQuestId = 0, _delay = 0, _isjustmeetNPC = false, _isSummonBoss = false, _pressButton = pressButton.default, _pressDelay = 0}
PaGlobal_AutoQuestManager.init = function(self)
  -- function num : 0_0 , upvalues : stateTypeValue, QuestProgress, pressButton
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

PaGlobal_AutoQuestManager.UpdatePerFrame = function(self, deltaTime)
  -- function num : 0_1 , upvalues : pressButton
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

PaGlobal_AutoQuestManager.updateAutoQuest = function(self, deltaTime)
  -- function num : 0_2 , upvalues : QuestProgress, stateTypeValue
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
    -- DECOMPILER ERROR at PC61: Unhandled construct in 'MakeBoolean' P1

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
    if speed < 35 and self._autoMove and ToClient_pushStuckPostion() then
      self._stateType = stateTypeValue.stuckescpae
      ToClient_changeAutoMode(2)
    end
  end
end

PaGlobal_AutoQuestManager.talkingToNpc = function(self)
  -- function num : 0_3 , upvalues : QuestProgress, stateTypeValue
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
end

PaGlobal_AutoQuestManager.moveEnd = function(self)
  -- function num : 0_4 , upvalues : stateTypeValue, pressButton
  if not self._doAutoQuest then
    return 
  end
  if self._stateType == stateTypeValue.stuckescpae then
    return 
  end
  if self._stateType == stateTypeValue.startQuestToNpc or self._stateType == stateTypeValue.endQuestToNpc then
    self._pressButton = pressButton.keyboarR
    self._stateType = stateTypeValue.needToDialog
  else
    if self._isjustmeetNPC and self._stateType == stateTypeValue.doingQuest then
      self._isjustmeetNPC = false
      self._pressButton = pressButton.keyboarR
      self._stateType = stateTypeValue.needToDialog
    else
      if self._isSummonBoss then
        InventoryWindow_Show()
      else
        ToClient_changeAutoMode(1)
        self._doAutoHunt = true
      end
    end
  end
  self._autoMove = false
end

PaGlobal_AutoQuestManager.mouseProgress = function(self)
  -- function num : 0_5 , upvalues : stateTypeValue, pressButton, QuestProgress
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

PaGlobal_AutoQuestManager.dialogProgress = function(self)
  -- function num : 0_6 , upvalues : pressButton
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
      self:showmouseorT()
    end
  end
end

PaGlobal_AutoQuestManager.stuckEscape = function(self)
  -- function num : 0_7 , upvalues : pressButton, stateTypeValue, QuestProgress
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
  -- function num : 0_8 , upvalues : VCK
  do return keyCustom_IsDownOnce_Ui(uiInputType) and ((not GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_MENU) and not isPhotoMode())) end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

local GlobalKeyBinder_CheckKeyPressed = function(keyCode)
  -- function num : 0_9
  return isKeyDown_Once(keyCode)
end

PaGlobal_AutoQuestManager.waitForPressButton = function(self)
  -- function num : 0_10 , upvalues : pressButton, stateTypeValue, GlobalKeyBinder_CheckKeyPressed, VCK, PaGlobal_AutoQuestManager
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

PaGlobal_AutoQuestManager.moveMouse = function(self, PosX, PosY)
  -- function num : 0_11 , upvalues : enMouseMoveValue
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

PaGlobal_AutoQuestManager.QuestAcceptorClear = function(self, isAccept, questNoRaw)
  -- function num : 0_12
  if self._doAutoQuest then
    self:updateAutoQuest(0)
  end
end

PaGlobal_AutoQuestManager.summonBoss = function(self)
  -- function num : 0_13
  if self._doAutoQuest then
    ToClient_changeAutoMode(1)
    self._doAutoHunt = true
    self._isSummonBoss = false
  end
end

PaGlobal_AutoQuestManager.showmouseorT = function(self)
  -- function num : 0_14 , upvalues : pressButton, stateTypeValue
  local navi = ToClient_currentNaviisMainQuest()
  if navi then
    self._pressButton = pressButton.navigationT
  else
    self._pressButton = pressButton.showMouse
    self._stateType = stateTypeValue.autoNaviButton
  end
end

PaGlobal_AutoQuestManager.restartNavigation = function(self)
  -- function num : 0_15 , upvalues : PaGlobal_AutoQuestManager, QuestProgress
  if self._doAutoQuest then
    PaGlobal_AutoQuestManager:init()
    ToClient_changeAutoMode(0)
    local questList = ToClient_GetQuestList()
    if questList:isMainQuestClearAll() == true then
      return 
    end
    local uiQuestInfo = questList:getMainQuestInfo()
    local queststate = QuestConditionCheckType.eQuestConditionCheckType_Complete
    if uiQuestInfo ~= nil then
      local questNo = uiQuestInfo:getQuestNo()
      self._currentQuestGroup = questNo._group
      self._currentQuestId = questNo._quest
      local isAccepted = 1
      if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
        isAccepted = 0
      end
      if uiQuestInfo:isSatisfied() == true then
        queststate = QuestConditionCheckType.eQuestConditionCheckType_Complete
      else
        if isAccepted == 0 then
          queststate = QuestConditionCheckType.eQuestConditionCheckType_NotAccept
        else
          queststate = QuestConditionCheckType.eQuestConditionCheckType_Progress
        end
      end
      self._isjustmeetNPC = uiQuestInfo:isjustMeetNpc()
      if self._questProgress ~= QuestProgress.clear then
        self._isSummonBoss = uiQuestInfo:isSummonBoss()
      end
    end
    do
      -- DECOMPILER ERROR at PC62: Confused about usage of register: R4 in 'UnsetPending'

      PaGlobal_AutoQuestManager._autoMove = true
      HandleClicked_QuestWindow_FindWay(0, 0, queststate, false)
      HandleClicked_QuestWindow_FindWay(self._currentQuestGroup, self._currentQuestId, queststate, true)
    end
  end
end

PaGlobal_AutoQuestManager.getQuestIdByQuestNoRaw = function(self, questNoRaw)
  -- function num : 0_16
  return (math.floor)(questNoRaw / 65536)
end

PaGlobal_AutoQuestManager.getQuestGroupNoByQuestNoRaw = function(self, questNoRaw)
  -- function num : 0_17
  return questNoRaw % 65536
end

PaGlobal_AutoQuestManager.stopreasonFullinventory = function(self)
  -- function num : 0_18
  local cnt = (((getSelfPlayer()):get()):getInventory()):getFreeCount()
  if cnt == 0 then
    self._doAutoQuest = false
    ToClient_changeAutoMode(0)
    Proc_ShowMessage_Ack("인벤토리�\128 �\128�\157 차서 오토 퀘스트를 정지 합니�\164.")
  end
end

PaGlobal_AutoQuestManager.usePotion = function(self)
  -- function num : 0_19
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

PaGlobal_AutoQuestManager.stopAuotoByUserControl = function(self)
  -- function num : 0_20 , upvalues : stateTypeValue
  if self._stateType ~= stateTypeValue.stuckescpae and self._doAutoQuest and self._autoMove then
    Proc_ShowMessage_Ack("유저 컨트�\164 때문�\144 오토 정지.")
    self:stopAuoto()
  end
end

PaGlobal_AutoQuestManager.stopAuoto = function(self)
  -- function num : 0_21
  self:init()
  ToClient_changeAutoMode(0)
end

FGlobal_AutoQuestManager_UpdatePerFrame = function(deltaTime)
  -- function num : 0_22 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:UpdatePerFrame(deltaTime)
end

FGlobal_AutoQuestManager_stopAuto = function()
  -- function num : 0_23 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:stopAuoto()
end

FromClient_autoQuestMoveEnd = function()
  -- function num : 0_24 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:moveEnd()
end

FromClient_QuestAcceptorClear = function(isAccept, questNoRaw)
  -- function num : 0_25 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:QuestAcceptorClear(isAccept, questNoRaw)
end

FromClient_autoControlFindWayEnd = function()
  -- function num : 0_26 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:stuckEscape()
end

FromClient_autoQuestSummonBoss = function()
  -- function num : 0_27 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:summonBoss()
end

FromClient_autoQuestNaviAgain = function()
  -- function num : 0_28 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:restartNavigation()
end

FromClient_autoQuestMoveEndUserControl = function()
  -- function num : 0_29 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:stopAuotoByUserControl()
end

registerEvent("FromClient_autoQuestMoveEnd", "FromClient_autoQuestMoveEnd")
registerEvent("EventQuestUpdateNotify", "FromClient_QuestAcceptorClear")
registerEvent("FromClient_UpdateQuestList", "FromClient_QuestAcceptorClear")
registerEvent("FromClient_autoControlFindWayEnd", "FromClient_autoControlFindWayEnd")
registerEvent("FromClient_autoQuestSummonBoss", "FromClient_autoQuestSummonBoss")
registerEvent("FromClient_autoQuestNaviAgain", "FromClient_autoQuestNaviAgain")
registerEvent("FromClient_autoQuestMoveEndUserControl", "FromClient_autoQuestMoveEndUserControl")
testAuto = function()
  -- function num : 0_30 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:init()
  ToClient_changeAutoMode(0)
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._doAutoQuest = true
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._autoMove = false
  PaGlobal_AutoQuestManager:updateAutoQuest(0)
end

stopAuto = function()
  -- function num : 0_31 , upvalues : PaGlobal_AutoQuestManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._doAutoQuest = false
  ToClient_changeAutoMode(0)
end

testway = function()
  -- function num : 0_32
  ToClient_changeAutoMode(2)
end

testres = function()
  -- function num : 0_33
  ToClient_NaviReStart()
end


