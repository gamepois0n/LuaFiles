-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\nakmessage\rewardselect_nakmessage.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_VT = CppEnums.VehicleType
local MessageData = {
_Msg = {}
}
local curIndex = 0
local processIndex = 0
local animationEndTime = 2.3
local elapsedTime = 2.3
local _text_Msg = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "MsgText")
local _text_MsgSub = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "MsgSubText")
local _text_AddMsg = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "TradeSubText")
local bigNakMsg = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "Static_BigNakMsg")
local nakItemIconBG = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "Static_IconBG")
local nakItemIcon = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "Static_Icon")
local localwarMsg = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_Localwar")
local localwarMsgSmallBG = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_LocalwarSmall")
local localwarMsgBG = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_LocalwarBG")
local _text_localwarMsg = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_LocalwarText")
local competitionBg = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "Static_CompetitionGameBg")
local competitionMsg = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_CompetitionGameMsg")
local competitionCount = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_CompetitonGameCount")
local stallionIcon = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "Static_iconStallion")
local bgBaseSizeX = bigNakMsg:GetSizeX()
local bgBaseSizeY = bigNakMsg:GetSizeY()
local increesePointSizeX = 500
local isServantStallion = false
local huntingRanker = {[1] = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_Hunting_1"), [2] = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_Hunting_2"), [3] = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_Hunting_3"), [4] = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_Hunting_4"), [5] = (UI.getChildControl)(Panel_RewardSelect_NakMessage, "StaticText_Hunting_5")}
bigNakMsg:SetShow(false)
localwarMsg:SetShow(false)
localwarMsgSmallBG:SetShow(false)
localwarMsgBG:SetShow(false)
_text_localwarMsg:SetShow(false)
competitionBg:SetShow(false)
competitionMsg:SetShow(false)
competitionCount:SetShow(false)
nakItemIconBG:SetShow(false)
nakItemIcon:SetShow(false)
stallionIcon:SetShow(false)
local messageType = {safetyArea = 0, combatArea = 1, challengeComplete = 2, normal = 3, selectReward = 4, territoryTradeEvent = 5, npcTradeEvent = 6, royalTrade = 7, supplyTrade = 8, fitnessLevelUp = 9, territoryWar_Start = 10, territoryWar_End = 11, territoryWar_Add = 12, territoryWar_Destroy = 13, territoryWar_Attack = 14, guildWar_Start = 15, guildWar_End = 16, roulette = 17, anotherPlayerGotItem = 18, itemMarket = 19, inSiegeArea = 20, outSiegeArea = 21, guildMsg = 22, lifeLevUp = 23, characterHPwarning = 24, servantWarning = 25, cookFail = 26, alchemyFail = 27, whaleShow = 28, whaleHide = 29, defeatBoss = 30, guildNotify = 31, changeSkill = 32, alchemyStoneGrowUp = 33, localWarJoin = 34, localWarExit = 35, raceFail = 36, raceFinish = 37, raceMoveStart = 38, raceReady = 39, raceStart = 40, raceWaiting = 41, worldBossShow = 42, raceAnother = 43, enchantFail = 44, localWarWin = 45, localWarLose = 46, localWarTurnAround = 47, localWarCriticalBlack = 48, localWarCriticalRed = 49, desertArea = 50, playerKiller = 51, huntingLandShow = 52, huntingLandHide = 53, goldenBell = 54, getValenciaItem = 55, competitionStart = 56, competitionStop = 57, guildServantRegist = 58, competitionRound = 59, eventBossTurking = 60, fieldBoss = 61, arshaSpearCountDown = 62, horseNineTier = 63, servantMarket = 64, workerMarket = 65, arshaNotify = 66, savageDefence = 67, itemAuctionStart = 68, itemAuctionEnd = 69, timeAttackSuccess = 70, timeAttackFail = 71, SavageDefenceWin = 72, SavageDefenceLose = 73, SavageDefenceStart = 74, militiaRecruitStart = 75, militiaReponseMsg = 76, savageDefenceBoss = 77, guildBattleNormal = 78, guildBattleStart = 79, guildBattleEnd = 80, bellBoss = 81, eventBossMamos = 82, eventBossIsabella = 83}
local messageTexture = {[messageType.normal] = "New_UI_Common_forLua/Widget/NakMessage/Alert_01.dds", [messageType.selectReward] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_RewardAlert_01.dds", [messageType.combatArea] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Combat_01.dds", [messageType.safetyArea] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Safety_01.dds", [messageType.challengeComplete] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_RewardAlert_01.dds", [messageType.territoryTradeEvent] = "New_UI_Common_forLua/Widget/NakMessage/Trade_GlobalEvent_01.dds", [messageType.npcTradeEvent] = "New_UI_Common_forLua/Widget/NakMessage/Trade_LocalEvent_01.dds", [messageType.royalTrade] = "New_UI_Common_forLua/Widget/NakMessage/TerritoryAuth_Message01.dds", [messageType.supplyTrade] = "New_UI_Common_forLua/Widget/NakMessage/TerritoryAuth_Message01.dds", [messageType.fitnessLevelUp] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Train.dds", [messageType.territoryWar_Start] = "New_UI_Common_forLua/Widget/NakMessage/TerritoryWar_Start.dds", [messageType.territoryWar_End] = "New_UI_Common_forLua/Widget/NakMessage/TerritoryWar_End.dds", [messageType.territoryWar_Add] = "New_UI_Common_forLua/Widget/NakMessage/TerritoryWar_addGuildTent.dds", [messageType.territoryWar_Destroy] = "New_UI_Common_forLua/Widget/NakMessage/TerritoryWar_destroyGuildTent.dds", [messageType.territoryWar_Attack] = "New_UI_Common_forLua/Widget/NakMessage/TerritoryWar_attackGuildTent.dds", [messageType.guildWar_Start] = "New_UI_Common_forLua/Widget/NakMessage/guildWar_start.dds", [messageType.guildWar_End] = "New_UI_Common_forLua/Widget/NakMessage/guildWar_End.dds", [messageType.roulette] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Roulette.dds", [messageType.anotherPlayerGotItem] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_anotherPlayerGotItem.dds", [messageType.itemMarket] = "New_UI_Common_forLua/Widget/NakMessage/Alert_01.dds", [messageType.inSiegeArea] = "New_UI_Common_forLua/Widget/NakMessage/TerritoryWar.dds", [messageType.outSiegeArea] = "New_UI_Common_forLua/Widget/NakMessage/Non_TerritoryWar.dds", [messageType.guildMsg] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Guild.dds", [messageType.lifeLevUp] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_RewardAlert_01.dds", [messageType.characterHPwarning] = "New_UI_Common_forLua/Widget/NakMessage/Character_HPwarning.dds", [messageType.servantWarning] = "New_UI_Common_forLua/Widget/NakMessage/Horse_Warning.dds", [messageType.cookFail] = "New_UI_Common_forLua/Widget/NakMessage/Fail_Cooking.dds", [messageType.alchemyFail] = "New_UI_Common_forLua/Widget/NakMessage/Fail_Alchemy.dds", [messageType.whaleShow] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Hunting.dds", [messageType.whaleHide] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Hunting_End.dds", [messageType.defeatBoss] = "New_UI_Common_forLua/Widget/NakMessage/boss.dds", [messageType.guildNotify] = "New_UI_Common_forLua/Widget/NakMessage/Guild_Call.dds", [messageType.changeSkill] = "New_UI_Common_forLua/Widget/NakMessage/Horse_skillchange.dds", [messageType.alchemyStoneGrowUp] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_anotherPlayerGotItem.dds", [messageType.localWarJoin] = "New_UI_Common_forLua/Widget/NakMessage/LocalWar_Intro.dds", [messageType.localWarExit] = "New_UI_Common_forLua/Widget/NakMessage/LocalWar_Exit.dds", [messageType.raceFail] = "New_UI_Common_forLua/Widget/NakMessage/RaceMatch_Fail.dds", [messageType.raceFinish] = "New_UI_Common_forLua/Widget/NakMessage/RaceMatch_Finish.dds", [messageType.raceMoveStart] = "New_UI_Common_forLua/Widget/NakMessage/RaceMatch_MoveStart.dds", [messageType.raceReady] = "New_UI_Common_forLua/Widget/NakMessage/RaceMatch_Ready.dds", [messageType.raceStart] = "New_UI_Common_forLua/Widget/NakMessage/RaceMatch_Start.dds", [messageType.raceWaiting] = "New_UI_Common_forLua/Widget/NakMessage/RaceMatch_Waitting.dds", [messageType.worldBossShow] = "New_UI_Common_forLua/Widget/NakMessage/WorldBoss_Show.dds", [messageType.raceAnother] = "New_UI_Common_forLua/Widget/NakMessage/RaceMatch_AnotherPoint.dds", [messageType.enchantFail] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_FailEnchant.dds", [messageType.localWarWin] = "New_UI_Common_forLua/Widget/LocalWar/LocalWar_Win.dds", [messageType.localWarLose] = "New_UI_Common_forLua/Widget/LocalWar/LocalWar_Lose.dds", [messageType.localWarTurnAround] = "New_UI_Common_forLua/Widget/NakMessage/Turnaround.dds", [messageType.localWarCriticalBlack] = "New_UI_Common_forLua/Widget/NakMessage/BlackdesertScore.dds", [messageType.localWarCriticalRed] = "New_UI_Common_forLua/Widget/NakMessage/ReddesertScore.dds", [messageType.desertArea] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Danger.dds", [messageType.playerKiller] = "New_UI_Common_forLua/Widget/NakMessage/Kill_Murderer.dds", [messageType.huntingLandShow] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_GroundHuntingSpawn.dds", [messageType.huntingLandHide] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_GroundHuntingKill.dds", [messageType.goldenBell] = "New_UI_Common_forLua/Widget/NakMessage/GoldenBell.dds", [messageType.getValenciaItem] = "New_UI_Common_forLua/Widget/NakMessage/CombineComplete.dds", [messageType.competitionStart] = "New_UI_Common_forLua/Widget/NakMessage/Competition_Start.dds", [messageType.competitionStop] = "New_UI_Common_forLua/Widget/NakMessage/Competition_Stop.dds", [messageType.guildServantRegist] = "New_UI_Common_forLua/Widget/NakMessage/Guild_Production_Complete.dds", [messageType.competitionRound] = "New_UI_Common_forLua/Widget/NakMessage/PvP_RoundMessage.dds", [messageType.eventBossTurking] = "New_UI_Common_forLua/Widget/NakMessage/Turking_Show.dds", [messageType.fieldBoss] = "New_UI_Common_forLua/Widget/NakMessage/WorldBoss2_Show.dds", [messageType.arshaSpearCountDown] = "New_UI_Common_forLua/Widget/NakMessage/pvp_countdown.dds", [messageType.horseNineTier] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Superiorhorse.dds", [messageType.servantMarket] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_HorseAuction.dds", [messageType.workerMarket] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_WorkerAuction.dds", [messageType.arshaNotify] = "New_UI_Common_forLua/Widget/NakMessage/PvP_Megaphone.dds", [messageType.savageDefence] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Crackofbarbarism.dds", [messageType.itemAuctionStart] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_MasterpieceAuction.dds", [messageType.timeAttackSuccess] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_TimeAttack_Success.dds", [messageType.timeAttackFail] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_TimeAttack_Fail.dds", [messageType.SavageDefenceWin] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_TimeAttack_Success.dds", [messageType.SavageDefenceLose] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_TimeAttack_Fail.dds", [messageType.SavageDefenceStart] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Crackofbarbarism.dds", [messageType.militiaRecruitStart] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_MilitiaStart.dds", [messageType.militiaReponseMsg] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_MilitiaEnd.dds", [messageType.savageDefenceBoss] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_CrackofbarbarismBoss.dds", [messageType.guildBattleNormal] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_GuildwarReservation.dds", [messageType.guildBattleStart] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_GuildwarStart.dds", [messageType.guildBattleEnd] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_GuildwarEnd.dds", [messageType.bellBoss] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Bell.dds", [messageType.eventBossMamos] = "New_UI_Common_forLua/Widget/NakMessage/BigBearMessage.dds", [messageType.eventBossIsabella] = "New_UI_Common_forLua/Widget/NakMessage/NakBG_Holloween_Isabella.dds"}
local _territoryName = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_TRADE_EVENTMSG_AREANAME_BALENOS"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_TRADE_EVENTMSG_AREANAME_SERENDIA"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_TRADE_EVENTMSG_AREANAME_CALPHEON"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_TRADE_EVENTMSG_AREANAME_MEDIA")}
local npcKey = {[40715] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY1"), [40026] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY2"), [40025] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY3"), [40024] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY4"), [40031] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY5"), [40101] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY6"), [40609] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY7"), [40028] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY8"), [40010] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY9"), [41090] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY10"), [41223] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY11"), [41221] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY12"), [41085] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY13"), [41032] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY14"), [41030] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY15"), [41045] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY16"), [41222] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY17"), [41225] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY18"), [41224] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY19"), [41051] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY20"), [42301] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY21"), [42205] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY22"), [43433] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY23"), [50411] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY24"), [50415] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY25"), [50403] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY26"), [43449] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY27"), [43440] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY28"), [43446] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY29"), [43448] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY30"), [43510] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY31"), [42026] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY32"), [43010] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY33"), [43210] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY34"), [50428] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY35"), [50432] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY36"), [50430] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY37"), [50433] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY38"), [50418] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY39"), [50440] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY40"), [50434] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY41"), [50437] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY42"), [50438] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY43"), [50443] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY44"), [43310] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY45"), [43402] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY46"), [50456] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY47"), [43501] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY48"), [50455] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY49"), [50451] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY50"), [50459] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY51"), [42103] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY52"), [50466] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY53"), [50461] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY54"), [43407] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY55"), [42013] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY56"), [42005] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY57"), [44613] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY58"), [50551] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY59"), [50493] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY60"), [50550] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY61"), [50548] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY62"), [50475] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY63"), [44010] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY64"), [44110] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY65"), [44210] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY66"), [44610] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NPCKEY67")}
local _commerceType = {[1] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_6"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_7"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_8"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCETYPE_9")}
local _tradeMsgType = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEMSGTYPE_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEMSGTYPE_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEMSGTYPE_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEMSGTYPE_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEMSGTYPE_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEMSGTYPE_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEMSGTYPE_6")}
local huntingRankingFont = {
size = {[0] = "BaseFont_18_Glow", [1] = "SubTitleFont_14_Glow", [2] = "BaseFont_12_Glow", [3] = "BaseFont_10_Glow", [4] = "BaseFont_10_Glow"}
, 
baseColor = {[0] = 4294958334, [1] = 4292673503, [2] = 4292408319, [3] = 4293848814, [4] = 4293848814}
, 
glowColor = {[0] = 4285794145, [1] = 4280382471, [2] = 4280235448, [3] = 4278190080, [4] = 4278190080}
}
_text_Msg:SetText("")
_text_MsgSub:SetText("")
local _msgType = nil
local passFlush = false
NoShowMessageReturn = function(msgType)
  -- function num : 0_0 , upvalues : messageType
  local showJudgment = false
  if messageType.challengeComplete == msgType or messageType.normal == msgType or messageType.selectReward == msgType or messageType.guildMsg == msgType or messageType.guildNotify == msgType or messageType.cookFail == msgType or messageType.alchemyFail == msgType or messageType.characterHPwarning == msgType or messageType.servantWarning == msgType or messageType.changeSkill == msgType or messageType.alchemyStoneGrowUp == msgType or messageType.localWarJoin == msgType or messageType.localWarExit == msgType or messageType.raceFail == msgType or messageType.raceFinish == msgType or messageType.raceMoveStart == msgType or messageType.raceReady == msgType or messageType.raceStart == msgType or messageType.raceWaiting == msgType or messageType.worldBossShow == msgType or messageType.raceAnother == msgType or messageType.localWarWin == msgType or messageType.localWarLose == msgType or messageType.localWarTurnAround == msgType or messageType.localWarCriticalBlack == msgType or messageType.localWarCriticalRed == msgType or messageType.playerKiller == msgType or messageType.whaleShow == msgType or messageType.huntingLandShow == msgType or messageType.whaleHide == msgType or messageType.huntingLandHide == msgType or messageType.goldenBell == msgType or messageType.getValenciaItem == msgType or messageType.competitionStart == msgType or messageType.competitionStop == msgType or messageType.guildServantRegist == msgType or messageType.competitionRound == msgType or messageType.eventBossTurking == msgType or messageType.fieldBoss == msgType or messageType.arshaNotify == msgType or messageType.savageDefence == msgType or messageType.itemAuctionStart == msgType or messageType.itemAuctionEnd == msgType or messageType.timeAttackSuccess == msgType or messageType.timeAttackFail == msgType or messageType.SavageDefenceWin == msgType or messageType.SavageDefenceLose == msgType or messageType.SavageDefenceStart == msgType or messageType.militiaRecruitStart == msgType or messageType.militiaReponseMsg == msgType or messageType.militiaReponseMsg == msgType or messageType.guildBattleNormal == msgType or messageType.guildBattleStart == msgType or messageType.guildBattleEnd == msgType or messageType.bellBoss == msgType or messageType.eventBossMamos == msgType or messageType.eventBossIsabella == msgType then
    showJudgment = false
  else
    if messageType.safetyArea == msgType or messageType.combatArea == msgType or messageType.desertArea == msgType then
      msgTypeNum = 0
    else
      if messageType.territoryTradeEvent == msgType or messageType.npcTradeEvent == msgType then
        msgTypeNum = 1
      else
        if messageType.royalTrade == msgType or messageType.supplyTrade == msgType then
          msgTypeNum = 2
        else
          if messageType.fitnessLevelUp == msgType then
            msgTypeNum = 3
          else
            if messageType.territoryWar_Start == msgType or messageType.territoryWar_End == msgType or messageType.territoryWar_Add == msgType or messageType.territoryWar_Destroy == msgType or messageType.territoryWar_Attack == msgType or messageType.inSiegeArea == msgType or messageType.outSiegeArea == msgType then
              msgTypeNum = 4
            else
              if messageType.guildWar_Start == msgType or messageType.guildWar_End == msgType then
                msgTypeNum = 5
              else
                if messageType.roulette == msgType or messageType.anotherPlayerGotItem == msgType or messageType.enchantFail == msgType or messageType.horseNineTier == msgType then
                  msgTypeNum = 6
                else
                  if messageType.itemMarket == msgType then
                    msgTypeNum = 7
                  else
                    if messageType.lifeLevUp == msgType then
                      msgTypeNum = 8
                    else
                      if messageType.servantMarket == msgType or messageType.workerMarket then
                        msgTypeNum = 11
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
    showJudgment = ToClient_GetMessageFilter(msgTypeNum)
  end
  return showJudgment
