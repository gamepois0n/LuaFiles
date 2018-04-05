-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\globalkeybinder\new_globalkeybinderfunctions.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local UIMode = Defines.UIMode
-- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_GameMode = function()
  -- function num : 0_0
  DragManager:clearInfo()
  if Panel_UIControl:IsShow() then
    Panel_UIControl_SetShow(false)
    Panel_Menu_ShowToggle()
  else
    if Panel_PartyOption:GetShow() then
      PartyOption_Hide()
    end
  end
end

-- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Housing = function(deltaTime)
  -- function num : 0_1 , upvalues : VCK
  if Panel_House_InstallationMode_VillageTent:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    VillageTent_Close()
    return 
  else
    if Panel_Housing_FarmInfo_New:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      PAHousing_FarmInfo_Close()
      return 
    else
      if Panel_House_InstallationMode_ObjectControl:GetShow() and housing_isBuildMode() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        FGlobal_HouseInstallationControl_Move()
        return 
      else
        if Panel_House_InstallationMode_ObjectControl:GetShow() and not housing_isBuildMode() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_HouseInstallationControl_Close()
          return 
        else
          if Panel_House_InstallationMode_ObjectControl:GetShow() and not housing_isBuildMode() and FGlobal_HouseInstallationControl_IsConfirmStep() == true and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
            FGlobal_HouseInstallationControl_Confirm()
            return 
          else
            if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
              Panel_Housing_CancelModeFromKeyBinder()
              return 
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC16: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Mental = function(deltaTime)
  -- function num : 0_2 , upvalues : VCK
  if not getEscHandle() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_MentalKnowledge)) then
    Panel_Knowledge_Hide()
  end
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_MentalGame = function(deltaTime)
  -- function num : 0_3 , upvalues : VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_LEFT) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_A) then
    MentalKnowledge_CardRotation_Left()
  else
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RIGHT) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_D) then
      MentalKnowledge_CardRotation_Right()
    end
  end
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    MentalGame_Hide()
    SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  end
end

