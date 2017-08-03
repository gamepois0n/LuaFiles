-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\globalkeybinder.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local UIMode = Defines.UIMode
local _uiMode = UIMode.eUIMode_Default
local escHandle = false
local isRunClosePopup = false
local mouseKeyTable = {}
local isOnlyCombat = false
GlobalKeyBinder_Load = function()
  -- function num : 0_0 , upvalues : isOnlyCombat
  isOnlyCombat = ToClient_isFakeUIMode()
end

GlobalKeyBinder_MouseKeyMap = function(uiInputType)
  -- function num : 0_1 , upvalues : mouseKeyTable
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  mouseKeyTable[uiInputType] = true
end

local GlobalKeyBinder_CheckKeyPressed = function(keyCode)
  -- function num : 0_2
  return isKeyDown_Once(keyCode)
end

local GlobalKeyBinder_CheckCustomKeyPressed = function(uiInputType)
  -- function num : 0_3 , upvalues : mouseKeyTable, GlobalKeyBinder_CheckKeyPressed, VCK
  do return (keyCustom_IsDownOnce_Ui(uiInputType) or mouseKeyTable[uiInputType]) and not GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_MENU) and not isPhotoMode() end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

local GlobalKeyBinder_CheckProgress = function()
  -- function num : 0_4
  if Panel_Collect_Bar:GetShow() or Panel_Product_Bar:GetShow() or Panel_Enchant_Bar:GetShow() then
    return true
  end
  return false
end

local InteractionCheck = function(interactionType)
  -- function num : 0_5
  if interactionType == (CppEnums.InteractionType).InteractionType_ExchangeItem or interactionType == (CppEnums.InteractionType).InteractionType_InvitedParty or interactionType == (CppEnums.InteractionType).InteractionType_GuildInvite then
    return true
  end
  return false
end

GlobalKeyBinder_CheckProgress_chk = function()
  -- function num : 0_6 , upvalues : GlobalKeyBinder_CheckProgress
  return GlobalKeyBinder_CheckProgress()
end

local GlobalKeyBinder_Clear = function()
  -- function num : 0_7 , upvalues : mouseKeyTable
  mouseKeyTable = {}
end

local _keyBinder_GameMode = function()
  -- function num : 0_8
  DragManager:clearInfo()
end

local _keyBinder_UIMode = function()
  -- function num : 0_9
end

local _keyBinder_Chatting = function()
  -- function num : 0_10 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK, IM, GlobalKeyBinder_CheckCustomKeyPressed
  uiEdit = GetFocusEdit()
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
            end
          end
        end
      end
    end
  end
  if ChatInput_CheckCurrentUiEdit(uiEdit) then
    if not GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_UP) then
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
            ;
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
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
  else
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
                          if FGlobal_CheckMyIntroduceUiEdit(uiEdit) then
                            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                              FGlobal_MyIntroduceClearFocusEdit()
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
  return false
end

local _keyBinder_Mail = function()
  -- function num : 0_11 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
    MailSend_PressedDown()
  else
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_UP) then
      MailSend_PressedUp()
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        MailSend_Close()
      end
    end
  end
end

local _keyBinder_UiModeNotInput = function()
  -- function num : 0_12 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Alchemy_Close()
  end
end

