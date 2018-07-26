Panel_Worldmap_HouseCraft:ignorePadSnapMoveToOtherPanel()
local Window_WorldMap_HouseCraftInfo = {
  _ui = {
    _static_TopBg = UI.getChildControl(Panel_Worldmap_HouseCraft, "Static_TopBg"),
    _static_TopDescBg = UI.getChildControl(Panel_Worldmap_HouseCraft, "Static_TopDescBg"),
    _static_CenterBg = UI.getChildControl(Panel_Worldmap_HouseCraft, "Static_CenterBg"),
    _static_BottomBg = UI.getChildControl(Panel_Worldmap_HouseCraft, "Static_BottomBg")
  },
  _config = {
    _columnCount = 6,
    _rowCount = 4,
    _slotMax = 24,
    _craftItemStartPosX,
    _resourceItemStartPosX
  },
  _craftringConfig = {
    _none = 0,
    _craft = 1,
    _largeCraft = 2
  },
  _houseInfoSS,
  _houseKey,
  _param,
  _prevGetWearHouseKey,
  _workList_Count,
  _workerList = {},
  _craftItemList = {},
  _craftSlotList = {},
  _resourceSlotList = {},
  _position,
  _craftSlotConfig = {createIcon = true},
  _resourceSlotConfig = {createIcon = true, createCount = true},
  _currentWorkerIndex = 0,
  _currentCraftIndex = 0,
  _isCraftable = false,
  _currentScrollValue = 0,
  _scrollMax = 0,
  _craftingType = 0,
  _craftingWorkName,
  _isCraftingWorkCountCheck = false
}
function Window_WorldMap_HouseCraftInfo:ClearCraftSlot()
  for _, control in pairs(self._craftSlotList) do
    if nil ~= control then
      control._bg:SetShow(false)
    end
  end
end
function Window_WorldMap_HouseCraftInfo:ClearResourceSlot()
  for _, control in pairs(self._resourceSlotList) do
    if nil ~= control then
      control._bg:SetShow(false)
    end
  end
end
function Window_WorldMap_HouseCraftInfo:SetWorkListData()
  local level = self._param._level
  local receipeKey = self._param._useType
  self._workList_Count = ToClient_getHouseWorkableListCount(self._houseInfoSS)
  local workCount = ToClient_getRentHouseWorkableListByCustomOnlySize(receipeKey, 1, level)
  self._craftItemList = {}
  local realIndex = 0
  for index = 0, workCount - 1 do
    local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(self._houseInfoSS, index)
    if true == esSSW:isSet() then
      self._craftItemList[realIndex] = {}
      local esSS = esSSW:get()
      local itemStaticWrapper = esSSW:getResultItemStaticStatusWrapper()
      local itemStatic = itemStaticWrapper:get()
      local gradeType = itemStaticWrapper:getGradeType()
      local workVolume = Int64toInt32(esSS._productTime / toInt64(0, 1000))
      local workName = esSSW:getDescription()
      local workDesc = esSSW:getDetailDescription()
      local workIcon = "icon/" .. esSSW:getIcon()
      local workKey = ToClient_getWorkableExchangeKeyByIndex(index - 1)
      local exchangeKeyRaw = esSSW:getExchangeKeyRaw()
      local resultIcon = workIcon
      local resultName = workName
      local resultKey
      if false == esSSW:getUseExchangeIcon() then
        resultName = getItemName(itemStatic)
        resultKey = itemStatic._key
      end
      self._craftItemList[realIndex] = {
        _index = index,
        _level = levelIndex,
        _workName = workName,
        _workDesc = workDesc,
        _workKey = workKey,
        _workIcon = workIcon,
        _workVolume = workVolume,
        _resultIcon = resultIcon,
        _resultName = resultName,
        _resultKey = resultKey,
        _gradeType = gradeType,
        _exchangeKeyRaw = exchangeKeyRaw,
        _isCraftable = true,
        _resource = {},
        _inherit = {},
        _resourceCount = 1
      }
      local eSSCount = getExchangeSourceNeedItemList(esSS, true)
      self._craftItemList[realIndex]._resourceCount = eSSCount
      local resource = {}
      for resourceIndex = 0, eSSCount - 1 do
        resource[resourceIndex] = {}
        local itemStaticInfomationWrapper = getExchangeSourceNeedItemByIndex(resourceIndex)
        local itemStaticWrapper = itemStaticInfomationWrapper:getStaticStatus()
        local itemStatic = itemStaticWrapper:get()
        local itemKey = itemStaticInfomationWrapper:getKey()
        local _gradeType = itemStaticWrapper:getGradeType()
        local resourceKey = itemStatic._key
        local itemIcon = "icon/" .. getItemIconPath(itemStatic)
        local needCount = Int64toInt32(itemStaticInfomationWrapper:getCount_s64())
        resource[resourceIndex] = {
          _index = resourceIndex,
          _itemKey = itemKey,
          _resourceKey = resourceKey,
          _itemIcon = itemIcon,
          _needCount = needCount,
          _haveCount = 0,
          _gradeType = _gradeType,
          _esSSW = itemStaticInfomationWrapper
        }
      end
      self._craftItemList[realIndex]._resource = resource
      realIndex = realIndex + 1
    end
  end
  self._position = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey):getPosition()
  self:SetCraftItem()
