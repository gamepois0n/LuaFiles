-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap\worldminimap.luac 

-- params : ...
-- function num : 0
PaGlobal_WorldMiniMap = {
_ui = {}
, _panelSizeScale = false, _isRotate = false, _nodeWarRegionName = nil, _initialize = false}
-- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldMiniMap.InitWorldMiniMap = function(self)
  -- function num : 0_0
  if ToClient_IsDevelopment() then
    ToClient_initializeWorldMiniMap()
  else
    return 
  end
  if Panel_WorldMiniMap ~= nil then
    Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
    Panel_WorldMiniMap:SetPosY(30)
    Panel_WorldMiniMap:SetShow(false)
  end
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).regionName = (UI.getChildControl)(Panel_WorldMiniMap, "StaticText_RegionName")
  ;
  ((self._ui).regionName):SetShow(true)
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).regionNodeName = (UI.getChildControl)(Panel_WorldMiniMap, "StaticText_RegionNodeName")
  ;
  ((self._ui).regionNodeName):SetShow(true)
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).regionWarName = (UI.getChildControl)(Panel_WorldMiniMap, "StaticText_RegionWarName")
  ;
  ((self._ui).regionWarName):SetShow(true)
  PaGlobal_WorldMiniMap:setPositionRegionNameList()
  -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_changeScale = (UI.getChildControl)(Panel_WorldMiniMap, "Button_changeScale")
  ;
  ((self._ui).btn_changeScale):SetShow(true)
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_changeRadar = (UI.getChildControl)(Panel_WorldMiniMap, "Button_changeRadar")
  ;
  ((self._ui).btn_changeRadar):SetShow(true)
  ;
  ((self._ui).btn_changeScale):addInputEvent("Mouse_LUp", "PaGlobal_WorldMiniMap:changePanelSize()")
  ;
  ((self._ui).btn_changeRadar):addInputEvent("Mouse_LUp", "PaGlobal_changeRadarUI()")
  -- DECOMPILER ERROR at PC110: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_selfPlayerArrow = (UI.getChildControl)(Panel_WorldMiniMap, "Static_SelfPlayerArrow")
  ;
  ((self._ui).static_selfPlayerArrow):SetShow(true)
  ;
  ((self._ui).static_selfPlayerArrow):SetSize(30, 26)
  ;
  ((self._ui).static_selfPlayerArrow):SetPosX()
  ;
  ((self._ui).static_selfPlayerArrow):ComputePos()
  GLOBAL_CHECK_WORLDMINIMAP = false
  if ToClient_isWorldMiniMapUse() then
    PaGlobal_changeRadarUI()
  else
    GLOBAL_CHECK_WORLDMINIMAP = false
  end
  Panel_WorldMiniMap:RegisterUpdateFunc("Panel_WorldMiniMap_UpdatePerFrame")
  registerEvent("selfPlayer_regionChanged", "worldMiniMap_updateRegion")
  registerEvent("FromClint_EventChangedExplorationNode", "worldMiniMap_NodeLevelRegionNameShow")
  registerEvent("FromClient_RClickedWorldMiniMap", "FromClient_RClickedWorldMiniMap")
  registerEvent("FromClient_ChangeRadarRotateMode", "FromClient_SetRotateMode")
  -- DECOMPILER ERROR at PC162: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_WorldMiniMap._initialize = true
end

PaGlobal_changeRadarUI = function()
  -- function num : 0_1
  if PaGlobal_WorldMiniMap._initialize == true then
    ToClient_changeRadar()
  end
  if ToClient_getRadarType() == true then
    GLOBAL_CHECK_WORLDMINIMAP = true
    FGlobal_Panel_Radar_Show(false)
    Panel_WorldMiniMap:SetShow(true)
    ToClient_setRadorUIPanel(Panel_WorldMiniMap)
    ToClient_setRadorUIViewDistanceRate(7225)
    ToCleint_InitializeRadarActorPool(1000)
    ToClient_updateCameraWorldMiniMap()
    setChangeUiSettingRadarUI(Panel_WorldMiniMap)
  else
    GLOBAL_CHECK_WORLDMINIMAP = false
    Panel_WorldMiniMap:SetShow(false)
    FGlobal_Panel_Radar_Show(true)
    ToClient_setRadorUIPanel(Panel_Radar)
    ToClient_setRadorUIViewDistanceRate(7225)
    ToCleint_InitializeRadarActorPool(1000)
    setChangeUiSettingRadarUI(Panel_Radar)
  end
  local self = PaGlobal_WorldMiniMap
  self._panelSizeScale = true
  self:changePanelSize()
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldMiniMap.changePanelSize = function(self)
  -- function num : 0_2
  local miniMap = ToClient_getWorldMiniMapPanel()
  if self._panelSizeScale == true then
    miniMap:SetSize(300, 260)
    Panel_WorldMiniMap:SetSize(300, 260)
    Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
  else
    miniMap:SetSize(500, 460)
    Panel_WorldMiniMap:SetSize(500, 460)
    Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
  end
  ;
  ((self._ui).btn_changeScale):ComputePos()
  ;
  ((self._ui).static_selfPlayerArrow):ComputePos()
  PaGlobal_WorldMiniMap:setPositionRegionNameList()
  self._panelSizeScale = not self._panelSizeScale
