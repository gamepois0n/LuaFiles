-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\autoquest\autoquestmanager.luac 

-- params : ...
-- function num : 0
local VCK = CppEnums.VirtualKeyCode
local enMouseMoveValue = {UpdateMoveSize = 8}
local stateTypeValue = {idle = 0, startQuestToNpc = 1, endQuestToNpc = 2, doingQuest = 3, autoNaviButton = 4}
local QuestProgress = {clear = 0, progressing = 1, start = 2}
local pressButton = {default = 0, mouseL = 1, keyboarR = 2}
local PaGlobal_AutoQuestManager = {_doAutoQuest = false, _stateType = stateTypeValue.idle, _questProgress = QuestProgress.clear, _mouseMove = false, _doDialog = false, _doAutoHunt = false, _autoMove = false, _currentQuestGroup = 0, _currentQuestId = 0, _delay = 0, _isjustmeetNPC = false, _pressButton = pressButton.default}
PaGlobal_AutoQuestManager.init = function(self)
  -- function num : 0_0 , upvalues : stateTypeValue, QuestProgress
  self._doAutoQuest = false
  self._stateType = stateTypeValue.idle
  self._questProgress = QuestProgress.clear
  self._mouseMove = false
  self._doDialog = false
  self._doAutoHunt = false
  self._autoMove = false
  self._currentQuestGroup = 0
  self._currentQuestId = 0
  self._delay = 0
end

PaGlobal_AutoQuestManager.updateAutoQuest = function(self)
  -- function num : 0_1 , upvalues : QuestProgress, stateTypeValue
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
    if self._doDialog then
      _PA_LOG("조재�\144", "다이얼로�\184")
      self._mouseMove = true
    else
      if self._doAutoHunt then
        _PA_LOG("조재�\144", "오헌")
        if self._questProgress == QuestProgress.clear then
          self._doAutoHunt = false
          ToClient_changeAutoMode(0)
          self._stateType = stateTypeValue.endQuestToNpc
          self._mouseMove = true
        end
      else
        if not self._autoMove then
          _PA_LOG("조재�\144", "오무")
          self._mouseMove = true
          self._stateType = stateTypeValue.autoNaviButton
        end
      end
    end
  end
end

PaGlobal_AutoQuestManager.talkingToNpc = function(self)
  -- function num : 0_2 , upvalues : stateTypeValue
  if self._stateType == stateTypeValue.endQuestToNpc then
    self._doDialog = true
  else
    self._mouseMove = true
  end
end

PaGlobal_AutoQuestManager.moveEnd = function(self)
  -- function num : 0_3 , upvalues : stateTypeValue
  if not self._doAutoQuest then
    return 
  end
  if self._stateType == stateTypeValue.startQuestToNpc or self._stateType == stateTypeValue.endQuestToNpc then
    self:talkingToNpc()
  else
    if self._isjustmeetNPC then
      self:talkingToNpc()
      self._isjustmeetNPC = false
      _PA_LOG("조재�\144", "NPC�\188 만났�\164 R키를 누르세요")
    else
      ToClient_changeAutoMode(1)
      self._doAutoHunt = true
    end
  end
  self._autoMove = false
end