end
function Window_WorldMap_HouseCraftInfo:SetCraftItem()
  local craftCount = #self._craftItemList
  self:ClearCraftSlot()
  UIScroll.SetButtonSize(self._ui._scroll_CraftList, self._config._rowCount, craftCount / self._config._columnCount)
  self._scrollMax = Int64toInt32((#self._craftItemList + 1) / self._config._columnCount)
  if 0 ~= (#self._craftItemList + 1) % self._config._columnCount then
    self._scrollMax = self._scrollMax + 1
  end
  for index = 0, self._config._slotMax - 1 do
    local itemIndex = self._currentScrollValue * self._config._columnCount + index
    local craftItemInfo = self._craftItemList[itemIndex]
    local esSSW
    if nil ~= craftItemInfo then
      esSSW = ToClient_getHouseWorkableItemExchangeByIndex(self._houseInfoSS, craftItemInfo._index)
    end
    if nil ~= craftItemInfo and nil ~= esSSW then
      local slot = self._craftSlotList[index]
      if nil == slot then
        local control = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, self._ui._static_CraftItemListBg, "static_craftItem_" .. index)
        CopyBaseProperty(self._ui._static_CraftItemTemplate, control)
        slot = {}
        slot._bg = control
        SlotItem.new(slot, "craftSlot_" .. index, index, control, self._craftSlotConfig)
        slot:createChild()
      end
      local itemStaticWrapper = esSSW:getResultItemStaticStatusWrapper()
      slot:setItemByStaticStatus(itemStaticWrapper)
      slot._bg:SetPosX(self._config._craftItemStartPosX + slot._bg:GetSizeX() * Int64toInt32(index % self._config._columnCount))
      slot._bg:SetPosY(self._config._craftItemStartPosX + slot._bg:GetSizeY() * Int64toInt32(index / self._config._columnCount))
      slot.icon:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_HouseCraft_SelectCraftItem(" .. craftItemInfo._index .. ")")
      slot.icon:addInputEvent("Mouse_On", "PaGlobalFunc_WorldMap_HouseCraft_ShowCraftTooltip(" .. index .. "," .. craftItemInfo._index .. ",true)")
      slot.icon:addInputEvent("Mouse_Out", "PaGlobalFunc_WorldMap_HouseCraft_HideCraftTooltip(" .. craftItemInfo._index .. ")")
      if index < self._config._columnCount then
        slot._bg:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "PaGlobalFunc_WorldMap_HouseCraft_ScrollHandle(true)")
      end
      if index >= self._config._slotMax - self._config._columnCount then
        slot._bg:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "PaGlobalFunc_WorldMap_HouseCraft_ScrollHandle(false)")
      end
      slot._bg:SetShow(true)
      self._craftSlotList[index] = slot
    end
  end
  ToClient_padSnapRefreshTarget(self._ui._static_CraftItemListBg)
end
function PaGlobalFunc_WorldMap_HouseCraft_ShowCraftTooltip(iconIndex, craftIndex)
  local self = Window_WorldMap_HouseCraftInfo
  local uiBase = self._craftSlotList[iconIndex].icon
  local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex(craftIndex)
  if esSSW:isSet() then
    FGlobal_Show_Tooltip_Work(esSSW, uiBase)
  end
end
function PaGlobalFunc_WorldMap_HouseCraft_HideCraftTooltip(craftIndex)
  local self = Window_WorldMap_HouseCraftInfo
  local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex(craftIndex)
  if esSSW:isSet() then
    FGlobal_Hide_Tooltip_Work(esSSW, false)
  end
