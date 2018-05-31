-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_dialog_main_renew.luac 

-- params : ...
-- function num : 0
PaGlobal_Dialog_Main_renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_Dialog}, false)
local Panel_Dialog_Main_Info = {_initialize = false, 
_ui = {Panel_Dialog_Main}
, 
_config = {}
, 
_text = {}
, 
_pos = {}
, 
_space = {}
, 
_value = {ignoreShowDialog = false, dialogShowCheck_Once = false, isFirstShowTooltip = true, vehicleInfo_Window = nil, isAuctionDialog = false}
, _isAllowTutorialPanelShow = false}
isVisibleButton = function(buttonValue)
  -- function num : 0_0
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData ~= nil then
    local dialogButtonCount = dialogData:getDialogButtonCount()
    for i = _dialogIndex, dialogButtonCount - 1 do
      local dialogButton = dialogData:getDialogButtonAt(i)
      if dialogButton ~= nil and buttonValue == tostring(dialogButton._linkType) then
        return true
      end
    end
  end
  do
    return false
  end
end

isVisibleAcceptButton = function()
  -- function num : 0_1
  return isVisibleButton((CppEnums.DialogState).eDialogState_AcceptQuest)
end

FGlobal_Dialog_SetAllowTutorialPanelShow = function(bShow)
  -- function num : 0_2 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  self._isAllowTutorialPanelShow = bShow
end

FGlobal_Dialog_IsAllowTutorialPanelShow = function()
  -- function num : 0_3 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  return self._isAllowTutorialPanelShow
end

Panel_Dialog_Main_Info.registerMessageHandler = function(self)
  -- function num : 0_4
  registerEvent("onScreenResize", "FromClient_onScreenResize_MainDialog")
  registerEvent("FromClient_ShowDialog", "FromClient_ShowMainDialog")
  registerEvent("FromClient_HideDialog", "FromClient_ExitMainDialog")
  registerEvent("FromClient_VaryIntimacy_Dialog", "FromClient_VaryIntimacy_Dialog")
  registerEvent("progressEventCancelByAttacked", "FromClient_CloseMainDialogByAttacked")
  registerEvent("FromClient_CloseNpcTalkForDead", "FromClient_MainDialog_CloseDialog")
  registerEvent("FromClient_CloseNpcTradeMarketTalkForDead", "FromClient_CloseMainDialogForDetail")
  registerEvent("FromClient_CloseAllPanelWhenNpcGoHome", "FromClient_CloseAllPanelWhenNpcGoHome")
end

Panel_Dialog_Main_Info.initialize = function(self)
  -- function num : 0_5
  self:close()
  self._initialize = true
  self:InitValue()
  self:initControl()
  PaGlobal_Dialog_Main_renderMode:setPrefunctor(renderMode, PaGlobalFunc_MainDialog_proRenderModeSet)
  PaGlobal_Dialog_Main_renderMode:setClosefunctor(renderMode, PaGlobalFunc_MainDialog_RenderMode_DialogListClose)
  Panel_Dialog_Main:setGlassBackground(true)
  Panel_Dialog_Main:setFlushAble(false)
  Panel_Dialog_Main:RegisterShowEventFunc(true, "PaGlobalFunc_MainDialog_MainDialogShowAni()")
  Panel_Dialog_Main:RegisterShowEventFunc(false, "PaGlobalFunc_MainDialog_MainDialogHideAni()")
  self:registerMessageHandler()
end

Panel_Dialog_Main_Info.InitValue = function(self)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._value).dialogShowCheck_Once = false
end

Panel_Dialog_Main_Info.initControl = function(self)
  -- function num : 0_7
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).Panel_Dialog_Main = Panel_Dialog_Main
end

Panel_Dialog_Main_Info.open = function(self, showAni)
  -- function num : 0_8
  if showAni == true then
    Panel_Dialog_Main:SetShow(true, true)
  else
    Panel_Dialog_Main:SetShow(true, false)
  end
end

Panel_Dialog_Main_Info.close = function(self, showAni)
  -- function num : 0_9
  if showAni == true then
    Panel_Dialog_Main:SetShow(false, true)
  else
    Panel_Dialog_Main:SetShow(false, false)
  end
end

Panel_Dialog_Main_Info.update = function(self)
  -- function num : 0_10
  PaGlobalFunc_MainDialog_Bottom_Update()
  PaGlobalFunc_MainDialog_Quest_Update()
  PaGlobalFunc_MainDialog_Right_Update()
  PaGlobalFunc_MainDialog_Intimacy_Update()
end

Panel_Dialog_Main_Info.perFrameUpdate = function(self)
  -- function num : 0_11
