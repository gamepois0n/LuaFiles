-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\workermanager\panel_workermanager.luac 

-- params : ...
-- function num : 0
Panel_WorkerManager:SetShow(false)
Panel_WorkerManager:setGlassBackground(true)
Panel_WorkerManager:ActiveMouseEventEffect(true)
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_Color = Defines.Color
local UI_PD = CppEnums.Padding
local isContentOpen = ToClient_IsContentsGroupOpen("259")
Panel_WorkerManager:RegisterShowEventFunc(true, "WorkerManager_ShowAni()")
Panel_WorkerManager:RegisterShowEventFunc(false, "WorkerManager_HideAni()")
local workerManager = {plantKey = nil, slotFixMaxCount = 6, slotMaxCount = 6, 
slot = {}
, startPosY = 5, _startIndex = 1, _listCount = 0, penelTitle = (UI.getChildControl)(Panel_WorkerManager, "titlebar_manageWorker"), workerListBg = (UI.getChildControl)(Panel_WorkerManager, "Static_WorkerList_BG"), _scroll = (UI.getChildControl)(Panel_WorkerManager, "WorkerList_ScrollBar"), _btnClose = (UI.getChildControl)(Panel_WorkerManager, "Button_Close"), checkPopUp = (UI.getChildControl)(Panel_WorkerManager, "CheckButton_PopUp"), _btnFire = (UI.getChildControl)(Panel_WorkerManager, "button_doWorkerFire"), _btnUpgradeNow = (UI.getChildControl)(Panel_WorkerManager, "button_UpgradeNow"), _restoreAll = (UI.getChildControl)(Panel_WorkerManager, "Button_Restore_All"), _reDoAll = (UI.getChildControl)(Panel_WorkerManager, "Button_ReDo_All"), _resetUpgradeCount = (UI.getChildControl)(Panel_WorkerManager, "Button_ResetUpgradeCount"), restoreItemMaxCount = 5, restoreItemHasCount = 0, 
restoreItemSlot = {}
, selectedRestoreWorkerIdx = 0, selectedUiIndex = -1, sliderStartIdx = 0, upgradeWokerNoRaw = -1, restoreItemBG = (UI.getChildControl)(Panel_WorkerManager, "Static_Restore_Item_BG"), btn_restoreItemClose = (UI.getChildControl)(Panel_WorkerManager, "Button_Close_Item"), _slider = (UI.getChildControl)(Panel_WorkerManager, "Slider_Restore_Item"), guideRestoreAll = (UI.getChildControl)(Panel_WorkerManager, "StaticText_Guide_RestoreAll"), desc = (UI.getChildControl)(Panel_WorkerManager, "StaticText_Description"), 
slotConfig = {createIcon = true, createBorder = false, createCount = true, createCash = true}
}
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
;
(workerManager.checkPopUp):SetShow(isPopUpContentsEnable)
workerManager._scrollBtn = (UI.getChildControl)(workerManager._scroll, "Frame_ScrollBar_thumb")
workerManager._sliderBtn = (UI.getChildControl)(workerManager._slider, "Slider_Restore_Item_Button")
local workerArray = (Array.new)()
WorkerManager_ShowAni = function()
  -- function num : 0_0
  Panel_WorkerManager:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_WorkerManager, 0, 0.3)
end

WorkerManager_HideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_WorkerManager, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

workerManager.registEventHandler = function(self)
  -- function num : 0_2
  (self._btnClose):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_Close()")
  ;
  (self.checkPopUp):addInputEvent("Mouse_LUp", "workerManager_PopUp()")
  ;
  (self.checkPopUp):addInputEvent("Mouse_On", "workerManager_PopUp_ShowIconToolTip(true)")
  ;
  (self.checkPopUp):addInputEvent("Mouse_Out", "workerManager_PopUp_ShowIconToolTip(false)")
  ;
  (self._btnFire):addInputEvent("Mouse_LUp", "HandleClicked_workerManager_WaitWorkerFire()")
  ;
  (self._btnUpgradeNow):addInputEvent("Mouse_LUp", "HandleClicked_workerManager_WorkerUpgradeNow()")
  ;
  (self._restoreAll):addInputEvent("Mouse_LUp", "HandleClicked_workerManager_RestoreAll()")
  ;
  (self._reDoAll):addInputEvent("Mouse_LUp", "HandleClicked_workerManager_ReDoAll()")
  ;
  (self.btn_restoreItemClose):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_RestoreItemClose()")
  ;
  (self.restoreItemBG):addInputEvent("Mouse_UpScroll", "workerManager_SliderScroll( true )")
  ;
  (self.restoreItemBG):addInputEvent("Mouse_DownScroll", "workerManager_SliderScroll( false )")
  ;
  (self._slider):addInputEvent("Mouse_LUp", "HandleLPress_WorkerManager_RestoreItemSlider()")
  ;
  (self._resetUpgradeCount):addInputEvent("Mouse_LUp", "HandleClicked_UpgradeCountReset_Show()")
  Panel_WorkerManager:RegisterUpdateFunc("workerManager_FrameUpdate")
end

workerManager.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("onScreenResize", "workerManager_ResetPos")
  registerEvent("WorldMap_WorkerDataUpdate", "FromClient_WorkerDataAllUpdate")
  registerEvent("WorldMap_StopWorkerWorking", "Push_Worker_StopWork_Message")
  registerEvent("WorldMap_WorkerDataUpdate", "FromClient_WorkerDataUpdate_HeadingPlant")
  registerEvent("WorldMap_WorkerDataUpdateByHouse", "FromClient_WorkerDataUpdate_HeadingHouse")
  registerEvent("WorldMap_WorkerDataUpdateByBuilding", "FromClient_WorkerDataUpdate_HeadingBuilding")
  registerEvent("WorldMap_WorkerDataUpdateByRegionManaging", "FromClient_WorkerDataUpdate_HeadingRegionManaging")
  registerEvent("FromClient_UpdateLastestWorkingResult", "Push_Work_ResultItem_Message")
  registerEvent("FromClient_changeLeftWorking", "FromClient_changeLeftWorking")
  registerEvent("FromClient_AppliedChangeUseType", "FromClient_WorkerDataAllUpdate")
  registerEvent("FromClient_ReceiveReturnHouse", "FromClient_WorkerDataAllUpdate")
  registerEvent("FromClient_ChangeWorkerSkillNoOne", "FromClient_ChangeWorkerSkillNoOne")
  registerEvent("FromClient_ChangeWorkerSkillNo", "FromClient_ChangeWorkerSkillNo")
  registerEvent("FromClient_ClearWorkerUpgradePoint", "FromClient_ClearWorkerUpgradePoint")
end