end

WhaleHuntingEvent = function(message, noticeMsgType, noticeValue)
  -- function num : 0_1 , upvalues : messageType, huntingRanker, huntingRankingFont
  local msgType = nil
  if (CppEnums.EChatNoticeType).HuntingStart == noticeMsgType then
    if noticeValue == 0 then
      msgType = messageType.whaleShow
      audioPostEvent_SystemUi(19, 3)
    else
      if noticeValue == 1 then
        msgType = messageType.huntingLandShow
        audioPostEvent_SystemUi(19, 2)
      end
    end
  else
    if (CppEnums.EChatNoticeType).HuntingEnd == noticeMsgType then
      if noticeValue == 0 then
        msgType = messageType.whaleHide
      else
        if noticeValue == 1 then
          msgType = messageType.huntingLandHide
        end
      end
      local temporaryWrapper = getTemporaryInformationWrapper()
      local killContributeCount = temporaryWrapper:getKillContributeCount()
      local huntingRankerName = {}
      for index = 0, killContributeCount - 1 do
        huntingRankerName[index] = temporaryWrapper:getKillContributeNameByIndex(index)
        if temporaryWrapper:getKillContributePartyByIndex(index) then
          huntingRankerName[index] = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HUNTING_RESULT_PARTY", "rankerName", huntingRankerName[index])
        end
        ;
        (huntingRanker[index + 1]):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HUNTING_RESULT_RANK", "rank", index + 1, "rankerName", huntingRankerName[index]))
        ;
        (huntingRanker[index + 1]):SetFontColor((huntingRankingFont.baseColor)[index])
        ;
        (huntingRanker[index + 1]):useGlowFont(true, (huntingRankingFont.size)[index], (huntingRankingFont.glowColor)[index])
      end
    end
  end
  do
    local msg = {main = message, sub = PAGetString(Defines.StringSheet_GAME, "LUA_HUNTING_RULE"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, msgType)
    FGlobal_WhaleConditionCheck()
  end
end

FGlobal_WorldBossShow = function(message, noticeType, noticeValue)
  -- function num : 0_2 , upvalues : messageType
  local msg = {main = message, sub = " ", addMsg = ""}
  local msgType = messageType.worldBossShow
  if noticeType == 11 then
    audioPostEvent_SystemUi(19, 0)
  else
    if noticeType == 12 then
      if noticeValue == 0 then
        audioPostEvent_SystemUi(19, 1)
      else
        if noticeValue == 1 then
          audioPostEvent_SystemUi(19, 4)
        else
          if noticeValue == 2 then
            audioPostEvent_SystemUi(19, 5)
          else
            if noticeValue == 3 or noticeValue == 4 or noticeValue == 5 or noticeValue == 6 then
              audioPostEvent_SystemUi(19, 6)
              msgType = messageType.fieldBoss
            else
              if noticeValue == 7 then
                audioPostEvent_SystemUi(19, 7)
                msgType = messageType.eventBossTurking
              else
                if noticeValue == 8 or noticeValue == 9 then
                  audioPostEvent_SystemUi(19, 8)
                else
                  if noticeValue == 10 then
                    audioPostEvent_SystemUi(19, 9)
                    msgType = messageType.bellBoss
                  else
                    if noticeValue == 11 then
                      audioPostEvent_SystemUi(19, 10)
                      msgType = messageType.eventBossMamos
                    else
                      if noticeType == 12 then
                        audioPostEvent_SystemUi(19, 11)
                        msgType = messageType.eventBossIsabella
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
      if noticeType == 16 then
        audioPostEvent_SystemUi(19, 7)
        msgType = messageType.savageDefenceBoss
      else
      end
    end
  end
  if noticeType == 13 then
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, msgType)
  end
