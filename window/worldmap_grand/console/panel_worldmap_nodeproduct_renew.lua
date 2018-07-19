local Window_WorldMap_NodeProductInfo = {
  _ui = {
    _static_CenterBg = UI.getChildControl(Panel_Worldmap_NodeProduct, "Static_CenterBg"),
    _static_BottomBg = UI.getChildControl(Panel_Worldmap_NodeProduct, "Static_BottomBg")
  },
  _currentNodeInfo = nil,
  _workerInfoList = {},
  _nodeInfo = {}
}
function Window_WorldMap_NodeProductInfo:SetNodeData(explorationNodeInClient)
  self._nodeInfo = {}
  local plantKey = explorationNodeInClient:getPlantKey()
  local _position = getPlant(plantKey):getPositionInGame()
  local workableCnt = ToClient_getPlantWorkableListCount(plantKey)
  for index = 1, workableCnt do
    local workKey = ToClient_getPlantWorkableItemExchangeKeyByIndex(plantKey, index - 1)
    local workName = ToClient_getPlantWorkableItemExchangeDescriptionByIndex(plantKey, index - 1)
    local itemExchangeSS = ToClient_getPlantWorkableItemExchangeByIndex(plantKey, index - 1)
    local _workVolum = Int64toInt32(ToClient_getPlantCorpProductionApply(plantKey, itemExchangeSS._productTime)) / 1000
    local _workableType = itemExchangeSS._productCategory
    local itemStatic = itemExchangeSS:getFirstDropGroup():getItemStaticStatus()
    local _result_Name = getItemName(itemStatic)
    local _result_Icon = "icon/" .. getItemIconPath(itemStatic)
    local _result_Key = itemExchangeSS:getFirstDropGroup()._itemKey
    self._nodeInfo._plantKey = plantKey
    self._nodeInfo._workKey = workKey
    self._nodeInfo._workableType = _workableType
    self._nodeInfo._workVolum = _workVolum
    self._nodeInfo._position = float3(_position.x, _position.y, _position.z)
    self._nodeInfo._result_Name = _result_Name
    self._nodeInfo._result_Icon = _result_Icon
    self._nodeInfo._result_Key = _result_Key
    self._nodeInfo._workingCount = 1
  end
end
function Window_WorldMap_NodeProductInfo:SetWorkerData()
  self._workerInfoList = {}
  self._ui._list2_Worker:getElementManager():clearKey()
  local sortMethod = 0
  local waitingWorkerCount = ToClient_getPlantWaitWorkerListCount(self._nodeInfo._plantKey, self._nodeInfo._workableType, self._nodeInfo._workKey, sortMethod)
  local workerIndex = 0
  for index = 0, waitingWorkerCount - 1 do
    local npcWaitingWorker = ToClient_getPlantWaitWorkerByIndex(self._nodeInfo._plantKey, index)
    local workerNoRaw = npcWaitingWorker:getWorkerNo():get_s64()
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
    if true == ToClient_isWaitWorker(npcWaitingWorker) and false == workerWrapperLua:getIsAuctionInsert() then
      if nil == self._workerInfoList[workerIndex] then
        self._workerInfoList[workerIndex] = {}
      end
      local checkData = npcWaitingWorker:getStaticSkillCheckData()
      checkData:set(CppEnums.NpcWorkingType.eNpcWorkingType_PlantZone, houseUseType, self._nodeInfo._plantKey:getWaypointKey())
      checkData._diceCheckForceSuccess = true
      local firstWorkerNo = npcWaitingWorker:getWorkerNo()
      local workerNoChar = firstWorkerNo:get_s64()
      local npcWaitingWorkerSS = npcWaitingWorker:getWorkerStaticStatus()
      local workerNo = WorkerNo(workerNoChar)
      local houseUseType = CppEnums.eHouseUseType.Count
      local workSpeed = npcWaitingWorker:getWorkEfficienceWithSkill(checkData, self._nodeInfo._workableType)
      local moveSpeed = npcWaitingWorker:getMoveSpeedWithSkill(checkData) / 100
      local luck = npcWaitingWorker:getLuckWithSkill(checkData)
      local maxPoint = npcWaitingWorkerSS._actionPoint
      local currentPoint = npcWaitingWorker:getActionPoint()
      local workerRegionWrapper = ToClient_getRegionInfoWrapper(npcWaitingWorker)
      local workerGrade = npcWaitingWorkerSS:getCharacterStaticStatus()._gradeType:get()
      local name = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. npcWaitingWorker:getLevel() .. " " .. getWorkerName(npcWaitingWorkerSS)
      local regionName = "(<PAColor0xff868686>" .. workerRegionWrapper:getAreaName() .. "<PAOldColor>)"
      local homeWaypoint = npcWaitingWorker:getHomeWaypoint()
      self._workerInfoList[workerIndex] = {
        _workerNo = workerNo,
        _workerNo_s64 = workerNoChar,
        _workerNoChar = Int64toInt32(workerNoChar),
        _name = name,
        _regionName = regionName,
        _workSpeed = workSpeed / 1000000,
        _moveSpeed = moveSpeed,
        _luck = luck / 10000,
        _maxPoint = maxPoint,
        _currentPoint = currentPoint,
        _homeWaypoint = homeWaypoint,
        _workerGrade = workerGrade
      }
      self._ui._list2_Worker:getElementManager():pushKey(toInt64(0, workerIndex))
      self._ui._list2_Worker:requestUpdateByKey(toInt64(0, workerIndex))
      workerIndex = workerIndex + 1
    end
  end