-- DECOMPILER ERROR at PC24: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_NpcDialog = function(deltaTime)
  -- function num : 0_4 , upvalues : VCK
  if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_Interaction) then
    if Panel_Window_NpcShop:GetShow() then
      return 
    end
    local _uiNextButton = (UI.getChildControl)(Panel_Npc_Dialog, "Button_Next")
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
    else
      if isShowReContactDialog() then
        HandleClickedDialogButton(0)
        audioPostEvent_SystemUi(0, 0)
      else
        if isShowDialogFunctionQuest() then
          HandleClickedFuncButton(0)
          audioPostEvent_SystemUi(0, 0)
          return 
        else
          if questDialogIndex() > -1 then
            HandleClickedDialogButton(questDialogIndex())
            audioPostEvent_SystemUi(0, 0)
          else
            if exchangalbeButtonIndex() > -1 then
              HandleClickedDialogButton(exchangalbeButtonIndex())
              audioPostEvent_SystemUi(0, 0)
            end
          end
        end
      end
    end
    return 
  end
  do
    if FGlobal_CehckedGuildEditUI(GetFocusEdit()) and not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      handleClicked_GuildCreateCancel()
    end
    do return  end
    if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if Panel_Window_MasterpieceAuction:GetShow() then
        PaGlobal_MasterpieceAuction:close()
        return 
      end
      if Panel_EnchantExtraction:GetShow() then
        Panel_EnchantExtraction_Close()
        return 
      end
      if Panel_Window_ServantInventory:GetShow() and Panel_Window_Warehouse:GetShow() then
        ServantInventory_Close()
        return 
      end
      if Panel_Window_Enchant:GetShow() then
        PaGlobal_Enchant:enchantClose()
        return 
      end
      if check_ShowWindow() then
        close_WindowPanelList()
        if Panel_Npc_Quest_Reward:GetShow() then
          FGlobal_HideDialog()
        end
      else
        FGlobal_HideDialog()
      end
      ServantInfo_Close()
      CarriageInfo_Close()
      ServantInventory_Close()
      return 
    end
    do
      if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Inventory) and getAuctionState() then
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
        else
          if isKeyPressed(VCK.KeyCode_S) then
            searchView_PushBottom()
          else
            if isKeyPressed(VCK.KeyCode_D) then
              searchView_PushRight()
            else
              if isKeyPressed(VCK.KeyCode_W) then
                searchView_PushTop()
              else
                if isKeyPressed(VCK.KeyCode_Q) then
                  searchView_ZoomIn()
                else
                  if isKeyPressed(VCK.KeyCode_E) then
                    searchView_ZoomOut()
                  end
                end
              end
            end
          end
        end
        searchView_CheckDistance()
      end
      if Panel_Window_ItemMarket_RegistItem:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)) then
        FGlobal_ItemMarketRegistItem_RegistDO()
      end
    end
  end
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Trade = function(deltaTime)
  -- function num : 0_5 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    closeNpcTrade_Basket()
    TooltipSimple_Hide()
  end
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_WorldMap = function(deltaTime)
  -- function num : 0_6 , upvalues : VCK
  if FGlobal_IsFadeOutState() then
    return 
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_Quest_New:GetShow() and Panel_Window_Quest_New:IsUISubApp() == false then
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
    if isWorldMapGrandOpen() and Panel_MovieWorldMapGuide_Web:GetShow() then
      PaGlobal_MovieGuide_Weblist:Close()
      return 
    end
    FGlobal_WorldMapWindowEscape()
  else
    if FGlobal_AskCloseWorldMap() then
      FGlobal_PopCloseWorldMap()
    else
      if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Chat) then
        if not Panel_Window_ItemMarket:GetShow() then
          ChatInput_Show()
          return 
        else
          return 
        end
      else
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_WorldMap) then
          FGlobal_CloseWorldmapForLuaKeyHandling()
          return 
        end
      end
    end
  end
  if FGlobal_isOpenItemMarketBackPage() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) and FGlobal_isItemMarketBuyConfirm() == false then
    FGlobal_HandleClicked_ItemMarketBackPage()
  end
  if (isGameTypeKorea() or isGameTypeJapan() or isGameTypeRussia()) and getContentsServiceType() ~= (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
    -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P1

    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_ProductionNote) and Panel_ProductNote ~= nil then
      Panel_ProductNote_ShowToggle()
    end
    return 
  end
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    ToClient_showWorldmapKeyGuide(true)
  else
    if isKeyPressed(VCK.KeyCode_SHIFT) then
      ToClient_showWorldmapKeyGuide(true)
    else
      if isKeyPressed(VCK.KeyCode_MENU) then
        ToClient_showWorldmapKeyGuide(true)
      else
        ToClient_showWorldmapKeyGuide(false)
      end
    end
  end
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_WorldMapSearch = function(deltaTime)
  -- function num : 0_7 , upvalues : VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    ClearFocusEdit()
    if ToClient_WorldMapIsShow() then
      SetUIMode((Defines.UIMode).eUIMode_WorldMap)
    else
      SetUIMode((Defines.UIMode).eUIMode_Default)
    end
  end
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Stable = function(deltaTime)
  -- function num : 0_8 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if (CppEnums.ServantType).Type_Vehicle == stable_getServantType() and FGlobal_IsButtonClick() == -1 then
      if Panel_Window_StableMarket:GetShow() then
        StableMarket_Close()
      else
        if Panel_Window_StableMating:GetShow() then
          StableMating_Close()
        else
          if Panel_Window_StableMix:GetShow() then
            StableMix_Close()
          else
            if Panel_Window_StableStallion:GetShow() then
              StableStallion_Close()
            else
              if Panel_AddToCarriage:GetShow() then
                stableCarriage_Close()
              else
                if Panel_Window_Inventory:GetShow() and not Panel_Window_Inventory:IsUISubApp() then
                  InventoryWindow_Close()
                else
                  StableFunction_Close()
                  GuildStableFunction_Close()
                end
              end
            end
          end
        end
      end
    else
      if (CppEnums.ServantType).Type_Ship == stable_getServantType() then
        WharfFunction_Close()
        GuildWharfFunction_Close()
      end
    end
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_MiniGame = function(deltaTime)
  -- function num : 0_9 , upvalues : VCK
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
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RBUTTON) then
        FillGauge_UpdateGauge(deltaTime, false)
      end
    end
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_DeadMessage = function(deltaTime)
  -- function num : 0_10
  if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Chat) then
    ChatInput_Show()
    return 
  end
  if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Guild) then
    local guildWrapper = ToClient_GetMyGuildInfoWrapper()
    if guildWrapper ~= nil then
      local guildGrade = guildWrapper:getGuildGrade()
      if guildGrade == 0 then
        if Panel_ClanList:IsShow() == false then
          audioPostEvent_SystemUi(1, 36)
          FGlobal_ClanList_Open()
        else
          audioPostEvent_SystemUi(1, 31)
          FGlobal_ClanList_Close()
        end
      else
        if Panel_Window_Guild:IsShow() == false and not Panel_DeadMessage:GetShow() then
          audioPostEvent_SystemUi(1, 36)
          GuildManager:Show()
        else
          audioPostEvent_SystemUi(1, 31)
          GuildManager:Hide()
        end
      end
    else
      do
        do
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NO_GUILD"))
          if Panel_DeadMessage:GetShow() then
            GuildManager:Hide()
          end
          if ToClient_isXBox() and (isPadUp(__eJoyPadInputType_Y) or isPadUp(__eJoyPadInputType_A)) then
            deadMessage_ButtonPushed_Immediate()
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_PreventMoveNSkill = function(deltaTime)
  -- function num : 0_11
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Movie = function(deltaTime)
  -- function num : 0_12 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if check_ShowWindow() then
      close_WindowPanelList()
      return 
    else
      if Panel_UIControl:IsShow() then
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
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_GameExit = function(deltaTime)
  -- function num : 0_13 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_DeliveryForGameExit:GetShow() == true then
      FGlobal_DeliveryForGameExit_Show(false)
      return 
    else
      if Panel_Event_100Day:GetShow() == true then
        FGlobal_Event_100Day_Close()
      else
        if Panel_ChannelSelect:GetShow() == true then
          FGlobal_ChannelSelect_Hide()
        else
          GameExitShowToggle(false)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Repair = function(deltaTime)
  -- function num : 0_14 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_FixEquip:GetShow() then
      PaGlobal_FixEquip:fixEquipExit()
    else
      PaGlobal_Repair:RepairExit()
    end
  end
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ActionKey = function(deltaTime)
  -- function num : 0_15
  local isEnd = false
  local inputType = nil
  if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
    inputType = PaGlobal_Option:GetKeyCustomInputType()
  else
    inputType = KeyCustom_Action_GetInputType()
  end
  if inputType == nil or inputType < 0 then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    return 
  end
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    isEnd = true
  else
    if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_DELETE) then
      keyCustom_Clear_ActionKey(inputType)
      isEnd = true
    else
      if keyCustom_CheckAndSet_ActionKey(inputType) then
        isEnd = true
      end
    end
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
      PaGlobal_Option:CompleteKeyCustomMode()
      return 
    end
    KeyCustom_Action_UpdateButtonText_Key()
    KeyCustom_Action_KeyButtonCheckReset(inputType)
  end
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ActionPad = function(deltaTime)
  -- function num : 0_16
  local isEnd = false
  local inputType = nil
  if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
    inputType = PaGlobal_Option:GetKeyCustomInputType()
  else
    inputType = KeyCustom_Action_GetInputType()
  end
  if inputType == nil or inputType < 0 then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    return 
  end
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    isEnd = true
  else
    if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_DELETE) then
      keyCustom_Clear_ActionPad(inputType)
      isEnd = true
    else
      if keyCustom_CheckAndSet_ActionPad(inputType) then
        isEnd = true
      end
    end
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
      PaGlobal_Option:CompleteKeyCustomMode()
      return 
    end
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_PadButtonCheckReset(inputType)
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_UiKey = function(deltaTime)
  -- function num : 0_17
  local isEnd = false
  local inputType = nil
  if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
    inputType = PaGlobal_Option:GetKeyCustomInputType()
  else
    inputType = KeyCustom_Ui_GetInputType()
  end
  if inputType == nil or inputType < 0 then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    return 
  end
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    isEnd = true
  else
    if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_DELETE) then
      keyCustom_Clear_UiKey(inputType)
      isEnd = true
    else
      if keyCustom_CheckAndSet_UiKey(inputType) then
        isEnd = true
      end
    end
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
      PaGlobal_Option:CompleteKeyCustomMode()
      return 
    end
    KeyCustom_Ui_UpdateButtonText_Key()
    KeyCustom_Ui_KeyButtonCheckReset(inputType)
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_UiPad = function(deltaTime)
  -- function num : 0_18
  local isEnd = false
  local inputType = nil
  if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
    inputType = PaGlobal_Option:GetKeyCustomInputType()
  else
    inputType = KeyCustom_Ui_GetInputType()
  end
  if inputType == nil or inputType < 0 then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    return 
  end
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    isEnd = true
  else
    if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_DELETE) then
      keyCustom_Clear_UiPad(inputType)
      isEnd = true
    else
      if keyCustom_CheckAndSet_UiPad(inputType) then
        isEnd = true
      end
    end
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
      PaGlobal_Option:CompleteKeyCustomMode()
      return 
    end
    KeyCustom_Ui_UpdateButtonText_Pad()
    KeyCustom_Ui_PadButtonCheckReset(inputType)
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ActionPadFunc1 = function(deltaTime)
  -- function num : 0_19
  local isEnd = false
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    isEnd = true
  else
    if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_DELETE) then
      keyCustom_Clear_ActionPadFunc1(inputType)
      isEnd = true
    else
      if keyCustom_CheckAndSet_ActionPadFunc1(inputType) then
        isEnd = true
      end
    end
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
      PaGlobal_Option:CompleteKeyCustomMode()
      return 
    end
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_FuncPadButtonCheckReset(0)
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ActionPadFunc2 = function(deltaTime)
  -- function num : 0_20
  local isEnd = false
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    isEnd = true
  else
    if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_DELETE) then
      keyCustom_Clear_ActionPadFunc2(inputType)
      isEnd = true
    else
      if keyCustom_CheckAndSet_ActionPadFunc2(inputType) then
        isEnd = true
      end
    end
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    if _ContentsGroup_isNewOption == true and PaGlobal_Option:isOpen() == true then
      PaGlobal_Option:CompleteKeyCustomMode()
      return 
    end
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_FuncPadButtonCheckReset(1)
  end
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_PopupItem = function()
  -- function num : 0_21 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_UseItem_ShowToggle_Func()
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Extraction = function(deltaTime)
  -- function num : 0_22 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_Extraction_Cloth:GetShow() then
      ExtractionCloth_WindowClose()
      InventoryWindow_Close()
      EquipmentWindow_Close()
      ClothInventory_Close()
    else
      if Panel_Window_Extraction_Crystal:GetShow() then
        Socket_ExtractionCrystal_WindowClose()
        InventoryWindow_Close()
        EquipmentWindow_Close()
        ClothInventory_Close()
      else
        if Panel_Window_Extraction_EnchantStone:GetShow() then
          ExtractionEnchantStone_WindowClose()
          InventoryWindow_Close()
          EquipmentWindow_Close()
          ClothInventory_Close()
        else
          PaGlobal_Extraction:openPanel(false)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_InGameCustomize = function(deltaTime)
  -- function num : 0_23 , upvalues : VCK
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
    -- function num : 0_23_0
    FGlobal_ScreenShotFrame_Close()
  end

      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_CONTENT")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_TITLE"), content = messageBoxMemo, functionYes = screenShotFrame_Close, functionNo = MessageBox_Empty_function, exitButton = true, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      return 
    else
      do
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ADD) then
          ScreenShotFrameSize_Increase()
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SUBTRACT) then
            ScreenShotFrameSize_Decrease()
          else
            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
              FGlobal_TakeAScreenShot()
            end
          end
        end
      end
    end
  end
