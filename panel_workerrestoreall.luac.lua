-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\workermanager\panel_workerrestoreall.luac 

-- params : ...
-- function num : 0
Panel_WorkerRestoreAll:SetShow(false)
Panel_WorkerRestoreAll:setGlassBackground(true)
Panel_WorkerRestoreAll:ActiveMouseEventEffect(true)
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_Color = Defines.Color
local workerRestoreAll = {
slot = {}
, startPosY = 5, _startIndex = 0, _listCount = 0, _panelTitle = (UI.getChildControl)(Panel_WorkerRestoreAll, "titlebar_RestoreAll"), _itemListBG = (UI.getChildControl)(Panel_WorkerRestoreAll, "Static_ItemList_BG"), _selectItemGuide = (UI.getChildControl)(Panel_WorkerRestoreAll, "StaticText_Select_Item_Guide"), _workerStatusBG = (UI.getChildControl)(Panel_WorkerRestoreAll, "Static_WorkerStatusBG"), _workernPoint = (UI.getChildControl)(Panel_WorkerRestoreAll, "StaticText_Worker"), _restorePoint = (UI.getChildControl)(Panel_WorkerRestoreAll, "StaticText_RestorePoint"), _possiblePoint = (UI.getChildControl)(Panel_WorkerRestoreAll, "StaticText_PossiblePoint"), _slider = (UI.getChildControl)(Panel_WorkerRestoreAll, "Slider_Restore_Item"), _midLine = (UI.getChildControl)(Panel_WorkerRestoreAll, "Static_MidLine"), _btnWinClose = (UI.getChildControl)(Panel_WorkerRestoreAll, "Button_Close"), _btnConfirm = (UI.getChildControl)(Panel_WorkerRestoreAll, "Button_Restore"), _btnCancel = (UI.getChildControl)(Panel_WorkerRestoreAll, "Button_Cancel"), restoreItemMaxCount = 5, restoreItemHasCount = 0, 
restoreItemSlot = {}
, selectedRestoreWorkerIdx = 0, selectedItemIdx = 0, selectedUiIndex = -1, sliderStartIdx = 0, upgradeWokerIdx = -1}
workerRestoreAll._sliderBtn = (UI.getChildControl)(workerRestoreAll._slider, "Slider_Restore_Item_Button")
local itemSelectList = {}
local workerListCount = 0
local workerArray = (Array.new)()
local workerRestoreAll_Init = function()
  -- function num : 0_0 , upvalues : workerRestoreAll
  local self = workerRestoreAll
  for resIdx = 0, self.restoreItemMaxCount - 1 do
    local tempItemSlot = {}
    tempItemSlot.slotBG = (UI.createAndCopyBasePropertyControl)(Panel_WorkerRestoreAll, "Static_Restore_Item_Icon_BG", self._itemListBG, "workerManager_restoreSlotBG_" .. resIdx)
    tempItemSlot.slotIcon = (UI.createAndCopyBasePropertyControl)(Panel_WorkerRestoreAll, "Static_Restore_Item_Icon", tempItemSlot.slotBG, "workerManager_restoreSlot_" .. resIdx)
    tempItemSlot.selectIcon = (UI.createAndCopyBasePropertyControl)(Panel_WorkerRestoreAll, "Static_Selected_Item_Icon", tempItemSlot.slotBG, "workerManager_selectedSlot_" .. resIdx)
    tempItemSlot.itemCount = (UI.createAndCopyBasePropertyControl)(Panel_WorkerRestoreAll, "StaticText_Item_Count", tempItemSlot.slotIcon, "workerManager_restoreItemCount_" .. resIdx)
    tempItemSlot.restorePoint = (UI.createAndCopyBasePropertyControl)(Panel_WorkerRestoreAll, "StaticText_Item_Restore_Value", tempItemSlot.slotIcon, "workerManager_restorePoint_" .. resIdx)
    ;
    (tempItemSlot.slotBG):SetPosX(5 + (tempItemSlot.slotBG):GetSizeX() * resIdx)
    ;
    (tempItemSlot.slotBG):SetPosY(23)
    ;
    (tempItemSlot.slotIcon):SetPosX(5)
    ;
    (tempItemSlot.slotIcon):SetPosY(5)
    ;
    (tempItemSlot.selectIcon):SetPosX(2)
    ;
    (tempItemSlot.selectIcon):SetPosY(2)
    ;
    (tempItemSlot.itemCount):SetPosX((tempItemSlot.slotIcon):GetSizeX() - 9)
    ;
    (tempItemSlot.itemCount):SetPosY((tempItemSlot.slotIcon):GetSizeY() - 10)
    ;
    (tempItemSlot.restorePoint):SetPosX(3)
    ;
    (tempItemSlot.restorePoint):SetPosY(2)
    ;
    (tempItemSlot.slotBG):addInputEvent("Mouse_UpScroll", "workerRestoreAll_SliderScroll( true )")
    ;
    (tempItemSlot.slotBG):addInputEvent("Mouse_DownScroll", "workerRestoreAll_SliderScroll( false )")
    ;
    (tempItemSlot.slotIcon):addInputEvent("Mouse_UpScroll", "workerRestoreAll_SliderScroll( true )")
    ;
    (tempItemSlot.slotIcon):addInputEvent("Mouse_DownScroll", "workerRestoreAll_SliderScroll( false )")
    ;
    (tempItemSlot.selectIcon):addInputEvent("Mouse_UpScroll", "workerRestoreAll_SliderScroll( true )")
    ;
    (tempItemSlot.selectIcon):addInputEvent("Mouse_DownScroll", "workerRestoreAll_SliderScroll( false )")
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.restoreItemSlot)[resIdx] = tempItemSlot
  end
  ;
  (self._itemListBG):AddChild(self._slider)
  ;
  (self._itemListBG):addInputEvent("Mouse_UpScroll", "workerRestoreAll_SliderScroll( true )")
  ;
  (self._itemListBG):addInputEvent("Mouse_DownScroll", "workerRestoreAll_SliderScroll( false )")
  ;
  (self._btnCancel):addInputEvent("Mouse_LUp", "workerRestoreAll_Close()")
  ;
  (self._btnWinClose):addInputEvent("Mouse_LUp", "workerRestoreAll_Close()")
  ;
  (self._slider):SetPosX(10)
  ;
  (self._slider):SetPosY(75)
  Panel_WorkerRestoreAll:RemoveControl(self._slider)
