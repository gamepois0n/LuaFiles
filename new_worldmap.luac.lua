-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local ENT = CppEnums.ExplorationNodeType
local UI_color = Defines.Color
local UI_TYPE = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
local isCloseWorldMap = false
local HideAutoCompletedNaviBtn = false
local isPrevShowMainQuestPanel = false
local isPrevShowPanel = false
local isCullingNaviBtn = true
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_WorldMap}, false)
if WorldMapWindow == nil then
  WorldMapWindow = {}
end
local altKeyGuide = ToClient_getWorldmapKeyGuideUI()
-- DECOMPILER ERROR at PC42: Confused about usage of register: R14 in 'UnsetPending'

WorldMapWindow.EnumInfoNodeKeyType = {eInfoNodeKeyType_Waypoint = 0, eInfoNodeKeyType_HouseListIdx = 1, eInfoNodeKeyType_Region = 2, eInfoNodeKeyType_FixedHouseListIdx = 3}
ToClient_WorldmapRegisterShowEventFunc(true, "FGlobal_WorldmapShowAni()")
ToClient_WorldmapRegisterShowEventFunc(false, "FGlobal_WorldmapHideAni()")
FGlobal_WorldmapShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color
  local worldmapRenderUI = ToClient_getWorldmapRenderBase()
  worldmapRenderUI:ResetVertexAni()
  ToClient_WorldmapSetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  if (CppEnums.WorldMapAnimationStyle).noAnimation == (ToClient_getGameOptionControllerWrapper()):getWorldmapOpenType() then
    local aniInfo = worldmapRenderUI:addColorAnimation(0, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo:SetStartColor(UI_color.C_00FFFFFF)
    aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
    aniInfo.IsChangeChild = false
  else
    do
      if selfPlayer == nil or (selfPlayer:getRegionInfoWrapper()):isDesert() and selfPlayer:isResistDesert() == false then
        local aniInfo = worldmapRenderUI:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
        aniInfo:SetStartColor(UI_color.C_FFFFFFFF)
        aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
        aniInfo.IsChangeChild = false
      else
        do
          do
            local aniInfo = worldmapRenderUI:addColorAnimation(0, 0.8, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
            aniInfo:SetStartColor(UI_color.C_00FFFFFF)
            aniInfo:SetEndColor(2147483647)
            aniInfo.IsChangeChild = false
            aniInfo = worldmapRenderUI:addColorAnimation(0.8, 1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
            aniInfo:SetStartColor(2147483647)
            aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
            aniInfo.IsChangeChild = false
            Panel_WorldMap:ResetVertexAni()
            ToClient_WorldmapSetAlpha(0)
            audioPostEvent_SystemUi(1, 2)
          end
        end
      end
    end
  end
end

FGlobal_WorldmapHideAni = function()
  -- function num : 0_1
end

local SelectedNode = nil
local isFadeOutWindow = false
FGlobal_SelectedNode = function()
  -- function num : 0_2 , upvalues : SelectedNode
  return SelectedNode
end

Panel_NaviButton:SetShow(false)
local naviBtn = (UI.getChildControl)(Panel_NaviButton, "Button_Navi")
naviBtn:SetShow(true)
naviBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_AUTONAVITITLE"))
naviBtn:SetSize(naviBtn:GetTextSizeX() + 10, naviBtn:GetSizeY())
naviBtn:addInputEvent("Mouse_LUp", "HandleClicked_CompleteNode()")
naviBtn:addInputEvent("Mouse_On", "SimpleTooltip_NodeBtn(true)")
naviBtn:addInputEvent("Mouse_Out", "SimpleTooltip_NodeBtn(false)")
WorldMap_NaviButton_RePos = function()
  -- function num : 0_3 , upvalues : isCullingNaviBtn
  if Panel_NaviButton:IsUse() == false then
    return 
  end
  Panel_NaviButton:SetPosX((getWorldMapScenePlayerPosition()).x * getScreenSizeX() - 60)
  Panel_NaviButton:SetPosY((getWorldMapScenePlayerPosition()).y * getScreenSizeY() + 20)
  local playerModelPositionPosZ = (getWorldMapScenePlayerPosition()).z
  if playerModelPositionPosZ > 1 or playerModelPositionPosZ < 0 then
    Panel_NaviButton:SetShow(false)
  else
    if isCullingNaviBtn == false then
      Panel_NaviButton:SetShow(true)
    end
  end
end

HandleClicked_CompleteNode = function()
  -- function num : 0_4 , upvalues : isCullingNaviBtn
  ToClient_OnCompletedNodeLoop(NavigationGuideParam())
  Panel_NaviButton:SetShow(false)
  TooltipSimple_Hide()
  isCullingNaviBtn = true
end

SimpleTooltip_NodeBtn = function(isShow)
  -- function num : 0_5 , upvalues : naviBtn
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_AUTONAVITITLE")
    local desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_AUTONAVIDESC")
    local control = naviBtn
    TooltipSimple_Show(control, name, desc)
  else
    do
      TooltipSimple_Hide()
      ToClient_OnNaviRenderAsloopPath(isShow)
    end
  end
end

FromClient_DeleteNaviGuidOnTheWorldmapPanel = function()
  -- function num : 0_6
  ToClient_DeleteNaviGuideByGroup(0)
  Panel_NaviButton:SetShow(false)
end

FromClient_RClickWorldmapPanel = function(pos3D, immediately, isTopPicking)
  -- function num : 0_7 , upvalues : VCK, isCullingNaviBtn, HideAutoCompletedNaviBtn
  if immediately == false and ToClient_IsShowNaviGuideGroup(0) then
    if ((getSelfPlayer()):get()):getLevel() < 11 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_TUTORIAL_ACK"))
      return 
    end
    if isKeyPressed(VCK.KeyCode_MENU) then
      ToClient_WorldMapNaviStart(pos3D, NavigationGuideParam(), false, isTopPicking)
    else
      ToClient_DeleteNaviGuideByGroup(0)
      Panel_NaviButton:SetShow(false)
      audioPostEvent_SystemUi(0, 15)
    end
    if ToClient_WorldMapNaviIsLoopPath() == true then
      Panel_NaviButton:SetShow(false)
    end
    isCullingNaviBtn = true
    return 
  end
  if ToClient_GetMyTeamNoLocalWar() ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_LOCALWAR_CANTNAVI_ACK"))
    return 
  end
  if ((getSelfPlayer()):get()):getLevel() < 11 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_TUTORIAL_ACK"))
    return 
  end
  if isKeyPressed(VCK.KeyCode_MENU) == false then
    ToClient_DeleteNaviGuideByGroup(0)
  end
  ToClient_WorldMapNaviStart(pos3D, NavigationGuideParam(), false, isTopPicking)
  audioPostEvent_SystemUi(0, 14)
  local selfPlayer = getSelfPlayer()
  isCullingNaviBtn = true
  if ToClient_WorldMapNaviPickingIsDesert(pos3D) == false and (selfPlayer:getRegionInfoWrapper()):isDesert() == false and ToClient_WorldMapNaviIsLoopPath() == false and (selfPlayer:getRegionInfoWrapper()):isOcean() == false and ToClient_WorldMapNaviEmpty() == false and HideAutoCompletedNaviBtn == false then
    isCullingNaviBtn = false
    Panel_NaviButton:SetShow(true)
    WorldMap_NaviButton_RePos()
  end
  HideAutoCompletedNaviBtn = false
end

FromClient_WorldMapFadeOutHideUI = function(frameTime)
  -- function num : 0_8 , upvalues : UI_ANI_ADV, UI_color
  local worldmapRenderUI = ToClient_getWorldmapRenderBase()
  worldmapRenderUI:ResetVertexAni()
  local selfPlayer = getSelfPlayer()
  if (CppEnums.WorldMapAnimationStyle).noAnimation == (ToClient_getGameOptionControllerWrapper()):getWorldmapOpenType() then
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
  else
    do
      if selfPlayer == nil or (selfPlayer:getRegionInfoWrapper()):isDesert() and selfPlayer:isResistDesert() == false then
        ToClient_WorldmapSetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
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
        do
          ToClient_WorldmapSetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
          do
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
            ToClient_WorldmapSetAlpha(1)
            audioPostEvent_SystemUi(1, 3)
          end
        end
      end
    end
  end
end

FromClient_LClickedWorldMapNode = function(explorationNode)
  -- function num : 0_9 , upvalues : SelectedNode
  SelectedNode = explorationNode:FromClient_getExplorationNodeInClient()
  PaGlobal_TutorialManager:handleLClickWorldMapNode(explorationNode)
end

FromClient_NodeIsNextSiege = function(explorationNode)
  -- function num : 0_10
  explorationNode:EraseAllEffect()
  explorationNode:AddEffect("UI_ArrowMark_Diagonal01", true, 70, 80)
end

FromClient_KnowledgeWorldMapPath = function(pos3D)
  -- function num : 0_11
  local navParam = NavigationGuideParam()
  navParam._worldmapColor = float4(1, 0.55, 0.55, 0.55)
  navParam._worldmapBgColor = float4(1, 0.85, 0.85, 0.6)
  ToClient_DeleteNaviGuideByGroup(0)
  ToClient_WorldMapNaviStart(pos3D, navParam, false, true)
  audioPostEvent_SystemUi(0, 14)
end

UpdateWorldMapNode = function(node)
  -- function num : 0_12
  local plantKey = node:getPlantKey()
  local nodeKey = plantKey:getWaypointKey()
  local wayPlant = ToClient_getPlant(plantKey)
  local exploreLevel = node:getLevel()
  local affiliatedTownKey = 0
  local nodeSSW = node:getStaticStatus()
  local regionInfo = nodeSSW:getMinorSiegeRegion()
  if wayPlant ~= nil then
    affiliatedTownKey = ToClinet_getPlantAffiliatedWaypointKey(wayPlant)
  end
  FGlobal_FilterClear()
  if WorldMapArrowEffectEraseClear() ~= nil then
    WorldMapArrowEffectEraseClear()
  end
  FGlobal_ShowInfoNodeMenuPanel(node)
  WorldMapPopupManager:increaseLayer()
  WorldMapPopupManager:push(Panel_NodeMenu, true)
  if regionInfo ~= nil then
    local regionKey = regionInfo._regionKey
    local regionWrapper = getRegionInfoWrapper(regionKey:get())
    local minorSiegeWrapper = regionWrapper:getMinorSiegeWrapper()
    if minorSiegeWrapper ~= nil then
      WorldMapPopupManager:push(Panel_NodeOwnerInfo, true)
    end
  end
  do
    FGlobal_OpenOtherPanelWithNodeMenu(node, true)
    NodeName_ShowToggle(true)
  end
end

FGlobal_OpenOtherPanelWithNodeMenu = function(node, isShow)
  -- function num : 0_13
  if ToClient_WorldMapIsShow() == false then
    return 
  end
  if isShow ~= true then
    return 
  end
  if Panel_NodeMenu:IsShow() == false then
    return 
  end
  local plantKey = node:getPlantKey()
  local nodeKey = plantKey:getWaypointKey()
  local wayPlant = ToClient_getPlant(plantKey)
  local exploreLevel = node:getLevel()
  if exploreLevel > 0 and wayPlant ~= nil and wayPlant:getType() == (CppEnums.PlantType).ePlantType_Zone then
    local workingcnt = ToClient_getPlantWorkingList(plantKey)
    if workingcnt == 0 then
      local _plantKey = node:getPlantKey()
      local nod_Key = _plantKey:get()
      local explorationSSW = ToClient_getExplorationStaticStatusWrapper(nod_Key)
      if (explorationSSW:get()):isFinance() then
        FGlobal_Finance_WorkManager_Reset_Pos()
        FGlobal_Finance_WorkManager_Open(node)
      else
        FGlobal_Plant_WorkManager_Reset_Pos()
        FGlobal_Plant_WorkManager_Open(node)
      end
    else
      do
        if workingcnt == 1 then
          FGlobal_ShowWorkingProgress(node, 1)
        end
      end
    end
  end
end

FromClient_WorldMapNodeFindNearNode = function(nodeKey)
  -- function num : 0_14
  ToClient_DeleteNaviGuideByGroup(0)
  ToClient_WorldMapFindNearNode(nodeKey, NavigationGuideParam())
  audioPostEvent_SystemUi(0, 14)
end

FromClient_WorldMapNodeFindTargetNode = function(nodeKey)
  -- function num : 0_15
  local explorationSSW = ToClient_getExplorationStaticStatusWrapper(nodeKey)
  if explorationSSW == nil then
    return 
  end
  ToClient_DeleteNaviGuideByGroup(0)
  ToClient_WorldMapNaviStart((explorationSSW:get()):getPosition(), NavigationGuideParam(), false, false)
  audioPostEvent_SystemUi(0, 14)
end

FGlobal_LoadWorldMapTownSideWindow = function(nodeKey)
  -- function num : 0_16
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(nodeKey)
  if regionInfoWrapper ~= nil and (regionInfoWrapper:get()):isMainOrMinorTown() and (regionInfoWrapper:get()):hasWareHouseNpc() then
    Warehouse_OpenPanelFromWorldmap(nodeKey, (CppEnums.WarehoouseFromType).eWarehoouseFromType_Worldmap)
  end
end

FGlobal_PushOpenWorldMap = function()
  -- function num : 0_17
  if GetUIMode() == (Defines.UIMode).eUIMode_Gacha_Roulette then
    return 
  end
  if (CppEnums.worldmapRenderState).NOT_RENDER ~= ToClient_getWorldmapRenderState() then
    return 
  end
  if Panel_Casting_Bar:GetShow() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NOTOPEN_INGACTION"))
    return 
  end
  FGlobal_HideWorkerTooltip()
  FGlobal_HideDialog()
  ToClient_AddWorldMapFlush()
end

FGlobal_CloseWorldmapForLuaKeyHandling = function()
  -- function num : 0_18 , upvalues : IM
  if (Defines.UIMode).eUIMode_WoldMapSearch == GetUIMode() then
    ClearFocusEdit()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    SetUIMode((Defines.UIMode).eUIMode_WorldMap)
  end
  FGlobal_PopCloseWorldMap()
end

FGlobal_PopCloseWorldMap = function()
  -- function num : 0_19 , upvalues : isCloseWorldMap
  if ToClient_WorldMapIsShow() then
    ToClient_preCloseMap()
    Panel_NodeSiegeTooltip:SetShow(false)
    Panel_WorldMap_Tooltip:SetShow(false)
    Panel_Window_QuestNew_Show(false)
    Panel_Tooltip_SimpleText:SetShow(false)
    isCloseWorldMap = false
    Panel_NaviButton:SetShow(false)
    WorldMapArrowEffectErase()
    DeliveryCarriageInformationWindow_Close()
  end
end

FromClient_WorldMapOpen = function()
  -- function num : 0_20 , upvalues : isFadeOutWindow, IM, isPrevShowPanel, isPrevShowMainQuestPanel, isCullingNaviBtn, renderMode
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPOPENALERT_INDEAD"))
    return 
  end
  isFadeOutWindow = false
  ToClient_SaveUiInfo(false)
  if ToClient_WorldMapIsShow() then
    FGlobal_PopCloseWorldMap()
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
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  SetUIMode((Defines.UIMode).eUIMode_WorldMap)
  ToClient_openWorldMap()
  setFullSizeMode(true, (FullSizeMode.fullSizeModeEnum).Worldmap)
  FGlobal_NpcNavi_ShowRequestOuter()
  Panel_Npc_Dialog:SetShow(false)
  workerManager_Close()
  FGlobal_WarInfo_Open()
  FGlobal_NodeWarInfo_Open()
  FGlobal_WorldMapOpenForMenu()
  FGlobal_WorldMapOpenForMain()
  if ((getSelfPlayer()):get()):getLevel() >= 20 or questList_isClearQuest(654, 4) == true then
    HandleClicked_GrandWorldMap_BlackSpiritButton()
  end
  isPrevShowPanel = Panel_CheckedQuest:GetShow()
  isPrevShowMainQuestPanel = Panel_MainQuest:GetShow()
  FGlobal_QuestWidget_Close()
  FGlobal_workerChangeSkill_Close()
  if not Panel_WorkerRestoreAll:IsUISubApp() then
    workerRestoreAll_Close()
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
  isCullingNaviBtn = true
  Panel_WorldMapNaviBtn()
  Panel_Tooltip_Item_hideTooltip()
  delivery_requsetList()
  renderMode:set()
  if ToClient_WorldMapIsShow() == true then
    PaGlobal_TutorialManager:handleWorldMapOpenComplete()
  end
end

FGlobal_Worldmap_SetRenderMode = function(renderModeList)
  -- function num : 0_21 , upvalues : renderMode
  renderMode:setRenderMode(renderModeList)
end

FGlobal_Worldmap_ResetRenderMode = function()
  -- function num : 0_22 , upvalues : renderMode
  renderMode:reset()
end

Panel_WorldMapNaviBtn = function()
  -- function num : 0_23 , upvalues : isCullingNaviBtn
  if ToClient_WorldMapNaviEmpty() == false and ToClient_WorldMapNaviIsLoopPath() == false then
    isCullingNaviBtn = false
    Panel_NaviButton:SetShow(true)
    WorldMap_NaviButton_RePos()
    return 
  end
  Panel_NaviButton:SetShow(false)
end

FGlobal_OpenWorldMapWithHouse = function()
  -- function num : 0_24 , upvalues : isCloseWorldMap
  FGlobal_PushOpenWorldMap()
  local actorWrapper = interaction_getInteractable()
  ToClient_OpenWorldMapWithHouse(actorWrapper:get())
  isCloseWorldMap = false
end

FGlobal_WorldMapWindowEscape = function()
  -- function num : 0_25
  if Panel_WorkerTrade_Caravan:GetShow() then
    FGlobal_WorkerTradeCaravan_Hide()
    return 
  end
  if ToClient_WorldMapIsShow() then
    if (((Panel_HouseControl:GetShow() ~= false or Panel_LargeCraft_WorkManager:GetShow() ~= false or Panel_RentHouse_WorkManager:GetShow() ~= false or Panel_Building_WorkManager:GetShow() ~= false or Panel_House_SellBuy_Condition:GetShow() ~= false or Panel_Window_Delivery_Information:GetShow() ~= false or Panel_Window_Delivery_Request:GetShow() ~= false or Panel_Trade_Market_Graph_Window:GetShow() ~= false or (Panel_TradeMarket_EventInfo:GetShow() ~= false and Panel_TradeMarket_EventInfo:IsUISubApp() ~= true) or Worldmap_Grand_GuildHouseControl:GetShow() ~= false or Worldmap_Grand_GuildCraft:GetShow() ~= false or Panel_NodeStable:GetShow() ~= false or Panel_Window_Warehouse:GetShow() ~= false or (Panel_CheckedQuest:GetShow() ~= false and Panel_CheckedQuest:IsUISubApp() ~= true) or Panel_Window_Delivery_InformationView:GetShow() ~= false or (Panel_Window_ItemMarket:GetShow() ~= false and Panel_Window_ItemMarket:IsUISubApp() ~= true) or (Panel_WorkerManager:GetShow() ~= false and Panel_WorkerManager:IsUISubApp() ~= true) or Panel_WorldMap_MovieGuide:GetShow() ~= false or Panel_WorkerTrade:GetShow() ~= false or Panel_WorkerTrade_Caravan:GetShow() == false))) then
      ToClient_WorldMapPushEscape()
    end
    FGlobal_WarInfo_Open()
    FGlobal_NodeWarInfo_Open()
    if not WorldMapPopupManager:pop() then
      FGlobal_PopCloseWorldMap()
    end
  end
  if WorldMapPopupManager._currentMode < 0 then
    FGlobal_WorldMapCloseSubPanel()
    FGlobal_HideAll_Tooltip_Work_Copy()
  end
end

FromClient_ExitWorldMap = function()
  -- function num : 0_26 , upvalues : isCloseWorldMap
  isCloseWorldMap = true
end

FromClient_WorldMapFadeOut = function()
  -- function num : 0_27 , upvalues : isFadeOutWindow
  isFadeOutWindow = true
  ChatInput_Close()
end

FGlobal_IsFadeOutState = function()
  -- function num : 0_28 , upvalues : isFadeOutWindow
  return isFadeOutWindow
end

FGlobal_AskCloseWorldMap = function()
  -- function num : 0_29 , upvalues : isCloseWorldMap
  return isCloseWorldMap
end

local IM = CppEnums.EProcessorInputMode
FGlobal_WorldMapClose = function()
  -- function num : 0_30 , upvalues : isFadeOutWindow, renderMode, isCloseWorldMap, isPrevShowPanel, isPrevShowMainQuestPanel, IM
  FGlobal_TentTooltipHide()
  isFadeOutWindow = false
  DragManager:clearInfo()
  WorldMapPopupManager:clear()
  setFullSizeMode(false)
  renderMode:reset()
  Panel_WorldMap:ResetVertexAni()
  Panel_WorldMap:SetShow(false, false)
  ToClient_closeWorldMap()
  FGlobal_NpcNavi_ShowRequestOuter()
  setShowLine(true)
  collectgarbage("collect")
  FGlobal_WorldMapCloseSubPanel()
  FGlobal_WarInfo_Close()
  FGlobal_NodeWarInfo_Close()
  isCloseWorldMap = false
  Panel_CheckedQuest:SetShow(isPrevShowPanel)
  Panel_MainQuest:SetShow(isPrevShowMainQuestPanel)
  isPrevShowPanel = false
  isPrevShowMainQuestPanel = false
  FGlobal_workerChangeSkill_Close()
  FGlobal_TownfunctionNavi_UnSetWorldMap()
  FGlobal_HouseInstallation_MinorWar_Close()
  SetUIMode((Defines.UIMode).eUIMode_Default)
  if AllowChangeInputMode() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
  else
    SetUIMode((Defines.UIMode).eUIMode_Default)
    SetFocusChatting()
  end
  if ToClient_IsSavedUi() then
    ToClient_SaveUiInfo(false)
    ToClient_SetSavedUi(false)
  end
  FGlobal_Panel_MovieTheater640_WindowClose()
end

FGlobal_WorldMapCloseSubPanel = function()
  -- function num : 0_31 , upvalues : isCullingNaviBtn
  Panel_Window_Warehouse:SetShow(false)
  Panel_manageWorker:SetShow(false)
  Panel_Working_Progress:SetShow(false)
  FGlobal_ItemMarketItemSet_Close()
  if isNewItemmarket_chk() then
    FGolbal_ItemMarketNew_Close()
  else
    FGolbal_ItemMarket_Close()
  end
  FromClient_OutWorldMapQuestInfo()
  FromClient_OnTerritoryTooltipHide()
  NodeName_ShowToggle(false)
  if not Panel_TradeMarket_EventInfo:IsUISubApp() then
    TradeEventInfo_Close()
  end
  FGlobal_SetNodeFilter()
  isCullingNaviBtn = true
end

local eCheckState = CppEnums.WorldMapCheckState
local eWorldmapState = CppEnums.WorldMapState
FromClient_RenderStateChange = function(state)
  -- function num : 0_32 , upvalues : eWorldmapState, eCheckState
  if eWorldmapState.eWMS_EXPLORE_PLANT == state then
    local questShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Quest)
    local knowledgeShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Knowledge)
    local fishNChipShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_FishnChip)
    local nodeShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Node)
    local tradeShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Trade)
    local wayShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Way)
    local positionShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Postions)
    local wagonIsShow = ToClient_isWorldmapCheckState(eCheckState.eCheck_Wagon)
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
    ToClient_SetGuildMode(FGlobal_isGuildWarMode())
  else
    do
      if eWorldmapState.eWMS_REGION == state then
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
        if eWorldmapState.eWMS_LOCATION_INFO_WATER == state then
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
          if eWorldmapState.eWMS_LOCATION_INFO_CELCIUS == state then
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
            if eWorldmapState.eWMS_LOCATION_INFO_HUMIDITY == state then
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

