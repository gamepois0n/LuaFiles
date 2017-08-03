-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_eventlist.luac 

-- params : ...
-- function num : 0
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_TutorialManager")
registerEvent("FromClient_DeleteNavigationGuide", "FromClient_DeleteNavigationGuide_TutorialManager")
registerEvent("EventQuestUpdateNotify", "FromClient_EventQuestUpdateNotify_TutorialManager")
registerEvent("FromClient_UpdateQuestList", "FromClient_UpdateQuestList_TutorialManager")
registerEvent("selfPlayer_regionChanged", "FromClient_selfPlayer_regionChanged_TutorialManager")
registerEvent("FromClient_ImmediatelyCloseWorldMap", "FromClient_ImmediatelyCloseWorldMap_TutorialManager")
registerEvent("FromClient_RClickedWorldMapNode", "FromClient_RClickedWorldMapNode_TutorialManager")
registerEvent("FromClient_RenderStateChange", "FromClient_RenderStateChange_TutorialManager")
registerEvent("FromClient_RClickWorldmapPanel", "FromClient_RClickWorldmapPanel_TutorialManager")
registerEvent("FromClient_resetTownMode", "FromClient_resetTownMode_TutorialManager")
registerEvent("FromClient_RClickedWorldMapHouse", "FromClient_RClickedWorldMapHouse_TutorialManager")
registerEvent("FromClint_EventUpdateExplorationNode", "FromClint_EventUpdateExplorationNode_TutorialManager")
FromClient_luaLoadComplete_TutorialManager = function(isTool)
  -- function num : 0_0
  PaGlobal_TutorialManager:handleLuaLoadComplete(isTool)
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleLuaLoadComplete = function(self, isTool)
  -- function num : 0_1
  _PA_LOG("곽민�\176", "@@@루아로드완료!!@@@")
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleTutorialUiManagerInitialize = function(self)
  -- function num : 0_2
  if isMoviePlayMode() == false then
    self:continueTutorial()
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleOpenedInventory = function(self)
  -- function num : 0_3
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleOpenedInventory ~= nil then
    (self:getCurrentPhase()):handleOpenedInventory()
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClosedInventory = function(self)
  -- function num : 0_4
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClosedInventory ~= nil then
    (self:getCurrentPhase()):handleClosedInventory()
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleUpdateInventorySlotData = function(self, slot, slotItemKey)
  -- function num : 0_5
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleUpdateInventorySlotData ~= nil then
    (self:getCurrentPhase()):handleUpdateInventorySlotData(slot, slotItemKey)
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleInventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_6
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleInventorySlotRClick ~= nil then
    (self:getCurrentPhase()):handleInventorySlotRClick(rClickedItemKey)
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleInventorySlotRClickgetSlotNo = function(self, SlotNo)
  -- function num : 0_7
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleInventorySlotRClickgetSlotNo ~= nil then
    (self:getCurrentPhase()):handleInventorySlotRClickgetSlotNo(SlotNo)
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNewEquipInInventory = function(self, newItemSlotNo)
  -- function num : 0_8
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleNewEquipInInventory ~= nil then
    (self:getCurrentPhase()):handleNewEquipInInventory(newItemSlotNo)
  else
    if self:isDoingTutorial() == false then
      if PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true or PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
        _PA_LOG("곽민�\176", "(아이�\156 장착 튜토리얼)다른 튜토리얼�\180 진행중이�\128�\156 노출하지 않습니다.")
        return 
      end
      local phaseNo = 16
      local stepNo = 1
    end
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEquipItem = function(self, slotNo)
  -- function num : 0_9
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEquipItem ~= nil then
    (self:getCurrentPhase()):handleEquipItem(slotNo)
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleInventoryDelete = function(self, itemWrapper, deleteWhereType, deleteSlotNo)
  -- function num : 0_10
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleInventoryDelete ~= nil then
    (self:getCurrentPhase()):handleInventoryDelete(itemWrapper, deleteWhereType, deleteSlotNo)
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleUpdateQuickSlotPerFrame = function(self, slot, quickSlotItemKey)
  -- function num : 0_11
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleUpdateQuickSlotPerFrame ~= nil then
    (self:getCurrentPhase()):handleUpdateQuickSlotPerFrame(slot, quickSlotItemKey)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleUpdateNewQuickSlotPerFrame = function(self, panelIdx, slot, newQuickSlotItemKey)
  -- function num : 0_12
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuickSlotClick = function(self, clickedItemKey)
  -- function num : 0_13
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuickSlotClick ~= nil then
    (self:getCurrentPhase()):handleQuickSlotClick(clickedItemKey)
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNewQuickSlotClick = function(self, clickedItemKey)
  -- function num : 0_14
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuickSlotRegistItem = function(self, slotIndex, dragWhereTypeInfo, dragSlotInfo)
  -- function num : 0_15
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuickSlotRegistItem ~= nil then
    (self:getCurrentPhase()):handleQuickSlotRegistItem(slotIndex, dragWhereTypeInfo, dragSlotInfo)
  end