local fastPinDelta = 0
local _keyBinder_UIMode_CommonWindow = function(deltaTime)
  -- function num : 0_13 , upvalues : GlobalKeyBinder_CheckCustomKeyPressed, VCK, fastPinDelta, GlobalKeyBinder_CheckKeyPressed, IM, InteractionCheck, GlobalKeyBinder_Clear, escHandle
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
          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
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
          if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_Interaction) then
            local camBlur = getCameraBlur()
            local interactableActor = interaction_getInteractable()
            if interactableActor ~= nil and (not (interactableActor:get()):isPlayer() or (interactableActor:get()):isSelfPlayer()) and camBlur <= 0 then
              local interactionType = interactableActor:getSettedFirstInteractionType()
              if InteractionCheck(interactionType) then
                return 
              end
              Interaction_ButtonPushed(interactionType)
              DragManager:clearInfo()
              GlobalKeyBinder_Clear()
              return 
            elseif interactableActor ~= nil and (interactableActor:get()):isPlayer() and camBlur <= 0 then
              local interactionType = interactableActor:getSettedFirstInteractionType()
              if InteractionCheck(interactionType) then
                return 
              end
              Interaction_ButtonPushed(interactionType)
              DragManager:clearInfo()
              GlobalKeyBinder_Clear()
              return 
            end
          else
            -- DECOMPILER ERROR at PC207: Unhandled construct in 'MakeBoolean' P1

            if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_1) and buttonCount >= 2 then
              FGlobal_InteractionButtonActionRun(1)
              DragManager:clearInfo()
              GlobalKeyBinder_Clear()
              setUiInputProcessed(VCK.KeyCode_F5)
              return 
            end
          end
        end
        -- DECOMPILER ERROR at PC230: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_2) and buttonCount >= 3 then
          FGlobal_InteractionButtonActionRun(2)
          DragManager:clearInfo()
          GlobalKeyBinder_Clear()
          setUiInputProcessed(VCK.KeyCode_F6)
          return 
        end
        -- DECOMPILER ERROR at PC253: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_3) and buttonCount >= 4 then
          FGlobal_InteractionButtonActionRun(3)
          DragManager:clearInfo()
          GlobalKeyBinder_Clear()
          setUiInputProcessed(VCK.KeyCode_F7)
          return 
        end
        -- DECOMPILER ERROR at PC276: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_4) and buttonCount >= 5 then
          FGlobal_InteractionButtonActionRun(4)
          DragManager:clearInfo()
          GlobalKeyBinder_Clear()
          setUiInputProcessed(VCK.KeyCode_F8)
          return 
        end
        -- DECOMPILER ERROR at PC299: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Interaction_5) and buttonCount >= 6 then
          FGlobal_InteractionButtonActionRun(5)
          DragManager:clearInfo()
          GlobalKeyBinder_Clear()
          setUiInputProcessed(VCK.KeyCode_F9)
          return 
        end
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F10) and buttonCount >= 7 then
          FGlobal_InteractionButtonActionRun(6)
          DragManager:clearInfo()
          GlobalKeyBinder_Clear()
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
        local selfPlayer = getSelfPlayer()
        if selfPlayer == nil then
          return 
        end
        local playerLevel = (selfPlayer:get()):getLevel()
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
          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
          ChatInput_Show()
          return 
        end
        if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_Interaction) and Panel_Looting:IsShow() then
          Panel_Looting_buttonLootAll_Mouse_Click(false)
          Panel_Tooltip_Item_hideTooltip()
          ;
          (QuestInfoData.questDescHideWindow)()
        end
        if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
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
          if check_ShowWindow() then
            close_WindowPanelList()
            ;
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
            FGlobal_NpcNavi_Hide()
            return 
          end
          if check_ShowWindow() and FGlobal_NpcNavi_IsShowCheck() then
            close_WindowPanelList()
            ;
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
            FGlobal_NpcNavi_Hide()
            return 
          elseif not check_ShowWindow() and FGlobal_NpcNavi_IsShowCheck() then
            FGlobal_NpcNavi_Hide()
            return 
          elseif check_ShowWindow() and not FGlobal_NpcNavi_IsShowCheck() then
            close_WindowPanelList()
            ;
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
            return 
          elseif IM.eProcessorInputMode_UiMode == getInputMode() then
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
            if Panel_Menu_ShowToggle() then
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
            end
            return 
          else
            if Panel_Menu_ShowToggle() then
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
            else
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
            end
            return 
          end
        end
        -- DECOMPILER ERROR at PC784: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Help) and Panel_KeyboardHelp ~= nil then
          if FGlobal_KeyboardHelpShow() then
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
          elseif check_ShowWindow() == false then
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
          end
        end
        do return  end
        -- DECOMPILER ERROR at PC819: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_ProductionNote) and Panel_ProductNote ~= nil and not Panel_ProductNote:IsUISubApp() then
          if Panel_ProductNote_ShowToggle() then
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
          elseif check_ShowWindow() == false then
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
          end
        end
        do return  end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_PlayerInfo) then
          if Panel_Window_CharInfo_Status ~= nil then
            if Panel_Window_CharInfo_Status:GetShow() and not Panel_Window_CharInfo_Status:IsUISubApp() then
              audioPostEvent_SystemUi(1, 31)
              CharacterInfoWindow_Hide()
              if check_ShowWindow() == false then
                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
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
              CharacterInfoWindow_Show()
              ;
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
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
                  if check_ShowWindow() == false then
                    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                  end
                else
                  requestInformationFromServant()
                  ServantInfo_BeforOpenByActorKeyRaw(actorKeyRaw)
                  ;
                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                end
              end
            end
          end
          return 
        end
        -- DECOMPILER ERROR at PC987: Unhandled construct in 'MakeBoolean' P1

        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Skill) and Panel_Window_Skill ~= nil then
          if Panel_Window_Skill:IsShow() then
            audioPostEvent_SystemUi(1, 17)
            HandleMLUp_SkillWindow_Close()
            if check_ShowWindow() == false then
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
            end
          else
            audioPostEvent_SystemUi(1, 18)
            PaGlobal_Skill:SkillWindow_Show()
            ;
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
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
            ;
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
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
            TooltipSimple_Hide()
            if check_ShowWindow() == false then
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
            end
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
            ;
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
            FGlobal_Panel_Dye_ReNew_Open()
          end
          return 
        end
        if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Present) then
          if not Panel_Window_CharInfo_Status:GetShow() then
            audioPostEvent_SystemUi(1, 34)
            FGlobal_Challenge_Show()
          else
            audioPostEvent_SystemUi(1, 31)
            FGlobal_Challenge_Hide()
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
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
              local isInvenOpen = Panel_Window_Inventory:GetShow()
              local isManufactureOpen = Panel_Manufacture:GetShow()
              if isManufactureOpen == false or isInvenOpen == false then
                audioPostEvent_SystemUi(1, 26)
                Manufacture_Show(nil, (CppEnums.ItemWhereType).eInventory, true)
              else
                audioPostEvent_SystemUi(1, 25)
                Manufacture_Close()
                if check_ShowWindow() == false then
                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                end
              end
            end
            return 
          end
        end
        do
          do
            if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Guild) then
              local guildWrapper = ToClient_GetMyGuildInfoWrapper()
              if guildWrapper ~= nil then
                local guildGrade = guildWrapper:getGuildGrade()
                if guildGrade == 0 then
                  if Panel_ClanList:IsShow() == false then
                    audioPostEvent_SystemUi(1, 36)
                    FGlobal_ClanList_Open()
                    ;
                    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                  else
                    audioPostEvent_SystemUi(1, 31)
                    FGlobal_ClanList_Close()
                    if check_ShowWindow() == false then
                      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                    end
                  end
                elseif Panel_Window_Guild:IsShow() == false then
                  audioPostEvent_SystemUi(1, 36)
                  GuildManager:Show()
                  ;
                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                else
                  audioPostEvent_SystemUi(1, 31)
                  GuildManager:Hide()
                  if check_ShowWindow() == false then
                    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                  end
                end
              else
                Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NO_GUILD"))
              end
              return 
            end
            -- DECOMPILER ERROR at PC1423: Unhandled construct in 'MakeBoolean' P1

            if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Mail) and Panel_Mail_Main ~= nil and Panel_Mail_Detail ~= nil then
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
              local isMailMain = Panel_Mail_Main:IsShow()
              if isMailMain == false then
                audioPostEvent_SystemUi(1, 22)
                Mail_Open()
              else
                audioPostEvent_SystemUi(1, 21)
                Mail_Close()
                if check_ShowWindow() == false then
                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                end
              end
            end
            do return  end
            -- DECOMPILER ERROR at PC1466: Unhandled construct in 'MakeBoolean' P1

            if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_FriendList) and Panel_FriendList ~= nil then
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
              local isFriendList = Panel_FriendList:IsShow()
              if isFriendList == false then
                FriendList_show()
                audioPostEvent_SystemUi(1, 28)
              else
                FriendList_hide()
                audioPostEvent_SystemUi(1, 27)
                if check_ShowWindow() == false then
                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                end
              end
            end
            do return  end
            if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_QuestHistory) then
              if Panel_Window_Quest_New:GetShow() then
                audioPostEvent_SystemUi(1, 27)
                Panel_Window_QuestNew_Show(false)
                if check_ShowWindow() == false then
                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                end
              else
                audioPostEvent_SystemUi(1, 29)
                Panel_Window_QuestNew_Show(true)
                ;
                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
              end
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
              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
              if not Panel_Global_Manual:GetShow() or FGlobal_BulletCount_UiShowCheck() then
                FGlobal_PushOpenWorldMap()
              else
                Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_MINIGAMING_NOT_WORLDMAP"))
                return 
              end
            end
            if Panel_Window_ItemMarket:GetShow() and FGlobal_isOpenItemMarketBackPage() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) and false == FGlobal_isItemMarketBuyConfirm() then
              FGlobal_HandleClicked_ItemMarketBackPage()
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
            -- DECOMPILER ERROR: 134 unprocessed JMP targets
          end
        end
      end
    end
  end
