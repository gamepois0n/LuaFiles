local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local UIMode = Defines.UIMode
local fastPinDelta = 0
function PaGlobal_GlobalKeyBinder.Process_GameMode()
  DragManager:clearInfo()
  if Panel_UIControl:IsShow() then
    Panel_UIControl_SetShow(false)
    Panel_Menu_ShowToggle()
  end
  if false == _ContentsGroup_RenewUI_Party and Panel_PartyOption:GetShow() then
    PartyOption_Hide()
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Housing(deltaTime)
  if Panel_House_InstallationMode_VillageTent:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    VillageTent_Close()
    return
  elseif Panel_Housing_FarmInfo_New:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    PAHousing_FarmInfo_Close()
    return
  elseif Panel_House_InstallationMode_ObjectControl:GetShow() and housing_isBuildMode() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_HouseInstallationControl_Move()
    return
  elseif Panel_House_InstallationMode_ObjectControl:GetShow() and not housing_isBuildMode() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_HouseInstallationControl_Close()
    return
  elseif Panel_House_InstallationMode_ObjectControl:GetShow() and not housing_isBuildMode() and true == FGlobal_HouseInstallationControl_IsConfirmStep() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
    FGlobal_HouseInstallationControl_Confirm()
    return
  elseif not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_Housing_CancelModeFromKeyBinder()
    return
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Mental(deltaTime)
  if not getEscHandle() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_MentalKnowledge)) then
    if false == _ContentsGroup_RenewUI_Knowledge then
      Panel_Knowledge_Hide()
    else
      PaGlobalFunc_Window_Knowledge_Exit()
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_MentalGame(deltaTime)
  if false == _ContentsGroup_RenewUI_MentalGame then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_LEFT) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_A) then
      MentalKnowledge_CardRotation_Left()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RIGHT) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_D) then
      MentalKnowledge_CardRotation_Right()
    end
    if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      MentalGame_Hide()
      SetUIMode(Defines.UIMode.eUIMode_NpcDialog)
    end
  elseif false == getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    PaGlobalFunc_MentalGame_Close()
    SetUIMode(Defines.UIMode.eUIMode_NpcDialog)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_NpcDialog(deltaTime)
  if true == _ContentsGroup_RenewUI_Dailog then
    if keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_Interaction) then
      if PaGlobalFunc_Dialog_NPCShop_GetShow() then
        return
      end
      if Panel_DetectPlayer:GetShow() then
        return
      end
      if Panel_CreateGuild:GetShow() then
        return
      end
      if Panel_GuildHouse_Auction:GetShow() then
        return
      end
    end
  elseif keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_Interaction) then
    if Panel_Window_NpcShop:GetShow() then
      return
    end
    local _uiNextButton = UI.getChildControl(Panel_Npc_Dialog, "Button_Next")
    if Panel_DetectPlayer:GetShow() then
      return
    end
    if Panel_CreateGuild:GetShow() then
      return
    end
    if Panel_GuildHouse_Auction:GetShow() then
      return
    end
    if _uiNextButton:GetShow() then
      HandleClickedDialogNextButton()
      audioPostEvent_SystemUi(0, 0)
    elseif isShowReContactDialog() then
      HandleClickedDialogButton(0)
      audioPostEvent_SystemUi(0, 0)
    elseif isShowDialogFunctionQuest() then
      HandleClickedFuncButton(0)
      audioPostEvent_SystemUi(0, 0)
      return
    elseif -1 < questDialogIndex() then
      HandleClickedDialogButton(questDialogIndex())
      audioPostEvent_SystemUi(0, 0)
    elseif -1 < exchangalbeButtonIndex() then
      HandleClickedDialogButton(exchangalbeButtonIndex())
      audioPostEvent_SystemUi(0, 0)
    end
    return
  end
  if FGlobal_CehckedGuildEditUI(GetFocusEdit()) then
    if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      handleClicked_GuildCreateCancel()
    end
    return
  end
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_MasterpieceAuction:GetShow() then
      PaGlobal_MasterpieceAuction:close()
      if true == _ContentsGroup_RenewUI_Dailog then
        PaGlobalFunc_MainDialog_ReOpen()
      end
      return
    end
    if Panel_EnchantExtraction:GetShow() then
      Panel_EnchantExtraction_Close()
      if true == _ContentsGroup_RenewUI_Dailog then
        PaGlobalFunc_MainDialog_ReOpen()
      end
      return
    end
    if Panel_Window_ServantInventory:GetShow() and Panel_Window_Warehouse:GetShow() then
      ServantInventory_Close()
      if true == _ContentsGroup_RenewUI_Dailog then
        PaGlobalFunc_MainDialog_ReOpen()
      end
      return
    end
    if true == _ContentsGroup_RenewUI_SpiritEnchant then
      if true == Panel_Window_Enchant_Renew:GetShow() then
        if true == PaGlobalFunc_EnchantInfo_OnPadB() then
          PaGlobalFunc_MainDialog_ReOpen()
        end
        return
      end
      if true == PaGlobalFunc_SocketInfo_GetShow() then
        if true == PaGlobalFunc_SocketInfo_OnPadB() then
          PaGlobalFunc_MainDialog_ReOpen()
        end
        return
      end
      if true == PaGlobalFunc_ImprovementInfo_GetShow() then
        if true == PaGlobalFunc_ImprovementInfo_Discard() then
          PaGlobalFunc_MainDialog_ReOpen()
        end
        return
      end
    elseif Panel_Window_Enchant:GetShow() then
      PaGlobal_Enchant:enchantClose()
      return
    end
    if true == _ContentsGroup_RenewUI_Worker then
      if true == Panel_Dialog_RandomWorker:GetShow() then
        FGlobalFunc_Close_RandomWorker()
        return
      end
      if true == Panel_Dialog_WorkerContract:GetShow() then
        FGlobalFunc_Cancel_WorkerContract()
        return
      end
      if true == Panel_Dialog_WorkerTrade_Renew:GetShow() then
        FGlobal_WorkerTrade_Close()
        return
      end
    end
    if true == _ContentsGroup_RenewUI_NpcShop and true == PaGlobalFunc_Dialog_NPCShop_GetShow() then
      PaGlobalFunc_Dialog_NPCShop_Close()
      PaGlobalFunc_MainDialog_ReOpen()
      return
    end
    if true == _ContentsGroup_RenewUI_Dailog and true == PaGlobalFunc_MainDialog_Quest_GetShow() then
      PaGlobalFunc_MainDialog_Quest_Close()
      PaGlobalFunc_MainDialog_Right_ReOpen()
      return
    end
    if true == _ContentsGroup_RenewUI_Detect and true == PaGlobalFunc_DetectPlayer_GetShow() then
      PaGlobalFunc_DetectPlayer_Exit()
      return
    end
    if check_ShowWindow() then
      close_WindowPanelList()
      if true == _ContentsGroup_RenewUI_Dailog then
        PaGlobalFunc_MainDialog_ReOpen()
      elseif Panel_Npc_Quest_Reward:GetShow() then
        FGlobal_HideDialog()
      end
    elseif true == _ContentsGroup_RenewUI_Dailog then
      PaGlobalFunc_MainDialog_Hide()
    else
      FGlobal_HideDialog()
    end
    if false == _ContentsGroup_RenewUI_StableInfo then
      ServantInfo_Close()
      CarriageInfo_Close()
    else
      PaGlobalFunc_ServantInfo_Exit()
    end
    ServantInventory_Close()
    return
  end
  if GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_Inventory) and getAuctionState() then
    local isInvenOpen = Panel_Window_Inventory:IsShow()
    if isInvenOpen == false then
      InventoryWindow_Show()
      Inventory_SetFunctor(nil, nil, nil, nil)
      return
    end
    if Panel_Window_Inventory ~= nil then
      InventoryWindow_Close()
      return
    end
  end
  if Panel_Dialog_Search:GetShow() then
    if isKeyPressed(VCK.KeyCode_A) then
      searchView_PushLeft()
    elseif isKeyPressed(VCK.KeyCode_S) then
      searchView_PushBottom()
    elseif isKeyPressed(VCK.KeyCode_D) then
      searchView_PushRight()
    elseif isKeyPressed(VCK.KeyCode_W) then
      searchView_PushTop()
    elseif isKeyPressed(VCK.KeyCode_Q) then
      searchView_ZoomIn()
    elseif isKeyPressed(VCK.KeyCode_E) then
      searchView_ZoomOut()
    end
    searchView_CheckDistance()
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)) then
    FGlobal_ItemMarketRegistItem_RegistDO()
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Trade(deltaTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    closeNpcTrade_Basket()
    TooltipSimple_Hide()
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_WorldMap(deltaTime)
  if false == _ContentsGroup_RenewUI_WorldMap then
    if FGlobal_IsFadeOutState() then
      return
    end
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if false == _ContentsGroup_RenewUI and Panel_Window_Quest_New:GetShow() and Panel_Window_Quest_New:IsUISubApp() == false then
        Panel_Window_QuestNew_Show(false)
        return
      end
      if Panel_ItemMarket_BidDesc:GetShow() then
        Panel_ItemMarket_BidDesc_Hide()
        return
      end
      if Panel_Window_ItemMarket:GetShow() and Panel_Window_ItemMarket:IsUISubApp() == false then
        FGolbal_ItemMarketNew_Close()
        return
      end
      if Panel_Window_ItemMarket_ItemSet:GetShow() then
        FGlobal_ItemMarketItemSet_Close()
        return
      end
      if Panel_MovieWorldMapGuide_Web:GetShow() then
        PaGlobal_MovieGuide_Weblist:Close()
        return
      end
      FGlobal_WorldMapWindowEscape()
    elseif FGlobal_AskCloseWorldMap() then
      FGlobal_PopCloseWorldMap()
    elseif GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_Chat) then
      if false == _ContentsGroup_RenewUI_Chatting then
        if not Panel_Window_ItemMarket:GetShow() then
          ChatInput_Show()
          return
        else
          return
        end
      end
    elseif GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_WorldMap) then
      FGlobal_CloseWorldmapForLuaKeyHandling()
      return
    end
    if FGlobal_isOpenItemMarketBackPage() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) and false == FGlobal_isItemMarketBuyConfirm() then
      FGlobal_HandleClicked_ItemMarketBackPage()
    end
    if (isGameTypeKorea() or isGameTypeJapan() or isGameTypeRussia()) and getContentsServiceType() ~= CppEnums.ContentsServiceType.eContentsServiceType_CBT and GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_ProductionNote) then
      if nil ~= Panel_ProductNote then
        Panel_ProductNote_ShowToggle()
      end
      return
    end
    if isKeyPressed(VCK.KeyCode_CONTROL) then
      ToClient_showWorldmapKeyGuide(true)
    elseif isKeyPressed(VCK.KeyCode_SHIFT) then
      ToClient_showWorldmapKeyGuide(true)
    elseif isKeyPressed(VCK.KeyCode_MENU) then
      ToClient_showWorldmapKeyGuide(true)
    else
      ToClient_showWorldmapKeyGuide(false)
    end
  else
    if PaGlobalFunc_WorldMap_GetIsFadeOut() then
      return
    end
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if Panel_ItemMarket_BidDesc:GetShow() then
        Panel_ItemMarket_BidDesc_Hide()
        return
      end
      if Panel_Window_ItemMarket:GetShow() and Panel_Window_ItemMarket:IsUISubApp() == false then
        FGolbal_ItemMarketNew_Close()
        return
      end
      if Panel_Window_ItemMarket_ItemSet:GetShow() then
        FGlobal_ItemMarketItemSet_Close()
        return
      end
      if Panel_MovieWorldMapGuide_Web:GetShow() then
        PaGlobal_MovieGuide_Weblist:Close()
        return
      end
      PaGlobalFunc_WorldMap_WindowEscape()
    elseif PaGlobalFunc_WorldMap_GetIsClose() then
      PaGlobalFunc_WorldMap_PopClose()
    elseif GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_WorldMap) then
      PaGlobalFunc_WorldMap_CloseForLuaKeyHandling()
      return
    end
    if FGlobal_isOpenItemMarketBackPage() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) and false == FGlobal_isItemMarketBuyConfirm() then
      FGlobal_HandleClicked_ItemMarketBackPage()
    end
    if (isGameTypeKorea() or isGameTypeJapan() or isGameTypeRussia()) and getContentsServiceType() ~= CppEnums.ContentsServiceType.eContentsServiceType_CBT and GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_ProductionNote) then
      if nil ~= Panel_ProductNote then
        Panel_ProductNote_ShowToggle()
      end
      return
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_WorldMapSearch(deltaTime)
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    ClearFocusEdit()
    if ToClient_WorldMapIsShow() then
      SetUIMode(Defines.UIMode.eUIMode_WorldMap)
    else
      SetUIMode(Defines.UIMode.eUIMode_Default)
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Stable(deltaTime)
  if false == _ContentsGroup_RenewUI_Stable then
    if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if CppEnums.ServantType.Type_Vehicle == stable_getServantType() and -1 == FGlobal_IsButtonClick() then
        if Panel_IngameCashShop_EasyPayment:IsShow() then
          PaGlobal_EasyBuy_Close()
        elseif Panel_Window_StableMarket:GetShow() then
          StableMarket_Close()
        elseif Panel_Window_StableMating:GetShow() then
          StableMating_Close()
        elseif Panel_Window_StableMix:GetShow() then
          StableMix_Close()
        elseif Panel_Window_StableStallion:GetShow() then
          StableStallion_Close()
        elseif Panel_AddToCarriage:GetShow() then
          stableCarriage_Close()
        elseif Panel_Window_Inventory:GetShow() and not Panel_Window_Inventory:IsUISubApp() then
          InventoryWindow_Close()
        else
          StableFunction_Close()
          GuildStableFunction_Close()
        end
      elseif CppEnums.ServantType.Type_Ship == stable_getServantType() then
        WharfFunction_Close()
        GuildWharfFunction_Close()
      end
    end
  elseif not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if CppEnums.ServantType.Type_Vehicle == stable_getServantType() then
      if true == PaGlobalFunc_StableFunction_closeStablSubPanelOnce() then
        return
      end
      StableFunction_Close()
    elseif CppEnums.ServantType.Type_Ship == stable_getServantType() then
      if true == PaGlobalFunc_WharfFunction_closeWharfSubPanelOnce() then
        return
      end
      WharfFunction_Close()
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_MiniGame(deltaTime)
  local MiniGame_BattleGauge_Space = Panel_BattleGauge:IsShow()
  local MiniGame_FillGauge_Mouse = Panel_FillGauge:IsShow()
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    close_WindowPanelList()
    if Panel_Window_DailyStamp:GetShow() then
      DailStamp_Hide()
      return
    end
  end
  if MiniGame_FillGauge_Mouse then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_LBUTTON) then
      FillGauge_UpdateGauge(deltaTime, true)
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RBUTTON) then
      FillGauge_UpdateGauge(deltaTime, false)
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_DeadMessage(deltaTime)
  if GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_Chat) then
    ChatInput_Show()
    return
  end
  if GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_Guild) then
    local guildWrapper = ToClient_GetMyGuildInfoWrapper()
    if nil ~= guildWrapper then
      local guildGrade = guildWrapper:getGuildGrade()
      if 0 == guildGrade then
        if false == Panel_ClanList:IsShow() then
          audioPostEvent_SystemUi(1, 36)
          FGlobal_ClanList_Open()
        else
          audioPostEvent_SystemUi(1, 31)
          FGlobal_ClanList_Close()
        end
      elseif false == Panel_Window_Guild:IsShow() and not Panel_DeadMessage:GetShow() then
        audioPostEvent_SystemUi(1, 36)
        GuildManager:Show()
      else
        audioPostEvent_SystemUi(1, 31)
        GuildManager:Hide()
      end
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NO_GUILD"))
    end
  end
  if false == _ContentsGroup_RenewUI_DeadMessage then
    if Panel_DeadMessage:GetShow() then
      GuildManager:Hide()
    end
  else
    if Panel_DeadMessage_Renew:GetShow() then
      GuildManager:Hide()
    end
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      PaGlobalFunc_ResurrerectionItem_Close()
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_PreventMoveNSkill(deltaTime)
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Movie(deltaTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if check_ShowWindow() then
      close_WindowPanelList()
      return
    elseif Panel_UIControl:IsShow() then
      Panel_UIControl_SetShow(false)
      Panel_Menu_ShowToggle()
      return
    else
      Panel_UIControl_SetShow(true)
      Panel_Menu_ShowToggle()
      return
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_GameExit(deltaTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if false == _ContentsGroup_RenewUI_ExitGame then
      if true == Panel_Window_DeliveryForGameExit:GetShow() then
        FGlobal_DeliveryForGameExit_Show(false)
        return
      elseif true == Panel_Event_100Day:GetShow() then
        FGlobal_Event_100Day_Close()
      elseif true == Panel_ChannelSelect:GetShow() then
        FGlobal_ChannelSelect_Hide()
      else
        GameExitShowToggle(false)
      end
    else
      if true == PaGlobalFunc_GameExitConfirm_GetShow() then
        PaGlobalFunc_GameExitConfirm_SetShow(false, false)
        return
      end
      if true == Panel_ChannelSelect:GetShow() then
        FGlobal_ChannelSelect_Hide()
        return
      end
      if true == PaGlobalFunc_GameExit_GetShow() then
        PaGlobalFunc_GameExit_SetShow(false, false)
      end
      if true == PaGlobalFunc_GameExitCharMove_GetShow() then
        PaGlobalFunc_GameExitCharMove_SetShow(false, false)
      end
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Repair(deltaTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if true == _ContentsGroup_RenewUI_Repair then
      if true == Panel_FixMaxEndurance_Renew:GetShow() then
        PaGlobalFunc_FixMaxEnduranceInfo_OnPadB()
      elseif true == Panel_Repair_Renew:GetShow() then
        PaGlobalFunc_RepairInfo_OnPadB()
      end
    elseif Panel_FixEquip:GetShow() then
      PaGlobal_FixEquip:fixEquipExit()
    else
      PaGlobal_Repair:RepairExit()
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ActionKey(deltaTime)
  local isEnd = false
  local inputType
  if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
    inputType = PaGlobal_Option:GetKeyCustomInputType()
  else
    inputType = KeyCustom_Action_GetInputType()
  end
  if nil == inputType or inputType < 0 then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    return
  end
  if isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
    isEnd = true
  elseif isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_DELETE) then
    keyCustom_Clear_ActionKey(inputType)
    isEnd = true
  elseif keyCustom_CheckAndSet_ActionKey(inputType) then
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
      PaGlobal_Option:CompleteKeyCustomMode()
      return
    end
    KeyCustom_Action_UpdateButtonText_Key()
    KeyCustom_Action_KeyButtonCheckReset(inputType)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ActionPad(deltaTime)
  local isEnd = false
  local inputType
  if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
    inputType = PaGlobal_Option:GetKeyCustomInputType()
  else
    inputType = KeyCustom_Action_GetInputType()
  end
  if nil == inputType or inputType < 0 then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    return
  end
  if isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
    isEnd = true
  elseif isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_DELETE) then
    keyCustom_Clear_ActionPad(inputType)
    isEnd = true
  elseif keyCustom_CheckAndSet_ActionPad(inputType) then
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
      PaGlobal_Option:CompleteKeyCustomMode()
      return
    end
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_PadButtonCheckReset(inputType)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_UiKey(deltaTime)
  local isEnd = false
  local inputType
  if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
    inputType = PaGlobal_Option:GetKeyCustomInputType()
  else
    inputType = KeyCustom_Ui_GetInputType()
  end
  if nil == inputType or inputType < 0 then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    return
  end
  if isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
    isEnd = true
  elseif isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_DELETE) then
    keyCustom_Clear_UiKey(inputType)
    isEnd = true
  elseif keyCustom_CheckAndSet_UiKey(inputType) then
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
      PaGlobal_Option:CompleteKeyCustomMode()
      return
    end
    KeyCustom_Ui_UpdateButtonText_Key()
    KeyCustom_Ui_KeyButtonCheckReset(inputType)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_UiPad(deltaTime)
  local isEnd = false
  local inputType
  if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
    inputType = PaGlobal_Option:GetKeyCustomInputType()
  else
    inputType = KeyCustom_Ui_GetInputType()
  end
  if nil == inputType or inputType < 0 then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    return
  end
  if isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
    isEnd = true
  elseif isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_DELETE) then
    keyCustom_Clear_UiPad(inputType)
    isEnd = true
  elseif keyCustom_CheckAndSet_UiPad(inputType) then
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
      PaGlobal_Option:CompleteKeyCustomMode()
      return
    end
    KeyCustom_Ui_UpdateButtonText_Pad()
    KeyCustom_Ui_PadButtonCheckReset(inputType)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ActionPadFunc1(deltaTime)
  local isEnd = false
  if isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
    isEnd = true
  elseif isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_DELETE) then
    keyCustom_Clear_ActionPadFunc1(inputType)
    isEnd = true
  elseif keyCustom_CheckAndSet_ActionPadFunc1(inputType) then
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
      PaGlobal_Option:CompleteKeyCustomMode()
      return
    end
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_FuncPadButtonCheckReset(0)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ActionPadFunc2(deltaTime)
  local isEnd = false
  if isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
    isEnd = true
  elseif isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_DELETE) then
    keyCustom_Clear_ActionPadFunc2(inputType)
    isEnd = true
  elseif keyCustom_CheckAndSet_ActionPadFunc2(inputType) then
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    if true == _ContentsGroup_isNewOption and true == PaGlobal_Option:isOpen() then
      PaGlobal_Option:CompleteKeyCustomMode()
      return
    end
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_FuncPadButtonCheckReset(1)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_PopupItem()
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_UseItem_ShowToggle_Func()
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Extraction(deltaTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_Extraction_Cloth:GetShow() then
      ExtractionCloth_WindowClose()
      InventoryWindow_Close()
      EquipmentWindow_Close()
      ClothInventory_Close()
    elseif Panel_Window_Extraction_Crystal:GetShow() then
      Socket_ExtractionCrystal_WindowClose()
      InventoryWindow_Close()
      EquipmentWindow_Close()
      ClothInventory_Close()
    elseif Panel_Window_Extraction_EnchantStone:GetShow() then
      ExtractionEnchantStone_WindowClose()
      InventoryWindow_Close()
      EquipmentWindow_Close()
      ClothInventory_Close()
    else
      PaGlobal_Extraction:openPanel(false)
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_InGameCustomize(deltaTime)
  if false == _ContentsGroup_RenewUI_Customization then
    if Panel_CustomizationMain:IsShow() and Panel_CustomizationMain:GetAlpha() == 1 and not getEscHandle() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F4)) then
      if Panel_CustomizingAlbum:GetShow() then
        CustomizingAlbum_Close()
      else
        IngameCustomize_Hide()
      end
    end
    if Panel_CustomizationStatic:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) and not Panel_FileExplorer:GetShow() and not Panel_CustomizingAlbum:GetShow() then
      FGlobal_TakeScreenShotByHotKey()
    end
    if Panel_Widget_ScreenShotFrame:GetShow() then
      if not getEscHandle() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F4)) then
        local screenShotFrame_Close = function()
          FGlobal_ScreenShotFrame_Close()
        end
        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_CONTENT")
        local messageBoxData = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_TITLE"),
          content = messageBoxMemo,
          functionYes = screenShotFrame_Close,
          functionNo = MessageBox_Empty_function,
          exitButton = true,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageBoxData)
        return
      elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ADD) then
        ScreenShotFrameSize_Increase()
      elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SUBTRACT) then
        ScreenShotFrameSize_Decrease()
      elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
        FGlobal_TakeAScreenShot()
      end
    end
  elseif true == PaGlobalFunc_Customization_GetShow() and not getEscHandle() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F4)) then
    PaGlobalFunc_Customization_Back()
  end
