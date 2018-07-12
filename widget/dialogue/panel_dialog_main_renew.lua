local redermode = RenderModeWrapper.new(100, {
  Defines.RenderMode.eRenderMode_Dialog
}, false)
local Panel_Dialog_Main_Info = {
  _initialize = false,
  _ui = {Panel_Dialog_Main},
  _config = {},
  _text = {},
  _pos = {},
  _space = {},
  _value = {
    ignoreShowDialog = false,
    dialogShowCheck_Once = true,
    isFirstShowTooltip = true,
    vehicleInfo_Window = false,
    isAuctionDialog = false
  },
  _isAllowTutorialPanelShow = false
}
function isVisibleButton(buttonValue)
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
  return false
end
function isVisibleAcceptButton()
  return isVisibleButton(CppEnums.DialogState.eDialogState_AcceptQuest)
end
function FGlobal_Dialog_SetAllowTutorialPanelShow(bShow)
  local self = Panel_Dialog_Main_Info
  self._isAllowTutorialPanelShow = bShow
end
function FGlobal_Dialog_IsAllowTutorialPanelShow()
  local self = Panel_Dialog_Main_Info
  return self._isAllowTutorialPanelShow
end
function Panel_Dialog_Main_Info:registerMessageHandler()
  registerEvent("onScreenResize", "FromClient_onScreenResize_MainDialog")
  registerEvent("FromClient_ShowDialog", "FromClient_ShowMainDialog")
  registerEvent("FromClient_HideDialog", "FromClient_ExitMainDialog")
  registerEvent("FromClient_VaryIntimacy_Dialog", "FromClient_VaryIntimacy_Dialog")
  registerEvent("progressEventCancelByAttacked", "FromClient_CloseMainDialogByAttacked")
  registerEvent("FromClient_CloseNpcTalkForDead", "FromClient_MainDialog_CloseDialog")
  registerEvent("FromClient_CloseNpcTradeMarketTalkForDead", "FromClient_CloseMainDialogForDetail")
  registerEvent("FromClient_CloseAllPanelWhenNpcGoHome", "FromClient_CloseAllPanelWhenNpcGoHome")
end
function Panel_Dialog_Main_Info:initialize()
  self:close()
  self._initialize = true
  self:InitValue()
  self:initControl()
  redermode:setPrefunctor(redermode, PaGlobalFunc_MainDialog_proRenderModeSet)
  redermode:setClosefunctor(redermode, PaGlobalFunc_MainDialog_RenderMode_DialogListClose)
  Panel_Dialog_Main:setGlassBackground(true)
  Panel_Dialog_Main:setFlushAble(false)
  self:registerMessageHandler()
end
function Panel_Dialog_Main_Info:InitValue()
  self._value.ignoreShowDialog = false
  self._value.isFirstShowTooltip = true
  self._value.dialogShowCheck_Once = true
  self._value.vehicleInfo_Window = false
  self._value.isAuctionDialog = false
end
function Panel_Dialog_Main_Info:initControl()
  self._ui.Panel_Dialog_Main = Panel_Dialog_Main
end
function Panel_Dialog_Main_Info:open(showAni)
  if nil == showAni then
    Panel_Dialog_Main:SetShow(true, false)
    return
  else
    Panel_Dialog_Main:SetShow(true, showAni)
  end
end
function Panel_Dialog_Main_Info:close(showAni)
  if nil == showAni then
    Panel_Dialog_Main:SetShow(false, false)
    return
  else
    Panel_Dialog_Main:SetShow(false, showAni)
  end
end
function Panel_Dialog_Main_Info:update()
  PaGlobalFunc_MainDialog_Bottom_Update()
  PaGlobalFunc_MainDialog_Quest_Update()
  PaGlobalFunc_MainDialog_Right_Update()
  PaGlobalFunc_MainDialog_Intimacy_Update()
end
function Panel_Dialog_Main_Info:perFrameUpdate()
end
function Panel_Dialog_Main_Info:setIgnoreShowDialog(value)
  self._value.ignoreShowDialog = value
end
function Panel_Dialog_Main_Info:preclosePanel_OpenMainDialog()
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
  if PaGlobalFunc_InventoryInfo_GetShow() then
    InventoryWindow_Close()
  end
  if Panel_Window_ClothInventory:GetShow() then
    ClothInventory_Close()
  end
  if Panel_Dialog_Search:IsShow() then
    searchView_Close()
  end
  if true == PaGlobalFunc_GameExit_GetShow() then
    PaGlobalFunc_GameExit_SetShow(false, false)
  end
