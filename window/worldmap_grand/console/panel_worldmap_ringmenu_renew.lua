local Window_WorldMap_RingMenuInfo = {
  _ui = {
    _static_BlackBg = UI.getChildControl(Panel_Worldmap_RingMenu, "Static_BlackBg"),
    _static_RingMenuBg = UI.getChildControl(Panel_Worldmap_RingMenu, "Static_RingMenuBg"),
    _static_Aim = UI.getChildControl(Panel_Worldmap_RingMenu, "Static_Aim"),
    _static_FocusKeyGuide = UI.getChildControl(Panel_Worldmap_RingMenu, "Static_A_ConsoleUI"),
    _ringMenu = {}
  },
  _config = {
    _enter = 0,
    _bookMark = 1,
    _showInfo = 2,
    _vehiclePos = 3,
    _waypoint = 4,
    _take = 5,
    _invest = 6,
    _makeAndServent = 7,
    _count = 8,
    _centerX,
    _centerY
  },
  _uiTypeConfig = {
    _node = 0,
    _quest = 1,
    _count = 2
  },
  _UVConfig = {
    [0] = {
      x1 = 1,
      y1 = 1,
      x2 = 45,
      y2 = 45
    },
    [1] = {
      x1 = 136,
      y1 = 1,
      x2 = 180,
      y2 = 45
    }
  },
  _isRingMenuOpen = false,
  _currentWorldNode = nil,
  _currentRingMenuIndex = __eRingMenuPosition_Default,
  _isTakeAble = false,
  _prevRightStickValue = {_x = 0, _y = 0},
  _currentHousekey = nil
}
function Window_WorldMap_RingMenuInfo:RingMenuClear()
  self._ui._static_BlackBg:SetShow(false)
  self._ui._static_RingMenuBg:SetShow(false)
  self._ui._static_FocusKeyGuide:SetShow(false)
  self:FocusOut()
  self._isRingMenuOpen = false
  self._currentRingMenuIndex = __eRingMenuPosition_Default
  PaGlobalFunc_WorldMap_RingMenu_SetShowRingMenu(false)
