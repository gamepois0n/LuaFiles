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
  _isRingMenuOpen = false,
  _currentWorldNode = nil,
  _currentRingMenuIndex = __eRingMenuPosition_Default,
  _isTown = false
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
function Window_WorldMap_RingMenuInfo:FocusOn()
  self._ui._static_FocusKeyGuide:SetShow(true)
  self._ui._static_Aim:SetVertexAniRun("Ani_Scale_Set", true)
  self._ui._static_Aim:SetVertexAniRun("Ani_Move_Pos_Set", true)
  self._ui._static_AimColor:SetVertexAniRun("Ani_Color_Set", true)
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
  PaGlobalFunc_WorldMap_RingMenu_Close()
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
  if true == self._isTown then
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
  local nodeInfo = self._currentWorldNode:FromClient_getExplorationNodeInClient()
  local isTown = nodeInfo:getStaticStatus():getRegion():isMainTown()
  self._ui._ringMenu[5]._button:SetMonoTone(isTown)
  self._ui._ringMenu[5]._button:SetIgnore(isTown)
  self._isTown = isTown
  PaGlobalFunc_WorldMap_RingMenu_SetShowRingMenu(true)
end
function PaGlobalFunc_FromClient_WorldMpa_RingMenu_OnWorldMapNode(nodeBtn)
  local self = Window_WorldMap_RingMenuInfo
  self._currentWorldNode = nodeBtn
  self:FocusOn()
end
function PaGlobalFunc_FromClient_WorldMpa_RingMenu_OutWorldMapNode(nodeBtn)
  local self = Window_WorldMap_RingMenuInfo
  self:FocusOut()
end
function PaGlobalFunc_WorldMap_RingMenu_SetPadEvent(type, func)
  Panel_Worldmap_RingMenu:registerPadEvent(type, func)
end
function Window_WorldMap_RingMenuInfo:UpdateRingMenu(position)
  if true == self._isTown and 5 == position then
    return
  end
  for index = 0, self._config._count - 1 do
    if nil ~= self._ui._ringMenu[index] then
      self._ui._ringMenu[index]._decs:SetShow(index == position)
    end
  end
  if self._currentRingMenuIndex ~= __eRingMenuPosition_Default and position == __eRingMenuPosition_Default then
    PaGlobalFunc_WorldMap_RingMenu_RingMenuSelect(self._currentRingMenuIndex)
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
  self._config._centerX = self._ui._static_Aim:GetPosX() + self._ui._static_Aim:GetSizeX() / 2
  self._config._centerY = self._ui._static_Aim:GetPosY() + self._ui._static_Aim:GetSizeY() / 2
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
  registerEvent("FromClient_OutWorldMapNode", "PaGlobalFunc_FromClient_WorldMpa_RingMenu_OutWorldMapNode")
  registerEvent("FromClient_LClickedWorldMapNode", "PaGlobalFunc_FromClient_WorldMap_RingMenu_LClickedWorldMapNode")
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
  ToClient_setMousePosition(self._config._centerX, self._config._centerY)
  if false == PaGlobalFunc_WorldMap_RingMenu_GetShow() then
    ToClient_setMousePosition(0, 0)
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
function PaGlobalFunc_FromClient_WorldMap_RingMenu_luaLoadComplete()
  local self = Window_WorldMap_RingMenuInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_RingMenu_luaLoadComplete")
