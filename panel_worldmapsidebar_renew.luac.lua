-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\console\panel_worldmapsidebar_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Worldmap_Console
local STATE = CppEnums.WorldMapState
local VIEW_TOGGLE = CppEnums.WorldMapCheckState
local WorldMapSideBarInfo = {
_ui = {txt_panelTitle = (UI.getChildControl)(_panel, "StaticText_Title_Icon_Text"), txt_filterTitle = (UI.getChildControl)(_panel, "StaticText_Filter_Title"), stc_stateBG = (UI.getChildControl)(_panel, "Static_Category"), rdo_states = nil, btn_xBoxKey_LT = nil, btn_xBoxKey_RT = nil, txt_stateNameTag = nil, stc_stateNameTagMarker = nil, stc_viewToggleBG = (UI.getChildControl)(_panel, "Static_Category_Detail"), chk_viewToggles = nil, txt_selectedBox = nil, txt_infoTitle = (UI.getChildControl)(_panel, "StaticText_Info_Title"), stc_searchListBG = (UI.getChildControl)(_panel, "Static_Result_List"), rdo_searchByNodeTypes = nil, stc_searchTypePictogram = nil, frame_searchResult = nil, rdo_searchedItems = nil}
, _stateMax = 7, _viewToggleMax = 9, _searchTypeMax = 6, _currentState = nil, _isGuildWarMode = false, _isBlackFog = false, _viewTogglesDefault = nil, _viewToggleWhenProductState = 1, _currentSearchCondition = nil, _currentSearchNodeType = nil, _searchResultCount = 0, _searchResultYGap = 40}
local _stateData = {
[STATE.eWMS_EXPLORE_PLANT] = {tooltip = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_PLANT_NAME")}
, 
[STATE.eWMS_REGION] = {tooltip = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_REGION_NAME")}
, 
[STATE.eWMS_LOCATION_INFO_WATER] = {tooltip = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_WATER_NAME")}
, 
[STATE.eWMS_LOCATION_INFO_CELCIUS] = {tooltip = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_CELCIUS_NAME")}
, 
[STATE.eWMS_LOCATION_INFO_HUMIDITY] = {tooltip = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_HUMIDITY_NAME")}
, 
[STATE.eWMS_GUILD_WAR] = {tooltip = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_GUILDWAR_NAME")}
, 
[STATE.eWMS_PRODUCT_NODE] = {tooltip = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_TOOLTIP_NODEFILTER")}
}
local _viewTogglesData = {
[1] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_QUEST_NAME"), productNodeText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODETYPE_0"), productNodeKey = -1}
, 
[2] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_KNOWLEDGE_NAME"), productNodeText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODETYPE_1"), productNodeKey = (CppEnums.ExplorationNodeType).eExplorationNodeType_Farm}
, 
[3] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_FISH_NAME"), productNodeText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODETYPE_2"), productNodeKey = (CppEnums.ExplorationNodeType).eExplorationNodeType_Collect}
, 
[4] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_NODE_NAME"), productNodeText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODETYPE_3"), productNodeKey = (CppEnums.ExplorationNodeType).eExplorationNodeType_Quarry}
, 
[5] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_DIRECTION_NAME"), productNodeText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODETYPE_4"), productNodeKey = (CppEnums.ExplorationNodeType).eExplorationNodeType_Logging}
, 
[6] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_WHERE_NAME"), productNodeText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODETYPE_5"), productNodeKey = (CppEnums.ExplorationNodeType).eExplorationNodeType_Craft}
, 
[7] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_PANEL_TOOLTIP_TRADE_NAME"), productNodeText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODETYPE_6"), productNodeKey = (CppEnums.ExplorationNodeType).eExplorationNodeType_Excavation}
, 
[8] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_PANEL_TOOLTIP_WAGON"), productNodeText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODETYPE_7"), productNodeKey = (CppEnums.ExplorationNodeType).eExplorationNodeType_MonopolyFarm}
, 
[9] = {genericText = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_PANEL_TOOLTIP_MONSTERINFO_NAME")}
}
local SEARCH_BY = {NAME_OF_NODE = 0, NAME_OF_ITEM = 1, TYPE_OF_NODE = 2, PURPOSE = 3, GUILD_NAME = 4}
local NODE_TYPE = {NORMAL = 1, VILLIAGE = 2, CITY = 3, GATE = 4, TRADE = 5, DANGEROUS = 6}
local _nodeData = {
[NODE_TYPE.NORMAL] = {nodeTypeName = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_NODETYPE_NORMAL"), key = 0}
, 
[NODE_TYPE.VILLIAGE] = {nodeTypeName = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_NODETYPE_VILIAGE"), key = 1}
, 
[NODE_TYPE.CITY] = {nodeTypeName = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_NODETYPE_CITY"), key = 2}
, 
[NODE_TYPE.GATE] = {nodeTypeName = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_NODETYPE_GATE"), key = 3}
, 
[NODE_TYPE.TRADE] = {nodeTypeName = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_NODETYPE_TRADE"), key = 5}
, 
[NODE_TYPE.DANGEROUS] = {nodeTypeName = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_NODETYPE_DANGEROUS"), key = 9}
}
FromClient_luaLoadComplete_WorldMapSideBar_Init = function()
  -- function num : 0_0 , upvalues : WorldMapSideBarInfo
  WorldMapSideBarInfo:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_WorldMapSideBar_Init")
WorldMapSideBarInfo.initialize = function(self)
  -- function num : 0_1 , upvalues : STATE, NODE_TYPE
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).rdo_states = {}
  for ii = 1, self._stateMax do
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).rdo_states)[ii] = (UI.getChildControl)((self._ui).stc_stateBG, "RadioButton_Category_" .. ii)
    ;
    (((self._ui).rdo_states)[ii]):addInputEvent("Mouse_LUp", "Input_WorldMapSideBar_SetStateTo(" .. ii .. ")")
  end
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_xBoxKey_LT = (UI.getChildControl)((self._ui).stc_stateBG, "Button_LT")
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_xBoxKey_RT = (UI.getChildControl)((self._ui).stc_stateBG, "Button_RT")
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_stateNameTag = (UI.getChildControl)((self._ui).stc_stateBG, "StaticText_Desc")
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_stateNameTagMarker = (UI.getChildControl)((self._ui).txt_stateNameTag, "Static_Marker")
  self._viewTogglesDefault = {}
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).chk_viewToggles = {}
  for ii = 1, self._viewToggleMax do
    -- DECOMPILER ERROR at PC80: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).chk_viewToggles)[ii] = (UI.getChildControl)((self._ui).stc_viewToggleBG, "CheckButton_ViewToggle_" .. ii)
  end
  -- DECOMPILER ERROR at PC89: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_selectedBox = (UI.getChildControl)((self._ui).stc_viewToggleBG, "StaticText_Selected_Box")
  ;
  ((self._ui).txt_selectedBox):SetShow(false)
  -- DECOMPILER ERROR at PC97: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).rdo_searchByNodeTypes = {}
  for ii = 1, self._searchTypeMax do
    -- DECOMPILER ERROR at PC112: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).rdo_searchByNodeTypes)[ii] = (UI.getChildControl)((self._ui).stc_searchListBG, "RadioButton_NodeType_" .. ii)
    ;
    (((self._ui).rdo_searchByNodeTypes)[ii]):addInputEvent("Mouse_LUp", "Input_WorldMapSideBar_SearchByNodeType(" .. ii .. ")")
  end
  -- DECOMPILER ERROR at PC131: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_searchResult = (UI.getChildControl)((self._ui).stc_searchListBG, "Frame_NodeList")
  -- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).rdo_searchedItems = {}
  self._currentState = STATE.eWMS_EXPLORE_PLANT
  self._currentSearchNodeType = NODE_TYPE.CITY
  self:registEventHandler()
  self:registMessageHandler()