end

local _keyBinder_UIMode_NpcDialog = function(deltaTime)
  -- function num : 0_14 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK, GlobalKeyBinder_CheckCustomKeyPressed
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
    if FGlobal_CehckedGuildEditUI(GetFocusEdit()) and not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      handleClicked_GuildCreateCancel()
    end
    do return  end
    if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if Panel_Window_MasterpieceAuction:GetShow() then
        PaGlobal_MasterpieceAuction:close()
        return 
      end
      if Panel_EnchantExtraction:GetShow() then
        Panel_EnchantExtraction_Close()
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
      end
      if Panel_Window_ItemMarket_RegistItem:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)) then
        FGlobal_ItemMarketRegistItem_RegistDO()
      end
    end
  end
end

local _keyBinder_UIMode_WorldMap = function(deltaTime)
  -- function num : 0_15 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK, GlobalKeyBinder_CheckCustomKeyPressed, IM
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
      if isNewItemmarket_chk() then
        FGolbal_ItemMarketNew_Close()
        return 
      else
        FGolbal_ItemMarket_Close()
        return 
      end
    end
    if Panel_Window_ItemMarket_ItemSet:GetShow() then
      FGlobal_ItemMarketItemSet_Close()
      return 
    end
    if isWorldMapGrandOpen() and Panel_WorldMap_MovieGuide:GetShow() then
      Panel_Worldmap_MovieGuide_Close()
      return 
    end
    FGlobal_WorldMapWindowEscape()
  else
    if FGlobal_AskCloseWorldMap() then
      FGlobal_PopCloseWorldMap()
    else
      if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Chat) then
        if not Panel_Window_ItemMarket:GetShow() then
          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
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
    -- DECOMPILER ERROR at PC163: Unhandled construct in 'MakeBoolean' P1

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

local _keyBinder_WorldMapSearch = function(deltaTime)
  -- function num : 0_16 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK, IM
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    ClearFocusEdit()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    if ToClient_WorldMapIsShow() then
      SetUIMode((Defines.UIMode).eUIMode_WorldMap)
    else
      SetUIMode((Defines.UIMode).eUIMode_Default)
    end
  end
end

local _keyBinder_UIMode_Housing = function(deltaTime)
  -- function num : 0_17 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK, escHandle
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
            if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
              Panel_Housing_CancelModeFromKeyBinder()
              return 
            end
          end
        end
      end
    end
  end
end

local _keyBinder_UIMode_Mental = function(deltaTime)
  -- function num : 0_18 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK, GlobalKeyBinder_CheckCustomKeyPressed, IM
  if not escHandle and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_MentalKnowledge)) then
    Panel_Knowledge_Hide()
    if (UI.isGameOptionMouseMode)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  end
end

local _keyBinder_UIMode_MentalGame = function(deltaTime)
  -- function num : 0_19 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    MentalGame_Hide()
    SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  end
end

local _keyBinder_UIMode_InGameDance = function(deltaTime)
  -- function num : 0_20 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if (getGameDanceEditor()):isShow() == true and not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Dance_Close()
  end
end

local _keyBinder_UIMode_InGameCustomize = function(deltaTime)
  -- function num : 0_21 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if Panel_CustomizationMain:IsShow() and Panel_CustomizationMain:GetAlpha() == 1 and not escHandle and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F4)) then
    if Panel_CustomizingAlbum:GetShow() then
      CustomizingAlbum_Close()
    else
      IngameCustomize_Hide()
    end
  end
  if Panel_Widget_ScreenShotFrame:GetShow() then
    if not escHandle and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_F4)) then
      local screenShotFrame_Close = function()
    -- function num : 0_21_0
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
local _keyBinder_UIMode_InGameCashShop = function(delataTime)
  -- function num : 0_22 , upvalues : GlobalKeyBinder_CheckCustomKeyPressed, GlobalKeyBinder_CheckKeyPressed, VCK, prevPressControl
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

local _keyBinder_UIMode_Dye = function(delataTime)
  -- function num : 0_23 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK, GlobalKeyBinder_CheckCustomKeyPressed, IM
  if (not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE)) or GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Dyeing) then
    audioPostEvent_SystemUi(1, 23)
    FGlobal_Panel_DyeReNew_Hide()
    if check_ShowWindow() == false then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

local _keyBinder_UIMode_ItemMarket = function(delataTime)
  -- function num : 0_24 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK, IM, GlobalKeyBinder_CheckCustomKeyPressed
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
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
                    if isNewItemmarket_chk() then
                      FGolbal_ItemMarketNew_Close()
                      InventoryWindow_Close()
                      Equipment_SetShow(false)
                    else
                      FGolbal_ItemMarket_Close()
                    end
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
    if isNewItemmarket_chk() then
      FGolbal_ItemMarketNew_Search()
    else
      FGolbal_ItemMarket_Search()
    end
  end
  if Panel_ItemMarket_PreBid:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
    if FGlobal_ItemMarketPreBid_Check_OpenType() == 0 then
      FGlobal_ItemMarketPreBid_Confirm()
    else
      FGlobal_ItemMarketPreBid_Close()
    end
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)) then
    FGlobal_ItemMarketRegistItem_RegistDO()
  end
  if getInputMode() ~= IM.eProcessorInputMode_ChattingInputMode and Panel_Window_ItemMarket:GetShow() and GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Inventory) then
    if Panel_Window_Inventory:IsShow() then
      InventoryWindow_Close()
      Equipment_SetShow(false)
    else
      FGlobal_ItemmarketNew_OpenInventory()
      Equipment_SetShow(true)
    end
  end
end

local _keyBinder_UIMode_Trade = function(deltaTime)
  -- function num : 0_25 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    closeNpcTrade_Basket()
    TooltipSimple_Hide()
  end
end

local _keyBinder_UIMode_Stable = function(deltaTime)
  -- function num : 0_26 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
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

local _keyBinder_UIMode_GameExit = function(deltaTime)
  -- function num : 0_27 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
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

