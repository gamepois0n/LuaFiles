-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\globalkeybinder\globalclosemanager.luac 

-- params : ...
-- function num : 0
local panel_WindowList = {Panel_Window_ServantInfo, Panel_PartyOption, Panel_Alchemy, Panel_Window_StableFunction, Panel_Window_StableList, Panel_Window_StableInfo, Panel_Window_StableEquipInfo, Panel_Window_StableShop, Panel_Window_StableMating, Panel_Window_StableRegister, Panel_Window_StableStallion, Panel_Servant_Market_Input, Panel_Window_WharfFunction, Panel_Window_WharfList, Panel_Window_WharfInfo, Panel_Window_WharfRegister, Panel_Window_Exchange_Number, Panel_Window_Delivery_Request, Panel_Window_Delivery_Information, Panel_Window_Delivery_CarriageInformation, Panel_Mail_Detail, Panel_Mail_Send, Panel_CreateClan, Panel_IntroMovie, Panel_Window_Repair, Panel_Scroll, Panel_SkillAwaken, Panel_Popup_MoveItem, Panel_LordMenu, Panel_CarriageInfo, Panel_FixEquip, Panel_Dialogue_Itemtake, Panel_CreateGuild, Panel_EnableSkill, Panel_HelpMessage, Panel_ProductNote, Panel_KeyboardHelp, Panel_WebControl, Panel_Window_Quest_New, Panel_Interaction_HouseRank, Panel_ColorBalance, Panel_CheckedQuestInfo, Panel_Window_Quest_History, Panel_Tooltip_Common, Panel_ShipInfo, Panel_Window_PetListNew, Panel_AgreementGuild_Master, Panel_Housing_FarmInfo_New, Panel_Window_ItemMarket_ItemSet, Panel_ClanList, Panel_CarveSeal, Panel_ResetSeal, Panel_ClearVested, Panel_Window_CharInfo_Status, Panel_Window_CharacterInfo_Renew, Panel_Chatting_Input, Panel_Window_GameTips, Panel_Window_SkillGuide, Panel_MovieTheater_320, Panel_MovieTheater_640, Panel_MovieTheater_SkillGuide_640, Panel_NewKnowledge, Panel_QuestInfo, Panel_MovieGuide, Panel_Window_PetRegister, Panel_FishEncyclopedia, Panel_Tooltip_Item_chattingLinkedItem, Panel_Window_ItemMarket_BuyConfirm, Panel_Tooltip_SimpleText, Panel_Event_100Day, Panel_HousingList, Panel_LifeRanking, Panel_RecommandName, Panel_Interaction_FriendHouseList, Panel_GuildWarScore, Panel_KnowledgeManagement, Panel_Window_StableMix, Panel_RecentCook, Panel_Window_PetCompose, Panel_GuildWebInfo, Panel_Guild_Rank, Panel_TransferLifeExperience, Panel_LinkedHorse_Skill, Panel_Window_MaidList, Panel_Window_WorkerRandomSelect, Panel_Worker_Auction, Panel_Window_UnknownRandomSelect, Panel_NodeWarMenu, Panel_RallyRanking, Panel_Window_Warehouse, Panel_Manufacture, Panel_EnchantExtraction, Panel_Join, Panel_Window_PetMarket, Panel_Window_PetMarketRegist, Panel_Window_GuildStableFunction, Panel_Window_GuildStable_List, Panel_Window_GuildStable_Info, Panel_Window_GuildStableRegister, Panel_ChangeWeapon, Panel_WorkerChangeSkill, Panel_GuildServantList, Panel_DyePalette, Panel_SetShortCut, Panel_ExitConfirm, Panel_Party_ItemList, Panel_Harvest_WorkManager, Panel_HarvestList, Panel_GuildDuel, Panel_Window_PetLookChange, Panel_Chatting_Filter, Panel_CustomizingAlbum, Panel_SetVoiceChat, Panel_Chatting_Color, Panel_WorkerShipInfo, Panel_Window_ItemMarket, Panel_GuildRank_Web, Panel_SkillReinforce, Panel_ItemWarp, Panel_Tooltip_Item_chattingLinkedItemClick, Panel_GoldenTreasureBox, Panel_ScreenShotAlbum, Panel_ScreenShotAlbum_FullScreen, Panel_GuildHouse_Auction, Panel_Window_ReinforceSkill, Panel_Guild_Incentive_Foundation, Panel_Window_Quest_New_Option, Panel_CompetitionGame_JoinDesc, Panel_IngameCashShop_Coupon, Panel_CompetitionGame_GuildReservation, Panel_PartyList, Panel_Window_Profile, Panel_Window_Dance, Panel_DanceFrame, Panel_GuildServant_RevivalList, Panel_Copyright, Panel_TranslationReport, Panel_CharacterTag, Panel_Widget_DropItem, Panel_Window_DropItem, Panel_SkillCoolTimeSlot, Panel_PetRestoreAll, Panel_Guild_NoneJoinMember, Panel_ButtonShortcuts, Panel_FairyInfo, Panel_Guild_ChoiseTheMoney, Panel_IngameCashShop_EventCart, Panel_Window_Politics, Panel_Window_RecommandGoods_PopUp, Panel_Window_QuestInfo, Panel_Window_GameExit, Panel_Window_GameExit_CharMove, Panel_Npc_Quest_Reward, Panel_Window_Inventory, Panel_Equipment, Panel_Window_Skill, Panel_Window_Enchant, Panel_Window_ServantInventory, Panel_Window_Warehouse, Panel_Mail_Main, Panel_Window_Option, Panel_Window_cOption, Panel_Manufacture, Panel_Window_Socket, Panel_FriendList, Panel_Housing_SettingVendingMachine, Panel_Housing_VendingMachineList, Panel_Housing_SettingConsignmentSale, Panel_Housing_RegisterConsignmentSale, Panel_Housing_ConsignmentSale, Panel_SkillAwaken, Panel_Improvement, Panel_Window_Guild, Panel_ItemMarket_AlarmList, Panel_GuildWarInfo, Panel_TradeEventNotice_Renewal, Panel_TradeMarket_EventInfo, Panel_WorkerManager, Panel_LevelupGuide, Panel_NpcNavi, Panel_Tooltip_NpcNavigation, Panel_Window_Policy, Panel_Dialog_SkillSpecialize, Panel_Window_CharacterInfo_Renew, Panel_Window_Knowledge_Renew}
local closePanelListInitialize = function()
  -- function num : 0_0 , upvalues : panel_WindowList
  for index,panel in pairs(panel_WindowList) do
    if panel ~= nil then
      _PA_LOG("후진", "panel .." .. panel:GetID())
      ToClient_registerClosePanelList(panel)
    end
  end
  panel_WindowList = nil
