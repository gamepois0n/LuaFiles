-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\autoquest\autoquestmanager.luac 

-- params : ...
-- function num : 0
local enMouseMoveValue = {UpdateMoveSize = 8}
local stateTypeValue = {AcceptInteraction = 0, TalkingNpc = 1, WaitingAccpetQuest = 2, CompleteInteraction = 3, WaitingCompleteQuest = 4, WaitingCompleteHunting = 5, MovingHuntingArea = 6, UsingItem = 7}
local enHpPortionKey = {[0] = 502, [1] = 513, [2] = 514, [3] = 517, [4] = 518, [5] = 519, arrCount = 6, failedFind = 255}
local enMpPortionKey = {[0] = 503, [1] = 515, [2] = 516, [3] = 520, [4] = 521, [5] = 522, arrCount = 6, failedFind = 255}
local enAdrenalinePortionKey = {[0] = 591, [1] = 592, [2] = 593, [3] = 594, arrCount = 4, failedFind = 255}
local enAdrenalineCharacter = {[0] = (CppEnums.ClassType).ClassType_Warrior, [1] = (CppEnums.ClassType).ClassType_Giant, [2] = (CppEnums.ClassType).ClassType_Combattant, [3] = (CppEnums.ClassType).ClassType_BladeMaster, [4] = (CppEnums.ClassType).ClassType_Temp, [5] = (CppEnums.ClassType).ClassType_Kunoichi, [6] = (CppEnums.ClassType).ClassType_NinjaMan, arrCount = 7}
local conditionTypeValue = {Meet = 0, Kill = 1, UseItem = 2}
local questList = {
[(CppEnums.ClassType).ClassType_BladeMaster] = {
[0] = {questGroupNo = 1034, questNo = 1, acceptCharacterKey = 544, completeCharacterKey = 544, x = -155553, y = -177.84, z = 132010, completeX = -155553, completeY = -177.84, completeZ = 132010, completeType = conditionTypeValue.UseItem, useItemkey = 502, progressX = -156450, progressY = 976.09, progressZ = 127860}
, 
[1] = {questGroupNo = 1034, questNo = 2, acceptCharacterKey = 544, completeCharacterKey = 544, x = -155553, y = -177.84, z = 132010, completeX = -155553, completeY = -177.84, completeZ = 132010, completeType = conditionTypeValue.Kill}
, 
[2] = {questGroupNo = 1034, questNo = 3, acceptCharacterKey = 544, completeCharacterKey = 40603, x = -155553, y = -177.84, z = 132010, completeX = -140212, completeY = 1157.95, completeZ = 114325.02, completeType = conditionTypeValue.Meet}
}
}
local AutoQuestManager = {_doAutoQuest = false, _stateType = stateTypeValue.AcceptInteraction, _currentQuestIndex = 0, _maxQuestIndex = 2, _doAutoHunting = false, _isOnAutoAI = false, _isSatisfied = false, _prevTick = 0, _characterClassType = 0, _huntingTick = 0}
AutoQuestManager.isPass_OneSecond = function(self)
  -- function num : 0_0
  local nowTick = (os.time)()
  if nowTick - self._prevTick < 1 then
    return false
  end
  self._prevTick = nowTick
  return true
end

AutoQuestManager.isPass_huntingTick = function(self)
  -- function num : 0_1
  if self._huntingTick == 0 then
    self._huntingTick = (os.time)()
    return false
  end
  local nowTick = (os.time)()
  if nowTick - self._huntingTick > 5 then
    return true
  end
  return false
end

AutoQuestManager.isArriveGoal = function(self, questGroupNo, questNo)
  -- function num : 0_2
  local selfPlayer = getSelfPlayer()
  local nowPositionX = (selfPlayer:get()):getPositionX()
  local nowPositionY = (selfPlayer:get()):getPositionY()
  local nowPositionZ = (selfPlayer:get()):getPositionZ()
  local questWrapper = questList_getQuestStatic(questGroupNo, questNo)
  local positionCount = questWrapper:getQuestPositionCount()
  local position = questWrapper:getQuestPositionAt(0)
  local fixedPositionX = (math.abs)((position._position).x - nowPositionX)
  local fixedPositionY = (math.abs)((position._position).y - nowPositionY)
  local fixedPositionZ = (math.abs)((position._position).z - nowPositionZ)
  if fixedPositionX < 100 and fixedPositionY < 100 and fixedPositionZ < 100 then
    return true
  end
  return false