end
function PaGlobalFunc_WorldMap_HouseCraft_SelectCraftItem(id)
  local self = Window_WorldMap_HouseCraftInfo
  self._currentCraftIndex = id
  self:SetResourceItem()
  self:SetInfo()
end
function Window_WorldMap_HouseCraftInfo:SetInfo()
  local craftItemInfo = self._craftItemList[self._currentCraftIndex]
  if nil == craftItemInfo then
    return
  end
  local workerInfo = self._workerList[self._currentWorkerIndex]
  self._ui._staticText_ItemName:SetText(craftItemInfo._workName)
  self._ui._staticText_WorkCount:SetText(craftItemInfo._workVolume)
  if nil ~= workerInfo then
    local distance = ToClient_getCalculateMoveDistance(workerInfo._workerNo, self._position) / 100
    local workSpeed = workerInfo._workSpeed
    local moveSpeed = workerInfo._moveSpeed
    local workBaseTime = ToClient_getNpcWorkingBaseTime() / 1000
    local totalWorkTime = math.ceil(craftItemInfo._workVolume / math.floor(workSpeed)) * workBaseTime + distance / moveSpeed * 2
    self._ui._staticText_Distance:SetText(string.format("%.0f", distance))
    self._ui._staticText_WorkSpeed:SetText(string.format("%.2f", workSpeed))
    self._ui._staticText_MoveSpeed:SetText(string.format("%.2f", moveSpeed))
    self._ui._static_WarningIcon:SetShow(not self._isCraftable)
    self._ui._keyGuide_DoWork:SetShow(self._isCraftable)
    self._ui._staticText_leftTime:SetText(Util.Time.timeFormatting(math.floor(totalWorkTime)))
  else
    self._ui._staticText_Distance:SetText("--")
    self._ui._staticText_WorkSpeed:SetText("--")
    self._ui._staticText_MoveSpeed:SetText("--")
    self._ui._staticText_leftTime:SetText("--")
  end
  if true == self._isCraftable then
    Panel_Worldmap_HouseCraft:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_WorldMap_HouseCraft_DoWork()")
  else
    Panel_Worldmap_HouseCraft:registerPadEvent(__eConsoleUIPadEvent_Up_X, "")
  end
end
function PaGlobalFunc_WorldMap_HouseCraft_DoWork()
  local self = Window_WorldMap_HouseCraftInfo
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return
  end
  if nil == self._currentWorkerIndex then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_RentHouseNoWorkingByWorkerNotSelect"))
    return
  end
  local workingType = CppEnums.NpcWorkingType.eNpcWorkingType_PlantRentHouse
  local houseUseType = self._param._houseUseType
  local itemExchangeKeyRaw = self._craftItemList[self._currentCraftIndex]._exchangeKeyRaw
  local workerNoRaw = self._workerList[self._currentWorkerIndex]._workerNo_s64
  local workerWrapperLua = getWorkerWrapper(workerNoRaw, true)
  local waypointKey = workerWrapperLua:getHomeWaypoint()
  local workerRepeatCount = workerWrapperLua:getAdditionalRepeatCount(workingType, houseUseType, waypointKey, itemExchangeKeyRaw)
  local workKey = ToClient_getWorkableExchangeKeyByIndex(self._craftItemList[self._currentCraftIndex]._index)
  ToClient_requestStartRentHouseWorkingToNpcWorker(self._houseInfoSS, self._workerList[self._currentWorkerIndex]._workerNo, workKey, 1, -1)