end

Proc_ShowMessage_Ack_For_RewardSelect = function(message, showRate, msgType, exposure)
  -- function num : 0_3 , upvalues : messageType, huntingRanker, passFlush
  Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(message, showRate, msgType, exposure)
  if messageType.itemMarket == msgType then
    return 
  end
  for index = 1, 5 do
    (huntingRanker[index]):SetShow(false)
  end
  do
    -- DECOMPILER ERROR at PC86: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC86: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC86: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC86: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC86: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC86: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC86: Unhandled construct in 'MakeBoolean' P3

    if messageType.itemMarket == msgType or ((messageType.territoryWar_Start <= msgType and msgType <= messageType.guildWar_End) or messageType.guildBattleEnd == msgType) then
      chatting_sendMessage("", message.main .. " " .. message.sub, (CppEnums.ChatType).System)
    else
      if messageType.anotherPlayerGotItem == msgType then
        if message.sub == "" then
          chatting_sendMessage("", message.main, (CppEnums.ChatType).System)
        else
          chatting_sendMessage("", message.main .. "(" .. message.sub .. ")", (CppEnums.ChatType).System)
        end
      else
        if messageType.enchantFail == msgType then
          if message.sub == "" then
            chatting_sendMessage("", message.main, (CppEnums.ChatType).System)
          else
            chatting_sendMessage("", message.main .. "(" .. message.sub .. ")", (CppEnums.ChatType).System)
          end
        else
          if messageType.playerKiller == msgType then
            if message.sub == "" then
              chatting_sendMessage("", message.main, (CppEnums.ChatType).System)
            else
              chatting_sendMessage("", message.main .. "(" .. message.sub .. ")", (CppEnums.ChatType).System)
            end
          else
            if messageType.servantMarket == msgType then
              if message.sub == "" then
                chatting_sendMessage("", message.main, (CppEnums.ChatType).System)
              else
                chatting_sendMessage("", message.main .. "(" .. message.sub .. ")", (CppEnums.ChatType).System)
              end
            else
              if messageType.workerMarket == msgType then
                if message.sub == "" then
                  chatting_sendMessage("", message.main, (CppEnums.ChatType).System)
                else
                  chatting_sendMessage("", message.main .. "(" .. message.sub .. ")", (CppEnums.ChatType).System)
                end
              else
                if messageType.guildBattleNormal == msgType then
                  chatting_sendMessage("", message.main, (CppEnums.ChatType).guildBattleNormal)
                else
                  if message.sub == "" then
                    chatting_sendMessage("", message.main, (CppEnums.ChatType).System)
                  else
                    chatting_sendMessage("", message.sub, (CppEnums.ChatType).System)
                  end
                end
              end
            end
          end
        end
      end
    end
    if messageType.selectReward == msgType then
      passFlush = true
    else
      passFlush = false
    end
  end
end

Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect = function(message, showRate, msgType, exposure)
  -- function num : 0_4 , upvalues : animationEndTime, elapsedTime, curIndex, MessageData
  if (msgType >= 10 and msgType < 22) or msgType > 32 then
    return 
  end
  if Panel_Global_Manual:GetShow() or Panel_Fishing:GetShow() then
    return 
  end
  if NoShowMessageReturn(msgType) then
    return 
  end
  if ToClient_GetMyTeamNoLocalWar() > 0 and (exposure == nil or exposure == true) then
    return 
  end
  if ToClient_IsMyselfInArena() and (exposure == nil or exposure == true) then
    return 
  end
  if ToClient_getPlayNowSavageDefence() and (exposure == nil or exposure == true) then
    return 
  end
  if showRate == nil then
    animationEndTime = 2.3
    elapsedTime = 2.3
  else
    animationEndTime = showRate
    elapsedTime = showRate
  end
  curIndex = curIndex + 1
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (MessageData._Msg)[curIndex] = {}
  -- DECOMPILER ERROR at PC76: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((MessageData._Msg)[curIndex]).msg = message
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R4 in 'UnsetPending'

  ;
  ((MessageData._Msg)[curIndex]).type = msgType
  Panel_RewardSelect_NakMessage:SetShow(true, false)
  NakMessagePanel_Resize_For_RewardSelect()
end

Proc_ShowMessage_FrameEvent_For_RewardSelect = function(messageNum)
  -- function num : 0_5
  local msg = {main = PAGetString(Defines.StringSheet_GAME, frameEventMessageIds[messageNum]), sub = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 4, 4)
end