end

closePanelListInitialize()
local registerEscapeLuaEvent = function(panel, escapeFunc)
  -- function num : 0_1
  if panel == nil or escapeFunc == nil then
    return 
  end
  panel:RegisterEscapeLuaFunc(escapeFunc)
end

registerEscapeLuaEvent(Panel_MiniGame_Find, "PanelEscapeFunc_MiniGameFind()")
registerEscapeLuaEvent(Panel_EventNotify, "PanelEscapeFunc_EventNotify()")
registerEscapeLuaEvent(Panel_Window_DailyStamp, "PanelEscapeFunc_DailyStamp()")
registerEscapeLuaEvent(Panel_Window_ArshaTeamNameChange, "PanelEscapeFunc_ArshaTeamNameChange()")
registerEscapeLuaEvent(Panel_Window_ArshaInviteList, "PanelEscapeFunc_ArshaInviteList()")
registerEscapeLuaEvent(Panel_Window_Arsha, "PanelEscapeFunc_Arsha()")
registerEscapeLuaEvent(Panel_ScreenShotAlbum_FullScreen, "PanelEscapeFunc_ScreenShotAlbumFullScreen()")
registerEscapeLuaEvent(Panel_ScreenShotAlbum, "PanelEscapeFunc_ScreenShotAlbum()")
registerEscapeLuaEvent(Panel_Window_BlackSpiritAdventure, "PanelEscapeFunc_BlackSpiritAdventure()")
registerEscapeLuaEvent(Panel_Window_BlackSpiritAdventure_2, "PanelEscapeFunc_BlackSpiritAdventure2()")
registerEscapeLuaEvent(Panel_Window_BlackSpiritAdventureVerPC, "PanelEscapeFunc_BlackSpiritAdventureVerPC()")
registerEscapeLuaEvent(Panel_Window_ClothInventory, "PanelEscapeFunc_ClothInventory()")
registerEscapeLuaEvent(Panel_Window_Mercenary, "PanelEscapeFunc_Mercenary()")
registerEscapeLuaEvent(Panel_Window_MasterpieceAuction, "PanelEscapeFunc_MasterpieceAuction()")
registerEscapeLuaEvent(Panel_MovieGuide_Web, "PanelEscapeFunc_MovieGuideWeb()")
registerEscapeLuaEvent(Panel_MovieGuide_Weblist, "PanelEscapeFunc_MovieGuideWebList()")
registerEscapeLuaEvent(Panel_MovieSkillGuide_Web, "PanelEscapeFunc_MovieSkillGuideWeblist()")
registerEscapeLuaEvent(Panel_MovieSkillGuide_Weblist, "PanelEscapeFunc_MovieSkillGuide()")
registerEscapeLuaEvent(Panel_Window_Quest_New_Option, "PanelEscapeFunc_CheckedQuestQption()")
registerEscapeLuaEvent(Panel_Window_Skill, "PanelEscapeFunc_Skill()")
registerEscapeLuaEvent(Panel_SaveSetting, "PanelEscapeFunc_SaveSetting()")
registerEscapeLuaEvent(Panel_HarvestList, "PanelEscapeFunc_HarvestList()")
registerEscapeLuaEvent(Panel_PartyRecruite, "PanelEscapeFunc_PartyRecruite()")
registerEscapeLuaEvent(Panel_ServantResurrection, "PanelEscapeFunc_ServantResurrection()")
registerEscapeLuaEvent(Panel_Dialog_NPCShop, "PanelEscapeFunc_DialogNPCShopRenew()")
registerEscapeLuaEvent(Panel_Window_NpcShop, "PanelEscapeFunc_DialogNPCShop()")
registerEscapeLuaEvent(Panel_Window_Camp, "PanelEscapeFunc_Camp()")
registerEscapeLuaEvent(Panel_Window_CampRegister, "PanelEscapeFunc_CampRegister()")
registerEscapeLuaEvent(Panel_Window_MonsterRanking, "PanelEscapeFunc_MonsterRanking()")
registerEscapeLuaEvent(Panel_ChatOption, "PanelEscapeFunc_ChatOption()")
registerEscapeLuaEvent(Panel_Window_BuildingBuff, "PanelEscapeFunc_BuildingBuff()")
registerEscapeLuaEvent(Panel_Window_PersonalBattle, "PanelEscapeFunc_PersonalBattle()")
registerEscapeLuaEvent(Panel_Memo_List, "PanelEscapeFunc_Memo()")
registerEscapeLuaEvent(Panel_Guild_OneOnOneRequest, "PanelEscapeFunc_GuildOneOnOneRequest()")
registerEscapeLuaEvent(Panel_CustomizingAlbum, "PanelEscapeFunc_CustomizingAlbum()")
registerEscapeLuaEvent(Panel_IntroMovie, "PanelEscapeFunc_IntroMovie()")
registerEscapeLuaEvent(Panel_Chatting_Input, "PanelEscapeFunc_ChattingInput()")
registerEscapeLuaEvent(Panel_ButtonShortcuts, "PanelEscapeFunc_ButtonShortcuts()")
registerEscapeLuaEvent(Panel_TranslationReport, "PanelEscapeFunc_TranslationReport()")
registerEscapeLuaEvent(Panel_ProductNote, "PanelEscapeFunc_ProductNote()")
registerEscapeLuaEvent(Panel_KeyboardHelp, "PanelEscapeFunc_KeyboardHelp()")
registerEscapeLuaEvent(Panel_WebControl, "PanelEscapeFunc_WebControl()")
registerEscapeLuaEvent(Panel_Window_Warehouse, "PanelEscapeFunc_Warehouse()")
registerEscapeLuaEvent(Panel_SetVoiceChat, "PanelEscapeFunc_SetVoiceChat()")
registerEscapeLuaEvent(Panel_Window_VoiceChat, "PanelEscapeFunc_VoiceChat()")
registerEscapeLuaEvent(Panel_WorkerChangeSkill, "PanelEscapeFunc_WorkerChangeSkill()")
registerEscapeLuaEvent(Panel_FileExplorer, "PanelEscapeFunc_FileExplorer()")
registerEscapeLuaEvent(Panel_WorkerManager, "PanelEscapeFunc_WorkerManager()")
registerEscapeLuaEvent(Panel_Worker_Auction, "PanelEscapeFunc_WorkerAuction()")
registerEscapeLuaEvent(Panel_WorkerResist_Auction, "PanelEscapeFunc_WorkerResistAuction()")
registerEscapeLuaEvent(Panel_WorkerList_Auction, "PanelEscapeFunc_WorkerListAuction()")
registerEscapeLuaEvent(Panel_Window_Exchange, "PanelEscapeFunc_Exchange()")
registerEscapeLuaEvent(Panel_TransferLifeExperience, "PanelEscapeFunc_TransferLifeExperience()")
registerEscapeLuaEvent(Panel_DyePalette, "PanelEscapeFunc_DyePalette()")
registerEscapeLuaEvent(Panel_SetShortCut, "PanelEscapeFunc_SetShortCut()")
registerEscapeLuaEvent(Panel_Window_Inventory, "PanelEscapeFunc_Inventory()")
registerEscapeLuaEvent(Panel_Window_Exchange_Number, "PanelEscapeFunc_ExchangeNumber()")
registerEscapeLuaEvent(Panel_Window_cOption, "PanelEscapeFunc_Option()")
registerEscapeLuaEvent(Panel_CarveSeal, "PanelEscapeFunc_CarveSeal()")
registerEscapeLuaEvent(Panel_GuildWebInfo, "PanelEscapeFunc_GuildWebInfo()")
registerEscapeLuaEvent(Panel_GuildRank_Web, "PanelEscapeFunc_GuildRankWeb()")
registerEscapeLuaEvent(Panel_Guild_Rank, "PanelEscapeFunc_GuildRank()")
registerEscapeLuaEvent(Panel_ChangeWeapon, "PanelEscapeFunc_ChangeWeapon()")
registerEscapeLuaEvent(Panel_SkillReinforce, "PanelEscapeFunc_SkillReinforce()")
registerEscapeLuaEvent(Panel_FriendList, "PanelEscapeFunc_FriendList()")
registerEscapeLuaEvent(Panel_CheckedQuestInfo, "PanelEscapeFunc_CheckedQuest()")
registerEscapeLuaEvent(Panel_Window_Quest_New, "PanelEscapeFunc_Quest()")
registerEscapeLuaEvent(Panel_Window_QuestInfo, "PanelEscapeFunc_QuestRenew()")
registerEscapeLuaEvent(Panel_Window_Delivery_Request, "PanelEscapeFunc_DeliveryRequest()")
registerEscapeLuaEvent(Panel_Window_Guild, "PanelEscapeFunc_Guild()")
registerEscapeLuaEvent(Panel_AgreementGuild_Master, "PanelEscapeFunc_AgreementGuildMaster()")
registerEscapeLuaEvent(Panel_AgreementGuild, "PanelEscapeFunc_AgreementGuildMaster()")
registerEscapeLuaEvent(Panel_GuildIncentive, "PanelEscapeFunc_GuildIncentive()")
registerEscapeLuaEvent(Panel_GuildDuel, "PanelEscapeFunc_GuildDuel()")
registerEscapeLuaEvent(Panel_Window_GameTips, "PanelEscapeFunc_GameTips()")
registerEscapeLuaEvent(Panel_Window_PetInfoNew, "PanelEscapeFunc_PetInfoNew()")
registerEscapeLuaEvent(Panel_Event_100Day, "PanelEscapeFunc_Event100Day()")
registerEscapeLuaEvent(Panel_DanceFrame, "PanelEscapeFunc_DanceFrame()")
registerEscapeLuaEvent(Panel_Worker_Tooltip, "PanelEscapeFunc_WorkerTooltip()")
registerEscapeLuaEvent(Panel_ChangeItem, "PanelEscapeFunc_ChangeItem()")
registerEscapeLuaEvent(Panel_MovieGuide, "PanelEscapeFunc_MovieGuide()")
registerEscapeLuaEvent(Panel_Window_ItemMarket, "PanelEscapeFunc_ItemMarket()")
registerEscapeLuaEvent(Panel_Window_ItemMarket_RegistItem, "PanelEscapeFunc_ItemMarketRegistItem()")
registerEscapeLuaEvent(Panel_AlchemyStone, "PanelEscapeFunc_AlchemyStone()")
registerEscapeLuaEvent(Panel_AlchemyFigureHead, "PanelEscapeFunc_AlchemyFigureHead()")
registerEscapeLuaEvent(Panel_MovieTheater_320, "PanelEscapeFunc_MovieTheater320()")
registerEscapeLuaEvent(Panel_CharacterTag, "PanelEscapeFunc_CharacterTag()")
registerEscapeLuaEvent(Panel_FairyInfo, "PanelEscapeFunc_FairyInfo()")
registerEscapeLuaEvent(Panel_Window_FairySetting, "PanelEscapeFunc_FairySetting()")
registerEscapeLuaEvent(Panel_Window_FairyUpgrade, "PanelEscapeFunc_FairyUpgrade()")
registerEscapeLuaEvent(Panel_Win_System, "PanelEscapeFunc_MessageBox()")
registerEscapeLuaEvent(Panel_Win_Check, "PanelEscapeFunc_MessageBoxCheck()")
registerEscapeLuaEvent(Panel_LifeRanking, "PanelEscapeFunc_LifeRanking()")
registerEscapeLuaEvent(Panel_ChannelSelect, "PanelEscapeFunc_ChannelSelect()")
registerEscapeLuaEvent(Panel_Console_Window_Guild, "PanelEscapeFunc_GuildClose()")
registerEscapeLuaEvent(Panel_Window_MentalGame, "PanelEscapeFunc_MentalGameClose()")
registerEscapeLuaEvent(Panel_Dialog_SkillSpecialize, "PaGlobalFunc_Dialog_SkillSpecialize_Exit()")
registerEscapeLuaEvent(Panel_QuickMenuCustom, "PanelEscapeFunc_QuickMenuCustom()")
registerEscapeLuaEvent(Panel_Console_Window_GuildAgreement, "PanelEscapeFunc_GuildAgreementClose()")
registerEscapeLuaEvent(Panel_Console_Window_SignOption, "PanelEscapeFunc_GuildSignOption()")
registerEscapeLuaEvent(Panel_Window_CharacterInfo_Renew, "PaGlobalFunc_Window_CharacterInfo_Close()")
registerEscapeLuaEvent(Panel_Window_Knowledge_Renew, "PaGlobalFunc_Window_Knowledge_GOBackStep()")
registerEscapeLuaEvent(Panel_Window_Menu_Renew, "PanelEscapeFunc_MenuRenew()")
registerEscapeLuaEvent(Panel_Console_Window_GuildCreate, "PanelEscapeFunc_GuildCreate()")
PanelEscapeFunc_GuildCreate = function()
  -- function num : 0_2
  PaGlobalFunc_GuildCreate_Close()