end
function Window_WorldMap_HouseCraftInfo:SetResourceItem()
  self:ClearResourceSlot()
  local craftItemInfo = self._craftItemList[self._currentCraftIndex]
  if nil == craftItemInfo then
    return
  end
  local workerInfo = self._workerList[self._currentWorkerIndex]
  local resourceList = craftItemInfo._resource
  self._isCraftable = true
  for index = 0, craftItemInfo._resourceCount - 1 do
    local resourceInfo = resourceList[index]
    local esSSW = resourceInfo._esSSW
    if nil ~= resourceInfo then
      local slot = self._resourceSlotList[index]
      if nil == slot then
        local control = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, self._ui._static_InfoBg, "static_NeedItem_" .. index)
        CopyBaseProperty(self._ui._static_NeedItemTemplate, control)
        slot = {}
        slot._bg = control
        SlotItem.new(slot, "needSlot_" .. index, index, slot._bg, self._resourceSlotConfig)
        slot:createChild()
      end
      local itemStaticWrapper = getItemEnchantStaticStatus(resourceInfo._itemKey)
      slot:setItemByStaticStatus(itemStaticWrapper)
      slot.icon:addInputEvent("Mouse_On", "PaGlobalFunc_WorldMap_HouseCraft_ShowResourceTooltip(" .. index .. ")")
      slot.icon:addInputEvent("Mouse_Out", "PaGlobalFunc_WorldMap_HouseCraft_HideResourceTooltip()")
      slot._bg:SetPosX(self._config._resourceItemStartPosX + slot._bg:GetSizeX() * index)
      slot._bg:SetShow(true)
      if nil == workerInfo then
        resourceInfo._haveCount = 0
      else
        resourceInfo._haveCount = Int64toInt32(warehouse_getItemCount(workerInfo._homeWaypoint, resourceInfo._itemKey))
      end
      slot.count:SetText(resourceInfo._haveCount .. " / " .. resourceInfo._needCount)
      if resourceInfo._haveCount < resourceInfo._needCount then
        self._isCraftable = false
      end
      self._resourceSlotList[index] = slot
    end
  end
  ToClient_padSnapRefreshTarget(self._ui._static_InfoBg)
end
function PaGlobalFunc_WorldMap_HouseCraft_ShowResourceTooltip(resourceIndex)
  local self = Window_WorldMap_HouseCraftInfo
  local uiBase = self._resourceSlotList[resourceIndex].icon
  local resourceKey = self._craftItemList[self._currentCraftIndex]._resource[resourceIndex]._resourceKey
  local staticStatusWrapper = getItemEnchantStaticStatus(resourceKey)
  Panel_Tooltip_Item_Show(staticStatusWrapper, uiBase, true, false)
end
function PaGlobalFunc_WorldMap_HouseCraft_HideResourceTooltip()
  local self = Window_WorldMap_HouseCraftInfo
  Panel_Tooltip_Item_hideTooltip()
end
function Window_WorldMap_HouseCraftInfo:SetWorkerList()
  local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(self._houseInfoSS, 0)
  self._ui._list2_WorkerList:getElementManager():clearKey()
  if true == esSSW:isSet() then
    local esSS = esSSW:get()
    local productCategory = esSS._productCategory
    local workableKey = ToClient_getWorkableExchangeKeyByIndex(0)
    local sortMethod = 0
    local waitingWorkerCount = ToClient_getHouseWaitWorkerList(self._houseInfoSS, productCategory, workableKey, sortMethod)
    if waitingWorkerCount <= 0 then
    else
    end
    self._workerList = {}
    local realIndex = 0
    for index = 0, waitingWorkerCount - 1 do
      local npcWaitingWorker = ToClient_getHouseWaitWorkerByIndex(self._houseInfoSS, index)
      local workerNoRaw = npcWaitingWorker:getWorkerNo():get_s64()
      local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
      if true == ToClient_isWaitWorker(npcWaitingWorker) and false == workerWrapperLua:getIsAuctionInsert() and true == ToClient_getWorkerWorkerableHouse(self._houseInfoSS, index) then
        self._workerList[realIndex] = {}
        local checkData = npcWaitingWorker:getStaticSkillCheckData()
        checkData:set(CppEnums.NpcWorkingType.eNpcWorkingType_PlantRentHouse, self._param._houseUseType, 0)
        checkData._diceCheckForceSuccess = true
        local firstWorkerNo = npcWaitingWorker:getWorkerNo()
        local workerNoChar = firstWorkerNo:get_s64()
        local npcWaitingWorkerSS = npcWaitingWorker:getWorkerStaticStatus()
        local workerNo = WorkerNo(workerNoChar)
        local workSpeed = npcWaitingWorker:getWorkEfficienceWithSkill(checkData, productCategory)
        local moveSpeed = npcWaitingWorker:getMoveSpeedWithSkill(checkData) / 100
        local maxPoint = npcWaitingWorkerSS._actionPoint
        local currentPoint = npcWaitingWorker:getActionPoint()
        local workerRegionWrapper = ToClient_getRegionInfoWrapper(npcWaitingWorker)
        local regionName = "(<PAColor0xff868686>" .. workerRegionWrapper:getAreaName() .. "<PAOldColor>)"
        local homeWaypoint = npcWaitingWorker:getHomeWaypoint()
        local name = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. npcWaitingWorker:getLevel() .. " " .. getWorkerName(npcWaitingWorkerSS)
        local workerGrade = npcWaitingWorkerSS:getCharacterStaticStatus()._gradeType:get()
        self._workerList[realIndex] = {
          _workerNo = workerNo,
          _workerNo_s64 = workerNoChar,
          _workerNoChar = Int64toInt32(workerNoChar),
          _name = name,
          _workSpeed = workSpeed / 1000000,
          _moveSpeed = moveSpeed,
          _maxPoint = maxPoint,
          _currentPoint = currentPoint,
          _homeWaypoint = homeWaypoint,
          _workerGrade = workerGrade,
          _regionName = regionName
        }
        self._ui._list2_WorkerList:getElementManager():pushKey(toInt64(0, realIndex))
        self._ui._list2_WorkerList:requestUpdateByKey(toInt64(0, realIndex))
        realIndex = realIndex + 1
      end
    end
  end