local _townModeWaypointKey = nil
FromClient_SetTownMode = function(waypointKey)
  -- function num : 0_33 , upvalues : _townModeWaypointKey, eCheckState
  _townModeWaypointKey = waypointKey
  local explorationNodeInClient = ToClient_getExploratioNodeInClientByWaypointKey(waypointKey)
  if explorationNodeInClient ~= nil then
    UpdateWorldMapNode(explorationNodeInClient)
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
  Panel_WorldMap_Main:SetShow(false)
  ToClient_SetGuildMode(false)
  Panel_NodeSiegeTooltip:SetShow(false)
  FGlobal_LoadWorldMapTownSideWindow(waypointKey)
  FGlobal_WorldmapGrand_Bottom_MenuSet(waypointKey)
  FGlobal_nodeOwnerInfo_SetPosition()
  FGlobal_GrandWorldMap_SearchToWorldMapMode()
  PaGlobal_TutorialManager:handleSetTownMode(waypointKey)
end

FromClient_resetTownMode = function()
  -- function num : 0_34 , upvalues : _townModeWaypointKey
  _townModeWaypointKey = nil
  ToClient_worldmapHouseManagerSetShow(false, CppEnums.WaypointKeyUndefined)
  ToClient_worldmapGuildHouseSetShow(true, CppEnums.WaypointKeyUndefined)
  ToClient_worldmapTerritoryManagerSetShow(true)
  FGlobal_WorldMapStateMaintain()
  Panel_WorldMap_Main:SetShow(true)
  FGlobal_WorldmapGrand_Bottom_MenuSet()
  if Panel_NodeStable:GetShow() then
    StableClose_FromWorldMap()
  end
  FGlobal_nodeOwnerInfo_Close()
  ToClient_SetGuildMode(FGlobal_isGuildWarMode())
  WorldMapArrowEffectEraseClear()
  FGlobal_FilterEffectClear()
  FGlobal_GrandWorldMap_SearchToWorldMapMode()