end

PanelEscapeFunc_MenuRenew = function()
  -- function num : 0_3
  Panel_Window_Menu_ShowToggle()
end

PanelEscapeFunc_GuildSignOption = function()
  -- function num : 0_4
  if PaGlobalFunc_AgreementGuild_SignOption_GetShow() == true then
    PaGlobalFunc_AgreementGuild_SignOption_SetShow(false, false)
  end
end

PanelEscapeFunc_QuickMenuCustom = function()
  -- function num : 0_5
  Panel_QuickMenuCustom:SetShow(false)
  Panel_QuickMenuCustom_RightRing:SetShow(false)
end

PanelEscapeFunc_GuildAgreementClose = function()
  -- function num : 0_6
  Panel_Console_Window_GuildAgreement:SetShow(false, false)
end

PanelEscapeFunc_MentalGameClose = function()
  -- function num : 0_7
  if PaGlobalFunc_MentalGame_Open() == true then
    PaGlobalFunc_MentalGame_Close()
  end
end

PanelEscapeFunc_GuildClose = function()
  -- function num : 0_8
  if PaGlobalFunc_Guild_GetShow() == true then
    PaGlobalFunc_Guild_Close()
  end
end

PanelEscapeFunc_VoiceChat = function()
  -- function num : 0_9
  if PaGlobalFunc_VoiceChat_GetShow() == true then
    FGlobal_SetVoiceChat_Toggle()
  end