end

local prevPressControl = nil
-- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_InGameCashShop = function(delataTime)
  -- function num : 0_24 , upvalues : VCK, prevPressControl
  if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_CashShop) then
    InGameShop_Close()
    Panel_Tooltip_Item_hideTooltip()
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_Inventory:IsShow() and not Panel_Window_Inventory:IsUISubApp() then
      Panel_Window_Inventory:SetShow(false)
    else
      if Panel_IngameCashShop_BuyOrGift:GetShow() then
        InGameShopBuy_Close()
      else
        if Panel_IngameCashShop_GoodsDetailInfo:GetShow() then
          InGameShopDetailInfo_Close()
          Panel_Tooltip_Item_hideTooltip()
        else
          if Panel_QnAWebLink:GetShow() then
            FGlobal_QnAWebLink_Close()
          else
            if Panel_IngameCashShop_MakePaymentsFromCart:GetShow() then
              FGlobal_IngameCashShop_MakePaymentsFromCart_Close()
            else
              if Panel_IngameCashShop_HowUsePearlShop:GetShow() then
                Panel_IngameCashShop_HowUsePearlShop_Close()
              else
                if Panel_IngameCashShop_Coupon:GetShow() then
                  IngameCashShopCoupon_Close()
                else
                  if Panel_IngameCashShop_EventCart:GetShow() then
                    IngameCashShopEventCart_Close()
                  else
                    if (getGameDanceEditor()):isShow() then
                      (getGameDanceEditor()):hide()
                    else
                      InGameShop_Close()
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
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) and FGlobal_InGameShop_IsSelectedSearchName() then
    InGameShop_Search()
  end
  if FGlobal_InGameShop_IsSelectedSearchName() then
    local pressControl = getPressControl()
    if pressControl == nil then
      pressControl = prevPressControl
    end
    local searchEdit = FGlobal_InGameCashShop_GetSearchEdit()
    prevPressControl = pressControl
    if pressControl == nil or pressControl:GetKey() ~= searchEdit:GetKey() then
      ClearFocusEdit()
    else
      return 
    end
  end
  do
    if not Panel_IngameCashShop_BuyOrGift:GetShow() and GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Inventory) then
      if Panel_Window_Inventory:IsShow() then
        InventoryWindow_Close()
      else
        FGlobal_InGameShop_OpenInventory()
      end
    end
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Dye = function(delataTime)
  -- function num : 0_25 , upvalues : VCK
  if (not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE)) or GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Dyeing) then
    audioPostEvent_SystemUi(1, 23)
    FGlobal_Panel_DyeReNew_Hide()
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_ItemMarket = function(delataTime)
  -- function num : 0_26 , upvalues : VCK, IM
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_ItemMarket_ItemSet:GetShow() then
      FGlobal_ItemMarketItemSet_Close()
    else
      if Panel_Window_ItemMarket_RegistItem:GetShow() then
        FGlobal_ItemMarketRegistItem_Close()
      else
        if Panel_ItemMarket_PreBid_Manager:GetShow() then
          FGlobal_ItemMarketPreBid_Manager_Close()
        else
          if Panel_ItemMarket_PreBid:GetShow() then
            FGlobal_ItemMarketPreBid_Close()
          else
            if Panel_ItemMarket_AlarmList:GetShow() then
              FGlobal_ItemMarketAlarmList_Close()
            else
              if Panel_ItemMarket_BidDesc:GetShow() then
                Panel_ItemMarket_BidDesc_Hide()
              else
                if Panel_Window_ItemMarket:GetShow() and not Panel_Window_ItemMarket:IsUISubApp() then
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
              end
            end
          end
        end
      end
    end
    if ToClient_CheckExistSummonMaid() and Panel_Window_ItemMarket:GetShow() == false then
      ToClient_CallHandlerMaid("_maidLogOut")
    end
  end
  if FGlobal_isOpenItemMarketBackPage() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) and FGlobal_isItemMarketBuyConfirm() == false then
    FGlobal_HandleClicked_ItemMarketBackPage()
  end
  if Panel_Window_ItemMarket_BuyConfirm:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)) then
    HandleClicked_ItemMarket_BuyItem()
  end
  if Panel_Window_ItemMarket:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
    FGolbal_ItemMarketNew_Search()
  end
  if Panel_ItemMarket_PreBid:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
    if FGlobal_ItemMarketPreBid_Check_OpenType() == 0 then
      FGlobal_ItemMarketPreBid_Confirm()
    else
      FGlobal_ItemMarketPreBid_Close()
    end
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)) then
    if Panel_IngameCashShop_Password:GetShow() == true then
      PayMentPassword_Confirm()
    else
      FGlobal_ItemMarketRegistItem_RegistDO()
    end
  end
  if getInputMode() ~= IM.eProcessorInputMode_ChattingInputMode and Panel_Window_ItemMarket:GetShow() and GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Inventory) then
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