end

AutoQuestManager.startQuest = function(self)
  -- function num : 0_3 , upvalues : stateTypeValue, questList
  local doStartQuest = false
  self._doAutoHunting = false
  self._isOnAutoAI = false
  self._stateType = stateTypeValue.AcceptInteraction
  self._isSatisfied = false
  self._prevTick = 0
  self._characterClassType = self:getSelfPlayer_ClassType()
  _PA_LOG("�\128민혁", self._characterClassType)
  for index = 0, self._maxQuestIndex do
    local quest = (questList[self._characterClassType])[index]
    local questGroupNo = quest.questGroupNo
    local questNo = quest.questNo
    _PA_LOG("�\128민혁", "그룹넘버" .. questGroupNo .. "그냥넘버" .. questNo)
    if questList_isClearQuest(questGroupNo, questNo) == false then
      doStartQuest = true
      self._currentQuestIndex = index
      break
    end
  end
  do
    if doStartQuest == false then
      _PA_LOG("장태�\132", "더이�\129 수행�\160 퀘스트가 없습니다.")
      return 
    end
    self._doAutoQuest = true
    local quest = (questList[self._characterClassType])[self._currentQuestIndex]
    local position = float3(quest.x, quest.y, quest.z)
    ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
    self._stateType = stateTypeValue.AcceptInteraction
  end
end

AutoQuestManager.endQuest = function(self)
  -- function num : 0_4
  self._doAutoQuest = false
  _PA_LOG("장태�\132", "끝~!")
end

AutoQuestManager.HandleAcceptInteraction = function(self)
  -- function num : 0_5 , upvalues : questList, stateTypeValue
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local acceptCharacterKey = quest.acceptCharacterKey
  local interactionCharacterKey = (ToClient_GetInteractionCharacterKey()):get()
  if acceptCharacterKey == interactionCharacterKey then
    Interaction_ButtonPushed((CppEnums.InteractionType).InteractionType_Talk)
    ToClient_setMousePosition(getScreenSizeX() / 2, getScreenSizeY() / 2)
  end
  local buttonPosition = FGlobal_Dialog_GetFuncPositionNewQuestButton()
  if buttonPosition._Return == false then
    return 
  end
  if MoveAutoQuestCurser(buttonPosition._PosX + 65, Panel_Npc_Dialog:GetPosY() + buttonPosition._PosY + 18) == false then
    self._stateType = stateTypeValue.TalkingNpc
  end
  _PA_LOG("장태�\132", "AcceptInteraction() call!")
end

AutoQuestManager.HandleTalkingNpc = function(self)
  -- function num : 0_6 , upvalues : questList, conditionTypeValue, stateTypeValue
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local questGroupNo = quest.questGroupNo
  local questNo = quest.questNo
  local questCompleteType = quest.completeType
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local questCount = dialogData:getDialogButtonCount()
  for index = 0, questCount - 1 do
    local questButton = dialogData:getDialogButtonAt(index)
    local questStatic = questButton:getQuestStaticStatus()
    local questGroupNo = questStatic:getQuestGroupNo()
    local questNo = questStatic:getQuestGroupQuestNo()
    if quest.questGroupNo == questGroupNo and quest.questNo == questNo then
      local funcButton = FGlobal_Dialog_GetPositionByIndex(index)
      funcButton._PosY = funcButton._PosY + Panel_Npc_Dialog:GetPosY() + 10
      if MoveAutoQuestCurser(getScreenSizeX() / 2, funcButton._PosY) == true then
        return 
      end
      if conditionTypeValue.Meet == questCompleteType then
        self._stateType = stateTypeValue.WaitingAccpetQuest
        break
      end
      if conditionTypeValue.Kill == questCompleteType then
        self._stateType = stateTypeValue.MovingHuntingArea
        break
      end
      if conditionTypeValue.UseItem == questCompleteType then
        self._stateType = stateTypeValue.UsingItem
      end
      break
    end
  end
  do
    _PA_LOG("장태�\132", "Talking() call!!")
  end