local tradeEvent, _npcKey = nil, nil
local isTradeEventOpen = ToClient_IsContentsGroupOpen("22")
FromClient_NotifyVariableTradeItemMsg = function(territoryKey, npcCharacterKey, eventIndex)
  -- function num : 0_6 , upvalues : isTradeEventOpen, _npcKey, npcKey, _commerceType, _tradeMsgType, tradeEvent
  if not isTradeEventOpen then
    return 
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  local varyTradeInfo = temporaryWrapper:getVaryTradeItemInfo(territoryKey, npcCharacterKey, eventIndex)
  if varyTradeInfo == nil then
    return 
  end
  _npcKey = npcCharacterKey
  if varyTradeInfo._territoryKey > -1 then
    isTerritoryEvent = true
  else
    if varyTradeInfo._characterKey > 0 then
      isTerritoryEvent = false
    end
  end
  local commerceMsg = ""
  local commerceMsgforChat = ""
  local message = ""
  local msgName = ""
  local msgContent = ""
  if isTerritoryEvent == true then
    return 
  else
    for ii = 1, enCommerceType.enCommerceType_Max - 1 do
      if commerceMsg == "" then
        if npcKey[varyTradeInfo._characterKey] == nil then
          return 
        end
        if varyTradeInfo:getPercentByCommerceType(ii) > 0 then
          commerceMsg = _commerceType[ii] .. " <PAColor0xFFFFCE22>�\178" .. varyTradeInfo:getPercentByCommerceType(ii) / 10000 .. "<PAOldColor>%"
          commerceMsgforChat = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCEMSGFORCHAT_3", "characterKey", npcKey[varyTradeInfo._characterKey], "commerceType", _commerceType[ii], "percent", varyTradeInfo:getPercentByCommerceType(ii) / 10000)
        else
          if varyTradeInfo:getPercentByCommerceType(ii) < 0 then
            if varyTradeInfo._characterKey == nil or varyTradeInfo:getPercentByCommerceType(ii) == nil then
              return 
            end
            commerceMsg = _commerceType[ii] .. " <PAColor0xFFF26A6A>�\188" .. varyTradeInfo:getPercentByCommerceType(ii) / 10000 .. "<PAOldColor>%"
            commerceMsgforChat = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_COMMERCEMSGFORCHAT_4", "characterKey", npcKey[varyTradeInfo._characterKey], "commerceType", _commerceType[ii], "percent", varyTradeInfo:getPercentByCommerceType(ii) / 10000)
          end
        end
      else
        if varyTradeInfo:getPercentByCommerceType(ii) > 0 then
          commerceMsg = commerceMsg .. " | " .. _commerceType[ii] .. " <PAColor0xFFFFCE22>�\178" .. varyTradeInfo:getPercentByCommerceType(ii) / 10000 .. "<PAOldColor>%"
          commerceMsgforChat = commerceMsgforChat .. ", " .. _commerceType[ii] .. " <PAColor0xFFFFCE22>" .. varyTradeInfo:getPercentByCommerceType(ii) / 10000 .. "<PAOldColor>%"
        else
          if varyTradeInfo:getPercentByCommerceType(ii) < 0 then
            commerceMsg = commerceMsg .. " | " .. _commerceType[ii] .. " <PAColor0xFFF26A6A>�\188" .. varyTradeInfo:getPercentByCommerceType(ii) / 10000 .. "<PAOldColor>%"
            commerceMsgforChat = commerceMsgforChat .. ", " .. _commerceType[ii] .. " <PAColor0xFFF26A6A>" .. varyTradeInfo:getPercentByCommerceType(ii) / 10000 .. "<PAOldColor>%"
          end
        end
      end
    end
    if varyTradeInfo._eventIndex == 1 then
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_MESSAGE", "characterKey", npcKey[varyTradeInfo._characterKey])
      msgName = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_MSGNAME")
    else
      local tradeMsgType = (math.random)(6)
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEINFO_EVENTMESSAGE", "tradeMsgType", _tradeMsgType[tradeMsgType], "eventIndex", _commerceType[varyTradeInfo._eventIndex - 1])
      if varyTradeInfo._eventIndex == 8 or varyTradeInfo._eventIndex == 10 then
        msgName = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEINFO_MSGNAME1", "tradeMsgType", _tradeMsgType[tradeMsgType], "eventIndex", _commerceType[varyTradeInfo._eventIndex - 1])
      else
        msgName = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_TRADEINFO_MSGNAME1", "tradeMsgType", _tradeMsgType[tradeMsgType], "eventIndex", _commerceType[varyTradeInfo._eventIndex - 1])
      end
    end
    do
      msgContent = commerceMsg
      local sandMsg = {main = message, sub = msgName, addMsg = msgContent}
      Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(sandMsg, 4, 6)
      chatting_sendMessage("", commerceMsgforChat, (CppEnums.ChatType).System)
      tradeEvent = npcKey[varyTradeInfo._characterKey] .. " : " .. message .. "\n" .. msgContent
    end
  end
end

FGlobal_TradeEventInfo = function()
  -- function num : 0_7 , upvalues : tradeEvent
  return tradeEvent
end

FGlobal_TradeEvent_Npckey_Return = function()
  -- function num : 0_8 , upvalues : _npcKey
  return _npcKey
end

FGlobal_FitnessLevelUp = function(addSp, addWeight, addHp, addMp, _type)
  -- function num : 0_9
  audioPostEvent_SystemUi(3, 15)
  local playerWrapper = getSelfPlayer()
  local classType = playerWrapper:getClassType()
  local set_subString = ""
  if addSp > 0 then
    set_subString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LEVELUP_REWARD_LvupStatus1", "AddSp", addSp, "GetMaxSp", (((getSelfPlayer()):get()):getStamina()):getMaxSp())
  end
  do
    if addWeight > 0 then
      local comma = ", "
      if set_subString == "" then
        comma = ""
      end
      set_subString = set_subString .. comma .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LEVELUP_REWARD_LvupStatus2", "AddWeight", addWeight / 10000, "UserWeight", Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64()) / 10000)
      FGlobal_UpdateInventorySlotData()
      FGlobal_MaxWeightChanged()
    end
    do
      if addHp > 0 then
        local comma = ", "
        if set_subString == "" then
          comma = ""
        end
        set_subString = set_subString .. comma .. PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUP_REWARD_MAXHPUP") .. "<PAColor0xFFFFBD2E>+" .. addHp .. "<PAOldColor>"
      end
      do
        if addMp > 0 then
          local comma = ", "
          if set_subString == "" then
            comma = ""
          end
          if classType == 0 then
            set_subString = set_subString .. comma .. PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUP_REWARD_MAXFPUP") .. "<PAColor0xFFFFBD2E>+" .. addMp .. "<PAOldColor>"
          else
            if classType == 4 then
              set_subString = set_subString .. comma .. PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUP_REWARD_MAXMPUP") .. "<PAColor0xFFFFBD2E>+" .. addMp .. "<PAOldColor>"
            else
              if classType == 8 then
                set_subString = set_subString .. comma .. PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUP_REWARD_MAXMPUP") .. "<PAColor0xFFFFBD2E>+" .. addMp .. "<PAOldColor>"
              else
                if classType == 12 then
                  set_subString = set_subString .. comma .. PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUP_REWARD_MAXFPUP") .. "<PAColor0xFFFFBD2E>+" .. addMp .. "<PAOldColor>"
                else
                  set_subString = set_subString .. comma .. PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUP_REWARD_MAXMPUP") .. "<PAColor0xFFFFBD2E>+" .. addMp .. "<PAOldColor>"
                end
              end
            end
          end
        end
        local mainTitle = ""
        if _type == 0 then
          mainTitle = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_DEX")
        else
          if _type == 1 then
            mainTitle = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_STR")
          else
            if _type == 2 then
              mainTitle = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_CON")
            end
          end
        end
        local message = {main = mainTitle, sub = set_subString, addMsg = ""}
        Proc_ShowMessage_Ack_For_RewardSelect(message, 3.5, 9)
      end
    end
  end
end

