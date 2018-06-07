-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\console\panel_worldmapnodeinfo_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Worldmap_NodeInfo_Console
local WorldMapNodeInfo = {
_ui = {stc_mainBG = (UI.getChildControl)(_panel, "Static_MainBG"), txt_title = nil, txt_nodeName = nil, txt_territoryName = nil, txt_weather = nil, groups = nil, stc_nodeInvestInfoBG = nil, txt_manager = nil, txt_managerName = nil, txt_nodeLv = nil, stc_progressBG = nil, progress2_level = nil, txt_desc = nil, txt_warning = nil, btn_energyInvestment = nil, btn_disinvestment = nil, btn_investment = nil, btn_connectedNode = nil, stc_contributeInfoBG = (UI.getChildControl)(_panel, "Static_ContributeInfo"), txt_contributeText = nil, txt_contributeVal = nil, stc_occupyBG = (UI.getChildControl)(_panel, "Static_OccupyGuildInfo"), txt_occupyTitle = nil, stc_occupyIcon = nil, txt_occupyTime = nil, txt_occupyName = nil, txt_occupyMasterName = nil, stc_occupyBonusBG = nil, txt_occupyBonusTitle = nil, txt_occupyBonusDetail = nil, txt_occupyNowWar = nil}
, _wayPointKey = nil, _nodeStaticStatus = nil, _affiliatedTownKey = nil, _nodeLevel = nil, _ownerInfoIsUp = false}
local nodeBtnArray = {}
local dayType = {"1Monday", "2Tuesday", "3wednesday", "4Thursday", "5Friday", "6Saturday"; [0] = "0Sunday"}
FromClient_luaLoadComplete_WorldMapNodeInfo = function()
  -- function num : 0_0 , upvalues : WorldMapNodeInfo
  WorldMapNodeInfo:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_WorldMapNodeInfo")
WorldMapNodeInfo.initialize = function(self)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_title = (UI.getChildControl)((self._ui).stc_mainBG, "StaticText_Title")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_nodeName = (UI.getChildControl)((self._ui).stc_mainBG, "StaticText_NodeName")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_territoryName = (UI.getChildControl)((self._ui).stc_mainBG, "StaticText_TerritoryName")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_weather = (UI.getChildControl)((self._ui).stc_mainBG, "StaticText_Weather")
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_dividers = {}
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).stc_dividers)[1] = (UI.getChildControl)((self._ui).stc_mainBG, "Static_Divider1")
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).stc_dividers)[2] = (UI.getChildControl)((self._ui).stc_mainBG, "Static_Divider2")
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).stc_dividers)[3] = (UI.getChildControl)((self._ui).stc_mainBG, "Static_Divider3")
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_nodeInvestInfoBG = (UI.getChildControl)((self._ui).stc_mainBG, "Static_NodeInvestInfo")
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_manager = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "StaticText_Manager")
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_managerName = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "StaticText_NpcName")
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_nodeLv = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "StaticText_NodeLevel")
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_progressBG = (UI.getChildControl)((self._ui).txt_nodeLv, "Static_Progress_BG")
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_level = (UI.getChildControl)((self._ui).stc_progressBG, "Progress2_Level")
  -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_desc = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "StaticText_Desc")
  -- DECOMPILER ERROR at PC125: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_warning = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "StaticText_Warning")
  -- DECOMPILER ERROR at PC133: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_connectedNode = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "Button_ConnectedNode")
  -- DECOMPILER ERROR at PC141: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_investment = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "Button_Investment")
  -- DECOMPILER ERROR at PC149: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_energyInvestment = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "Button_EnergyInvestment")
  -- DECOMPILER ERROR at PC157: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_disinvestment = (UI.getChildControl)((self._ui).stc_nodeInvestInfoBG, "Button_Disinvestment")
  -- DECOMPILER ERROR at PC165: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_contributeText = (UI.getChildControl)((self._ui).stc_contributeInfoBG, "StaticText_Point")
  -- DECOMPILER ERROR at PC173: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_contributeVal = (UI.getChildControl)((self._ui).stc_contributeInfoBG, "StaticText_Point_Val")
  -- DECOMPILER ERROR at PC181: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_occupyTitle = (UI.getChildControl)((self._ui).stc_occupyBG, "StaticText_Title")
  -- DECOMPILER ERROR at PC189: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_occupyIcon = (UI.getChildControl)((self._ui).stc_occupyBG, "Static_Icon")
  -- DECOMPILER ERROR at PC197: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_occupyTime = (UI.getChildControl)((self._ui).stc_occupyBG, "StaticText_Time")
  -- DECOMPILER ERROR at PC205: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_occupyName = (UI.getChildControl)((self._ui).stc_occupyBG, "StaticText_Name")
  -- DECOMPILER ERROR at PC213: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_occupyMasterName = (UI.getChildControl)((self._ui).stc_occupyBG, "StaticText_Master")
  -- DECOMPILER ERROR at PC221: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_occupyNowWar = (UI.getChildControl)((self._ui).stc_occupyBG, "StaticText_NowWar")
  -- DECOMPILER ERROR at PC229: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_occupyBonusBG = (UI.getChildControl)((self._ui).stc_occupyBG, "Static_Guild_Bonus")
  -- DECOMPILER ERROR at PC237: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_occupyBonusTitle = (UI.getChildControl)((self._ui).stc_occupyBonusBG, "StaticText_Guild_Bonus_Title")
  -- DECOMPILER ERROR at PC245: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_occupyBonusDetail = (UI.getChildControl)((self._ui).stc_occupyBonusBG, "StaticText_Guild_Bonus_Detail")
  self:registEvent()
  self:registMessageHandler()