end

AutoQuestManager.HandleMovingHuntingArea = function(self)
  -- function num : 0_7 , upvalues : questList, stateTypeValue
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local questGroupNo = quest.questGroupNo
  local questNo = quest.questNo
  _PA_LOG("�\128민혁", "사냥터로 이동한다!")
  if questList_hasProgressQuest(questGroupNo, questNo) and dialog_isTalking() then
    return 
  end
  _PA_LOG("�\128민혁", "마우�\164 이동이동!")
  local index = FGlobal_CheckedQuestGetQuestUiButtonPosition(questGroupNo, questNo)
  if index == nil then
    return 
  end
  MousePosX = 280 + Panel_CheckedQuest:GetPosX()
  MousePosY = Panel_CheckedQuest:GetPosY() + (index + 50)
  if MoveAutoQuestCurser(MousePosX, MousePosY) == true then
    return 
  end
  local questWrapper = questList_getQuestStatic(questGroupNo, questNo)
  local positionCount = questWrapper:getQuestPositionCount()
  local position = questWrapper:getQuestPositionAt((math.random)(0, positionCount - 1))
  ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
  self._stateType = stateTypeValue.WaitingCompleteHunting
end

AutoQuestManager.HandleWaitingCompleteHunting = function(self)
  -- function num : 0_8 , upvalues : questList, stateTypeValue
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local questGroupNo = quest.questGroupNo
  local questNo = quest.questNo
  if self:isArriveGoal(questGroupNo, questNo) == false and self._isOnAutoAI == false then
    return 
  end
  if self._isOnAutoAI == false then
    self._isOnAutoAI = true
    ToClient_setIsSetSelfAI()
  end
  if self:isPass_OneSecond() == false then
    return 
  end
  self:EatPortion()
  if ToClient_isSatisfiedCondions(questGroupNo, questNo) == false then
    return 
  end
  ToClient_setIsSetSelfAI()
  _isSatisfied = true
  if self:isPass_huntingTick() == false then
    return 
  end
  self._stateType = stateTypeValue.WaitingAccpetQuest
  _PA_LOG("장태�\132", "WaitingCompleteHunting() call!!")
end

AutoQuestManager.HandleWaitingAccpetQuest = function(self)
  -- function num : 0_9 , upvalues : questList, stateTypeValue
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local questGroupNo = quest.questGroupNo
  local questNo = quest.questNo
  if questList_hasProgressQuest(questGroupNo, questNo) then
    if dialog_isTalking() then
      return 
    end
    local index = FGlobal_CheckedQuestGetQuestUiButtonPosition(questGroupNo, questNo)
    MousePosX = 280 + Panel_CheckedQuest:GetPosX()
    MousePosY = Panel_CheckedQuest:GetPosY() + (index + 50)
    if MoveAutoQuestCurser(MousePosX, MousePosY) == true then
      return 
    end
    local position = float3(quest.completeX, quest.completeY, quest.completeZ)
    ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
    self._stateType = stateTypeValue.CompleteInteraction
  end
  do
    _PA_LOG("장태�\132", "AcceptQuest() call!!")
  end
end

local isMoving = false
local isInteraction = false
AutoQuestManager.HandleUsingItem = function(self)
  -- function num : 0_10 , upvalues : questList, enHpPortionKey, isMoving, stateTypeValue
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local questGroupNo = quest.questGroupNo
  local questNo = quest.questNo
  local interactionCharacterKey = (ToClient_GetInteractionCharacterKey()):get()
  if questList_hasProgressQuest(questGroupNo, questNo) then
    if dialog_isTalking() then
      return 
    end
    local selfPlayerWrapper = getSelfPlayer()
    local selfPlayer = selfPlayerWrapper:get()
    local inventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
    tempItemEnchantKey = ItemEnchantKey(502, 0)
    slotValue = inventory:getSlot(tempItemEnchantKey)
    if enHpPortionKey.failedFind == slotValue then
      do
        if isMoving == false then
          local position = float3(quest.progressX, quest.progressY, quest.progressZ)
          ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
          isMoving = true
        end
        do return  end
        inventoryUseItem((CppEnums.ItemWhereType).eInventory, slotValue, 0, true)
        if ToClient_isSatisfiedCondions(questGroupNo, questNo) == false then
          return 
        end
        self._stateType = stateTypeValue.CompleteInteraction
        local position = float3(quest.completeX, quest.completeY, quest.completeZ)
        ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
      end
    end
  end