end
function Window_WorldMap_HouseCraftInfo:InitData(houseInfoSSWrapper, _param)
  self._ui._staticText_Title:SetText(_param._houseName)
  self._ui._staticText_CraftTitle:SetText(_param._useTypeName)
  self._ui._staticText_CraftDesc:SetText(_param._useType_Desc)
  self._ui._scroll_CraftList:SetControlTop()
  self._houseInfoSS = houseInfoSSWrapper:get()
  self._houseKey = houseInfoSSWrapper:getHouseKey()
  self._param = _param
  self._prevGetWearHouseKey = nil
  local workingcnt = getWorkingListAtRentHouse(self._houseKey)
  local isLargeCraft = ToClient_getLargeCraftExchangeKeyRaw(self._houseInfoSS)
  self:SetWorkListData()
  self:SetWorkerList()
  if isLargeCraft > 0 then
    self._isCraftingWorkCountCheck = false
    self._craftingType = self._craftringConfig._largeCraft
  elseif workingcnt > 0 then
    self._isCraftingWorkCountCheck = false
    self._craftingType = self._craftringConfig._craft
  end
end
function Window_WorldMap_HouseCraftInfo:InitControl()
  self._ui._staticText_Title = UI.getChildControl(self._ui._static_TopBg, "StaticText_Title")
  self._ui._staticText_CraftTitle = UI.getChildControl(self._ui._static_TopDescBg, "StaticText_Title")
  self._ui._staticText_CraftDesc = UI.getChildControl(self._ui._static_TopDescBg, "StaticText_Desc")
  self._ui._staticText_CraftDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._list2_WorkerList = UI.getChildControl(self._ui._static_CenterBg, "List2_Worker")
  self._ui._static_CraftItemListBg = UI.getChildControl(self._ui._static_CenterBg, "Static_CraftItemListBg")
  self._ui._static_CraftItemTemplate = UI.getChildControl(self._ui._static_CraftItemListBg, "Static_CraftItemSlotBg_Template")
  self._ui._static_CraftItemTemplate:SetShow(false)
  self._config._craftItemStartPosX = self._ui._static_CraftItemTemplate:GetPosX()
  self._ui._static_InfoBg = UI.getChildControl(self._ui._static_CenterBg, "Static_InfoBg")
  self._ui._staticText_ItemName = UI.getChildControl(self._ui._static_InfoBg, "StaticText_ItemName")
  self._ui._static_NeedItemTemplate = UI.getChildControl(self._ui._static_InfoBg, "Static_MaterialItemSlotBg_Template")
  self._ui._static_NeedItemTemplate:SetShow(false)
  self._config._resourceItemStartPosX = self._ui._static_NeedItemTemplate:GetPosX() - 30
  self._ui._staticText_leftTime = UI.getChildControl(self._ui._static_InfoBg, "StaticText_LeftTimeValue")
  self._ui._staticText_WorkCount = UI.getChildControl(self._ui._static_InfoBg, "StaticText_WorkCountValue")
  self._ui._staticText_Distance = UI.getChildControl(self._ui._static_InfoBg, "StaticText_DistanceValue")
  self._ui._staticText_WorkSpeed = UI.getChildControl(self._ui._static_InfoBg, "StaticText_WorkSpeedValue")
  self._ui._staticText_MoveSpeed = UI.getChildControl(self._ui._static_InfoBg, "StaticText_MoveSpeedValue")
  self._ui._progress2_WorkTime = UI.getChildControl(self._ui._static_InfoBg, "Progress2_WorkTime")
  self._ui._scroll_CraftList = UI.getChildControl(self._ui._static_CraftItemListBg, "Scroll_CraftItem")
  self._ui._static_WarningIcon = UI.getChildControl(self._ui._static_BottomBg, "StaticText_WarningIcon")
  self._ui._keyGuide_DoWork = UI.getChildControl(self._ui._static_BottomBg, "StaticText_X_ConsoleUI")