end

FromClient_EventQuestUpdateNotify_TutorialManager = function(isAccept, questNoRaw)
  -- function num : 0_16
  PaGlobal_TutorialManager:handleEventQuestUpdateNotify(isAccept, questNoRaw)
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEventQuestUpdateNotify = function(self, isAccept, questNoRaw)
  -- function num : 0_17
  _PA_LOG("곽민�\176", "Manager: " .. "isAccept : " .. tostring(isAccept) .. ", QuestGroupNo : " .. tostring(self:getQuestGroupNoByQuestNoRaw(questNoRaw)) .. ", QuestId : " .. tostring(self:getQuestIdByQuestNoRaw(questNoRaw)))
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEventQuestUpdateNotify ~= nil then
    (self:getCurrentPhase()):handleEventQuestUpdateNotify(isAccept, questNoRaw)
  else
    if self:isDoingTutorial() == false then
      if isAccept == true then
        self:acceptTriggerQuest(questNoRaw)
      else
        if isAccept == false then
          self:clearTriggerQuest(questNoRaw)
        end
      end
    end
  end
end

FromClient_UpdateQuestList_TutorialManager = function()
  -- function num : 0_18
  PaGlobal_TutorialManager:handleQuestWidgetUpdate()
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuestWidgetUpdate = function(self)
  -- function num : 0_19
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuestWidgetUpdate ~= nil then
    (self:getCurrentPhase()):handleQuestWidgetUpdate()
  end
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleAfterAndPopFlush = function(self)
  -- function num : 0_20
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleAfterAndPopFlush ~= nil then
    (self:getCurrentPhase()):handleAfterAndPopFlush()
  end
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleUpdateMainDialog = function(self)
  -- function num : 0_21
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedQuestWidgetFindTarget = function(self, questGroupId, questId, condition, isAuto)
  -- function num : 0_22
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedQuestWidgetFindTarget ~= nil then
    (self:getCurrentPhase()):handleClickedQuestWidgetFindTarget(questGroupId, questId, condition, isAuto)
  end
end

FromClient_DeleteNavigationGuide_TutorialManager = function(key)
  -- function num : 0_23
  PaGlobal_TutorialManager:handleDeleteNavigationGuide(key)
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleDeleteNavigationGuide = function(self, key)
  -- function num : 0_24
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleDeleteNavigationGuide ~= nil then
    (self:getCurrentPhase()):handleDeleteNavigationGuide(key)
  end
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuestWidgetMouseOver = function(self, show)
  -- function num : 0_25
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuestWidgetMouseOver ~= nil then
    (self:getCurrentPhase()):handleQuestWidgetMouseOver(show)
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuestWidgetScrollEvent = function(self, isDown)
  -- function num : 0_26
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuestWidgetScrollEvent ~= nil then
    (self:getCurrentPhase()):handleQuestWidgetScrollEvent(isDown)
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEventSelfPlayerUsedSkill = function(self, skillWrapper)
  -- function num : 0_27
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEventSelfPlayerUsedSkill ~= nil then
    (self:getCurrentPhase()):handleEventSelfPlayerUsedSkill(skillWrapper)
  end
end

-- DECOMPILER ERROR at PC130: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleShowQuestNewWindow = function(self, isShow)
  -- function num : 0_28
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleShowQuestNewWindow ~= nil then
    (self:getCurrentPhase()):handleShowQuestNewWindow(isShow)
  end
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRadarMouseOn = function(self)
  -- function num : 0_29
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRadarMouseOn ~= nil then
    (self:getCurrentPhase()):handleRadarMouseOn()
  end
end