end

PanelEscapeFunc_ChannelSelect = function()
  -- function num : 0_10
  Panel_ChannelSelect:SetShow(false, true)
end

PanelEscapeFunc_MiniGameFind = function()
  -- function num : 0_11
  PaGlobal_MiniGame_Find:askGameClose()
end

PanelEscapeFunc_EventNotify = function()
  -- function num : 0_12
  FGlobal_NpcNavi_Hide()
  EventNotify_Close()
end

PanelEscapeFunc_DailyStamp = function()
  -- function num : 0_13
  DailStamp_Hide()
  Panel_Tooltip_Item_hideTooltip()
  TooltipSimple_Hide()
end

PanelEscapeFunc_ArshaTeamNameChange = function()
  -- function num : 0_14
  FGlobal_TeamNameChangeControl_Close()
end

PanelEscapeFunc_ArshaInviteList = function()
  -- function num : 0_15
  FGlobal_ArshaPvP_InviteList_Close()
end

PanelEscapeFunc_Arsha = function()
  -- function num : 0_16
  FGlobal_ArshaPvP_Close()
end

PanelEscapeFunc_ScreenShotAlbumFullScreen = function()
  -- function num : 0_17
  ScreenshotAlbum_FullScreen_Close()
end

PanelEscapeFunc_ScreenShotAlbum = function()
  -- function num : 0_18
  ScreenshotAlbum_Close()