end
local prevPressControl
function PaGlobal_GlobalKeyBinder.Process_UIMode_InGameCashShop(delataTime)
  if GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_CashShop) then
    InGameShop_Close()
    Panel_Tooltip_Item_hideTooltip()
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if _ContentsGroup_RenewUI_PearlShop then
      if PaGlobalFunc_PearlShopProductBuyCheckShow() then
        PaGlobalFunc_PearlShopProductBuyBack()
      elseif PaGlobalFunc_PearlShopProductInfoCheckShow() then
        PaGlobalFunc_PearlShopProductInfoBack()
      elseif PaGlobalFunc_PearlShopCheckShow() then
        PaGlobalFunc_PearlShopBack()
      elseif PaGlobalFunc_PearlShopCategoryCheckShow() then
        PaGlobalFunc_PearlShopCategoryBack()
      end
    elseif Panel_Window_Inventory:IsShow() and not Panel_Window_Inventory:IsUISubApp() then
      InventoryWindow_Close()
    elseif Panel_IngameCashShop_BuyOrGift:GetShow() then
      InGameShopBuy_Close()
    elseif Panel_IngameCashShop_GoodsDetailInfo:GetShow() then
      InGameShopDetailInfo_Close()
      Panel_Tooltip_Item_hideTooltip()
    elseif Panel_QnAWebLink:GetShow() then
      FGlobal_QnAWebLink_Close()
    elseif Panel_IngameCashShop_MakePaymentsFromCart:GetShow() then
      FGlobal_IngameCashShop_MakePaymentsFromCart_Close()
    elseif Panel_IngameCashShop_HowUsePearlShop:GetShow() then
      Panel_IngameCashShop_HowUsePearlShop_Close()
    elseif Panel_IngameCashShop_Coupon:GetShow() then
      IngameCashShopCoupon_Close()
    elseif Panel_IngameCashShop_EventCart:GetShow() then
      IngameCashShopEventCart_Close()
    elseif getGameDanceEditor():isShow() then
      getGameDanceEditor():hide()
    elseif Panel_Window_RecommandGoods_PopUp:GetShow() then
      PaGlobal_Recommend_PopUp:Close()
    else
      InGameShop_Close()
    end
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) and FGlobal_InGameShop_IsSelectedSearchName() then
    InGameShop_Search()
  end
  if FGlobal_InGameShop_IsSelectedSearchName() then
    local pressControl = getPressControl()
    if nil == pressControl then
      pressControl = prevPressControl
    end
    local searchEdit = FGlobal_InGameCashShop_GetSearchEdit()
    prevPressControl = pressControl
    if nil == pressControl or pressControl:GetKey() ~= searchEdit:GetKey() then
      ClearFocusEdit()
    else
      return
    end
  end
  if not Panel_IngameCashShop_BuyOrGift:GetShow() and GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_Inventory) then
    if Panel_Window_Inventory:IsShow() then
      InventoryWindow_Close()
    else
      FGlobal_InGameShop_OpenInventory()
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Dye(delataTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_Dyeing) then
    if true == _ContentsGroup_RenewUI_Dyeing then
      PaGlobalFunc_Dyeing_OnPadB()
    else
      audioPostEvent_SystemUi(1, 23)
      FGlobal_Panel_DyeReNew_Hide()
      SetUIMode(Defines.UIMode.eUIMode_Default)
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_SkillWindow(delataTime)
  if false == _ContentsGroup_RenewUI then
    return
  end
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_Skill) then
    audioPostEvent_SystemUi(1, 23)
    PaGlobalFunc_Skill_Close()
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_ItemMarket(delataTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_ItemMarket_ItemSet:GetShow() then
      FGlobal_ItemMarketItemSet_Close()
    elseif Panel_Window_ItemMarket_RegistItem:GetShow() then
      FGlobal_ItemMarketRegistItem_Close()
    elseif Panel_ItemMarket_PreBid_Manager:GetShow() then
      FGlobal_ItemMarketPreBid_Manager_Close()
    elseif Panel_ItemMarket_PreBid:GetShow() then
      FGlobal_ItemMarketPreBid_Close()
    elseif Panel_ItemMarket_AlarmList:GetShow() then
      FGlobal_ItemMarketAlarmList_Close()
    elseif Panel_ItemMarket_BidDesc:GetShow() then
      Panel_ItemMarket_BidDesc_Hide()
    elseif Panel_Window_ItemMarket:GetShow() and not Panel_Window_ItemMarket:IsUISubApp() then
      if Panel_Window_ItemMarket_BuyConfirm:GetShow() then
        FGlobal_ItemMarket_BuyConfirm_Close()
      else
        FGolbal_ItemMarketNew_Close()
        InventoryWindow_Close()
        Equipment_SetShow(false)
        ClothInventory_Close()
      end
    else
      FGolbal_ItemMarket_Function_Close()
    end
    if ToClient_CheckExistSummonMaid() and Panel_Window_ItemMarket:GetShow() == false then
      ToClient_CallHandlerMaid("_maidLogOut")
    end
  end
  if FGlobal_isOpenItemMarketBackPage() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) and false == FGlobal_isItemMarketBuyConfirm() then
    FGlobal_HandleClicked_ItemMarketBackPage()
  end
  if Panel_Window_ItemMarket_BuyConfirm:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)) then
    HandleClicked_ItemMarket_BuyItem()
  end
  if Panel_Window_ItemMarket:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
    FGolbal_ItemMarketNew_Search()
  end
  if Panel_ItemMarket_PreBid:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
    if 0 == FGlobal_ItemMarketPreBid_Check_OpenType() then
      FGlobal_ItemMarketPreBid_Confirm()
    else
      FGlobal_ItemMarketPreBid_Close()
    end
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)) then
    if true == Panel_IngameCashShop_Password:GetShow() then
      PayMentPassword_Confirm()
    else
      FGlobal_ItemMarketRegistItem_RegistDO()
    end
  end
  if getInputMode() ~= IM.eProcessorInputMode_ChattingInputMode and Panel_Window_ItemMarket:GetShow() and GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_Inventory) then
    if Panel_Window_Inventory:IsShow() then
      InventoryWindow_Close()
      Equipment_SetShow(false)
      ClothInventory_Close()
    else
      FGlobal_ItemmarketNew_OpenInventory()
      Equipment_SetShow(true)
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_ProductNote(deltaTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_ProductNote_ShowToggle()
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_QnAWebLink(deltaTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) and false == Panel_QnAWebLink_ShowToggle() then
    CheckChattingInput()
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_TradeGame(deltaTime)
  if isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
    Fglobal_TradeGame_Close()
    return
  end
  global_Update_TradeGame(deltaTime)
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_CutSceneMode(deltaTime)
  if ToClient_cutsceneIsPlay() then
    if not MessageBox.isPopUp() and isKeyDown_Once(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "CUTSCENE_EXIT_MESSAGEBOX_MEMO")
      local messageBoxData = {
        title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"),
        content = messageBoxMemo,
        functionYes = ToClient_CutsceneStop,
        functionNo = MessageBox_Empty_function,
        exitButton = true,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageBoxData)
    end
    Panel_MovieTheater_LowLevel_WindowClose()
    return
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_UiSetting(deltaTime)
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_UiSet_Close()
    return
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_Gacha_Roulette(deltaTime)
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
    FGlobal_gacha_Roulette_OnPressSpace()
  elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_gacha_Roulette_OnPressEscape()
  end
  return
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_EventNotify(deltaTime)
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    EventNotifyContent_Close()
    CheckChattingInput()
    SetUIMode(Defines.UIMode.eUIMode_Default)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_ScreenShotMode(delataTime)
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    local screenShotFrame_Close = function()
      FGlobal_ScreenShotFrame_Close()
    end
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_CONTENT")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_TITLE"),
      content = messageBoxMemo,
      functionYes = screenShotFrame_Close,
      functionNo = MessageBox_Empty_function,
      exitButton = true,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
    setUiInputProcessed(VCK.KeyCode_SPACE)
    FGlobal_TakeAScreenShot()
  elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ADD) then
    ScreenShotFrameSize_Increase()
  elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SUBTRACT) then
    ScreenShotFrameSize_Decrease()
  end
  return
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_InGameDance(deltaTime)
  if getGameDanceEditor():isShow() == true and not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Dance_Close()
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ButtonShortcuts(deltaTime)
  local isEnd = false
  local clickedAlt = isKeyPressed(CppEnums.VirtualKeyCode.KeyCode_MENU)
  local clickedShift = isKeyPressed(CppEnums.VirtualKeyCode.KeyCode_SHIFT)
  if isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
    PaGlobal_ButtonShortcuts:UiRefresh(PaGlobal_ButtonShortcuts._curId)
    isEnd = true
  elseif isKeyUpFor(CppEnums.VirtualKeyCode.KeyCode_DELETE) then
    PaGlobal_ButtonShortcuts:Remove()
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    return
  end
  if false == clickedAlt then
    return
  end
  local VirtualKeyCode = keyCustom_GetVirtualKey()
  if VirtualKeyCode > 0 then
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode(Defines.UIMode.eUIMode_Default)
    PaGlobal_ButtonShortcuts:Register(VirtualKeyCode, clickedAlt, clickedShift)
  end
