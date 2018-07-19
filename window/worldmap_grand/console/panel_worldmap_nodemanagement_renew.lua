local Window_WorldMap_NodeManagementInfo = {
  _ui = {
    _static_TopBg = UI.getChildControl(Panel_Worldmap_NodeManagement, "Static_TopBg"),
    _static_NodeManagementBg = UI.getChildControl(Panel_Worldmap_NodeManagement, "Static_NodeManagementBg"),
    _static_NodeInvestmentBg = UI.getChildControl(Panel_Worldmap_NodeManagement, "Static_NodeInvestmentBg"),
    _static_SubNodeBg = UI.getChildControl(Panel_Worldmap_NodeManagement, "Static_SubNodeBg")
  },
  _subNodeIconTexture = "renewal/ui_icon/console_icon_worldmap_00.dds",
  _subNodeIconUV = {
    [4] = {
      _x1 = 1,
      _y1 = 457,
      _x2 = 55,
      _y2 = 511
    },
    [__eExplorationNodeType_Collect] = {
      _x1 = 1,
      _y1 = 457,
      _x2 = 55,
      _y2 = 511
    },
    [__eExplorationNodeType_Quarry] = {
      _x1 = 56,
      _y1 = 457,
      _x2 = 110,
      _y2 = 511
    },
    [__eExplorationNodeType_Logging] = {
      _x1 = 111,
      _y1 = 457,
      _x2 = 165,
      _y2 = 511
    },
    [__eExplorationNodeType_FishTrap] = {
      _x1 = 331,
      _y1 = 457,
      _x2 = 385,
      _y2 = 511
    },
    [__eExplorationNodeType_MonopolyFarm] = {
      _x1 = 166,
      _y1 = 457,
      _x2 = 220,
      _y2 = 511
    },
    [__eExplorationNodeType_Craft] = {
      _x1 = 221,
      _y1 = 457,
      _x2 = 275,
      _y2 = 511
    },
    [__eExplorationNodeType_Excavation] = {
      _x1 = 276,
      _y1 = 457,
      _x2 = 330,
      _y2 = 511
    },
    [__eExplorationNodeType_Finance] = {
      _x1 = 386,
      _y1 = 457,
      _x2 = 440,
      _y2 = 511
    }
  },
  _currentNodeData = nil,
  _currentSubNodeIndex = 0,
  _subNodeInfoList = {},
  _deleteNodeKey = nil,
  _currentWorldNode = nil
}
function Window_WorldMap_NodeManagementInfo:SetTopTitle()
  if nil == self._currentNodeData then
    return
  end
  local nodeStaticStatus = self._currentNodeData._nodeSS
  self._ui._staticText_NodeName:SetText(getExploreNodeName(nodeStaticStatus))
  self._ui._staticText_NodeNpcValue:SetText(requestNodeManagerName(self._currentNodeData._wayPointKey))
end
function Window_WorldMap_NodeManagementInfo:SetContribute()
  if nil == self._currentNodeData then
    return
  end
  local nodeKey = self._currentNodeData._wayPointKey
  local nodeStaticStatus = self._currentNodeData._nodeSS
  local isMaxLevel = self._currentNodeData._isMaxLevel
  local needPoint = nodeStaticStatus._needPoint
  self._ui._button_Contribute:addInputEvent("Mouse_LUp", "")
  self._ui._button_ContributeValue:SetText(needPoint)
  if true == isExploreUpgradable(nodeKey) then
    if isMaxLevel == false then
      self._ui._button_Contribute:SetMonoTone(false)
      self._ui._button_Contribute:SetIgnore(false)
      self._ui._button_Contribute:SetText("Invest")
      self._ui._button_Contribute:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_NodeManagement_NodeUpgradeClick(" .. tostring(nodeKey) .. ")")
    elseif true == isWithdrawablePlant(nodeKey) then
      self._ui._button_Contribute:SetMonoTone(false)
      self._ui._button_Contribute:SetIgnore(false)
      self._ui._button_Contribute:SetText("Take")
      self._ui._button_ContributeValue:SetText(needPoint)
      self._ui._button_Contribute:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_NodeManagement_TakeContribute( " .. tostring(nodeKey) .. ")")
    else
      self._ui._button_Contribute:SetMonoTone(true)
      self._ui._button_Contribute:SetIgnore(true)
      self._ui._button_Contribute:SetText("Take")
      self._ui._button_ContributeValue:SetText(needPoint)
      self._ui._button_Contribute:addInputEvent("Mouse_LUp", "")
    end
  else
    self._ui._button_Contribute:SetMonoTone(false)
    self._ui._button_Contribute:SetIgnore(false)
    self._ui._button_Contribute:SetText("Find NearNode")
    self._ui._button_Contribute:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_NodeManagement_NearNodeClick(" .. tostring(nodeKey) .. ")")
  end