-- DECOMPILER ERROR at PC136: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleBeforeShowDialog = function(self)
  -- function num : 0_30
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleBeforeShowDialog ~= nil then
    (self:getCurrentPhase()):handleBeforeShowDialog()
  end
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleShowDialog = function(self, dialogData)
  -- function num : 0_31
  if self:isDoingTutorial() == true then
    if FGlobal_Dialog_IsAllowTutorialPanelShow() == false then
      Panel_Tutorial:SetShow(false, false)
    end
    if self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleShowDialog ~= nil then
      (self:getCurrentPhase()):handleShowDialog(dialogData)
    end
  end
end

-- DECOMPILER ERROR at PC142: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedExitButton = function(self, talker)
  -- function num : 0_32
  if self:isDoingTutorial() == true then
    if FGlobal_Dialog_IsAllowTutorialPanelShow() == false then
      Panel_Tutorial:SetShow(true, true)
    end
    if self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedExitButton ~= nil then
      (self:getCurrentPhase()):handleClickedExitButton(talker)
    end
  end
end

-- DECOMPILER ERROR at PC145: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedDialogTutorialStartButton = function(self, phaseNo)
  -- function num : 0_33
  self:startTutorial(phaseNo, 1)
end

-- DECOMPILER ERROR at PC148: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNpcShopWindowClose = function(self)
  -- function num : 0_34
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleNpcShopWindowClose ~= nil then
    (self:getCurrentPhase()):handleNpcShopWindowClose()
  end
end

-- DECOMPILER ERROR at PC151: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNpcShopUpdateContent = function(self)
  -- function num : 0_35
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleNpcShopUpdateContent ~= nil then
    (self:getCurrentPhase()):handleNpcShopUpdateContent()
  end
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNpcShopTabButtonClick = function(self, tabIndex)
  -- function num : 0_36
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleNpcShopTabButtonClick ~= nil then
    (self:getCurrentPhase()):handleNpcShopTabButtonClick(tabIndex)
  end
end

-- DECOMPILER ERROR at PC157: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleCloseIntroMovie = function(self)
  -- function num : 0_37
  if ((getSelfPlayer()):get()):getLevel() == 1 then
    self:continueTutorial()
  end
end

-- DECOMPILER ERROR at PC160: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleStopCutScene = function(self, cutSceneName)
  -- function num : 0_38
  if ((getSelfPlayer()):get()):getLevel() == 1 then
    for index,value in ipairs(self._firstCutSceneList) do
      if cutSceneName == value then
        self:continueTutorial()
        return 
      end
    end
  end
end

FromClient_selfPlayer_regionChanged_TutorialManager = function(regionInfo)
  -- function num : 0_39
  PaGlobal_TutorialManager:handleRegionChanged(regionInfo)
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRegionChanged = function(self, regionInfo)
  -- function num : 0_40
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRegionChanged ~= nil then
    _PA_LOG("곽민�\176", "[튜토리얼�\145 �\128�\173 이동] RegionKeyRaw : " .. tostring(regionInfo:getRegionKey()) .. " / AreaName : " .. tostring(regionInfo:getAreaName()))
    ;
    (self:getCurrentPhase()):handleRegionChanged(regionInfo)
  end
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleBeforeWorldmapOpen = function(self)
  -- function num : 0_41
  if self:isDoingTutorial() == true then
    if FGlobal_WorldmapMain_IsAllowTutorialPanelShow() == false then
      Panel_Tutorial:SetShow(false, false)
      return 
    end
    if self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleBeforeWorldmapOpen ~= nil then
      (self:getCurrentPhase()):handleBeforeWorldmapOpen()
    end
  end
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleWorldMapOpenComplete = function(self)
  -- function num : 0_42
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleWorldMapOpenComplete ~= nil then
    (self:getCurrentPhase()):handleWorldMapOpenComplete()
  end
end

FromClient_ImmediatelyCloseWorldMap_TutorialManager = function()
  -- function num : 0_43
  PaGlobal_TutorialManager:handleWorldMapImmediatelyClose()
end

-- DECOMPILER ERROR at PC176: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_44
  if self:isDoingTutorial() == true then
    if FGlobal_WorldmapMain_IsAllowTutorialPanelShow() == false then
      Panel_Tutorial:SetShow(true, true)
    end
    if self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleWorldMapImmediatelyClose ~= nil then
      (self:getCurrentPhase()):handleWorldMapImmediatelyClose()
    end
  end
end