end
function Panel_Dialog_Main_Info:hideMainDialog(isSetWait)
  if false == self._ui.Panel_Dialog_Main:IsShow() then
    return
  end
  PaGlobalFunc_MainDialog_CloseIniteValues()
  SetUIMode(Defines.UIMode.eUIMode_Default)
  hide_DialogSceneUIPanel()
  InventoryWindow_Close()
  if Panel_Window_Warehouse:GetShow() then
    Warehouse_Close()
  end
  if false == _ContentsGroup_RenewUI_Guild then
    if Panel_CreateClan:GetShow() or Panel_CreateGuild:GetShow() then
      CreateClan_Close()
    end
  else
    PaGlobalFunc_GuildPopup_Close()
    PaGlobalFunc_GuildCreate_Close()
  end
  Panel_WorkerResist_Auction:SetShow(false)
  Panel_WorkerList_Auction:SetShow(false)
  FGolbal_ItemMarketNew_Close()
  Panel_Window_ItemMarket_RegistItem:SetShow(false)
  Panel_Window_Delivery_Information:SetShow(false)
  Panel_Window_Delivery_Request:SetShow(false)
  Panel_Dialogue_Itemtake:SetShow(false)
  if true == _ContentsGroup_RenewUI_ReinforceSkill then
    PaGlobalFunc_Dialog_SkillSpecialize_Close(false)
  else
    Panel_SkillReinforce:SetShow(false)
    Panel_Window_ReinforceSkill:SetShow(false)
  end
  Panel_Worker_Auction:SetShow(false)
  Panel_Window_WorkerRandomSelect:SetShow(false)
  randomSelectHide()
  DetectPlayer_Close()
  self:closeNpcTalk(isSetWait)
  Panel_Dialog_Main:ResetVertexAni()
  searchView_Close()
  self:setIgnoreShowDialog(false)
  setShowLine(true)
  setFullSizeMode(false, FullSizeMode.fullSizeModeEnum.Dialog)
  if false == _ContentsGroup_RenewUI_Skill then
    HandleMLUp_SkillWindow_Close()
  end
  click_DeliveryForPerson_Close()
  PaGlobalFunc_Dialog_NPCShop_Close()
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
function Panel_Dialog_Main_Info:closeNpcTalk(isSetWait)
  if FGlobal_IsChecked_SkillCommand() == true then
    Panel_SkillCommand:SetShow(true)
    changePositionBySever(Panel_SkillCommand, CppEnums.PAGameUIType.PAGameUIPanel_SkillCommand, true, true, false)
  else
    Panel_SkillCommand:SetShow(false)
    changePositionBySever(Panel_SkillCommand, CppEnums.PAGameUIType.PAGameUIPanel_SkillCommand, true, true, false)
  end
  self:restoreUI()
  Dialog_clickExitReq(isSetWait)
  if true == _ContentsGroup_RenewUI_Main then
    Panel_SkillCommand:SetShow(false)
    PaGlobalFunc_MainStatusInfo_UpdateHPAndMP()
  else
    checkHpAlertPostEvent()
  end
end
function Panel_Dialog_Main_Info:restoreUI()
  SetUIMode(Defines.UIMode.eUIMode_Default)
  if self._ui.Panel_Dialog_Main:IsShow() then
    redermode:reset()
    self._ui.Panel_Dialog_Main:SetShow(false, false)
  end
  if Panel_GuildHouse_Auction:GetShow() then
    Panel_GuildHouse_Auction:SetShow(false)
  end
  local questNo = getTutorialQuestNo()
  if -1 == questNo then
    setTutorialQuestNo(-1)
  elseif 0 ~= questNo then
    Tutorial_Quest(questNo)
    setTutorialQuestNo(0)
  else
    setTutorialQuestNo(-1)
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
    changePositionBySever(Panel_SkillCommand, CppEnums.PAGameUIType.PAGameUIPanel_SkillCommand, true, true, false)
  else
    Panel_SkillCommand:SetShow(false)
    changePositionBySever(Panel_SkillCommand, CppEnums.PAGameUIType.PAGameUIPanel_SkillCommand, true, true, false)
  end
  FGlobal_RemoteControl_Hide()
  FGlobal_RemoteControl_Show(1)
  RemoteControl_Interaction_ShowToggloe(true)
end
function Panel_Dialog_Main_Info:ExitStable_VehicleInfo_Off(value)
  self._value.vehicleInfo_Window = value
  return self._value.vehicleInfo_Window
end
function Panel_Dialog_Main_Info:Resize()
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  Panel_Dialog_Main:SetSize(sizeX, sizeY)
  Panel_Dialog_Main:SetPosXY(0, 0)