end
function Window_WorldMap_RingMenuInfo:FocusOn(uiType)
  if uiType >= self._uiTypeConfig._count then
    return
  end
  self._ui._static_Aim:SetVertexAniRun("Ani_Scale_Set", true)
  self._ui._static_Aim:SetVertexAniRun("Ani_Move_Pos_Set", true)
  self._ui._static_AimColor:SetVertexAniRun("Ani_Color_Set", true)
  self._ui._static_FocusKeyGuide:ChangeTextureInfoName("renewal/ui_icon/console_xboxkey_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(self._ui._static_FocusKeyGuide, self._UVConfig[uiType].x1, self._UVConfig[uiType].y1, self._UVConfig[uiType].x2, self._UVConfig[uiType].y2)
  self._ui._static_FocusKeyGuide:getBaseTexture():setUV(x1, y1, x2, y2)
  self._ui._static_FocusKeyGuide:setRenderTexture(self._ui._static_FocusKeyGuide:getBaseTexture())
  self._ui._static_FocusKeyGuide:SetShow(true)
end
function Window_WorldMap_RingMenuInfo:FocusOut()
  self._ui._static_FocusKeyGuide:SetShow(false)
  self._ui._static_Aim:SetVertexAniRun("Ani_Scale_Reset", true)
  self._ui._static_Aim:SetVertexAniRun("Ani_Move_Pos_Reset", true)
  self._ui._static_AimColor:SetVertexAniRun("Ani_Color_Reset", true)
end
function Window_WorldMap_RingMenuInfo:ShowNodeInfo()
  local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
  PaGlobalFunc_WorldMap_NodeInfo_Open(nodeInfo)
end
function Window_WorldMap_RingMenuInfo:WorkerManage()
  local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
  PaGlobalFunc_WorldMap_NodeProduct_Open(nodeInfo)
end
function Window_WorldMap_RingMenuInfo:ShowInvest()
  local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
  PaGlobalFunc_WorldMap_NodeManagement_Open(nodeInfo)
end
function Window_WorldMap_RingMenuInfo:TakeAll()
  local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
  if false == self._isTakeAble then
    return
  end
  PaGlobalFunc_WorldMap_NodeManagement_TakeAll(nodeInfo)
end
function Window_WorldMap_RingMenuInfo:SetWayPoint()
  local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
  if nil == nodeInfo then
    return
  end
  local nodeStaticStatus = nodeInfo:getStaticStatus()
  local position = ToClient_getNodeManagerPosition(nodeStaticStatus)
  if 0 == position.x and 0 == position.y and 0 == position.z then
    position = nodeStaticStatus:getPosition()
  end
  FromClient_RClickWorldmapPanel(position, true, false)
end
function PaGlobalFunc_WorldMap_RingMenu_RingMenuSelect(index)
  local self = Window_WorldMap_RingMenuInfo
  local state = self._config
  self:RingMenuClear()
  if state._enter == index then
    local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
    local plantKey = nodeInfo:getPlantKey()
    PaGlobalFunc_WorldMap_TopMenu_SetCurrentNodeInfo(nodeInfo)
    PaGlobalFunc_WorldMap_RightMenu_SetCurrentNodeInfo(nodeInfo)
    ToClient_setTownMode(plantKey)
  elseif state._bookMark == index then
    local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
    local plantKey = nodeInfo:getPlantKey()
    PaGlobalFunc_WorldMap_TopMenu_SetCurrentNodeInfo(nodeInfo)
    PaGlobalFunc_WorldMap_RightMenu_SetCurrentNodeInfo(nodeInfo)
    ToClient_setTownMode(plantKey)
    if 0 == ToClient_getTownReceipeList() then
      return
    end
    PaGlobalFunc_WorldMap_RightMenu_OpenHouseFilter()
    PaGlobalFunc_WorldMap_HouseFilter_SelectHouseFilter(2)
  elseif state._showInfo == index then
    self:ShowNodeInfo()
  elseif state._vehiclePos == index then
    Servant_Navi(0)
  elseif state._waypoint == index then
    self:SetWayPoint()
  elseif state._take == index then
    self:TakeAll()
  elseif state._invest == index then
    self:ShowInvest()
  elseif state._makeAndServent == index then
    self:WorkerManage()
  end
end
function PaGlobalFunc_WorldMap_RingMenu_SetShowRingMenu(isShow)
  local self = Window_WorldMap_RingMenuInfo
  self._ui._static_BlackBg:SetShow(isShow)
  self._ui._static_RingMenuBg:SetShow(isShow)
  ToClient_SetIsIgnoreLStick(isShow)
  self._isRingMenuOpen = isShow
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_LClickedWorldMapNode(explorationNode)
  local self = Window_WorldMap_RingMenuInfo
  self._ui._static_FocusKeyGuide:SetShow(false)
  PaGlobalFunc_WorldMap_RingMenu_SetShowRingMenu(true)
  local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
  local isTown = nodeInfo:getStaticStatus():getRegion():isMainOrMinorTown()
  local isInvest = nodeInfo:isMaxLevel()
  self._isTakeAble = not isTown and isInvest
  self._ui._ringMenu[5]._button:SetMonoTone(not self._isTakeAble)
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_RClickedWorldMapNode(nodeBtn)
  local node = nodeBtn:FromClient_getExplorationNodeInClient()
  if nil == node then
    return
  end
  local nodeStaticStatus = node:getStaticStatus()
  local position = ToClient_getNodeManagerPosition(nodeStaticStatus)
  if 0 == position.x and 0 == position.y and 0 == position.z then
    position = nodeStaticStatus:getPosition()
  end
  FromClient_RClickWorldmapPanel(position, true, false)
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_OnWorldMapHouse(nodeBtn)
  local self = Window_WorldMap_RingMenuInfo
  self._currentHousekey = nodeBtn:FromClient_getStaticStatus():getHouseKey()
  self:FocusOn(0)
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_OutWorldMapHouse(nodeBtn)
  local self = Window_WorldMap_RingMenuInfo
  FGlobal_ClearWorldmapIconTooltip()
  if nil == self._currentHousekey then
    self:FocusOut()
  end
  if nodeBtn:FromClient_getStaticStatus():getHouseKey() == self._currentHousekey then
    self:FocusOut()
    self._currentHousekey = nil
  end
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_LClickedWorldMapHouse(nodeBtn)
  if nil == nodeBtn then
    return
  end
  PaGlobalFunc_WorldMapHouseManager_Open(nodeBtn:FromClient_getStaticStatus())
  FGlobal_ClearWorldmapIconTooltip()
  PaGlobalFunc_WorldMap_BottomMenu_Close()
  PaGlobalFunc_WorldMap_TopMenu_Close()
  PaGlobalFunc_WorldMap_RingMenu_Close()
end
function PaGlobalFunc_FromClient_WorldMpa_RingMenu_OnWorldMapNode(nodeBtn)
  local self = Window_WorldMap_RingMenuInfo
  self._currentWorldNode = nodeBtn
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_OutWorldMapNode(nodeBtn)
  local self = Window_WorldMap_RingMenuInfo
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_FocusUpdate(size, type)
  local self = Window_WorldMap_RingMenuInfo
  if 0 == Int64toInt32(size) then
    self:FocusOut()
  else
    self:FocusOn(Int64toInt32(type))
  end
end
function PaGlobalFunc_WorldMap_RingMenu_SetPadEvent(type, func)
  Panel_Worldmap_RingMenu:registerPadEvent(type, func)
end
function Window_WorldMap_RingMenuInfo:UpdateRingMenu(position)
  if false == self._isTakeAble and 5 == position then
    return
  end
  for index = 0, self._config._count - 1 do
    if nil ~= self._ui._ringMenu[index] then
      self._ui._ringMenu[index]._decs:SetShow(index == position)
    end
  end
  if position == __eRingMenuPosition_Default and __eRingMenuPosition_Default ~= self._currentRingMenuIndex then
    PaGlobalFunc_WorldMap_RingMenu_RingMenuSelect(self._currentRingMenuIndex)
  end
  local RSX = getPadRightStickMoveX()
  local RSY = getPadRightStickMoveY()
  if math.abs(RSX) < math.abs(self._prevRightStickValue._x) and math.abs(RSY) < math.abs(self._prevRightStickValue._y) then
    return
  end
  self._prevRightStickValue._x = RSX
  self._prevRightStickValue._y = RSY
  if self._currentRingMenuIndex ~= __eRingMenuPosition_Default and math.abs(self._currentRingMenuIndex - position) >= 3 and math.abs(self._currentRingMenuIndex - position) <= 6 then
    return
  end
  self._currentRingMenuIndex = position
end
function Window_WorldMap_RingMenuInfo:InitControl()
  for index = 0, self._config._count - 1 do
    self._ui._ringMenu[index] = {}
    self._ui._ringMenu[index]._button = UI.getChildControl(self._ui._static_RingMenuBg, "Button_" .. index)
    self._ui._ringMenu[index]._decs = UI.getChildControl(self._ui._static_RingMenuBg, "StaticText_Desc" .. index)
    self._ui._ringMenu[index]._decs:SetShow(false)
  end
  self._config._centerX = getScreenSizeX() / 2
  self._config._centerY = getScreenSizeY() / 2
  Panel_Worldmap_RingMenu:SetPosX(self._config._centerX - Panel_Worldmap_RingMenu:GetSizeX() / 2)
  Panel_Worldmap_RingMenu:SetPosY(self._config._centerY - Panel_Worldmap_RingMenu:GetSizeY() / 2)
  self._ui._static_AimColor = UI.getChildControl(self._ui._static_Aim, "Static_Focus")
  self._ui._static_AimColor:SetIgnore(true)
  self._ui._static_BlackBg:SetShow(false)
  self._ui._static_RingMenuBg:SetShow(false)
  self._ui._static_FocusKeyGuide:SetShow(false)
end
function Window_WorldMap_RingMenuInfo:InitEvent()
  Panel_Worldmap_RingMenu:RegisterUpdateFunc("PaGlobalFunc_WorldMap_RingMenu_UpdatePerFrame")
end
function Window_WorldMap_RingMenuInfo:InitRegister()
  registerEvent("FromClient_OnWorldMapNode", "PaGlobalFunc_FromClient_WorldMpa_RingMenu_OnWorldMapNode")
  registerEvent("FromClient_OutWorldMapNode", "PaGlobalFunc_FromClient_WorldMap_RingMenu_OutWorldMapNode")
  registerEvent("FromClient_LClickedWorldMapNode", "PaGlobalFunc_FromClient_WorldMap_RingMenu_LClickedWorldMapNode")
  registerEvent("FromClient_RClickedWorldMapNode", "PaGlobalFunc_FromClient_WorldMap_RingMenu_RClickedWorldMapNode")
  registerEvent("FromClient_getCurrentFocusedUiCount", "PaGlobalFunc_FromClient_WorldMap_RingMenu_FocusUpdate")
  registerEvent("FromClient_OnWorldMapHouse", "PaGlobalFunc_FromClient_WorldMap_RingMenu_OnWorldMapHouse")
  registerEvent("FromClient_OutWorldMapHouse", "PaGlobalFunc_FromClient_WorldMap_RingMenu_OutWorldMapHouse")
  registerEvent("FromClient_LClickedWorldMapHouse", "PaGlobalFunc_FromClient_WorldMap_RingMenu_LClickedWorldMapHouse")
  registerEvent("onScreenResize", "PaGlobalFunc_FromClient_WorldMap_RingMenu_ScreenResize")
end
function Window_WorldMap_RingMenuInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_WorldMap_RingMenu_UpdatePerFrame(deltaTime)
  local self = Window_WorldMap_RingMenuInfo
  if PaGlobalFunc_WorldMap_GetIsFadeOut() then
    return
  end
  if true == self._isRingMenuOpen then
    local pos = ToClient_getPressedRStickPosition()
    self:UpdateRingMenu(pos)
  end
  if true == PaGlobalFunc_WorldMap_RingMenu_GetIsRingMenuOpen() then
    ToClient_setMousePosition(0, 0)
  else
    ToClient_setMousePosition(self._config._centerX, self._config._centerY)
  end
end
function PaGlobalFunc_WorldMap_RingMenu_GetIsRingMenuOpen()
  local self = Window_WorldMap_RingMenuInfo
  return self._isRingMenuOpen
end
function PaGlobalFunc_WorldMap_RingMenu_GetShow()
  return Panel_Worldmap_RingMenu:GetShow()
end
function PaGlobalFunc_WorldMap_RingMenu_SetShow(isShow, isAni)
  Panel_Worldmap_RingMenu:SetShow(isShow, isAni)
end
function PaGlobalFunc_WorldMap_RingMenu_Open()
  local self = Window_WorldMap_RingMenuInfo
  if true == PaGlobalFunc_WorldMap_RingMenu_GetShow() then
    return
  end
  PaGlobal_ConsoleWorldMapKeyGuide_SetShow(true)
  self:RingMenuClear()
  PaGlobalFunc_WorldMap_RingMenu_SetShow(true, false)
end
function PaGlobalFunc_WorldMap_RingMenu_Close()
  local self = Window_WorldMap_RingMenuInfo
  if false == PaGlobalFunc_WorldMap_RingMenu_GetShow() then
    return
  end
  PaGlobal_ConsoleWorldMapKeyGuide_SetShow(false)
  self:RingMenuClear()
  ToClient_SetIsIgnoreLStick(true)
  PaGlobalFunc_WorldMap_RingMenu_SetShow(false, false)
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_ScreenResize()
  local self = Window_WorldMap_RingMenuInfo
  self._config._centerX = getScreenSizeX() / 2
  self._config._centerY = getScreenSizeY() / 2
  Panel_Worldmap_RingMenu:SetPosX(self._config._centerX - Panel_Worldmap_RingMenu:GetSizeX() / 2)
  Panel_Worldmap_RingMenu:SetPosY(self._config._centerY - Panel_Worldmap_RingMenu:GetSizeY() / 2)
end
function PaGlobalFunc_FromClient_WorldMap_RingMenu_luaLoadComplete()
  local self = Window_WorldMap_RingMenuInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_RingMenu_luaLoadComplete")