local workedWorker = {}
local workerCheckList = {}
local workType = {_HouseCraft = 0, _LargeCraft = 1, _PlantWork = 2, _Building = 3, _RegionWork = 4, _upgrade = 5, _harvest = 6}
local restoreWorkerNo = nil
local workerGrade = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERGRADE_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERGRADE_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERGRADE_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERGRADE_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERGRADE_4")}
local workerManager_Initiallize = function()
  -- function num : 0_4 , upvalues : workerManager, UI_TM, UI_PD, isContentOpen
  local self = workerManager
  for slotIdx = 0, self.slotMaxCount - 1 do
    local tempSlot = {}
    tempSlot.bg = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Static_workerBG", self.workerListBg, "workerManager_WorkerSlotBG_" .. slotIdx)
    tempSlot.picture = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Static_WorkerPicture", tempSlot.bg, "workerManager_WorkerSlot_Picture_" .. slotIdx)
    tempSlot.workerCheck = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "button_worker_checkBox", tempSlot.bg, "workerManager_WorkerSlot_WorkerCheck_" .. slotIdx)
    tempSlot.workerHpBG = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Static_RestorePointBG", tempSlot.bg, "workerManager_WorkerSlot_WorkerHpBG_" .. slotIdx)
    tempSlot.workerRestorePT = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Progress2_RestorePoint", tempSlot.bg, "workerManager_WorkerSlot_WorkerRestorePT_" .. slotIdx)
    tempSlot.workerCurrentPT = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Progress2_CurrentPoint", tempSlot.bg, "workerManager_WorkerSlot_WorkerCurrentPT_" .. slotIdx)
    tempSlot.workerName = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "workerManage_workerName", tempSlot.bg, "workerManager_WorkerSlot_WorkerName_" .. slotIdx)
    tempSlot.workerNodeName = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "workerManage_workerNodeName", tempSlot.bg, "workerManager_WorkerSlot_WorkerNodeName_" .. slotIdx)
    tempSlot.progressBg = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Static_ProgressBG", tempSlot.bg, "workerManager_WorkerSlot_ProgressBg_" .. slotIdx)
    tempSlot.progress = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Progress2_RemainTime", tempSlot.bg, "workerManager_WorkerSlot_Progress_" .. slotIdx)
    tempSlot.workingName = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "workerManage_workingName", tempSlot.bg, "workerManager_WorkerSlot_WorkingName_" .. slotIdx)
    tempSlot.btn_Restore = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Button_WorkRestore", tempSlot.bg, "workerManager_WorkerSlot_BTN_WorkerRestore_" .. slotIdx)
    tempSlot.btn_Upgrade = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Button_WorkerUpgrade", tempSlot.bg, "workerManager_WorkerSlot_BTN_WorkerUpgrade_" .. slotIdx)
    tempSlot.btn_ChangeSkill = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Button_WorkerChangeSkill", tempSlot.bg, "workerManager_WorkerSlot_BTN_WorkerChangeSkill_" .. slotIdx)
    tempSlot.btn_Stop = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Button_WorkStop", tempSlot.bg, "workerManager_WorkerSlot_BTN_WorkStop_" .. slotIdx)
    tempSlot.btn_Repeat = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Button_RepeatWork", tempSlot.bg, "workerManager_WorkerSlot_BTN_WorkRepeat_" .. slotIdx)
    tempSlot.btn_UnRepeat = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Button_UnRepeatWork", tempSlot.bg, "workerManager_WorkerSlot_BTN_WorkUnRepeat_" .. slotIdx)
    tempSlot.btn_resetCount = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Button_ResetCount", tempSlot.bg, "workerManager_WorkerSlot_BTN_UpgradeResetCount_" .. slotIdx)
    ;
    (tempSlot.bg):SetPosX(5)
    ;
    (tempSlot.bg):SetPosY(self.startPosY + ((tempSlot.bg):GetSizeY() + 5) * slotIdx)
    ;
    (tempSlot.workerCheck):SetPosX(35)
    ;
    (tempSlot.workerCheck):SetPosY(32)
    ;
    (tempSlot.picture):SetPosX(5)
    ;
    (tempSlot.picture):SetPosY(3)
    ;
    (tempSlot.picture):SetIgnore(false)
    ;
    (tempSlot.workerName):SetPosX(60)
    ;
    (tempSlot.workerName):SetPosY(0)
    ;
    (tempSlot.workerNodeName):SetPosX(185)
    ;
    (tempSlot.workerNodeName):SetPosY(0)
    ;
    (tempSlot.workerHpBG):SetPosX(58)
    ;
    (tempSlot.workerHpBG):SetPosY((tempSlot.workerName):GetSizeY() + 1.5)
    ;
    (tempSlot.workerRestorePT):SetPosX(58)
    ;
    (tempSlot.workerRestorePT):SetPosY((tempSlot.workerName):GetSizeY() + 5)
    ;
    (tempSlot.workerCurrentPT):SetPosX(58)
    ;
    (tempSlot.workerCurrentPT):SetPosY((tempSlot.workerName):GetSizeY() + 5)
    ;
    (tempSlot.progressBg):SetPosX(58)
    ;
    (tempSlot.progressBg):SetPosY((tempSlot.workerRestorePT):GetPosY() + (tempSlot.workerRestorePT):GetSizeY() + 7)
    ;
    (tempSlot.progress):SetPosX(58)
    ;
    (tempSlot.progress):SetPosY((tempSlot.workerRestorePT):GetPosY() + (tempSlot.workerRestorePT):GetSizeY() + 8)
    ;
    (tempSlot.workingName):SetPosX(62)
    ;
    (tempSlot.workingName):SetPosY((tempSlot.progressBg):GetPosY())
    ;
    (tempSlot.btn_Restore):SetPosX((tempSlot.progressBg):GetPosX() + (tempSlot.progressBg):GetSizeX())
    ;
    (tempSlot.btn_Restore):SetPosY(((tempSlot.progressBg):GetPosY() + (tempSlot.workerHpBG):GetPosY()) / 2.5)
    ;
    (tempSlot.btn_Stop):SetPosX((tempSlot.btn_Restore):GetPosX() + (tempSlot.btn_Restore):GetSizeX() + 2)
    ;
    (tempSlot.btn_Stop):SetPosY(((tempSlot.progressBg):GetPosY() + (tempSlot.workerHpBG):GetPosY()) / 2.5)
    ;
    (tempSlot.btn_Repeat):SetPosX((tempSlot.btn_Restore):GetPosX() + (tempSlot.btn_Restore):GetSizeX() + 2)
    ;
    (tempSlot.btn_Repeat):SetPosY(((tempSlot.progressBg):GetPosY() + (tempSlot.workerHpBG):GetPosY()) / 2.5)
    ;
    (tempSlot.btn_UnRepeat):SetPosX((tempSlot.btn_Repeat):GetPosX() + (tempSlot.btn_Repeat):GetSizeX() + 2)
    ;
    (tempSlot.btn_UnRepeat):SetPosY(((tempSlot.progressBg):GetPosY() + (tempSlot.workerHpBG):GetPosY()) / 2.5)
    ;
    (tempSlot.btn_Upgrade):SetPosX((tempSlot.btn_UnRepeat):GetPosX() + (tempSlot.btn_UnRepeat):GetSizeX() + 2)
    ;
    (tempSlot.btn_Upgrade):SetPosY(((tempSlot.progressBg):GetPosY() + (tempSlot.workerHpBG):GetPosY()) / 2.5)
    ;
    (tempSlot.btn_resetCount):ComputePos()
    ;
    (tempSlot.btn_ChangeSkill):SetPosX((tempSlot.btn_Upgrade):GetPosX() + (tempSlot.btn_Upgrade):GetSizeX() + 2)
    ;
    (tempSlot.btn_ChangeSkill):SetPosY(((tempSlot.progressBg):GetPosY() + (tempSlot.workerHpBG):GetPosY()) / 2.5)
    ;
    (tempSlot.bg):addInputEvent("Mouse_UpScroll", "workerManager_ScrollEvent( true )")
    ;
    (tempSlot.bg):addInputEvent("Mouse_DownScroll", "workerManager_ScrollEvent( false )")
    ;
    (tempSlot.workerName):addInputEvent("Mouse_UpScroll", "workerManager_ScrollEvent( true )")
    ;
    (tempSlot.workerName):addInputEvent("Mouse_DownScroll", "workerManager_ScrollEvent( false )")
    ;
    (tempSlot.workingName):addInputEvent("Mouse_UpScroll", "workerManager_ScrollEvent( true )")
    ;
    (tempSlot.workingName):addInputEvent("Mouse_DownScroll", "workerManager_ScrollEvent( false )")
    ;
    (tempSlot.progressBg):addInputEvent("Mouse_UpScroll", "workerManager_ScrollEvent( true )")
    ;
    (tempSlot.progressBg):addInputEvent("Mouse_DownScroll", "workerManager_ScrollEvent( false )")
    ;
    (tempSlot.progress):addInputEvent("Mouse_UpScroll", "workerManager_ScrollEvent( true )")
    ;
    (tempSlot.progress):addInputEvent("Mouse_DownScroll", "workerManager_ScrollEvent( false )")
    ;
    (tempSlot.picture):addInputEvent("Mouse_UpScroll", "workerManager_ScrollEvent( true )")
    ;
    (tempSlot.picture):addInputEvent("Mouse_DownScroll", "workerManager_ScrollEvent( false )")
    -- DECOMPILER ERROR at PC505: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.slot)[slotIdx] = tempSlot
  end
  ;
  (self.workerListBg):addInputEvent("Mouse_UpScroll", "workerManager_ScrollEvent( true )")
  ;
  (self.workerListBg):addInputEvent("Mouse_DownScroll", "workerManager_ScrollEvent( false )")
  ;
  (UIScroll.InputEvent)(workerManager._scroll, "workerManager_ScrollEvent")
  for resIdx = 0, self.restoreItemMaxCount - 1 do
    local tempItemSlot = {}
    tempItemSlot.slotBG = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Static_Restore_Item_Icone_BG", self.restoreItemBG, "workerManager_restoreSlotBG_" .. resIdx)
    tempItemSlot.slotIcon = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "Static_Restore_Item_Icone", tempItemSlot.slotBG, "workerManager_restoreSlot_" .. resIdx)
    tempItemSlot.itemCount = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "StaticText_Item_Count", tempItemSlot.slotIcon, "workerManager_restoreItemCount_" .. resIdx)
    tempItemSlot.restorePoint = (UI.createAndCopyBasePropertyControl)(Panel_WorkerManager, "StaticText_Item_Restore_Value", tempItemSlot.slotIcon, "workerManager_restorePoint_" .. resIdx)
    ;
    (tempItemSlot.slotBG):SetPosX(5 + (tempItemSlot.slotBG):GetSizeX() * resIdx)
    ;
    (tempItemSlot.slotBG):SetPosY(23)
    ;
    (tempItemSlot.slotIcon):SetPosX(5)
    ;
    (tempItemSlot.slotIcon):SetPosY(5)
    ;
    (tempItemSlot.itemCount):SetPosX((tempItemSlot.slotIcon):GetSizeX() - 9)
    ;
    (tempItemSlot.itemCount):SetPosY((tempItemSlot.slotIcon):GetSizeY() - 10)
    ;
    (tempItemSlot.restorePoint):SetPosX(3)
    ;
    (tempItemSlot.restorePoint):SetPosY(2)
    ;
    (tempItemSlot.slotIcon):addInputEvent("Mouse_UpScroll", "workerManager_SliderScroll( true )")
    ;
    (tempItemSlot.slotIcon):addInputEvent("Mouse_DownScroll", "workerManager_SliderScroll( false )")
    -- DECOMPILER ERROR at PC622: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.restoreItemSlot)[resIdx] = tempItemSlot
  end
  ;
  (self.restoreItemBG):AddChild(self.btn_restoreItemClose)
  ;
  (self.restoreItemBG):AddChild(self._slider)
  ;
  (self.restoreItemBG):AddChild(self.guideRestoreAll)
  Panel_WorkerManager:RemoveControl(self.btn_restoreItemClose)
  Panel_WorkerManager:RemoveControl(self._slider)
  Panel_WorkerManager:RemoveControl(self.guideRestoreAll)
  ;
  (self.btn_restoreItemClose):ComputePos()
  ;
  (self._slider):ComputePos()
  ;
  (self.guideRestoreAll):ComputePos()
  ;
  (self.desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.desc):SetAutoResize(true)
  ;
  (self.desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_DESCRIPTION"))
  ;
  (self.desc):ComputePos()
  ;
  (self.btn_restoreItemClose):SetShow(true)
  ;
  (self.desc):setPadding(UI_PD.ePadding_Left, 10)
  ;
  (self.desc):setPadding(UI_PD.ePadding_Right, 10)
  if isContentOpen then
    (self._restoreAll):SetSize(130, 30)
    ;
    (self._reDoAll):SetSize(130, 30)
    ;
    (self._resetUpgradeCount):SetSize(130, 30)
    ;
    (self._btnUpgradeNow):SetSize(130, 30)
    ;
    (self._btnFire):SetSize(130, 65)
    ;
    (self._restoreAll):SetSpanSize(30, 40)
    ;
    (self._reDoAll):SetSpanSize(0, 40)
    ;
    (self._resetUpgradeCount):SetSpanSize(30, 5)
    ;
    (self._btnUpgradeNow):SetSpanSize(0, 5)
    ;
    (self._btnFire):SetSpanSize(30, 5)
    ;
    (self.desc):SetSpanSize(0, 75)
  else
    ;
    (self._restoreAll):SetSize(80, 30)
    ;
    (self._reDoAll):SetSize(80, 30)
    ;
    (self._btnUpgradeNow):SetSize(120, 30)
    ;
    (self._btnFire):SetSize(120, 30)
    ;
    (self._restoreAll):SetSpanSize(10, 5)
    ;
    (self._reDoAll):SetSpanSize(-100, 5)
    ;
    (self._btnUpgradeNow):SetSpanSize(0, 5)
    ;
    (self._btnFire):SetSpanSize(10, 5)
    ;
    (self.desc):SetSpanSize(0, 40)
  end
  ;
  (self._resetUpgradeCount):SetShow(isContentOpen)
  ;
  (self._btnUpgradeNow):SetShow(isContentOpen)
end

local comboBox = {town = (UI.getChildControl)(Panel_WorkerManager, "Combobox_Town"), grade = (UI.getChildControl)(Panel_WorkerManager, "Combobox_Grade")}
local townList = (UI.getChildControl)(comboBox.town, "Combobox_List")
local gradeList = (UI.getChildControl)(comboBox.grade, "Combobox_List")
;
(comboBox.town):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_FILTER_TOWN"))
;
(comboBox.town):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_Town()")
;
((comboBox.town):GetListControl()):addInputEvent("Mouse_LUp", "WorkerManager_SetTown()")
Panel_WorkerManager:SetChildIndex(comboBox.town, 9999)
;
(comboBox.grade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_FILTER_GRADE"))
;
(comboBox.grade):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_Grade()")
;
((comboBox.grade):GetListControl()):addInputEvent("Mouse_LUp", "WorkerManager_SetGrade()")
Panel_WorkerManager:SetChildIndex(comboBox.grade, 9999)
local townSort = {}
local gradeSort = {}
local filteredArray = {}
local selectHomeWayPointIndex = -1
local selectWorkerGrade = -1
local checkUpgradeResetCount = false
local workerManager_UpdateMain = function()
  -- function num : 0_5 , upvalues : workerManager, workerArray, townSort, gradeSort, filteredArray, selectHomeWayPointIndex, selectWorkerGrade, restoreWorkerNo, workerCheckList, checkUpgradeResetCount
  local self = workerManager
  local plantArray = (Array.new)()
  workerArray = (Array.new)()
  if workerManager.plantKey ~= nil then
    plantArray:push_back(workerManager.plantKey)
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
    -- function num : 0_5_0
    do return a:get() < b:get() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

    ;
    (table.sort)(plantArray, plantSort_do)
    local totalWorkerCount = 0
    local totalWorkerCapacity = 0
    for plantRawIdx = 1, #plantArray do
      do
        local plantKey = plantArray[plantRawIdx]
        do
          local plantWorkerCount = ToClient_getPlantWaitWorkerListCount(plantKey, 0)
          local workerHouseCount = ToClient_getTownWorkerMaxCapacity(plantKey)
          if workerHouseCount < plantWorkerCount then
            plantWorkerCount = workerHouseCount
          end
          for workerIdx = 0, plantWorkerCount - 1 do
            local workerNoRaw = ToClient_getPlantWaitWorkerNoRawByIndex(plantKey, workerIdx)
            workerArray:push_back(workerNoRaw)
          end
          totalWorkerCapacity = totalWorkerCapacity + workerHouseCount
          totalWorkerCount = totalWorkerCount + plantWorkerCount
        end
        -- DECOMPILER ERROR at PC73: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
    local title = ""
    if workerManager.plantKey ~= nil then
      title = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERCOUNT", "Count", totalWorkerCount .. "/" .. totalWorkerCapacity)
    else
      title = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_ALLWORKERCOUNT", "Count", totalWorkerCount)
    end
    self._listCount = totalWorkerCount
    ;
    (self.penelTitle):SetText(title)
    townSort = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMARKET_FILTER_ALL")}
    gradeSort = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMARKET_FILTER_ALL")}
    local hasUpgradeWoker = false
    for worker_Index = 1, #workerArray do
      local workerWrapperLua = getWorkerWrapper(workerArray[worker_Index], false)
      if workerWrapperLua ~= nil then
        if (CppEnums.NpcWorkingType).eNpcWorkingType_Upgrade == workerWrapperLua:getWorkingType() then
          hasUpgradeWoker = true
          self.upgradeWokerNoRaw = workerArray[worker_Index]
        end
        local worker_HomeWayPoint = workerWrapperLua:getHomeWaypoint()
        if townSort[1] == nil then
          (table.insert)(townSort, worker_HomeWayPoint)
        else
          local townCheck = true
          for n = 1, #townSort do
            if worker_HomeWayPoint == townSort[n] then
              townCheck = false
            end
          end
          if townCheck then
            (table.insert)(townSort, worker_HomeWayPoint)
          end
        end
        do
          local worker_Grade = workerWrapperLua:getGrade()
          if gradeSort[1] == nil then
            (table.insert)(gradeSort, worker_Grade)
          else
            local townCheck = true
            for n = 1, #gradeSort do
              if worker_Grade == gradeSort[n] then
                townCheck = false
              end
            end
            if townCheck then
              (table.insert)(gradeSort, worker_Grade)
            end
          end
          do
            -- DECOMPILER ERROR at PC206: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC206: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC206: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    local gradeSort_do = function(a, b)
    -- function num : 0_5_1
    do return a < b end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

    ;
    (table.sort)(gradeSort, gradeSort_do)
    ;
    (self._btnUpgradeNow):SetIgnore(true)
    ;
    (self._btnUpgradeNow):SetMonoTone(true)
    local count = 0
    filteredArray = {}
    for worker_Index = 1, #workerArray do
      local workerWrapperLua = getWorkerWrapper(workerArray[worker_Index], false)
      -- DECOMPILER ERROR at PC254: Unhandled construct in 'MakeBoolean' P1

      -- DECOMPILER ERROR at PC254: Unhandled construct in 'MakeBoolean' P1

      -- DECOMPILER ERROR at PC254: Unhandled construct in 'MakeBoolean' P1

      -- DECOMPILER ERROR at PC254: Unhandled construct in 'MakeBoolean' P1

      if workerWrapperLua ~= nil and selectHomeWayPointIndex > 0 and workerWrapperLua:getHomeWaypoint() == townSort[selectHomeWayPointIndex] and selectWorkerGrade >= 0 and workerWrapperLua:getGrade() == selectWorkerGrade then
        count = count + 1
        -- DECOMPILER ERROR at PC258: Confused about usage of register: R14 in 'UnsetPending'

        filteredArray[count] = workerArray[worker_Index]
      end
      count = count + 1
      -- DECOMPILER ERROR at PC264: Confused about usage of register: R14 in 'UnsetPending'

      filteredArray[count] = workerArray[worker_Index]
      -- DECOMPILER ERROR at PC274: Unhandled construct in 'MakeBoolean' P1

      if selectWorkerGrade >= 0 and workerWrapperLua:getGrade() == selectWorkerGrade then
        count = count + 1
        -- DECOMPILER ERROR at PC278: Confused about usage of register: R14 in 'UnsetPending'

        filteredArray[count] = workerArray[worker_Index]
      end
      count = count + 1
      -- DECOMPILER ERROR at PC284: Confused about usage of register: R14 in 'UnsetPending'

      filteredArray[count] = workerArray[worker_Index]
    end
    local checkUpgradableWorker = function()
    -- function num : 0_5_2 , upvalues : filteredArray, hasUpgradeWoker
    for index = 1, #filteredArray do
      local workerWrapperLua = getWorkerWrapper(filteredArray[index], false)
      local workerNoRaw = filteredArray[index]
      local worker_Lev = workerWrapperLua:getLevel()
      local maxUpgradeCount = (math.floor)(worker_Lev / 10)
      local currentUpgradableCount = workerWrapperLua:getUpgradePoint()
      if not workerWrapperLua:isWorking() and not hasUpgradeWoker and currentUpgradableCount < maxUpgradeCount then
        return true
      end
    end
    return false
  end

    local limitCount = 0
    local resetUpgradableCount = 0
    for worker_Index = self._startIndex, #filteredArray do
      if self.slotMaxCount <= limitCount then
        break
      end
      local slot = (self.slot)[limitCount]
      ;
      (slot.btn_Restore):SetMonoTone(true)
      ;
      (slot.btn_Stop):SetMonoTone(true)
      ;
      (slot.btn_Stop):SetShow(false)
      ;
      (slot.btn_Repeat):SetShow(false)
      ;
      (slot.btn_Repeat):SetMonoTone(true)
      ;
      (slot.btn_UnRepeat):SetShow(false)
      ;
      (slot.btn_UnRepeat):SetMonoTone(true)
      ;
      (slot.btn_Upgrade):SetMonoTone(true)
      ;
      (slot.btn_ChangeSkill):SetMonoTone(true)
      ;
      (slot.btn_resetCount):SetShow(false)
      ;
      (slot.btn_Repeat):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_UnRepeat):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_Restore):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_Stop):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_Upgrade):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_ChangeSkill):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_resetCount):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_Restore):addInputEvent("Mouse_On", "WorkerManager_ButtonSimpleToolTip( true, " .. limitCount .. ", 0 )")
      ;
      (slot.btn_Restore):addInputEvent("Mouse_Out", "WorkerManager_ButtonSimpleToolTip( false, " .. limitCount .. ", 0 )")
      ;
      (slot.btn_Upgrade):addInputEvent("Mouse_On", "WorkerManager_ButtonSimpleToolTip( true, " .. limitCount .. ", 1 )")
      ;
      (slot.btn_Upgrade):addInputEvent("Mouse_Out", "WorkerManager_ButtonSimpleToolTip( false, " .. limitCount .. ", 1 )")
      ;
      (slot.btn_Repeat):addInputEvent("Mouse_On", "WorkerManager_ButtonSimpleToolTip( true, " .. limitCount .. ", 2 )")
      ;
      (slot.btn_Repeat):addInputEvent("Mouse_Out", "WorkerManager_ButtonSimpleToolTip( false, " .. limitCount .. ", 2 )")
      ;
      (slot.btn_UnRepeat):addInputEvent("Mouse_On", "WorkerManager_ButtonSimpleToolTip( true, " .. limitCount .. ", 5 )")
      ;
      (slot.btn_UnRepeat):addInputEvent("Mouse_Out", "WorkerManager_ButtonSimpleToolTip( false, " .. limitCount .. ", 5 )")
      ;
      (slot.btn_Stop):addInputEvent("Mouse_On", "WorkerManager_ButtonSimpleToolTip( true, " .. limitCount .. ", 3 )")
      ;
      (slot.btn_Stop):addInputEvent("Mouse_Out", "WorkerManager_ButtonSimpleToolTip( false, " .. limitCount .. ", 3 )")
      ;
      (slot.btn_ChangeSkill):addInputEvent("Mouse_On", "WorkerManager_ButtonSimpleToolTip( true, " .. limitCount .. ", 4 )")
      ;
      (slot.btn_ChangeSkill):addInputEvent("Mouse_Out", "WorkerManager_ButtonSimpleToolTip( false, " .. limitCount .. ", 4 )")
      local workerWrapperLua = getWorkerWrapper(filteredArray[worker_Index], false)
      local workerNoRaw = filteredArray[worker_Index]
      local setWorker = function()
    -- function num : 0_5_3 , upvalues : slot, workerWrapperLua, worker_Index, workerNoRaw, limitCount, restoreWorkerNo, workerCheckList, hasUpgradeWoker, self, checkUpgradeResetCount, resetUpgradableCount
    (slot.btn_Restore):SetShow(true)
    ;
    (slot.btn_Upgrade):SetShow(true)
    ;
    (slot.btn_Repeat):SetShow(true)
    ;
    (slot.btn_UnRepeat):SetShow(true)
    ;
    (slot.btn_Stop):SetShow(true)
    ;
    (slot.btn_ChangeSkill):SetShow(true)
    local workerUpgradeCount = workerWrapperLua:getUpgradePoint()
    local worker_Name = ""
    if workerUpgradeCount > 0 and workerWrapperLua:isUpgradable() then
      worker_Name = workerWrapperLua:getName()
      ;
      (slot.btn_Upgrade):SetText(workerWrapperLua:getUpgradePoint())
      ;
      (slot.btn_Upgrade):SetShow(true)
      ;
      (slot.btn_Upgrade):SetMonoTone(false)
      ;
      (slot.btn_Upgrade):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_UpgradeWorker( " .. worker_Index .. " )")
    else
      ;
      (slot.btn_Upgrade):SetText("")
      ;
      (slot.btn_Upgrade):SetMonoTone(true)
      ;
      (slot.btn_Upgrade):addInputEvent("Mouse_LUp", "")
      worker_Name = workerWrapperLua:getName()
    end
    if workerWrapperLua:checkPossibleChangesSkillKey() then
      (slot.btn_ChangeSkill):SetShow(true)
      ;
      (slot.btn_ChangeSkill):SetMonoTone(false)
      ;
      (slot.btn_ChangeSkill):addInputEvent("Mouse_LUp", "workerChangeSkill_Open( " .. worker_Index .. " )")
    else
      ;
      (slot.btn_ChangeSkill):SetMonoTone(true)
      ;
      (slot.btn_ChangeSkill):addInputEvent("Mouse_LUp", "")
    end
    local worker_Lev = workerWrapperLua:getLevel()
    local worker_HomeWayPoint = workerWrapperLua:getHomeWaypoint()
    local workerNo_64 = workerNoRaw
    ;
    (slot.btn_Repeat):SetShow(false)
    ;
    (slot.btn_Repeat):addInputEvent("Mouse_LUp", "")
    ;
    (slot.btn_Repeat):SetMonoTone(true)
    ;
    (slot.btn_UnRepeat):SetShow(true)
    ;
    (slot.btn_UnRepeat):addInputEvent("Mouse_LUp", "")
    ;
    (slot.btn_UnRepeat):SetMonoTone(true)
    ;
    (slot.btn_Stop):SetShow(true)
    if workerWrapperLua:isWorking() then
      local workingLeftPercent = workerWrapperLua:currentProgressPercents()
      ;
      (slot.progress):SetProgressRate(workingLeftPercent)
      ;
      (slot.progress):SetCurrentProgressRate(workingLeftPercent)
      ;
      (slot.progressBg):SetShow(true)
      ;
      (slot.progress):SetShow(true)
      ;
      (slot.btn_Restore):SetMonoTone(false)
      ;
      (slot.btn_Restore):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_RestoreWorker( " .. worker_Index .. ", " .. limitCount .. " )")
      ;
      (slot.btn_Repeat):SetShow(false)
      ;
      (slot.btn_Repeat):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_Repeat):SetMonoTone(true)
      ;
      (slot.btn_UnRepeat):SetShow(true)
      ;
      (slot.btn_UnRepeat):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn_UnRepeat):SetMonoTone(true)
      ;
      (slot.btn_Stop):SetShow(true)
      ;
      (slot.btn_Stop):SetMonoTone(false)
      ;
      (slot.btn_Stop):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_StopWorking( " .. worker_Index .. " )")
      ;
      (slot.btn_Upgrade):SetMonoTone(true)
      ;
      (slot.btn_Upgrade):addInputEvent("Mouse_LUp", "")
    else
      do
        ;
        (slot.progressBg):SetShow(true)
        ;
        (slot.progress):SetShow(false)
        ;
        (slot.btn_Restore):SetMonoTone(false)
        ;
        (slot.btn_Restore):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_RestoreWorker( " .. worker_Index .. ", " .. limitCount .. " )")
        ;
        (slot.btn_Repeat):SetShow(true)
        ;
        (slot.btn_Repeat):addInputEvent("Mouse_LUp", "")
        ;
        (slot.btn_Repeat):SetMonoTone(true)
        ;
        (slot.btn_UnRepeat):SetShow(true)
        ;
        (slot.btn_UnRepeat):addInputEvent("Mouse_LUp", "")
        ;
        (slot.btn_UnRepeat):SetMonoTone(true)
        ;
        (slot.btn_Stop):SetShow(false)
        ;
        (slot.btn_Stop):SetMonoTone(true)
        ;
        (slot.btn_Stop):addInputEvent("Mouse_LUp", "")
        local currentActionPoint = workerWrapperLua:getActionPoint()
        do
          local maxActionPoint = workerWrapperLua:getMaxActionPoint()
          if currentActionPoint == maxActionPoint then
            (slot.btn_Restore):SetFontColor(4286743170)
            ;
            (slot.btn_Restore):SetMonoTone(true)
            ;
            (slot.btn_Restore):addInputEvent("Mouse_LUp", "")
            if restoreWorkerNo == workerNo_64 then
              HandleClicked_WorkerManager_RestoreItemClose()
            end
          end
          if workerWrapperLua:isWorkerRepeatable() and currentActionPoint > 0 then
            (slot.btn_Repeat):SetShow(true)
            ;
            (slot.btn_Repeat):SetMonoTone(false)
            ;
            (slot.btn_UnRepeat):SetShow(true)
            ;
            (slot.btn_UnRepeat):SetMonoTone(false)
            ;
            (slot.btn_Stop):SetShow(false)
            ;
            (slot.btn_Stop):SetMonoTone(false)
            ;
            (slot.btn_Stop):addInputEvent("Mouse_LUp", "HandleClicked_WorkerManager_StopWorking( " .. worker_Index .. " )")
            ;
            (slot.btn_Repeat):addInputEvent("Mouse_LUp", "HandleClicked_ReDoWork( " .. worker_Index .. " )")
            ;
            (slot.btn_UnRepeat):addInputEvent("Mouse_LUp", "HandleClicked_UnReDoWork( " .. worker_Index .. " )")
          end
          local actionPointPer = workerWrapperLua:getActionPointPercents()
          ;
          (slot.workerRestorePT):SetProgressRate(actionPointPer)
          ;
          (slot.workerCurrentPT):SetProgressRate(actionPointPer)
          -- DECOMPILER ERROR at PC470: Confused about usage of register: R6 in 'UnsetPending'

          if workerCheckList[Int64toInt32(workerNo_64)] == nil then
            workerCheckList[Int64toInt32(workerNo_64)] = false
          end
          local isCheck = workerCheckList[Int64toInt32(workerNo_64)]
          ;
          (slot.workerCheck):SetCheck(isCheck)
          ;
          (slot.workerName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. worker_Lev .. " " .. workerWrapperLua:getGradeToColorString() .. worker_Name .. "<PAOldColor>")
          ;
          (slot.workerNodeName):SetText(workerWrapperLua:getWorkingNodeDesc())
          ;
          (slot.workingName):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
          ;
          (slot.workingName):SetText(workerWrapperLua:getWorkString())
          ;
          (slot.picture):ChangeTextureInfoName(workerWrapperLua:getWorkerIcon())
          ;
          (slot.bg):SetShow(true)
          ;
          (slot.workerName):SetShow(true)
          ;
          (slot.workingName):SetShow(true)
          if hasUpgradeWoker == true then
            if isGameTypeEnglish() then
              (self._btnUpgradeNow):SetShow(false)
            else
              ;
              (self._btnUpgradeNow):SetIgnore(false)
              ;
              (self._btnUpgradeNow):SetMonoTone(false)
              ;
              (self._btnUpgradeNow):SetShow(true)
            end
            ;
            (slot.btn_Upgrade):SetMonoTone(true)
            ;
            (slot.btn_Upgrade):addInputEvent("Mouse_LUp", "")
          end
          ;
          (slot.picture):addInputEvent("Mouse_On", "workerManager_ToolTip( true,\t" .. worker_Index .. ", " .. limitCount .. " ) ")
          ;
          (slot.picture):addInputEvent("Mouse_Out", "workerManager_ToolTip( false,\t" .. worker_Index .. ", " .. limitCount .. " )")
          ;
          (slot.workerCheck):addInputEvent("Mouse_LUp", "HandleClicked_workerManager_CheckWorker( " .. Int64toInt32(workerNo_64) .. " )")
          if workerWrapperLua:getIsAuctionInsert() == true then
            (slot.btn_Restore):SetMonoTone(true)
            ;
            (slot.btn_Restore):addInputEvent("Mouse_LUp", "")
            ;
            (slot.btn_Restore):SetFontColor(4286743170)
            ;
            (slot.btn_Repeat):SetShow(true)
            ;
            (slot.btn_Repeat):addInputEvent("Mouse_LUp", "")
            ;
            (slot.btn_Repeat):SetMonoTone(true)
            ;
            (slot.btn_UnRepeat):SetShow(true)
            ;
            (slot.btn_UnRepeat):addInputEvent("Mouse_LUp", "")
            ;
            (slot.btn_UnRepeat):SetMonoTone(true)
            ;
            (slot.btn_Stop):SetShow(false)
            ;
            (slot.btn_Stop):SetMonoTone(true)
            ;
            (slot.btn_Stop):addInputEvent("Mouse_LUp", "")
            ;
            (slot.btn_Upgrade):SetMonoTone(true)
            ;
            (slot.btn_Upgrade):addInputEvent("Mouse_LUp", "")
          end
          limitCount = limitCount + 1
          if checkUpgradeResetCount then
            (slot.btn_Restore):SetShow(false)
            ;
            (slot.btn_Upgrade):SetShow(false)
            ;
            (slot.btn_Repeat):SetShow(false)
            ;
            (slot.btn_UnRepeat):SetShow(false)
            ;
            (slot.btn_Stop):SetShow(false)
            ;
            (slot.btn_ChangeSkill):SetShow(false)
            local enableReset = false
            local maxUpgradeCount = (math.floor)(worker_Lev / 10)
            local currentUpgradableCount = workerWrapperLua:getUpgradePoint()
            if not workerWrapperLua:isWorking() and not hasUpgradeWoker then
              if currentUpgradableCount < maxUpgradeCount then
                (slot.btn_resetCount):SetShow(true)
                ;
                (slot.btn_resetCount):SetEnable(true)
                resetUpgradableCount = resetUpgradableCount + 1
              end
              ;
              (slot.btn_resetCount):addInputEvent("Mouse_LUp", "HandleClicked_ResetUpgradeCount(" .. worker_Index .. ")")
            end
          end
        end
      end
    end
  end

      -- DECOMPILER ERROR at PC513: Unhandled construct in 'MakeBoolean' P1

      -- DECOMPILER ERROR at PC513: Unhandled construct in 'MakeBoolean' P1

      -- DECOMPILER ERROR at PC513: Unhandled construct in 'MakeBoolean' P1

      -- DECOMPILER ERROR at PC513: Unhandled construct in 'MakeBoolean' P1

      if workerWrapperLua ~= nil and selectHomeWayPointIndex > 0 and workerWrapperLua:getHomeWaypoint() == townSort[selectHomeWayPointIndex] and selectWorkerGrade >= 0 and workerWrapperLua:getGrade() == selectWorkerGrade then
        setWorker()
      end
      setWorker()
      -- DECOMPILER ERROR at PC527: Unhandled construct in 'MakeBoolean' P1

      if selectWorkerGrade >= 0 and workerWrapperLua:getGrade() == selectWorkerGrade then
        setWorker()
      end
      setWorker()
    end
    do
      if checkUpgradeResetCount and not checkUpgradableWorker() then
        HandleClicked_UpgradeCountReset_Show()
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_NOWORKER"))
      end
      self._listCount = count
      ;
      (UIScroll.SetButtonSize)(self._scroll, self.slotMaxCount, self._listCount)
    end
  end