end

WorldMapNodeInfo.registEvent = function(self)
  -- function num : 0_2
  ((self._ui).btn_investment):addInputEvent("Mouse_LUp", "Input_WorldMapNodeInfo_OnInvestment()")
  ;
  ((self._ui).btn_disinvestment):addInputEvent("Mouse_LUp", "Input_WorldMapNodeInfo_OnDisInvestment()")
  ;
  ((self._ui).btn_energyInvestment):addInputEvent("Mouse_LUp", "Input_WorldMapNodeInfo_OnEnergyInvest()")
  ;
  ((self._ui).btn_connectedNode):addInputEvent("Mouse_LUp", "Input_WorldMapNodeInfo_OnNearNode()")
end

WorldMapNodeInfo.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("FromClient_FillNodeInfo", "PaGlobalFunc_WorldMapNodeInfo_Update")
  registerEvent("WorldMap_NodeWithdraw", "PaGlobalFunc_WorldMapNodeInfo_Update")
  registerEvent("FromClient_CreateWorldMapNodeIcon", "FromClient_WorldMapNodeInfo_CreateNodeIcon")
  registerEvent("FromClient_RClickedWorldMapNode", "FromClient_WorldMapNodeInfo_RClickedWorldMapNode")
  registerEvent("FromClient_ShowBuildingInfo", "FromClient_WorldMapNodeInfo_ShowBuildingInfo")
  registerEvent("FromClient_BuildingNodeRClick", "FromClient_WorldMapInfo_BuildingNodeRClick")
  registerEvent("FromClint_EventIncreaseExperienceExplorationNode", "FromClient_WorldMapNodeInfo_ExplorationNode")
  registerEvent("FromClient_StartMinorSiege", "FromClient_WorldMapNodeInfo_StartMinorSiege")
  registerEvent("FromClient_EndMinorSiege", "FromClient_WorldMapNodeInfo_EndMinorSiege")
  registerEvent("FromClient_SetGuildModeeWorldMapNodeIcon", "FromClient_WorldMapNodeInfo_SetGuildMode")
  registerEvent("FromClient_OnVillageSiegeBuildingNodeGroup", "FromClient_WorldMapNodeInfo_OnVillageSiegeBuildingNodeGroup")
  registerEvent("FromClient_OutVillageSiegeBuildingNodeGroup", "FromClient_WorldMapNodeInfo_OutVillageSiegeBuildingNodeGroup")
  registerEvent("onScreenResize", "FromClient_WorldMapNodeInfo_OnScreenResize")
end

PaGlobalFunc_WorldMapNodeInfo_Open = function(node)
  -- function num : 0_4 , upvalues : WorldMapNodeInfo
  WorldMapNodeInfo:open(node)
end

WorldMapNodeInfo.open = function(self, node)
  -- function num : 0_5 , upvalues : _panel
  _panel:SetShow(true)
  self:update(node)
end

PaGlobalFunc_WorldMapNodeInfo_Close = function()
  -- function num : 0_6 , upvalues : WorldMapNodeInfo
  WorldMapNodeInfo:close()
end

WorldMapNodeInfo.close = function(self)
  -- function num : 0_7 , upvalues : _panel
  _panel:SetShow(false)
end

PaGlobalFunc_WorldMapNodeInfo_Update = function(node)
  -- function num : 0_8 , upvalues : WorldMapNodeInfo
  _PA_LOG("박범�\128", "PaGlobalFunc_WorldMapNodeInfo_Update")
  WorldMapNodeInfo:update(node)
end