end

PanelEscapeFunc_BlackSpiritAdventure = function()
  -- function num : 0_19
  BlackSpiritAd_Hide()
end

PanelEscapeFunc_BlackSpiritAdventure2 = function()
  -- function num : 0_20
  BlackSpirit2_Hide()
end

PanelEscapeFunc_BlackSpiritAdventureVerPC = function()
  -- function num : 0_21
  if Panel_Window_BlackSpiritAdventure:IsUISubApp() then
    return 
  end
  Panel_Window_BlackSpiritAdventureVerPC:SetShow(false, false)
end

PanelEscapeFunc_ClothInventory = function()
  -- function num : 0_22
  ClothInventory_Close()
end

PanelEscapeFunc_Mercenary = function()
  -- function num : 0_23
  FGlobal_MercenaryClose()
end

PanelEscapeFunc_MasterpieceAuction = function()
  -- function num : 0_24
  if FGlobal_MasterPieceAuction_IsOpenEscMenu() then
    PaGlobal_MasterpieceAuction:close()
    return 
  end
end

PanelEscapeFunc_MovieGuideWeb = function()
  -- function num : 0_25
  PaGlobal_MovieGuide_Web:Close()
end

PanelEscapeFunc_MovieGuideWebList = function()
  -- function num : 0_26
  PaGlobal_MovieGuide_Weblist:Close()
end

PanelEscapeFunc_MovieSkillGuideWeblist = function()
  -- function num : 0_27
  PaGlobal_MovieSkillGuide_Web:Close()
end

PanelEscapeFunc_MovieSkillGuide = function()
  -- function num : 0_28
  PaGlobal_MovieSkillGuide_Weblist:Close()
end

PanelEscapeFunc_CheckedQuestQption = function()
  -- function num : 0_29
  FGlobal_CheckedQuestOptionClose()
end

PanelEscapeFunc_Skill = function()
  -- function num : 0_30
  if _ContentsGroup_RenewUI_Skill == false then
    HandleMLUp_SkillWindow_Close()
  else
    PaGlobalFunc_Skill_Close()
  end
end

PanelEscapeFunc_SaveSetting = function()
  -- function num : 0_31
  PaGlobal_Panel_SaveSetting_Hide()
end

PanelEscapeFunc_HarvestList = function()
  -- function num : 0_32
  HarvestList_Close()
end

PanelEscapeFunc_PartyRecruite = function()
  -- function num : 0_33
  PartyListRecruite_Close()
end

PanelEscapeFunc_ServantResurrection = function()
  -- function num : 0_34
  Panel_ServantResurrection_Close()
end

PanelEscapeFunc_DialogNPCShopRenew = function()
  -- function num : 0_35
  PaGlobalFunc_Dialog_NPCShop_Close()
end

PanelEscapeFunc_DialogNPCShop = function()
  -- function num : 0_36
  NpcShop_WindowClose()
end

PanelEscapeFunc_Camp = function()
  -- function num : 0_37
  PaGlobal_Camp:close()
end

PanelEscapeFunc_CampRegister = function()
  -- function num : 0_38
  FGlobal_CampRegister_Close()
end

PanelEscapeFunc_MonsterRanking = function()
  -- function num : 0_39
  FGlobal_MonsterRanking_Close()
end

PanelEscapeFunc_ChatOption = function()
  -- function num : 0_40
  ChattingOption_Close()