end

local bInteraction = false
AutoQuestManager.HandleCompleteInteraction = function(self)
  -- function num : 0_11 , upvalues : questList, bInteraction, stateTypeValue
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local completeCharacterKey = quest.completeCharacterKey
  local interactionCharacterKey = (ToClient_GetInteractionCharacterKey()):get()
  if completeCharacterKey == interactionCharacterKey then
    Interaction_ButtonPushed((CppEnums.InteractionType).InteractionType_Talk)
    ToClient_setMousePosition(getScreenSizeX() / 2, getScreenSizeY() / 2)
    bInteraction = true
  end
  if bInteraction == false then
    return 
  end
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local questGroupNo = quest.questGroupNo
  local questNo = quest.questNo
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local questCount = dialogData:getDialogButtonCount()
  for index = 0, questCount - 1 do
    local questButton = dialogData:getDialogButtonAt(index)
    local questStatic = questButton:getQuestStaticStatus()
    local questGroupNo = questStatic:getQuestGroupNo()
    local questNo = questStatic:getQuestGroupQuestNo()
    if quest.questGroupNo == questGroupNo and quest.questNo == questNo then
      local funcButton = FGlobal_Dialog_GetPositionByIndex(index)
      funcButton._PosY = funcButton._PosY + Panel_Npc_Dialog:GetPosY() + 10
      if MoveAutoQuestCurser(getScreenSizeX() / 2, funcButton._PosY) == true then
        return 
      end
      self._stateType = stateTypeValue.WaitingCompleteQuest
      break
    end
  end
  do
    _PA_LOG("장태�\132", "CompleteInteraction() call!!")
  end
end

AutoQuestManager.HandleWaitingCompleteQuest = function(self)
  -- function num : 0_12 , upvalues : questList, AutoQuestManager
  local quest = (questList[self._characterClassType])[self._currentQuestIndex]
  local questGroupNo = quest.questGroupNo
  local questNo = quest.questNo
  if questList_isClearQuest(questGroupNo, questNo) then
    AutoQuestManager:endQuest()
    return 
  end
  _PA_LOG("장태�\132", "CompleteQuest() call!!")
end

AutoQuestManager_UpdatePerFrame = function(deltaTime)
  -- function num : 0_13 , upvalues : AutoQuestManager, stateTypeValue
  local self = AutoQuestManager
  if self._doAutoQuest == false then
    return 
  end
  if stateTypeValue.AcceptInteraction == self._stateType then
    self:HandleAcceptInteraction()
  else
    if stateTypeValue.TalkingNpc == self._stateType then
      self:HandleTalkingNpc()
    else
      if stateTypeValue.MovingHuntingArea == self._stateType then
        self:HandleMovingHuntingArea()
      else
        if stateTypeValue.WaitingCompleteHunting == self._stateType then
          self:HandleWaitingCompleteHunting()
        else
          if stateTypeValue.WaitingAccpetQuest == self._stateType then
            self:HandleWaitingAccpetQuest()
          else
            if stateTypeValue.CompleteInteraction == self._stateType then
              self:HandleCompleteInteraction()
            else
              if stateTypeValue.WaitingCompleteQuest == self._stateType then
                self:HandleWaitingCompleteQuest()
              else
                if stateTypeValue.UsingItem == self._stateType then
                  self:HandleUsingItem()
                end
              end
            end
          end
        end
      end
    end
  end
end

MoveAutoQuestCurser = function(PosX, PosY)
  -- function num : 0_14 , upvalues : enMouseMoveValue
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

AutoQuestManager.isAdrenalineCharacter = function(self, ClassType)
  -- function num : 0_15 , upvalues : enAdrenalineCharacter
  for ii = 0, enAdrenalineCharacter.arrCount - 1 do
    if enAdrenalineCharacter[ii] == ClassType then
      return true
    end
  end
  return false