-- DECOMPILER ERROR at PC179: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_45
  _PA_LOG("곽민�\176", "LClick uiNodeButton:getWaypointKey() : " .. tostring(uiNodeButton:getWaypointKey()))
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleLClickWorldMapNode ~= nil then
    (self:getCurrentPhase()):handleLClickWorldMapNode(uiNodeButton)
  end
end

FromClient_RClickedWorldMapNode_TutorialManager = function(uiNodeButton)
  -- function num : 0_46
  PaGlobal_TutorialManager:handleRClickWorldMapNode(uiNodeButton)
end

-- DECOMPILER ERROR at PC184: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_47
  _PA_LOG("곽민�\176", "RClick uiNodeButton:getWaypointKey() : " .. tostring(uiNodeButton:getWaypointKey()))
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRClickWorldMapNode ~= nil then
    (self:getCurrentPhase()):handleRClickWorldMapNode(uiNodeButton)
  end
end

FromClient_RenderStateChange_TutorialManager = function(changeState)
  -- function num : 0_48
  PaGlobal_TutorialManager:handleRenderStateChange(changeState)
end

-- DECOMPILER ERROR at PC189: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRenderStateChange = function(self, changeState)
  -- function num : 0_49
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRenderStateChange ~= nil then
    (self:getCurrentPhase()):handleRenderStateChange(changeState)
  end
end