end
function Window_WorldMap_HouseCraftInfo:InitEvent()
  self._ui._list2_WorkerList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_WorldMap_HouseCraft_List2EventControlCreate")
  self._ui._list2_WorkerList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  Panel_Worldmap_HouseCraft:RegisterUpdateFunc("PaGlobalFunc_WorldMap_HouseCraft_UpdatePerFrame")
end
function Window_WorldMap_HouseCraftInfo:InitRegister()
  registerEvent("EventWarehouseUpdate", "PaGlobalFunc_FromClient_WorldMap_HouseCraft_Update")
  registerEvent("WorldMap_WorkerDataUpdateByHouse", "PaGlobalFunc_FromClient_WorldMap_HouseCraft_WorkerDataUpdateByHouse")
end
function Window_WorldMap_HouseCraftInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_WorldMap_HouseCraft_UpdatePerFrame(deltaTime)
  local self = Window_WorldMap_HouseCraftInfo
  local workingcnt = getWorkingListAtRentHouse(self._houseKey)
  local workName = self._craftingWorkName
  for index = 0, workingcnt - 1 do
    local worker = getWorkingByIndex(index).workerNo
    local workerNo = worker:get_s64()
    local workingProgress = getWorkingProgress(workerNo) * 100000
    local remainTime = Util.Time.timeFormatting(ToClient_getWorkingTime(workerNo))
    self._ui._progress2_WorkTime:SetProgressRate(workingProgress)
    self._ui._staticText_leftTime:SetText(remainTime)
    if 0 < ToClient_getNpcWorkerWorkingCount(workerNo) then
      self._ui._staticText_ItemName:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_WORKNAME", "workName", workName, "workerNo", ToClient_getNpcWorkerWorkingCount(workerNo)))
    end
  end
end
function PaGlobalFunc_WorldMap_HouseCraft_List2EventControlCreate(list_content, key)
  local self = Window_WorldMap_HouseCraftInfo
  local id = Int64toInt32(key)
  local workerInfo = self._workerList[id]
  if nil == workerInfo then
    return
  end
  local static_button = UI.getChildControl(list_content, "Button_ButtonBg")
  local static_image = UI.getChildControl(list_content, "Static_WorkerImage")
  local progress2_EnergyProgress = UI.getChildControl(list_content, "Progress2_EnergyProgress")
  local progress2_remainTimeProgress = UI.getChildControl(list_content, "Progress2_RemainTimeProgress")
  local staticText_remainTime = UI.getChildControl(list_content, "StaticText_RemainTime")
  local staticText_workingName = UI.getChildControl(list_content, "StaticText_WorkingNameCount")
  local staticText_name = UI.getChildControl(list_content, "StaticText_WorkerTitle")
  local staticText_town = UI.getChildControl(list_content, "StaticText_Node")
  local static_CheckIcon = UI.getChildControl(list_content, "Static_CheckIcon")
  local maxPoint = workerInfo._maxPoint
  local currentPoint = workerInfo._currentPoint
  local rate = math.ceil(100 * currentPoint / maxPoint)
  progress2_EnergyProgress:SetCurrentProgressRate(rate)
  progress2_EnergyProgress:SetProgressRate(rate)
  static_CheckIcon:SetShow(id == self._currentWorkerIndex)
  local workerWrapperLua = getWorkerWrapper(workerInfo._workerNo_s64, true)
  local workerIcon = workerWrapperLua:getWorkerIcon()
  local workerGrade = workerWrapperLua:getGrade()
  local maxPoint = workerInfo._maxPoint
  local currentPoint = workerInfo._currentPoint
  staticText_name:SetFontColor(ConvertFromGradeToColor(workerGrade))
  staticText_name:SetText(workerInfo._name)
  static_button:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_HouseCraft_SelectWorker(" .. id .. ")")
  static_image:ChangeTextureInfoName(workerIcon)
  staticText_town:SetText(workerInfo._regionName)