end
function Window_WorldMap_NodeProductInfo:InitControl()
  self._ui._list2_Worker = UI.getChildControl(self._ui._static_CenterBg, "List2_Worker")
  self._ui._static_InfoBg = UI.getChildControl(self._ui._static_CenterBg, "Static_InfoBg")
  self._ui._static_ProductIcon = UI.getChildControl(self._ui._static_InfoBg, "Static_Icon")
  self._ui._staticText_ProductName = UI.getChildControl(self._ui._static_InfoBg, "StaticText_Desc")
  self._ui._staticText_LeftTime = UI.getChildControl(self._ui._static_InfoBg, "StaticText_LeftTimeValue")
  self._ui._staticText_WorkCount = UI.getChildControl(self._ui._static_InfoBg, "StaticText_WorkCountValue")
  self._ui._staticText_Distance = UI.getChildControl(self._ui._static_InfoBg, "StaticText_DistanceValue")
  self._ui._staticText_WorkSpeed = UI.getChildControl(self._ui._static_InfoBg, "StaticText_WorkSpeedValue")
  self._ui._staticText_MoveSpeed = UI.getChildControl(self._ui._static_InfoBg, "StaticText_MoveSpeedValue")
  self._ui._staticText_Luck = UI.getChildControl(self._ui._static_InfoBg, "StaticText_LuckValue")
end
function Window_WorldMap_NodeProductInfo:InitEvent()
  self._ui._list2_Worker:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_WorldMap_NodeProduct_List2EventControlCreate")
  self._ui._list2_Worker:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
end
function Window_WorldMap_NodeProductInfo:InitRegister()
end
function Window_WorldMap_NodeProductInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_WorldMap_NodeProduct_List2EventControlCreate(list_content, key)
  local self = Window_WorldMap_NodeProductInfo
  local id = Int64toInt32(key)
  local workerInfo = self._workerInfoList[id]
  if nil == workerInfo then
    return
  end
  local button = UI.getChildControl(list_content, "Button_ButtonBg")
  local workerImage = UI.getChildControl(list_content, "Static_WorkerImage")
  local EnergyProgress = UI.getChildControl(list_content, "Progress2_EnergyProgress")
  local workerName = UI.getChildControl(list_content, "StaticText_WorkerTitle")
  local workerTown = UI.getChildControl(list_content, "StaticText_Node")
  local remainTimeProgress = UI.getChildControl(list_content, "Progress2_RemainTimeProgress")
  local remainTimeVal = UI.getChildControl(list_content, "StaticText_RemainTime")
  local workingCount = UI.getChildControl(list_content, "StaticText_WorkingNameCount")
  local checkIcon = UI.getChildControl(list_content, "Static_CheckIcon")
  checkIcon:SetShow(false)
  local workerWrapperLua = getWorkerWrapper(workerInfo._workerNo_s64, true)
  local workerIcon = workerWrapperLua:getWorkerIcon()
  local workerGrade = workerWrapperLua:getGrade()
  local maxPoint = workerInfo._maxPoint
  local currentPoint = workerInfo._currentPoint
  local rate = math.ceil(100 * currentPoint / maxPoint)
  EnergyProgress:SetCurrentProgressRate(rate)
  EnergyProgress:SetProgressRate(rate)
  local workerLev = workerWrapperLua:getLevel()
  workerName:SetFontColor(ConvertFromGradeToColor(workerGrade))
  workerName:SetText(workerInfo._name)
  button:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_NodeProduct_SelectWorker(" .. id .. ")")
  workerImage:ChangeTextureInfoName(workerIcon)
  workerTown:SetText(workerInfo._regionName)