end

PaGlobal_WorldMiniMap_luaLoadComplete = function()
  -- function num : 0_3
  local self = PaGlobal_WorldMiniMap
  if ToClient_IsDevelopment() then
    PaGlobal_WorldMiniMap:InitWorldMiniMap()
  else
    self._initialize = false
  end
  if Panel_WorldMiniMap ~= nil then
    Panel_WorldMiniMap:SetShow(true)
  end
end

worldMiniMap_updateRegion = function(regionData)
  -- function num : 0_4
  local self = PaGlobal_WorldMiniMap
  ;
  ((self._ui).regionName):SetAutoResize(true)
  ;
  ((self._ui).regionName):SetNotAbleMasking(true)
  local isArenaZone = (regionData:get()):isArenaZone()
  local isSafetyZone = (regionData:get()):isSafeZone()
  ;
  ((self._ui).regionName):SetFontColor((Defines.Color).C_FFEFEFEF)
  ;
  ((self._ui).regionName):useGlowFont(false)
  ;
  ((self._ui).regionNodeName):SetFontColor((Defines.Color).C_FFEFEFEF)
  ;
  ((self._ui).regionNodeName):useGlowFont(false)
  ;
  ((self._ui).regionWarName):SetFontColor((Defines.Color).C_FFEFEFEF)
  ;
  ((self._ui).regionWarName):useGlowFont(false)
  if isSafetyZone then
    ((self._ui).regionName):SetFontColor(4292276981)
    ;
    ((self._ui).regionName):useGlowFont(true, "BaseFont_12_Glow", 4281961144)
    ;
    ((self._ui).regionNodeName):SetFontColor(4292276981)
    ;
    ((self._ui).regionNodeName):useGlowFont(true, "BaseFont_8_Glow", 4281961144)
    ;
    ((self._ui).regionWarName):SetFontColor(4292276981)
    ;
    ((self._ui).regionWarName):useGlowFont(true, "BaseFont_8_Glow", 4281961144)
  else
    if isArenaZone then
      ((self._ui).regionName):SetFontColor(4294495693)
      ;
      ((self._ui).regionName):useGlowFont(true, "BaseFont_12_Glow", 4286580487)
      ;
      ((self._ui).regionNodeName):SetFontColor(4294495693)
      ;
      ((self._ui).regionNodeName):useGlowFont(true, "BaseFont_8_Glow", 4286580487)
      ;
      ((self._ui).regionWarName):SetFontColor(4294495693)
      ;
      ((self._ui).regionWarName):useGlowFont(true, "BaseFont_8_Glow", 4286580487)
    else
      ;
      ((self._ui).regionName):SetFontColor(4294495693)
      ;
      ((self._ui).regionName):useGlowFont(true, "BaseFont_12_Glow", 4286580487)
      ;
      ((self._ui).regionNodeName):SetFontColor(4294495693)
      ;
      ((self._ui).regionNodeName):useGlowFont(true, "BaseFont_8_Glow", 4286580487)
      ;
      ((self._ui).regionWarName):SetFontColor(4294495693)
      ;
      ((self._ui).regionWarName):useGlowFont(true, "BaseFont_8_Glow", 4286580487)
    end
  end
  ;
  ((self._ui).regionName):SetText(regionData:getAreaName())
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayerPos = selfPlayerWrapper:get3DPos()
  local linkSiegeWrapper = ToClient_getInstallableVillageSiegeRegionInfoWrapper(selfPlayerPos)
  self._nodeWarRegionName = ""
  if linkSiegeWrapper ~= nil then
    local villageWarZone = (linkSiegeWrapper:get()):isVillageWarZone()
    if villageWarZone == true then
      self._nodeWarRegionName = linkSiegeWrapper:getvillageSiegeName()
    end
    ;
    ((self._ui).regionName):SetText(regionData:getAreaName())
  end
end