WorldMapNodeInfo.update = function(self, node)
  -- function num : 0_9 , upvalues : _panel
  if not _panel:GetShow() then
    return 
  end
  if node ~= nil then
    self._plantKey = node:getPlantKey()
    self._nodeIsMaxLevel = node:isMaxLevel()
    self._nodeStaticStatus = node:getStaticStatus()
  end
  self._wayPointKey = (self._plantKey):getWaypointKey()
  local wayPlant = ToClient_getPlant(self._plantKey)
  self._affiliatedTownKey = 0
  local plantKeyActual = (self._plantKey):get()
  if (plantKeyActual == (CppEnums.MiniGameParam).eMiniGameParamLoggiaCorn or plantKeyActual == (CppEnums.MiniGameParam).eMiniGameParamLoggiaFarm or plantKeyActual == (CppEnums.MiniGameParam).eMiniGameParamAlehandroHoney or plantKeyActual == (CppEnums.MiniGameParam).eMiniGameParamImpCave) and self._nodeIsMaxLevel == true then
    FGlobal_MiniGame_RequestPlantInvest(plantKeyActual)
  end
  if wayPlant ~= nil then
    self._affiliatedTownKey = ToClinet_getPlantAffiliatedWaypointKey(wayPlant)
  end
  FGlobal_SetNodeName(getExploreNodeName(self._nodeStaticStatus))
  self:updateExplorePoint()
  self:updateCountryName()
  self:updateTerritoryName()
  self:updateWeatherText()
  ;
  ((self._ui).txt_managerName):SetText(requestNodeManagerName(self._wayPointKey))
  self:updateNodeOwner()
  ;
  ((self._ui).btn_investment):SetShow(false)
  ;
  ((self._ui).txt_nodeLv):SetShow(true)
  ;
  ((self._ui).btn_disinvestment):SetShow(false)
  ;
  ((self._ui).btn_energyInvestment):SetShow(true)
  ;
  ((self._ui).txt_warning):SetShow(false)
  ;
  ((self._ui).btn_connectedNode):SetShow(false)
  local needPoint = getPlantNeedPoint()
  local supportPoint = getPlantNeedSupportPoint()
  local needMoney = getPlantNeedMoney()
  local recipeItems = getPlantInvestItemList(self._nodeStaticStatus)
  if isExploreUpgradable(self._wayPointKey) then
    _PA_LOG("박범�\128", "WorldMapNodeInfo:update, isExploreUpgradable")
    if self._nodeIsMaxLevel == false then
      _PA_LOG("박범�\128", "WorldMapNodeInfo:update, false == self._nodeIsMaxLevel")
      if ToClient_isAbleInvestnWithdraw(self._wayPointKey) then
        _PA_LOG("박범�\128", "WorldMapNodeInfo:update case ____ 1")
        ;
        ((self._ui).btn_investment):SetShow(true)
        ;
        ((self._ui).txt_nodeLv):SetShow(false)
        ;
        ((self._ui).btn_disinvestment):SetShow(false)
        ;
        ((self._ui).btn_energyInvestment):SetShow(false)
        ;
        ((self._ui).txt_warning):SetShow(false)
        ;
        ((self._ui).btn_connectedNode):SetShow(false)
      else
        _PA_LOG("박범�\128", "WorldMapNodeInfo:update case ____ 2")
        ;
        ((self._ui).txt_warning):SetShow(true)
        ;
        ((self._ui).txt_warning):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_WORLDMAP_FINDNODEMANAGER"))
        ;
        ((self._ui).txt_desc):SetShow(false)
        ;
        ((self._ui).txt_nodeLv):SetShow(false)
        ;
        ((self._ui).btn_investment):SetShow(false)
        ;
        ((self._ui).btn_disinvestment):SetShow(false)
        ;
        ((self._ui).btn_energyInvestment):SetShow(false)
        ;
        ((self._ui).btn_connectedNode):SetShow(false)
      end
    else
      if isWithdrawablePlant(self._wayPointKey) then
        _PA_LOG("박범�\128", "WorldMapNodeInfo:update case ____ 3")
        ;
        ((self._ui).btn_disinvestment):SetShow(true)
        self:updateNodeLevel()
        ;
        ((self._ui).txt_nodeLv):SetShow(true)
        ;
        ((self._ui).btn_energyInvestment):SetShow(true)
        ;
        ((self._ui).txt_desc):SetShow(false)
        ;
        ((self._ui).txt_warning):SetShow(false)
        ;
        ((self._ui).btn_investment):SetShow(false)
        ;
        ((self._ui).btn_connectedNode):SetShow(false)
        TooltipSimple_Hide()
        if needPoint > 0 or supportPoint > 0 or needMoney > 0 or recipeItems > 0 then
          if workerManager_CheckWorkingOtherChannel() then
            ((self._ui).txt_desc):SetText(workerManager_getWorkingOtherChannelMsg())
          else
            ;
            ((self._ui).txt_desc):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_WORLDMAP_NODENOTWITHDRAW"))
          end
        end
      end
    end
  else
    _PA_LOG("박범�\128", "WorldMapNodeInfo:update case ____ 4")
    local isMainNode = (self._nodeStaticStatus)._isMainNode
    if isMainNode == true then
      ((self._ui).txt_desc):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_WORLDMAP_NODENOTUPGRADE"))
      ;
      ((self._ui).btn_connectedNode):SetShow(true)
    else
      if isMainNode == false then
        ((self._ui).txt_desc):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_WORLDMAP_NODENOTUPGRADE_SUB"))
        ;
        ((self._ui).btn_connectedNode):SetShow(false)
      end
    end
    ;
    ((self._ui).txt_desc):SetShow(true)
    ;
    ((self._ui).btn_disinvestment):SetShow(false)
    ;
    ((self._ui).txt_nodeLv):SetShow(false)
    ;
    ((self._ui).txt_warning):SetShow(false)
    ;
    ((self._ui).btn_investment):SetShow(false)
    ;
    ((self._ui).btn_energyInvestment):SetShow(false)
  end
end

WorldMapNodeInfo.updateExplorePoint = function(self)
  -- function num : 0_10
  local territoryKeyRaw = ToClient_getDefaultTerritoryKey()
  local explorePoint = ToClient_getExplorePointByTerritoryRaw(territoryKeyRaw)
  ;
  ((self._ui).txt_contributeVal):SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()))
end