end

FGlobal_OpenNodeStable = function()
  -- function num : 0_35 , upvalues : _townModeWaypointKey
  if _townModeWaypointKey == nil then
    return 
  end
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(_townModeWaypointKey)
  if regionInfoWrapper ~= nil and (regionInfoWrapper:get()):hasStableNpc() then
    StableOpen_FromWorldMap(_townModeWaypointKey)
  end
end

AltKeyGuide_ReSize = function()
  -- function num : 0_36 , upvalues : altKeyGuide
  local altKeyGuideTextX = altKeyGuide:GetTextSizeX() + 10
  local altKeyGuideTextY = altKeyGuide:GetTextSizeY() + 10
  altKeyGuide:SetSize(altKeyGuideTextX, altKeyGuideTextY)
end

FromClient_HideAutoCompletedNaviBtn = function(isShow)
  -- function num : 0_37 , upvalues : HideAutoCompletedNaviBtn
  HideAutoCompletedNaviBtn = isShow
end

registerEvent("FromClient_RenderStateChange", "FromClient_RenderStateChange")
registerEvent("FromClient_SetTownMode", "FromClient_SetTownMode")
registerEvent("FromClient_resetTownMode", "FromClient_resetTownMode")
registerEvent("FromClient_WorldMapOpen", "FromClient_WorldMapOpen")
registerEvent("FromClient_ExitWorldMap", "FromClient_ExitWorldMap")
registerEvent("FromClient_ImmediatelyCloseWorldMap", "FGlobal_WorldMapClose")
registerEvent("FromClient_WorldMapFadeOut", "FromClient_WorldMapFadeOut")
registerEvent("FromClient_LClickedWorldMapNode", "FromClient_LClickedWorldMapNode")
registerEvent("FromClient_NodeIsNextSiege", "FromClient_NodeIsNextSiege")
registerEvent("FromClient_WorldMapNodeUpgrade", "UpdateWorldMapNode")
registerEvent("FromClient_FillNodeInfo", "FGlobal_OpenOtherPanelWithNodeMenu")
registerEvent("FromClient_WorldMapNodeFindNearNode", "FromClient_WorldMapNodeFindNearNode")
registerEvent("FromClient_WorldMapNodeFindTargetNode", "FromClient_WorldMapNodeFindTargetNode")
registerEvent("FromClient_RClickWorldmapPanel", "FromClient_RClickWorldmapPanel")
registerEvent("FromClient_DeleteNaviGuidOnTheWorldmapPanel", "FromClient_DeleteNaviGuidOnTheWorldmapPanel")
registerEvent("FromClient_WorldMapFadeOutHideUI", "FromClient_WorldMapFadeOutHideUI")
registerEvent("FromClient_HideAutoCompletedNaviBtn", "FromClient_HideAutoCompletedNaviBtn")
registerEvent("FromClient_DeliveryRequestAck", "DeliveryRequest_UpdateRequestSlotData")
registerEvent("EventDeliveryInfoUpdate", "DeliveryInformation_UpdateSlotData")
AltKeyGuide_ReSize()
renderMode:setClosefunctor(renderMode, FGlobal_CloseWorldmapForLuaKeyHandling)