end
function PaGlobalFunc_WorldMap_NodeProduct_SelectWorker(id)
  local self = Window_WorldMap_NodeProductInfo
  local workerInfo = self._workerInfoList[id]
  local nodeInfo = self._nodeInfo
  local name = nodeInfo._result_Name
  local icon = nodeInfo._result_Icon
  local workVolume = nodeInfo._workVolum
  self._ui._static_ProductIcon:ChangeTextureInfoName(icon)
  self._ui._staticText_ProductName:SetText(name)
  Panel_Worldmap_NodeProduct:registerPadEvent(__eConsoleUIPadEvent_Up_X, "")
  if nil ~= workerInfo then
    local distance = ToClient_getCalculateMoveDistance(workerInfo._workerNo, nodeInfo._position) / 100
    local workSpeed = workerInfo._workSpeed
    local moveSpeed = workerInfo._moveSpeed
    local luck = workerInfo._luck
    local workBaseTime = ToClient_getNpcWorkingBaseTime() / 1000
    local totalWorkTime = math.ceil(workVolume / math.floor(workSpeed)) * workBaseTime + distance / moveSpeed * 2
    self._ui._staticText_LeftTime:SetText(Util.Time.timeFormatting(math.floor(totalWorkTime)))
    self._ui._staticText_WorkCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_DEFAULT", "getWorkingCount", nodeInfo._workingCount))
    self._ui._staticText_Distance:SetText(string.format("%.0f", distance))
    self._ui._staticText_WorkSpeed:SetText(string.format("%.2f", workSpeed))
    self._ui._staticText_MoveSpeed:SetText(string.format("%.2f", moveSpeed))
    self._ui._staticText_Luck:SetText(string.format("%.2f", luck))
    Panel_Worldmap_NodeProduct:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_WorldMap_NodeProduct_DoWork(" .. id .. ")")
  else
    self._ui._staticText_LeftTime:SetText("--")
    self._ui._staticText_WorkCount:SetText("--")
    self._ui._staticText_Distance:SetText("--")
    self._ui._staticText_WorkSpeed:SetText("--")
    self._ui._staticText_MoveSpeed:SetText("--")
    self._ui._staticText_Luck:SetText("--")
  end
end
function PaGlobalFunc_WorldMap_NodeProduct_DoWork(id)
  local self = Window_WorldMap_NodeProductInfo
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return
  end
  local workerInfo = self._workerInfoList[id]
  if nil == workerInfo then
    return
  end
  local workingCount = self._nodeInfo._workingCount
  ToClient_requestStartPlantWorkingToNpcWorker(workerInfo._workerNo, self._nodeInfo._plantKey, self._nodeInfo._workKey, workingCount)
  PaGlobal_TutorialManager:handleClickPlantdoWork(self._nodeInfo._plantKey, self._nodeInfo._workingCount)
end
function PaGlobalFunc_WorldMap_NodeProduct_GetShow()
  return Panel_Worldmap_NodeProduct:GetShow()
end
function PaGlobalFunc_WorldMap_NodeProduct_SetShow(isShow, isAni)
  Panel_Worldmap_NodeProduct:SetShow(isShow, isAni)
end
function PaGlobalFunc_WorldMap_NodeProduct_Open(explorationNodeInClient)
  local self = Window_WorldMap_NodeProductInfo
  if true == PaGlobalFunc_WorldMap_NodeProduct_GetShow() then
    return
  end
  self._currentNodeInfo = explorationNodeInClient
  self:SetNodeData(explorationNodeInClient)
  self:SetWorkerData()
  PaGlobalFunc_WorldMap_NodeProduct_SelectWorker(0)
  PaGlobalFunc_WorldMap_RingMenu_Close()
  WorldMapPopupManager:increaseLayer(false)
  WorldMapPopupManager:push(Panel_Worldmap_NodeProduct, true, nil, PaGlobalFunc_WorldMap_NodeProduct_Close)
  PaGlobalFunc_WorldMap_NodeProduct_SetShow(true, false)
end
function PaGlobalFunc_WorldMap_NodeProduct_Close()
  local self = Window_WorldMap_NodeProductInfo
  if false == PaGlobalFunc_WorldMap_NodeProduct_GetShow() then
    return
  end
  PaGlobalFunc_WorldMap_RingMenu_Open()
  PaGlobalFunc_WorldMap_NodeProduct_SetShow(false, false)
end
function PaGlobalFunc_FromClient_WorldMap_NodeProduct_luaLoadComplete()
  local self = Window_WorldMap_NodeProductInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_NodeProduct_luaLoadComplete")