end

WorldMapSideBarInfo.registEventHandler = function(self)
  -- function num : 0_2 , upvalues : _panel
  _panel:RegisterUpdateFunc("PaGlobalFunc_WorldMapSidebar_PerFrameUpdate")
end

WorldMapSideBarInfo.registMessageHandler = function(self)
  -- function num : 0_3
end

PaGlobalFunc_WorldMapSideBar_Open = function()
  -- function num : 0_4 , upvalues : WorldMapSideBarInfo
  WorldMapSideBarInfo:open()
end

WorldMapSideBarInfo.open = function(self)
  -- function num : 0_5 , upvalues : _panel, STATE, VIEW_TOGGLE
  _panel:SetShow(true, false)
  Panel_WorldMap_Main:SetShow(false, false)
  for ii = 1, self._stateMax do
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R5 in 'UnsetPending'

    (self._viewTogglesDefault)[ii] = {}
    for jj = 1, self._viewToggleMax do
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R9 in 'UnsetPending'

      if ii == STATE.eWMS_EXPLORE_PLANT then
        ((self._viewTogglesDefault)[ii])[jj] = ToClient_isWorldmapCheckState(jj - 1)
      else
        -- DECOMPILER ERROR at PC34: Confused about usage of register: R9 in 'UnsetPending'

        ;
        ((self._viewTogglesDefault)[ii])[jj] = false
      end
    end
  end
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._viewTogglesDefault)[STATE.eWMS_GUILD_WAR])[VIEW_TOGGLE.eCheck_Node] = true
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._viewTogglesDefault)[STATE.eWMS_GUILD_WAR])[VIEW_TOGGLE.eCheck_Postions] = true
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._viewTogglesDefault)[STATE.eWMS_PRODUCT_NODE])[VIEW_TOGGLE.eCheck_Node] = true
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_searchTypePictogram = {}
  for ii = 1, self._searchTypeMax do
    -- DECOMPILER ERROR at PC76: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).stc_searchTypePictogram)[ii] = (UI.getChildControl)(((self._ui).rdo_searchByNodeTypes)[ii], "Static_Pictogram_On_" .. ii)
  end
  ;
  (((self._ui).rdo_states)[self._currentState]):SetCheck(true)
  self:update()
  self:updateStateButtons(self._currentState)
  self:updateViewTogglesByState(self._currentState)
  self:updateSearchList()