end

AutoQuestManager.getSelfPlayer_ClassType = function(self)
  -- function num : 0_16
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local selfClass = selfPlayerWrapper:getClassType()
  return selfClass
end

AutoQuestManager.EatPortion = function(self)
  -- function num : 0_17 , upvalues : enHpPortionKey, enAdrenalinePortionKey, enMpPortionKey
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local selfClass = selfPlayerWrapper:getClassType()
  local isAdrenaline = self:isAdrenalineCharacter(selfClass)
  local rateHp = selfPlayer:getHp() / selfPlayer:getMaxHp()
  local rateMp = selfPlayer:getMp() / selfPlayer:getMaxMp()
  local inventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local tempItemEnchantKey = 0
  local slotValue = 0
  if rateHp <= 0.99 then
    for ii = 0, enHpPortionKey.arrCount - 1 do
      tempItemEnchantKey = ItemEnchantKey(enHpPortionKey[ii], 0)
      slotValue = inventory:getSlot(tempItemEnchantKey)
      if enHpPortionKey.failedFind ~= slotValue then
        break
      end
    end
    do
      inventoryUseItem((CppEnums.ItemWhereType).eInventory, slotValue, 0, true)
      if rateMp <= 0.5 then
        tempItemEnchantKey = 0
        slotValue = 0
        if isAdrenaline == true then
          for ii = 0, enAdrenalinePortionKey.arrCount - 1 do
            tempItemEnchantKey = ItemEnchantKey(enAdrenalinePortionKey[ii], 0)
            slotValue = inventory:getSlot(tempItemEnchantKey)
            if enAdrenalinePortionKey.failedFind ~= slotValue then
              break
            end
          end
          do
            inventoryUseItem((CppEnums.ItemWhereType).eInventory, slotValue, 0, true)
            for ii = 0, enMpPortionKey.arrCount - 1 do
              tempItemEnchantKey = ItemEnchantKey(enMpPortionKey[ii], 0)
              slotValue = inventory:getSlot(tempItemEnchantKey)
              if enMpPortionKey.failedFind ~= slotValue then
                break
              end
              inventoryUseItem((CppEnums.ItemWhereType).eInventory, slotValue, 0, true)
            end
          end
        end
      end
    end
  end
end

testAccept = function()
  -- function num : 0_18
  local value = questList_isAcceptableQuest(1034, 1)
  _PA_LOG("�\128민혁", "isAcceptableQuest : " .. tostring(value))
end

testOpenInven = function()
  -- function num : 0_19
  Panel_Window_Inventory:SetShow(true)
end

testEat = function()
  -- function num : 0_20 , upvalues : AutoQuestManager
  AutoQuestManager:EatPortion()
end

testPanelOn = function()
  -- function num : 0_21
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_AutoQuestCurser:SetPosX(screenSizeX / 2)
  Panel_AutoQuestCurser:SetPosY(screenSizeY / 2)
  Panel_AutoQuestCurser:SetShow(true)
end

testPanelOff = function()
  -- function num : 0_22
  Panel_AutoQuestCurser:SetShow(false)
  Panel_AutoQuestCurser:EraseAllEffect()
end

testjmh = function()
  -- function num : 0_23
  _PA_LOG("�\128민혁", ((Panel_Npc_Dialog._uiFuncButton)[0]):GetPosX())
end

testMouse = function()
  -- function num : 0_24
  FGlobal_QuestWidget_MouseOver(true)
end

testQuest = function()
  -- function num : 0_25 , upvalues : AutoQuestManager
  AutoQuestManager:startQuest()
end

testBlack = function()
  -- function num : 0_26
  FGlobal_TentTooltipHide()
  ToClient_AddBlackSpiritFlush()
end

testAI = function()
  -- function num : 0_27
  ToClient_setIsSetSelfAI()
  _PA_LOG("�\128민혁", "현재 AI on/off 상태 : " .. ToClient_getIsSetSelfAI())
end

testComplete = function()
  -- function num : 0_28 , upvalues : AutoQuestManager
  local self = AutoQuestManager
  self._completeCondition = true
  _PA_LOG("�\128민혁", "_completeCondition = " .. tostring(self._completeCondition))
end