end

local workerManager_Update = function()
  -- function num : 0_6 , upvalues : workerManager, workerManager_UpdateMain
  local self = workerManager
  for slotIdx = 0, self.slotFixMaxCount - 1 do
    local slot = (self.slot)[slotIdx]
    ;
    (slot.bg):SetShow(false)
    ;
    (slot.workerName):SetShow(false)
    ;
    (slot.workingName):SetShow(false)
    ;
    (slot.progressBg):SetShow(true)
    ;
    (slot.progress):SetShow(false)
  end
  workerManager_UpdateMain()
  ;
  (self.workerListBg):SetSize((self.workerListBg):GetSizeX(), ((((self.slot)[0]).bg):GetSizeY() + 5) * self.slotMaxCount)
  ;
  (self._scroll):SetSize((self._scroll):GetSizeX(), ((((self.slot)[0]).bg):GetSizeY() + 5) * self.slotMaxCount)
  Panel_WorkerManager:SetSize(Panel_WorkerManager:GetSizeX(), ((((self.slot)[0]).bg):GetSizeY() + 5) * self.slotMaxCount + 80 + (self._btnFire):GetSizeY() + ((self.desc):GetSizeY() + 10))
  ;
  (self._btnFire):ComputePos()
  ;
  (self._restoreAll):ComputePos()
  ;
  (self._reDoAll):ComputePos()
  ;
  (self._btnUpgradeNow):ComputePos()
  ;
  (self._resetUpgradeCount):ComputePos()
  ;
  (self.desc):ComputePos()
  ;
  (UIScroll.SetButtonSize)(self._scroll, self.slotMaxCount, self._listCount)