end
function Window_WorldMap_NodeManagementInfo:SetEnergyInvest()
  if nil == self._currentNodeData then
    return
  end
  local nodeKey = self._currentNodeData._wayPointKey
  local isMaxLevel = self._currentNodeData._isMaxLevel
  if true == isExploreUpgradable(nodeKey) then
    if isMaxLevel == false then
      self._ui._button_EnergyInvest:SetMonoTone(true)
      self._ui._button_EnergyInvest:SetIgnore(true)
      self._ui._button_EnergyInvest:addInputEvent("Mouse_LUp", "")
    else
      self._ui._button_EnergyInvest:SetMonoTone(false)
      self._ui._button_EnergyInvest:SetIgnore(false)
      self._ui._button_EnergyInvest:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_NodeManagement_InvestNodeLevelNumpad(" .. tostring(nodeKey) .. ")")
    end
  else
    self._ui._button_EnergyInvest:SetMonoTone(true)
    self._ui._button_EnergyInvest:SetIgnore(true)
    self._ui._button_EnergyInvest:addInputEvent("Mouse_LUp", "")
  end
end
function Window_WorldMap_NodeManagementInfo:Update()
  self:SetTopTitle()
  self:SetContribute()
  self:SetEnergyInvest()
end
function Window_WorldMap_NodeManagementInfo:CreateNodeIcon(control, nodeType)
  local iconUV = self._subNodeIconUV[nodeType]
  if nil == iconUV then
    return
  end
  control:ChangeTextureInfoName(self._subNodeIconTexture)
  control:getBaseTexture():setUV(setTextureUV_Func(control, iconUV._x1, iconUV._y1, iconUV._x2, iconUV._y2))
  control:setRenderTexture(control:getBaseTexture())
end
function Window_WorldMap_NodeManagementInfo:SetNodeData(nodeData)
  self._ui._list2_SubNode:getElementManager():clearKey()
  self._currentSubNodeIndex = 0
  self._subNodeInfoList = {}
  self._currentNodeData = {}
  self._currentNodeData._nodeSS = nodeData:getStaticStatus()
  self._currentNodeData._plantKey = nodeData:getPlantKey()
  self._currentNodeData._wayPointKey = self._currentNodeData._plantKey:getWaypointKey()
  self._currentNodeData._territoryKeyRaw = getNodeTerritoryKeyRaw(nodeData:getStaticStatus())
  self._currentNodeData._territoryInfo = getNodeTerritoryInfo(nodeData:getStaticStatus())
  self._currentNodeData._isMaxLevel = nodeData:isMaxLevel()
  ToClient_FindSubNode(nodeData:getPlantKey())