local MessageOpen = function()
  -- function num : 0_10 , upvalues : UI_ANI_ADV, UI_color, animationEndTime
  local axisX = Panel_RewardSelect_NakMessage:GetSizeX() / 2
  local axisY = Panel_RewardSelect_NakMessage:GetSizeY() / 2
  local aniInfo = Panel_RewardSelect_NakMessage:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo2 = Panel_RewardSelect_NakMessage:addScaleAnimation(0.15, animationEndTime - 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = axisX
  aniInfo2.AxisY = axisY
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
  local aniInfo3 = Panel_RewardSelect_NakMessage:addColorAnimation(animationEndTime - 0.15, animationEndTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
end

local Boss_MessageOpen = function()
  -- function num : 0_11 , upvalues : UI_ANI_ADV, UI_color, animationEndTime
  local axisX = Panel_RewardSelect_NakMessage:GetSizeX() / 2
  local axisY = Panel_RewardSelect_NakMessage:GetSizeY() / 2
  local aniInfo = Panel_RewardSelect_NakMessage:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo2 = Panel_RewardSelect_NakMessage:addScaleAnimation(0.15, animationEndTime - 1.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = axisX
  aniInfo2.AxisY = axisY
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
  local aniInfo3 = Panel_RewardSelect_NakMessage:addColorAnimation(animationEndTime - 1.25, animationEndTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
end

local tempMsg = nil
NakMessageUpdate_For_RewardSelect = function(updateTime)
  -- function num : 0_12 , upvalues : elapsedTime, animationEndTime, processIndex, curIndex, messageType, MessageData, Boss_MessageOpen, MessageOpen, _text_Msg, UI_color, _text_MsgSub, bigNakMsg, localwarMsg, localwarMsgSmallBG, localwarMsgBG, _text_localwarMsg, competitionBg, competitionMsg, competitionCount, stallionIcon, messageTexture, _text_AddMsg, nakItemIconBG, nakItemIcon, huntingRanker, isServantStallion, tempMsg, bgBaseSizeX, bgBaseSizeY, increesePointSizeX
  if isLuaLoadingComplete and Panel_Acquire:GetShow() then
    return 
  end
  if Panel_Tutorial:GetShow() then
    return 
  end
  if Panel_LifeTutorial:GetShow() then
    return 
  end
  if Panel_IngameCashShop:GetShow() or Panel_Cash_Customization:GetShow() or Panel_IngameCashShop_Controller:GetShow() or Panel_Dye_ReNew:GetShow() or Panel_DyeNew_CharacterController:GetShow() then
    return 
  end
  if (Defines.UIMode).eUIMode_InGameCustomize == GetUIMode() or (Defines.UIMode).eUIMode_ScreenShotMode == GetUIMode() then
    return 
  end
  elapsedTime = elapsedTime + updateTime
  if animationEndTime <= elapsedTime then
    if processIndex < curIndex then
      if messageType.defeatBoss == ((MessageData._Msg)[processIndex + 1]).type then
        Boss_MessageOpen()
      else
        MessageOpen()
      end
      processIndex = processIndex + 1
      NakMessagePanel_Resize_For_RewardSelect()
      _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
      _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
      _text_Msg:SetSpanSize(0, 15)
      _text_MsgSub:SetSpanSize(0, 38)
      bigNakMsg:EraseAllEffect()
      localwarMsg:EraseAllEffect()
      localwarMsgSmallBG:EraseAllEffect()
      localwarMsg:SetShow(false)
      localwarMsgSmallBG:SetShow(false)
      localwarMsgBG:SetShow(false)
      _text_localwarMsg:SetShow(false)
      competitionBg:SetShow(false)
      competitionMsg:SetShow(false)
      competitionCount:SetShow(false)
      stallionIcon:SetShow(false)
      if messageType.localWarWin == ((MessageData._Msg)[processIndex]).type or messageType.localWarLose == ((MessageData._Msg)[processIndex]).type then
        localwarMsg:SetShow(true)
        localwarMsgSmallBG:SetShow(false)
        localwarMsgBG:SetShow(true)
        bigNakMsg:SetShow(false)
        _text_Msg:SetShow(true)
        _text_MsgSub:SetShow(true)
        competitionBg:SetShow(false)
        competitionMsg:SetShow(false)
        competitionCount:SetShow(false)
        localwarMsg:ChangeTextureInfoName(messageTexture[((MessageData._Msg)[processIndex]).type])
      else
        if messageType.localWarTurnAround == ((MessageData._Msg)[processIndex]).type then
          bigNakMsg:SetShow(false)
          localwarMsg:SetShow(false)
          localwarMsgSmallBG:SetShow(true)
          _text_localwarMsg:SetShow(true)
          localwarMsgBG:SetShow(false)
          _text_Msg:SetShow(false)
          _text_MsgSub:SetShow(false)
          competitionBg:SetShow(false)
          competitionMsg:SetShow(false)
          competitionCount:SetShow(false)
          localwarMsgSmallBG:ChangeTextureInfoName(messageTexture[((MessageData._Msg)[processIndex]).type])
        else
          if messageType.localWarCriticalBlack == ((MessageData._Msg)[processIndex]).type or messageType.localWarCriticalRed == ((MessageData._Msg)[processIndex]).type then
            localwarMsg:SetShow(false)
            localwarMsgSmallBG:SetShow(true)
            localwarMsgBG:SetShow(false)
            _text_localwarMsg:SetShow(true)
            bigNakMsg:SetShow(false)
            _text_Msg:SetShow(true)
            _text_MsgSub:SetShow(true)
            competitionBg:SetShow(false)
            competitionMsg:SetShow(false)
            competitionCount:SetShow(false)
            localwarMsgSmallBG:ChangeTextureInfoName(messageTexture[((MessageData._Msg)[processIndex]).type])
          else
            if messageType.arshaSpearCountDown == ((MessageData._Msg)[processIndex]).type then
              localwarMsg:SetShow(false)
              localwarMsgSmallBG:SetShow(false)
              localwarMsgBG:SetShow(false)
              _text_localwarMsg:SetShow(false)
              bigNakMsg:SetShow(false)
              _text_Msg:SetShow(false)
              _text_MsgSub:SetShow(false)
              competitionBg:SetShow(true)
              competitionMsg:SetShow(true)
              competitionCount:SetShow(true)
            else
              bigNakMsg:SetShow(true)
              _text_Msg:SetShow(true)
              _text_MsgSub:SetShow(true)
              competitionBg:SetShow(false)
              competitionMsg:SetShow(false)
              competitionCount:SetShow(false)
              bigNakMsg:ChangeTextureInfoName(messageTexture[((MessageData._Msg)[processIndex]).type])
            end
          end
        end
      end
      _text_AddMsg:SetShow(false)
      nakItemIconBG:SetShow(false)
      nakItemIcon:SetShow(false)
      for index = 1, 5 do
        (huntingRanker[index]):SetShow(false)
      end
      if messageType.safetyArea == ((MessageData._Msg)[processIndex]).type then
        _text_Msg:SetFontColor(UI_color.C_ffdeff6d)
        _text_MsgSub:SetFontColor(UI_color.C_ffdeff6d)
      else
        if messageType.combatArea == ((MessageData._Msg)[processIndex]).type then
          _text_Msg:SetFontColor(UI_color.C_ffff8181)
          _text_MsgSub:SetFontColor(UI_color.C_ffff8181)
        else
          if messageType.desertArea == ((MessageData._Msg)[processIndex]).type then
            _text_Msg:SetFontColor(UI_color.C_ffff8181)
            _text_MsgSub:SetFontColor(UI_color.C_ffff8181)
          else
            if messageType.challengeComplete == ((MessageData._Msg)[processIndex]).type then
              _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
              _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
            else
              if messageType.normal == ((MessageData._Msg)[processIndex]).type then
                _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
              else
                if messageType.itemMarket == ((MessageData._Msg)[processIndex]).type then
                  _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                  _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                else
                  if messageType.servantMarket == ((MessageData._Msg)[processIndex]).type then
                    _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                    _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                    nakItemIconBG:SetShow(false)
                    nakItemIcon:SetShow(true)
                    stallionIcon:SetShow(isServantStallion)
                    nakItemIcon:ChangeTextureInfoName((((MessageData._Msg)[processIndex]).msg).addMsg)
                  else
                    if messageType.workerMarket == ((MessageData._Msg)[processIndex]).type then
                      _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                      _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                      nakItemIconBG:SetShow(false)
                      nakItemIcon:SetShow(true)
                      nakItemIcon:ChangeTextureInfoName((((MessageData._Msg)[processIndex]).msg).addMsg)
                    else
                      if messageType.territoryTradeEvent == ((MessageData._Msg)[processIndex]).type then
                        _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                        _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                        _text_AddMsg:SetFontColor(UI_color.C_FFFFEF82)
                        _text_AddMsg:SetShow(true)
                      else
                        if messageType.npcTradeEvent == ((MessageData._Msg)[processIndex]).type then
                          _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                          _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                          _text_AddMsg:SetFontColor(UI_color.C_FFFFEF82)
                          _text_AddMsg:SetShow(true)
                        else
                          if messageType.royalTrade == ((MessageData._Msg)[processIndex]).type then
                            _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                            _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                            bigNakMsg:AddEffect("UI_ImperialLight", false, 0, 15)
                            bigNakMsg:AddEffect("fUI_ImperialStart", false, 0, -10)
                          else
                            if messageType.supplyTrade == ((MessageData._Msg)[processIndex]).type then
                              _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                              _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                              bigNakMsg:AddEffect("UI_ImperialLight", false, 0, 15)
                              bigNakMsg:AddEffect("fUI_ImperialStart", false, 0, -10)
                            else
                              if messageType.territoryWar_Start == ((MessageData._Msg)[processIndex]).type then
                                bigNakMsg:AddEffect("UI_SiegeWarfare_Win_Green", false, -2, 0)
                                bigNakMsg:AddEffect("fui_skillawakenboom_green", false, -2, 0)
                                audioPostEvent_SystemUi(15, 0)
                              else
                                if messageType.territoryWar_End == ((MessageData._Msg)[processIndex]).type then
                                  bigNakMsg:AddEffect("UI_SiegeWarfare_Win", false, -2, 0)
                                  bigNakMsg:AddEffect("fUI_SkillAwakenBoom", false, -2, 0)
                                  audioPostEvent_SystemUi(15, 4)
                                else
                                  if messageType.territoryWar_Add == ((MessageData._Msg)[processIndex]).type then
                                    bigNakMsg:AddEffect("UI_CastlePlusLight", false, 0, 0)
                                    audioPostEvent_SystemUi(15, 1)
                                  else
                                    if messageType.territoryWar_Destroy == ((MessageData._Msg)[processIndex]).type then
                                      bigNakMsg:EraseAllEffect()
                                      bigNakMsg:AddEffect("UI_CastleMinusLight", false, 0, 0)
                                      audioPostEvent_SystemUi(15, 2)
                                    else
                                      if messageType.territoryWar_Attack == ((MessageData._Msg)[processIndex]).type then
                                        bigNakMsg:AddEffect("UI_SiegeWarfare_Alarm", true, 3, -22)
                                        audioPostEvent_SystemUi(15, 3)
                                      else
                                        if messageType.guildWar_Start == ((MessageData._Msg)[processIndex]).type then
                                          bigNakMsg:AddEffect("UI_SiegeWarfare_Win_Red", false, 3, 0)
                                          bigNakMsg:AddEffect("fui_skillawakenboom_red", false, 3, 0)
                                          audioPostEvent_SystemUi(15, 4)
                                        else
                                          if messageType.guildWar_End == ((MessageData._Msg)[processIndex]).type then
                                            bigNakMsg:AddEffect("UI_SiegeWarfare_Win_Red", false, 3, 0)
                                            bigNakMsg:AddEffect("fui_skillawakenboom_red", false, 3, 0)
                                            audioPostEvent_SystemUi(15, 4)
                                          else
                                            if messageType.roulette == ((MessageData._Msg)[processIndex]).type then
                                              audioPostEvent_SystemUi(11, 11)
                                              bigNakMsg:AddEffect("UI_Gacha_Message", false, 0.5, 0)
                                            else
                                              if messageType.anotherPlayerGotItem == ((MessageData._Msg)[processIndex]).type then
                                                _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                                                _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                                                nakItemIconBG:SetShow(false)
                                                nakItemIcon:SetShow(true)
                                                nakItemIcon:ChangeTextureInfoName((((MessageData._Msg)[processIndex]).msg).addMsg)
                                              else
                                                if messageType.horseNineTier == ((MessageData._Msg)[processIndex]).type then
                                                  _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                                                  _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                                                  nakItemIconBG:SetShow(false)
                                                  nakItemIcon:SetShow(true)
                                                  nakItemIcon:ChangeTextureInfoName((((MessageData._Msg)[processIndex]).msg).addMsg)
                                                else
                                                  if messageType.enchantFail == ((MessageData._Msg)[processIndex]).type then
                                                    _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                                                    _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                                                    nakItemIconBG:SetShow(false)
                                                    nakItemIcon:SetShow(true)
                                                    nakItemIcon:ChangeTextureInfoName((((MessageData._Msg)[processIndex]).msg).addMsg)
                                                  else
                                                    if messageType.alchemyStoneGrowUp == ((MessageData._Msg)[processIndex]).type then
                                                      _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                                                      _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                                                      nakItemIconBG:SetShow(false)
                                                      nakItemIcon:SetShow(true)
                                                      nakItemIcon:ChangeTextureInfoName((((MessageData._Msg)[processIndex]).msg).addMsg)
                                                    else
                                                      if messageType.characterHPwarning == ((MessageData._Msg)[processIndex]).type then
                                                        _text_Msg:SetFontColor(UI_color.C_ffff8181)
                                                        _text_MsgSub:SetFontColor(UI_color.C_ffff8181)
                                                        audioPostEvent_SystemUi(8, 15)
                                                      else
                                                        if messageType.servantWarning == ((MessageData._Msg)[processIndex]).type then
                                                          _text_Msg:SetFontColor(UI_color.C_ffff8181)
                                                          _text_MsgSub:SetFontColor(UI_color.C_ffff8181)
                                                          audioPostEvent_SystemUi(8, 14)
                                                        else
                                                          if messageType.defeatBoss == ((MessageData._Msg)[processIndex]).type then
                                                            _text_Msg:SetFontColor(UI_color.C_ffff8181)
                                                            _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                                                            bigNakMsg:AddEffect("UI_SiegeWarfare_Win_Red", false, 3, 0)
                                                            bigNakMsg:AddEffect("fui_skillawakenboom_red", false, 3, 0)
                                                            audioPostEvent_SystemUi(15, 4)
                                                          else
                                                            if messageType.whaleHide == ((MessageData._Msg)[processIndex]).type or messageType.huntingLandHide == ((MessageData._Msg)[processIndex]).type then
                                                              _text_Msg:SetFontColor(UI_color.C_ffff8181)
                                                              _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
                                                              local rankCount = (getTemporaryInformationWrapper()):getKillContributeCount()
                                                              for index = 1, rankCount do
                                                                (huntingRanker[index]):SetShow(true)
                                                              end
                                                              bigNakMsg:AddEffect("UI_SiegeWarfare_Win_Red", false, 3, 0)
                                                              bigNakMsg:AddEffect("fui_skillawakenboom_red", false, 3, 0)
                                                              audioPostEvent_SystemUi(15, 4)
                                                            else
                                                              do
                                                                if messageType.localWarJoin == ((MessageData._Msg)[processIndex]).type then
                                                                  bigNakMsg:EraseAllEffect()
                                                                  bigNakMsg:AddEffect("UI_LocalWar_Start01", false, 3, -1)
                                                                  audioPostEvent_SystemUi(15, 1)
                                                                else
                                                                  if messageType.localWarExit == ((MessageData._Msg)[processIndex]).type then
                                                                    bigNakMsg:EraseAllEffect()
                                                                    audioPostEvent_SystemUi(15, 2)
                                                                  else
                                                                    if messageType.raceFail == ((MessageData._Msg)[processIndex]).type then
                                                                      audioPostEvent_SystemUi(17, 3)
                                                                    else
                                                                      if messageType.raceStart == ((MessageData._Msg)[processIndex]).type then
                                                                        audioPostEvent_SystemUi(17, 0)
                                                                      else
                                                                        if messageType.localWarWin == ((MessageData._Msg)[processIndex]).type then
                                                                          localwarMsg:EraseAllEffect()
                                                                          localwarMsg:AddEffect("fUI_RedWar_Win01", false, 0, 195)
                                                                          _text_Msg:SetFontColor(UI_color.C_FF00FFFC)
                                                                          _text_MsgSub:SetFontColor(UI_color.C_FF00FFFC)
                                                                          _text_MsgSub:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_WIN"))
                                                                          audioPostEvent_SystemUi(18, 0)
                                                                        else
                                                                          if messageType.localWarLose == ((MessageData._Msg)[processIndex]).type then
                                                                            localwarMsg:EraseAllEffect()
                                                                            localwarMsg:AddEffect("fUI_RedWar_Lose01", false, 0, 195)
                                                                            _text_Msg:SetFontColor(UI_color.C_FFD70000)
                                                                            _text_MsgSub:SetFontColor(UI_color.C_FFD70000)
                                                                            _text_localwarMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_LOSE"))
                                                                            audioPostEvent_SystemUi(18, 1)
                                                                          else
                                                                            if messageType.localWarTurnAround == ((MessageData._Msg)[processIndex]).type then
                                                                              localwarMsgSmallBG:EraseAllEffect()
                                                                              localwarMsgSmallBG:AddEffect("fUI_RedWar_Turnaround01", false, 0, 6)
                                                                              _text_localwarMsg:SetFontColor(UI_color.C_FFD70000)
                                                                              _text_localwarMsg:SetText((((MessageData._Msg)[processIndex]).msg).main)
                                                                              audioPostEvent_SystemUi(18, 2)
                                                                            else
                                                                              if messageType.SavageDefenceWin == ((MessageData._Msg)[processIndex]).type then
                                                                                localwarMsg:EraseAllEffect()
                                                                                localwarMsg:AddEffect("fUI_RedWar_Win01", false, 0, 195)
                                                                                _text_Msg:SetFontColor(UI_color.C_FF00FFFC)
                                                                                _text_MsgSub:SetFontColor(UI_color.C_FF00FFFC)
                                                                                _text_MsgSub:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_WIN"))
                                                                                audioPostEvent_SystemUi(18, 0)
                                                                              else
                                                                                if messageType.SavageDefenceLose == ((MessageData._Msg)[processIndex]).type then
                                                                                  localwarMsg:EraseAllEffect()
                                                                                  localwarMsg:AddEffect("fUI_RedWar_Lose01", false, 0, 195)
                                                                                  _text_Msg:SetFontColor(UI_color.C_FFD70000)
                                                                                  _text_MsgSub:SetFontColor(UI_color.C_FFD70000)
                                                                                  _text_MsgSub:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_LOSE"))
                                                                                  audioPostEvent_SystemUi(18, 1)
                                                                                else
                                                                                  if messageType.SavageDefenceStart == ((MessageData._Msg)[processIndex]).type then
                                                                                    localwarMsg:EraseAllEffect()
                                                                                    localwarMsg:AddEffect("fUI_RedWar_Win01", false, 0, 195)
                                                                                    _text_Msg:SetFontColor(UI_color.C_FF00FFFC)
                                                                                    _text_MsgSub:SetFontColor(UI_color.C_FF00FFFC)
                                                                                    _text_MsgSub:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_UI_START"))
                                                                                  else
                                                                                    if messageType.localWarCriticalBlack == ((MessageData._Msg)[processIndex]).type then
                                                                                      localwarMsgSmallBG:EraseAllEffect()
                                                                                      localwarMsgSmallBG:AddEffect("fUI_RedWar_BlackScore01", false, 0, 0)
                                                                                      _text_localwarMsg:SetFontColor(UI_color.C_FFD29A04)
                                                                                      _text_Msg:SetFontColor(UI_color.C_FF74CB0E)
                                                                                      _text_MsgSub:SetFontColor(UI_color.C_FFD29A04)
                                                                                      _text_localwarMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_CRITICALATTACK"))
                                                                                    else
                                                                                      if messageType.localWarCriticalRed == ((MessageData._Msg)[processIndex]).type then
                                                                                        localwarMsgSmallBG:EraseAllEffect()
                                                                                        localwarMsgSmallBG:AddEffect("fUI_RedWar_RedScore01", false, 0, 0)
                                                                                        _text_localwarMsg:SetFontColor(UI_color.C_FFE50D0D)
                                                                                        _text_Msg:SetFontColor(UI_color.C_FFD29A04)
                                                                                        _text_MsgSub:SetFontColor(UI_color.C_FFE50D0D)
                                                                                        _text_localwarMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_CRITICALATTACK"))
                                                                                      else
                                                                                        if messageType.goldenBell == ((MessageData._Msg)[processIndex]).type then
                                                                                          audioPostEvent_SystemUi(20, 0)
                                                                                          bigNakMsg:AddEffect("fUI_GoldenBell_01A", false, 0, 0)
                                                                                        else
                                                                                          if messageType.getValenciaItem == ((MessageData._Msg)[processIndex]).type then
                                                                                            audioPostEvent_SystemUi(3, 20)
                                                                                            nakItemIconBG:SetShow(false)
                                                                                            nakItemIcon:SetShow(true)
                                                                                            nakItemIcon:ChangeTextureInfoName((((MessageData._Msg)[processIndex]).msg).addMsg)
                                                                                          else
                                                                                            if messageType.arshaSpearCountDown == ((MessageData._Msg)[processIndex]).type then
                                                                                              competitionMsg:SetText((((MessageData._Msg)[processIndex]).msg).main)
                                                                                              competitionCount:SetText((((MessageData._Msg)[processIndex]).msg).sub)
                                                                                            else
                                                                                              _text_Msg:SetFontColor(UI_color.C_FFFFEF82)
                                                                                              _text_MsgSub:SetFontColor(UI_color.C_FFFFEF82)
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
                                                                tempMsg = ((MessageData._Msg)[processIndex]).msg
                                                                _text_Msg:SetText((((MessageData._Msg)[processIndex]).msg).main)
                                                                _text_MsgSub:SetText((((MessageData._Msg)[processIndex]).msg).sub)
                                                                if messageType.characterHPwarning == ((MessageData._Msg)[processIndex]).type then
                                                                  _text_Msg:SetSpanSize((_text_Msg:GetSpanSize()).x, 15)
                                                                  _text_MsgSub:SetSpanSize((_text_MsgSub:GetSpanSize()).x, 42)
                                                                else
                                                                  if messageType.localWarWin == ((MessageData._Msg)[processIndex]).type or messageType.localWarLose == ((MessageData._Msg)[processIndex]).type then
                                                                    _text_Msg:SetSpanSize(0, -375)
                                                                    _text_MsgSub:SetSpanSize(0, -350)
                                                                  else
                                                                    if messageType.localWarTurnAround == ((MessageData._Msg)[processIndex]).type then
                                                                      _text_Msg:SetSpanSize(0, 0)
                                                                      _text_MsgSub:SetSpanSize(0, 25)
                                                                      _text_localwarMsg:SetSpanSize(0, 80)
                                                                    else
                                                                      if messageType.localWarCriticalBlack == ((MessageData._Msg)[processIndex]).type or messageType.localWarCriticalRed == ((MessageData._Msg)[processIndex]).type then
                                                                        _text_Msg:SetSpanSize(0, -15)
                                                                        _text_MsgSub:SetSpanSize(0, -45)
                                                                        _text_localwarMsg:SetSpanSize(0, 70)
                                                                      else
                                                                        if (((MessageData._Msg)[processIndex]).msg).sub == "" then
                                                                          _text_Msg:SetSpanSize((_text_Msg:GetSpanSize()).x, 25)
                                                                          _text_MsgSub:SetSpanSize((_text_MsgSub:GetSpanSize()).x, 38)
                                                                        else
                                                                          _text_Msg:SetSpanSize((_text_Msg:GetSpanSize()).x, 15)
                                                                          _text_MsgSub:SetSpanSize((_text_MsgSub:GetSpanSize()).x, 38)
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                                _text_Msg:ComputePos()
                                                                _text_MsgSub:ComputePos()
                                                                bigNakMsg:SetSize(bgBaseSizeX, bgBaseSizeY)
                                                                do
                                                                  if messageType.itemMarket == ((MessageData._Msg)[processIndex]).type then
                                                                    local mainTextSizeX = _text_Msg:GetTextSizeX()
                                                                    if increesePointSizeX < mainTextSizeX then
                                                                      bigNakMsg:SetSize(bgBaseSizeX + mainTextSizeX - increesePointSizeX, bgBaseSizeY)
                                                                    end
                                                                  end
                                                                  bigNakMsg:ComputePos()
                                                                  bigNakMsg:SetPosY(0)
                                                                  if messageType.territoryTradeEvent == ((MessageData._Msg)[processIndex]).type or messageType.npcTradeEvent == ((MessageData._Msg)[processIndex]).type then
                                                                    _text_AddMsg:SetText((((MessageData._Msg)[processIndex]).msg).addMsg)
                                                                  end
                                                                  -- DECOMPILER ERROR at PC2012: Confused about usage of register: R1 in 'UnsetPending'

                                                                  ;
                                                                  ((MessageData._Msg)[processIndex]).msg = nil
                                                                  -- DECOMPILER ERROR at PC2017: Confused about usage of register: R1 in 'UnsetPending'

                                                                  ;
                                                                  ((MessageData._Msg)[processIndex]).type = nil
                                                                  elapsedTime = 0
                                                                  Panel_RewardSelect_NakMessage:SetShow(false, false)
                                                                  _text_AddMsg:SetShow(false)
                                                                  nakItemIconBG:SetShow(false)
                                                                  nakItemIcon:SetShow(false)
                                                                  curIndex = 0
                                                                  processIndex = 0
                                                                  NakMessagePanel_Resize_For_RewardSelect()
                                                                  if processIndex < curIndex and tempMsg == ((MessageData._Msg)[processIndex + 1]).msg then
                                                                    processIndex = processIndex + 1
                                                                    -- DECOMPILER ERROR at PC2065: Confused about usage of register: R1 in 'UnsetPending'

                                                                    ;
                                                                    ((MessageData._Msg)[processIndex]).msg = nil
                                                                    -- DECOMPILER ERROR at PC2070: Confused about usage of register: R1 in 'UnsetPending'

                                                                    ;
                                                                    ((MessageData._Msg)[processIndex]).type = nil
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

NakMessagePanel_Resize_For_RewardSelect = function()
  -- function num : 0_13 , upvalues : localwarMsg, localwarMsgBG, _text_localwarMsg
  if Panel_LocalWar:GetShow() then
    Panel_RewardSelect_NakMessage:SetPosY(50)
  else
    if Panel_Arsha_TeamWidget:GetShow() then
      Panel_RewardSelect_NakMessage:SetPosY(Panel_Arsha_TeamWidget:GetPosY() + Panel_Arsha_TeamWidget:GetSizeY() - 30)
    else
      Panel_RewardSelect_NakMessage:SetPosY(30)
    end
  end
  Panel_RewardSelect_NakMessage:SetPosX((getScreenSizeX() - Panel_RewardSelect_NakMessage:GetSizeX()) * 0.5)
  localwarMsg:ComputePos()
  localwarMsgBG:ComputePos()
  _text_localwarMsg:ComputePos()
end

FGlobal_NakMessagePanel_CheckLeftMessageCount = function()
  -- function num : 0_14 , upvalues : curIndex
  return curIndex
end

check_LeftNakMessage = function()
  -- function num : 0_15 , upvalues : processIndex, curIndex
  if processIndex < curIndex then
    Panel_RewardSelect_NakMessage:SetShow(true, false)
    NakMessagePanel_Resize_For_RewardSelect()
  end
end

renderModeChange_check_LeftNakMessage = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_16
  local currentRenderMode = {(Defines.RenderMode).eRenderMode_Default, (Defines.RenderMode).eRenderMode_Dialog, (Defines.RenderMode).eRenderMode_WorldMap}
  if CheckRenderMode(prevRenderModeList, currentRenderMode) or CheckRenderModebyGameMode(nextRenderModeList) then
    check_LeftNakMessage()
  end
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_check_LeftNakMessage")
FromClient_notifyGetItem = function(notifyType, playerName, fromName, iconPath, param1, itemStaticWrapper, isPickedFromShip)
  -- function num : 0_17 , upvalues : huntingRanker, messageType
  local message = ""
  local subMessage = ""
  local itemIcon = nil
  local itemName = ""
  local itemClassify, itemKey = nil, nil
  if itemStaticWrapper ~= nil and itemStaticWrapper:isSet() then
    itemName = itemStaticWrapper:getName()
    itemClassify = itemStaticWrapper:getItemClassify()
    enchantLevel = ((itemStaticWrapper:get())._key):getEnchantLevel()
    itemKey = ((itemStaticWrapper:get())._key):getItemKey()
  end
  for index = 1, 5 do
    (huntingRanker[index]):SetShow(false)
  end
  if notifyType == 0 then
    if isPickedFromShip then
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_GUILDSHIPLOOTING_MSG", "playerName", playerName, "itemName", itemName)
    else
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_COMMON_MSG", "playerName", playerName, "itemName", itemName)
    end
    subMessage = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_GETITEM_SUBMSG", "fromName", fromName)
    itemIcon = "Icon/" .. itemStaticWrapper:getIconPath()
  else
    if notifyType == 1 then
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_COMMON_MSG", "playerName", playerName, "itemName", itemName)
      subMessage = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_OPENBOX_SUBMSG", "fromName", fromName)
      itemIcon = "Icon/" .. itemStaticWrapper:getIconPath()
    else
      if notifyType == 2 then
        if Int64toInt32(param1) ~= nil and Int64toInt32(param1) ~= 0 then
          if Int64toInt32(param1) >= 16 then
            itemName = HighEnchantLevel_ReplaceString(Int64toInt32(param1)) .. " " .. itemName
          else
            if itemClassify == 4 then
              itemName = HighEnchantLevel_ReplaceString(Int64toInt32(param1) + 15) .. " " .. itemName
            else
              itemName = "+" .. Int64toInt32(param1) .. " " .. itemName
            end
          end
        end
        message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_COMMON_MSG", "playerName", playerName, "itemName", itemName)
        subMessage = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_SUCCESSENCHANT_SUBMSG")
        itemIcon = "Icon/" .. itemStaticWrapper:getIconPath()
      else
        if notifyType == 3 then
          message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_GOODHORSE_MSG", "playerName", playerName)
          subMessage = ""
          itemIcon = iconPath
        else
          if notifyType == 4 then
            if itemClassify == 11 then
              return 
            end
            if itemClassify == 4 then
              itemName = HighEnchantLevel_ReplaceString(Int64toInt32(enchantLevel + 1) + 15) .. " " .. itemName
            else
              itemName = HighEnchantLevel_ReplaceString(Int64toInt32(enchantLevel + 1)) .. " " .. itemName
            end
            message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_ENCHANTFAIL_MSG", "playerName", playerName, "itemName", itemName)
            subMessage = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_ENCHANTENCHANT_SUBMSG")
            itemIcon = "Icon/" .. itemStaticWrapper:getIconPath()
          else
            if notifyType == 5 then
              if itemKey == 16016 or itemKey == 16019 then
                message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_LUXURYFIND_MAIN", "playerName", playerName, "itemName", itemName)
                subMessage = PAGetString(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_LUXURYFIND_SUB")
                itemIcon = "Icon/" .. itemStaticWrapper:getIconPath()
              else
                message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_COMMON_MSG", "playerName", playerName, "itemName", itemName)
                subMessage = PAGetString(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_ITEMCOMBINATION")
                itemIcon = "Icon/" .. itemStaticWrapper:getIconPath()
              end
            else
              if notifyType == 6 then
                message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_HORSE9Tier_MSG", "playerName", playerName, "servantName", fromName)
                subMessage = ""
                itemIcon = iconPath
              end
            end
          end
        end
      end
    end
  end
  local msg = {main = message, sub = subMessage, addMsg = itemIcon}
  if notifyType == 4 then
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, messageType.enchantFail)
  else
    if notifyType == 5 then
      if itemKey == 16016 or itemKey == 16019 then
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, messageType.getValenciaItem)
      else
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, messageType.anotherPlayerGotItem)
      end
    else
      if notifyType == 6 then
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, messageType.horseNineTier)
      else
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, messageType.anotherPlayerGotItem)
      end
    end
  end
end

Panel_RewardSelect_NakMessage:RegisterUpdateFunc("NakMessageUpdate_For_RewardSelect")
FromClient_notifyBroadcastLifeLevelUp = function(_notifyType, userNickName, characterName, _param1, _param2)
  -- function num : 0_18 , upvalues : messageType
  local lifeType_s32 = Int64toInt32(_param2)
  local lifeLevel_s32 = Int64toInt32(_param1)
  local lifeType = FGlobal_CraftType_ReplaceName(lifeType_s32)
  local lifeLev = FGlobal_CraftLevel_Replace(lifeLevel_s32, lifeType_s32)
  local message = userNickName .. "(" .. characterName .. ")"
  local subMessage = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_NOTIFY_LIFELEVEL_SUBMSG", "lifeType", lifeType, "lifeLev", lifeLev)
  local itemIcon = ""
  local msg = {main = message, sub = subMessage, addMsg = itemIcon}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 3, messageType.lifeLevUp)