end
function PaGlobalFunc_MainDialog_Open(showAni)
  Panel_Dialog_Main_Info:open(showAni)
end
function PaGlobalFunc_MainDialog_Close(showAni)
  Panel_Dialog_Main_Info:close(showAni)
end
function PaGlobalFunc_MainDialog_getIgnoreShowDialog()
  local self = Panel_Dialog_Main_Info
  return self._value.ignoreShowDialog
end
function PaGlobalFunc_MainDialog_setIgnoreShowDialog(value)
  local self = Panel_Dialog_Main_Info
  self:setIgnoreShowDialog(value)
end
function PaGlobalFunc_MainDialog_CloseMoment(showAni)
  PaGlobalFunc_MainDialog_setIgnoreShowDialog(true)
  PaGlobalFunc_MainDialog_Close()
end
function PaGlobalFunc_MainDialog_ReOpen(showAni)
  PaGlobalFunc_Dialog_Main_SetRenderMode()
  SetUIMode(Defines.UIMode.eUIMode_NpcDialog)
  Panel_Dialog_Main_Info:open(showAni)
  PaGlobalFunc_MainDialog_setIgnoreShowDialog(false)
  PaGlobalFunc_MainDialog_Bottom_Open()
  PaGlobalFunc_MainDialog_Right_ReOpen()
end
function PaGlobalFunc_MainDialog_ExecuteAfterDialogLoad()
  local _blackSpiritButtonPos = {
    eBlackSpiritButtonType_GoFirst = -1,
    eBlackSpiritButtonType_Quest = 0,
    eBlackSpiritButtonType_Enchant = 1,
    eBlackSpiritButtonType_Socket = 2,
    eBlackSpiritButtonType_Improve = 3,
    eBlackSpiritButtonType_Count = 6
  }
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  if false == dialogData:isHaveQuest() then
    _blackSpiritButtonPos.eBlackSpiritButtonType_Enchant = 0
    _blackSpiritButtonPos.eBlackSpiritButtonType_Socket = 1
    _blackSpiritButtonPos.eBlackSpiritButtonType_Improve = 2
  else
    _blackSpiritButtonPos.eBlackSpiritButtonType_Enchant = 1
    _blackSpiritButtonPos.eBlackSpiritButtonType_Socket = 2
    _blackSpiritButtonPos.eBlackSpiritButtonType_Improve = 3
  end
  local blackSpiritUiType = getBlackSpiritUiType()
  if CppEnums.EFlush_BlackSpirit_Ui_Type.eFlush_BlackSpirit_Ui_None ~= blackSpiritUiType and 0 < getBlackSpiritGrowthStep() then
    if CppEnums.EFlush_BlackSpirit_Ui_Type.eFlush_BlackSpirit_Ui_ItemEnchant == blackSpiritUiType then
      PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom(_blackSpiritButtonPos.eBlackSpiritButtonType_Enchant)
    elseif CppEnums.EFlush_BlackSpirit_Ui_Type.eFlush_BlackSpirit_Ui_Socket == blackSpiritUiType then
      PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom(_blackSpiritButtonPos.eBlackSpiritButtonType_Socket)
    elseif CppEnums.EFlush_BlackSpirit_Ui_Type.eFlush_BlackSpirit_Ui_Improve == blackSpiritUiType then
      PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom(_blackSpiritButtonPos.eBlackSpiritButtonType_Improve)
    end
  else
  end
end
function PaGlobalFunc_MainDialog_GetShow()
  return Panel_Dialog_Main:GetShow()
end
function PaGlobalFunc_MainDialog_IsShow()
  return Panel_Dialog_Main:IsShow()
end
function PaGlobalFunc_MainDialog_IsUse()
  return Panel_Dialog_Main:IsUse()
end
function PaGlobalFunc_MainDialog_Update()
  local self = Panel_Dialog_Main_Info
  self:update()
end
function PaGlobalFunc_MainDialog_OpenIniteValues()
end
function PaGlobalFunc_MainDialog_CloseIniteValues()
  local self = Panel_Dialog_Main_Info
  PaGlobalFunc_MainDialog_Bottom_InitValue()
  PaGlobalFunc_MainDialog_Quest_IsFirstReset()
  PaGlobalFunc_MainDialog_Right_InitValue()
  PaGlobalFunc_Main_Dialog_Bottom_Index_Init()
  PaGlobalFunc_MainDialog_Intimacy_InitValue()
  self._value.ignoreShowDialog = false
  self._value.isFirstShowTooltip = true
  self._value.dialogShowCheck_Once = true
  self._value.isAuctionDialog = false
  self._value.ignoreShowDialog = false