-- DECOMPILER ERROR at PC111: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_ProductNote = function(deltaTime)
  -- function num : 0_27 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_ProductNote_ShowToggle()
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_QnAWebLink = function(deltaTime)
  -- function num : 0_28 , upvalues : VCK
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) and Panel_QnAWebLink_ShowToggle() == false then
    CheckChattingInput()
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_TradeGame = function(deltaTime)
  -- function num : 0_29
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    Fglobal_TradeGame_Close()
    return 
  end
  global_Update_TradeGame(deltaTime)
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_CutSceneMode = function(deltaTime)
  -- function num : 0_30
  if ToClient_cutsceneIsPlay() then
    if not (MessageBox.isPopUp)() and isKeyDown_Once((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "CUTSCENE_EXIT_MESSAGEBOX_MEMO")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionYes = ToClient_CutsceneStop, functionNo = MessageBox_Empty_function, exitButton = true, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
    do
      Panel_MovieTheater_LowLevel_WindowClose()
      do return  end
    end
  end
end

-- DECOMPILER ERROR at PC125: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_UiSetting = function(deltaTime)
  -- function num : 0_31 , upvalues : VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_UiSet_Close()
    return 
  end
end

-- DECOMPILER ERROR at PC129: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_Gacha_Roulette = function(deltaTime)
  -- function num : 0_32 , upvalues : VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
    FGlobal_gacha_Roulette_OnPressSpace()
  else
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_gacha_Roulette_OnPressEscape()
    end
  end
  return 
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_EventNotify = function(deltaTime)
  -- function num : 0_33 , upvalues : VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    EventNotifyContent_Close()
    CheckChattingInput()
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_ScreenShotMode = function(delataTime)
  -- function num : 0_34 , upvalues : VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    local screenShotFrame_Close = function()
    -- function num : 0_34_0
    FGlobal_ScreenShotFrame_Close()
  end

    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_CONTENT")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_TITLE"), content = messageBoxMemo, functionYes = screenShotFrame_Close, functionNo = MessageBox_Empty_function, exitButton = true, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
        setUiInputProcessed(VCK.KeyCode_SPACE)
        FGlobal_TakeAScreenShot()
      else
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ADD) then
          ScreenShotFrameSize_Increase()
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SUBTRACT) then
            ScreenShotFrameSize_Decrease()
          end
        end
      end
      return 
    end
  end
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_InGameDance = function(deltaTime)
  -- function num : 0_35 , upvalues : VCK
  if (getGameDanceEditor()):isShow() == true and not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Dance_Close()
  end
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_KeyCustom_ButtonShortcuts = function(deltaTime)
  -- function num : 0_36
  local isEnd = false
  local clickedAlt = isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_MENU)
  local clickedShift = isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT)
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    PaGlobal_ButtonShortcuts:UiRefresh(PaGlobal_ButtonShortcuts._curId)
    isEnd = true
  else
    if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_DELETE) then
      PaGlobal_ButtonShortcuts:Remove()
      isEnd = true
    end
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    return 
  end
  if clickedAlt == false then
    return 
  end
  local VirtualKeyCode = keyCustom_GetVirtualKey()
  if VirtualKeyCode > 0 then
    isEnd = true
  end
  if isEnd then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    PaGlobal_ButtonShortcuts:Register(VirtualKeyCode, clickedAlt, clickedShift)
  end
end

-- DECOMPILER ERROR at PC148: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UiModeNotInput = function()
  -- function num : 0_37 , upvalues : VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if GlobalSwitch_UseOldAlchemy == false then
      FGlobal_Alchemy_Close()
    else
      Alchemy_Close()
    end
  end
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_ChattingMacro = function()
  -- function num : 0_38 , upvalues : VCK
  if isKeyPressed(VCK.KeyCode_MENU) == false then
    return false
  end
  if isKeyPressed(VCK.KeyCode_SHIFT) == false then
    return false
  end
  local ii = nil
  for ii = VCK.KeyCode_0, VCK.KeyCode_9 do
    local key = ii - VCK.KeyCode_0 - 1
    if key < 0 then
      key = VCK.KeyCode_9 - VCK.KeyCode_0
    end
    if isKeyDown_Once(ii) and ToClient_getMacroChatMessage(key) ~= "" then
      ToClient_executeChatMacro(key)
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC155: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_SkillkeyBinder = function(deltaTime)
  -- function num : 0_39
  if isUseNewQuickSlot() then
    local ii = nil
    local quickSlot1 = (CppEnums.ActionInputType).ActionInputType_QuickSlot1
    local quickSlot20 = (CppEnums.ActionInputType).ActionInputType_QuickSlot20
    for ii = quickSlot1, quickSlot20 do
      if keyCustom_IsDownOnce_Action(ii) then
        HandleClicked_NewQuickSlot_Use(ii - quickSlot1)
        return 
      end
    end
  else
    do
      local ii = nil
      local quickSlot1 = (CppEnums.ActionInputType).ActionInputType_QuickSlot1
      local quickSlot10 = (CppEnums.ActionInputType).ActionInputType_QuickSlot10
      for ii = quickSlot1, quickSlot10 do
        if keyCustom_IsDownOnce_Action(ii) then
          QuickSlot_Click(tostring(ii - quickSlot1))
          return 
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC161: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_Normal = function(deltaTime)
  -- function num : 0_40 , upvalues : VCK, IM, UIMode
  if (MessageBox.isPopUp)() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      (MessageBox.keyProcessEnter)()
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      return true
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        (MessageBox.keyProcessEscape)()
        return true
      end
    end
  else
    if Panel_UseItem:IsShow() then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
        Click_Panel_UserItem_Yes()
        setUiInputProcessed(VCK.KeyCode_RETURN)
        setUiInputProcessed(VCK.KeyCode_SPACE)
      else
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          Panel_UseItem_ShowToggle_Func()
        end
      end
      return true
    else
      if Panel_ExitConfirm:GetShow() then
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
          Panel_GameExit_MinimizeTray()
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
            Panel_ExitConfirm:SetShow(false)
          end
        end
        return true
      else
        if Panel_NumberPad_IsPopUp() then
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F) then
            Panel_NumberPad_ButtonAllSelect_Mouse_Click(0)
            setUiInputProcessed(VCK.KeyCode_F)
          else
            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) or keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_Interaction) then
              Panel_NumberPad_ButtonConfirm_Mouse_Click()
              setUiInputProcessed(VCK.KeyCode_RETURN)
              setUiInputProcessed(VCK.KeyCode_SPACE)
              keyCustom_KeyProcessed_Action((CppEnums.ActionInputType).ActionInputType_Interaction)
            else
              if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                Panel_NumberPad_ButtonCancel_Mouse_Click()
              end
            end
          end
          Panel_NumberPad_NumberKey_Input()
          return true
        else
          if Panel_Chatting_Macro:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
            FGlobal_Chatting_Macro_ShowToggle()
            FGlobal_Chatting_Macro_SetCHK(false)
            CheckChattingInput()
            return true
          end
        end
      end
    end
  end
  if Panel_Chat_SocialMenu:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
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
  if Panel_Chat_SubMenu:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Chatting_Block_GoldSeller:GetShow() then
      FGlobal_reportSeller_Close()
      return true
    end
    Panel_Chat_SubMenu:SetShow(false)
    return true
  end
  if Panel_GuildIncentive:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) and not FGlobal_CheckSaveGuildMoneyUiEdit(GetFocusEdit()) then
      FGlobal_SaveGuildMoney_Send()
      return true
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        FGlobal_GuildIncentive_Close()
        return true
      end
    end
    FGlobal_GuildDeposit_InputCheck()
    return true
  else
    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_AlchemySton) and isKeyPressed(VCK.KeyCode_CONTROL) == false then
      local inputMode = getInputMode()
      if inputMode == IM.eProcessorInputMode_GameMode then
        FGlobal_AlchemyStone_Use()
        return true
      else
        if (inputMode == IM.eProcessorInputMode_UiMode or inputMode == IM.eProcessorInputMode_UiControlMode) and UIMode.eUIMode_Default == GetUIMode() then
          FGlobal_AlchemyStone_Use()
          return true
        end
      end
    else
      do
        if Panel_EventNotifyContent:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          HandleClicked_EventNotifyContent_Close()
          return true
        end
        if Panel_Window_PetInfoNew:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_PetInfoNew_Close()
          return true
        end
        if Panel_EventNotify:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_EventNotifyClose()
          return true
        end
        if Panel_PcRoomNotify:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE)) then
          FGlobal_PcRoomNotifyClose()
          return true
        end
        if Panel_Introduction:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_Introcution_TooltipHide()
          return true
        end
        if Panel_ChallengePresent:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
          FGlobal_ChallengePresent_AcceptReward()
          return true
        end
        if Panel_SaveFreeSet:GetShow() then
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
            setUiInputProcessed(VCK.KeyCode_RETURN)
            setUiInputProcessed(VCK.KeyCode_SPACE)
            HandleClicked_UiSet_ConfirmSetting()
            return true
          else
            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
              if Panel_SaveSetting:GetShow() then
                PaGlobal_Panel_SaveSetting_Hide()
                return true
              else
                PaGlobal_UiSet_FreeSet_Close()
                return true
              end
            end
          end
        else
          if Panel_UI_Setting:IsUse() then
            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
              setUiInputProcessed(VCK.KeyCode_RETURN)
              setUiInputProcessed(VCK.KeyCode_SPACE)
              UiSet_FreeSet_Open()
              return true
            else
              if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                if Panel_SaveSetting:GetShow() then
                  PaGlobal_Panel_SaveSetting_Hide()
                  return true
                else
                  FGlobal_UiSet_Close()
                  return true
                end
              end
            end
          else
            if Panel_Win_Check:GetShow() then
              if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
                (MessageBoxCheck.keyProcessEnter)()
                setUiInputProcessed(VCK.KeyCode_RETURN)
                setUiInputProcessed(VCK.KeyCode_SPACE)
                return true
              else
                if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                  (MessageBoxCheck.keyProcessEscape)()
                  return true
                end
              end
            else
              if getSelfPlayer() ~= nil and ((getSelfPlayer()):get()):isShowWaitComment() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                EventSelfPlayerWaitCommentClose()
                return true
              end
            end
          end
        end
        if Panel_RandomBoxSelect:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_Gacha_Roulette_Close()
          return true
        end
        if Panel_IngameCashShop_EasyPayment:IsShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          if Panel_IngameCashShop_BuyOrGift:GetShow() then
            InGameShopBuy_Close()
            return true
          end
          PaGlobal_EasyBuy:Close()
          return true
        end
        if Panel_Window_StampCoupon:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_PearlStamp_Close()
          return true
        end
        if Panel_Window_MacroCheckQuizKeyPad:GetShow() == true and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          PaGlobal_MacroCheckQuizkeyPadClose()
          return true
        end
        if Panel_RecentMemory:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          RecentMemory_Close()
          return true
        end
        if Panel_Party_ItemList:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
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
        return false
      end
    end
  end