end

FromClient_EventDieInstanceMonster = function(bossName)
  -- function num : 0_19 , upvalues : messageType
  local msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_HUNTTINGBOSS_TITLE", "bossName", bossName), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_HUNTTINGBOSS_SUBTITLE", "territoryName", selfPlayerCurrentTerritory()), addMsg = ""}
  Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, messageType.defeatBoss)
end

FromClient_NoticeChatMessageUpdate = function(_noticeSender, _noticeContent)
  -- function num : 0_20 , upvalues : messageType
  local msg = {main = _noticeContent, sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_GUILDNOTIFY_SENDER", "guildMasterName", _noticeSender), addMsg = ""}
  Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 3.5, messageType.guildNotify)
end

FromClient_NoticeChatMessageUpdate_Arsha = function(_noticeSender, _noticeContent)
  -- function num : 0_21 , upvalues : messageType
  local msg = {main = _noticeContent, sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_ARSHANOTIFY_SENDER", "hostName", _noticeSender), addMsg = ""}
  Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 3.5, messageType.arshaNotify, false)
end

FromClient_ArrestAToB = function(attacker, attackee)
  -- function num : 0_22 , upvalues : messageType
  local msg = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_DESERTCHAOKILL_MSG_MAIN", "attacker", attacker, "attackee", attackee), sub = PAGetString(Defines.StringSheet_GAME, "LUA_REWARDSELECT_NAKMESSAGE_DESERTCHAOKILL_MSG_SUB"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, messageType.playerKiller)