end
function PaGlobal_GlobalKeyBinder.Process_UiModeNotInput()
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) and not _ContentsGroup_RenewUI_Alchemy then
    if false == GlobalSwitch_UseOldAlchemy then
      FGlobal_Alchemy_Close()
    else
      Alchemy_Close()
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_ChattingMacro()
  if false == isKeyPressed(VCK.KeyCode_MENU) then
    return false
  end
  if false == isKeyPressed(VCK.KeyCode_SHIFT) then
    return false
  end
  local ii
  for ii = VCK.KeyCode_0, VCK.KeyCode_9 do
    local key = ii - VCK.KeyCode_0 - 1
    if key < 0 then
      key = VCK.KeyCode_9 - VCK.KeyCode_0
    end
    if isKeyDown_Once(ii) and "" ~= ToClient_getMacroChatMessage(key) then
      ToClient_executeChatMacro(key)
      return true
    end
  end
  return false
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_SkillkeyBinder(deltaTime)
  if isUseNewQuickSlot() then
    local ii
    local quickSlot1 = CppEnums.ActionInputType.ActionInputType_QuickSlot1
    local quickSlot20 = CppEnums.ActionInputType.ActionInputType_QuickSlot20
    for ii = quickSlot1, quickSlot20 do
      if keyCustom_IsDownOnce_Action(ii) then
        HandleClicked_NewQuickSlot_Use(ii - quickSlot1)
        return
      end
    end
  else
    local ii
    local quickSlot1 = CppEnums.ActionInputType.ActionInputType_QuickSlot1
    local quickSlot10 = CppEnums.ActionInputType.ActionInputType_QuickSlot10
    for ii = quickSlot1, quickSlot10 do
      if keyCustom_IsDownOnce_Action(ii) then
        QuickSlot_Click(tostring(ii - quickSlot1))
        return
      end
    end
  end