WorldMapNodeInfo.updateCountryName = function(self)
  -- function num : 0_11
  _PA_LOG("박범�\128", "updateCountryName")
  local nodeStaticStatus = self._nodeStaticStatus
  if nodeStaticStatus == nil then
    return 
  end
  local countryIcon = (self._ui).txt_nodeName
  local nodeNationalName = getNodeNationalName(nodeStaticStatus)
  if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_CONTRY_KALPEON") == tostring(nodeNationalName) then
    countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 418, 71, 436, 90)
    ;
    (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
  else
    do
      if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_CONTRY_BALENCIA") == tostring(nodeNationalName) then
        countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 456, 71, 474, 90)
        ;
        (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      else
        do
          if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_CONTRY_MEDIA") == tostring(nodeNationalName) then
            countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 437, 71, 455, 90)
            ;
            (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
          else
            do
              if PAGetString(Defines.StringSheet_GAME, "LUA_CONTRYNAME_6") == tostring(nodeNationalName) then
                countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 474, 71, 492, 90)
                ;
                (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
              else
                do
                  countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
                  do
                    local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 418, 71, 436, 90)
                    ;
                    (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                    countryIcon:setRenderTexture(countryIcon:getBaseTexture())
                    countryIcon:SetText(nodeNationalName)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

WorldMapNodeInfo.updateTerritoryName = function(self)
  -- function num : 0_12
  _PA_LOG("박범�\128", "WorldMapNodeInfo:updateTerritoryName")
  local nodeStaticStatus = self._nodeStaticStatus
  if nodeStaticStatus == nil then
    return 
  end
  local territoryIcon = (self._ui).txt_territoryName
  local territoryName = getNodeTerritoryName(nodeStaticStatus)
  territoryIcon:SetShow(true)
  if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_BALENOS") == tostring(territoryName) then
    territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/dialogue_etc_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 399, 71, 417, 90)
    ;
    (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
  else
    do
      if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_SERENDIA") == tostring(territoryName) then
        territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/dialogue_etc_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 380, 71, 398, 90)
        ;
        (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      else
        do
          if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_KALPEON") == tostring(territoryName) then
            territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/dialogue_etc_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 418, 71, 436, 90)
            ;
            (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
          else
            do
              if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_MEDIA") == tostring(territoryName) then
                territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/dialogue_etc_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 437, 71, 455, 90)
                ;
                (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
              else
                do
                  if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_BALENCIA") == tostring(territoryName) then
                    territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 456, 71, 474, 90)
                    ;
                    (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                  else
                    do
                      if PAGetString(Defines.StringSheet_GAME, "LUA_CONTRYNAME_6") == tostring(territoryName) then
                        territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 474, 71, 492, 90)
                        ;
                        (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                      end
                      do
                        territoryIcon:setRenderTexture(territoryIcon:getBaseTexture())
                        territoryIcon:SetText(territoryName)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

WorldMapNodeInfo.updateWeatherText = function(self)
  -- function num : 0_13
  local nodeKey = self._wayPointKey
  if nodeKey == nil then
    return 
  end
  local fWeatherCloudRate = getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_CLOUD_RATE, nodeKey)
  local fWeatherRainAmount = getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_RAIN_AMOUNT, nodeKey)
  local fWeatherCelsius = getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_CELSIUS, nodeKey)
  local strWeatherCloudRate = ""
  local strWeatherRainAmount = ""
  local strWeatherCelsius = ""
  if fWeatherCloudRate > 0.6 then
    strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_HIGH")
  else
    if fWeatherCloudRate > 0.3 then
      strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_MID")
    else
      strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_LOW")
    end
  end
  if fWeatherRainAmount > 0.6 then
    if fWeatherCelsius < 0 then
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_SNOWAMOUNT_HIGH")
    else
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_HIGH")
    end
  else
    if fWeatherRainAmount > 0.3 then
      if fWeatherCelsius < 0 then
        strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_SNOWAMOUNT_MID")
      else
        strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_MID")
      end
    else
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_LOW")
    end
  end
  if fWeatherCelsius > 30 then
    strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_HIGH")
  else
    if fWeatherCelsius > 0 then
      strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_MID")
    else
      strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_LOW")
    end
  end
  ;
  ((self._ui).txt_weather):SetText(strWeatherCloudRate .. "/" .. strWeatherRainAmount .. "/" .. strWeatherCelsius)
end

WorldMapNodeInfo.updateNodeLevel = function(self)
  -- function num : 0_14
  if self._wayPointKey == nil then
    return 
  end
  local nodeLv = ToClient_GetNodeLevel(self._wayPointKey)
  local nodeExp = Int64toInt32(ToClient_GetNodeExperience_s64(self._wayPointKey))
  local nodeExpMax = Int64toInt32(ToClient_GetNeedExperienceToNextNodeLevel_s64(self._wayPointKey))
  local nodeExpPercent = nodeExp / nodeExpMax * 100
  ;
  ((self._ui).txt_nodeLv):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_HELPICON_NODELEVEL") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. ". " .. tostring(nodeLv))
  self._nodeLevel = nodeLv
  if _isProgressReset then
    ((self._ui).progress2_level):SetProgressRate(0)
    _isProgressReset = false
  else
    ;
    ((self._ui).progress2_level):SetProgressRate(nodeExpPercent)
  end