end

Panel_Dialog_Main_Info.setIgnoreShowDialog = function(self, value)
  -- function num : 0_12
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (self._value).ignoreShowDialog = ignoreShowDialog
end

Panel_Dialog_Main_Info.preclosePanel_OpenMainDialog = function(self)
  -- function num : 0_13
  if Panel_QuestInfo:GetShow() then
    questInfo_TooltipShow(false)
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  if FGlobal_Option_GetShow() then
    GameOption_Cancel()
    TooltipSimple_Hide()
  end
  if Panel_ColorBalance:GetShow() then
    Panel_ColorBalance_Close()
  end
  if Panel_WorkerManager:GetShow() then
    workerManager_Close()
    FGlobal_InitWorkerTooltip()
  end
  if Panel_Menu:GetShow() then
    Panel_Menu_Close()
  end
  if Panel_Window_Camp:GetShow() then
    PaGlobal_Camp:close()
  end
  DetectPlayer_Close()
  if Panel_Window_ItemMarket:GetShow() then
    FGolbal_ItemMarketNew_Close()
    if Panel_Win_System:GetShow() then
      messageBox_NoButtonUp()
    end
  end
  if (self._value).dialogShowCheck_Once == false then
    InventoryWindow_Close()
    ClothInventory_Close()
  end
  if Panel_Dialog_Search:IsShow() then
    searchView_Close()
  end
  if Panel_GameExit:IsShow() then
    Panel_GameExit:SetShow(false)
  end
end

Panel_Dialog_Main_Info.hideMainDialog = function(self, isSetWait)
  -- function num : 0_14
  if ((self._ui).Panel_Dialog_Main):IsShow() == false then
    return 
  end
  PaGlobalFunc_MainDialog_CloseIniteValues()
  SetUIMode((Defines.UIMode).eUIMode_Default)
  hide_DialogSceneUIPanel()
  InventoryWindow_Close()
  if Panel_Window_Warehouse:GetShow() then
    Warehouse_Close()
  end
  if Panel_CreateClan:GetShow() or Panel_CreateGuild:GetShow() then
    CreateClan_Close()
  end
  Panel_WorkerResist_Auction:SetShow(false)
  Panel_WorkerList_Auction:SetShow(false)
  FGolbal_ItemMarketNew_Close()
  Panel_Window_ItemMarket_RegistItem:SetShow(false)
  Panel_Window_Delivery_Information:SetShow(false)
  Panel_Window_Delivery_Request:SetShow(false)
  Panel_Dialogue_Itemtake:SetShow(false)
  Panel_SkillReinforce:SetShow(false)
  Panel_Window_ReinforceSkill:SetShow(false)
  Panel_Worker_Auction:SetShow(false)
  Panel_Window_WorkerRandomSelect:SetShow(false)
  randomSelectHide()
  DetectPlayer_Close()
  self:closeNpcTalk(isSetWait)
  Panel_Dialog_Main:ResetVertexAni()
  searchView_Close()
  self:setIgnoreShowDialog(false)
  setShowLine(true)
  setFullSizeMode(false, (FullSizeMode.fullSizeModeEnum).Dialog)
  if _ContentsGroup_RenewUI_Skill == false then
    HandleMLUp_SkillWindow_Close()
  end
  click_DeliveryForPerson_Close()
  NpcShop_WindowClose()
  FGlobal_NodeWarMenuClose()
  if isMonsterBarShow then
    Panel_Monster_Bar:SetShow(true, false)
    isMonsterBarShow = false
  end
  if isNpcNaviShow then
    isNpcNaviShow = false
  end
  FGlobal_NpcNavi_ShowRequestOuter()
  AcquireDirecteReShowUpdate()
  FGlobal_QuestWidget_UpdateList()
  PaGlobalAppliedBuffList:show()
  setShowNpcDialog(false)
  ChatInput_Close()
  if Panel_Window_Exchange:IsShow() then
    ExchangePc_MessageBox_CloseConfirm()
  end
  Panel_Interest_Knowledge_Hide()
  FGlobal_Inventory_WeightCheck()
  Inventory_PosLoadMemory()
  UIMain_QuestUpdate()
  if ToClient_IsSavedUi() then
    ToClient_SaveUiInfo(false)
    ToClient_SetSavedUi(false)
  end
end

Panel_Dialog_Main_Info.closeNpcTalk = function(self, isSetWait)
  -- function num : 0_15
  if FGlobal_IsChecked_SkillCommand() == true then
    Panel_SkillCommand:SetShow(true)
    changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, true, true, false)
  else
    Panel_SkillCommand:SetShow(false)
    changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, true, true, false)
  end
  self:restoreUI()
  Dialog_clickExitReq(isSetWait)
  checkHpAlertPostEvent()
