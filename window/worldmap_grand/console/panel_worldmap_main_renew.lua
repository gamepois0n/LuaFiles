local Window_WorldMap_MainInfo = {
  _renderMode = RenderModeWrapper.new(100, {
    Defines.RenderMode.eRenderMode_WorldMap
  }, false),
  _isFadeOutWindow = false,
  _isClose = false,
  _isCullingnaviBtn = false,
  _isPrevShowQuestWigetPanel = false,
  _isPrevShowMainQuestPanel = false,
  _townModeWaypointKey = nil,
  _isTownMode = false
}
function PaGlobalFunc_WorldMap_SetIsTownMode(isTown)
  local self = Window_WorldMap_MainInfo
  self._isTownMode = isTown
end
function PaGlobalFunc_WorldMap_GetIsTownMode()
  local self = Window_WorldMap_MainInfo
  return self._isTownMode
end
function PaGlobalFunc_FromClient_WorldMap_UpdateWorldMapNode(node)
  local self = Window_WorldMap_MainInfo
  self:UpdateWorldMapNode(node)
end
function Window_WorldMap_MainInfo:UpdateWorldMapNode(node)
  local plantKey = node:getPlantKey()
  local nodeKey = plantKey:getWaypointKey()
  local wayPlant = ToClient_getPlant(plantKey)
  local exploreLevel = node:getLevel()
  local affiliatedTownKey = 0
  local nodeSSW = node:getStaticStatus()
  local regionInfo = nodeSSW:getMinorSiegeRegion()
  if nil ~= wayPlant then
    affiliatedTownKey = ToClinet_getPlantAffiliatedWaypointKey(wayPlant)
  end
  if nil ~= PaGlobalFunc_WorldMapSideBar_EraseArrow then
    PaGlobalFunc_WorldMapSideBar_EraseArrow()
  end