end
function Window_WorldMap_NodeManagementInfo:InitControl()
  self._ui._staticText_NodeName = UI.getChildControl(self._ui._static_TopBg, "StaticText_NodeName")
  self._ui._staticText_NodeNpcTitle = UI.getChildControl(self._ui._static_TopBg, "StaticText_NodeNpcTitle")
  self._ui._staticText_NodeNpcTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_MANAGER"))
  self._ui._staticText_NodeNpcValue = UI.getChildControl(self._ui._static_TopBg, "StaticText_NodeNpcValue")
  self._ui._staticText_ContributeTitle = UI.getChildControl(self._ui._static_NodeManagementBg, "StaticText_Title")
  self._ui._staticText_ContributeDesc = UI.getChildControl(self._ui._static_NodeManagementBg, "StaticText_Desc")
  self._ui._button_Contribute = UI.getChildControl(self._ui._static_NodeManagementBg, "Button_Contribute")
  self._ui._button_ContributeValue = UI.getChildControl(self._ui._button_Contribute, "StaticText_ContributePoint")
  self._ui._staticText_NodeTitle = UI.getChildControl(self._ui._static_NodeInvestmentBg, "StaticText_Title")
  self._ui._staticText_NodeTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_2"))
  self._ui._staticText_NodeDesc = UI.getChildControl(self._ui._static_NodeInvestmentBg, "StaticText_Desc")
  self._ui._button_EnergyInvest = UI.getChildControl(self._ui._static_NodeInvestmentBg, "Button_Invest")
  self._ui._staticText_SubNodeTitle = UI.getChildControl(self._ui._static_SubNodeBg, "StaticText_Title")
  self._ui._staticText_SubNodeDesc = UI.getChildControl(self._ui._static_SubNodeBg, "StaticText_Desc")
  self._ui._list2_SubNode = UI.getChildControl(self._ui._static_SubNodeBg, "List2_SubNode")
end
function Window_WorldMap_NodeManagementInfo:InitEvent()
  self._ui._list2_SubNode:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_WorldMap_NodeManagement_List2EventControlCreate")
  self._ui._list2_SubNode:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
end
function Window_WorldMap_NodeManagementInfo:InitRegister()
  registerEvent("FromClient_FindSubNode", "PaGlobalFunc_FromCLient_WorldMap_NodeManagement_FindSubNode")
  registerEvent("FromClint_EventChangedExplorationNode", "PaGlobalFunc_FromClient_WorldMap_NodeManagement_ChangedExplorationNode")
  registerEvent("FromClint_EventUpdateExplorationNode", "PaGlobalFunc_FromClient_WorldMap_NodeManagement_UpdateExplorationNode")
end
function Window_WorldMap_NodeManagementInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_FromClient_WorldMap_NodeManagement_ChangedExplorationNode()
  local self = Window_WorldMap_NodeManagementInfo
  if nil ~= self._deleteNodeKey then
    ToClient_WorldMapRequestWithdrawPlant(self._deleteNodeKey)
    self._deleteNodeKey = nil
  end
  local nodeData = self._currentWorldNode
  if nil == nodeData then
    return
  end
  self:SetNodeData(nodeData)
  self:Update()
end
function PaGlobalFunc_FromClient_WorldMap_NodeManagement_UpdateExplorationNode()
  local self = Window_WorldMap_NodeManagementInfo
  if nil ~= self._deleteNodeKey then
    ToClient_WorldMapRequestWithdrawPlant(self._deleteNodeKey)
    self._deleteNodeKey = nil
  end
  local nodeData = self._currentWorldNode
  if nil == nodeData then
    return
  end
  self:SetNodeData(nodeData)
  self:Update()