end

Panel_Dialog_Main_Info.restoreUI = function(self)
  -- function num : 0_16
  SetUIMode((Defines.UIMode).eUIMode_Default)
  if ((self._ui).Panel_Dialog_Main):IsShow() then
    PaGlobal_Dialog_Main_renderMode:reset()
    ;
    ((self._ui).Panel_Dialog_Main):SetShow(false, false)
  end
  if Panel_GuildHouse_Auction:GetShow() then
    Panel_GuildHouse_Auction:SetShow(false)
  end
  local questNo = getTutorialQuestNo()
  if questNo == -1 then
    setTutorialQuestNo(-1)
  else
    if questNo ~= 0 then
      Tutorial_Quest(questNo)
      setTutorialQuestNo(0)
    else
      setTutorialQuestNo(-1)
    end
  end
  Inven_FindPuzzle()
  Panel_NewEquip_EffectLastUpdate()
  if self:ExitStable_VehicleInfo_Off() == true then
    Panel_ServantInfo:SetShow(false)
    Panel_CarriageInfo:SetShow(false)
    ServantInventory_Close()
  end
  self:ExitStable_VehicleInfo_Off(false)
  if FGlobal_IsChecked_SkillCommand() == true then
    Panel_SkillCommand:SetShow(true)
    changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, true, true, false)
  else
    Panel_SkillCommand:SetShow(false)
    changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, true, true, false)
  end
  FGlobal_RemoteControl_Hide()
  FGlobal_RemoteControl_Show(1)
  RemoteControl_Interaction_ShowToggloe(true)
end

Panel_Dialog_Main_Info.ExitStable_VehicleInfo_Off = function(self, value)
  -- function num : 0_17
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  (self._value).vehicleInfo_Window = value
  return (self._value).vehicleInfo_Window
end

Panel_Dialog_Main_Info.Resize = function(self)
  -- function num : 0_18
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  Panel_Dialog_Main:SetSize(sizeX, sizeY)
  Panel_Dialog_Main:SetPosXY(0, 0)
end

PaGlobalFunc_MainDialog_Open = function(showAni)
  -- function num : 0_19 , upvalues : Panel_Dialog_Main_Info
  Panel_Dialog_Main_Info:open(showAni)
end

PaGlobalFunc_MainDialog_Close = function(showAni)
  -- function num : 0_20 , upvalues : Panel_Dialog_Main_Info
  Panel_Dialog_Main_Info:close(showAni)
end

PaGlobalFunc_MainDialog_GetShow = function()
  -- function num : 0_21
  return Panel_Dialog_Main:GetShow()
end

PaGlobalFunc_MainDialog_IsShow = function()
  -- function num : 0_22
  return Panel_Dialog_Main:IsShow()
end

PaGlobalFunc_MainDialog_IsUse = function()
  -- function num : 0_23
  return Panel_Dialog_Main:IsUse()
end

PaGlobalFunc_MainDialog_Update = function()
  -- function num : 0_24 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  self:update()
end

PaGlobalFunc_MainDialog_CloseIniteValues = function()
  -- function num : 0_25 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  PaGlobalFunc_MainDialog_Bottom_InitValue()
  PaGlobalFunc_MainDialog_Quest_IsFirstReset()
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).dialogShowCheck_Once = false
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).isAuctionDialog = false
end

PaGlobalFunc_MainDialog_MainDialogShowAni = function()
  -- function num : 0_26
  audioPostEvent_SystemUi(1, 19)
  ;
  (UIAni.fadeInSCR_Up)(Panel_Dialog_Main)
  Inventory_PosSaveMemory()
end

PaGlobalFunc_MainDialog_MainDialogHideAni = function()
  -- function num : 0_27
  audioPostEvent_SystemUi(1, 20)
  Panel_Dialog_Main:ResetVertexAni()
  Panel_Dialog_Main:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local Ani1 = Panel_Dialog_Main:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  Ani1:SetStartColor(UI_color.C_FFFFFFFF)
  Ani1:SetEndColor(UI_color.C_00FFFFFF)
  Ani1:SetStartIntensity(3)
  Ani1:SetEndIntensity(1)
  Ani1.IsChangeChild = true
  Ani1:SetHideAtEnd(true)
  Ani1:SetDisableWhileAni(true)
end

PaGlobalFunc_MainDialog_setIgnoreShowDialog = function(value)
  -- function num : 0_28 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  self:setIgnoreShowDialog()
end