PaGlobal_AutoQuestManager.mouseProgress = function(self)
  -- function num : 0_4 , upvalues : stateTypeValue, QuestProgress
  if self._stateType == stateTypeValue.autoNaviButton then
    local questWidget = PaGlobal_MainQuest._uiAutoNaviBtn
    local posX = Panel_MainQuest:GetPosX() + questWidget:GetPosX() + questWidget:GetSizeX() / 2
    local posY = Panel_MainQuest:GetPosY() + questWidget:GetPosY() + questWidget:GetSizeY() / 2
    if self:moveMouse(posX, posY) == false then
      if self._questProgress == QuestProgress.clear then
        self._stateType = stateTypeValue.endQuestToNpc
        self._mouseMove = false
        self._doDialog = true
        local QuestStatic = questList_getQuestStatic(self._currentQuestGroup, self._currentQuestId)
        if QuestStatic ~= nil and QuestStatic:isCompleteBlackSpirit() then
          self:talkingToNpc()
        end
      else
        do
          if self._questProgress == QuestProgress.progressing then
            self._stateType = stateTypeValue.doingQuest
            self._mouseMove = false
            self._autoMove = true
          else
            self._stateType = stateTypeValue.startQuestToNpc
            self._mouseMove = false
            self._doDialog = true
            local QuestStatic = questList_getQuestStatic(self._currentQuestGroup, self._currentQuestId)
            if QuestStatic ~= nil and QuestStatic:isCompleteBlackSpirit() then
              self:talkingToNpc()
            end
          end
          do
            if self._stateType == stateTypeValue.startQuestToNpc then
              local buttonPosition = FGlobal_Dialog_GetFuncPositionNewQuestButton()
              if buttonPosition._Return == false then
                return 
              end
              if self:moveMouse(buttonPosition._PosX + 65, Panel_Npc_Dialog:GetPosY() + buttonPosition._PosY + 18) == false then
                self._mouseMove = false
                self._stateType = stateTypeValue.doingQuest
              end
            else
              do
                if self._stateType == stateTypeValue.endQuestToNpc then
                  local npcData = ToClient_GetCurrentDialogData()
                  if npcData == nil then
                    return 
                  end
                  local selCount = npcData:getSelectRewardCount()
                  if selCount ~= 0 then
                    local buttonPosition = FGlobal_getSelectRewardPosition()
                    if buttonPosition._Return == false then
                      return 
                    end
                    if self:moveMouse(buttonPosition._PosX, buttonPosition._PosY) == false then
                      self._mouseMove = false
                      self._stateType = stateTypeValue.idle
                    end
                  else
                    do
                      self._mouseMove = false
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
  -- function num : 0_5 , upvalues : stateTypeValue
  local npcData = ToClient_GetCurrentDialogData()
  if npcData == nil then
    self.moveMouse = true
    self._stateType = stateTypeValue.autoNaviButton
  end
end

PaGlobal_AutoQuestManager.UpdatePerFrame = function(self, deltaTime)
  -- function num : 0_6
  if not self._doAutoQuest then
    return 
  end
  if self._mouseMove then
    self:mouseProgress()
  end
  self._delay = self._delay + deltaTime
  if self._delay < 0.1 then
    return 
  end
  self._delay = 0
  if self._doDialog then
    self:dialogProgress()
  end
  self:updateAutoQuest()
end

PaGlobal_AutoQuestManager.waitForPressButton = function(self)
  -- function num : 0_7 , upvalues : pressButton
  if self._pressButton == pressButton.default then
    return true
  end
end

PaGlobal_AutoQuestManager.moveMouse = function(self, PosX, PosY)
  -- function num : 0_8 , upvalues : enMouseMoveValue
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

FromClient_autoQuestMoveEnd = function()
  -- function num : 0_9 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:moveEnd()
end

FGlobal_AutoQuestManager_UpdatePerFrame = function(deltaTime)
  -- function num : 0_10 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:UpdatePerFrame(deltaTime)
end

PaGlobal_AutoQuestManager.QuestAcceptorClear = function(self, isAccept, questNoRaw)
  -- function num : 0_11
  self._doDialog = false
  Dialog_clickExitReq()
  self:updateAutoQuest()
end

FromClient_QuestAcceptorClear = function(isAccept, questNoRaw)
  -- function num : 0_12 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:QuestAcceptorClear(isAccept, questNoRaw)
end

registerEvent("FromClient_autoQuestMoveEnd", "FromClient_autoQuestMoveEnd")
registerEvent("EventQuestUpdateNotify", "FromClient_QuestAcceptorClear")
registerEvent("FromClient_UpdateQuestList", "FromClient_QuestAcceptorClear")
testAuto = function()
  -- function num : 0_13 , upvalues : PaGlobal_AutoQuestManager
  PaGlobal_AutoQuestManager:init()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._doAutoQuest = true
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._autoMove = false
  PaGlobal_AutoQuestManager:updateAutoQuest()
end

stopAuto = function()
  -- function num : 0_14 , upvalues : PaGlobal_AutoQuestManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_AutoQuestManager._doAutoQuest = false
  ToClient_changeAutoMode(0)
end