end
function PaGlobalFunc_WorldMap_NodeManagement_List2EventControlCreate(list_content, key)
  local self = Window_WorldMap_NodeManagementInfo
  local id = Int64toInt32(key)
  local nodeInfo = self._subNodeInfoList[id]
  if nil == nodeInfo then
    _PA_LOG("\236\157\180\237\152\184\236\132\156", "\235\133\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\157\180\236\131\129\237\149\169\235\139\136\235\139\164.")
    return
  end
  local bg = UI.getChildControl(list_content, "Static_Bg")
  bg:SetPosX(35)
  local nodeName = UI.getChildControl(list_content, "StaticText_SubNodeType")
  local nodeIcon = UI.getChildControl(list_content, "Static_NodeTypeIcon")
  local button = UI.getChildControl(list_content, "Button_Invest")
  local workerButton = UI.getChildControl(list_content, "Button_Worker")
  local energyValue = UI.getChildControl(button, "StaticText_ContributePoint")
  nodeName:SetText(nodeInfo._name)
  energyValue:SetText(nodeInfo._needPoint)
  local nodeKey = nodeInfo._wayPointKey
  local nodeStaticStatus = nodeInfo._nodeSS
  local isMaxLevel = nodeInfo._isMaxLevel
  local needPoint = nodeStaticStatus._needPoint
  local parentNodeKey = self._currentNodeData._wayPointKey
  local parentIsMaxLevel = self._currentNodeData._isMaxLevel
  if true == isExploreUpgradable(parentNodeKey) then
    if false == parentIsMaxLevel then
      button:SetMonoTone(true)
      button:SetIgnore(true)
      button:SetText("Invest")
      button:addInputEvent("Mouse_LUp", "")
    elseif false == isMaxLevel then
      button:SetMonoTone(false)
      button:SetIgnore(false)
      button:SetText("Invest")
      button:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_NodeManagement_NodeUpgradeClick(" .. tostring(nodeKey) .. ")")
    elseif true == isWithdrawablePlant(nodeKey) then
      button:SetMonoTone(false)
      button:SetIgnore(false)
      button:SetText("Take")
      button:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_NodeManagement_TakeContribute( " .. tostring(nodeKey) .. ")")
    else
      button:SetMonoTone(true)
      button:SetIgnore(true)
      button:SetText("Take")
      button:addInputEvent("Mouse_LUp", "")
    end
  else
    button:SetMonoTone(true)
    button:SetIgnore(true)
    button:SetText("Invest")
    button:addInputEvent("Mouse_LUp", "")
  end
  workerButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_NodeManagement_WorkerManager(" .. id .. ")")
  self:CreateNodeIcon(nodeIcon, nodeInfo._nodeType)
end
function PaGlobalFunc_WorldMap_NodeManagement_InvestNodeLevelNumpad(wayPointKey)
  if false == ToClient_WorldMapIsShow() then
    return
  end
  local player = getSelfPlayer()
  if nil == player then
    return
  end
  local wp = player:getWp()
  local maxWp = player:getMaxWp()
  local s64_maxNumber = toInt64(0, 0)
  local wpCalc = math.floor(wp / 10)
  if maxWp > wpCalc then
    s64_maxNumber = tonumber64(wpCalc)
  end
  Panel_NumberPad_Show(true, s64_maxNumber, wayPointKey, PaGlobalFunc_WorldMap_NodeManagement_InvestNodeLevelExecute)
end
function PaGlobalFunc_WorldMap_NodeManagement_InvestNodeLevelExecute(inputNumber, param)
  local self = Window_WorldMap_NodeManagementInfo
  local wpCount = Int64toInt32(inputNumber) * 10
  ToClient_RequestIncreaseExperienceNode(param, wpCount)
end
function PaGlobalFunc_WorldMap_NodeManagement_WorkerManager(id)
  local self = Window_WorldMap_NodeManagementInfo
  local nodeInfo = self._subNodeInfoList[id]
  if nil == nodeInfo then
    _PA_LOG("\236\157\180\237\152\184\236\132\156", "\235\133\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\157\180\236\131\129\237\149\169\235\139\136\235\139\164.")
    return
  end
  PaGlobalFunc_WorldMap_NodeProduct_Open(nodeInfo._explorationNodeInClient)
end
function PaGlobalFunc_WorldMap_NodeManagement_TakeContribute(nodeKey)
  local self = Window_WorldMap_NodeManagementInfo
  local function NodeWithdrawExecute()
    ToClient_WorldMapRequestWithdrawPlant(nodeKey)
  end
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_WORLDMAP_NODE_WITHDRAWCONFIRM")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
    content = messageBoxMemo,
    functionYes = NodeWithdrawExecute,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData, "top")
end
function PaGlobalFunc_WorldMap_NodeManagement_TakeAll(nodeData)
  local self = Window_WorldMap_NodeManagementInfo
  self:SetNodeData(nodeData)
  local function NodeWithdrawExecute()
    local parentTakeAble = true
    for index = 0, self._currentSubNodeIndex - 1 do
      if true == isWithdrawablePlant(self._subNodeInfoList[index]._wayPointKey) then
        ToClient_WorldMapRequestWithdrawPlant(self._subNodeInfoList[index]._wayPointKey)
        parentTakeAble = false
      end
    end
    self._deleteNodeKey = self._currentNodeData._wayPointKey
    if true == parentTakeAble then
      ToClient_WorldMapRequestWithdrawPlant(self._deleteNodeKey)
      self._deleteNodeKey = nil
    end
  end
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_WORLDMAP_NODE_WITHDRAWCONFIRM")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
    content = messageBoxMemo,
    functionYes = NodeWithdrawExecute,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData, "top")