end

local InteractionCheck = function(interactionType)
  -- function num : 0_41
  if interactionType == (CppEnums.InteractionType).InteractionType_ExchangeItem or interactionType == (CppEnums.InteractionType).InteractionType_InvitedParty or interactionType == (CppEnums.InteractionType).InteractionType_GuildInvite then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC166: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_ChattingInputMode = function()
  -- function num : 0_42 , upvalues : VCK
  uiEdit = GetFocusEdit()
  if uiEdit == nil then
    return false
  end
  if WaitComment_CheckCurrentUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      settingWaitCommentConfirm()
    end
    return true
  else
    if FGlobal_CheckEditBox_IngameCashShop_NewCart(uiEdit) then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        FGlobal_EscapeEditBox_IngameCashShop_NewCart(false)
      end
      return true
    else
      if FGlobal_CheckEditBox_GuildRank(uiEdit) then
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_EscapeEditBox_GuildRank()
        end
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
          GuildSearch_Confirm()
        end
        return true
      else
        if FGlobal_CheckEditBox_IngameCashShop(uiEdit) then
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
            FGlobal_EscapeEditBox_IngameCashShop()
          end
          return true
        else
          if FGlobal_CheckEditBox_PetCompose(uiEdit) then
            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
              FGlobal_EscapeEditBox_PetCompose(false)
            end
            return true
          else
            if NpcNavi_CheckCurrentUiEdit(uiEdit) then
              if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                NpcNavi_OutInputMode(false)
              end
              return true
            else
              -- DECOMPILER ERROR at PC136: Unhandled construct in 'MakeBoolean' P1

              if ChatInput_CheckCurrentUiEdit(uiEdit) and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) and _ContentsGroup_isConsoleTest == true then
                ChatInput_PressedEnter()
              end
            end
          end
        end
      end
    end
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_UP) then
    if ToClient_isComposition() then
      return 
    end
    ChatInput_PressedUp()
  else
    if isKeyPressed(VCK.KeyCode_MENU) then
      ChatInput_CheckReservedKey()
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_TAB) then
        ChatInput_ChangeInputFocus()
      else
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          if ToClient_isComposition() then
            return 
          end
          ChatInput_CancelAction()
          ChatInput_CancelMessage()
          ChatInput_Close()
          ClearFocusEdit()
          friend_clickAddFriendClose()
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
            ChatInput_CheckInstantCommand()
          else
            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) or isKeyPressed(VCK.KeyCode_BACK) then
              ChatInput_CheckRemoveLinkedItem()
            else
              if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_ChatTabNext) then
                moveChatTab(true)
              else
                if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_ChatTabPrev) then
                  moveChatTab(false)
                end
              end
            end
          end
        end
      end
    end
  end
  if AddFriendInput_CheckCurrentUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      friend_clickAddFriendClose()
    end
    return true
  else
    if FriendMessanger_CheckCurrentUiEdit(uiEdit) then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        friend_killFocusMessangerByKey()
      end
      return true
    else
      if FGlobal_CheckCurrentVendingMachineUiEdit(uiEdit) then
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_VendingMachineClearFocusEdit(uiEdit)
        end
        return true
      else
        if FGlobal_CheckCurrentConsignmentSaleUiEdit(uiEdit) then
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
            FGlobal_ConsignmentSaleClearFocusEdit()
          end
          return true
        else
          if FGlobal_CheckGuildLetsWarUiEdit(uiEdit) then
            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
              FGlobal_GuildLetsWarClearFocusEdit()
            end
            return true
          else
            if FGlobal_CheckGuildNoticeUiEdit(uiEdit) then
              if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                FGlobal_GuildNoticeClearFocusEdit()
              end
              return true
            else
              if FGlobal_CheckGuildIncentiveUiEdit(uiEdit) then
                if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                  FGlobal_GuildIncentiveClearFocusEdit()
                end
                return true
              else
                if FGlobal_CheckArshaPvpUiEdit(uiEdit) then
                  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                    FGlobal_ArshaPvPClearFocusEdit()
                  end
                  return true
                else
                  if FGlobal_CheckArshaNameUiEdit_A(uiEdit) then
                    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                      FGlobal_ArshaNameClearFocusEdit_A()
                    end
                    return true
                  else
                    if FGlobal_CheckArshaNameUiEdit_B(uiEdit) then
                      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                        FGlobal_ArshaNameClearFocusEdit_B()
                      end
                      return true
                    else
                      if FGlobal_CheckGuildIntroduceUiEdit(uiEdit) then
                        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                          FGlobal_GuildIntroduceClearFocusEdit()
                        end
                        return true
                      else
                        if FGlobal_ChattingFilter_UiEdit(uiEdit) then
                          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                            FGlobal_ChattingFilter_ClearFocusEdit()
                          end
                          return true
                        else
                          if FGlobal_CheckPartyListUiEdit(uiEdit) then
                            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                              FGlobal_PartyListClearFocusEdit()
                            end
                            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
                              FGlobal_PartyListClearFocusEdit()
                              HandleClicked_PartyList_DoSearch()
                            end
                            return true
                          else
                            if FGlobal_CheckPartyListRecruiteUiEdit(uiEdit) then
                              if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                FGlobal_PartyListClearFocusEdit()
                              end
                              return true
                            else
                              if Panel_Knowledge_CheckCurrentUiEdit(uiEdit) then
                                if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                  Panel_Knowledge_OutInputMode(false)
                                end
                                return true
                              else
                                if GlobalSwitch_UseOldAlchemy == false and FGlobal_Alchemy_CheckEditBox(uiEdit) then
                                  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                    FGlobal_Alchemy_ClearEditFocus()
                                  end
                                  return true
                                else
                                  if _ContentsGroup_isMemoOpen == true and FGlobal_Memo_CheckUiEdit(uiEdit) then
                                    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                      PaGlobal_Memo:Save()
                                    end
                                    return true
                                  else
                                    if _ContentsGroup_isNewOption == true and FGlobal_Option_CheckUiEdit(uiEdit) == true then
                                      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                        ClearFocusEdit()
                                      else
                                        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
                                          PaGlobal_Option:ClickedSeachOption()
                                        end
                                      end
                                      return true
                                    else
                                      if FGlobal_ButtonShortcuts_CheckUiEdit(uiEdit) == true then
                                        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                          ClearFocusEdit()
                                        else
                                          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
                                            PaGlobal_ButtonShortcuts:ClickedSearch()
                                          end
                                        end
                                        return true
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
              end
            end
          end
        end
      end
    end
  end
  if _ContentsGroup_isUsedNewCharacterInfo == false and FGlobal_CheckMyIntroduceUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_MyIntroduceClearFocusEdit()
    end
    return true
  end
  if _ContentsGroup_isUsedNewCharacterInfo == true and FGlobal_UI_CharacterInfo_Basic_Global_CheckIntroduceUiEdit(uiEdit) then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      (UI.ClearFocusEdit)()
    end
    return true
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    ClearFocusEdit()
  end
  return false