end

HandleClicked_WorkerManager_Town = function()
  -- function num : 0_7 , upvalues : comboBox, townSort
  (comboBox.town):DeleteAllItem()
  ;
  (comboBox.town):AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMARKET_FILTER_ALL"), 1)
  for ii = 1, #townSort do
    (comboBox.town):AddItem(ToClient_GetNodeNameByWaypointKey(townSort[ii]), ii + 1)
  end
  ;
  (comboBox.town):ToggleListbox()
end

WorkerManager_SetTown = function()
  -- function num : 0_8 , upvalues : comboBox, selectHomeWayPointIndex, townSort, workerManager, workerManager_Update
  local selectTownIndex = (comboBox.town):GetSelectIndex()
  selectHomeWayPointIndex = selectTownIndex
  ;
  (comboBox.town):SetSelectItemIndex(selectTownIndex)
  if selectTownIndex > 0 then
    (comboBox.town):SetText(ToClient_GetNodeNameByWaypointKey(townSort[selectTownIndex]))
  else
    ;
    (comboBox.town):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMARKET_FILTER_ALL"))
  end
  ;
  (comboBox.town):ToggleListbox()
  ;
  (workerManager._scroll):SetControlPos(0)
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

  workerManager._startIndex = 1
  workerManager_Update()