end

PaGlobalFunc_WorldMapSidebar_PerFrameUpdate = function(deltaTime)
  -- function num : 0_6
end

WorldMapSideBarInfo.update = function(self)
  -- function num : 0_7
end

WorldMapSideBarInfo.updateStateButtons = function(self, state)
  -- function num : 0_8 , upvalues : _stateData
  local radio = ((self._ui).rdo_states)[state]
  local tag = (self._ui).txt_stateNameTag
  radio:SetCheck(true)
  tag:SetText((_stateData[state]).tooltip)
  tag:SetSize(tag:GetTextSizeX() + 28, tag:GetSizeY())
  tag:SetPosX(radio:GetPosX() + radio:GetSizeX() / 2 - tag:GetSizeX() / 2)
  ;
  ((self._ui).stc_stateNameTagMarker):ComputePos()
end

WorldMapSideBarInfo.updateViewTogglesByState = function(self, state)
  -- function num : 0_9 , upvalues : STATE, _viewTogglesData
  local toggleButton = (self._ui).chk_viewToggles
  if STATE.eWMS_PRODUCT_NODE == state then
    for ii = 1, self._viewToggleMax do
      if (_viewTogglesData[ii]).productNodeText ~= nil then
        (toggleButton[ii]):SetShow(true)
        ;
        (toggleButton[ii]):SetText((_viewTogglesData[ii]).productNodeText)
        ;
        (toggleButton[ii]):removeInputEvent("Mouse_LUp")
        ;
        (toggleButton[ii]):addInputEvent("Mouse_LUp", "Input_WorldMapSideBar_SetViewToggleWhenProductState(" .. ii .. ")")
        if ii == self._viewToggleWhenProductState then
          (toggleButton[ii]):SetCheck(true)
        else
          ;
          (toggleButton[ii]):SetCheck(false)
        end
      else
        ;
        (toggleButton[ii]):SetShow(false)
      end
    end
  else
    do
      for ii = 1, self._viewToggleMax do
        (toggleButton[ii]):SetShow(true)
        ;
        (toggleButton[ii]):SetText((_viewTogglesData[ii]).genericText)
        ;
        (toggleButton[ii]):SetCheck(((self._viewTogglesDefault)[state])[ii - 1])
        ;
        (toggleButton[ii]):removeInputEvent("Mouse_LUp")
        ;
        (toggleButton[ii]):addInputEvent("Mouse_LUp", "Input_WorldMapSideBar_SetViewToggle(" .. ii .. ")")
        ToClient_WorldmapCheckState(ii - 1, (((self._ui).chk_viewToggles)[ii]):IsCheck(), false)
      end
    end
  end