PaGlobalFunc_MainDialog_proRenderModeSet = function()
  -- function num : 0_29 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).dialogShowCheck_Once = true
  _PA_LOG("mingu", "dialogShowCheck_Once set")
end

PaGlobalFunc_MainDialog_RenderMode_DialogListClose = function()
  -- function num : 0_30 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  PaGlobalFunc_MainDialog_CloseMainDialogForDetail()
  self:Open()
  PaGlobalFunc_MainDialog_Hide()
end

PaGlobalFunc_MainDialog_Hide = function()
  -- function num : 0_31 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  if Panel_Win_System:GetShow() then
    return 
  end
  Auto_NotifyChangeDialog()
  PaGlobalFunc_MainDialog_CloseIniteValues()
  ToClient_PopDialogueFlush()
  FromClient_WarehouseUpdate()
  inventory_FlushRestoreFunc()
  PaGlobal_ExtractionResult:setHide()
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local selfPlayer = selfPlayerWrapper:get()
  if selfPlayer == nil then
    return 
  end
  if selfPlayer:getLevel() < 5 then
    Panel_Chat0:SetShow(false)
  end
  FGlobal_NewLocalWar_Show()
  PaGlobal_TutorialManager:handleAfterAndPopFlush()
  FGlobal_RemoteControl_Hide()
  FGlobal_RemoteControl_Show(1)
  RemoteControl_Interaction_ShowToggloe(true)
  if Panel_TranslationReport:GetShow() == true then
    TranslationReport_Close()
  end
end

PaGlobalFunc_MainDialog_CloseMainDialogForDetail = function()
  -- function num : 0_32
  if (getCustomizingManager()):isShow() then
    HandleClicked_CloseIngameCustomization()
    return true
  end
  if Panel_Npc_Trade_Market:IsShow() then
    closeNpcTrade_Basket()
    return true
  end
  if Panel_Window_StableFunction:IsShow() then
    StableFunction_Close()
    return true
  end
  if Panel_FixEquip:GetShow() then
    handleMClickedRepairExitButton()
    PaGlobal_Repair:repair_OpenPanel(false)
    Panel_FixEquip:SetShow(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
  if Panel_Window_Repair:IsShow() and PaGlobal_Camp:getIsCamping() == false then
    Panel_FixEquip:SetShow(false)
    PaGlobal_Repair:repair_OpenPanel(false)
    return true
  end
  if Panel_Window_GuildStableFunction:IsShow() then
    GuildStableFunction_Close()
    return true
  end
  if Panel_Window_ItemMarket_Function:GetShow() then
    FGolbal_ItemMarket_Function_Close()
    if Panel_Window_ItemMarket_RegistItem:GetShow() then
      FGlobal_ItemMarketRegistItem_Close()
    end
    if Panel_Window_ItemMarket_BuyConfirm:GetShow() then
      FGlobal_ItemMarket_BuyConfirm_Close()
      return true
    end
    if Panel_Window_ItemMarket_ItemSet:GetShow() then
      FGlobal_ItemMarketItemSet_Close()
    end
    if Panel_Window_ItemMarket:GetShow() then
      FGolbal_ItemMarketNew_Close()
    end
    return true
  end
  if Panel_Window_WharfFunction:GetShow() then
    WharfFunction_Close()
    return true
  end
  if Panel_Window_GuildWharfFunction:GetShow() then
    GuildWharfFunction_Close()
    return true
  end
  if Panel_FixEquip:GetShow() then
    FixEquip_Close()
    return true
  end
  if Panel_Knowledge_Main:GetShow() then
    Panel_Knowledge_Hide()
    return true
  end
  if Panel_DyeNew_CharacterController:GetShow() then
    FGlobal_Panel_DyeReNew_Hide()
    return true
  end
  if Panel_CustomizationMain:GetShow() then
    IngameCustomize_Hide()
    return true
  end
  return false
end

PaGlobalFunc_Dialog_Main_SetRenderModeList = function(renderModeList)
  -- function num : 0_33
  PaGlobal_Dialog_Main_renderMode:setRenderMode(renderModeList)
end

PaGlobalFunc_Dialog_Main_SetRenderMode = function()
  -- function num : 0_34
  PaGlobal_Dialog_Main_renderMode:set()
end

PaGlobalFunc_Dialog_Main_ResetRenderMode = function()
  -- function num : 0_35
  PaGlobal_Dialog_Main_renderMode:reset()
end

PaGlobalFunc_Dialog_Main_CloseNpcTalk = function(isSetWait)
  -- function num : 0_36 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  self:closeNpcTalk(isSetWait)
end

getAuctionState = function()
  -- function num : 0_37 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  return (self._value).isAuctionDialog
end

PaGlobalFunc_Dialog_Main_SetisAuctionDialog = function(value)
  -- function num : 0_38 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).isAuctionDialog = value