end

WorldMapNodeInfo.updateNodeOwner = function(self)
  -- function num : 0_15
  local regionInfo = (self._nodeStaticStatus):getMinorSiegeRegion()
  self._ownerInfoIsUp = false
  if regionInfo == nil then
    _PA_LOG("박범�\128", "updateNodeOwner, regionInfo is nil")
    ;
    ((self._ui).stc_occupyBG):SetShow(false)
    return 
  end
  local regionKey = regionInfo._regionKey
  local regionWrapper = getRegionInfoWrapper(regionKey:get())
  local minorSiegeWrapper = regionWrapper:getMinorSiegeWrapper()
  if minorSiegeWrapper == nil then
    _PA_LOG("박범�\128", "updateNodeOwner, minorSiegeWrapper is nil")
    ;
    ((self._ui).stc_occupyBG):SetShow(false)
    return 
  end
  local siegeWrapper = ToClient_GetSiegeWrapperByRegionKey(regionKey:get())
  if siegeWrapper == nil then
    _PA_LOG("박범�\128", "updateNodeOwner, siegeWrapper is nil")
    ;
    ((self._ui).stc_occupyBG):SetShow(false)
    return 
  end
  self._ownerInfoIsUp = true
  local paDate = siegeWrapper:getOccupyingDate()
  local siegeTentCount = ToClient_GetCompleteSiegeTentCount(regionKey:get())
  local year = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_YEAR", "year", tostring(paDate:GetYear()))
  local month = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_MONTH", "month", tostring(paDate:GetMonth()))
  local day = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_DAY", "day", tostring(paDate:GetDay()))
  local hour = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_HOUR", "hour", tostring(paDate:GetHour()))
  local isSiegeBeing = minorSiegeWrapper:isSiegeBeing()
  local hasOccupantExist = siegeWrapper:doOccupantExist()
  ;
  ((self._ui).txt_occupyTime):SetShow(not isSiegeBeing)
  ;
  ((self._ui).txt_occupyName):SetShow(not isSiegeBeing)
  ;
  ((self._ui).txt_occupyMasterName):SetShow(not isSiegeBeing)
  ;
  ((self._ui).txt_occupyBonusTitle):SetShow(not isSiegeBeing)
  ;
  ((self._ui).txt_occupyBonusDetail):SetShow(not isSiegeBeing)
  ;
  ((self._ui).txt_occupyNowWar):SetShow(isSiegeBeing)
  if isSiegeBeing == true then
    _PA_LOG("박범�\128", "updateNodeOwner ___ 2")
    local isSiegeChannel = ToClient_doMinorSiegeInTerritory(regionWrapper:getTerritoryKeyRaw())
    if isSiegeChannel == true then
      ((self._ui).txt_occupyNowWar):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_COUNT", "siegeTentCount", siegeTentCount))
    else
      ;
      ((self._ui).txt_occupyNowWar):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODEOWNERINFO_NOT_NODEWAR"))
    end
    ;
    ((self.ui).txt_occupyName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODEOWNERINFO_WAR"))
  else
    do
      if hasOccupantExist == true then
        _PA_LOG("박범�\128", "updateNodeOwner ___ 3")
        local isSet = setGuildTextureByGuildNo(siegeWrapper:getGuildNo(), (self._ui).stc_occupyIcon)
        if not isSet then
          ((self._ui).stc_occupyIcon):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
          local x1, y1, x2, y2 = setTextureUV_Func((self._ui).stc_occupyIcon, 183, 1, 188, 6)
          ;
          (((self._ui).stc_occupyIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          ((self._ui).stc_occupyIcon):setRenderTexture(((self._ui).stc_occupyIcon):getBaseTexture())
        end
        do
          do
            ;
            ((self._ui).txt_occupyName):SetText(siegeWrapper:getGuildName())
            ;
            ((self._ui).txt_occupyMasterName):SetText(siegeWrapper:getGuildMasterName())
            ;
            ((self._ui).txt_occupyTime):SetText(year .. " " .. month .. " " .. day .. " " .. hour)
            _PA_LOG("박범�\128", "updateNodeOwner ___ 4")
            ;
            ((self._ui).stc_occupyIcon):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
            do
              local x1, y1, x2, y2 = setTextureUV_Func((self._ui).stc_occupyIcon, 0, 0, 0, 0)
              ;
              (((self._ui).stc_occupyIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              ((self._ui).stc_occupyIcon):setRenderTexture(((self._ui).stc_occupyIcon):getBaseTexture())
              ;
              ((self._ui).txt_occupyName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_WORLDMAP_NODEOWNERINFO_NOWAR"))
              ;
              ((self._ui).txt_occupyMasterName):SetText("-")
              ;
              ((self._ui).txt_occupyTime):SetText("-")
              if self._ownerInfoIsUp == true then
                local dropTypeValue = ""
                local dropType = regionInfo:getDropGroupRerollCountOfSieger()
                local nodeTaxType = regionInfo:getVillageTaxLevel()
                local nodeTaxLevel = 0
                if _ContentsGroup_SeigeSeason5 == true then
                  nodeTaxLevel = nodeTaxType + 1
                else
                  nodeTaxLevel = nodeTaxType
                end
                if dropType == 0 and nodeTaxLevel >= 1 then
                  dropTypeValue = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_TAX", "nodeTaxType", nodeTaxLevel)
                else
                  if dropType >= 1 and nodeTaxType == 0 then
                    dropTypeValue = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_LIFE", "dropType", dropType + 1)
                  else
                    if dropType >= 1 and nodeTaxType >= 1 then
                      dropTypeValue = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_BOTH", "nodeTaxType", tostring(nodeTaxLevel), "dropType", tostring(dropType + 1))
                    else
                      dropTypeValue = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_NOT")
                    end
                  end
                end
                ;
                ((self._ui).txt_occupyBonusDetail):SetText(dropTypeValue)
              end
            end
          end
        end
      end
    end
  end
end

PaGlobalFunc_WorldMapNodeInfo_UpdateExplorePoint = function()
  -- function num : 0_16 , upvalues : WorldMapNodeInfo
  WorldMapNodeInfo:updateExplorePoint()
end

local _isProgressReset = false
Input_WorldMapNodeInfo_OnInvestment = function()
  -- function num : 0_17 , upvalues : WorldMapNodeInfo, _isProgressReset
  local self = WorldMapNodeInfo
  if self._wayPointKey == nil then
    return 
  end
  _isProgressReset = true
  ToClient_WorldMapRequestUpgradeExplorationNode(self._wayPointKey)
  PaGlobal_TutorialManager:handleOnNodeUpgradeClick(self._wayPointKey)
end

Input_WorldMapNodeInfo_OnDisInvestment = function()
  -- function num : 0_18 , upvalues : WorldMapNodeInfo
  local self = WorldMapNodeInfo
  if self._wayPointKey == nil then
    return 
  end
  local NodeWithdrawExecute = function()
    -- function num : 0_18_0 , upvalues : self
    ToClient_WorldMapRequestWithdrawPlant(self._wayPointKey)
  end

  if Panel_Plant_WorkManager:GetShow() then
    WorldMapPopupManager:popPanel()
  end
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_WORLDMAP_NODE_WITHDRAWCONFIRM")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = NodeWithdrawExecute, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData, "top")
end

Input_WorldMapNodeInfo_OnEnergyInvest = function()
  -- function num : 0_19 , upvalues : WorldMapNodeInfo
  local self = WorldMapNodeInfo
  if self._wayPointKey == nil then
    return 
  end
  if ToClient_WorldMapIsShow() == false then
    return 
  end
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local wp = player:getWp()
  local maxWp = player:getMaxWp()
  local s64_maxNumber = toInt64(0, 0)
  local wpCalc = (math.floor)(wp / 10)
  if wpCalc < maxWp then
    s64_maxNumber = tonumber64(wpCalc)
  end
  Panel_NumberPad_Show(true, s64_maxNumber, self._wayPointKey, PaGlobalFunc_WorldMapNodeInfo_EnergyInvest)
end

PaGlobalFunc_WorldMapNodeInfo_EnergyInvest = function(inputNumber, param)
  -- function num : 0_20
  local wpCount = Int64toInt32(inputNumber) * 10
  ToClient_RequestIncreaseExperienceNode(param, wpCount)
end

Input_WorldMapNodeInfo_OnNearNode = function()
  -- function num : 0_21 , upvalues : WorldMapNodeInfo
  local self = WorldMapNodeInfo
  if self._wayPointKey == nil then
    return 
  end
  _PA_LOG("박범�\128", "OnNearNodeClick")
  if ((getSelfPlayer()):get()):getLevel() < 11 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TUTORIAL_PROGRSS_ACK"))
    return 
  end
  ToClient_DeleteNaviGuideByGroup(0)
  ToClient_WorldMapFindNearNode(self._wayPointKey, NavigationGuideParam())
  audioPostEvent_SystemUi(0, 14)
  FGlobal_WorldMapWindowEscape()
end

FromClient_WorldMapNodeInfo_CreateNodeIcon = function(nodeBtn)
  -- function num : 0_22 , upvalues : nodeBtnArray
  FromClient_WorldMapNodeInfo_GuildWarSet(nodeBtn)
  local tradeIcon = nodeBtn:FromClient_getTradeIcon()
  local explorationInfo = nodeBtn:FromClient_getExplorationNodeInClient()
  local plantKey = explorationInfo:getPlantKey()
  local wayPointKey = plantKey:getWaypointKey()
  if explorationInfo ~= nil then
    local explorationInfoSSW = explorationInfo:getStaticStatus()
    local minorSiegeRegion = explorationInfoSSW:getMinorSiegeRegion()
    if minorSiegeRegion ~= nil then
      local regionKey = (minorSiegeRegion._regionKey):get()
      local isWeekNode = ToClient_IsVillageSiegeInThisWeek(regionKey)
      local guildIcon = nodeBtn:FromClient_getNodeGuildIcon()
      local guildIconBG = nodeBtn:FromClient_getGuildMarkBG()
      local guildMark = nodeBtn:FromClient_getGuildMark()
      if isWeekNode then
        guildIcon:SetMonoTone(false)
        guildIconBG:SetMonoTone(false)
        guildMark:SetMonoTone(false)
      else
        guildIcon:SetMonoTone(true)
        guildIconBG:SetMonoTone(true)
        guildMark:SetMonoTone(true)
      end
    end
  end
  do
    local territoryKeyRaw = nodeBtn:FromClient_getTerritoryKey()
    if wayPointKey == 301 or wayPointKey == 1 or wayPointKey == 601 or wayPointKey == 1101 or wayPointKey == 1301 then
      tradeIcon:SetSpanSize(-10, 20)
      tradeIcon:SetShow(false)
      -- DECOMPILER ERROR at PC72: Confused about usage of register: R6 in 'UnsetPending'

      nodeBtnArray[wayPointKey] = nodeBtn
      tradeIcon:addInputEvent("Mouse_LUp", "FGlobal_handleOpenItemMarket(" .. territoryKeyRaw .. ")")
      tradeIcon:addInputEvent("Mouse_On", "CreateNodeIconForTradeIcon_ShowTooltip(" .. wayPointKey .. ", true )")
      tradeIcon:addInputEvent("Mouse_Out", "CreateNodeIconForTradeIcon_ShowTooltip(" .. wayPointKey .. ", false )")
    end
  end
end

FromClient_WorldMapNodeInfo_GuildWarSet = function(nodeBtn)
  -- function num : 0_23
  local explorationInfo = nodeBtn:FromClient_getExplorationNodeInClient()
  local nodeStaticStatus = explorationInfo:getStaticStatus()
  local regionInfo = nodeStaticStatus:getMinorSiegeRegion()
  local warStateIcon = nodeBtn:FromClient_getWarStateIcon()
  local guildModeGuildMark = nodeBtn:FromClient_getNodeGuildIcon()
  if regionInfo ~= nil then
    local regionKey = regionInfo._regionKey
    local regionWrapper = getRegionInfoWrapper(regionKey:get())
    local minorSiegeWrapper = regionWrapper:getMinorSiegeWrapper()
    local siegeWrapper = ToClient_GetSiegeWrapperByRegionKey(regionKey:get())
    local guildMark = nodeBtn:FromClient_getGuildMark()
    local guildMarkBG = nodeBtn:FromClient_getGuildMarkBG()
    if minorSiegeWrapper ~= nil then
      if minorSiegeWrapper:isSiegeBeing() then
        warStateIcon:setUpdateTextureAni(true)
        warStateIcon:SetShow(true)
        guildMark:SetShow(false)
        guildMarkBG:SetShow(false)
      else
        warStateIcon:setUpdateTextureAni(false)
        if siegeWrapper:doOccupantExist() == true then
          local isSet = setGuildTextureByGuildNo(siegeWrapper:getGuildNo(), guildMark)
          if isSet == false then
            guildMark:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(guildMark, 183, 1, 188, 6)
            ;
            (guildMark:getBaseTexture()):setUV(x1, y1, x2, y2)
          else
            do
              do
                ;
                (guildMark:getBaseTexture()):setUV(0, 0, 1, 1)
                guildMark:setRenderTexture(guildMark:getBaseTexture())
                warStateIcon:SetShow(false)
                guildMark:SetShow(true)
                guildMarkBG:SetShow(true)
                warStateIcon:SetShow(true)
                guildMark:SetShow(false)
                guildMarkBG:SetShow(false)
                warStateIcon:SetShow(false)
                guildMark:SetShow(false)
                guildMarkBG:SetShow(false)
                guildModeGuildMark:SetShow(false)
              end
            end
          end
        end
      end
    end
  end
end

FromClient_WorldmapNodeInfo_RClickedWorldMapNode = function(nodeBtn)
  -- function num : 0_24
  local node = nodeBtn:FromClient_getExplorationNodeInClient()
  if node == nil then
    return 
  end
  local nodeStaticStatus = node:getStaticStatus()
  local position = ToClient_getNodeManagerPosition(nodeStaticStatus)
  if position.x == 0 and position.y == 0 and position.z == 0 then
    position = nodeStaticStatus:getPosition()
  end
  FromClient_RClickWorldmapPanel(position, true, false)
end

FromClient_WorldMapNodeInfo_ShowBuildingInfo = function(nodeBtn)
  -- function num : 0_25 , upvalues : WorldMapNodeInfo
  buildingActorKey = nodeBtn:ToClient_getActorKey()
  local buildingSS = ToClient_getBuildingInfo(buildingActorKey)
  if buildingSS == nil then
    return 
  end
  local workableCount = ToClient_getBuildingWorkableListCount(buildingSS)
  if workableCount > 0 then
    WorldMapNodeInfo:onClickBuildingManage()
  end
end

WorldMapNodeInfo.onClickBuildingManage = function(self)
  -- function num : 0_26
  local buildingSS = ToClient_getBuildingInfo(buildingActorKey)
  if buildingSS == nil then
    return 
  end
  if ToClient_isMyBuilding(buildingSS) == false then
    return 
  end
  if buildingSS:getBuildingProgress() >= 1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLICK_COMPLETED_BUILDING"))
  else
    FGlobal_Building_WorkManager_Reset_Pos()
    FGlobal_Building_WorkManager_Open(buildingActorKey)
    WorldMapPopupManager:increaseLayer()
    WorldMapPopupManager:push(Panel_Building_WorkManager, true)
  end
end

FromClient_WorldMapInfo_BuildingNodeRClick = function(nodeBtn)
  -- function num : 0_27
  local buildInfoSS = nodeBtn:ToClient_getBuildingStaticStatus()
  if buildInfoSS ~= nil then
    FromClient_RClickWorldmapPanel(ToClient_getBuildingPosition(buildInfoSS), true, false)
  end
end

FromClient_WorldMapNodeInfo_ExplorationNode = function(WaypointKey, ExplorationLevel, TExperience)
  -- function num : 0_28 , upvalues : WorldMapNodeInfo
  WorldMapNodeInfo:updateNodeLevel(WaypointKey)
end

FromClient_WorldMapNodeInfo_StartMinorSiege = function(nodeBtn)
  -- function num : 0_29
  local warStateIcon = nodeBtn:FromClient_getWarStateIcon()
  warStateIcon:setUpdateTextureAni(true)
  warStateIcon:SetShow(true)
  local guildMark = nodeBtn:FromClient_getGuildMark()
  local guildMarkBG = nodeBtn:FromClient_getGuildMarkBG()
  guildMark:SetShow(false)
  guildMarkBG:SetShow(false)
end

FromClient_WorldMapNodeInfo_EndMinorSiege = function(nodeBtn)
  -- function num : 0_30
  worldmapNodeIcon_GuildWarSet(nodeBtn)
end

FromClient_WorldMapNodeInfo_OnVillageSiegeBuildingNodeGroup = function(nodeBtn)
  -- function num : 0_31
  nodeBtn:EraseAllEffect()
  nodeBtn:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
end

FromClient_WorldMapNodeInfo_OutVillageSiegeBuildingNodeGroup = function(nodeBtn)
  -- function num : 0_32
  nodeBtn:EraseAllEffect()
end

FromClient_WorldMapNodeInfo_SetGuildMode = function(nodeBtn)
  -- function num : 0_33 , upvalues : dayType
  if PaGlobalFunc_WorldMapSideBar_IsGuildWarMode() then
    local warStateIcon = nodeBtn:FromClient_getWarStateIcon()
    local guildMark = nodeBtn:FromClient_getGuildMark()
    local guildMarkBG = nodeBtn:FromClient_getGuildMarkBG()
    local guildIcon = nodeBtn:FromClient_getNodeGuildIcon()
    local explorationInfo = nodeBtn:FromClient_getExplorationNodeInClient()
    local villageSiegeType = nodeBtn:getVillageSiegeType()
    local siegeNode = ((nodeBtn:FromClient_getExplorationNodeInClient()):getStaticStatus()):getMinorSiegeRegion()
    if siegeNode ~= nil and villageSiegeType < 7 then
      local taxGrade = siegeNode:getVillageTaxLevel()
      warStateIcon:SetShow(false)
      guildMark:SetShow(false)
      guildMarkBG:SetShow(false)
      nodeBtn:SetMonoTone(false)
      local normalUrl = "New_UI_Common_forLua/Widget/WorldMap/WorldMap_NodeWarGuildIcon/" .. dayType[villageSiegeType] .. "/" .. tostring(taxGrade) .. "_Nomal.dds"
      local overUrl = "New_UI_Common_forLua/Widget/WorldMap/WorldMap_NodeWarGuildIcon/" .. dayType[villageSiegeType] .. "/" .. tostring(taxGrade) .. "_Over.dds"
      local clickUrl = "New_UI_Common_forLua/Widget/WorldMap/WorldMap_NodeWarGuildIcon/" .. dayType[villageSiegeType] .. "/" .. tostring(taxGrade) .. "_Click.dds"
      nodeBtn:ChangeTextureInfoName(normalUrl)
      ;
      (nodeBtn:getBaseTexture()):setUV(0, 0, 1, 1)
      nodeBtn:setRenderTexture(nodeBtn:getBaseTexture())
      nodeBtn:ChangeOnTextureInfoName(overUrl)
      nodeBtn:ChangeClickTextureInfoName(clickUrl)
    end
    do
      if explorationInfo ~= nil then
        local explorationInfoSSW = explorationInfo:getStaticStatus()
        local minorSiegeRegion = explorationInfoSSW:getMinorSiegeRegion()
        if minorSiegeRegion ~= nil then
          local regionKey = (minorSiegeRegion._regionKey):get()
          local isWeekNode = ToClient_IsVillageSiegeInThisWeek(regionKey)
          if isWeekNode then
            guildMark:SetMonoTone(false)
            guildMarkBG:SetMonoTone(false)
            guildIcon:SetMonoTone(false)
          else
            guildMark:SetMonoTone(true)
            guildMarkBG:SetMonoTone(true)
            guildIcon:SetMonoTone(true)
          end
        end
      end
      do
        FromClient_WorldMapNodeInfo_GuildWarSet(nodeBtn)
      end
    end
  end
end

FromClient_WorldMapNodeInfo_OnScreenResize = function()
  -- function num : 0_34 , upvalues : _panel
  _panel:SetSize(getScreenSizeX(), getScreenSizeY())
end