FromClient_RClickWorldmapPanel_TutorialManager = function(pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  -- function num : 0_50
  PaGlobal_TutorialManager:handleRClickWorldmapPanel(pos3D, immediately, isTopPicking, uiKnowledgeStatic)
end

-- DECOMPILER ERROR at PC194: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRClickWorldmapPanel = function(self, pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  -- function num : 0_51
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRClickWorldmapPanel ~= nil then
    (self:getCurrentPhase()):handleRClickWorldmapPanel(pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  end
end

-- DECOMPILER ERROR at PC197: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleWorldmapMainEventTempControl = function(self)
  -- function num : 0_52
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleWorldmapMainEventTempControl ~= nil then
    (self:getCurrentPhase()):handleWorldmapMainEventTempControl()
  end
end

-- DECOMPILER ERROR at PC200: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedGrandWorldMapSearchNodeType = function(self, typeIndex)
  -- function num : 0_53
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedGrandWorldMapSearchNodeType ~= nil then
    (self:getCurrentPhase()):handleClickedGrandWorldMapSearchNodeType(typeIndex)
  end
end

-- DECOMPILER ERROR at PC203: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedGrandWorldmapGotoNodeFocus = function(self, resultIdx)
  -- function num : 0_54
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedGrandWorldmapGotoNodeFocus ~= nil then
    (self:getCurrentPhase()):handleClickedGrandWorldmapGotoNodeFocus(resultIdx)
  end
end

FromClient_resetTownMode_TutorialManager = function()
  -- function num : 0_55
  PaGlobal_TutorialManager:handleResetTownMode()
end

-- DECOMPILER ERROR at PC208: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleResetTownMode = function(self)
  -- function num : 0_56
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleResetTownMode ~= nil then
    (self:getCurrentPhase()):handleResetTownMode()
  end
end

-- DECOMPILER ERROR at PC211: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNpcNavi_ShowToggle = function(self, isShow)
  -- function num : 0_57
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleNpcNavi_ShowToggle ~= nil then
    (self:getCurrentPhase()):handleNpcNavi_ShowToggle(isShow)
  end
end

-- DECOMPILER ERROR at PC214: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedTownNpcIconNaviStart = function(self, spawnType, isAuto)
  -- function num : 0_58
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedTownNpcIconNaviStart ~= nil then
    (self:getCurrentPhase()):handleClickedTownNpcIconNaviStart(spawnType, isAuto)
  end
end

-- DECOMPILER ERROR at PC217: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.checkTargetHouseKeyForTutorial = function(self, houseKey)
  -- function num : 0_59
  if (self:getCurrentPhase()):getTargetHouseKey() ~= houseKey then
    do return self:isDoingTutorial() ~= true or self:getCurrentPhase() == nil or (self:getCurrentPhase()).getTargetHouseKey == nil end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC220: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleHouseHoldButtonSetBaseTexture = function(self, houseBtn)
  -- function num : 0_60
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleHouseHoldButtonSetBaseTexture ~= nil then
    (self:getCurrentPhase()):handleHouseHoldButtonSetBaseTexture(houseBtn)
  end
end

-- DECOMPILER ERROR at PC223: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleLClickedWorldMapHouse = function(self, uiHouseButton)
  -- function num : 0_61
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleLClickedWorldMapHouse ~= nil then
    (self:getCurrentPhase()):handleLClickedWorldMapHouse(uiHouseButton)
  end
end

FromClient_RClickedWorldMapHouse_TutorialManager = function(uiHouseButton)
  -- function num : 0_62
  PaGlobal_TutorialManager:handleRClickedWorldMapHouse(uiHouseButton)
end

-- DECOMPILER ERROR at PC228: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRClickedWorldMapHouse = function(self, uiHouseButton)
  -- function num : 0_63
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRClickedWorldMapHouse ~= nil then
    (self:getCurrentPhase()):handleRClickedWorldMapHouse(uiHouseButton)
  end
end

-- DECOMPILER ERROR at PC231: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedHouseControlSetUseType = function(self, index, groupType)
  -- function num : 0_64
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedHouseControlSetUseType ~= nil then
    (self:getCurrentPhase()):handleClickedHouseControlSetUseType(index, groupType)
  end
end

-- DECOMPILER ERROR at PC234: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedHouseControlBuyHouseContinue = function(self)
  -- function num : 0_65
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedHouseControlBuyHouseContinue ~= nil then
    (self:getCurrentPhase()):handleClickedHouseControlBuyHouseContinue()
  end
end

-- DECOMPILER ERROR at PC237: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedHouseControlSellHouseContinue = function(self, houseKey)
  -- function num : 0_66
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedHouseControlSellHouseContinue ~= nil then
    (self:getCurrentPhase()):handleClickedHouseControlSellHouseContinue(houseKey)
  end
end

-- DECOMPILER ERROR at PC240: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleCloseHouseControl = function(self)
  -- function num : 0_67
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleCloseHouseControl ~= nil then
    (self:getCurrentPhase()):handleCloseHouseControl()
  end
end

-- DECOMPILER ERROR at PC243: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleTradeMarketSellSomeConfirm = function(self, itemKey)
  -- function num : 0_68
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleTradeMarketSellSomeConfirm ~= nil then
    (self:getCurrentPhase()):handleTradeMarketSellSomeConfirm(itemKey)
  end
end

-- DECOMPILER ERROR at PC246: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedTradeItemAllSell = function(self, talker)
  -- function num : 0_69
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedTradeItemAllSell ~= nil then
    (self:getCurrentPhase()):handleClickedTradeItemAllSell(talker)
  end
end

-- DECOMPILER ERROR at PC249: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleGrandWorldMap_CheckPopup = function(self, openPanelEnum, popupPanel)
  -- function num : 0_70
  _PA_LOG("곽민�\176", "handleGrandWorldMap_CheckPopup( " .. tostring(openPanelEnum) .. ", " .. tostring(popupPanel) .. " )")
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleGrandWorldMap_CheckPopup ~= nil then
    (self:getCurrentPhase()):handleGrandWorldMap_CheckPopup(openPanelEnum, popupPanel)
  end
end

-- DECOMPILER ERROR at PC252: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleInteractionShow = function(self, actorProxyWrapper)
  -- function num : 0_71
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleInteractionShow ~= nil then
    (self:getCurrentPhase()):handleInteractionShow(actorProxyWrapper)
  end
end

-- DECOMPILER ERROR at PC255: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_72
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedDialogFuncButton ~= nil then
    (self:getCurrentPhase()):handleClickedDialogFuncButton(funcButtonType)
  end
end

-- DECOMPILER ERROR at PC258: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleOnNodeUpgradeClick = function(self, nodeKey)
  -- function num : 0_73
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleOnNodeUpgradeClick ~= nil then
    (self:getCurrentPhase()):handleOnNodeUpgradeClick(nodeKey)
  end
end

FromClint_EventUpdateExplorationNode_TutorialManager = function(waypointKey)
  -- function num : 0_74
  PaGlobal_TutorialManager:handleEventUpdateExplorationNode(waypointKey)
end

-- DECOMPILER ERROR at PC263: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_75
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEventUpdateExplorationNode ~= nil then
    (self:getCurrentPhase()):handleEventUpdateExplorationNode(waypointKey)
  end
end

-- DECOMPILER ERROR at PC266: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickPlantdoWork = function(self, plantKey, workingCount)
  -- function num : 0_76
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickPlantdoWork ~= nil then
    (self:getCurrentPhase()):handleClickPlantdoWork(plantKey, workingCount)
  end
end

-- DECOMPILER ERROR at PC269: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleSetTownMode = function(self, waypointKey)
  -- function num : 0_77
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleSetTownMode ~= nil then
    (self:getCurrentPhase()):handleSetTownMode(waypointKey)
  end
end

FromClient_RegisterExplorationNode_TutorialManager = function(waypointKey)
  -- function num : 0_78
  _PA_LOG("곽민�\176", "�\136 노드 등록 waypointKey : " .. tostring(waypointKey))
  PaGlobal_TutorialManager:handleRegisterExplorationNode(waypointKey)
end

-- DECOMPILER ERROR at PC274: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRegisterExplorationNode = function(self, waypointKey)
  -- function num : 0_79
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRegisterExplorationNode ~= nil then
    (self:getCurrentPhase()):handleRegisterExplorationNode(waypointKey)
  else
    if waypointKey == 301 then
      local phaseNo = 13
      if self._isInitialized == false then
        self:initialize()
      end
      if ((self._phaseList)[phaseNo]).checkPossibleForPhaseStart ~= nil and ((self._phaseList)[phaseNo]):checkPossibleForPhaseStart(1) == false then
        return 
      end
      self:startTutorial(phaseNo, 1)
    end
  end
end

-- DECOMPILER ERROR at PC277: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickWorldmapTutorialButton = function(self, buttonNum)
  -- function num : 0_80
  local phaseNo = 0
  if buttonNum == 1 then
    phaseNo = 10
  else
    if buttonNum == 2 then
      phaseNo = 11
    else
      if buttonNum == 3 then
        phaseNo = 12
      end
    end
  end
  if self._isInitialized == false then
    self:initialize()
  end
  _PA_LOG("곽민�\176", "phaseNo : " .. tostring(phaseNo))
  if ((self._phaseList)[phaseNo]).checkPossibleForPhaseStart ~= nil and ((self._phaseList)[phaseNo]):checkPossibleForPhaseStart(1) == false then
    return 
  end
  self:startTutorial(phaseNo, 1)
end

-- DECOMPILER ERROR at PC280: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleCloseEnchantWindow = function(self)
  -- function num : 0_81
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleCloseEnchantWindow ~= nil then
    (self:getCurrentPhase()):handleCloseEnchantWindow()
  end
end

-- DECOMPILER ERROR at PC283: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEnchantResultShow = function(self, resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_82
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEnchantResultShow ~= nil then
    (self:getCurrentPhase()):handleEnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  end
end

-- DECOMPILER ERROR at PC286: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleExtractionEnchantStoneResultShow = function(self)
  -- function num : 0_83
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleExtractionEnchantStoneResultShow ~= nil then
    (self:getCurrentPhase()):handleExtractionEnchantStoneResultShow()
  end
end

-- DECOMPILER ERROR at PC289: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleOpenExtractionPanel = function(self, isShow)
  -- function num : 0_84
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleOpenExtractionPanel ~= nil then
    (self:getCurrentPhase()):handleOpenExtractionPanel(isShow)
  end
end

-- DECOMPILER ERROR at PC292: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickExtractionEnchantStoneButton = function(self, isShow)
  -- function num : 0_85
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickExtractionEnchantStoneButton ~= nil then
    (self:getCurrentPhase()):handleClickExtractionEnchantStoneButton(isShow)
  end
end

-- DECOMPILER ERROR at PC295: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickExtractionCrystalButton = function(self, isShow)
  -- function num : 0_86
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickExtractionCrystalButton ~= nil then
    (self:getCurrentPhase()):handleClickExtractionCrystalButton(isShow)
  end
end

-- DECOMPILER ERROR at PC298: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickExtractionClothButton = function(self, isShow)
  -- function num : 0_87
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickExtractionClothButton ~= nil then
    (self:getCurrentPhase()):handleClickExtractionClothButton(isShow)
  end
end

-- DECOMPILER ERROR at PC301: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleApplyExtractionEnchantStone = function(self)
  -- function num : 0_88
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleApplyExtractionEnchantStone ~= nil then
    (self:getCurrentPhase()):handleApplyExtractionEnchantStone()
  end
end

-- DECOMPILER ERROR at PC304: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleMouseLUpBubble = function(self)
  -- function num : 0_89
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleMouseLUpBubble ~= nil then
    (self:getCurrentPhase()):handleMouseLUpBubble()
  end
end