end

WorldMapSideBarInfo.updateSearchList = function(self)
  -- function num : 0_10
  if self._searchTypeMax < 1 then
    return 
  end
  local pictograms = (self._ui).stc_searchTypePictogram
  for ii = 1, self._searchTypeMax do
    (pictograms[ii]):SetShow(false)
  end
  ;
  (pictograms[self._currentSearchNodeType]):SetShow(true)
  local loopCount = (math.max)(#(self._ui).rdo_searchedItems, self._searchResultCount)
  _PA_LOG("박범�\128", "loopCount : " .. loopCount)
  for ii = 1, loopCount do
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R7 in 'UnsetPending'

    if ii <= self._searchResultCount then
      if ((self._ui).rdo_searchedItems)[ii] == nil then
        ((self._ui).rdo_searchedItems)[ii] = (UI.getChildControl)(((self._ui).frame_searchResult):GetFrameContent(), "RadioButton_Item_" .. ii)
        -- DECOMPILER ERROR at PC80: Confused about usage of register: R7 in 'UnsetPending'

        if ((self._ui).rdo_searchedItems)[ii] == nil then
          ((self._ui).rdo_searchedItems)[ii] = (UI.createAndCopyBasePropertyControl)(((self._ui).frame_searchResult):GetFrameContent(), "RadioButton_Item", ((self._ui).frame_searchResult):GetFrameContent(), "RadioButton_Item_" .. ii)
          _PA_LOG("박범�\128", "control copied at " .. ii .. " : " .. (((self._ui).rdo_searchedItems)[ii]):GetID())
        end
        _PA_LOG("박범�\128", "control referenced at " .. ii .. " : " .. (((self._ui).rdo_searchedItems)[ii]):GetID())
      end
      local resultItem = ((self._ui).rdo_searchedItems)[ii]
      resultItem:SetShow(true)
      resultItem:SetPosY((ii - 1) * self._searchResultYGap + 11)
      resultItem:SetText(ToClient_getFindResultNameByIndex(ii - 1))
    else
      do
        do
          if ((self._ui).rdo_searchedItems)[ii] ~= nil then
            _PA_LOG("박범�\128", "turn off useless controls")
            ;
            (((self._ui).rdo_searchedItems)[ii]):SetShow(false)
          end
          -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (((self._ui).frame_searchResult):GetVScroll()):SetControlTop()
end

Input_WorldMapSideBar_SetStateTo = function(state)
  -- function num : 0_11 , upvalues : WorldMapSideBarInfo, STATE
  local self = WorldMapSideBarInfo
  self._currentState = state
  local renderState = state
  if STATE.eWMS_GUILD_WAR == state then
    renderState = STATE.eWMS_EXPLORE_PLANT
    _isBlackFog = false
    _isGuildWarMode = true
  else
    if STATE.eWMS_PRODUCT_NODE == state then
      renderState = STATE.eWMS_EXPLORE_PLANT
      _isBlackFog = true
      _isGuildWarMode = false
    else
      _isBlackFog = false
      _isGuildWarMode = false
    end
  end
  ToClient_SetGuildMode(_isGuildWarMode)
  ToClient_reloadNodeLine(_isGuildWarMode, CppEnums.WaypointKeyUndefined)
  ToClient_WorldmapStateChange(renderState)
  ToClient_setDoTerrainHide(_isBlackFog)
  self:updateStateButtons(state)
  self:updateViewTogglesByState(state)
end

Input_WorldMapSideBar_SetViewToggle = function(index)
  -- function num : 0_12 , upvalues : WorldMapSideBarInfo, STATE
  local self = WorldMapSideBarInfo
  local withSave = self._currentState == STATE.eWMS_EXPLORE_PLANT
  do
    local checkButton = (self._ui).chk_viewToggles
    ToClient_WorldmapCheckState(index - 1, (checkButton[index]):IsCheck(), withSave)
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R4 in 'UnsetPending'

    if withSave then
      ((self._viewTogglesDefault)[self._currentState])[index - 1] = (checkButton[index]):IsCheck()
    end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

Input_WorldMapSideBar_SetViewToggleWhenProductState = function(index)
  -- function num : 0_13 , upvalues : WorldMapSideBarInfo, _viewTogglesData
  local self = WorldMapSideBarInfo
  self._viewToggleWhenProductState = index
  ToClient_FilterNodeType(-1, (_viewTogglesData[index]).productNodeKey)
  self:updateViewTogglesByState(self._currentState)
end

Input_WorldMapSideBar_SearchByNodeType = function(nodeType)
  -- function num : 0_14 , upvalues : WorldMapSideBarInfo, SEARCH_BY, _nodeData
  local self = WorldMapSideBarInfo
  self._currentSearchCondition = SEARCH_BY.TYPE_OF_NODE
  self._currentSearchNodeType = nodeType
  self._searchResultCount = ToClient_FindNodeByType((_nodeData[nodeType]).key)
  self:updateSearchList()
end

PaGlobalFunc_WorldMapSideBar_IsGuildWarMode = function()
  -- function num : 0_15 , upvalues : STATE, WorldMapSideBarInfo
  do return STATE.eWMS_GUILD_WAR == WorldMapSideBarInfo._currentState end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FromClient_WorldMapSideBar_RenderStateChange = function(state)
  -- function num : 0_16 , upvalues : STATE, VIEW_TOGGLE
  if STATE.eWMS_EXPLORE_PLANT == state then
    local questShow = ToClient_isWorldmapCheckState(VIEW_TOGGLE.eCheck_Quest)
    local knowledgeShow = ToClient_isWorldmapCheckState(VIEW_TOGGLE.eCheck_Knowledge)
    local fishNChipShow = ToClient_isWorldmapCheckState(VIEW_TOGGLE.eCheck_FishnChip)
    local nodeShow = ToClient_isWorldmapCheckState(VIEW_TOGGLE.eCheck_Node)
    local tradeShow = ToClient_isWorldmapCheckState(VIEW_TOGGLE.eCheck_Trade)
    local wayShow = ToClient_isWorldmapCheckState(VIEW_TOGGLE.eCheck_Way)
    local positionShow = ToClient_isWorldmapCheckState(VIEW_TOGGLE.eCheck_Postions)
    local wagonIsShow = ToClient_isWorldmapCheckState(VIEW_TOGGLE.eCheck_Wagon)
    ToClient_worldmapNodeMangerSetShow(nodeShow)
    ToClient_worldmapBuildingManagerSetShow(true)
    ToClient_worldmapQuestManagerSetShow(questShow)
    ToClient_worldmapGuideLineSetShow(wayShow)
    ToClient_worldmapDeliverySetShow(wagonIsShow)
    ToClient_worldmapTerritoryManagerSetShow(true)
    ToClient_worldmapActorManagerSetShow(positionShow)
    ToClient_worldmapPinSetShow(positionShow)
    ToClient_worldmapGuildHouseSetShow(true, CppEnums.WaypointKeyUndefined)
    ToClient_worldmapLifeKnowledgeSetShow(fishNChipShow, CppEnums.WaypointKeyUndefined)
    ToClient_worldmapExceptionLifeKnowledgeSetShow(knowledgeShow, CppEnums.WaypointKeyUndefined)
    ToClient_worldmapTradeNpcSetShow(tradeShow, CppEnums.WaypointKeyUndefined)
    ToClient_worldmapHouseManagerSetShow(false, CppEnums.WaypointKeyUndefined)
    ToClient_SetGuildMode(PaGlobalFunc_WorldMapSideBar_IsGuildWarMode())
  else
    do
      if STATE.eWMS_REGION == state then
        ToClient_worldmapNodeMangerSetShow(false)
        ToClient_worldmapBuildingManagerSetShow(false)
        ToClient_worldmapQuestManagerSetShow(false)
        ToClient_worldmapGuideLineSetShow(false)
        ToClient_worldmapDeliverySetShow(false)
        ToClient_worldmapActorManagerSetShow(false)
        ToClient_worldmapPinSetShow(false)
        ToClient_worldmapTradeNpcSetShow(false, CppEnums.WaypointKeyUndefined)
        ToClient_worldmapHouseManagerSetShow(false, CppEnums.WaypointKeyUndefined)
        ToClient_worldmapLifeKnowledgeSetShow(fishNChipShow, CppEnums.WaypointKeyUndefined)
        ToClient_worldmapExceptionLifeKnowledgeSetShow(knowledgeShow, CppEnums.WaypointKeyUndefined)
      else
        if STATE.eWMS_LOCATION_INFO_WATER == state then
          ToClient_worldmapNodeMangerSetShow(false)
          ToClient_worldmapBuildingManagerSetShow(false)
          ToClient_worldmapQuestManagerSetShow(false)
          ToClient_worldmapGuideLineSetShow(false)
          ToClient_worldmapDeliverySetShow(false)
          ToClient_worldmapActorManagerSetShow(false)
          ToClient_worldmapPinSetShow(false)
          ToClient_worldmapTradeNpcSetShow(false, CppEnums.WaypointKeyUndefined)
          ToClient_worldmapHouseManagerSetShow(false, CppEnums.WaypointKeyUndefined)
          ToClient_worldmapLifeKnowledgeSetShow(fishNChipShow, CppEnums.WaypointKeyUndefined)
          ToClient_worldmapExceptionLifeKnowledgeSetShow(knowledgeShow, CppEnums.WaypointKeyUndefined)
        else
          if STATE.eWMS_LOCATION_INFO_CELCIUS == state then
            ToClient_worldmapNodeMangerSetShow(false)
            ToClient_worldmapBuildingManagerSetShow(false)
            ToClient_worldmapQuestManagerSetShow(false)
            ToClient_worldmapGuideLineSetShow(false)
            ToClient_worldmapDeliverySetShow(false)
            ToClient_worldmapActorManagerSetShow(false)
            ToClient_worldmapPinSetShow(false)
            ToClient_worldmapTradeNpcSetShow(false, CppEnums.WaypointKeyUndefined)
            ToClient_worldmapHouseManagerSetShow(false, CppEnums.WaypointKeyUndefined)
            ToClient_worldmapLifeKnowledgeSetShow(fishNChipShow, CppEnums.WaypointKeyUndefined)
            ToClient_worldmapExceptionLifeKnowledgeSetShow(knowledgeShow, CppEnums.WaypointKeyUndefined)
          else
            if STATE.eWMS_LOCATION_INFO_HUMIDITY == state then
              ToClient_worldmapNodeMangerSetShow(false)
              ToClient_worldmapBuildingManagerSetShow(false)
              ToClient_worldmapQuestManagerSetShow(false)
              ToClient_worldmapGuideLineSetShow(false)
              ToClient_worldmapDeliverySetShow(false)
              ToClient_worldmapActorManagerSetShow(false)
              ToClient_worldmapPinSetShow(false)
              ToClient_worldmapTradeNpcSetShow(false, CppEnums.WaypointKeyUndefined)
              ToClient_worldmapHouseManagerSetShow(false, CppEnums.WaypointKeyUndefined)
              ToClient_worldmapLifeKnowledgeSetShow(fishNChipShow, CppEnums.WaypointKeyUndefined)
              ToClient_worldmapExceptionLifeKnowledgeSetShow(knowledgeShow, CppEnums.WaypointKeyUndefined)
            end
          end
        end
      end
    end
  end
end

PaGlobalFunc_WorldMapSideBar_Close = function()
  -- function num : 0_17 , upvalues : WorldMapSideBarInfo
  WorldMapSideBarInfo:close()
end

WorldMapSideBarInfo.close = function(self)
  -- function num : 0_18 , upvalues : _panel
  _panel:SetShow(false, false)
end