local _keyBinder_UIMode_DeadMessage = function(deltaTime)
  -- function num : 0_28 , upvalues : GlobalKeyBinder_CheckCustomKeyPressed, IM, GlobalKeyBinder_CheckKeyPressed, VCK
  if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Chat) then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
    ChatInput_Show()
    return 
  else
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_TAB) then
      ChatInput_ChangeInputFocus()
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_UP) then
        if ToClient_isComposition() then
          return 
        end
        ChatInput_PressedUp()
      else
        if isKeyPressed(VCK.KeyCode_MENU) then
          ChatInput_CheckReservedKey()
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
            ChatInput_CheckInstantCommand()
          else
            if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) and Panel_Chatting_Input:GetShow() then
              if ToClient_isComposition() then
                return 
              end
              ChatInput_CancelAction()
              ChatInput_CancelMessage()
              ChatInput_Close()
              friend_clickAddFriendClose()
              if check_ShowWindow() then
                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
              end
            end
            return 
          end
        end
      end
    end
  end
end

local _keyBinder_UIMode_MiniGame = function(deltaTime)
  -- function num : 0_29 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK
  local MiniGame_BattleGauge_Space = Panel_BattleGauge:IsShow()
  local MiniGame_FillGauge_Mouse = Panel_FillGauge:IsShow()
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

local _keyBinder_UIMode_PreventMoveNSkill = function(deltaTime)
  -- function num : 0_30
end

local _keyBinder_UIMode_Movie = function(deltaTime)
  -- function num : 0_31 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK, IM
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if check_ShowWindow() then
      close_WindowPanelList()
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      return 
    else
      if Panel_UIControl:IsShow() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
        Panel_UIControl_SetShow(false)
        Panel_Menu_ShowToggle()
        return 
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiControlMode)
        Panel_UIControl_SetShow(true)
        Panel_Menu_ShowToggle()
        return 
      end
    end
  end
end

local _keyBinder_UIMode_Repair = function(deltaTime)
  -- function num : 0_32 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_FixEquip:GetShow() then
      PaGlobal_FixEquip:fixEquipExit()
    else
      PaGlobal_Repair:RepairExit()
    end
  end
end

local _keyBinder_UIMode_Extraction = function(deltaTime)
  -- function num : 0_33 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Window_Extraction_Cloth:GetShow() then
      ExtractionCloth_WindowClose()
      InventoryWindow_Close()
      EquipmentWindow_Close()
    else
      if Panel_Window_Extraction_Crystal:GetShow() then
        Socket_ExtractionCrystal_WindowClose()
        InventoryWindow_Close()
        EquipmentWindow_Close()
      else
        if Panel_Window_Extraction_EnchantStone:GetShow() then
          ExtractionEnchantStone_WindowClose()
          InventoryWindow_Close()
          EquipmentWindow_Close()
        else
          PaGlobal_Extraction:openPanel(false)
        end
      end
    end
  end
end

local _keyBinder_UIMode_KeyCustom_ActionKey = function(deltaTime)
  -- function num : 0_34
  local isEnd = false
  local inputType = KeyCustom_Action_GetInputType()
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
    KeyCustom_Action_UpdateButtonText_Key()
    KeyCustom_Action_KeyButtonCheckReset(inputType)
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

local _keyBinder_UIMode_KeyCustom_ActionPad = function(deltaTime)
  -- function num : 0_35
  local isEnd = false
  local inputType = KeyCustom_Action_GetInputType()
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
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_PadButtonCheckReset(inputType)
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

local _keyBinder_UIMode_KeyCustom_UiKey = function(deltaTime)
  -- function num : 0_36
  local isEnd = false
  local inputType = KeyCustom_Ui_GetInputType()
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
    KeyCustom_Ui_UpdateButtonText_Key()
    KeyCustom_Ui_KeyButtonCheckReset(inputType)
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

local _keyBinder_UIMode_KeyCustom_UiPad = function(deltaTime)
  -- function num : 0_37
  local isEnd = false
  local inputType = KeyCustom_Ui_GetInputType()
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
    KeyCustom_Ui_UpdateButtonText_Pad()
    KeyCustom_Ui_PadButtonCheckReset(inputType)
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

local _keyBinder_UIMode_KeyCustom_ActionPadFunc1 = function(deltaTime)
  -- function num : 0_38
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
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_FuncPadButtonCheckReset(0)
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

local _keyBinder_UIMode_KeyCustom_ActionPadFunc2 = function(deltaTime)
  -- function num : 0_39
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
    KeyCustom_Action_UpdateButtonText_Pad()
    KeyCustom_Action_FuncPadButtonCheckReset(1)
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

local _keyBinder_UIMode_PopupItem = function()
  -- function num : 0_40 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_UseItem_ShowToggle_Func()
  end
end

local _keyBinder_UIMode_ProductNote = function(deltaTime)
  -- function num : 0_41 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_ProductNote_ShowToggle()
  end
end

local _keyBinder_UIMode_QnAWebLink = function(deltaTime)
  -- function num : 0_42 , upvalues : escHandle, GlobalKeyBinder_CheckKeyPressed, VCK, IM
  if not escHandle and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) and Panel_QnAWebLink_ShowToggle() == false then
    if AllowChangeInputMode() then
      if check_ShowWindow() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
  end
end