end

FromClient_RegistGuildServant = function(vehicleType, guildName)
  -- function num : 0_23 , upvalues : UI_VT
  local msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_REGISTGUILDSERVANT_DEFAULT_MAIN", "guildName", guildName), sub = PAGetString(Defines.StringSheet_GAME, "LUA_REGISTGUILDSERVANT_DEFAULT_COMMON"), addMsg = ""}
  if UI_VT.Type_Elephant == vehicleType then
    msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_REGISTGUILDSERVANT_ELEPHANT_MAIN", "guildName", guildName), sub = PAGetString(Defines.StringSheet_GAME, "LUA_REGISTGUILDSERVANT_DEFAULT_COMMON"), addMsg = ""}
  else
    if UI_VT.Type_SailingBoat == vehicleType then
      msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_REGISTGUILDSERVANT_SAILINGBOAT_MAIN", "guildName", guildName), sub = PAGetString(Defines.StringSheet_GAME, "LUA_REGISTGUILDSERVANT_DEFAULT_COMMON"), addMsg = ""}
    else
      msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_REGISTGUILDSERVANT_DEFAULT_MAIN", "guildName", guildName), sub = PAGetString(Defines.StringSheet_GAME, "LUA_REGISTGUILDSERVANT_DEFAULT_COMMON"), addMsg = ""}
    end
  end
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 58)
end