end

local restoreItem_update = function()
  -- function num : 0_1 , upvalues : workerRestoreAll, itemSelectList, workerListCount, workerArray
  local self = workerRestoreAll
  for itemIdx = 0, self.restoreItemMaxCount - 1 do
    local slot = (self.restoreItemSlot)[itemIdx]
    ;
    (slot.slotBG):SetShow(false)
    ;
    (slot.slotIcon):addInputEvent("Mouse_RUp", "")
    ;
    (slot.selectIcon):addInputEvent("Mouse_RUp", "")
    ;
    (slot.selectIcon):SetShow(false)
  end
  self.restoreItemHasCount = ToClient_getNpcRecoveryItemList()
  if self.restoreItemHasCount <= 0 then
    Panel_WorkerRestoreAll:SetShow(false)
    if Panel_WorkerRestoreAll:IsUISubApp() then
      Panel_WorkerRestoreAll:CloseUISubApp()
    end
  end
  local uiIdx = 0
  for itemIdx = self.sliderStartIdx, self.restoreItemHasCount - 1 do
    if self.restoreItemMaxCount <= uiIdx then
      break
    end
    local slot = (self.restoreItemSlot)[uiIdx]
    ;
    (slot.slotBG):SetShow(true)
    if itemSelectList[itemIdx] then
      (slot.selectIcon):SetShow(true)
    else
      if itemSelectList[itemIdx] == false then
        (slot.selectIcon):SetShow(false)
      end
    end
    local recoveryItem = ToClient_getNpcRecoveryItemByIndex(itemIdx)
    local itemStatic = recoveryItem:getItemStaticStatus()
    ;
    (slot.slotIcon):ChangeTextureInfoName("icon/" .. getItemIconPath(itemStatic))
    ;
    (slot.itemCount):SetText(tostring(recoveryItem._itemCount_s64))
    ;
    (slot.restorePoint):SetText("+" .. tostring(recoveryItem._contentsEventParam1))
    ;
    (slot.slotIcon):addInputEvent("Mouse_LUp", "HandleClicked_restoreAll_SelectItem(" .. itemIdx .. ")")
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
        local workerCount = 0
        local totalPoint = 0
        local selectItem = ToClient_getNpcRecoveryItemByIndex(self.selectedItemIdx)
        if selectItem == nil then
          return 
        end
        local selectItemCount = Int64toInt32(selectItem._itemCount_s64)
        local selectItemPoint = selectItem._contentsEventParam1
        local totalselectItemPoint = selectItemCount * selectItemPoint
        for idx = 1, workerListCount do
          local workerNoRaw = workerArray[idx]
          local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
          local maxPoint = workerWrapperLua:getMaxActionPoint()
          local currentPoint = workerWrapperLua:getActionPoint()
          local restoreActionPoint = maxPoint - currentPoint
          local remainder = 0
          remainder = restoreActionPoint % selectItemPoint
          if currentPoint + selectItemPoint <= maxPoint then
            workerCount = workerCount + 1
            totalPoint = totalPoint + (restoreActionPoint - remainder)
          end
        end
        local WorkerRestore = function()
    -- function num : 0_1_0 , upvalues : self
    local sizeX = 0
    local itemTextSizeX = (self._selectItemGuide):GetTextSizeX()
    local workerTextSizeX = (self._workernPoint):GetTextSizeX()
    local restoreTextSizeX = (self._restorePoint):GetTextSizeX()
    local possibleTextSizeX = (self._possiblePoint):GetTextSizeX()
    local Size_Com = function(bgSize, controlSize)
      -- function num : 0_1_0_0
      if bgSize < controlSize then
        bgSize = controlSize
      end
      return bgSize
    end

    sizeX = Size_Com(sizeX, itemTextSizeX)
    sizeX = Size_Com(sizeX, workerTextSizeX)
    sizeX = Size_Com(sizeX, restoreTextSizeX)
    sizeX = Size_Com(sizeX, possibleTextSizeX)
    local bgSizeX = 0
    local itemBGSizeX1 = (self._itemListBG):GetSizeX()
    local descBGSizeX2 = (self._workerStatusBG):GetSizeX()
    bgSizeX = Size_Com(bgSizeX, itemBGSizeX1)
    bgSizeX = Size_Com(bgSizeX, descBGSizeX2)
    if bgSizeX < sizeX + 20 then
      local sizeX = sizeX + 20 - bgSizeX
      Panel_WorkerRestoreAll:SetSize(Panel_WorkerRestoreAll:GetSizeX() + sizeX, Panel_WorkerRestoreAll:GetSizeY())
      Panel_WorkerRestoreAll:SetPosX(Panel_WorkerRestoreAll:GetPosX() - sizeX)
      ;
      (self._itemListBG):SetSize(bgSizeX + sizeX, (self._itemListBG):GetSizeY())
      ;
      (self._workerStatusBG):SetSize((self._workerStatusBG):GetSizeX() + sizeX, (self._workerStatusBG):GetSizeY())
      ;
      (self._panelTitle):SetSize((self._panelTitle):GetSizeX() + sizeX, (self._panelTitle):GetSizeY())
      ;
      (self._midLine):SetSize((self._midLine):GetSizeX() + sizeX, (self._midLine):GetSizeY())
      ;
      (self._slider):SetSize((self._slider):GetSizeX() + sizeX, (self._slider):GetSizeY())
      ;
      (self._slider):SetInterval((self._slider):GetSizeX() + sizeX)
      ;
      (self._btnCancel):ComputePos()
      ;
      (self._btnConfirm):ComputePos()
      ;
      (self._btnWinClose):ComputePos()
    end
  end

        ;
        (self._selectItemGuide):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WORKERRESTOREALL_DESC_SELECTITEM"))
        ;
        (self._workernPoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRESTORE_WORKERCOUNT", "count", tostring(workerCount)))
        ;
        (self._restorePoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRESTORE_POSSIBLE", "totalPoint", tostring(totalPoint)))
        if totalPoint <= totalselectItemPoint then
          (self._possiblePoint):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORKERRESTORE_CONSUMEITEM", "selectItemCount", tostring((totalPoint) / selectItemPoint), "totalPoint", tostring(totalPoint)))
        else
          if totalselectItemPoint < totalPoint then
            (self._possiblePoint):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORKERRESTORE_CONSUMEITEM", "selectItemCount", tostring(selectItemCount), "totalPoint", tostring(totalselectItemPoint)))
          end
        end
        WorkerRestore()
      end
    end
  end
end

HandleClicked_restoreAll_SelectItem = function(itemIdx)
  -- function num : 0_2 , upvalues : workerRestoreAll, itemSelectList, restoreItem_update
  local self = workerRestoreAll
  for idx = 0, self.restoreItemHasCount - 1 do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R6 in 'UnsetPending'

    itemSelectList[idx] = false
  end
  do
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

    if itemSelectList[itemIdx] == nil or itemSelectList[itemIdx] == false then
      itemSelectList[itemIdx] = true
      self.selectedItemIdx = itemIdx
    else
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

      itemSelectList[itemIdx] = false
    end
    ;
    (self._btnConfirm):addInputEvent("Mouse_LUp", "workerRestoreAll_Confirm(" .. self.selectedItemIdx .. ")")
    restoreItem_update()
  end
end

workerRestoreAll_SliderScroll = function(isUp)
  -- function num : 0_3 , upvalues : workerRestoreAll, restoreItem_update
  local self = workerRestoreAll
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
  -- function num : 0_4 , upvalues : workerRestoreAll, restoreItem_update
  local self = workerRestoreAll
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

workerRestoreAll_Confirm = function(itemIdx)
  -- function num : 0_5 , upvalues : workerRestoreAll, itemSelectList, workerListCount, workerArray
  local self = workerRestoreAll
  local recoveryItem = ToClient_getNpcRecoveryItemByIndex(itemIdx)
  local recoveryItemCount = Int64toInt32(recoveryItem._itemCount_s64)
  local restorePoint = recoveryItem._contentsEventParam1
  local slotNo = recoveryItem._slotNo
  local selectCheckCount = 0
  for ii = 0, self.restoreItemHasCount - 1 do
    if itemSelectList[ii] == true then
      selectCheckCount = selectCheckCount + 1
    end
  end
  if selectCheckCount == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERRESTORE_NOSELECTITEM"))
    return 
  end
  local currentItemCount = recoveryItemCount
  for idx = 1, workerListCount do
    local workerNoRaw = workerArray[idx]
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
    local maxPoint = workerWrapperLua:getMaxActionPoint()
    local currentPoint = workerWrapperLua:getActionPoint()
    local restoreItemCount = ToClient_getNpcRecoveryItemList()
    local restoreActionPoint = maxPoint - currentPoint
    local itemNeedCount = (math.floor)(restoreActionPoint / restorePoint)
    if currentItemCount < itemNeedCount then
      itemNeedCount = currentItemCount
    end
    if itemNeedCount >= 1 then
      requestRecoveryWorker(WorkerNo(workerNoRaw), slotNo, itemNeedCount)
      currentItemCount = currentItemCount - itemNeedCount
    end
  end
end

FGlobal_restoreItem_update = function()
  -- function num : 0_6 , upvalues : restoreItem_update
  restoreItem_update()
end

FGlobal_WorkerRestoreAll_Open = function(listCount, workerNoRaw)
  -- function num : 0_7 , upvalues : workerListCount, workerArray
  Panel_WorkerRestoreAll:SetPosX(getScreenSizeX() - Panel_WorkerManager:GetSizeX() - Panel_WorkerRestoreAll:GetSizeX() - 10)
  Panel_WorkerRestoreAll:SetPosY(Panel_WorkerManager:GetPosY())
  if Panel_WorkerManager:IsUISubApp() then
    if Panel_WorkerManager:GetScreenParentPosX() > 0 then
      Panel_WorkerRestoreAll:SetPosX(Panel_WorkerManager:GetScreenParentPosX() - Panel_WorkerRestoreAll:GetSizeX() - 10)
    else
      Panel_WorkerRestoreAll:SetPosX(Panel_WorkerManager:GetScreenParentPosX() + Panel_WorkerManager:GetSizeX() - 10)
    end
    Panel_WorkerRestoreAll:SetPosY(Panel_WorkerManager:GetScreenParentPosY())
  end
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:push(Panel_WorkerRestoreAll, true)
  else
    Panel_WorkerRestoreAll:SetShow(true)
    if Panel_WorkerManager:IsUISubApp() then
      Panel_WorkerRestoreAll:OpenUISubApp()
    end
  end
  workerListCount = listCount
  workerArray = workerNoRaw
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R2 in 'UnsetPending'

  self.sliderStartIdx = 0
  HandleClicked_restoreAll_SelectItem(0)
end

workerRestoreAll_Close = function()
  -- function num : 0_8
  Panel_WorkerRestoreAll:SetShow(false)
  if Panel_WorkerRestoreAll:IsUISubApp() then
    Panel_WorkerRestoreAll:CloseUISubApp()
  end
end

workerRestoreAll_Init()