local _KeyBinder_UIMode_TradeGame = function(deltaTime)
  -- function num : 0_43
  if isKeyUpFor((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) then
    Fglobal_TradeGame_Close()
    return 
  end
  global_Update_TradeGame(deltaTime)
end

local _KeyBinder_UIMode_CutSceneMode = function(deltaTime)
  -- function num : 0_44 , upvalues : isRunClosePopup
  if ToClient_cutsceneIsPlay() then
    if not (MessageBox.isPopUp)() and isKeyDown_Once((CppEnums.VirtualKeyCode).KeyCode_ESCAPE) and isRunClosePopup == false then
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

local _KeyBinder_UIMode_UiSetting = function(deltaTime)
  -- function num : 0_45 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_UiSet_Close()
    return 
  end
end

local _KeyBinder_UIMode_Gacha_Roulette = function(deltaTime)
  -- function num : 0_46 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
    FGlobal_gacha_Roulette_OnPressSpace()
  else
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_gacha_Roulette_OnPressEscape()
    end
  end
  return 
end

local _KeyBinder_UIMode_ScreenShotMode = function(delataTime)
  -- function num : 0_47 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    local screenShotFrame_Close = function()
    -- function num : 0_47_0
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

local _KeyBinder_UIMode_EventNotify = function(deltaTime)
  -- function num : 0_48 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK, IM
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    EventNotifyContent_Close()
    if AllowChangeInputMode() then
      if check_ShowWindow() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

SetUIMode = function(uiMode)
  -- function num : 0_49 , upvalues : UIMode, _uiMode
  if uiMode >= 0 and uiMode < UIMode.eUIMode_Count then
    _PA_LOG("광운", "prev _uiMode = " .. tostring(_uiMode) .. " / next uiMode = " .. tostring(uiMode))
    _uiMode = uiMode
  end
end

GetUIMode = function()
  -- function num : 0_50 , upvalues : _uiMode
  return _uiMode
end

IsBubbleAndInterActionShowCondition = function()
  -- function num : 0_51 , upvalues : _uiMode, UIMode
  do return _uiMode == UIMode.eUIMode_Default end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

IsWaitCommentAndInterActionShowCondition = function()
  -- function num : 0_52 , upvalues : _uiMode, UIMode
  do return _uiMode == UIMode.eUIMode_Default end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

IsCharacterNameTagShowCondition = function()
  -- function num : 0_53 , upvalues : _uiMode, UIMode
  do return _uiMode == UIMode.eUIMode_Default or _uiMode == UIMode.eUIMode_Housing end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local GlobalKeyBinder_MouseDragEvent = function()
  -- function num : 0_54 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK, escHandle
  if DragManager:isDragging() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    DragManager:clearInfo()
    Inventory_DropEscape()
    escHandle = true
  else
    escHandle = false
  end
end

local _ChattingMacro_Process = function()
  -- function num : 0_55 , upvalues : VCK
  if isKeyPressed(VCK.KeyCode_MENU) == false then
    return false
  end
  if isKeyPressed(VCK.KeyCode_SHIFT) == false then
    return false
  end
  if isKeyDown_Once(VCK.KeyCode_1) and ToClient_getMacroChatMessage(0) ~= "" then
    ToClient_executeChatMacro(0)
    return true
  else
    if isKeyDown_Once(VCK.KeyCode_2) and ToClient_getMacroChatMessage(1) ~= "" then
      ToClient_executeChatMacro(1)
      return true
    else
      if isKeyDown_Once(VCK.KeyCode_3) and ToClient_getMacroChatMessage(2) ~= "" then
        ToClient_executeChatMacro(2)
        return true
      else
        if isKeyDown_Once(VCK.KeyCode_4) and ToClient_getMacroChatMessage(3) ~= "" then
          ToClient_executeChatMacro(3)
          return true
        else
          if isKeyDown_Once(VCK.KeyCode_5) and ToClient_getMacroChatMessage(4) ~= "" then
            ToClient_executeChatMacro(4)
            return true
          else
            if isKeyDown_Once(VCK.KeyCode_6) and ToClient_getMacroChatMessage(5) ~= "" then
              ToClient_executeChatMacro(5)
              return true
            else
              if isKeyDown_Once(VCK.KeyCode_7) and ToClient_getMacroChatMessage(6) ~= "" then
                ToClient_executeChatMacro(6)
                return true
              else
                if isKeyDown_Once(VCK.KeyCode_8) and ToClient_getMacroChatMessage(7) ~= "" then
                  ToClient_executeChatMacro(7)
                  return true
                else
                  if isKeyDown_Once(VCK.KeyCode_9) and ToClient_getMacroChatMessage(8) ~= "" then
                    ToClient_executeChatMacro(8)
                    return true
                  else
                    if isKeyDown_Once(VCK.KeyCode_0) and ToClient_getMacroChatMessage(9) ~= "" then
                      ToClient_executeChatMacro(9)
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
  return false
end

local _SkillkeyBinder_UIMode_CommonWindow = function(deltaTime)
  -- function num : 0_56
  if isUseNewQuickSlot() then
    if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot1) then
      HandleClicked_NewQuickSlot_Use(0)
    else
      if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot2) then
        HandleClicked_NewQuickSlot_Use(1)
      else
        if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot3) then
          HandleClicked_NewQuickSlot_Use(2)
        else
          if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot4) then
            HandleClicked_NewQuickSlot_Use(3)
          else
            if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot5) then
              HandleClicked_NewQuickSlot_Use(4)
            else
              if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot6) then
                HandleClicked_NewQuickSlot_Use(5)
              else
                if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot7) then
                  HandleClicked_NewQuickSlot_Use(6)
                else
                  if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot8) then
                    HandleClicked_NewQuickSlot_Use(7)
                  else
                    if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot9) then
                      HandleClicked_NewQuickSlot_Use(8)
                    else
                      if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot10) then
                        HandleClicked_NewQuickSlot_Use(9)
                      else
                        if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot11) then
                          HandleClicked_NewQuickSlot_Use(10)
                        else
                          if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot12) then
                            HandleClicked_NewQuickSlot_Use(11)
                          else
                            if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot13) then
                              HandleClicked_NewQuickSlot_Use(12)
                            else
                              if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot14) then
                                HandleClicked_NewQuickSlot_Use(13)
                              else
                                if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot15) then
                                  HandleClicked_NewQuickSlot_Use(14)
                                else
                                  if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot16) then
                                    HandleClicked_NewQuickSlot_Use(15)
                                  else
                                    if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot17) then
                                      HandleClicked_NewQuickSlot_Use(16)
                                    else
                                      if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot18) then
                                        HandleClicked_NewQuickSlot_Use(17)
                                      else
                                        if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot19) then
                                          HandleClicked_NewQuickSlot_Use(18)
                                        else
                                          if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot20) then
                                            HandleClicked_NewQuickSlot_Use(19)
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
    end
  else
    if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot1) then
      QuickSlot_Click("0")
    else
      if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot2) then
        QuickSlot_Click("1")
      else
        if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot3) then
          QuickSlot_Click("2")
        else
          if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot4) then
            QuickSlot_Click("3")
          else
            if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot5) then
              QuickSlot_Click("4")
            else
              if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot6) then
                QuickSlot_Click("5")
              else
                if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot7) then
                  QuickSlot_Click("6")
                else
                  if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot8) then
                    QuickSlot_Click("7")
                  else
                    if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot9) then
                      QuickSlot_Click("8")
                    else
                      if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_QuickSlot10) then
                        QuickSlot_Click("9")
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