end
function PaGlobal_GlobalKeyBinder.Process_Normal(deltaTime)
  if MessageBox.isPopUp() then
    local pcKey = GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)
    if pcKey and not _ContentsGroup_RenewUI then
      MessageBox.keyProcessEnter()
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      return true
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      MessageBox.keyProcessEscape()
      return true
    end
  elseif Panel_UseItem:IsShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      Click_Panel_UserItem_Yes()
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      Panel_UseItem_ShowToggle_Func()
    end
    return true
  elseif false == _ContentsGroup_RenewUI_ExitGame and Panel_ExitConfirm:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      Panel_GameExit_MinimizeTray()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      Panel_ExitConfirm:SetShow(false)
      Panel_Tooltip_Item_hideTooltip()
    end
    return true
  elseif false == _ContentsGroup_RenewUI_ExitGame and Panel_ExitConfirm_Old:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      Panel_GameExit_MinimizeTray()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      Panel_ExitConfirm_Old:SetShow(false)
      Panel_Tooltip_Item_hideTooltip()
    end
    return true
  elseif Panel_NumberPad_IsPopUp() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F) then
      Panel_NumberPad_ButtonAllSelect_Mouse_Click(0)
      setUiInputProcessed(VCK.KeyCode_F)
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) or keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_Interaction) then
      Panel_NumberPad_ButtonConfirm_Mouse_Click()
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      keyCustom_KeyProcessed_Action(CppEnums.ActionInputType.ActionInputType_Interaction)
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      Panel_NumberPad_ButtonCancel_Mouse_Click()
    end
    Panel_NumberPad_NumberKey_Input()
    return true
  elseif Panel_Chatting_Macro:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_Chatting_Macro_ShowToggle()
      FGlobal_Chatting_Macro_SetCHK(false)
      CheckChattingInput()
      return true
    end
  elseif Panel_Chat_SocialMenu:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if Panel_Chatting_Input:GetShow() then
        ChatInput_CancelAction()
        ChatInput_CancelMessage()
        ChatInput_Close()
        friend_clickAddFriendClose()
      else
        FGlobal_SocialAction_SetCHK(false)
        FGlobal_SocialAction_ShowToggle()
        CheckChattingInput()
      end
      return true
    end
  elseif Panel_Chat_SubMenu:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if Panel_Chatting_Block_GoldSeller:GetShow() then
        FGlobal_reportSeller_Close()
        return true
      end
      Panel_Chat_SubMenu:SetShow(false)
      return true
    end
  elseif Panel_GuildIncentive:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) and not FGlobal_CheckSaveGuildMoneyUiEdit(GetFocusEdit()) then
      FGlobal_SaveGuildMoney_Send()
      return true
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_GuildIncentive_Close()
      return true
    end
    FGlobal_GuildDeposit_InputCheck()
    return true
  elseif GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_AlchemySton) and false == isKeyPressed(VCK.KeyCode_CONTROL) then
    local inputMode = getInputMode()
    if inputMode == IM.eProcessorInputMode_GameMode then
      FGlobal_AlchemyStone_Use()
      return true
    elseif (inputMode == IM.eProcessorInputMode_UiMode or inputMode == IM.eProcessorInputMode_UiControlMode) and UIMode.eUIMode_Default == GetUIMode() then
      FGlobal_AlchemyStone_Use()
      return true
    end
  elseif Panel_EventNotifyContent:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      HandleClicked_EventNotifyContent_Close()
      return true
    end
  elseif Panel_EventNotify:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_EventNotifyClose()
      return true
    end
  elseif Panel_PcRoomNotify:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_PcRoomNotifyClose()
      return true
    end
  elseif Panel_Introduction:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_Introcution_TooltipHide()
      return true
    end
  elseif Panel_ChallengePresent:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      FGlobal_ChallengePresent_AcceptReward()
      return true
    end
  elseif Panel_SaveFreeSet:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      HandleClicked_UiSet_ConfirmSetting()
      return true
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if Panel_SaveSetting:GetShow() then
        PaGlobal_Panel_SaveSetting_Hide()
        return true
      else
        PaGlobal_UiSet_FreeSet_Close()
        return true
      end
    end
  elseif Panel_UI_Setting:IsUse() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      UiSet_FreeSet_Open()
      return true
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if Panel_SaveSetting:GetShow() then
        PaGlobal_Panel_SaveSetting_Hide()
        return true
      else
        FGlobal_UiSet_Close()
        return true
      end
    end
  elseif Panel_Win_Check:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      MessageBoxCheck.keyProcessEnter()
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      return true
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      MessageBoxCheck.keyProcessEscape()
      return true
    end
  elseif nil ~= getSelfPlayer() and getSelfPlayer():get():isShowWaitComment() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      EventSelfPlayerWaitCommentClose()
      return true
    end
  elseif Panel_RandomBoxSelect:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_Gacha_Roulette_Close()
      return true
    end
  elseif Panel_IngameCashShop_EasyPayment:IsShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if Panel_IngameCashShop_BuyOrGift:GetShow() then
        InGameShopBuy_Close()
        return true
      end
      PaGlobal_EasyBuy:Close()
      return true
    end
  elseif Panel_Window_StampCoupon:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_PearlStamp_Close()
      return true
    end
  elseif true == Panel_Window_MacroCheckQuizKeyPad:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    PaGlobal_MacroCheckQuizkeyPadClose()
    return true
  end
  if false == _ContentsGroup_RenewUI and Panel_RecentMemory:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    RecentMemory_Close()
    return true
  end
  if false == _ContentsGroup_RenewUI_Party and Panel_Party_ItemList:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_Party_ItemList_Close()
    return true
  end
  if Panel_LocalWarInfo:IsShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_LocalWarInfo_Close()
    return true
  end
  if Panel_SavageDefenceInfo:IsShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_SavageDefenceInfo_Close()
    return true
  end
  if Panel_SavageDefenceShop:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    SavageDefenceShop_CloseByKey()
    return true
  end
  if Panel_Window_ItemMarketAlarmList_New:GetShow() and not Panel_Window_ItemMarketAlarmList_New:IsUISubApp() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    ItemMarket_AlarmList_Close()
    return true
  end
  if Panel_Purification:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    PuriManager:Close()
    return true
  end
  if _ContentsGroup_RenewUI and Panel_Chatting_Input:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    ChatInput_Close()
    return true
  end
  if false == _ContentsGroup_RenewUI_Pet and Panel_Window_PetInfoNew:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_PetInfoNew_Close()
    return true
  end
  return false