end
function PaGlobalFunc_WorldMap_NodeManagement_NearNodeClick(nodeKey)
  ToClient_DeleteNaviGuideByGroup(0)
  ToClient_WorldMapFindNearNode(nodeKey, NavigationGuideParam())
  audioPostEvent_SystemUi(0, 14)
end
function PaGlobalFunc_WorldMap_NodeManagement_NodeUpgradeClick(nodeKey)
  local self = Window_WorldMap_NodeManagementInfo
  ToClient_WorldMapRequestUpgradeExplorationNode(nodeKey)
end
function PaGlobalFunc_FromCLient_WorldMap_NodeManagement_FindSubNode(explorationNodeInClient)
  local self = Window_WorldMap_NodeManagementInfo
  self._subNodeInfoList[self._currentSubNodeIndex] = {}
  self._subNodeInfoList[self._currentSubNodeIndex]._explorationNodeInClient = explorationNodeInClient
  self._subNodeInfoList[self._currentSubNodeIndex]._nodeSS = explorationNodeInClient:getStaticStatus()
  self._subNodeInfoList[self._currentSubNodeIndex]._plantKey = explorationNodeInClient:getPlantKey()
  self._subNodeInfoList[self._currentSubNodeIndex]._wayPointKey = explorationNodeInClient:getPlantKey():getWaypointKey()
  self._subNodeInfoList[self._currentSubNodeIndex]._name = getExploreNodeName(explorationNodeInClient:getStaticStatus())
  self._subNodeInfoList[self._currentSubNodeIndex]._needPoint = explorationNodeInClient:getStaticStatus()._needPoint
  self._subNodeInfoList[self._currentSubNodeIndex]._isMaxLevel = explorationNodeInClient:isMaxLevel()
  self._subNodeInfoList[self._currentSubNodeIndex]._nodeType = explorationNodeInClient:getStaticStatus()._nodeType
  self._ui._list2_SubNode:getElementManager():pushKey(toInt64(0, self._currentSubNodeIndex))
  self._ui._list2_SubNode:requestUpdateByKey(toInt64(0, self._currentSubNodeIndex))
  self._currentSubNodeIndex = self._currentSubNodeIndex + 1
end
function PaGlobalFunc_WorldMap_NodeManagement_GetShow()
  return Panel_Worldmap_NodeManagement:GetShow()
end
function PaGlobalFunc_WorldMap_NodeManagement_SetShow(isShow, isAni)
  Panel_Worldmap_NodeManagement:SetShow(isShow, isAni)
end
function PaGlobalFunc_WorldMap_NodeManagement_Open(nodeData)
  local self = Window_WorldMap_NodeManagementInfo
  if true == PaGlobalFunc_WorldMap_NodeManagement_GetShow() then
    return
  end
  if nil == nodeData then
    _PA_ASSERT(false, "WorldMap NodeInfo\236\151\144 nodeData\235\138\148 \237\149\132\236\136\152 \236\158\133\235\139\136\235\139\164.")
    return
  end
  self._currentWorldNode = nodeData
  PaGlobalFunc_WorldMap_NodeManagement_SetShow(true, false)
  PaGlobalFunc_WorldMap_RingMenu_Close()
  self:SetNodeData(nodeData)
  self:Update()
  WorldMapPopupManager:increaseLayer()
  WorldMapPopupManager:push(Panel_Worldmap_NodeManagement, true, nil, PaGlobalFunc_WorldMap_NodeManagement_Close)
end
function PaGlobalFunc_WorldMap_NodeManagement_Close()
  PaGlobalFunc_WorldMap_RingMenu_Open()
  PaGlobalFunc_WorldMap_NodeManagement_SetShow(false, false)
end
function PaGlobalFunc_FromClient_WorldMap_NodeManagement_luaLoadComplete()
  local self = Window_WorldMap_NodeManagementInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_NodeManagement_luaLoadComplete")