end

local fastPinDelta = 0
-- DECOMPILER ERROR at PC173: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_UIMode_CommonWindow = function(deltaTime)
  -- function num : 0_43 , upvalues : VCK, fastPinDelta, InteractionCheck
  if FGlobal_GetFirstTutorialState() == true then
    return 
  end
  if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_MentalKnowledge) then
    if GlobalValue_MiniGame_Value_HorseDrop == true then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAMING_DO_NOT_USE"))
      return 
    end
    Panel_Knowledge_Show()
    return 
  end
  if isKeyPressed(VCK.KeyCode_SHIFT) ~= false then
    local isGuild = not GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_PositionNotify)
    do
      local targetPosition = crossHair_GetTargetPosition()
      if ToClient_IsViewSelfPlayer(targetPosition) == true then
        if fastPinDelta < 0.5 then
          ToClient_RequestSendPositionGuide(isGuild, true, false, targetPosition)
          fastPinDelta = 10
        else
          ToClient_RequestSendPositionGuide(isGuild, false, false, targetPosition)
          fastPinDelta = 0
        end
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
      do
        if Panel_Interaction:IsShow() then
          local buttonCount = FGlobal_InteractionButtonCount()
          if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_Interaction) == true then
            local camBlur = getCameraBlur()
            local interactableActor = interaction_getInteractable()
            if interactableActor ~= nil and (not (interactableActor:get()):isPlayer() or (interactableActor:get()):isSelfPlayer()) and camBlur <= 0 then
              local interactionType = interactableActor:getSettedFirstInteractionType()
              if InteractionCheck(interactionType) then
                return 
              end
              Interaction_ButtonPushed(interactionType)
              DragManager:clearInfo()
              return 
            elseif interactableActor ~= nil and (interactableActor:get()):isPlayer() and camBlur <= 0 then
              local interactionType = interactableActor:getSettedFirstInteractionType()
              if InteractionCheck(interactionType) then
                return 
              end
              Interaction_ButtonPushed(interactionType)
              DragManager:clearInfo()
              return 
            end
          else
            -- DECOMPILER ERROR at PC198: Unhandled construct in 'MakeBoolean' P1

            if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_1) and buttonCount >= 2 then
              FGlobal_InteractionButtonActionRun(1)
              DragManager:clearInfo()
              setUiInputProcessed(VCK.KeyCode_F5)
              return 
            end
          end
        end
        -- DECOMPILER ERROR at PC219: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_2) and buttonCount >= 3 then
          FGlobal_InteractionButtonActionRun(2)
          DragManager:clearInfo()
          setUiInputProcessed(VCK.KeyCode_F6)
          return 
        end
        -- DECOMPILER ERROR at PC240: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_3) and buttonCount >= 4 then
          FGlobal_InteractionButtonActionRun(3)
          DragManager:clearInfo()
          setUiInputProcessed(VCK.KeyCode_F7)
          return 
        end
        -- DECOMPILER ERROR at PC261: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_4) and buttonCount >= 5 then
          FGlobal_InteractionButtonActionRun(4)
          DragManager:clearInfo()
          setUiInputProcessed(VCK.KeyCode_F8)
          return 
        end
        -- DECOMPILER ERROR at PC282: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_5) and buttonCount >= 6 then
          FGlobal_InteractionButtonActionRun(5)
          DragManager:clearInfo()
          setUiInputProcessed(VCK.KeyCode_F9)
          return 
        end
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F10) and buttonCount >= 7 then
          FGlobal_InteractionButtonActionRun(6)
          DragManager:clearInfo()
          setUiInputProcessed(VCK.KeyCode_F10)
          return 
        end
        if (getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_Commercial or isGameTypeTaiwan()) and GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_CashShop) then
          if PaGlobal_TutorialManager:isDoingTutorial() then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
            return 
          end
          InGameShop_Open()
          return 
        end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_BlackSpirit) and Panel_Window_Exchange:GetShow() == false then
          if not IsSelfPlayerWaitAction() then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_SUMMON_BLACKSPIRIT"))
            return 
          end
          if PaGlobal_TutorialManager:isDoingTutorial() == true and PaGlobal_TutorialManager:isAllowCallBlackSpirit() == false then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
            return 
          end
          FGlobal_TentTooltipHide()
          ToClient_AddBlackSpiritFlush()
          return 
        end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Chat) then
          ChatInput_Show()
          return 
        end
        if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_Interaction) and Panel_Looting:IsShow() then
          Panel_Looting_buttonLootAll_Mouse_Click(false)
          Panel_Tooltip_Item_hideTooltip()
          ;
          (QuestInfoData.questDescHideWindow)()
        end
        -- DECOMPILER ERROR at PC433: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Help) and Panel_KeyboardHelp ~= nil then
          FGlobal_Panel_WebHelper_ShowToggle()
        end
        do return  end
        -- DECOMPILER ERROR at PC451: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_ProductionNote) and Panel_ProductNote ~= nil and not Panel_ProductNote:IsUISubApp() then
          Panel_ProductNote_ShowToggle()
        end
        do return  end
        local selfPlayer = getSelfPlayer()
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_PlayerInfo) then
          if Panel_Window_CharInfo_Status ~= nil then
            if Panel_Window_CharInfo_Status:GetShow() and not Panel_Window_CharInfo_Status:IsUISubApp() then
              audioPostEvent_SystemUi(1, 31)
              if _ContentsGroup_isUsedNewCharacterInfo == false then
                CharacterInfoWindow_Hide()
              else
                PaGlobal_CharacterInfo:hideWindow()
              end
            else
              if Panel_Window_ServantInfo:GetShow() or Panel_CarriageInfo:GetShow() or Panel_ShipInfo:GetShow() then
                ServantInfo_Close()
                CarriageInfo_Close()
                ShipInfo_Close()
                Panel_Tooltip_Item_hideTooltip()
                TooltipSimple_Hide()
                return 
              end
              audioPostEvent_SystemUi(1, 30)
              if _ContentsGroup_isUsedNewCharacterInfo == false then
                CharacterInfoWindow_Show()
              else
                PaGlobal_CharacterInfo:showWindow(0)
              end
            end
          end
          local selfProxy = selfPlayer:get()
          if selfProxy ~= nil then
            local actorKeyRaw = selfProxy:getRideVehicleActorKeyRaw()
            local temporaryWrapper = getTemporaryInformationWrapper()
            local unsealCacheData = getServantInfoFromActorKey(actorKeyRaw)
            if unsealCacheData ~= nil then
              local inventory = unsealCacheData:getInventory()
              local invenSize = inventory:size()
              if actorKeyRaw ~= 0 then
                if Panel_Window_ServantInfo:GetShow() or Panel_CarriageInfo:GetShow() or Panel_ShipInfo:GetShow() then
                  ServantInfo_Close()
                  CarriageInfo_Close()
                  ShipInfo_Close()
                  Panel_Tooltip_Item_hideTooltip()
                  TooltipSimple_Hide()
                else
                  requestInformationFromServant()
                  ServantInfo_BeforOpenByActorKeyRaw(actorKeyRaw)
                end
              end
            end
          end
          return 
        end
        -- DECOMPILER ERROR at PC598: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Skill) and Panel_Window_Skill ~= nil then
          if Panel_Window_Skill:IsShow() then
            audioPostEvent_SystemUi(1, 17)
            HandleMLUp_SkillWindow_Close()
          else
            audioPostEvent_SystemUi(1, 18)
            PaGlobal_Skill:SkillWindow_Show()
          end
        end
        do return  end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_ChatTabNext) then
          moveChatTab(true)
          return 
        end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_ChatTabPrev) then
          moveChatTab(false)
          return 
        end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UIInputType_PossessionByBlackSpirit) and PaGlobal_AutoManager._ActiveState then
          FGlobal_MouseclickTest()
        end
        do return  end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Inventory) then
          local isInvenOpen = Panel_Window_Inventory:IsShow()
          local isEquipOpen = Panel_Equipment:IsShow()
          local temporaryWrapper = getTemporaryInformationWrapper()
          local servantInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
          local servantShipInfo = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
          if isInvenOpen == false and isEquipOpen == false then
            if isEquipOpen == false then
              Equipment_SetShow(true)
            end
            audioPostEvent_SystemUi(1, 16)
            InventoryWindow_Show(true)
            if Panel_Window_ServantInventory:GetShow() then
              TooltipSimple_Hide()
              Panel_Tooltip_Item_hideTooltip()
            end
          else
            if Panel_Window_Exchange:GetShow() then
              Panel_ExchangePC_BtnClose_Mouse_Click()
              return 
            end
            if Panel_Window_Inventory:IsUISubApp() and isEquipOpen == false then
              Equipment_SetShow(true)
            else
              Equipment_SetShow(false)
            end
            audioPostEvent_SystemUi(1, 15)
            InventoryWindow_Close()
            ServantInventory_Close()
            ClothInventory_Close()
            TooltipSimple_Hide()
          end
          return 
        end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Dyeing) then
          if PaGlobal_TutorialManager:isDoingTutorial() then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
            return 
          end
          if MiniGame_Manual_Value_FishingStart == true then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_FISHING_ACK"))
            return 
          elseif not Panel_Dye_ReNew:GetShow() then
            audioPostEvent_SystemUi(1, 24)
            FGlobal_Panel_Dye_ReNew_Open()
          end
          return 
        end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Present) then
          if not Panel_Window_CharInfo_Status:GetShow() then
            audioPostEvent_SystemUi(1, 34)
            if _ContentsGroup_isUsedNewCharacterInfo == false then
              FGlobal_Challenge_Show()
            else
              PaGlobal_CharacterInfo:showWindow(3)
              FGlobal_TapButton_Complete()
            end
          else
            audioPostEvent_SystemUi(1, 31)
            if _ContentsGroup_isUsedNewCharacterInfo == false then
              FGlobal_Challenge_Hide()
            else
              PaGlobal_CharacterInfo:hideWindow()
            end
          end
          return 
        end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Manufacture) then
          if MiniGame_Manual_Value_FishingStart == true then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_FISHING_ACK"))
            return 
          elseif ToClient_GetMyTeamNoLocalWar() ~= 0 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_LOCALWAR_ALERT"))
            return 
          elseif PaGlobal_TutorialManager:isDoingTutorial() == true then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
            return 
          else
            if not IsSelfPlayerWaitAction() then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
              return 
            end
            if Panel_Manufacture ~= nil and Panel_Window_Inventory ~= nil then
              local isInvenOpen = Panel_Window_Inventory:GetShow()
              local isManufactureOpen = Panel_Manufacture:GetShow()
              if isManufactureOpen == false or isInvenOpen == false then
                audioPostEvent_SystemUi(1, 26)
                Manufacture_Show(nil, (CppEnums.ItemWhereType).eInventory, true)
              else
                audioPostEvent_SystemUi(1, 25)
                Manufacture_Close()
              end
            end
            return 
          end
        end
        do
          if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Guild) then
            local guildWrapper = ToClient_GetMyGuildInfoWrapper()
            if guildWrapper ~= nil then
              local guildGrade = guildWrapper:getGuildGrade()
              if guildGrade == 0 then
                if Panel_ClanList:IsShow() == false then
                  audioPostEvent_SystemUi(1, 36)
                  FGlobal_ClanList_Open()
                else
                  audioPostEvent_SystemUi(1, 31)
                  FGlobal_ClanList_Close()
                end
              elseif Panel_Window_Guild:IsShow() == false then
                audioPostEvent_SystemUi(1, 36)
                GuildManager:Show()
              else
                audioPostEvent_SystemUi(1, 31)
                GuildManager:Hide()
              end
            else
              Panel_Guild_NoneJoinMember:SetShow(true)
            end
            return 
          end
          do
            -- DECOMPILER ERROR at PC988: Unhandled construct in 'MakeBoolean' P1

            if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Mail) and Panel_Mail_Main ~= nil and Panel_Mail_Detail ~= nil then
              local isMailMain = Panel_Mail_Main:IsShow()
              if isMailMain == false then
                audioPostEvent_SystemUi(1, 22)
                Mail_Open()
              else
                audioPostEvent_SystemUi(1, 21)
                Mail_Close()
              end
            end
            do return  end
            if _ContentsGroup_isMemoOpen == true then
              do
                -- DECOMPILER ERROR at PC1020: Unhandled construct in 'MakeBoolean' P1

                if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Memo) and Panel_Memo_List ~= nil then
                  local isMemoList = Panel_Memo_List:IsShow()
                  if isMemoList == false then
                    audioPostEvent_SystemUi(1, 22)
                    PaGlobal_Memo:ListOpen()
                  else
                    audioPostEvent_SystemUi(1, 21)
                    PaGlobal_Memo:ListClose()
                  end
                end
                do return  end
                do
                  do
                    -- DECOMPILER ERROR at PC1051: Unhandled construct in 'MakeBoolean' P1

                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_FriendList) and Panel_FriendList ~= nil then
                      local isFriendList = Panel_FriendList:IsShow()
                      if isFriendList == false then
                        FriendList_show()
                        audioPostEvent_SystemUi(1, 28)
                      else
                        FriendList_hide()
                        audioPostEvent_SystemUi(1, 27)
                      end
                    end
                    do return  end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_QuestHistory) then
                      if Panel_Window_Quest_New:GetShow() then
                        audioPostEvent_SystemUi(1, 27)
                        Panel_Window_QuestNew_Show(false)
                      else
                        audioPostEvent_SystemUi(1, 29)
                        Panel_Window_QuestNew_Show(true)
                      end
                      TooltipSimple_Hide()
                      return 
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
                    if getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_Commercial and not isKeyPressed(VCK.KeyCode_MENU) and GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_BeautyShop) then
                      if PaGlobal_TutorialManager:isDoingTutorial() then
                        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
                        return 
                      end
                      if not (getCustomizingManager()):isShow() then
                        IngameCustomize_Show()
                        return 
                      end
                    end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_WorldMap) then
                      if not Panel_Global_Manual:GetShow() or FGlobal_BulletCount_UiShowCheck() then
                        FGlobal_PushOpenWorldMap()
                      else
                        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_MINIGAMING_NOT_WORLDMAP"))
                        return 
                      end
                    end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_House) then
                      if Panel_HousingList:GetShow() then
                        HousingList_Close()
                      else
                        FGlobal_HousingList_Open()
                      end
                    end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Worker) then
                      FGlobal_WorkerManger_ShowToggle()
                    end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Pet) then
                      FGlobal_PetListNew_Toggle()
                    end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Maid) then
                      if Panel_Window_MaidList:GetShow() then
                        MaidList_Close()
                      else
                        MaidList_Open()
                      end
                    end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Servant) then
                      Servant_Call(0)
                    end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_GuildServant) then
                      FGlobal_GuildServantList_Open()
                    end
                    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_DeleteNavigation) then
                      if ((getSelfPlayer()):get()):getLevel() < 11 then
                        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TUTORIAL_PROGRSS_ACK"))
                        return 
                      end
                      ToClient_DeleteNaviGuideByGroup(0)
                      Panel_NaviButton:SetShow(false)
                      audioPostEvent_SystemUi(0, 15)
                    end
                    ;
                    (PaGlobal_GlobalKeyBinder.Process_CheckEscape)()
                    -- DECOMPILER ERROR: 107 unprocessed JMP targets
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