end
function PaGlobal_GlobalKeyBinder.Process_ChattingInputMode()
  uiEdit = GetFocusEdit()
  if nil == uiEdit then
    return false
  end
  if WaitComment_CheckCurrentUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      settingWaitCommentConfirm()
    end
    return true
  elseif FGlobal_CheckEditBox_IngameCashShop_NewCart(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_EscapeEditBox_IngameCashShop_NewCart(false)
    end
    return true
  elseif FGlobal_CheckEditBox_GuildRank(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_EscapeEditBox_GuildRank()
    end
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      GuildSearch_Confirm()
    end
    return true
  elseif FGlobal_CheckEditBox_IngameCashShop(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_EscapeEditBox_IngameCashShop()
    end
    return true
  elseif FGlobal_CheckEditBox_PetCompose(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      FGlobal_EscapeEditBox_PetCompose(false)
    end
    return true
  elseif NpcNavi_CheckCurrentUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      NpcNavi_OutInputMode(false)
    end
    return true
  elseif ChatInput_CheckCurrentUiEdit(uiEdit) then
    if true == _ContentsGroup_RenewUI_Chatting then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        Input_ChattingInfo_OnPadB()
      elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) then
        PaGlobalFunc_ChattingInfo_CheckRemoveLinkedItem()
      end
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      if true == _ContentsGroup_isConsoleTest then
        if true == _ContentsGroup_RenewUI_Chatting then
          PaGlobalFunc_ChattingInfo_PressedEnter()
        else
          ChatInput_PressedEnter()
        end
      end
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_UP) then
      if ToClient_isComposition() then
        return
      end
      if true == _ContentsGroup_isConsoleTest then
      else
        ChatInput_PressedUp()
      end
    elseif isKeyPressed(VCK.KeyCode_MENU) then
      ChatInput_CheckReservedKey()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_TAB) then
      ChatInput_ChangeInputFocus()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if ToClient_isComposition() then
        return
      end
      ChatInput_CancelAction()
      ChatInput_CancelMessage()
      ChatInput_Close()
      ClearFocusEdit()
      friend_clickAddFriendClose()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      ChatInput_CheckInstantCommand()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) or isKeyPressed(VCK.KeyCode_BACK) then
      ChatInput_CheckRemoveLinkedItem()
    elseif GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_ChatTabNext) then
      moveChatTab(true)
    elseif GlobalKeyBinder_CheckCustomKeyPressed(CppEnums.UiInputType.UiInputType_ChatTabPrev) then
      moveChatTab(false)
    end
  elseif AddFriendInput_CheckCurrentUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      friend_clickAddFriendClose()
    end
    return true
  elseif FriendMessanger_CheckCurrentUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      friend_killFocusMessangerByKey()
    end
    return true
  elseif FGlobal_CheckCurrentVendingMachineUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_VendingMachineClearFocusEdit(uiEdit)
    end
    return true
  elseif FGlobal_CheckCurrentConsignmentSaleUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_ConsignmentSaleClearFocusEdit()
    end
    return true
  elseif FGlobal_CheckGuildLetsWarUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_GuildLetsWarClearFocusEdit()
    end
    return true
  elseif FGlobal_CheckGuildNoticeUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_GuildNoticeClearFocusEdit()
    end
    return true
  elseif true == _ContentsGroup_RenewUI_Guild then
    if PaGlobalFunc_GuildIntro_CheckNoticeUiEdit(uiEdit) then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        PaGlobalFunc_GuildIntro_EndFocusEdit()
      end
      return true
    end
  elseif FGlobal_CheckGuildIncentiveUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_GuildIncentiveClearFocusEdit()
    end
    return true
  elseif FGlobal_CheckArshaPvpUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_ArshaPvPClearFocusEdit()
    end
    return true
  elseif FGlobal_CheckArshaNameUiEdit_A(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_ArshaNameClearFocusEdit_A()
    end
    return true
  elseif FGlobal_CheckArshaNameUiEdit_B(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_ArshaNameClearFocusEdit_B()
    end
    return true
  elseif FGlobal_CheckGuildIntroduceUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_GuildIntroduceClearFocusEdit()
    end
    return true
  elseif FGlobal_ChattingFilter_UiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_ChattingFilter_ClearFocusEdit()
    end
    return true
  elseif FGlobal_CheckPartyListUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_PartyListClearFocusEdit()
    end
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      FGlobal_PartyListClearFocusEdit()
      HandleClicked_PartyList_DoSearch()
    end
    return true
  elseif FGlobal_CheckPartyListRecruiteUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_PartyListClearFocusEdit()
    end
    return true
  elseif false == _ContentsGroup_RenewUI_Alchemy and false == GlobalSwitch_UseOldAlchemy and FGlobal_Alchemy_CheckEditBox(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_Alchemy_ClearEditFocus()
    end
    return true
  elseif true == _ContentsGroup_isMemoOpen and FGlobal_Memo_CheckUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      PaGlobal_Memo:Save()
    end
    return true
  elseif true == _ContentsGroup_isNewOption and true == FGlobal_Option_CheckUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      ClearFocusEdit()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      PaGlobal_Option:ClickedSeachOption()
    end
    return true
  elseif true == FGlobal_ButtonShortcuts_CheckUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      ClearFocusEdit()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      PaGlobal_ButtonShortcuts:ClickedSearch()
    end
    return true
  end
  if false == _ContentsGroup_RenewUI_Knowledge and Panel_Knowledge_CheckCurrentUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      Panel_Knowledge_OutInputMode(false)
    end
    return true
  else
  end
  if true == _ContentsGroup_RenewUI then
    if PaGlobalFunc_CharacterInfo_CheckIntroduceUiEdit(uiEdit) then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        PaGlobalFunc_Window_CharacterInfo_SaveUserIntroduction()
        UI.ClearFocusEdit()
      elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
        PaGlobalFunc_Window_CharacterInfo_SaveUserIntroduction()
        UI.ClearFocusEdit()
      end
      return true
    end
  elseif _ContentsGroup_isUsedNewCharacterInfo == false then
    if FGlobal_CheckMyIntroduceUiEdit(uiEdit) then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        FGlobal_MyIntroduceClearFocusEdit()
      end
      return true
    end
  elseif _ContentsGroup_isUsedNewCharacterInfo == true and FGlobal_UI_CharacterInfo_Basic_Global_CheckIntroduceUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      UI.ClearFocusEdit()
    end
    return true
  end
  if true == _ContentsGroup_RenewUI_Guild then
    if true == PaGlobal_CheckGuildAgreement_DaliyPaymentUiEdit(uiEdit) then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        PaGlobal_CheckGuildAgreement_DaliyPaymentClearFocusEdit()
      end
      return true
    elseif true == PaGlobal_CheckGuildAgreement_PenaltyCostUiEdit(uiEdit) then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        PaGlobal_CheckGuildAgreement_PenaltyCostClearFocusEdit()
      end
      return true
    end
  end
  if true == _ContentsGroup_RenewUI and true == PaGlobal_FriendNew_IsFriendAddEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      PaGlobal_FriendNew:ClearAddFriendEdit()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      PaGlobal_FriendNew:EnterAddFriendEdit()
    end
    return true
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    ClearFocusEdit()
  end
  return false
end
function CommonWindowFunction(uiInputType, Function, param)
  if true == GlobalKeyBinder_CheckCustomKeyPressed(uiInputType) then
    Function(param)
    return true
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_CommonWindow(deltaTime)
  if false == _ContentsGroup_RenewUI_Tutorial and true == FGlobal_GetFirstTutorialState() then
    return
  end
  if CommonWindowFunction(__eUiInputType_MentalKnowledge, Process_UIMode_CommonWindow_MentalKnowledge) then
    return
  end
  if CommonWindowFunction(__eUiInputType_PositionNotify, Process_UIMode_CommonWindow_PositionNotify, fastPinDelta) then
    return
  end
  if CommonWindowFunction(__eUiInputType_CashShop, Process_UIMode_CommonWindow_CashShop) then
    return
  end
  if CommonWindowFunction(__eUiInputType_BlackSpirit, Process_UIMode_CommonWindow_BlackSpirit) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Chat, Process_UIMode_CommonWindow_Chatting) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Help, FGlobal_Panel_WebHelper_ShowToggle) then
    return
  end
  if CommonWindowFunction(__eUiInputType_ProductionNote, Process_UIMode_CommonWindow_ProductionNote) then
    return
  end
  if CommonWindowFunction(__eUiInputType_PlayerInfo, Process_UIMode_CommonWindow_PlayerInfo) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Skill, Process_UIMode_CommonWindow_Skill) then
    return
  end
  if CommonWindowFunction(__eUiInputType_ChatTabNext, moveChatTab, true) then
    return
  end
  if CommonWindowFunction(__eUiInputType_ChatTabPrev, moveChatTab, false) then
    return
  end
  if CommonWindowFunction(__eUIInputType_PossessionByBlackSpirit, Process_UIMode_CommonWindow_PossessionByBlackSpirit) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Inventory, Process_UIMode_CommonWindow_Inventory) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Dyeing, Process_UIMode_CommonWindow_Dyeing) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Present, Process_UIMode_CommonWindow_Present) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Manufacture, Process_UIMode_CommonWindow_Manufacture) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Guild, Process_UIMode_CommonWindow_Guild) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Mail, Process_UIMode_CommonWindow_Mail) then
    return
  end
  if CommonWindowFunction(__eUiInputType_FriendList, Process_UIMode_CommonWindow_FriendList) then
    return
  end
  if CommonWindowFunction(__eUiInputType_QuestHistory, Process_UIMode_CommonWindow_QuestHistory) then
    return
  end
  if CommonWindowFunction(__eUiInputType_BeautyShop, Process_UIMode_CommonWindow_BeautyShop) then
    return
  end
  if CommonWindowFunction(__eUiInputType_WorldMap, Process_UIMode_CommonWindow_WorldMap) then
    return
  end
  if CommonWindowFunction(__eUiInputType_House, Process_UIMode_CommonWindow_House) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Worker, FGlobal_WorkerManger_ShowToggle) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Pet, FGlobal_PetListNew_Toggle) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Maid, Process_UIMode_CommonWindow_Maid) then
    return
  end
  if CommonWindowFunction(__eUiInputType_Servant, Servant_Call, 0) then
    return
  end
  if CommonWindowFunction(__eUiInputType_GuildServant, FGlobal_GuildServantList_Open) then
    return
  end
  if CommonWindowFunction(__eUiInputType_DeleteNavigation, Process_UIMode_CommonWindow_DeleteNavigation) then
    return
  end
  fastPinDelta = fastPinDelta + deltaTime
  if fastPinDelta > 10 then
    fastPinDelta = 10
  end
  if isKeyPressed(VCK.KeyCode_SHIFT) and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_OEM_7) then
    if FGlobal_ChatInput_CheckReply() then
      ChatInput_Show()
      ChatInput_CheckInstantCommand()
      FGlobal_ChatInput_Reply(true)
      ChatInput_ChangeChatType_Immediately(4)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHATTINGINPUT_NONEREPLYTARGET"))
    end
    return
  end
  if nil ~= Panel_Interaction and Panel_Interaction:IsShow() or nil ~= Panel_Widget_PanelInteraction_Renew and Panel_Widget_PanelInteraction_Renew:IsShow() and false == Panel_Widget_Chatting_Renew:GetShow() then
    local keyCode
    if _ContentsGroup_isConsoleTest and isPadInputIn() then
      keyCode = FGlobal_Interaction_CheckAndGetPressedKeyCode_Xbox(deltaTime)
    else
      keyCode = FGlobal_Interaction_CheckAndGetPressedKeyCode()
    end
    if nil ~= keyCode then
      Interaction_ExecuteByKeyMapping(keyCode)
    end
  end
  if keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_Interaction) and Panel_Looting:IsShow() then
    Panel_Looting_buttonLootAll_Mouse_Click(false)
    Panel_Tooltip_Item_hideTooltip()
    QuestInfoData.questDescHideWindow()
  end
  if isKeyPressed(VCK.KeyCode_MENU) and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_C) then
    if not isPvpEnable() then
      return
    else
      requestTogglePvP()
      return
    end
  end
  if isKeyPressed(VCK.KeyCode_MENU) and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_B) then
    requestBlackSpritSkill()
    return
  end
  if ToClient_isXBox() or ToClient_IsDevelopment() then
    Toclient_processCheckEscapeKey()
  else
    PaGlobal_GlobalKeyBinder.Process_CheckEscape()
  end