end

PanelEscapeFunc_BuildingBuff = function()
  -- function num : 0_41
  PaGlobal_BuildingBuff:close()
end

PanelEscapeFunc_PersonalBattle = function()
  -- function num : 0_42
  PaGlobal_PersonalBattle:close()
end

PanelEscapeFunc_Memo = function()
  -- function num : 0_43
  PaGlobal_Memo:ListClose()
end

PanelEscapeFunc_GuildOneOnOneRequest = function()
  -- function num : 0_44
  FGlobal_GuildTeamBattle_CloseRequestPanel()
end

PanelEscapeFunc_CustomizingAlbum = function()
  -- function num : 0_45
  CustomizingAlbum_Close()
end

PanelEscapeFunc_IntroMovie = function()
  -- function num : 0_46
  CloseIntroMovie()
end

PanelEscapeFunc_ChattingInput = function()
  -- function num : 0_47
  Panel_Chatting_Input:SetShow(true, false)
end

PanelEscapeFunc_ButtonShortcuts = function()
  -- function num : 0_48
  PaGlobal_ButtonShortcuts:Close()
end

PanelEscapeFunc_TranslationReport = function()
  -- function num : 0_49
  TranslationReport_Close()
end

PanelEscapeFunc_ProductNote = function()
  -- function num : 0_50
  Panel_ProductNote_ShowToggle()
end

PanelEscapeFunc_KeyboardHelp = function()
  -- function num : 0_51
  FGlobal_KeyboardHelpShow()
end

PanelEscapeFunc_WebControl = function()
  -- function num : 0_52
  Panel_WebHelper_ShowToggle()
end

PanelEscapeFunc_Warehouse = function()
  -- function num : 0_53
  Warehouse_Close()
end

PanelEscapeFunc_SetVoiceChat = function()
  -- function num : 0_54
  FGlobal_SetVoiceChat_Close()
end

PanelEscapeFunc_WorkerChangeSkill = function()
  -- function num : 0_55
  FGlobal_workerChangeSkill_Close()
end

PanelEscapeFunc_FileExplorer = function()
  -- function num : 0_56
  closeExplorer()
end

PanelEscapeFunc_WorkerManager = function()
  -- function num : 0_57
  workerManager_Close()
  FGlobal_HideWorkerTooltip()
end

PanelEscapeFunc_WorkerAuction = function()
  -- function num : 0_58
  WorkerAuction_Close()
end

PanelEscapeFunc_WorkerResistAuction = function()
  -- function num : 0_59
  FGlobal_ResistWorkerToAuction_Close()
end

PanelEscapeFunc_WorkerListAuction = function()
  -- function num : 0_60
  MyworkerList_Close()
end

PanelEscapeFunc_Exchange = function()
  -- function num : 0_61
  Panel_ExchangePC_BtnClose_Mouse_Click()
end

PanelEscapeFunc_TransferLifeExperience = function()
  -- function num : 0_62
  FGlobal_TransferLife_Close()
end

PanelEscapeFunc_DyePalette = function()
  -- function num : 0_63
  FGlobal_DyePalette_Close()
end

PanelEscapeFunc_SetShortCut = function()
  -- function num : 0_64
  FGlobal_NewShortCut_Close()
end

PanelEscapeFunc_Inventory = function()
  -- function num : 0_65
  InventoryWindow_Close()
  if Panel_Equipment:GetShow() then
    Equipment_SetShow(false)
  end
  ClothInventory_Close()
end

PanelEscapeFunc_ExchangeNumber = function()
  -- function num : 0_66
  Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
end

PanelEscapeFunc_Option = function()
  -- function num : 0_67
  GameOption_Cancel()
  TooltipSimple_Hide()
end

PanelEscapeFunc_CarveSeal = function()
  -- function num : 0_68
  FromClient_SealWindowHide()
end

PanelEscapeFunc_GuildWebInfo = function()
  -- function num : 0_69
  FGlobal_GuildWebInfoClose()
end

PanelEscapeFunc_GuildRankWeb = function()
  -- function num : 0_70
  GuildRank_Web_Close()
end

PanelEscapeFunc_GuildRank = function()
  -- function num : 0_71
  FGlobal_guildRanking_Close()
end

PanelEscapeFunc_ChangeWeapon = function()
  -- function num : 0_72
  WeaponChange_Close()
end

PanelEscapeFunc_SkillReinforce = function()
  -- function num : 0_73
  Panel_SkillReinforce_Close()
end

PanelEscapeFunc_Looting = function()
  -- function num : 0_74
end

PanelEscapeFunc_FriendList = function()
  -- function num : 0_75
  FriendList_hide()
end

PanelEscapeFunc_CheckedQuest = function()
  -- function num : 0_76
  FGlobal_QuestInfoDetail_Close()
end

PanelEscapeFunc_Quest = function()
  -- function num : 0_77
  Panel_Window_QuestNew_Show(false)
end

PanelEscapeFunc_QuestRenew = function()
  -- function num : 0_78
  PaGlobalFunc_Quest_SetShow(false)
end

PanelEscapeFunc_DeliveryRequest = function()
  -- function num : 0_79
  DeliveryRequestWindow_Close()