end
function PaGlobalFunc_WorldMap_HouseCraft_ScrollHandle(isUp)
  local self = Window_WorldMap_HouseCraftInfo
  local prevScrollValue = self._currentScrollValue
  self._currentScrollValue = UIScroll.ScrollEvent(self._ui._scroll_CraftList, isUp, self._config._rowCount, self._scrollMax, self._currentScrollValue, 1)
  ToClient_padSnapIgnoreGroupMove()
  if prevScrollValue ~= self._currentScrollValue then
    self:SetCraftItem()
  end
end
function PaGlobalFunc_WorldMap_HouseCraft_SelectWorker(id)
  local self = Window_WorldMap_HouseCraftInfo
  local prevIndex = self._currentWorkerIndex
  self._currentWorkerIndex = id
  local workerInfo = self._workerList[self._currentWorkerIndex]
  if nil ~= workerInfo then
    local affiliatedTownKey = workerInfo._homeWaypoint
    if self._prevGetWearHouseKey ~= affiliatedTownKey then
      warehouse_requestInfo(affiliatedTownKey)
    end
  end
  self:SetResourceItem()
  self:SetInfo()
  self._ui._list2_WorkerList:requestUpdateByKey(toInt64(0, prevIndex))
  self._ui._list2_WorkerList:requestUpdateByKey(toInt64(0, self._currentWorkerIndex))
end
function PaGlobalFunc_FromClient_WorldMap_HouseCraft_WorkerDataUpdateByHouse(rentHouseWrapper)
  local self = Window_WorldMap_HouseCraftInfo
  if false == PaGlobalFunc_WorldMap_HouseCraft_GetShow() then
    return
  end
  if self._houseKey ~= rentHouseWrapper:getStaticStatus():getHouseKey() then
    return
  end
  self._ui._progress2_WorkTime:SetProgressRate(0)
  self:SetWorkListData()
  self:SetWorkerList()
  self:SetCraftItem()
  self:SetInfo()
end
function PaGlobalFunc_FromClient_WorldMap_HouseCraft_Update(affiliatedTownKey)
  local self = Window_WorldMap_HouseCraftInfo
  if false == PaGlobalFunc_WorldMap_HouseCraft_GetShow() then
    return
  end
  if self._prevGetWearHouseKey == affiliatedTownKey then
    return
  end
  self._prevGetWearHouseKey = affiliatedTownKey
  self:SetWorkListData()
  self:SetWorkerList()
  self:SetCraftItem()
  self:SetInfo()
end
function PaGlobalFunc_WorldMap_HouseCraft_GetShow()
  return Panel_Worldmap_HouseCraft:GetShow()
end
function PaGlobalFunc_WorldMap_HouseCraft_SetShow(isShow, isAni)
  Panel_Worldmap_HouseCraft:SetShow(isShow, isAni)
end
function PaGlobalFunc_WorldMap_HouseCraft_Open(houseInfoSSWrapper, _param)
  local self = Window_WorldMap_HouseCraftInfo
  if true == PaGlobalFunc_WorldMap_HouseCraft_GetShow() then
    return
  end
  if nil == houseInfoSSWrapper then
    PaGlobalFunc_WorldMap_HouseCraft_Close()
    return
  end
  self:InitData(houseInfoSSWrapper, _param)
  PaGlobalFunc_WorldMap_HouseCraft_SelectWorker(0)
  PaGlobalFunc_WorldMap_HouseCraft_SelectCraftItem(0)
  PaGlobalFunc_WorldMap_HouseCraft_SetShow(true, false)
end
function PaGlobalFunc_WorldMap_HouseCraft_Close()
  local self = Window_WorldMap_HouseCraftInfo
  if false == PaGlobalFunc_WorldMap_HouseCraft_GetShow() then
    return
  end
  self._ui._progress2_WorkTime:SetProgressRate(0)
  FGlobal_Hide_Tooltip_Work(nil, true)
  Panel_Tooltip_Item_hideTooltip()
  PaGlobalFunc_WorldMap_HouseCraft_SetShow(false, false)
end
function PaGlobalFunc_FromClient_WorldMap_HouseCraft_luaLoadComplete()
  local self = Window_WorldMap_HouseCraftInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_HouseCraft_luaLoadComplete")