end

HandleClicked_WorkerManager_Grade = function()
  -- function num : 0_9 , upvalues : comboBox, gradeSort, workerGrade
  (comboBox.grade):DeleteAllItem()
  ;
  (comboBox.grade):AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMARKET_FILTER_ALL"), 1)
  for ii = 1, #gradeSort do
    (comboBox.grade):AddItem(workerGrade[gradeSort[ii]], ii + 1)
  end
  ;
  (comboBox.grade):ToggleListbox()
end

WorkerManager_SetGrade = function()
  -- function num : 0_10 , upvalues : comboBox, workerGrade, gradeSort, selectWorkerGrade, workerManager, workerManager_Update
  local selectGradeIndex = (comboBox.grade):GetSelectIndex()
  ;
  (comboBox.grade):SetSelectItemIndex(selectGradeIndex)
  if selectGradeIndex > 0 then
    (comboBox.grade):SetText(workerGrade[gradeSort[selectGradeIndex]])
    selectWorkerGrade = gradeSort[selectGradeIndex]
  else
    ;
    (comboBox.grade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMARKET_FILTER_ALL"))
    selectWorkerGrade = -1
  end
  ;
  (comboBox.grade):ToggleListbox()
  ;
  (workerManager._scroll):SetControlPos(0)
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  workerManager._startIndex = 1
  workerManager_Update()
end

local restoreItem_update = function()
  -- function num : 0_11 , upvalues : workerManager
  local self = workerManager
  for itemIdx = 0, self.restoreItemMaxCount - 1 do
    local slot = (self.restoreItemSlot)[itemIdx]
    ;
    (slot.slotBG):SetShow(false)
    ;
    (slot.slotIcon):addInputEvent("Mouse_RUp", "")
  end
  self.restoreItemHasCount = ToClient_getNpcRecoveryItemList()
  if self.restoreItemHasCount <= 0 then
    (self.restoreItemBG):SetShow(false)
  end
  local uiIdx = 0
  for itemIdx = self.sliderStartIdx, self.restoreItemHasCount - 1 do
    if self.restoreItemMaxCount <= uiIdx then
      break
    end
    local slot = (self.restoreItemSlot)[uiIdx]
    ;
    (slot.slotBG):SetShow(true)
    local recoveryItem = ToClient_getNpcRecoveryItemByIndex(itemIdx)
    local itemStatic = recoveryItem:getItemStaticStatus()
    ;
    (slot.slotIcon):ChangeTextureInfoName("icon/" .. getItemIconPath(itemStatic))
    ;
    (slot.itemCount):SetText(tostring(recoveryItem._itemCount_s64))
    ;
    (slot.restorePoint):SetText("+" .. tostring(recoveryItem._contentsEventParam1))
    ;
    (slot.slotIcon):addInputEvent("Mouse_RUp", "HandleClicked_WorkerManager_RestoreItem( " .. itemIdx .. " )")
    ;
    (slot.slotIcon):addInputEvent("Mouse_On", "HandleOnOut_WorkerManager_RestoreItem( true,\t" .. itemIdx .. " )")
    ;
    (slot.slotIcon):addInputEvent("Mouse_Out", "HandleOnOut_WorkerManager_RestoreItem( false,\t" .. itemIdx .. " )")
    uiIdx = uiIdx + 1
  end
  do
    if self.restoreItemMaxCount < self.restoreItemHasCount then
      (self._slider):SetShow(true)
      local sliderSize = (self._slider):GetSizeX()
      local targetPercent = self.restoreItemMaxCount / self.restoreItemHasCount * 100
      local sliderBtnSize = sliderSize * (targetPercent / 100)
      ;
      (self._sliderBtn):SetSize(sliderBtnSize, (self._sliderBtn):GetSizeY())
      ;
      (self._slider):SetInterval(self.restoreItemHasCount - self.restoreItemMaxCount)
      ;
      (self._sliderBtn):addInputEvent("Mouse_LPress", "HandleLPress_WorkerManager_RestoreItemSlider()")
    else
      do
        ;
        (self._slider):SetShow(false)
      end
    end
  end
end

HandleClicked_WorkerManager_StopWorking = function(workerIdx)
  -- function num : 0_12 , upvalues : filteredArray, UI_PP
  local workerWrapperLua = getWorkerWrapper(filteredArray[workerIdx], false)
  local workerNoRaw = filteredArray[workerIdx]
  if workerWrapperLua ~= nil then
    local workerNo = workerNoRaw
    do
      local leftWorkCount = workerWrapperLua:getWorkingCount()
      local workingState = workerWrapperLua:getWorkingStateXXX()
      if (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_Working == workingState then
        ToClient_requestChangeWorkingState(WorkerNo(workerNo), (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_Return)
        FGlobal_HarvestList_Update()
        return 
      else
        if (CppEnums.NpcWorkingState).eNpcWorkingState_HarvestWorking_Return == workingState then
          Proc_ShowMessage_Ack_With_ChatType((PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_MESSAGE_GOHOME")), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
          return 
        end
      end
      if leftWorkCount < 1 then
        Proc_ShowMessage_Ack_With_ChatType((PAGetString(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_ONLYONEWORK")), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
        return 
      else
        local cancelDoWork = function()
    -- function num : 0_12_0 , upvalues : workerNo
    ToClient_requestCancelNextWorking(WorkerNo(workerNo))
  end

        local workName = workerWrapperLua:getWorkString()
        local cancelWorkContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_TOWN_WORKERMANAGE_CONFIRM_WORKCANCEL", "workName", workName)
        do
          local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WORKINGPROGRESS_CANCELWORK_TITLE"), content = cancelWorkContent, functionYes = cancelDoWork, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData, "top")
          -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

workerManager_SliderScroll = function(isUp)
  -- function num : 0_13 , upvalues : workerManager, restoreItem_update
  local self = workerManager
  if isUp == true then
    if self.sliderStartIdx <= 0 then
      self.sliderStartIdx = 0
      return 
    end
    self.sliderStartIdx = self.sliderStartIdx - 1
  else
    if self.restoreItemHasCount <= self.sliderStartIdx + self.restoreItemMaxCount then
      return 
    end
    self.sliderStartIdx = self.sliderStartIdx + 1
  end
  local currentPos = self.sliderStartIdx / (self.restoreItemHasCount - self.restoreItemMaxCount) * 100
  if currentPos > 100 then
    currentPos = 100
  else
    if currentPos < 0 then
      currentPos = 0
    end
  end
  ;
  (self._slider):SetControlPos(currentPos)
  restoreItem_update()
end

HandleLPress_WorkerManager_RestoreItemSlider = function()
  -- function num : 0_14 , upvalues : workerManager, restoreItem_update
  local self = workerManager
  local pos = (self._slider):GetControlPos()
  local posIdx = (math.floor)((self.restoreItemHasCount - self.restoreItemMaxCount) * pos)
  if self.restoreItemHasCount - self.restoreItemMaxCount < posIdx then
    return 
  end
  self.sliderStartIdx = posIdx
  local currentPos = self.sliderStartIdx / (self.restoreItemHasCount - self.restoreItemMaxCount) * 100
  if currentPos > 100 then
    currentPos = 100
  else
    if currentPos < 0 then
      currentPos = 0
    end
  end
  ;
  (self._slider):SetControlPos(currentPos)
  restoreItem_update()
end

HandleClicked_WorkerManager_RestoreWorker = function(workerIdx, uiIdx)
  -- function num : 0_15 , upvalues : workerManager, filteredArray, restoreItem_update
  local self = workerManager
  self.selectedUiIndex = uiIdx
  local slot = (self.slot)[self.selectedUiIndex]
  self.selectedRestoreWorkerIdx = workerIdx
  local restoreItemCount = ToClient_getNpcRecoveryItemList()
  local workerWrapperLua = getWorkerWrapper(filteredArray[workerIdx], false)
  local actionPointPer = workerWrapperLua:getActionPointPercents()
  if restoreItemCount <= 0 then
    Proc_ShowMessage_Ack_With_ChatType((PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_NOITEM")), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
    return 
  else
    if actionPointPer == 100 then
      Proc_ShowMessage_Ack_With_ChatType((PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE_MAX")), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
      return 
    end
  end
  local bgSizeX = (self.restoreItemBG):GetSizeX()
  local textSizeX = (self.guideRestoreAll):GetTextSizeX() + 30
  if bgSizeX < textSizeX then
    (self.restoreItemBG):SetSize((self.restoreItemBG):GetSizeX() + (textSizeX - bgSizeX), (self.restoreItemBG):GetSizeY())
    ;
    (self.btn_restoreItemClose):SetSpanSize(5, 5)
  end
  ;
  (self.restoreItemBG):SetShow(true)
  ;
  (self.restoreItemBG):SetPosX((slot.btn_Restore):GetPosX() - (self.restoreItemBG):GetSizeX() * 0.95)
  ;
  (self.restoreItemBG):SetPosY((slot.bg):GetPosY() + (slot.bg):GetSizeY() * 1.75)
  restoreItem_update()
end

HandleClicked_WorkerManager_RestoreItem = function(itemIdx)
  -- function num : 0_16 , upvalues : workerManager, filteredArray, restoreWorkerNo
  local self = workerManager
  local workerIndex = self.selectedRestoreWorkerIdx
  local workerWrapperLua = getWorkerWrapper(filteredArray[workerIndex], false)
  local workerNoRaw = filteredArray[workerIndex]
  if workerWrapperLua ~= nil then
    local workerNo = workerNoRaw
    local recoveryItem = ToClient_getNpcRecoveryItemByIndex(itemIdx)
    local recoveryItemCount = Int64toInt32(recoveryItem._itemCount_s64)
    local slotNo = recoveryItem._slotNo
    local restorePoint = recoveryItem._contentsEventParam1
    local maxPoint = workerWrapperLua:getMaxActionPoint()
    local currentPoint = workerWrapperLua:getActionPoint()
    local actionPointPer = workerWrapperLua:getActionPointPercents()
    if actionPointPer >= 100 then
      Proc_ShowMessage_Ack_With_ChatType((PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE_MAX")), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
      return 
    end
    if isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT) then
      local restoreItemCount = ToClient_getNpcRecoveryItemList()
      local restoreActionPoint = maxPoint - currentPoint
      local itemNeedCount = (math.floor)(restoreActionPoint / restorePoint)
      local currentItemCount = recoveryItemCount
      if currentItemCount < itemNeedCount then
        itemNeedCount = currentItemCount
      end
      if itemNeedCount >= 1 then
        requestRecoveryWorker(WorkerNo(workerNo), slotNo, itemNeedCount)
      end
      return 
    end
    do
      restoreWorkerNo = workerNo
      requestRecoveryWorker(WorkerNo(workerNo), slotNo, 1)
    end
  end
end

HandleOnOut_WorkerManager_RestoreItem = function(isSet, itemIdx)
  -- function num : 0_17 , upvalues : workerManager, filteredArray
  local self = workerManager
  local workerIndex = self.selectedRestoreWorkerIdx
  local workerWrapperLua = getWorkerWrapper(filteredArray[workerIndex], false)
  if workerWrapperLua ~= nil then
    local maxPoint = workerWrapperLua:getMaxActionPoint()
    local currentPoint = workerWrapperLua:getActionPoint()
    local actionPointPer = workerWrapperLua:getActionPointPercents()
    local recoveryItem = ToClient_getNpcRecoveryItemByIndex(itemIdx)
    local slotNo = recoveryItem._slotNo
    local restorePoint = recoveryItem._contentsEventParam1
    local workerSlot = (self.slot)[self.selectedUiIndex]
    local actionPointPrePer = (currentPoint + restorePoint) / maxPoint * 100
    if isSet == true then
      (workerSlot.workerRestorePT):SetProgressRate(actionPointPrePer)
    else
      ;
      (workerSlot.workerRestorePT):SetProgressRate(actionPointPer)
    end
  end
end

HandleClicked_WorkerManager_RestoreItemClose = function()
  -- function num : 0_18 , upvalues : workerManager, restoreWorkerNo
  local self = workerManager
  ;
  (self.restoreItemBG):SetShow(false)
  restoreWorkerNo = nil
end

HandleClicked_WorkerManager_UpgradeWorker = function(workerIdx)
  -- function num : 0_19 , upvalues : filteredArray, workerManager_UpdateMain, UI_PP
  local workerWrapperLua = getWorkerWrapper(filteredArray[workerIdx], false)
  local do_Upgrade_Worker = function()
    -- function num : 0_19_0 , upvalues : workerWrapperLua, workerManager_UpdateMain
    workerWrapperLua:requestUpgrade()
    workerManager_UpdateMain()
  end

  local workerName = workerWrapperLua:getName()
  local workingTime = workerWrapperLua:getLeftWorkingTime()
  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_UPGRADEDESC", "name", workerName)
  local messageboxData = {title = messageTitle, content = messageContent, functionYes = do_Upgrade_Worker, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

HandleClicked_workerManager_WorkerUpgradeNow = function()
  -- function num : 0_20 , upvalues : workerManager, UI_PP
  local self = workerManager
  local workerNoRaw = self.upgradeWokerNoRaw
  local remainTimeInt = ToClient_getWorkingTime(workerNoRaw)
  local needPearl = ToClient_GetUsingPearlByRemainingPearl((CppEnums.InstantCashType).eInstant_CompleteNpcWorkerUpgrade, remainTimeInt)
  local doUpgradeNow = function()
    -- function num : 0_20_0 , upvalues : workerNoRaw, needPearl, self
    ToClient_requestQuickComplete(WorkerNo(workerNoRaw), needPearl)
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

    self.upgradeWokerNoRaw = -1
  end

  local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_IMMEDIATELYCOMPLETE_MSGBOX_TITLE")
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_UPGRADENOW_CONFIRM", "pearl", tostring(needPearl))
  local messageboxData = {title = messageboxTitle, content = messageBoxMemo, functionYes = doUpgradeNow, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "middle")
end

HandleClicked_ResetUpgradeCount = function(workerIndex)
  -- function num : 0_21 , upvalues : workerManager, filteredArray
  local self = workerManager
  local workerWrapperLua = getWorkerWrapper(filteredArray[workerIndex], false)
  local workerNoRaw = filteredArray[workerIndex]
  local workerUpgradeCount = workerWrapperLua:getUpgradePoint()
  local worker_Lev = workerWrapperLua:getLevel()
  local maxUpgradePoint = (math.floor)(worker_Lev / 10)
  local upgradableCount = maxUpgradePoint - workerUpgradeCount
  local worker_Name = workerWrapperLua:getName()
  local doReset = function()
    -- function num : 0_21_0 , upvalues : workerNoRaw
    ToClient_requestClearWorkerUpgradePoint(workerNoRaw)
  end

  if upgradableCount > 0 then
    local title = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_MSGTITLE")
    local msg = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. worker_Lev .. " " .. workerWrapperLua:getGradeToColorString() .. worker_Name .. "<PAOldColor>"
    local content = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_MSGCONTENT", "msg", msg, "count", upgradableCount, "maxCount", maxUpgradePoint)
    local messageBoxData = {title = title, content = content, functionYes = doReset, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

HandleClicked_UpgradeCountReset_Show = function()
  -- function num : 0_22 , upvalues : checkUpgradeResetCount, workerManager_UpdateMain
  if ToClient_doHaveClearWorkerUpgradeItem() then
    checkUpgradeResetCount = not checkUpgradeResetCount
    workerManager_UpdateMain()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_NOITEMALERT"))
  end
end

FromClient_ClearWorkerUpgradePoint = function()
  -- function num : 0_23 , upvalues : checkUpgradeResetCount, workerManager_UpdateMain
  checkUpgradeResetCount = false
  workerManager_UpdateMain()
end

WorkerManager_WorkerCheck_Init = function()
  -- function num : 0_24 , upvalues : workerManager, filteredArray, workerCheckList
  local self = workerManager
  for index = 1, #filteredArray do
    local workerNoRaw = filteredArray[index]
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R6 in 'UnsetPending'

    workerCheckList[Int64toInt32(workerNoRaw)] = false
  end
end

HandleClicked_workerManager_CheckWorker = function(workerNo_64)
  -- function num : 0_25 , upvalues : workerCheckList, workerManager_UpdateMain
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if workerCheckList[workerNo_64] == nil or workerCheckList[workerNo_64] == false then
    workerCheckList[workerNo_64] = true
  else
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    workerCheckList[workerNo_64] = false
  end
  workerManager_UpdateMain()
end

HandleClicked_workerManager_WaitWorkerFire = function()
  -- function num : 0_26 , upvalues : workerManager, filteredArray, workerCheckList, comboBox, townSort, workerGrade, gradeSort, UI_PP
  local self = workerManager
  local do_CheckedWorker_Fire = function()
    -- function num : 0_26_0 , upvalues : self, filteredArray, workerCheckList
    for idx = 1, self._listCount do
      local workerNoRaw = filteredArray[idx]
      if workerCheckList[Int64toInt32(workerNoRaw)] then
        ToClient_requestDeleteMyWorker(WorkerNo(workerNoRaw))
      end
    end
  end

  local checkCount = 0
  for idx = 1, self._listCount do
    local workerNoRaw = filteredArray[idx]
    if workerCheckList[Int64toInt32(workerNoRaw)] then
      for index = 1, #filteredArray do
        if workerNoRaw == filteredArray[index] then
          checkCount = checkCount + 1
        end
      end
    end
  end
  if checkCount == 0 then
    Proc_ShowMessage_Ack_With_ChatType((PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_FIREWORKERSELECT")), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
    return 
  end
  if Panel_WorkerRestoreAll:GetShow() then
    workerRestoreAll_Close()
  end
  local selectFilterString = ""
  local selectTownIndex = (comboBox.town):GetSelectIndex()
  local selectGradeIndex = (comboBox.grade):GetSelectIndex()
  if selectTownIndex > 0 then
    selectFilterString = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_DESTINATIONTOWN") .. ToClient_GetNodeNameByWaypointKey(townSort[selectTownIndex])
  else
    selectFilterString = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_DESTINATIONTOWN_ALL")
  end
  if selectGradeIndex > 0 then
    selectFilterString = selectFilterString .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERGRADE") .. workerGrade[gradeSort[selectGradeIndex]]
  else
    selectFilterString = selectFilterString .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERGRADE_ALL")
  end
  selectFilterString = "( " .. selectFilterString .. " )"
  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_FIREWORKERDESC", "count", checkCount) .. "\n" .. selectFilterString
  local messageboxData = {title = messageTitle, content = messageContent, functionYes = do_CheckedWorker_Fire, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "middle")
end

HandleClicked_workerManager_RestoreAll = function()
  -- function num : 0_27 , upvalues : workerManager, filteredArray
  local self = workerManager
  local restoreItemCount = ToClient_getNpcRecoveryItemList()
  if restoreItemCount <= 0 then
    Proc_ShowMessage_Ack_With_ChatType((PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_NOITEM")), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
    return 
  end
  FGlobal_WorkerRestoreAll_Open(self._listCount, filteredArray)
end

HandleClicked_workerManager_ReDoAll = function()
  -- function num : 0_28 , upvalues : workerManager, filteredArray
  local self = workerManager
  for worker_Index = 1, #filteredArray do
    HandleClicked_ReDoWork(worker_Index)
  end
end

local elapsedTime = 0
workerManager_FrameUpdate = function(deltaTime)
  -- function num : 0_29 , upvalues : elapsedTime, workerManager, workerManager_UpdateMain
  elapsedTime = elapsedTime + deltaTime
  if elapsedTime > 1 then
    local self = workerManager
    for slotIdx = 0, self.slotFixMaxCount - 1 do
      local slot = (self.slot)[slotIdx]
      ;
      (slot.bg):SetShow(false)
      ;
      (slot.workerName):SetShow(false)
      ;
      (slot.workingName):SetShow(false)
      ;
      (slot.progressBg):SetShow(true)
      ;
      (slot.progress):SetShow(false)
    end
    workerManager_UpdateMain()
    elapsedTime = 0
  end
end

workerManager_ScrollEvent = function(isUp)
  -- function num : 0_30 , upvalues : workerManager, workerManager_Update
  local self = workerManager
  self._startIndex = (UIScroll.ScrollEvent)(self._scroll, isUp, self.slotMaxCount, self._listCount, self._startIndex - 1, 1) + 1
  if (self.restoreItemBG):GetShow() then
    HandleClicked_WorkerManager_RestoreItemClose()
  end
  workerManager_Update()
end

workerManager_CheckWorkingOtherChannel = function()
  -- function num : 0_31
  if getSelfPlayer() == nil then
    return 
  end
  if ((getSelfPlayer()):get()):checkWorkerWorkingServerNo() ~= 0 then
    return true
  else
    return false
  end
end

workerManager_getWorkingOtherChannelMsg = function()
  -- function num : 0_32
  if workerManager_CheckWorkingOtherChannel() then
    local workingServerNo = ((getSelfPlayer()):get()):getWorkerWorkingServerNo()
    local temporaryWrapper = getTemporaryInformationWrapper()
    local worldNo = temporaryWrapper:getSelectedWorldServerNo()
    local channelName = getChannelName(worldNo, workingServerNo)
    return PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERWORKINGOTHERCHANNEL", "channelName", channelName)
  else
    do
      do return "" end
    end
  end
end

workerManager_CheckWorkingOtherChannelAndMsg = function()
  -- function num : 0_33
  if workerManager_CheckWorkingOtherChannel() then
    Proc_ShowMessage_Ack((workerManager_getWorkingOtherChannelMsg()), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
    return true
  else
    return false
  end
end

FGlobal_WorkerManger_ShowToggle = function()
  -- function num : 0_34
  if Panel_WorkerManager:GetShow() then
    workerManager_Close()
    return 
  end
  if Panel_Window_Inventory:GetShow() then
    InventoryWindow_Close()
  end
  workerManager_Open()
end

workerManager_Open = function()
  -- function num : 0_35 , upvalues : workerManager, checkUpgradeResetCount, workerManager_Update
  if workerManager_CheckWorkingOtherChannel() then
    local workingServerNo = ((getSelfPlayer()):get()):getWorkerWorkingServerNo()
    local temporaryWrapper = getTemporaryInformationWrapper()
    local worldNo = temporaryWrapper:getSelectedWorldServerNo()
    local channelName = getChannelName(worldNo, workingServerNo)
    Proc_ShowMessage_Ack((PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERWORKINGOTHERCHANNEL", "channelName", channelName)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
    return 
  end
  do
    local self = workerManager
    if Panel_WorkerManager:GetShow() then
      Panel_WorkerManager:SetShow(false, true)
    end
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

    workerManager.slotMaxCount = 6
    -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

    workerManager.sliderStartIdx = 0
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

    workerManager.plantKey = nil
    checkUpgradeResetCount = false
    audioPostEvent_SystemUi(1, 28)
    Panel_WorkerManager:SetShow(true, true)
    workerManager_ResetPos()
    workerManager_Update()
    if (self.restoreItemBG):GetShow() then
      HandleClicked_WorkerManager_RestoreItemClose()
    end
    if ToClient_WorldMapIsShow() and Panel_WorkerManager:IsUISubApp() == false then
      WorldMapPopupManager:increaseLayer(true)
      WorldMapPopupManager:push(Panel_WorkerManager, true, nil, workerRestoreAll_Close)
    end
  end
end

FGlobal_workerManager_OpenWorldMap = function()
  -- function num : 0_36 , upvalues : workerManager, workerManager_Update
  if workerManager_CheckWorkingOtherChannel() then
    local workingServerNo = ((getSelfPlayer()):get()):getWorkerWorkingServerNo()
    local temporaryWrapper = getTemporaryInformationWrapper()
    local worldNo = temporaryWrapper:getSelectedWorldServerNo()
    local channelName = getChannelName(worldNo, workingServerNo)
    Proc_ShowMessage_Ack((PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_WORKERWORKINGOTHERCHANNEL", "channelName", channelName)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
    return 
  end
  do
    local self = workerManager
    if Panel_WorkerManager:GetShow() and Panel_WorkerManager:IsUISubApp() == false then
      Panel_WorkerManager:SetShow(false, true)
    end
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

    workerManager.slotMaxCount = 6
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

    workerManager.sliderStartIdx = 0
    -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

    workerManager.plantKey = nil
    audioPostEvent_SystemUi(1, 28)
    Panel_WorkerManager:SetShow(true, true)
    workerManager_ResetPos()
    workerManager_Update()
    if (self.restoreItemBG):GetShow() then
      HandleClicked_WorkerManager_RestoreItemClose()
    end
    if ToClient_WorldMapIsShow() then
      WorldMapPopupManager:increaseLayer(true)
      WorldMapPopupManager:push(Panel_WorkerManager, true, nil, workerRestoreAll_Close)
    end
  end
end

FGlobal_workerManager_UpdateNode = function(plantKey)
  -- function num : 0_37 , upvalues : workerManager, workerManager_Update
  if workerManager_CheckWorkingOtherChannel() then
    return 
  end
  local self = workerManager
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  workerManager.plantKey = plantKey
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  workerManager.slotMaxCount = 6
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  workerManager.sliderStartIdx = 0
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  workerManager._startIndex = 1
  ;
  (workerManager._scroll):SetControlPos(0)
  ;
  (workerManager._slider):SetControlPos(0)
  audioPostEvent_SystemUi(1, 28)
  Panel_WorkerManager:SetShow(true, true)
  workerManager_ResetPos()
  workerManager_Update()
  if (self.restoreItemBG):GetShow() then
    HandleClicked_WorkerManager_RestoreItemClose()
  end
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_WorkerManager, true, nil, workerRestoreAll_Close)
  end
end

FGlobal_workerManager_ResetPlantKey = function()
  -- function num : 0_38 , upvalues : workerManager, workerManager_Update
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  workerManager.plantKey = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  workerManager._startIndex = 1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  workerManager.sliderStartIdx = 0
  ;
  (workerManager._scroll):SetControlPos(0)
  ;
  (workerManager._slider):SetControlPos(0)
  workerManager_Update()
end

FGlobal_WorkerManager_GetWorkerNoRaw = function(worker_Index)
  -- function num : 0_39 , upvalues : filteredArray
  return filteredArray[worker_Index]
end

HandleClicked_WorkerManager_Close = function()
  -- function num : 0_40 , upvalues : workerManager
  Panel_WorkerManager:CloseUISubApp()
  ;
  (workerManager.checkPopUp):SetCheck(false)
  workerManager_Close()
end

workerManager_Close = function()
  -- function num : 0_41
  if Panel_WorkerManager:IsUISubApp() then
    return 
  end
  Panel_WorkerManager:SetShow(false)
  Panel_WorkerRestoreAll:SetShow(false)
  if Panel_WorkerRestoreAll:IsUISubApp() then
    Panel_WorkerRestoreAll:CloseUISubApp()
  end
  FGlobal_HideWorkerTooltip()
  TooltipSimple_Hide()
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
end

workerManager_PopUp = function()
  -- function num : 0_42 , upvalues : workerManager
  if (workerManager.checkPopUp):IsCheck() then
    Panel_WorkerManager:OpenUISubApp()
  else
    Panel_WorkerManager:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

workerManager_Toggle = function()
  -- function num : 0_43
  if Panel_WorkerManager:GetShow() then
    workerManager_Close()
  else
    workerManager_Open()
  end
end

workerManager_ResetPos = function(isWorldMap)
  -- function num : 0_44
  local posX = 0
  local posY = 0
  if isWorldMap ~= nil then
    posX = getScreenSizeX() - Panel_WorkerManager:GetSizeX() - 10
    posY = 50
  else
    posX = getScreenSizeX() - Panel_WorkerManager:GetSizeX() - 10
    posY = 100
  end
  Panel_WorkerManager:SetPosX(posX)
  Panel_WorkerManager:SetPosY(posY)
end

workerManager_ResetPos_WorldMapClose = function()
  -- function num : 0_45 , upvalues : workerManager, workerManager_Update
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  if not Panel_WorldMap:GetShow() then
    workerManager.slotMaxCount = 6
    workerManager_Update()
    Panel_WorkerManager:SetPosX(getScreenSizeX() - Panel_WorkerManager:GetSizeX() - 10)
    Panel_WorkerManager:SetPosY(FGlobal_Panel_Radar_GetSizeY())
  end
end

registerEvent("FromClient_RenderModeChangeState", "workerManager_ResetPos_WorldMapClose")
FGlobal_RedoWork = function(_workType, _houseInfoSS, _selectedWorker, _plantKey, _workKey, _selectedSubwork, _workingCount, _itemNoRaw, _houseHoldNo, _homeWaypoint)
  -- function num : 0_46 , upvalues : workedWorker
  local plantKey = ToClient_convertWaypointKeyToPlantKey(_homeWaypoint)
  local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(plantKey, 0)
  local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(plantKey)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R13 in 'UnsetPending'

  workedWorker[Int64toInt32(_selectedWorker:get_s64())] = {_workType = _workType, _houseInfoSS = _houseInfoSS, _selectedWorker = _selectedWorker, _plantKey = _plantKey, _workKey = _workKey, _selectedSubwork = _selectedSubwork, _workingCount = _workingCount, _itemNoRaw = _itemNoRaw, _houseHoldNo = _houseHoldNo, _redoWork = true}
end

HandleClicked_ReDoWork = function(workerIndex)
  -- function num : 0_47 , upvalues : filteredArray
  local workerWrapperLua = getWorkerWrapper(filteredArray[workerIndex], false)
  local workerNoRaw = filteredArray[workerIndex]
  local currentActionPoint = workerWrapperLua:getActionPoint()
  local workerWorkingPrimitiveWrapper = workerWrapperLua:getWorkerRepeatableWorkingWrapper()
  if workerWorkingPrimitiveWrapper == nil then
    return 
  end
  if workerWrapperLua:isWorkerRepeatable() then
    if (CppEnums.NpcWorkingType).eNpcWorkingType_HarvestWorking == workerWorkingPrimitiveWrapper:getType() then
      ToClient_requestRepeatWork(WorkerNo(workerNoRaw), 1)
      FGlobal_HarvestList_Update()
    else
      if currentActionPoint > 0 then
        ToClient_requestRepeatWork(WorkerNo(workerNoRaw), currentActionPoint)
      end
    end
  end
end

HandleClicked_UnReDoWork = function(workerIndex)
  -- function num : 0_48 , upvalues : filteredArray, workerManager_Update, UI_PP
  local workerWrapperLua = getWorkerWrapper(filteredArray[workerIndex], false)
  local workerNoRaw = filteredArray[workerIndex]
  local doUnRepeatWork = function()
    -- function num : 0_48_0 , upvalues : workerNoRaw, workerManager_Update
    ToClient_requestEraseRepeat(WorkerNo(workerNoRaw))
    workerManager_Update()
  end

  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_MESSAGEBOX_UNREPEATCONFIRM"), functionYes = doUnRepeatWork, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

workerManager_ToolTip = function(isShow, workerIndex, uiIndex)
  -- function num : 0_49 , upvalues : workerManager, filteredArray
  local self = workerManager
  if isShow then
    local workerNoRaw = filteredArray[workerIndex]
    if workerNoRaw ~= nil then
      FGlobal_ShowWorkerTooltipByWorkerNoRaw(workerNoRaw, Panel_WorkerManager)
    else
      FGlobal_HideWorkerTooltip()
    end
  else
    do
      FGlobal_HideWorkerTooltip()
      TooltipSimple_Hide()
    end
  end
end

FromClient_WorkerDataAllUpdate = function()
  -- function num : 0_50 , upvalues : workerManager_Update, restoreItem_update
  workerManager_Update()
  restoreItem_update()
  if Panel_WorkerRestoreAll:GetShow() then
    FGlobal_restoreItem_update()
  end
end

Push_Work_Start_Message = function(workerNo, _workType, buildingInfoSS)
  -- function num : 0_51 , upvalues : workType
  if _workType == workType._HouseCraft then
    local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(workerNo)
    if esSSW:isSet() then
      local workName = esSSW:getDescription()
      Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_START_CRAFT", "workName", workName)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Worker)
    end
  else
    do
      if _workType == workType._LargeCraft then
        local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(workerNo)
        if esSSW:isSet() then
          local workName = esSSW:getDescription()
          local esSS = esSSW:get()
          local eSSCount = getExchangeSourceNeedItemList(esSS, true)
          local resourceIndex = ToClient_getLargeCraftWorkIndexByWorker(workerNo)
          local itemStaticInfomationWrapper = getExchangeSourceNeedItemByIndex(resourceIndex)
          local itemStaticWrapper = itemStaticInfomationWrapper:getStaticStatus()
          local itemStatic = itemStaticWrapper:get()
          local subWorkName = tostring(getItemName(itemStatic))
          Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_START_LARGECRAFT", "workName", workName, "subWorkName", subWorkName)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Worker)
        end
      else
        do
          if _workType == workType._PlantWork then
            local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(workerNo)
            if esSSW ~= nil and esSSW:isSet() then
              local workName = esSSW:getDescription()
              Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_START_PLANTWORK", "workName", workName)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Worker)
            end
          else
            do
              if _workType == workType._Building then
                if buildingInfoSS == nil then
                  return 
                end
                local workName = ToClient_getBuildingName(buildingInfoSS)
                local subWorkIndex = ToClient_getBuildingWorkingIndex(workerNo)
                local workCount = ToClient_getBuildingWorkableListCount(buildingInfoSS)
                local buildingStaticStatus = ToClient_getBuildingWorkableBuildingSourceUnitByIndex(buildingInfoSS, subWorkIndex)
                local itemStatic = buildingStaticStatus:getItemStaticStatus()
                local subWorkName = getItemName(itemStatic)
                Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_START_BUILDING", "workName", workName, "subWorkName", subWorkName)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Worker)
              else
              end
              do
                if (_workType ~= workType._upgrade or _workType == workType._RegionWork) then
                end
              end
            end
          end
        end
      end
    end
  end
end

Push_Worker_StopWork_Message = function(workerNo, isUserRequest, working)
  -- function num : 0_52
  local npcWorkerWrapper = ToClient_getNpcWorkerByWorkerNo(workerNo)
  local workerName = npcWorkerWrapper:getName()
  local workingArea = working:getWorkingNodeName()
  local workingName = working:getWorkingName()
  if isUserRequest == true then
    Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam3(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_FINISHWORK_2", "workerName", workerName, "workingArea", workingArea, "workingName", workingName)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Worker)
  else
    if isUserRequest == false then
      if working:isType((CppEnums.NpcWorkingType).eNpcWorkingType_PlantZone) then
        Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_FINISHWORK_3", "workerName", workerName, "workingArea", workingArea)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Worker)
      else
        Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam3(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_FINISHWORK_1", "workerName", workerName, "workingArea", workingArea, "workingName", workingName)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Worker)
      end
    end
  end
end

Push_Work_ResultItem_Message = function(WorkerNoRaw)
  -- function num : 0_53
  local result_Count = ToClient_getLastestWorkingResultCount(WorkerNoRaw)
  for idx = 1, result_Count do
    local itemWrapper = ToClient_getLastestWorkingResult(WorkerNoRaw, idx - 1)
    if itemWrapper:isSet() then
      local ItemEnchantSSW = itemWrapper:getStaticStatus()
      local name = ItemEnchantSSW:getName()
      local count = Int64toInt32((itemWrapper:get()):getCount_s64())
      Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_GOT_RESULT", "name", name, "count", count)), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Worker)
    end
  end
end

WorkerManager_ButtonSimpleToolTip = function(isShow, limitCount, tipType)
  -- function num : 0_54 , upvalues : workerManager
  local self = workerManager
  local name, desc, control = nil, nil, nil
  local slot = (self.slot)[limitCount]
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_RESTORE_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_RESTORE_DESC")
    control = slot.btn_Restore
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_UPGRADE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_UPGRADE_DESC")
      control = slot.btn_Upgrade
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_REPEAT_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_REPEAT_DESC")
        control = slot.btn_Repeat
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_STOP_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_STOP_DESC")
          control = slot.btn_Stop
        else
          if tipType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_CHANGESKILL_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_TOOLTIP_CHANGESKILL_DESC")
            control = slot.btn_ChangeSkill
          else
            if tipType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_UNREPEAT_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_UNREPEAT_DESC")
              control = slot.btn_UnRepeat
            else
              name = ""
              desc = ""
              control = slot.btn_Restore
            end
          end
        end
      end
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

FromClient_WorkerDataUpdate_HeadingPlant = function(ExplorationNode, workerNo)
  -- function num : 0_55 , upvalues : workType, workerManager_UpdateMain
  if Int64toInt32(workerNo) ~= 0 and ((ExplorationNode:getStaticStatus()):getRegion()):isMainOrMinorTown() == false then
    Push_Work_Start_Message(workerNo, workType._PlantWork)
  end
  local _plantKey = ExplorationNode:getPlantKey()
  local wayPlant = ToClient_getPlant(_plantKey)
  local plant = getPlant(_plantKey)
  local affiliatedTownKey = ToClinet_getPlantAffiliatedWaypointKey(wayPlant)
  if _plantKey:get() == 151 then
    FGlobal_MiniGame_RequestPlantWorking()
  end
  if plantKey == nil then
    return 
  end
  workerManager_UpdateMain()
end

FromClient_WorkerDataUpdate_HeadingHouse = function(rentHouseWrapper, workerNo)
  -- function num : 0_56 , upvalues : workType, workerManager_UpdateMain
  do
    if Int64toInt32(workerNo) ~= 0 then
      local UseGroupType = rentHouseWrapper:getHouseUseType()
      if UseGroupType == 12 or UseGroupType == 13 or UseGroupType == 14 then
        Push_Work_Start_Message(workerNo, workType._LargeCraft)
      else
        Push_Work_Start_Message(workerNo, workType._HouseCraft)
      end
    end
    if plantKey == nil then
      return 
    end
    local houseInfoSS = (rentHouseWrapper:getStaticStatus()):get()
    local affiliatedTownKey = ToClient_getHouseAffiliatedWaypointKey(houseInfoSS)
    workerManager_UpdateMain()
  end
end

FromClient_WorkerDataUpdate_HeadingBuilding = function(buildingInfoSS, workerNo)
  -- function num : 0_57 , upvalues : workType, workerManager_UpdateMain
  if Int64toInt32(workerNo) ~= 0 then
    Push_Work_Start_Message(workerNo, workType._Building, buildingInfoSS)
  end
  if plantKey == nil then
    return 
  end
  local affiliatedTownKey = ToClient_getBuildingAffiliatedWaypointKey(buildingInfoSS)
  workerManager_UpdateMain()
end

FromClient_WorkerDataUpdate_HeadingRegionManaging = function(regionGroupInfo, workerNo)
  -- function num : 0_58 , upvalues : workType, workerManager_UpdateMain
  if Int64toInt32(workerNo) ~= 0 then
    Push_Work_Start_Message(workerNo, workType._RegionWork)
  end
  workerManager_UpdateMain()
end

FromClient_changeLeftWorking = function(workerNo)
  -- function num : 0_59
end

FromClient_ChangeWorkerSkillNoOne = function(workerNoRaw)
  -- function num : 0_60
end

FromClient_ChangeWorkerSkillNo = function(workerNoRaw)
  -- function num : 0_61
end

workerManager_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_62 , upvalues : workerManager
  if isShow then
    local self = workerManager
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if (self.checkPopUp):IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(self.checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

workerManager_Initiallize()
workerManager:registEventHandler()
workerManager:registMessageHandler()