end
function PaGlobalFunc_FromClient_WorldMap_FadeOutHideUI(frameTime)
  local worldmapRenderUI = ToClient_getWorldmapRenderBase()
  worldmapRenderUI:ResetVertexAni()
  local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
  local UI_color = Defines.Color
  local selfPlayer = getSelfPlayer()
  if CppEnums.WorldMapAnimationStyle.noAnimation == ToClient_getGameOptionControllerWrapper():getWorldmapOpenType() then
    local aniInfo = worldmapRenderUI:addColorAnimation(0, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfo:SetEndColor(UI_color.C_00FFFFFF)
    aniInfo.IsChangeChild = false
    aniInfo:SetHideAtEnd(false)
    aniInfo:SetDisableWhileAni(true)
    Panel_WorldMap:ResetVertexAni()
    aniInfo = Panel_WorldMap:addColorAnimation(0, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfo:SetEndColor(UI_color.C_00FFFFFF)
    aniInfo.IsChangeChild = false
    aniInfo:SetHideAtEnd(true)
    aniInfo:SetDisableWhileAni(true)
  elseif nil == selfPlayer or selfPlayer:getRegionInfoWrapper():isDesert() and false == selfPlayer:isResistDesert() then
    ToClient_WorldmapSetShowWithFade(CppEnums.PAUI_SHOW_FADE_TYPE.PAUI_ANI_TYPE_FADE_OUT)
    local aniInfo = worldmapRenderUI:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
    aniInfo.IsChangeChild = false
    aniInfo:SetHideAtEnd(false)
    aniInfo:SetDisableWhileAni(true)
    Panel_WorldMap:ResetVertexAni()
    aniInfo = Panel_WorldMap:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
    aniInfo.IsChangeChild = false
    aniInfo:SetHideAtEnd(true)
    aniInfo:SetDisableWhileAni(true)
  else
    ToClient_WorldmapSetShowWithFade(CppEnums.PAUI_SHOW_FADE_TYPE.PAUI_ANI_TYPE_FADE_OUT)
    local aniInfo = worldmapRenderUI:addColorAnimation(0, 0.5 * frameTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfo:SetEndColor(2147483647)
    aniInfo.IsChangeChild = false
    aniInfo:SetHideAtEnd(false)
    aniInfo:SetDisableWhileAni(true)
    aniInfo = worldmapRenderUI:addColorAnimation(0.5 * frameTime, 1 * frameTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo:SetStartColor(2147483647)
    aniInfo:SetEndColor(UI_color.C_00FFFFFF)
    aniInfo.IsChangeChild = false
    aniInfo:SetHideAtEnd(true)
    aniInfo:SetDisableWhileAni(true)
    Panel_WorldMap:ResetVertexAni()
    aniInfo = Panel_WorldMap:addColorAnimation(0, 1 * frameTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
    aniInfo.IsChangeChild = false
    aniInfo:SetHideAtEnd(true)
    aniInfo:SetDisableWhileAni(true)
  end
  ToClient_WorldmapSetAlpha(1)
  audioPostEvent_SystemUi(1, 3)
end
function PaGlobalFunc_FromClient_WorldMap_FadeOut()
  local self = Window_WorldMap_MainInfo
  self._isFadeOutWindow = true
  PaGlobalFunc_ChattingInfo_Close()
end
function PaGlobalFunc_WorldMap_GetIsFadeOut()
  local self = Window_WorldMap_MainInfo
  return self._isFadeOutWindow
end
function PaGlobalFunc_FromClient_WorldMap_ReSetTownMode()
  local self = Window_WorldMap_MainInfo
  self._townModeWaypointKey = nil
  ToClient_worldmapHouseManagerSetShow(false, CppEnums.WaypointKeyUndefined)
  ToClient_worldmapGuildHouseSetShow(true, CppEnums.WaypointKeyUndefined)
  ToClient_worldmapTerritoryManagerSetShow(true)
  if true == _ContentsGroup_ForXBoxFinalCert then
    PaGlobalFunc_WorldMapSideBar_Open()
    if Panel_NodeStable:GetShow() then
      StableClose_FromWorldMap()
    end
    ToClient_SetGuildMode(PaGlobalFunc_WorldMapSideBar_IsGuildWarMode())
    PaGlobalFunc_WorldMapSideBar_EraseArrow()
    FGlobal_FilterEffectClear()
  else
    FGlobal_WorldMapStateMaintain()
    if Panel_NodeStable:GetShow() then
      StableClose_FromWorldMap()
    end
    FGlobal_nodeOwnerInfo_Close()
    ToClient_SetGuildMode(FGlobal_isGuildWarMode())
    WorldMapArrowEffectEraseClear()
    FGlobal_FilterEffectClear()
    FGlobal_GrandWorldMap_SearchToWorldMapMode()
    FGlobal_Hide_Tooltip_Work(nil, true)
  end
  PaGlobalFunc_WorldMap_SetIsTownMode(false)
  PaGlobalFunc_WorldMap_TopMenu_Open()
  PaGlobalFunc_WorldMap_RingMenu_Open()
  PaGlobalFunc_WorldMap_BottomMenu_Open()
  PaGlobalFunc_WorldMap_RightMenu_Close()
end
function PaGlobalFunc_FromClient_WorldMap_SetTownMode(waypointKey)
  local self = Window_WorldMap_MainInfo
  self._townModeWaypointKey = waypointKey
  local eCheckState = CppEnums.WorldMapCheckState
  local explorationNodeInClient = ToClient_getExploratioNodeInClientByWaypointKey(waypointKey)
  if nil ~= explorationNodeInClient then
    self:UpdateWorldMapNode(explorationNodeInClient)
  end
  FGlobal_WarInfo_Close()
  FGlobal_NodeWarInfo_Close()
  local knowledgeShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Knowledge)
  local fishNChipShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_FishnChip)
  local tradeShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Trade)
  ToClient_worldmapLifeKnowledgeSetShow(fishNChipShow, waypointKey)
  ToClient_worldmapExceptionLifeKnowledgeSetShow(knowledgeShow, waypointKey)
  ToClient_worldmapHouseManagerSetShow(true, waypointKey)
  ToClient_worldmapTradeNpcSetShow(tradeShow, waypointKey)
  ToClient_worldmapGuildHouseSetShow(true, waypointKey)
  ToClient_worldmapQuestManagerSetShow(false)
  ToClient_worldmapGuideLineSetShow(false)
  ToClient_worldmapDeliverySetShow(false)
  ToClient_worldmapTerritoryManagerSetShow(false)
  if true == _ContentsGroup_ForXBoxFinalCert then
    PaGlobalFunc_WorldMapSideBar_Close()
    PaGlobalFunc_WorldMapSideBar_RetreatToWorldMapMode()
  else
    Panel_WorldMap_Main:SetShow(false)
  end
  ToClient_SetGuildMode(false)
  Panel_NodeSiegeTooltip:SetShow(false)
  PaGlobal_TutorialManager:handleSetTownMode(waypointKey)
  PaGlobalFunc_WorldMap_SetIsTownMode(true)
  PaGlobalFunc_WorldMap_TopMenu_Open()
  PaGlobalFunc_WorldMap_BottomMenu_Open()
  WorldMapPopupManager:increaseLayer()
  WorldMapPopupManager:push(Panel_Worldmap_NodeInfo_Console, false)
end
function PaGlobalFunc_FromClient_WorldMap_Open()
  local self = Window_WorldMap_MainInfo
  if true == isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPOPENALERT_INDEAD"))
    return
  end
  PaGlobal_ConsoleWorldMapKeyGuide_SetShow(true)
  self._isFadeOutWindow = false
  ToClient_SaveUiInfo(false)
  if true == ToClient_WorldMapIsShow() then
    PaGlobalFunc_WorldMap_PopClose()
    return
  end
  if Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  if ToClient_CheckExistSummonMaid() or Panel_Window_Warehouse:GetShow() then
    Warehouse_Close()
  end
  PaGlobal_TutorialManager:handleBeforeWorldmapOpen()
  Panel_MovieTheater640_Initialize()
  SetUIMode(Defines.UIMode.eUIMode_WorldMap)
  ToClient_openWorldMap()
  setFullSizeMode(true, FullSizeMode.fullSizeModeEnum.Worldmap)
  FGlobal_NpcNavi_ShowRequestOuter()
  if true == _ContentsGroup_RenewUI_Dailog then
    PaGlobalFunc_MainDialog_Close()
  else
    Panel_Npc_Dialog:SetShow(false)
  end
  if false == _ContentsGroup_RenewUI_Worker then
    workerManager_Close()
  else
    PaGlobalFunc_WorkerManager_Close()
  end
  FGlobal_NpcNavi_Hide()
  if true == _ContentsGroup_ForXBoxFinalCert then
    PaGlobalFunc_WorldMapSideBar_Open()
  elseif false == _ContentsGroup_ForXBoxXR then
    FGlobal_WorldMapOpenForMenu()
    FGlobal_WorldMapOpenForMain()
  end
  self._isPrevShowQuestWigetPanel = Panel_CheckedQuest:GetShow()
  self._isPrevShowMainQuestPanel = Panel_MainQuest:GetShow()
  FGlobal_QuestWidget_Close()
  if false == _ContentsGroup_RenewUI_Worker then
    FGlobal_workerChangeSkill_Close()
    if not Panel_WorkerRestoreAll:IsUISubApp() then
      workerRestoreAll_Close()
    end
  end
  FGlobal_TentTooltipHide()
  if Panel_CheckedQuestInfo:GetShow() and not Panel_CheckedQuestInfo:IsUISubApp() then
    Panel_CheckedQuestInfo:SetShow(false)
  end
  FGolbal_ItemMarketNew_Close()
  if Panel_Window_ItemMarket_ItemSet:GetShow() then
    FGlobal_ItemMarketItemSet_Close()
  end
  if Panel_ChatOption:GetShow() then
    ChattingOption_Close()
  end
  Panel_WorldMapNaviBtn()
  Panel_Tooltip_Item_hideTooltip()
  delivery_requsetList()
  self._renderMode:set()
  if true == ToClient_WorldMapIsShow() then
    PaGlobal_TutorialManager:handleWorldMapOpenComplete()
  end
  if true == _ContentsGroup_ForXBoxXR and false == _ContentsGroup_ForXBoxFinalCert then
    ToClient_WorldmapCheckState(0, false, false)
    ToClient_WorldmapCheckState(1, false, false)
    ToClient_WorldmapCheckState(2, false, false)
    ToClient_WorldmapCheckState(3, true, false)
    ToClient_WorldmapCheckState(4, true, false)
    ToClient_WorldmapCheckState(5, true, false)
    ToClient_WorldmapCheckState(6, false, false)
    ToClient_WorldmapCheckState(7, false, false)
    ToClient_WorldmapCheckState(8, false, false)
  end
  PaGlobalFunc_WorldMap_TopMenu_Open()
  PaGlobalFunc_WorldMap_RingMenu_Open()
  PaGlobalFunc_WorldMap_BottomMenu_Open()
end
function PaGlobalFunc_FromClient_WorldMap_Close()
  local self = Window_WorldMap_MainInfo
  self._isClose = true
end
function PaGlobalFunc_WorldMap_CloseSubPanel()
  local self = Window_WorldMap_MainInfo
  Panel_Window_Warehouse:SetShow(false)
  if false == _ContentsGroup_RenewUI_Worker then
    Panel_manageWorker:SetShow(false)
  else
    PaGlobalFunc_WorkerManager_Close()
  end
  Panel_Working_Progress:SetShow(false)
  FGlobal_ItemMarketItemSet_Close()
  FGolbal_ItemMarketNew_Close()
  FromClient_OutWorldMapQuestInfo()
  FromClient_OnTerritoryTooltipHide()
  NodeName_ShowToggle(false)
  if not _ContentsGroup_isUsedNewTradeEventNotice and not Panel_TradeMarket_EventInfo:IsUISubApp() then
    TradeEventInfo_Close()
  end
  if true == _ContentsGroup_ForXBoxFinalCert then
    PaGlobalFunc_WorldMapSideBar_ResetFilter()
  else
    FGlobal_SetNodeFilter()
  end
  self._isCullingnaviBtn = true
end
function PaGlobalFunc_WorldMap_WindowEscape()
  if false == _ContentsGroup_RenewUI_Worker then
    if Panel_WorkerTrade_Caravan:GetShow() then
      FGlobal_WorkerTradeCaravan_Hide()
      return
    end
  else
    FGlobal_WorkerTrade_Close()
  end
  if true == PaGlobalFunc_WorldMap_RingMenu_GetIsRingMenuOpen() then
    PaGlobalFunc_WorldMap_RingMenu_SetShowRingMenu(false)
    return
  end
  if true == PaGlobalFunc_Warehouse_GetShow() then
    Warehouse_Close()
    DeliveryRequestWindow_Close()
    PaGlobalFunc_WorldMap_TopMenu_Open()
    PaGlobalFunc_WorldMap_BottomMenu_Open()
    PaGlobalFunc_WorldMap_RingMenu_Open()
    return
  end
  if true == PaGlobalFunc_WorldMap_Stable_GetShow() then
    PaGlobalFunc_WorldMap_Stable_Close()
    return
  end
  if true == PaGlobalFunc_WorldMap_BuyHouse_GetShow() then
    PaGlobalFunc_WorldMap_BuyHouse_Close()
    return
  end
  if true == ToClient_WorldMapIsShow() then
    ToClient_WorldMapPushEscape()
    if false ~= _ContentsGroup_ForXBoxXR or false == _ContentsGroup_ForXBoxFinalCert then
    end
    if not WorldMapPopupManager:pop() then
      FGlobal_PopCloseWorldMap()
    end
  end
  if 0 > WorldMapPopupManager._currentMode then
    PaGlobalFunc_WorldMap_CloseSubPanel()
    FGlobal_HideAll_Tooltip_Work_Copy()
  end
end
function PaGlobalFunc_WorldMap_GetIsClose()
  local self = Window_WorldMap_MainInfo
  return self._isClose
end
function PaGlobalFunc_WorldMap_PopClose()
  if false == ToClient_WorldMapIsShow() then
    return
  end
  ToClient_preCloseMap()
  if false == _ContentsGroup_RenewUI then
    Panel_Window_QuestNew_Show(false)
  end
  if true == _ContentsGroup_ForXBoxFinalCert then
    PaGlobalFunc_WorldMapSideBar_EraseArrow()
  else
    WorldMapArrowEffectErase()
  end
  DeliveryCarriageInformationWindow_Close()
  PaGlobalFunc_WorldMap_TopMenu_Close()
  PaGlobalFunc_WorldMap_BottomMenu_Close()
  PaGlobalFunc_WorldMap_RingMenu_Close()
  PaGlobalFunc_WorldMap_RightMenu_Close()
  PaGlobalFunc_WorldMap_Stable_Close()
  FGlobal_Hide_Tooltip_Work(nil, true)
  FGlobal_HideWorkerTooltip()
end
function PaGlobalFunc_WorldMap_CloseForLuaKeyHandling()
  if Defines.UIMode.eUIMode_WoldMapSearch == GetUIMode() then
    ClearFocusEdit()
    SetUIMode(Defines.UIMode.eUIMode_WorldMap)
  end
  PaGlobalFunc_WorldMap_PopClose()
end
function PaGlobalFunc_FromClient_WorldMap_ImmediatelyClose()
  local self = Window_WorldMap_MainInfo
  FGlobal_TentTooltipHide()
  self._isFadeOutWindow = false
  DragManager:clearInfo()
  WorldMapPopupManager:clear()
  setFullSizeMode(false)
  self._renderMode:reset()
  ToClient_closeWorldMap()
  FGlobal_NpcNavi_ShowRequestOuter()
  setShowLine(true)
  collectgarbage("collect")
  PaGlobalFunc_WorldMap_CloseSubPanel()
  PaGlobalFunc_WorldMap_TopMenu_Close()
  PaGlobalFunc_WorldMap_RingMenu_Close()
  PaGlobalFunc_WorldMap_BottomMenu_Close()
  FGlobal_WarInfo_Close()
  FGlobal_NodeWarInfo_Close()
  self._isClose = false
  Panel_CheckedQuest:SetShow(self._isPrevShowQuestWigetPanel)
  Panel_MainQuest:SetShow(self._isPrevShowMainQuestPanel)
  self._isPrevShowQuestWigetPanel = false
  self._isPrevShowMainQuestPanel = false
  if false == _ContentsGroup_RenewUI_Worker then
    FGlobal_workerChangeSkill_Close()
  else
    PaGlobalFunc_WorkerManager_Close()
  end
  FGlobal_TownfunctionNavi_UnSetWorldMap()
  FGlobal_HouseInstallation_MinorWar_Close()
  SetUIMode(Defines.UIMode.eUIMode_Default)
  CheckChattingInput()
  if ToClient_IsSavedUi() then
    ToClient_SaveUiInfo(false)
    ToClient_SetSavedUi(false)
  end
  if true == _ContentsGroup_RenewUI then
    PaGlobal_ConsoleWorldMapKeyGuide_SetShow(false)
  end
  FGlobal_Panel_MovieTheater640_WindowClose()
end
function Window_WorldMap_MainInfo:InitControl()
end
function Window_WorldMap_MainInfo:InitEvent()
  self._renderMode:setClosefunctor(self._renderMode, PaGlobalFunc_WorldMap_CloseForLuaKeyHandling)
  Panel_WorldMap:RegisterUpdateFunc("PaGlobalFunc_WorldMap_UpdatePerFrame")
end
function PaGlobalFunc_WorldMap_UpdatePerFrame(deltaTime)
  local self = Window_WorldMap_MainInfo
  if true == PaGlobalFunc_WorldMap_RingMenu_GetIsRingMenuOpen() then
    return
  end
  if true == isPadUp(__eJoyPadInputType_Y) then
    if false == PaGlobalFunc_WorldMap_TopMenu_GetShow() then
      return
    end
    if false == PaGlobalFunc_WorldMap_GetIsTownMode() then
      PaGlobalFunc_WorldMap_TopMenu_NextMenu()
    else
      PaGlobalFunc_WorldMap_TopMenu_ToggleTownMenu()
    end
  end
  if true == isPadUp(__eJoyPadInputType_RightTrigger) then
    if false == PaGlobalFunc_WorldMap_GetIsTownMode() then
      PaGlobalFunc_WorldMap_BottomMenu_UpdateWayPoint()
    else
      PaGlobalFunc_WorldMap_BottomMenu_FindNPC()
    end
  end
  if true == isPadUp(__eJoyPadInputType_RightShoulder) then
    PaGlobalFunc_WorldMap_BottomMenu_UpdateMenu(1)
  end
  if true == isPadUp(__eJoyPadInputType_LeftShoulder) then
    PaGlobalFunc_WorldMap_BottomMenu_UpdateMenu(-1)
  end
end
function Window_WorldMap_MainInfo:InitRegister()
  registerEvent("FromClient_WorldMapOpen", "PaGlobalFunc_FromClient_WorldMap_Open")
  registerEvent("FromClient_ExitWorldMap", "PaGlobalFunc_FromClient_WorldMap_Close")
  registerEvent("FromClient_ImmediatelyCloseWorldMap", "PaGlobalFunc_FromClient_WorldMap_ImmediatelyClose")
  registerEvent("FromClient_WorldMapFadeOut", "PaGlobalFunc_FromClient_WorldMap_FadeOut")
  registerEvent("FromClient_WorldMapFadeOutHideUI", "PaGlobalFunc_FromClient_WorldMap_FadeOutHideUI")
  registerEvent("FromClient_SetTownMode", "PaGlobalFunc_FromClient_WorldMap_SetTownMode")
  registerEvent("FromClient_resetTownMode", "PaGlobalFunc_FromClient_WorldMap_ReSetTownMode")
  registerEvent("FromClient_WorldMapNodeUpgrade", "PaGlobalFunc_FromClient_WorldMap_UpdateWorldMapNode")
  registerEvent("FromClint_EventChangedExplorationNode", "PaGlobalFunc_FromClient_WorldMap_ChangedExplorationNode")
  registerEvent("FromClint_EventUpdateExplorationNode", "PaGlobalFunc_FromClient_WorldMap_UpdateExplorationNode")
end
function Window_WorldMap_MainInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_FromClient_WorldMap_ChangedExplorationNode()
  ToClient_reloadNodeLine(PaGlobalFunc_WorldMap_TopMenu_GetIsGuildMode(), CppEnums.WaypointKeyUndefined)
end
function PaGlobalFunc_FromClient_WorldMap_UpdateExplorationNode()
  ToClient_reloadNodeLine(PaGlobalFunc_WorldMap_TopMenu_GetIsGuildMode(), CppEnums.WaypointKeyUndefined)
end
function PaGlobalFunc_WorldMap_Open()
  if GetUIMode() == Defines.UIMode.eUIMode_Gacha_Roulette then
    return
  end
  if CppEnums.worldmapRenderState.NOT_RENDER ~= ToClient_getWorldmapRenderState() then
    return
  end
  if Panel_Casting_Bar:GetShow() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NOTOPEN_INGACTION"))
    return
  end
  FGlobal_HideWorkerTooltip()
  PaGlobalFunc_MainDialog_Hide()
  PaGlobalFunc_ChattingInfo_Close()
  ToClient_AddWorldMapFlush()
end
function PaGlobalFunc_FromClient_WorldMap_Main_luaLoadComplete()
  local self = Window_WorldMap_MainInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_Main_luaLoadComplete")