end
function PaGlobalFunc_MainDialog_MainDialogShowAni()
  audioPostEvent_SystemUi(1, 19)
  UIAni.fadeInSCR_Up(Panel_Dialog_Main)
  Inventory_PosSaveMemory()
end
function PaGlobalFunc_MainDialog_MainDialogHideAni()
  audioPostEvent_SystemUi(1, 20)
  Panel_Dialog_Main:ResetVertexAni()
  Panel_Dialog_Main:SetShowWithFade(CppEnums.PAUI_SHOW_FADE_TYPE.PAUI_ANI_TYPE_FADE_OUT)
  local Ani1 = Panel_Dialog_Main:addColorAnimation(0, 0.25, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  Ani1:SetStartColor(Defines.Color.C_FFFFFFFF)
  Ani1:SetEndColor(Defines.Color.C_00FFFFFF)
  Ani1:SetStartIntensity(3)
  Ani1:SetEndIntensity(1)
  Ani1.IsChangeChild = true
  Ani1:SetHideAtEnd(true)
  Ani1:SetDisableWhileAni(true)
end
function PaGlobalFunc_MainDialog_proRenderModeSet()
  local self = Panel_Dialog_Main_Info
end
function PaGlobalFunc_MainDialog_RenderMode_DialogListClose()
  local self = Panel_Dialog_Main_Info
  PaGlobalFunc_MainDialog_CloseMainDialogForDetail()
  self:open()
  PaGlobalFunc_MainDialog_Hide()
end
function PaGlobalFunc_MainDialog_Hide()
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
  if nil == selfPlayerWrapper then
    return
  end
  local selfPlayer = selfPlayerWrapper:get()
  if nil == selfPlayer then
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
  if true == Panel_TranslationReport:GetShow() then
    TranslationReport_Close()
  end
end
function PaGlobalFunc_MainDialog_CloseMainDialogForDetail()
  if getCustomizingManager():isShow() then
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
  if true == _ContentsGroup_RenewUI_Repair then
    if PaGlobalFunc_RepairInfo_GetShow() then
      PaGlobalFunc_RepairInfo_Close()
    end
  else
    if Panel_FixEquip:GetShow() then
      handleMClickedRepairExitButton()
      PaGlobal_Repair:repair_OpenPanel(false)
      Panel_FixEquip:SetShow(false)
      SetUIMode(Defines.UIMode.eUIMode_Default)
    end
    if Panel_Window_Repair:IsShow() and false == PaGlobal_Camp:getIsCamping() then
      Panel_FixEquip:SetShow(false)
      PaGlobal_Repair:repair_OpenPanel(false)
      return true
    end
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
  if PaGlobalFunc_Skill_GetShow() then
    PaGlobalFunc_Skill_Close()
    return true
  end
  if PaGlobalFunc_MentalGame_GetShow() then
    PaGlobalFunc_MentalGame_Close(false)
    return true
  end
  if PaGlobalFunc_Window_Knowledge_GetShow() then
    PaGlobalFunc_Window_Knowledge_Exit()
    return true
  end
  if Panel_DyeNew_CharacterController:GetShow() then
    FGlobal_Panel_DyeReNew_Hide()
    return true
  end
  if false == _ContentsGroup_RenewUI_Customization then
    if Panel_CustomizationMain:GetShow() then
      IngameCustomize_Hide()
      return true
    end
  elseif true == PaGlobalFunc_Customization_GetShow() then
    IngameCustomize_Hide()
  end
  return false
end
function PaGlobalFunc_Dialog_Main_SetRenderModeList(renderModeList)
  redermode:setRenderMode(renderModeList)
end
function PaGlobalFunc_Dialog_Main_SetRenderMode()
  redermode:set()
end
function PaGlobalFunc_Dialog_Main_ResetRenderMode()
  redermode:reset()
end
function PaGlobalFunc_Dialog_Main_CloseNpcTalk(isSetWait)
  local self = Panel_Dialog_Main_Info
  self:closeNpcTalk(isSetWait)
end
function getAuctionState()
  local self = Panel_Dialog_Main_Info
  return self._value.isAuctionDialog
end
function PaGlobalFunc_Dialog_Main_SetisAuctionDialog(value)
  local self = Panel_Dialog_Main_Info
  self._value.isAuctionDialog = value
end
function PaGlobalFunc_Dialog_Main_GetShowCheckOnce()
  local self = Panel_Dialog_Main_Info
  return self._value.dialogShowCheck_Once
end
function PaGlobalFunc_Dialog_Main_SetShowCheckOnce(value)
  local self = Panel_Dialog_Main_Info
  self._value.dialogShowCheck_Once = value
end
function PaGlobalFunc_Dialog_Main_CheckCompleteQuest(questData)
  if nil == questData then
    return
  end
  if false == dialog_isTalking() then
    return
  end
  local talker = dialog_getTalker()
  local completeNpc = questData:getCompleteNpc()
end
function FromClient_InitMainDialog()
  local self = Panel_Dialog_Main_Info
  self:initialize()
  self:Resize()
end
function FromClient_onScreenResize_MainDialog()
  local self = Panel_Dialog_Main_Info
  self:Resize()
end
function FromClient_ShowMainDialog()
  local self = Panel_Dialog_Main_Info
  PaGlobal_TutorialManager:handleBeforeShowDialog()
  FGlobal_RemoteControl_Hide()
  FGlobal_WebHelper_ForceClose()
  if CheckTutorialEnd() then
    ToClient_SaveUiInfo(false)
  end
  self:preclosePanel_OpenMainDialog()
  if true == self._value.ignoreShowDialog then
    return
  end
  local currentUIMode = GetUIMode()
  if currentUIMode ~= Defines.UIMode.eUIMode_Default and currentUIMode ~= Defines.UIMode.eUIMode_NpcDialog and currentUIMode ~= Defines.UIMode.eUIMode_NpcDialog_Dummy and currentUIMode ~= Defines.UIMode.eUIMode_ItemMarket then
    ToClient_PopDialogueFlush()
    return
  end
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    ToClient_PopDialogueFlush()
    return
  end
  if not isFullSizeModeAble(FullSizeMode.fullSizeModeEnum.Dialog) then
    ToClient_PopDialogueFlush()
    return
  else
    setFullSizeMode(true, FullSizeMode.fullSizeModeEnum.Dialog)
  end
  SetUIMode(Defines.UIMode.eUIMode_NpcDialog)
  Panel_Tooltip_Item_hideTooltip()
  Panel_SkillTooltip_Hide()
  FGlobal_BuffTooltipOff()
  Interaction_Close()
  redermode:set()
  setShowLine(false)
  PaGlobalAppliedBuffList:hide()
  if Panel_Window_Exchange:GetShow() then
    ExchangePC_MessageBox_ResponseCancel()
  end
  setShowNpcDialog(true)
  PaGlobalFunc_MainDialog_OpenIniteValues()
  PaGlobalFunc_MainDialog_Quest_Close()
  PaGlobalFunc_MainDialog_Right_Close()
  self:update()
  self:open(true)
  Panel_MovieTheater_LowLevel_WindowClose()
  if true == PaGlobalFunc_Dialog_Main_GetShowCheckOnce() then
    PaGlobalFunc_Dialog_Main_GetShowCheckOnce(false)
    PaGlobalFunc_MainDialog_ExecuteAfterDialogLoad()
  end
  PaGlobal_TutorialManager:handleShowDialog(dialogData)
end
function FromClient_ExitMainDialog(isSetWait)
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
function FromClient_MainDialog_CloseDialog()
  PaGlobalFunc_MainDialog_Hide()
end
function FromClient_VaryIntimacy_Dialog()
  if Defines.UIMode.eUIMode_NpcDialog == GetUIMode() then
    PaGlobalFunc_MainDialog_Quest_Update()
  end
end
function FromClient_CloseMainDialogByAttacked()
  redermode:reset()
end
function FromClient_CloseMainDialogForDetail()
  PaGlobalFunc_MainDialog_CloseMainDialogForDetail()
end
function FromClient_CloseAllPanelWhenNpcGoHome()
  if GetUIMode() == Defines.UIMode.eUIMode_Stable then
    StableFunction_Close()
  end
  if Panel_Window_WharfFunction:GetShow() then
    WharfFunction_Close()
  end
  if GetUIMode() == Defines.UIMode.eUIMode_Trade then
    closeNpcTrade_Basket()
  end
  if GetUIMode() == Defines.UIMode.eUIMode_Repair then
    if true == _ContentsGroup_RenewUI_Repair then
      PaGlobalFunc_RepairInfo_Close()
    else
      PaGlobal_Repair:repair_OpenPanel(false)
    end
  end
  if GetUIMode() == Defines.UIMode.eUIMode_Extraction then
    PaGlobal_Extraction:openPanel(false)
  end
  if GetUIMode() == Defines.UIMode.eUIMode_MentalGame then
    MentalGame_Hide()
  end
end
registerEvent("FromClient_luaLoadComplete", "FromClient_InitMainDialog")