end

PanelEscapeFunc_Guild = function()
  -- function num : 0_80
  GuildManager:Hide()
  audioPostEvent_SystemUi(1, 31)
end

PanelEscapeFunc_AgreementGuildMaster = function()
  -- function num : 0_81
  agreementGuild_Master_Close()
end

PanelEscapeFunc_AgreementGuildMaster = function()
  -- function num : 0_82
  CheckChattingInput()
  audioPostEvent_SystemUi(1, 31)
  FGlobal_AgreementGuild_Close()
end

PanelEscapeFunc_GuildIncentive = function()
  -- function num : 0_83
  FGlobal_GuildIncentive_Close()
end

PanelEscapeFunc_GuildDuel = function()
  -- function num : 0_84
  FGlobal_GuildDuel_Close()
end

PanelEscapeFunc_GameTips = function()
  -- function num : 0_85
  if _ContentsGroup_RenewUI == false then
    FGlobal_GameTipsHide()
  end
end

PanelEscapeFunc_PetInfoNew = function()
  -- function num : 0_86
  TooltipSimple_Hide()
end

PanelEscapeFunc_Event100Day = function()
  -- function num : 0_87
  FGlobal_Event_100Day_Close()
end

PanelEscapeFunc_DanceFrame = function()
  -- function num : 0_88
  FGlobal_DanceFrame_Close()
end

PanelEscapeFunc_WorkerTooltip = function()
  -- function num : 0_89
  FGlobal_HideWorkerTooltip()
end

PanelEscapeFunc_ChangeItem = function()
  -- function num : 0_90
  ItemChange_Close()
end

PanelEscapeFunc_MovieGuide = function()
  -- function num : 0_91
  Panel_MovieGuide_ShowToggle()
end

PanelEscapeFunc_ItemMarket = function()
  -- function num : 0_92
  FGolbal_ItemMarketNew_Close()
end

PanelEscapeFunc_ItemMarketRegistItem = function()
  -- function num : 0_93
  FGlobal_ItemMarketRegistItem_Close()
end

PanelEscapeFunc_AlchemyStone = function()
  -- function num : 0_94
  FGlobal_AlchemyStone_Close()
end

PanelEscapeFunc_AlchemyFigureHead = function()
  -- function num : 0_95
  FGlobal_AlchemyFigureHead_Close()
end

PanelEscapeFunc_MovieTheater320 = function()
  -- function num : 0_96
  Panel_MovieTheater320_JustClose()
end

PanelEscapeFunc_CharacterTag = function()
  -- function num : 0_97
  PaGlobal_CharacterTag_Close()
end

PanelEscapeFunc_FairyInfo = function()
  -- function num : 0_98
  PaGlobal_FairyInfo_Close()
end

PanelEscapeFunc_FairySetting = function()
  -- function num : 0_99
  PaGlobal_FairySetting_Close()
end

PanelEscapeFunc_FairyUpgrade = function()
  -- function num : 0_100
  PaGlobal_FairyInfo_Close()
end

PanelEscapeFunc_LifeRanking = function()
  -- function num : 0_101
  FGlobal_LifeRanking_Close()
end

PanelEscapeFunc_MessageBox = function()
  -- function num : 0_102
  messageBox_CloseButtonUp()
end

PanelEscapeFunc_MessageBoxCheck = function()
  -- function num : 0_103
  messageBoxCheck_CloseButtonUp()
end

local Panel_LowLevelGuide_Value_IsCheckMoviePlay = Panel_LowLevelGuide_Value_IsCheckMoviePlay
isComboMovieClosedCount = 0
FromClient_EscapeEtcClose = function()
  -- function num : 0_104 , upvalues : Panel_LowLevelGuide_Value_IsCheckMoviePlay
  if Panel_MovieTheater_320:IsShow() == false then
    value_Panel_MovieTheater_320_IsCheckedShow = false
  end
  if value_Panel_MovieTheater_320_IsCheckedShow == true then
    isComboMovieClosedCount = isComboMovieClosedCount + 1
    if isComboMovieClosedCount >= 3 then
      Panel_MovieTheater320_MessageBox()
      Panel_MovieTheater_MessageBox:SetShow(true)
    else
      Panel_MovieTheater320_ResetMessageBox()
    end
  end
  Panel_Tooltip_Item_hideTooltip()
  Panel_Tooltip_Item_chattingLinkedItem_hideTooltip()
  Panel_Tooltip_Item_chattingLinkedItemClick_hideTooltip()
  Panel_SkillTooltip_Hide()
  FGlobal_BuffTooltipOff()
  if Panel_IngameCashShop_GoodsTooltip:IsShow() then
    Panel_IngameCashShop_GoodsTooltip:SetShow(false)
  end
  if _ContentsGroup_RenewUI_Knowledge == false then
    Panel_Knowledge_Hide()
  else
    PaGlobalFunc_Window_Knowledge_Exit()
  end
  if Panel_LowLevelGuide_Value_IsCheckMoviePlay == 1 then
    FGlobal_Panel_LowLevelGuide_MovePlay_FindWay()
  else
    if Panel_LowLevelGuide_Value_IsCheckMoviePlay == 2 then
      FGlobal_Panel_LowLevelGuide_MovePlay_LearnSkill()
    else
      if Panel_LowLevelGuide_Value_IsCheckMoviePlay == 3 then
        FGlobal_Panel_LowLevelGuide_MovePlay_FindTarget()
      else
        if Panel_LowLevelGuide_Value_IsCheckMoviePlay == 4 then
          FGlobal_Panel_LowLevelGuide_MovePlay_AcceptQuest()
        else
          if Panel_LowLevelGuide_Value_IsCheckMoviePlay == 99 then
            FGlobal_Panel_LowLevelGuide_MovePlay_BlackSpirit()
          end
        end
      end
    end
  end