end
function PaGlobal_GlobalKeyBinder.Process_CheckEscape()
  if true == getEscHandle() or false == GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    return
  end
  if true == Panel_MiniGame_Find:GetShow() then
    PaGlobal_MiniGame_Find:askGameClose()
    return
  end
  if selfPlayerIsFreeCamStateInCompetitionArea() then
    selfPlayerCloseFreecam()
    return
  end
  if ToClient_WorldMapIsShow() then
    FGlobal_WorldMapWindowEscape()
    return
  end
  if Panel_EventNotify:GetShow() then
    FGlobal_NpcNavi_Hide()
    EventNotify_Close()
    return
  end
  if Panel_Window_DailyStamp:GetShow() then
    DailStamp_Hide()
    Panel_Tooltip_Item_hideTooltip()
    TooltipSimple_Hide()
    return
  end
  if Panel_Window_ArshaTeamNameChange:GetShow() then
    FGlobal_TeamNameChangeControl_Close()
    return
  end
  if Panel_Window_ArshaInviteList:GetShow() then
    FGlobal_ArshaPvP_InviteList_Close()
    return
  end
  if Panel_Window_Arsha:GetShow() then
    FGlobal_ArshaPvP_Close()
    return
  end
  if Panel_WatchingMode:GetShow() then
    return
  end
  if Panel_ScreenShotAlbum_FullScreen:GetShow() then
    ScreenshotAlbum_FullScreen_Close()
    return
  end
  if Panel_ScreenShotAlbum:GetShow() then
    ScreenshotAlbum_Close()
    return
  end
  if Panel_Window_BlackSpiritAdventure:GetShow() and not Panel_Window_BlackSpiritAdventure:IsUISubApp() then
    BlackSpiritAd_Hide()
    return
  end
  if Panel_Window_BlackSpiritAdventure_2:GetShow() then
    BlackSpirit2_Hide()
    return
  end
  if Panel_Window_BlackSpiritAdventureVerPC:GetShow() and not Panel_Window_BlackSpiritAdventure:IsUISubApp() then
    Panel_Window_BlackSpiritAdventureVerPC:SetShow(false, false)
    return
  end
  if Panel_Window_ClothInventory:GetShow() then
    ClothInventory_Close()
    return
  end
  if Panel_Window_Mercenary:GetShow() then
    FGlobal_MercenaryClose()
    return
  end
  if Panel_Window_MasterpieceAuction:GetShow() and FGlobal_MasterPieceAuction_IsOpenEscMenu() then
    PaGlobal_MasterpieceAuction:close()
    return
  end
  if Panel_MovieGuide_Web:GetShow() then
    if Panel_MovieGuide_Weblist:GetShow() then
      PaGlobal_MovieGuide_Weblist:Close()
      return
    else
      PaGlobal_MovieGuide_Web:Close()
      return
    end
  end
  if Panel_MovieGuide_Weblist:GetShow() then
    PaGlobal_MovieGuide_Weblist:Close()
    return
  end
  if true == FGlobal_CheckedQuestQptionGetShow() then
    FGlobal_CheckedQuestOptionClose()
    return
  end
  if false == _ContentsGroup_RenewUI_Skill then
    if true == Panel_MovieSkillGuide_Web:GetShow() then
      if true == Panel_MovieSkillGuide_Weblist:GetShow() then
        PaGlobal_MovieSkillGuide_Weblist:Close()
        return
      else
        PaGlobal_MovieSkillGuide_Web:Close()
        return
      end
    end
    if true == Panel_MovieSkillGuide_Weblist:GetShow() then
      PaGlobal_MovieSkillGuide_Weblist:Close()
      return
    end
  elseif true == PaGlobalFunc_Skill_GetShow() then
    PaGlobalFunc_Skill_Close()
    return
  end
  if Panel_SaveSetting:IsShow() then
    PaGlobal_Panel_SaveSetting_Hide()
    return
  end
  if Panel_HarvestList:GetShow() then
    HarvestList_Close()
    return
  end
  if false == _ContentsGroup_RenewUI_Party and Panel_PartyRecruite:GetShow() then
    PartyListRecruite_Close()
    return
  end
  if Panel_ServantResurrection:GetShow() then
    Panel_ServantResurrection_Close()
    return
  end
  if Panel_Window_Camp:GetShow() then
    if true == _ContentsGroup_RenewUI_NpcShop then
      if PaGlobalFunc_Dialog_NPCShop_GetShow() then
        PaGlobalFunc_Dialog_NPCShop_Close()
      else
        PaGlobal_Camp:close()
      end
    elseif Panel_Window_NpcShop:GetShow() then
      NpcShop_WindowClose()
    else
      PaGlobal_Camp:close()
    end
    return
  end
  if Panel_Window_CampRegister:GetShow() then
    FGlobal_CampRegister_Close()
    return
  end
  if Panel_Window_MonsterRanking:GetShow() then
    FGlobal_MonsterRanking_Close()
    return
  end
  if Panel_ChatOption:GetShow() then
    ChattingOption_Close()
    return
  end
  if Panel_Window_BuildingBuff:GetShow() then
    PaGlobal_BuildingBuff:close()
    return
  end
  if true == Panel_Window_PersonalBattle:GetShow() then
    PaGlobal_PersonalBattle:close()
    return
  end
  if true == _ContentsGroup_isMemoOpen and Panel_Memo_List:GetShow() then
    PaGlobal_Memo:ListClose()
    return
  end
  if true == _ContentsGroup_RenewUI and true == Panel_Window_CharacterInfo_Renew:GetShow() then
    PaGlobalFunc_Window_CharacterInfo_Close()
    return
  end
  if Panel_CustomizingAlbum:GetShow() == true then
    CustomizingAlbum_Close()
  end
  local checkShowWindow = check_ShowWindow()
  if checkShowWindow then
    close_WindowPanelList()
    FGlobal_NpcNavi_Hide()
    return
  end
  if checkShowWindow and FGlobal_NpcNavi_IsShowCheck() then
    close_WindowPanelList()
    FGlobal_NpcNavi_Hide()
    return
  elseif not checkShowWindow and FGlobal_NpcNavi_IsShowCheck() then
    FGlobal_NpcNavi_Hide()
    return
  elseif checkShowWindow and not FGlobal_NpcNavi_IsShowCheck() then
    close_WindowPanelList()
    return
  else
    Panel_Menu_ShowToggle()
  end
end
function PaGlobal_GlobalKeyBinder.Process_ConsoleQuickMenu(deltaTime)
end