end

FromClient_InitMainDialog = function()
  -- function num : 0_39 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  self:initialize()
  self:Resize()
end

FromClient_onScreenResize_MainDialog = function()
  -- function num : 0_40 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  self:Resize()
end

FromClient_ShowMainDialog = function()
  -- function num : 0_41 , upvalues : Panel_Dialog_Main_Info
  local self = Panel_Dialog_Main_Info
  PaGlobal_TutorialManager:handleBeforeShowDialog()
  FGlobal_RemoteControl_Hide()
  FGlobal_WebHelper_ForceClose()
  if CheckTutorialEnd() then
    ToClient_SaveUiInfo(false)
  end
  self:preclosePanel_OpenMainDialog()
  local isShow = Panel_GameExit:IsShow()
  if isShow == true then
    Panel_GameExit:SetShow(false)
  end
  if (self._value).ignoreShowDialog == true then
    return 
  end
  if GetUIMode() ~= (Defines.UIMode).eUIMode_Default and GetUIMode() ~= (Defines.UIMode).eUIMode_NpcDialog and GetUIMode() ~= (Defines.UIMode).eUIMode_NpcDialog_Dummy and GetUIMode() ~= (Defines.UIMode).eUIMode_ItemMarket then
    ToClient_PopDialogueFlush()
    return 
  end
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    ToClient_PopDialogueFlush()
    return 
  end
  if not isFullSizeModeAble((FullSizeMode.fullSizeModeEnum).Dialog) then
    ToClient_PopDialogueFlush()
    return 
  else
    setFullSizeMode(true, (FullSizeMode.fullSizeModeEnum).Dialog)
  end
  SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  Panel_Tooltip_Item_hideTooltip()
  Panel_SkillTooltip_Hide()
  FGlobal_BuffTooltipOff()
  Interaction_Close()
  PaGlobal_Dialog_Main_renderMode:set()
  setShowLine(false)
  PaGlobalAppliedBuffList:hide()
  if Panel_Window_Exchange:GetShow() then
    ExchangePC_MessageBox_ResponseCancel()
  end
  setShowNpcDialog(true)
  -- DECOMPILER ERROR at PC119: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).isFirstShowTooltip = true
  self:update()
  Panel_Dialog_Main:SetShow(true, true)
  Panel_MovieTheater_LowLevel_WindowClose()
  PaGlobal_TutorialManager:handleShowDialog(dialogData)
end

FromClient_ExitMainDialog = function(isSetWait)
  -- function num : 0_42 , upvalues : Panel_Dialog_Main_Info
  QuickSlot_UpdateData()
  FGlobal_QuestWidget_CalcScrollButtonSize()
  FGlobal_QuestWidget_UpdateList()
  PaGlobal_TutorialManager:handleClickedExitButton(dialog_getTalker())
  local self = Panel_Dialog_Main_Info
  self:hideMainDialog(isSetWait)
  ServantInfo_Close()
  CarriageInfo_Close()
  ServantInventory_Close()
  FGlobal_RaceInfo_Hide()
  GuildServantList_Close()
  LordMenu_Hide()
  PaGlobal_MasterpieceAuction:close()
end

FromClient_MainDialog_CloseDialog = function()
  -- function num : 0_43
  PaGlobalFunc_MainDialog_Hide()
end

FromClient_VaryIntimacy_Dialog = function()
  -- function num : 0_44
  if (Defines.UIMode).eUIMode_NpcDialog == GetUIMode() then
    PaGlobalFunc_MainDialog_Quest_Update()
  end
end

FromClient_CloseMainDialogByAttacked = function()
  -- function num : 0_45
  PaGlobal_Dialog_Main_renderMode:reset()
end

FromClient_CloseMainDialogForDetail = function()
  -- function num : 0_46
  PaGlobalFunc_MainDialog_CloseMainDialogForDetail()
end

FromClient_CloseAllPanelWhenNpcGoHome = function()
  -- function num : 0_47
  if GetUIMode() == (Defines.UIMode).eUIMode_Stable then
    StableFunction_Close()
  end
  if Panel_Window_WharfFunction:GetShow() then
    WharfFunction_Close()
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Trade then
    closeNpcTrade_Basket()
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Repair then
    PaGlobal_Repair:repair_OpenPanel(false)
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Extraction then
    PaGlobal_Extraction:openPanel(false)
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_MentalGame then
    MentalGame_Hide()
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_InitMainDialog")