end

close_WindowPanelList = function()
  -- function num : 0_105
  Toclient_closeAllPanel(false)
end

close_force_WindowPanelList = function()
  -- function num : 0_106
  Toclient_closeAllPanel(true)
end

check_ShowWindow = function()
  -- function num : 0_107
  return ToClient_isShownClosePanel()
end

FromClient_OpenOption = function()
  -- function num : 0_108
  Panel_Menu_ShowToggle()
end

PanelEscapeFunc_CharacterInfo = function()
  -- function num : 0_109
  PaGlobalFunc_Window_CharacterInfo_Close()
end

registerEvent("FromClient_EscapeEtcClose", "FromClient_EscapeEtcClose")
registerEvent("FromClient_OpenOption", "FromClient_OpenOption")
close_UISubAppPanelList = function()
  -- function num : 0_110
  if _ContentsGroup_RenewUI_Knowledge == false then
    Panel_Knowledge_Hide()
  else
    PaGlobalFunc_Window_Knowledge_Exit()
  end
  if Panel_WorkerManager:GetShow() and not Panel_WorldMap:GetShow() then
    HandleClicked_WorkerManager_Close()
    FGlobal_HideWorkerTooltip()
  end
  if Panel_Window_Inventory:IsShow() and Panel_Window_Inventory:IsUISubApp() then
    HandleClicked_InventoryWindow_Close()
  end
  if not _ContentsGroup_RenewUI and Panel_Equipment:IsShow() and Panel_Equipment:IsUISubApp() then
    HandleClicked_EquipmentWindow_Close()
  end
  if Panel_KnowledgeManagement:GetShow() then
    FGlobal_KnowledgeClose()
  end
  -- DECOMPILER ERROR at PC70: Unhandled construct in 'MakeBoolean' P1

  if _ContentsGroup_RenewUI == false and Panel_Window_Quest_New:GetShow() == true and Panel_Window_Quest_New:IsUISubApp() == true then
    HandleClicked_QuestNew_Close()
  end
  if PaGlobalFunc_Quest_GetShow() == true then
    PaGlobalFunc_Quest_SetShow(false)
    return 
  end
  if Panel_Npc_Quest_Reward:IsUISubApp() then
    FGlobal_ShowRewardList(false, 0)
  end
  if Panel_WorkerManager:GetShow() and Panel_WorkerManager:IsUISubApp() then
    workerManager_Close()
  end
  if _ContentsGroup_isUsedNewTradeEventNotice and Panel_TradeEventNotice_Renewal:IsShow() and Panel_TradeEventNotice_Renewal:IsUISubApp() then
    FGlobal_TradeEventNotice_Renewal_Close()
  end
  if Panel_TradeMarket_EventInfo:IsShow() and Panel_TradeMarket_EventInfo:IsUISubApp() then
    TradeEventInfo_Close()
  end
  if Panel_Window_ItemMarket:GetShow() and Panel_Window_ItemMarket:IsUISubApp() then
    HandleClicked_ItemMarket_Close()
  end
  if Panel_Window_BlackSpiritAdventure:GetShow() and Panel_Window_BlackSpiritAdventure:IsUISubApp() then
    BlackSpiritAd_Hide()
  end
  if Panel_Window_Guild:GetShow() and Panel_Window_Guild:IsUISubApp() then
    HandleClickedGuildHideButton()
  end
  if Panel_GuildWarInfo:GetShow() and Panel_GuildWarInfo:IsUISubApp() then
    Panel_GuildWarInfo_Hide()
  end
  if Panel_Window_CharInfo_Status:GetShow() and Panel_Window_CharInfo_Status:IsUISubApp() then
    if _ContentsGroup_isUsedNewCharacterInfo == false then
      CharacterInfoWindow_Hide()
    else
      PaGlobal_CharacterInfo:hideWindow()
    end
  end
end

local panel_MinigameList = {Panel_Minigame_Gradient, Panel_SinGauge, Panel_Command, Panel_RhythmGame, Panel_BattleGauge, Panel_FillGauge, Panel_MiniGame_Gradient_Y, Panel_MiniGame_Timing, Panel_MiniGame_Drag, Panel_MiniGame_PowerControl, Panel_RhythmGame_ForAction, Panel_MiniGame_Steal, Panel_MiniGame_PowerControl, Panel_MiniGame_Jaksal, Panel_RhythmGame_Drum}
close_WindowMinigamePanelList = function()
  -- function num : 0_111 , upvalues : panel_MinigameList
  for _,loopPanel in ipairs(panel_MinigameList) do
    loopPanel:SetShow(false, false)
  end
end