FromClient_notifyRegisterServantAtAuction = function(characterkey, servantStateType, servantTier, isStallion, price, iconPath)
  -- function num : 0_24 , upvalues : isServantStallion, stallionIcon, messageType
  if servantTier == 9 then
    servantTier = PAGetString(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_SERVANTMARKET_9TIER")
    isServantStallion = false
  else
    servantTier = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_SERVANTMARKET_TIER", "servantTier", servantTier)
    stallionIcon:SetMonoTone(not isStallion)
    isServantStallion = true
  end
  message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_SERVANTMARKET_REGISTER_PRICE_MSG", "servantTier", servantTier, "price", tostring(makeDotMoney(price)))
  subMessage = PAGetString(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_SERVANTMARKET_REGISTER_MSG")
  itemIcon = iconPath
  local msg = {main = message, sub = subMessage, addMsg = itemIcon}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, messageType.servantMarket)
end

FromClient_notifyRegisterWorkerAtAuction = function(workerKey, gradeType, price, iconPath, workerName, regionKeyRaw)
  -- function num : 0_25 , upvalues : messageType
  local regionInfo = getRegionInfoByRegionKey(RegionKey(regionKeyRaw))
  local regionName = regionInfo:getAreaName()
  if regionName == nil then
    return 
  end
  message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_WORKERMARKET_REGISTER_PRICE_MSG", "workerName", workerName, "price", tostring(makeDotMoney(price)))
  subMessage = tostring(regionName) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_WORKERMARKET_REGISTER_MSG")
  itemIcon = iconPath
  local msg = {main = message, sub = subMessage, addMsg = itemIcon}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, messageType.workerMarket)
end

registerEvent("FromClient_NotifyVariableTradeItemMsg", "FromClient_NotifyVariableTradeItemMsg")
registerEvent("FromClient_notifyBroadcastLifeLevelUp", "FromClient_notifyBroadcastLifeLevelUp")
registerEvent("FromClient_notifyGetItem", "FromClient_notifyGetItem")
registerEvent("EventDieInstanceMonster", "FromClient_EventDieInstanceMonster")
registerEvent("FromClient_NoticeChatMessageUpdate", "FromClient_NoticeChatMessageUpdate")
registerEvent("FromClient_NoticeChatMessageUpdate_Arsha", "FromClient_NoticeChatMessageUpdate_Arsha")
registerEvent("FromClient_ArrestAToB", "FromClient_ArrestAToB")
registerEvent("FromClient_RegistGuildServant", "FromClient_RegistGuildServant")
registerEvent("FromClient_notifyRegisterServantAtAuction", "FromClient_notifyRegisterServantAtAuction")
registerEvent("FromClient_notifyRegisterWorkerAtAuction", "FromClient_notifyRegisterWorkerAtAuction")
registerEvent("onScreenResize", "NakMessagePanel_Resize_For_RewardSelect")

