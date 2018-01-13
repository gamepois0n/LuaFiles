-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap\worldminimap.luac 

-- params : ...
-- function num : 0
PaGlobal_WorldMiniMap = {_uiPanel = Panel_WorldMiniMap, 
_ui = {}
, _initialize = false}
-- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldMiniMap.InitWorldMiniMap = function(self)
  -- function num : 0_0
  if ToClient_IsDevelopment() then
    ToClient_initializeWorldMiniMap()
  end
  if Panel_WorldMiniMap ~= nil then
    Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
    Panel_WorldMiniMap:SetPosY(30)
    Panel_WorldMiniMap:SetShow(false)
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_WorldMiniMap._initialize = true
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
end

PaGlobal_WorldMiniMap_luaLoadComplete = function()
  -- function num : 0_1
  if Panel_WorldMiniMap ~= nil then
    Panel_WorldMiniMap:SetShow(true)
  end
end

worldMiniMap_updateRegion = function(regionData)
  -- function num : 0_2
  local self = PaGlobal_WorldMiniMap
  ;
  ((self._ui).regionName):SetAutoResize(true)
  ;
  ((self._ui).regionName):SetNotAbleMasking(true)
  ;
  ((self._ui).regionName):SetFontColor(4294495693)
  ;
  ((self._ui).regionName):useGlowFont(true, "BaseFont_12_Glow", 4286580487)
  ;
  ((self._ui).regionName):SetPosX(5)
  ;
  ((self._ui).regionName):SetPosY(5)
  ;
  ((self._ui).regionName):SetSize(((self._ui).regionName):GetTextSizeX() + 40, ((self._ui).regionName):GetSizeY() + 3)
  ;
  ((self._ui).regionName):ComputePos()
  ;
  ((self._ui).regionName):SetText(regionData:getAreaName())
end

worldMiniMap_NodeLevelRegionNameShow = function(wayPointKey)
  -- function num : 0_3
  local self = PaGlobal_WorldMiniMap
  local regionNoedName = (self._ui).regionNodeName
  local warName = (self._ui).regionWarName
  local nodeName = ToClient_GetNodeNameByWaypointKey(wayPointKey)
  if nodeName == "" or nodeName == nil then
    regionNoedName:SetShow(false)
  else
    regionNoedName:SetShow(true)
    regionNoedName:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RADER_REGIONNODENAME", "getName", nodeName))
    regionNoedName:SetSize(regionNoedName:GetTextSizeX() + 40, regionNoedName:GetSizeY() + 3)
    regionNoedName:SetPosX(Panel_WorldMiniMap:GetSizeX() - regionNoedName:GetSizeX())
    regionNoedName:SetPosY(Panel_WorldMiniMap:GetSizeY() - regionNoedName:GetSizeY() - 2)
    regionNoedName:ComputePos()
  end
end

PaGlobal_WorldMiniMap:InitWorldMiniMap()
registerEvent("FromClient_luaLoadComplete", "PaGlobal_WorldMiniMap_luaLoadComplete")
registerEvent("selfPlayer_regionChanged", "worldMiniMap_updateRegion")
registerEvent("FromClint_EventChangedExplorationNode", "worldMiniMap_NodeLevelRegionNameShow")

