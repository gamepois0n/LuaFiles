PaGlobal_panelExceptionList = nil
function CloseManager_RegisterExeptionList()
  PaGlobal_panelExceptionList = {
    Panel_OnlyPerframeUsed,
    Panel_Danger,
    Panel_NoAceessArea_Alert,
    Panel_DamageDisplay,
    MentalGame_MouseInputer,
    Panel_CommonGameScreenUI,
    Panel_LocalwarByBalanceServer,
    Panel_GuildBattle_JoinMember,
    Panel_GuidlBattle_Point,
    Panel_GuildBattle_EntryList,
    Panel_GuildBattle_SelectMember,
    Panel_CompetitionGame_TeamUi,
    Panel_Arsha_TeamWidget,
    Panel_Widget_Keyboard,
    Panel_Blackspirit_OnOff,
    Panel_HorseMp,
    Panel_HorseHp,
    Panel_Window_Servant,
    Panel_Widget_ServantIcon,
    Panel_Cannon,
    Panel_CannonShip,
    Panel_Window_PetControl,
    Panel_Window_PetIcon,
    Panel_Window_FairyIcon,
    Panel_Icon_Maid,
    Panel_Icon_Camp,
    Panel_Icon_Duel,
    Panel_Icon_CharacterTag,
    Panel_Chat,
    Panel_GameTip,
    Panel_GameTipMask,
    Panel_Stamina,
    Panel_CannonGauge,
    Panel_Widget_SkillLog,
    Panel_Region,
    Panel_WhereUseItemDirection,
    Panel_Widget_TownNpcNavi,
    Panel_Bubble,
    Panel_BreathGauge,
    Panel_LocalWar,
    Panel_LocalWarTeam,
    Panel_TerritoryWar_Caution,
    Panel_BossWave,
    Panel_TimeAttack,
    Panel_WorldMap,
    Panel_TimeBar,
    Panel_CounterAttack,
    Panel_Global_Manual,
    Panel_Fishing,
    Panel_MyHouseNavi,
    Panel_Endurance,
    Panel_SniperGame,
    Panel_SniperGame_Result,
    Panel_GameTips,
    Panel_HorseEndurance,
    Panel_CarriageEndurance,
    Panel_ShipEndurance,
    Panel_MainStatus_User_Bar,
    Panel_SelfPlayerExpGage,
    Panel_PersonalIcon_Left,
    Panel_MainStatus_Remaster,
    Panel_Casting_Bar,
    Panel_PvpMode,
    Panel_ClassResource,
    Panel_Adrenallin,
    Panel_GuardGauge,
    Panel_AutoTraining,
    Panel_PersonalIcon,
    Panel_Widget_Function,
    Panel_NewEquip,
    Panel_QuickSlot,
    Panel_NewQuickSlot,
    Panel_NewQuickSlot_0,
    Panel_NewQuickSlot_1,
    Panel_NewQuickSlot_2,
    Panel_NewQuickSlot_3,
    Panel_NewQuickSlot_4,
    Panel_NewQuickSlot_5,
    Panel_NewQuickSlot_6,
    Panel_NewQuickSlot_7,
    Panel_NewQuickSlot_8,
    Panel_NewQuickSlot_9,
    Panel_NewQuickSlot_10,
    Panel_NewQuickSlot_11,
    Panel_NewQuickSlot_12,
    Panel_NewQuickSlot_13,
    Panel_NewQuickSlot_14,
    Panel_NewQuickSlot_15,
    Panel_NewQuickSlot_16,
    Panel_NewQuickSlot_17,
    Panel_NewQuickSlot_18,
    Panel_NewQuickSlot_19,
    Panel_SkillCooltime,
    Panel_SkillCoolTimeQuickSlot,
    Panel_SkillCoolTimeQuickSlot_0,
    Panel_SkillCoolTimeQuickSlot_1,
    Panel_SkillCoolTimeQuickSlot_2,
    Panel_SkillCoolTimeQuickSlot_3,
    Panel_SkillCoolTimeQuickSlot_4,
    Panel_SkillCoolTimeQuickSlot_5,
    Panel_SkillCoolTimeQuickSlot_6,
    Panel_SkillCoolTimeQuickSlot_7,
    Panel_SkillCoolTimeQuickSlot_8,
    Panel_SkillCoolTimeQuickSlot_9,
    Panel_HouseName,
    Panel_Housing_FarmInfo_New,
    Panel_InstallationMode_FarmInfo,
    Panel_House_InstallationMode,
    Panel_House_InstallationMode_ObjectControl,
    Panel_House_WarInformation,
    Panel_House_InstallationMode_Cart,
    Panel_EnemyAlert_OnShip,
    Panel_Radar,
    Panel_TimeBarNumber,
    Panel_FrameLoop_Widget,
    Panel_NaviPath,
    Panel_CoolTime_Effect,
    Panel_CoolTime_Effect_Slot,
    Panel_CoolTime_Effect_Item,
    Panel_CoolTime_Effect_Item_Slot,
    Panel_MiniGame_Timing,
    Panel_BattleGauge,
    Panel_Minigame_Gradient,
    Panel_MiniGame_PowerControl,
    Panel_RhythmGame,
    Panel_RhythmGame_Drum,
    Panel_SinGauge,
    Panel_Command,
    Panel_MiniGame_Gradient_Y,
    Panel_FillGauge,
    Panel_MiniGame_Steal,
    Panel_MiniGame_Jaksal,
    Panel_SteeringWheel,
    Panel_Hammer_New,
    Panel_SkillCommand,
    Panel_Combo_Guide,
    Panel_ComboCommand,
    Panel_ConsoleCombo,
    Panel_Dialog_Search,
    Panel_Movie_KeyViewer,
    Panel_Cutscene,
    Panel_Copy_HouseHold,
    Panel_Copy_Installation,
    Panel_Copy_Monster,
    Panel_Copy_Npc,
    Panel_Copy_OtherPlayer,
    Panel_Copy_SelfPlayer,
    Panel_Copy_Vehicle,
    Panel_Copy_BubbleBox,
    Panel_Copy_HumanRelation,
    Panel_Copy_HumanRelationIcon,
    Panel_Copy_WaitComment,
    Panel_Copy_NaviPath,
    Panel_AppliedBuffList,
    Panel_WorldMiniMap,
    Panel_UIMain,
    Panel_Widget_CraftLevInfo,
    Panel_Widget_PotenGradeInfo,
    Panel_Window_StableInfo,
    Panel_RewardSelect_NakMessage,
    Panel_NewQuest,
    Panel_Levelup_Reward,
    Panel_Acquire,
    Panel_QuestDirect,
    Panel_Potencial_Up,
    Panel_Chat0,
    Panel_Chat1,
    Panel_Chat2,
    Panel_Chat3,
    Panel_Chat4,
    Panel_Window_PartyInventory,
    Panel_Knowledge_Info,
    Panel_Knowledge_List,
    Panel_Knowledge_Point,
    Panel_MentalGame_Right,
    Panel_Damage,
    Panel_fieldQuest,
    Panel_Npc_Dialog,
    Panel_Exchange_Item,
    Panel_Dialogue_Itemtake,
    Panel_Dialog_Scene,
    Panel_DetectPlayer,
    Panel_Interest_Knowledge,
    Panel_Widget_Party,
    Panel_Widget_Raid,
    Panel_CheckedQuest,
    Panel_MainQuest,
    damagePanel_1,
    damagePanel_2,
    damagePanel_3,
    damagePanel_4,
    damagePanel_5,
    damagePanel_6,
    damagePanel_7,
    damagePanel_8,
    damagePanel_9,
    damagePanel_10,
    damagePanel_11,
    damagePanel_12,
    damagePanel_13,
    damagePanel_14,
    damagePanel_15,
    damagePanel_16,
    damagePanel_17,
    damagePanel_18,
    damagePanel_19,
    damagePanel_20,
    Panel_WorldMiniMap,
    Panel_WorldMap_PartyMemberTail,
    Panel_WorldMap_PartyMemberIcon,
    Panel_WorldMap_PartyMemberIcon1,
    Panel_WorldMap_PartyMemberTail1,
    Panel_WorldMap_PartyMemberIcon2,
    Panel_WorldMap_PartyMemberTail2,
    Panel_WorldMap_PartyMemberIcon3,
    Panel_WorldMap_PartyMemberTail3,
    Panel_WorldMap_PartyMemberIcon4,
    Panel_WorldMap_PartyMemberTail4,
    Panel_WorldMap_PartyMemberIcon5,
    Panel_WorldMap_PartyMemberTail5,
    Panel_WorldMap_PartyMemberIcon6,
    Panel_WorldMap_PartyMemberTail6,
    Panel_WorldMap_PartyMemberIcon7,
    Panel_WorldMap_PartyMemberTail7,
    Panel_WorldMap_PartyMemberIcon8,
    Panel_WorldMap_PartyMemberTail8,
    Panel_WorldMap_PartyMemberIcon9,
    Panel_WorldMap_PartyMemberTail9,
    Panel_WorldMap_PartyMemberIcon10,
    Panel_WorldMap_PartyMemberTail10,
    Panel_WorldMap_PartyMemberIcon11,
    Panel_WorldMap_PartyMemberTail11,
    Panel_WorldMap_PartyMemberIcon12,
    Panel_WorldMap_PartyMemberTail12,
    Panel_WorldMap_PartyMemberIcon13,
    Panel_WorldMap_PartyMemberTail13,
    Panel_WorldMap_PartyMemberIcon14,
    Panel_WorldMap_PartyMemberTail14,
    Panel_WorldMap_PartyMemberIcon15,
    Panel_WorldMap_PartyMemberTail15,
    Panel_WorldMap_PartyMemberIcon16,
    Panel_WorldMap_PartyMemberTail16,
    Panel_WorldMap_PartyMemberIcon17,
    Panel_WorldMap_PartyMemberTail17,
    Panel_WorldMap_PartyMemberIcon18,
    Panel_WorldMap_PartyMemberTail18,
    Panel_WorldMap_PartyMemberIcon19,
    Panel_WorldMap_PartyMemberTail19,
    Panel_WorldMap_PartyMemberIcon20,
    Panel_WorldMap_PartyMemberTail20,
    Panel_MentalGame_Select_0,
    Panel_MentalGame_Select_1,
    Panel_MentalGame_Select_2,
    Panel_MentalGame_Select_3,
    Panel_MentalGame_Select_4,
    Panel_MentalGame_Select_5,
    Panel_MentalGame_Select_6,
    Panel_MentalGame_Select_7,
    Panel_MentalGame_Select_8,
    Panel_MentalGame_Select_9,
    MentalGame_Animation_0_1,
    MentalGame_Animation_0_2,
    MentalGame_Animation_0_3,
    MentalGame_Animation_0_4,
    MentalGame_Animation_0_5,
    MentalGame_Animation_0_6,
    MentalGame_Animation_0_7,
    MentalGame_Animation_0_8,
    MentalGame_Animation_0_9,
    MentalGame_Animation_0_10,
    MentalGame_Animation_0_11,
    MentalGame_Animation_0_12,
    MentalGame_Animation_0_13,
    MentalGame_Animation_0_14,
    MentalGame_Animation_0_15,
    MentalGame_Animation_0_16,
    MentalGame_Animation_0_17,
    MentalGame_Animation_0_18,
    MentalGame_Animation_0_19,
    MentalGame_Animation_1_2,
    MentalGame_Animation_1_3,
    MentalGame_Animation_1_4,
    MentalGame_Animation_1_5,
    MentalGame_Animation_1_6,
    MentalGame_Animation_1_7,
    MentalGame_Animation_1_8,
    MentalGame_Animation_1_9,
    MentalGame_Animation_1_10,
    MentalGame_Animation_1_11,
    MentalGame_Animation_1_12,
    MentalGame_Animation_1_13,
    MentalGame_Animation_1_14,
    MentalGame_Animation_1_15,
    MentalGame_Animation_1_16,
    MentalGame_Animation_1_17,
    MentalGame_Animation_1_18,
    MentalGame_Animation_1_19,
    MentalGame_Animation_2_3,
    MentalGame_Animation_2_4,
    MentalGame_Animation_2_5,
    MentalGame_Animation_2_6,
    MentalGame_Animation_2_7,
    MentalGame_Animation_2_8,
    MentalGame_Animation_2_9,
    MentalGame_Animation_2_10,
    MentalGame_Animation_2_11,
    MentalGame_Animation_2_12,
    MentalGame_Animation_2_13,
    MentalGame_Animation_2_14,
    MentalGame_Animation_2_15,
    MentalGame_Animation_2_16,
    MentalGame_Animation_2_17,
    MentalGame_Animation_2_18,
    MentalGame_Animation_2_19,
    MentalGame_Animation_3_4,
    MentalGame_Animation_3_5,
    MentalGame_Animation_3_6,
    MentalGame_Animation_3_7,
    MentalGame_Animation_3_8,
    MentalGame_Animation_3_9,
    MentalGame_Animation_3_10,
    MentalGame_Animation_3_11,
    MentalGame_Animation_3_12,
    MentalGame_Animation_3_13,
    MentalGame_Animation_3_14,
    MentalGame_Animation_3_15,
    MentalGame_Animation_3_16,
    MentalGame_Animation_3_17,
    MentalGame_Animation_3_18,
    MentalGame_Animation_3_19,
    MentalGame_Animation_4_5,
    MentalGame_Animation_4_6,
    MentalGame_Animation_4_7,
    MentalGame_Animation_4_8,
    MentalGame_Animation_4_9,
    MentalGame_Animation_4_10,
    MentalGame_Animation_4_11,
    MentalGame_Animation_4_12,
    MentalGame_Animation_4_13,
    MentalGame_Animation_4_14,
    MentalGame_Animation_4_15,
    MentalGame_Animation_4_16,
    MentalGame_Animation_4_17,
    MentalGame_Animation_4_18,
    MentalGame_Animation_4_19,
    MentalGame_Animation_5_6,
    MentalGame_Animation_5_7,
    MentalGame_Animation_5_8,
    MentalGame_Animation_5_9,
    MentalGame_Animation_5_10,
    MentalGame_Animation_5_11,
    MentalGame_Animation_5_12,
    MentalGame_Animation_5_13,
    MentalGame_Animation_5_14,
    MentalGame_Animation_5_15,
    MentalGame_Animation_5_16,
    MentalGame_Animation_5_17,
    MentalGame_Animation_5_18,
    MentalGame_Animation_5_19,
    MentalGame_Animation_6_7,
    MentalGame_Animation_6_8,
    MentalGame_Animation_6_9,
    MentalGame_Animation_6_10,
    MentalGame_Animation_6_11,
    MentalGame_Animation_6_12,
    MentalGame_Animation_6_13,
    MentalGame_Animation_6_14,
    MentalGame_Animation_6_15,
    MentalGame_Animation_6_16,
    MentalGame_Animation_6_17,
    MentalGame_Animation_6_18,
    MentalGame_Animation_6_19,
    MentalGame_Animation_7_8,
    MentalGame_Animation_7_9,
    MentalGame_Animation_7_10,
    MentalGame_Animation_7_11,
    MentalGame_Animation_7_12,
    MentalGame_Animation_7_13,
    MentalGame_Animation_7_14,
    MentalGame_Animation_7_15,
    MentalGame_Animation_7_16,
    MentalGame_Animation_7_17,
    MentalGame_Animation_7_18,
    MentalGame_Animation_7_19,
    MentalGame_Animation_8_9,
    MentalGame_Animation_8_10,
    MentalGame_Animation_8_11,
    MentalGame_Animation_8_12,
    MentalGame_Animation_8_13,
    MentalGame_Animation_8_14,
    MentalGame_Animation_8_15,
    MentalGame_Animation_8_16,
    MentalGame_Animation_8_17,
    MentalGame_Animation_8_18,
    MentalGame_Animation_8_19,
    MentalGame_Animation_9_10,
    MentalGame_Animation_9_11,
    MentalGame_Animation_9_12,
    MentalGame_Animation_9_13,
    MentalGame_Animation_9_14,
    MentalGame_Animation_9_15,
    MentalGame_Animation_9_16,
    MentalGame_Animation_9_17,
    MentalGame_Animation_9_18,
    MentalGame_Animation_9_19,
    MentalGame_Animation_10_11,
    MentalGame_Animation_10_12,
    MentalGame_Animation_10_13,
    MentalGame_Animation_10_14,
    MentalGame_Animation_10_15,
    MentalGame_Animation_10_16,
    MentalGame_Animation_10_17,
    MentalGame_Animation_10_18,
    MentalGame_Animation_10_19,
    MentalGame_Animation_11_12,
    MentalGame_Animation_11_13,
    MentalGame_Animation_11_14,
    MentalGame_Animation_11_15,
    MentalGame_Animation_11_16,
    MentalGame_Animation_11_17,
    MentalGame_Animation_11_18,
    MentalGame_Animation_11_19,
    MentalGame_Animation_12_13,
    MentalGame_Animation_12_14,
    MentalGame_Animation_12_15,
    MentalGame_Animation_12_16,
    MentalGame_Animation_12_17,
    MentalGame_Animation_12_18,
    MentalGame_Animation_12_19,
    MentalGame_Animation_13_14,
    MentalGame_Animation_13_15,
    MentalGame_Animation_13_16,
    MentalGame_Animation_13_17,
    MentalGame_Animation_13_18,
    MentalGame_Animation_13_19,
    MentalGame_Animation_14_15,
    MentalGame_Animation_14_16,
    MentalGame_Animation_14_17,
    MentalGame_Animation_14_18,
    MentalGame_Animation_14_19,
    MentalGame_Animation_15_16,
    MentalGame_Animation_15_17,
    MentalGame_Animation_15_18,
    MentalGame_Animation_15_19,
    MentalGame_Animation_16_17,
    MentalGame_Animation_16_18,
    MentalGame_Animation_16_19,
    MentalGame_Animation_17_18,
    MentalGame_Animation_17_19,
    MentalGame_Animation_18_19,
    MentalGame_Information_0_1,
    MentalGame_Information_0_2,
    MentalGame_Information_0_3,
    MentalGame_Information_0_4,
    MentalGame_Information_0_5,
    MentalGame_Information_0_6,
    MentalGame_Information_0_7,
    MentalGame_Information_0_8,
    MentalGame_Information_0_9,
    MentalGame_Information_0_10,
    MentalGame_Information_0_11,
    MentalGame_Information_0_12,
    MentalGame_Information_0_13,
    MentalGame_Information_0_14,
    MentalGame_Information_0_15,
    MentalGame_Information_0_16,
    MentalGame_Information_0_17,
    MentalGame_Information_0_18,
    MentalGame_Information_0_19,
    MentalGame_Information_1_2,
    MentalGame_Information_1_3,
    MentalGame_Information_1_4,
    MentalGame_Information_1_5,
    MentalGame_Information_1_6,
    MentalGame_Information_1_7,
    MentalGame_Information_1_8,
    MentalGame_Information_1_9,
    MentalGame_Information_1_10,
    MentalGame_Information_1_11,
    MentalGame_Information_1_12,
    MentalGame_Information_1_13,
    MentalGame_Information_1_14,
    MentalGame_Information_1_15,
    MentalGame_Information_1_16,
    MentalGame_Information_1_17,
    MentalGame_Information_1_18,
    MentalGame_Information_1_19,
    MentalGame_Information_2_3,
    MentalGame_Information_2_4,
    MentalGame_Information_2_5,
    MentalGame_Information_2_6,
    MentalGame_Information_2_7,
    MentalGame_Information_2_8,
    MentalGame_Information_2_9,
    MentalGame_Information_2_10,
    MentalGame_Information_2_11,
    MentalGame_Information_2_12,
    MentalGame_Information_2_13,
    MentalGame_Information_2_14,
    MentalGame_Information_2_15,
    MentalGame_Information_2_16,
    MentalGame_Information_2_17,
    MentalGame_Information_2_18,
    MentalGame_Information_2_19,
    MentalGame_Information_3_4,
    MentalGame_Information_3_5,
    MentalGame_Information_3_6,
    MentalGame_Information_3_7,
    MentalGame_Information_3_8,
    MentalGame_Information_3_9,
    MentalGame_Information_3_10,
    MentalGame_Information_3_11,
    MentalGame_Information_3_12,
    MentalGame_Information_3_13,
    MentalGame_Information_3_14,
    MentalGame_Information_3_15,
    MentalGame_Information_3_16,
    MentalGame_Information_3_17,
    MentalGame_Information_3_18,
    MentalGame_Information_3_19,
    MentalGame_Information_4_5,
    MentalGame_Information_4_6,
    MentalGame_Information_4_7,
    MentalGame_Information_4_8,
    MentalGame_Information_4_9,
    MentalGame_Information_4_10,
    MentalGame_Information_4_11,
    MentalGame_Information_4_12,
    MentalGame_Information_4_13,
    MentalGame_Information_4_14,
    MentalGame_Information_4_15,
    MentalGame_Information_4_16,
    MentalGame_Information_4_17,
    MentalGame_Information_4_18,
    MentalGame_Information_4_19,
    MentalGame_Information_5_6,
    MentalGame_Information_5_7,
    MentalGame_Information_5_8,
    MentalGame_Information_5_9,
    MentalGame_Information_5_10,
    MentalGame_Information_5_11,
    MentalGame_Information_5_12,
    MentalGame_Information_5_13,
    MentalGame_Information_5_14,
    MentalGame_Information_5_15,
    MentalGame_Information_5_16,
    MentalGame_Information_5_17,
    MentalGame_Information_5_18,
    MentalGame_Information_5_19,
    MentalGame_Information_6_7,
    MentalGame_Information_6_8,
    MentalGame_Information_6_9,
    MentalGame_Information_6_10,
    MentalGame_Information_6_11,
    MentalGame_Information_6_12,
    MentalGame_Information_6_13,
    MentalGame_Information_6_14,
    MentalGame_Information_6_15,
    MentalGame_Information_6_16,
    MentalGame_Information_6_17,
    MentalGame_Information_6_18,
    MentalGame_Information_6_19,
    MentalGame_Information_7_8,
    MentalGame_Information_7_9,
    MentalGame_Information_7_10,
    MentalGame_Information_7_11,
    MentalGame_Information_7_12,
    MentalGame_Information_7_13,
    MentalGame_Information_7_14,
    MentalGame_Information_7_15,
    MentalGame_Information_7_16,
    MentalGame_Information_7_17,
    MentalGame_Information_7_18,
    MentalGame_Information_7_19,
    MentalGame_Information_8_9,
    MentalGame_Information_8_10,
    MentalGame_Information_8_11,
    MentalGame_Information_8_12,
    MentalGame_Information_8_13,
    MentalGame_Information_8_14,
    MentalGame_Information_8_15,
    MentalGame_Information_8_16,
    MentalGame_Information_8_17,
    MentalGame_Information_8_18,
    MentalGame_Information_8_19,
    MentalGame_Information_9_10,
    MentalGame_Information_9_11,
    MentalGame_Information_9_12,
    MentalGame_Information_9_13,
    MentalGame_Information_9_14,
    MentalGame_Information_9_15,
    MentalGame_Information_9_16,
    MentalGame_Information_9_17,
    MentalGame_Information_9_18,
    MentalGame_Information_9_19,
    MentalGame_Information_10_11,
    MentalGame_Information_10_12,
    MentalGame_Information_10_13,
    MentalGame_Information_10_14,
    MentalGame_Information_10_15,
    MentalGame_Information_10_16,
    MentalGame_Information_10_17,
    MentalGame_Information_10_18,
    MentalGame_Information_10_19,
    MentalGame_Information_11_12,
    MentalGame_Information_11_13,
    MentalGame_Information_11_14,
    MentalGame_Information_11_15,
    MentalGame_Information_11_16,
    MentalGame_Information_11_17,
    MentalGame_Information_11_18,
    MentalGame_Information_11_19,
    MentalGame_Information_12_13,
    MentalGame_Information_12_14,
    MentalGame_Information_12_15,
    MentalGame_Information_12_16,
    MentalGame_Information_12_17,
    MentalGame_Information_12_18,
    MentalGame_Information_12_19,
    MentalGame_Information_13_14,
    MentalGame_Information_13_15,
    MentalGame_Information_13_16,
    MentalGame_Information_13_17,
    MentalGame_Information_13_18,
    MentalGame_Information_13_19,
    MentalGame_Information_14_15,
    MentalGame_Information_14_16,
    MentalGame_Information_14_17,
    MentalGame_Information_14_18,
    MentalGame_Information_14_19,
    MentalGame_Information_15_16,
    MentalGame_Information_15_17,
    MentalGame_Information_15_18,
    MentalGame_Information_15_19,
    MentalGame_Information_16_17,
    MentalGame_Information_16_18,
    MentalGame_Information_16_19,
    MentalGame_Information_17_18,
    MentalGame_Information_17_19,
    MentalGame_Information_18_19,
    Panel_ImportantKnowledge,
    Panel_NormalKnowledge,
    Panel_Housing,
    Panel_DyePreview,
    Panel_Dye_New,
    Panel_Dye_ReNew,
    Panel_WorldMap_Main,
    Panel_NodeName,
    Panel_NodeOwnerInfo,
    Panel_NaviButton,
    Panel_Interaction,
    Panel_Interaction_HouseRank,
    Panel_Interaction_House,
    Panel_WatchingMode,
    Panel_TutorialMenu,
    Panel_IngameCashShop,
    Panel_IngameCashShop_Controller,
    Panel_CashShopAlert,
    Panel_ActionMessage,
    Panel_RescueShip,
    Panel_SummonGamos,
    Panel_TamingBubble,
    Panel_FirstLogin,
    Panel_Window_GuildWarScore,
    Panel_HorseBattleList,
    Panel_Window_GuildBattle,
    Panel_Auction,
    Panel_Villa_Auction,
    Panel_TerritoryAuth_Auction,
    Panel_GuildSiegeSkill,
    Panel_Window_CharInfo_BasicStatus,
    Panel_Window_CharInfo_TitleInfo,
    Panel_Window_CharInfo_HistoryInfo,
    Panel_Window_Challenge,
    Panel_Window_CharInfo_LifeInfo,
    Panel_CompetitionGame,
    Panel_Arsha_TeamChangeControl,
    Panel_Window_ArshaSelectMember,
    Panel_Window_MercenaryDesc,
    Panel_Window_MercenaryList,
    Panel_SavageDefenceShop,
    Panel_SavageDefenceMember,
    Panel_SavageDefenceTowerHp,
    Panel_SavageDefenceWave,
    Panel_SavageDefence_Result,
    Panel_Looting,
    Panel_Inventory_CoolTime_Effect_Item_Slot,
    Panel_Equipment_SetEffectTooltip,
    Panel_Tooltip_BattlePoint,
    Panel_DanceEdit,
    Panel_DanceAction,
    Panel_LordMenu_Territory,
    Panel_LordMenu_PayInfo,
    Panel_LordMenu_TaxControl,
    Panel_SkillCombination,
    Panel_Frame_AwkOptions,
    Panel_Frame_AwkSkillList,
    Panel_Twitch,
    Panel_Window_AutoQuest,
    Panel_AutoQuest,
    Panel_BuyDrink,
    Panel_BonusEnchant,
    Panel_LinkedHorse_Skill,
    Panel_Stable_PromoteAuth,
    Panel_Stable_PromoteMarket,
    Panel_ServantMove,
    Panel_Window_StableMarket,
    Panel_AddToCarriage,
    Panel_Window_HorseLookChange,
    Panel_Window_StableStallion_ItemNotify,
    Panel_Window_StableStallion_Effect,
    Panel_Window_GuildShipNaming_Input,
    Panel_Window_GuildWharf_List,
    Panel_Window_GuildWharfInfo,
    Panel_Window_FairyRegister,
    Panel_NewMail_Alarm,
    Panel_WorldMap_PlunderVote,
    Panel_Alert_Message,
    Panel_Guild_History,
    Panel_Guild_List,
    Panel_Guild_Quest,
    Panel_Guild_Warfare,
    Panel_Guild_Skill,
    Panel_Guild_Recruitment,
    Panel_Guild_CraftInfo,
    Panel_Guild_Manufacture,
    Panel_GuildManager,
    Panel_GuildTentAttackedMsg,
    Panel_Guild_Declaration,
    Panel_Guild_AllianceInfo,
    Panel_GuildAlliance_Invitation,
    Panel_Guild_Alliance_List,
    Panel_ClanToGuild,
    Panel_Guild_Journal,
    Panel_GuildBattleWatchingMode,
    Panel_Guild_OneOnOneClock,
    Panel_Guild_OneOnOneAlert,
    Panel_Performance_Camera,
    Panel_Performance_GraphicQuality,
    Panel_Performance_Npc,
    Panel_Performance_Optimize,
    Panel_Performance_OptimizeBeta,
    Panel_Function_Alert,
    Panel_Function_Convenience,
    Panel_Function_Etc,
    Panel_Function_Interaction,
    Panel_Function_Nation,
    Panel_Function_View,
    Panel_Function_Worldmap,
    Panel_Graphic_Camera,
    Panel_Graphic_Effect,
    Panel_Graphic_Quality,
    Panel_Graphic_ScreenShot,
    Panel_Graphic_Window,
    Panel_Graphic_HDR,
    Panel_Interface_Action,
    Panel_Interface_Function,
    Panel_Interface_Mouse,
    Panel_Interface_Pad,
    Panel_Interface_QuickSlot,
    Panel_Interface_UI,
    Panel_Sound_OnOff,
    Panel_Sound_Volume,
    Panel_Alert_Alarm,
    Panel_Window_Repair,
    Panel_LuckyRepair_Result,
    Panel_Window_Extraction,
    Panel_Window_Extraction_Crystal,
    Panel_Window_Extraction_EnchantStone,
    Panel_Window_Extraction_Cloth,
    Panel_Window_DropItem,
    Panel_ChallengeReward_Alert,
    Panel_SpecialReward_Alert,
    Panel_NewEventProduct_Alarm,
    Panel_DailyStamp_Alert,
    Panel_Coupon_Alert,
    Panel_ItemMarket_Alert,
    Panel_Widget_ItemMarketPlace,
    Panel_ChangeNickname,
    Panel_House_InstallationMode_VillageTent,
    Panel_NewQuest_Alarm,
    Panel_Menu,
    Panel_Menu_New,
    Panel_Monster_Bar,
    Panel_Trade_Market_BuyItemList,
    Panel_Trade_Market_Sell_ItemList,
    Panel_Friend_Messanger,
    Panel_Manufacture_Notify,
    Panel_Window_DeliveryForPerson,
    Panel_AskKnowledge,
    Panel_MessageHistory,
    Panel_MessageHistory_BTN,
    Panel_Cash_Customization,
    Panel_Cash_Customization_BuyItem,
    Panel_Window_ItemMarket_Favorite,
    Panel_Customization_Common_Decoration,
    Panel_CustomizationTransform,
    Panel_CustomizationTransformHair,
    Panel_CustomizationTransformBody,
    Panel_CustomizationTest,
    Panel_Customization_Control,
    Panel_CustomizationMesh,
    Panel_CustomizationMotion,
    Panel_CustomizationExpression,
    Panel_CustomizationCloth,
    Panel_CustomizationPoseEdit,
    Panel_CustomizationFrame,
    Panel_CustomizationSkin,
    Panel_CustomizationStatic,
    Panel_CustomizationVoice,
    Panel_CustomizationTextureMenu,
    Panel_CustomizationImage,
    Panel_CustomizationMessage,
    Panel_Widget_ScreenShotFrame,
    Panel_ChallengePresent,
    Panel_UI_Setting,
    Panel_WorkerRestoreAll,
    Panel_MatchResult,
    Panel_RaceTimeAttack,
    Panel_RaceFinishTime,
    Panel_RaceResult,
    Panel_WorkerTrade,
    Panel_WorkerTrade_Office,
    Panel_WorkerTrade_Caravan,
    Panel_WorkerTrade_HireOffice,
    Panel_WorkerTrade_DropItem,
    Panel_Broadcast,
    Panel_SeasonTexture,
    Panel_RemoteControl,
    Panel_RemoteInventory,
    Panel_RemoteEquipment,
    Panel_RemoteWarehouse,
    Panel_RemoteManufacture,
    Panel_Memo_Sticky,
    Panel_Window_TranslationText,
    Panel_NpcGift,
    Panel_Purification,
    Panel_ArmyUnitSetting,
    Panel_Window_CardGame,
    tooltipExp,
    Panel_Window_ArshaPvPSubMenu,
    Panel_ColorBalance,
    Panel_Invertory_Manufacture_BG,
    Panel_ExtendExpiration,
    Panel_SkillAwaken_ResultOption,
    Panel_Window_FairyChoiseTheReset,
    Panel_Window_FairyTierUpgrade,
    Panel_Guild_ManufactureSelect,
    Panel_Guild_GetDailyPay,
    Panel_Guild_UseGuildFunds,
    Panel_GuildList_SetAttendanceWar,
    Panel_Guild_IncentiveOption,
    Panel_Cursor,
    Panel_Collect_Bar,
    Panel_Product_Bar,
    Panel_Enchant_Bar,
    Panel_PowerGauge,
    Panel_MiniGame_MiniGameResult,
    Panel_Masking_Tutorial,
    Panel_MyVendor_List,
    Panel_IngameCashShop_GoodsDetailInfo,
    Panel_IngameCashShop_SetEquip,
    Panel_ItemMarket_BidDesc,
    Panel_EventNotifyContent,
    Panel_SaveFreeSet,
    Panel_Subjugation_Item,
    Panel_Subjugation_SelectArmyUnit,
    Panel_SubjugationAreaSelect,
    Panel_Subjugation_SelectCharacter,
    Panel_FieldViewMode,
    Panel_IngameCashShop_NewCart,
    Panel_Window_RecommandGoods,
    Panel_IngameCashShop_MakePaymentsFromCart,
    Panel_Window_Extraction_Result,
    Panel_Tutorial,
    Panel_ArousalTutorial,
    Panel_SummonBossTutorial,
    Panel_LifeTutorial,
    Panel_Mail_InputText,
    Panel_Lord_Controller,
    Panel_TerritoryTex_Message,
    Panel_HouseIcon,
    Panel_manageWorker,
    Panel_Working_Progress,
    Panel_Worldmap_TentInfo,
    Panel_TradeNpcItemInfo,
    Panel_NodeMenu,
    Panel_NodeHouseFilter,
    Panel_Finance_WorkManager,
    Panel_RentHouse_WorkManager,
    Panel_LargeCraft_WorkManager,
    Panel_Building_WorkManager,
    Panel_Plant_WorkManager,
    Panel_WorldMap_MovieGuide,
    Panel_Win_Worldmap_WarInfo,
    Panel_Win_Worldmap_NodeWarInfo,
    Panel_WarInfoMessage,
    Panel_TerritoryWarKillingScore,
    Panel_WolrdHouseInfo,
    Panel_Worldmap_Territory,
    Panel_NodeStable,
    Panel_NodeStableInfo,
    Panel_WorldMap_Tooltip,
    Panel_NodeSiegeTooltip,
    Worldmap_Grand_GuildCraft,
    Worldmap_Grand_GuildHouseControl,
    Panel_Trade_Market_Graph_Window,
    Panel_TradeGame,
    Panel_HouseControl,
    Panel_UseItem,
    Panel_Invertory_ExchangeButton,
    Panel_Window_Delivery_InformationView,
    Panel_Select_Inherit,
    Worldmap_Grand_GuildCraft_ChangeWorker,
    Panel_RecentMemory,
    Panel_QnAWebLink,
    Panel_House_SellBuy_Condition,
    Panel_IngameCashShop_BuyPearlBox,
    Panel_IngameCashShop_HowUsePearlShop,
    Panel_Window_StampCoupon,
    Panel_UIControl,
    Panel_Radar_NightAlert,
    Panel_Tooltip_Skill,
    Panel_Tooltip_Skill_forLearning,
    Panel_Tooltip_Skill_forBlackSpirit,
    Panel_Tooltip_Guild_Introduce,
    Panel_Tooltip_Work,
    Panel_ExitConfirm_Old,
    Panel_Window_DeliveryForGameExit,
    Panel_Window_ItemMarket_BuyConfirmSecure,
    Panel_ItemMarket_Alarm,
    Panel_ItemMarket_PreBid,
    Panel_ItemMarket_PreBid_Manager,
    Panel_ItemMarket_Password,
    Panel_Window_ItemMarketAlarmList_New,
    Panel_ItemMarket_NewAlarm,
    Panel_Window_ItemMarket_RClickMenu,
    Panel_BossAlertV2,
    Panel_NoticeAlert,
    Panel_IngameCashShop_ChargeDaumCash,
    Panel_IngameCashShop_TermsofDaumCash,
    Panel_NoticeAlert1,
    Panel_NoticeAlert2,
    Panel_NoticeAlert3,
    Panel_IME,
    Panel_SpecialCharacter,
    Panel_MentalGame_Base,
    Panel_MentalGame_Left,
    Panel_MentalGame_Select,
    Panel_MentalGame_Tooltip,
    Panel_MentalGame_Center,
    Panel_NakMessage,
    Panel_Chatting_Macro,
    Panel_Chat_SubMenu,
    Panel_Chatting_Block_GoldSeller,
    Panel_Tooltip_Item,
    Panel_Tooltip_Item_equipped,
    Panel_DeadMessage,
    Panel_IngameCashShop_EasyPayment,
    DragIconPanel,
    warMsgCheckPanel,
    territoryWar_KillDeathScore_Panel_1,
    territoryWar_KillDeathScore_Panel_2,
    territoryWar_KillDeathScore_Panel_3,
    Panel_IngameCashShop_BuyOrGift,
    Panel_IngameCashShop_Password,
    Panel_MovieTheater_MessageBox,
    Panel_MovieTheater_LowLevel,
    Panel_MovieWorldMapGuide_Web,
    Panel_ButtonHelp,
    Panel_KeyTutorial,
    Panel_Fade_Screen,
    Panel_FullScreenFade,
    Panel_ScreenShot_For_Desktop,
    Panel_KickOff,
    Panel_Cash_Revival_BuyItem,
    Panel_DeadNodeSelect,
    Panel_Message_Under18,
    Panel_Window_MacroCheckQuiz,
    Panel_Window_MacroCheckQuizKeyPad,
    Panel_Window_MarketPlace_Filter,
    Panel_Widget_Servant_Renew,
    Panel_Widget_Wharf_Renew,
    Panel_Widget_Pet_Renew,
    Panel_Widget_GuildQuest,
    Panel_Widget_ChattingViewer_Renew,
    Panel_Widget_ItemLog_Renew,
    Panel_Party,
    Panel_Widget_QuickMenu,
    Panel_ConsoleKeyGuide,
    Panel_Window_InstallationMode_HousePoint,
    Panel_House_InstallationMode_Farm,
    Panel_House_InstallationMode_Item,
    Panel_Dialog_Main,
    Panel_Dialge_RewardSelect,
    Panel_Current_Guild_Quest,
    Panel_Widget_PanelInteraction_Renew,
    Panel_PearlShop,
    Panel_Pearlshop_Category,
    Panel_Global_BlackBackGround,
    Panel_Window_CharacterInfo_Title_Renew,
    Panel_Window_CharacterInfo_History_Renew,
    Panel_Window_CharacterInfo_Challenge_Renew,
    Panel_Window_CharacterInfo_Profile_Renew,
    Panel_Window_Life_Renew,
    Panel_Window_CharacterInfo_Quest_Renew,
    Panel_Window_DyeingEject_Renew,
    Panel_Window_DyeingMenu_Renew,
    Panel_Window_DyeingPalette_Renew,
    Panel_Window_DyeingPartList_Renew,
    Panel_Window_DyeingRegister_Renew,
    Panel_Window_DyeingTake_Renew,
    Panel_Window_DyeingMain_Renew,
    Panel_Window_MultiButtonPopup,
    Panel_Window_QuestInfo_Detail,
    Panel_Dialog_RandomWorker,
    Panel_Dialog_WorkerContract,
    Panel_Window_StableInfo_Menu,
    Panel_Window_Stable_ChangeSkill,
    Panel_Window_Stable_Exchange,
    Panel_Window_StableRegister_Market,
    Panel_Window_StableRegister_MarketCheck,
    Panel_Window_StableRegister_Name,
    Panel_Window_StableMarket_Filter,
    Panel_Window_WharfInfo_Menu,
    Panel_Window_Guild_MemberList,
    Panel_Window_Guild_QuestList,
    Panel_Window_Guild_SkillList,
    Panel_Window_Guild_ReceivePay,
    Panel_Window_KnowledgeInfo_Renew,
    Panel_FixMaxEndurance_Renew,
    Panel_Window_Extract_Renew,
    Panel_Tab_ExtractOutfit_Renew,
    Panel_Tab_ExtractCrystal_Renew,
    Panel_Tab_ExtractBlackStone_Renew,
    Panel_Window_ChattingHistory_Renew,
    Panel_Widget_Knowledge,
    Panel_PearlShop_ProductInfo,
    Panel_PearlShop_ProductBuy,
    Panel_Customizing,
    Panel_Customizing_KeyGuide,
    Panel_Start,
    Panel_Dialog_WorkerTrade_Renew,
    Panel_QuickMenu,
    Panel_QuickMenuCustom_RightRing,
    Panel_Tutorial_Renew,
    Panel_Worldmap_Console,
    Panel_Worldmap_NodeInfo_Console,
    Panel_Worldmap_CraftTooltip,
    Panel_Worldmap_Finance,
    Panel_Worldmap_HouseManagement,
    Panel_Worldmap_BuyHouse,
    Panel_Worldmap_RingMenu,
    Panel_Worldmap_TopMenu,
    Panel_Worldmap_BottomMenu,
    Panel_Worldmap_RightMenu,
    Panel_Worldmap_Stable,
    Panel_Worldmap_HouseFilter,
    Panel_Worldmap_NodeProduct,
    Panel_Worldmap_HouseCraft,
    Panel_Worldmap_HouseCraftLarge,
    Panel_Worldmap_SellBuyCondition,
    Panel_WorldmapKeyGuide,
    Panel_Window_GameExit_Confirm,
    Panel_Widget_NewMailAlarm_Renew,
    Panel_Widget_Tooltip_Renew,
    Panel_Widget_FloatingTooltip_Renew,
    Panel_DeadMessage_Renew,
    Panel_PadSnapTargetEffect,
    Panel_Window_MentalGame_Tooltip,
    Panel_Window_MentalGame_Finish,
    Panel_Tooltip_SimpleText,
    Panel_TradeMarket_Basket,
    Panel_TradeMarket_BiddingGame,
    Panel_TradeMarket_Graph,
    Panel_TradeMarket_In,
    Panel_TradeMarket_Goods
  }
end