GlobalKeyBinder_Update = function(deltaTime)
  -- function num : 0_57 , upvalues : isOnlyCombat, isRunClosePopup, UIMode, GlobalKeyBinder_MouseDragEvent, GlobalKeyBinder_CheckKeyPressed, VCK, GlobalKeyBinder_Clear, IM, GlobalKeyBinder_CheckCustomKeyPressed, _uiMode, _keyBinder_UIMode_Housing, _keyBinder_Chatting, _keyBinder_UIMode_Mental, _keyBinder_UIMode_MentalGame, _keyBinder_UIMode_InGameCustomize, _keyBinder_UIMode_InGameDance, _keyBinder_UIMode_InGameCashShop, _keyBinder_UIMode_Dye, _keyBinder_UIMode_ItemMarket, _keyBinder_UIMode_NpcDialog, _keyBinder_UIMode_Trade, _keyBinder_UIMode_Stable, _keyBinder_UIMode_WorldMap, _keyBinder_WorldMapSearch, _keyBinder_UIMode_MiniGame, _keyBinder_UIMode_DeadMessage, _keyBinder_UIMode_PreventMoveNSkill, _keyBinder_UIMode_Movie, _keyBinder_UIMode_GameExit, _keyBinder_UIMode_Repair, _keyBinder_UIMode_Extraction, _keyBinder_UIMode_KeyCustom_ActionKey, _keyBinder_UIMode_KeyCustom_ActionPad, _keyBinder_UIMode_KeyCustom_UiKey, _keyBinder_UIMode_KeyCustom_UiPad, _keyBinder_UIMode_KeyCustom_ActionPadFunc1, _keyBinder_UIMode_KeyCustom_ActionPadFunc2, _keyBinder_UIMode_PopupItem, _keyBinder_UIMode_ProductNote, _keyBinder_UIMode_QnAWebLink, _KeyBinder_UIMode_TradeGame, _KeyBinder_UIMode_CutSceneMode, _KeyBinder_UIMode_UiSetting, _KeyBinder_UIMode_EventNotify, _KeyBinder_UIMode_Gacha_Roulette, _KeyBinder_UIMode_ScreenShotMode, _ChattingMacro_Process, _keyBinder_GameMode, _keyBinder_UIMode_CommonWindow, _SkillkeyBinder_UIMode_CommonWindow, _keyBinder_UIMode, _keyBinder_UiModeNotInput
  if isOnlyCombat then
    return 
  end
  isRunClosePopup = false
  if isIntroMoviePlaying then
    SetUIMode(UIMode.eUIMode_Movie)
  end
  GlobalKeyBinder_MouseDragEvent()
  local inputMode = (UI.Get_ProcessorInputMode)()
  if (MessageBox.isPopUp)() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      (MessageBox.keyProcessEnter)()
      GlobalKeyBinder_Clear()
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      return 
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        (MessageBox.keyProcessEscape)()
        isRunClosePopup = true
        GlobalKeyBinder_Clear()
        return 
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
      GlobalKeyBinder_Clear()
      return 
    else
      if Panel_ExitConfirm:GetShow() then
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
          Panel_GameExit_MinimizeTray()
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
            Panel_ExitConfirm:SetShow(false)
          end
        end
        GlobalKeyBinder_Clear()
        return 
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
          GlobalKeyBinder_Clear()
          return 
        else
          if Panel_Chatting_Macro:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
            FGlobal_Chatting_Macro_ShowToggle()
            FGlobal_Chatting_Macro_SetCHK(false)
            if AllowChangeInputMode() then
              if check_ShowWindow() then
                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
              else
                ;
                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
              end
            else
              SetFocusChatting()
            end
            return 
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
      if check_ShowWindow() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      end
    else
      FGlobal_SocialAction_SetCHK(false)
      FGlobal_SocialAction_ShowToggle()
      if not AllowChangeInputMode() then
        SetFocusChatting()
      else
        if check_ShowWindow() then
          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
        else
          ;
          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
        end
      end
    end
    return 
  end
  if Panel_Chat_SubMenu:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if Panel_Chatting_Block_GoldSeller:GetShow() then
      FGlobal_reportSeller_Close()
      return 
    end
    Panel_Chat_SubMenu:SetShow(false)
    return 
  end
  if Panel_GuildIncentive:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) and not FGlobal_CheckSaveGuildMoneyUiEdit(GetFocusEdit()) then
      FGlobal_SaveGuildMoney_Send()
      return 
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        FGlobal_GuildIncentive_Close()
        return 
      end
    end
    FGlobal_GuildDeposit_InputCheck()
    GlobalKeyBinder_Clear()
    return 
  else
    if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_AlchemySton) and isKeyPressed(VCK.KeyCode_CONTROL) == false then
      if inputMode == IM.eProcessorInputMode_GameMode then
        FGlobal_AlchemyStone_Use()
        return 
      else
        if (inputMode == IM.eProcessorInputMode_UiMode or inputMode == IM.eProcessorInputMode_UiControlMode) and UIMode.eUIMode_Default == _uiMode then
          FGlobal_AlchemyStone_Use()
          return 
        end
      end
    else
      if Panel_EventNotifyContent:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        HandleClicked_EventNotifyContent_Close()
        GlobalKeyBinder_Clear()
        return 
      end
    end
  end
  if Panel_Window_PetInfoNew:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_PetInfoNew_Close()
    GlobalKeyBinder_Clear()
    return 
  end
  if Panel_EventNotify:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_EventNotifyClose()
    GlobalKeyBinder_Clear()
    return 
  end
  if Panel_PcRoomNotify:GetShow() and (GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE)) then
    FGlobal_PcRoomNotifyClose()
    GlobalKeyBinder_Clear()
    return 
  end
  if Panel_Introduction:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_Introcution_TooltipHide()
    return 
  end
  if Panel_ChallengePresent:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
    FGlobal_ChallengePresent_AcceptReward()
    GlobalKeyBinder_Clear()
    return 
  end
  if Panel_SaveFreeSet:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      HandleClicked_UiSet_ConfirmSetting()
      GlobalKeyBinder_Clear()
      return 
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        PaGlobal_UiSet_FreeSet_Close()
        GlobalKeyBinder_Clear()
        return 
      end
    end
  else
    if Panel_UI_Setting:IsUse() then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
        setUiInputProcessed(VCK.KeyCode_RETURN)
        setUiInputProcessed(VCK.KeyCode_SPACE)
        UiSet_FreeSet_Open()
        GlobalKeyBinder_Clear()
        return 
      else
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_UiSet_Close()
          GlobalKeyBinder_Clear()
          return 
        end
      end
    else
      if Panel_Win_Check:GetShow() then
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
          (MessageBoxCheck.keyProcessEnter)()
          setUiInputProcessed(VCK.KeyCode_RETURN)
          setUiInputProcessed(VCK.KeyCode_SPACE)
          GlobalKeyBinder_Clear()
          return 
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
            (MessageBoxCheck.keyProcessEscape)()
            GlobalKeyBinder_Clear()
            return 
          end
        end
      else
        if getSelfPlayer() ~= nil and ((getSelfPlayer()):get()):isShowWaitComment() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          EventSelfPlayerWaitCommentClose()
          return 
        end
      end
    end
  end
  if Panel_RandomBoxSelect:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    FGlobal_Gacha_Roulette_Close()
    return 
  end
  if UIMode.eUIMode_Housing == _uiMode then
    _keyBinder_UIMode_Housing(deltaTime)
    GlobalKeyBinder_Clear()
    return 
  else
    if UIMode.eUIMode_Mental == _uiMode then
      if inputMode == IM.eProcessorInputMode_ChattingInputMode then
        _keyBinder_Chatting(deltaTime)
        GlobalKeyBinder_Clear()
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
        _keyBinder_UIMode_Mental(deltaTime)
        GlobalKeyBinder_Clear()
      end
      return 
    else
      if UIMode.eUIMode_MentalGame == _uiMode then
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_LEFT) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_A) then
          MentalKnowledge_CardRotation_Left()
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RIGHT) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_D) then
            MentalKnowledge_CardRotation_Right()
          end
        end
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
        _keyBinder_UIMode_MentalGame(deltaTime)
        GlobalKeyBinder_Clear()
        return 
      else
        if UIMode.eUIMode_InGameCustomize == _uiMode then
          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
          _keyBinder_UIMode_InGameCustomize(deltaTime)
          GlobalKeyBinder_Clear()
          return 
        else
          if UIMode.eUIMode_InGameDance == _uiMode then
            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
            _keyBinder_UIMode_InGameDance(deltaTime)
            GlobalKeyBinder_Clear()
            return 
          else
            if UIMode.eUIMode_InGameCashShop == _uiMode then
              if inputMode == IM.eProcessorInputMode_ChattingInputMode then
                _keyBinder_Chatting(deltaTime)
                GlobalKeyBinder_Clear()
              else
                ;
                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                _keyBinder_UIMode_InGameCashShop(deltaTime)
                GlobalKeyBinder_Clear()
              end
              return 
            else
              if UIMode.eUIMode_DyeNew == _uiMode then
                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                _keyBinder_UIMode_Dye(deltaTime)
                GlobalKeyBinder_Clear()
                return 
              else
                if UIMode.eUIMode_ItemMarket == _uiMode then
                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
                  _keyBinder_UIMode_ItemMarket(deltaTime)
                  GlobalKeyBinder_Clear()
                  return 
                else
                  if UIMode.eUIMode_NpcDialog == _uiMode then
                    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                    _keyBinder_UIMode_NpcDialog(deltaTime)
                    GlobalKeyBinder_Clear()
                    return 
                  else
                    if UIMode.eUIMode_NpcDialog_Dummy == _uiMode then
                      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                      GlobalKeyBinder_Clear()
                      return 
                    else
                      if UIMode.eUIMode_Trade == _uiMode then
                        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                        _keyBinder_UIMode_Trade(deltaTime)
                        GlobalKeyBinder_Clear()
                        return 
                      else
                        if UIMode.eUIMode_Stable == _uiMode then
                          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                          _keyBinder_UIMode_Stable(deltaTime)
                          GlobalKeyBinder_Clear()
                          return 
                        else
                          if UIMode.eUIMode_WorldMap == _uiMode then
                            if inputMode == IM.eProcessorInputMode_ChattingInputMode and not Panel_Window_ItemMarket:GetShow() then
                              _keyBinder_Chatting(deltaTime)
                              GlobalKeyBinder_Clear()
                            else
                              if getInputMode() ~= IM.eProcessorInputMode_ChattingInputMode or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                _keyBinder_UIMode_WorldMap(deltaTime)
                                GlobalKeyBinder_Clear()
                              end
                            end
                            return 
                          else
                            if UIMode.eUIMode_WoldMapSearch == _uiMode then
                              _keyBinder_WorldMapSearch(deltaTime)
                              GlobalKeyBinder_Clear()
                              return 
                            else
                              if UIMode.eUIMode_MiniGame == _uiMode then
                                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                                _keyBinder_UIMode_MiniGame(deltaTime)
                                GlobalKeyBinder_Clear()
                                return 
                              else
                                if UIMode.eUIMode_DeadMessage == _uiMode then
                                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                  _keyBinder_UIMode_DeadMessage(deltaTime)
                                  if GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.UiInputType).UiInputType_Guild) then
                                    local guildWrapper = ToClient_GetMyGuildInfoWrapper()
                                    if guildWrapper ~= nil then
                                      local guildGrade = guildWrapper:getGuildGrade()
                                      if guildGrade == 0 then
                                        if Panel_ClanList:IsShow() == false then
                                          audioPostEvent_SystemUi(1, 36)
                                          FGlobal_ClanList_Open()
                                          ;
                                          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                        else
                                          audioPostEvent_SystemUi(1, 31)
                                          FGlobal_ClanList_Close()
                                          if check_ShowWindow() == false then
                                            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                                          end
                                        end
                                      else
                                        if Panel_Window_Guild:IsShow() == false and not Panel_DeadMessage:GetShow() then
                                          audioPostEvent_SystemUi(1, 36)
                                          GuildManager:Show()
                                          ;
                                          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                        else
                                          audioPostEvent_SystemUi(1, 31)
                                          GuildManager:Hide()
                                          if check_ShowWindow() == false then
                                            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                                          end
                                        end
                                      end
                                    else
                                      do
                                        do
                                          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NO_GUILD"))
                                          if Panel_DeadMessage:GetShow() then
                                            GuildManager:Hide()
                                          end
                                          GlobalKeyBinder_Clear()
                                          do return  end
                                          if UIMode.eUIMode_PreventMoveNSkill == _uiMode then
                                            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                            _keyBinder_UIMode_PreventMoveNSkill(deltaTime)
                                            GlobalKeyBinder_Clear()
                                            return 
                                          else
                                            if UIMode.eUIMode_Movie == _uiMode then
                                              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
                                              _keyBinder_UIMode_Movie(deltaTime)
                                              GlobalKeyBinder_Clear()
                                              return 
                                            else
                                              if UIMode.eUIMode_GameExit == _uiMode then
                                                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
                                                _keyBinder_UIMode_GameExit(deltaTime)
                                                GlobalKeyBinder_Clear()
                                                return 
                                              else
                                                if UIMode.eUIMode_Repair == _uiMode then
                                                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                                  _keyBinder_UIMode_Repair(deltaTime)
                                                  GlobalKeyBinder_Clear()
                                                  return 
                                                else
                                                  if UIMode.eUIMode_Extraction == _uiMode then
                                                    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                                    _keyBinder_UIMode_Extraction(deltaTime)
                                                    GlobalKeyBinder_Clear()
                                                    return 
                                                  else
                                                    if UIMode.eUIMode_KeyCustom_ActionKey == _uiMode then
                                                      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_KeyCustomizing)
                                                      _keyBinder_UIMode_KeyCustom_ActionKey(deltaTime)
                                                      GlobalKeyBinder_Clear()
                                                      return 
                                                    else
                                                      if UIMode.eUIMode_KeyCustom_ActionPad == _uiMode then
                                                        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_KeyCustomizing)
                                                        _keyBinder_UIMode_KeyCustom_ActionPad(deltaTime)
                                                        GlobalKeyBinder_Clear()
                                                        return 
                                                      else
                                                        if UIMode.eUIMode_KeyCustom_UiKey == _uiMode then
                                                          (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_KeyCustomizing)
                                                          _keyBinder_UIMode_KeyCustom_UiKey(deltaTime)
                                                          GlobalKeyBinder_Clear()
                                                          return 
                                                        else
                                                          if UIMode.eUIMode_KeyCustom_UiPad == _uiMode then
                                                            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_KeyCustomizing)
                                                            _keyBinder_UIMode_KeyCustom_UiPad(deltaTime)
                                                            GlobalKeyBinder_Clear()
                                                            return 
                                                          else
                                                            if UIMode.eUIMode_KeyCustom_ActionPadFunc1 == _uiMode then
                                                              (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_KeyCustomizing)
                                                              _keyBinder_UIMode_KeyCustom_ActionPadFunc1(deltaTime)
                                                              GlobalKeyBinder_Clear()
                                                              return 
                                                            else
                                                              if UIMode.eUIMode_KeyCustom_ActionPadFunc2 == _uiMode then
                                                                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_KeyCustomizing)
                                                                _keyBinder_UIMode_KeyCustom_ActionPadFunc2(deltaTime)
                                                                GlobalKeyBinder_Clear()
                                                                return 
                                                              else
                                                                if UIMode.eUIMode_PopupItem == _uiMode then
                                                                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                                                  _keyBinder_UIMode_PopupItem()
                                                                  GlobalKeyBinder_Clear()
                                                                  return 
                                                                else
                                                                  if UIMode.eUIMode_ProductNote == _uiMode then
                                                                    _keyBinder_UIMode_ProductNote(deltaTime)
                                                                    GlobalKeyBinder_Clear()
                                                                    return 
                                                                  else
                                                                    if UIMode.eUIMode_QnAWebLink == _uiMode then
                                                                      _keyBinder_UIMode_QnAWebLink(deltaTime)
                                                                      GlobalKeyBinder_Clear()
                                                                      return 
                                                                    else
                                                                      if UIMode.eUIMode_TradeGame == _uiMode then
                                                                        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                                                        _KeyBinder_UIMode_TradeGame(deltaTime)
                                                                        GlobalKeyBinder_Clear()
                                                                        return 
                                                                      else
                                                                        if UIMode.eUIMode_Cutscene == _uiMode then
                                                                          _KeyBinder_UIMode_CutSceneMode(deltaTime)
                                                                          GlobalKeyBinder_Clear()
                                                                          return 
                                                                        else
                                                                          if UIMode.eUIMode_UiSetting == _uiMode then
                                                                            (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
                                                                            _KeyBinder_UIMode_UiSetting(deltaTime)
                                                                            GlobalKeyBinder_Clear()
                                                                            return 
                                                                          else
                                                                            if UIMode.eUIMode_EventNotify == _uiMode then
                                                                              _KeyBinder_UIMode_EventNotify(deltaTime)
                                                                              GlobalKeyBinder_Clear()
                                                                              return 
                                                                            else
                                                                              if UIMode.eUIMode_Gacha_Roulette == _uiMode then
                                                                                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
                                                                                _KeyBinder_UIMode_Gacha_Roulette(deltaTime)
                                                                                GlobalKeyBinder_Clear()
                                                                                return 
                                                                              else
                                                                                if UIMode.eUIMode_ScreenShotMode == _uiMode then
                                                                                  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
                                                                                  _KeyBinder_UIMode_ScreenShotMode(delataTime)
                                                                                  GlobalKeyBinder_Clear()
                                                                                  return 
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
                                          end
                                          if Panel_RecentMemory:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                            RecentMemory_Close()
                                            return 
                                          end
                                          if Panel_Party_ItemList:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                            Panel_Party_ItemList_Close()
                                            return 
                                          end
                                          if Panel_LocalWarInfo:IsShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                            FGlobal_LocalWarInfo_Close()
                                            return 
                                          end
                                          if Panel_SavageDefenceInfo:IsShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
                                            FGlobal_SavageDefenceInfo_Close()
                                            return 
                                          end
                                          if _ChattingMacro_Process() == true then
                                            return 
                                          end
                                          if inputMode == IM.eProcessorInputMode_GameMode then
                                            if Panel_UIControl:IsShow() then
                                              Panel_UIControl_SetShow(false)
                                              Panel_Menu_ShowToggle()
                                            else
                                              if Panel_PartyOption:GetShow() then
                                                PartyOption_Hide()
                                              end
                                            end
                                            _keyBinder_GameMode(deltaTime)
                                            _keyBinder_UIMode_CommonWindow(deltaTime)
                                            _SkillkeyBinder_UIMode_CommonWindow(deltaTime)
                                          else
                                            if inputMode == IM.eProcessorInputMode_UiMode or inputMode == IM.eProcessorInputMode_UiControlMode then
                                              _keyBinder_UIMode(deltaTime)
                                              if UIMode.eUIMode_Default == _uiMode then
                                                _keyBinder_UIMode_CommonWindow(deltaTime)
                                                _SkillkeyBinder_UIMode_CommonWindow(deltaTime)
                                              end
                                            else
                                              if inputMode == IM.eProcessorInputMode_ChattingInputMode then
                                                _keyBinder_Chatting(deltaTime)
                                              else
                                                if inputMode == IM.eProcessorInputMode_UiModeNotInput then
                                                  _keyBinder_UiModeNotInput(deltaTime)
                                                end
                                              end
                                            end
                                          end
                                          GlobalKeyBinder_Clear()
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
  end
end

registerEvent("EventGlobalKeyBinder", "GlobalKeyBinder_Update")
registerEvent("FromClient_luaLoadComplete", "GlobalKeyBinder_Load")