-- DECOMPILER ERROR at PC177: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_CheckEscape = function()
  -- function num : 0_44 , upvalues : VCK
  if getEscHandle() == true or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) == false then
    return 
  end
  if Panel_MiniGame_Find:GetShow() == true then
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
  if Panel_MovieSkillGuide_Web:GetShow() then
    if Panel_MovieSkillGuide_Weblist:GetShow() then
      PaGlobal_MovieSkillGuide_Weblist:Close()
      return 
    else
      PaGlobal_MovieSkillGuide_Web:Close()
      return 
    end
  end
  if Panel_MovieSkillGuide_Weblist:GetShow() then
    PaGlobal_MovieSkillGuide_Weblist:Close()
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
  if Panel_PartyRecruite:GetShow() then
    PartyListRecruite_Close()
    return 
  end
  if Panel_ServantResurrection:GetShow() then
    Panel_ServantResurrection_Close()
    return 
  end
  if Panel_Window_Camp:GetShow() then
    if Panel_Window_NpcShop:GetShow() then
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
  if Panel_Window_PersonalBattle:GetShow() == true then
    PaGlobal_PersonalBattle:close()
    return 
  end
  if _ContentsGroup_isMemoOpen == true and Panel_Memo_List:GetShow() then
    PaGlobal_Memo:ListClose()
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
  else
    if not checkShowWindow and FGlobal_NpcNavi_IsShowCheck() then
      FGlobal_NpcNavi_Hide()
      return 
    else
      if checkShowWindow and not FGlobal_NpcNavi_IsShowCheck() then
        close_WindowPanelList()
        return 
      else
        Panel_Menu_ShowToggle()
      end
    end
  end
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Process_ConsoleQuickMenu = function(deltaTime)
  -- function num : 0_45
  if _ContentsGroup_isConsoleTest == false or getGamePadEnable() == false then
    return 
  end
  if PaGlobal_Option ~= nil and PaGlobal_Option:Get("ConsolePadKeyType") == 0 then
    return 
  end
  if FGlobal_ConsoleQuickMenuCustom_IsShow() == true then
    FromClient_ConsoleQuickMenu_OpenCustomPage(ToClient_checkQuickMenuCurrentGroup())
    return 
  end
  if getInputMode() ~= (CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode then
    if FGlobal_ConsoleQuickMenu_IsShow() == true then
      FromClient_ConsoleQuickMenu_Quit(__eQuickMenuGroup_Count)
    end
    return 
  end
  if FGlobal_ConsoleQuickMenu_IsShow() == false then
    ToClient_checkAndOpenQuickMenu()
  else
    local position = ToClient_checkAndRunQuickMenu()
    FGlobal_ConsoleQuickMenu_Update(position)
  end
end