worldMiniMap_NodeLevelRegionNameShow = function(wayPointKey)
  -- function num : 0_5
  local self = PaGlobal_WorldMiniMap
  local nodeName = ToClient_GetNodeNameByWaypointKey(wayPointKey)
  if nodeName == "" or nodeName == nil then
    ((self._ui).regionNodeName):SetShow(false)
  else
    ;
    ((self._ui).regionNodeName):SetShow(true)
    ;
    ((self._ui).regionNodeName):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RADER_REGIONNODENAME", "getName", nodeName))
    ;
    ((self._ui).regionNodeName):SetSize(((self._ui).regionNodeName):GetTextSizeX(), ((self._ui).regionNodeName):GetSizeY())
    ;
    ((self._ui).regionNodeName):SetPosX(Panel_WorldMiniMap:GetSizeX() - ((self._ui).regionNodeName):GetSizeX())
    ;
    ((self._ui).regionNodeName):SetPosY(Panel_WorldMiniMap:GetSizeY() - ((self._ui).regionNodeName):GetSizeY())
    ;
    ((self._ui).regionNodeName):ComputePos()
  end
  if self._nodeWarRegionName == "" or self._nodeWarRegionName == nil then
    ((self._ui).regionWarName):SetShow(false)
  else
    ;
    ((self._ui).regionWarName):SetShow(true)
    ;
    ((self._ui).regionWarName):SetText(self._nodeWarRegionName .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_VILLAGEWARABLE_NAME"))
    ;
    ((self._ui).regionWarName):SetSize(((self._ui).regionWarName):GetTextSizeX(), ((self._ui).regionWarName):GetSizeY())
    ;
    ((self._ui).regionWarName):SetPosX(Panel_WorldMiniMap:GetSizeX() - ((self._ui).regionWarName):GetSizeX())
    ;
    ((self._ui).regionWarName):SetPosY(Panel_WorldMiniMap:GetSizeY() - ((self._ui).regionWarName):GetSizeY())
    ;
    ((self._ui).regionWarName):ComputePos()
  end
end

-- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldMiniMap.setPositionRegionNameList = function(self)
  -- function num : 0_6
  ((self._ui).regionName):SetPosX(5)
  ;
  ((self._ui).regionName):SetPosY(5)
  ;
  ((self._ui).regionName):SetSize(((self._ui).regionName):GetTextSizeX() + 40, ((self._ui).regionName):GetSizeY())
  ;
  ((self._ui).regionName):ComputePos()
  ;
  ((self._ui).regionNodeName):SetPosX(Panel_WorldMiniMap:GetSizeX() - ((self._ui).regionNodeName):GetSizeX())
  ;
  ((self._ui).regionNodeName):SetPosY(Panel_WorldMiniMap:GetSizeY() - ((self._ui).regionNodeName):GetSizeY())
  ;
  ((self._ui).regionNodeName):ComputePos()
  ;
  ((self._ui).regionWarName):SetPosX(Panel_WorldMiniMap:GetSizeX() - ((self._ui).regionWarName):GetSizeX())
  ;
  ((self._ui).regionWarName):SetPosY(Panel_WorldMiniMap:GetSizeY() - ((self._ui).regionWarName):GetSizeY())
  ;
  ((self._ui).regionWarName):ComputePos()
end

FromClient_SetRotateMode = function(isRotate)
  -- function num : 0_7
  local self = PaGlobal_WorldMiniMap
  local camRot = getCameraRotation()
  local rot = 0
  if isRotate == false then
    rot = 0
  else
    rot = math.pi
  end
  self._isRotate = isRotate
  Panel_WorldMiniMap:SetParentRotCalc(isRotate)
  ;
  ((self._ui).static_selfPlayerArrow):SetRotate(rot)
end

Panel_WorldMiniMap_UpdatePerFrame = function(deltaTime)
  -- function num : 0_8
  local self = PaGlobal_WorldMiniMap
  if self._isRotate == false then
    ((self._ui).static_selfPlayerArrow):SetRotate(getCameraRotation() + math.pi)
  end
end

FromClient_RClickedWorldMiniMap = function(position, clickActor)
  -- function num : 0_9
  local self = PaGlobal_WorldMiniMap
  if ToClient_IsShowNaviGuideGroup(0) then
    ToClient_DeleteNaviGuideByGroup(0)
  else
    if clickActor == true then
      FromClient_RClickWorldmapPanel(position, true, false)
    else
      if ToClient_GetMyTeamNoLocalWar() ~= 0 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_LOCALWAR_CANTNAVI_ACK"))
        return 
      end
      if ((getSelfPlayer()):get()):getLevel() < 11 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TUTORIAL_PROGRSS_ACK"))
        FGlobal_QuestWidget_UpdateList()
        if not isQuest160524_chk() then
          updateQuestWindowList(FGlobal_QuestWindowGetStartPosition())
        end
        return 
      end
      ToClient_WorldMapNaviStart(position, NavigationGuideParam(), false, true)
    end
  end
end

registerEvent("FromClient_luaLoadComplete", "PaGlobal_WorldMiniMap_luaLoadComplete")

