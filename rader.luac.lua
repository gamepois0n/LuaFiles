-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\rader\rader.luac 

-- params : ...
-- function num : 0
Panel_Radar:SetShow(true, false)
Panel_Radar:SetIgnore(true)
Panel_Radar:setGlassBackground(true)
Panel_TimeBar:SetShow(true, false)
Panel_TimeBar:RegisterShowEventFunc(true, " ")
Panel_TimeBar:RegisterShowEventFunc(false, " ")
Panel_TimeBarNumber:SetIgnore(true)
Panel_Radar:RegisterShowEventFunc(true, "RaderShowAni()")
Panel_Radar:RegisterShowEventFunc(false, "RaderHideAni()")
ToClient_setRadorUIPanel(Panel_Radar)
ToClient_setRadorUIViewDistanceRate(7225)
ToCleint_InitializeRadarActorPool(1000)
local radorType = {radorType_none = 0, radorType_hide = 1, radorType_allymonster = 2, radorType_normalMonster = 3, radorType_namedMonster = 4, radorType_bossMonster = 5, radorType_normalMonsterQuestTarget = 6, radorType_namedMonsterQuestTarget = 7, radorType_bossMonsterQuestTarget = 8, radorType_lordManager = 9, radorType_skillTrainner = 10, radorType_tradeMerchantNpc = 11, radorType_nodeManager = 12, radorType_normalNpc = 13, radorType_warehouseNpc = 14, radorType_potionNpc = 15, radorType_weaponNpc = 16, radorType_horseNpc = 17, radorType_workerNpc = 18, radorType_jewelNpc = 19, radorType_furnitureNpc = 20, radorType_collectNpc = 21, radorType_shipNpc = 22, radorType_alchemyNpc = 23, radorType_fishNpc = 24, radorType_guild = 25, radorType_guildShop = 26, radorType_itemTrader = 27, radorType_TerritorySupply = 28, radorType_TerritoryTrade = 29, radorType_Cook = 30, radorType_Wharf = 31, radorType_itemRepairer = 32, radorType_shopMerchantNpc = 33, radorType_ImportantNpc = 34, radorType_QuestAcceptable = 35, radorType_QuestProgress = 36, radorType_QuestComplete = 37, radorType_unknownNpc = 38, radorType_partyMember = 39, radorType_guildMember = 40, radorType_normalPlayer = 41, radorType_isHorse = 42, radorType_isDonkey = 43, radorType_isCamel = 44, radorType_isElephant = 45, radorType_isBabyElePhant = 46, radorType_isShip = 47, radorType_isCarriage = 48, radorType_installation = 49, radorType_kingGuildTent = 50, radorType_lordGuildTent = 51, radorType_villageGuildTent = 52, radorType_selfDeadBody = 53, radorType_advancedBase = 54, radorType_Raft = 55, radorType_Boat = 56, radorType_FishingBoat = 57, radorType_PersonalTradeShip = 58, radorType_GalleyShip = 59, radorType_PersonalBattleShip = 60, radorType_huntingMonster = 61, radorType_huntingMonsterQuestTarget = 62, radorType_Count = 63}
local template = {[radorType.radorType_none] = nil, [radorType.radorType_hide] = (UI.getChildControl)(Panel_Radar, "icon_hide"), [radorType.radorType_allymonster] = (UI.getChildControl)(Panel_Radar, "icon_horse"), [radorType.radorType_normalMonster] = (UI.getChildControl)(Panel_Radar, "icon_monsterGeneral_normal"), [radorType.radorType_namedMonster] = (UI.getChildControl)(Panel_Radar, "icon_monsterNamed_normal"), [radorType.radorType_bossMonster] = (UI.getChildControl)(Panel_Radar, "icon_monsterBoss_normal"), [radorType.radorType_normalMonsterQuestTarget] = (UI.getChildControl)(Panel_Radar, "icon_monsterGeneral_quest"), [radorType.radorType_namedMonsterQuestTarget] = (UI.getChildControl)(Panel_Radar, "icon_monsterNamed_quest"), [radorType.radorType_bossMonsterQuestTarget] = (UI.getChildControl)(Panel_Radar, "icon_monsterBoss_quest"), [radorType.radorType_lordManager] = (UI.getChildControl)(Panel_Radar, "icon_npc_lordManager"), [radorType.radorType_skillTrainner] = (UI.getChildControl)(Panel_Radar, "icon_npc_skillTrainner"), [radorType.radorType_tradeMerchantNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_trader"), [radorType.radorType_nodeManager] = (UI.getChildControl)(Panel_Radar, "icon_npc_nodeManager"), [radorType.radorType_normalNpc] = nil, [radorType.radorType_warehouseNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_warehouse"), [radorType.radorType_potionNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_potion"), [radorType.radorType_weaponNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_storeArmor"), [radorType.radorType_horseNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_horse"), [radorType.radorType_workerNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_worker"), [radorType.radorType_jewelNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_jewel"), [radorType.radorType_furnitureNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_furniture"), [radorType.radorType_collectNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_collect"), [radorType.radorType_shipNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_ship"), [radorType.radorType_alchemyNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_alchemy"), [radorType.radorType_fishNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_fish"), [radorType.radorType_guild] = (UI.getChildControl)(Panel_Radar, "icon_npc_guild"), [radorType.radorType_guildShop] = (UI.getChildControl)(Panel_Radar, "icon_npc_guildShop"), [radorType.radorType_itemTrader] = (UI.getChildControl)(Panel_Radar, "icon_npc_itemTrader"), [radorType.radorType_TerritorySupply] = (UI.getChildControl)(Panel_Radar, "icon_npc_territorySupply"), [radorType.radorType_TerritoryTrade] = (UI.getChildControl)(Panel_Radar, "icon_npc_territoryTrade"), [radorType.radorType_Cook] = (UI.getChildControl)(Panel_Radar, "icon_npc_cook"), [radorType.radorType_Wharf] = (UI.getChildControl)(Panel_Radar, "icon_npc_wharf"), [radorType.radorType_itemRepairer] = (UI.getChildControl)(Panel_Radar, "icon_npc_repairer"), [radorType.radorType_shopMerchantNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_shop"), [radorType.radorType_ImportantNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_important"), [radorType.radorType_QuestAcceptable] = (UI.getChildControl)(Panel_Radar, "icon_quest_accept"), [radorType.radorType_QuestProgress] = (UI.getChildControl)(Panel_Radar, "icon_quest_doing"), [radorType.radorType_QuestComplete] = (UI.getChildControl)(Panel_Radar, "icon_quest_clear"), [radorType.radorType_unknownNpc] = (UI.getChildControl)(Panel_Radar, "icon_npc_unknown"), [radorType.radorType_partyMember] = (UI.getChildControl)(Panel_Radar, "icon_partyMember"), [radorType.radorType_guildMember] = (UI.getChildControl)(Panel_Radar, "icon_guildMember"), [radorType.radorType_normalPlayer] = (UI.getChildControl)(Panel_Radar, "icon_player"), [radorType.radorType_isHorse] = (UI.getChildControl)(Panel_Radar, "icon_horse"), [radorType.radorType_isDonkey] = (UI.getChildControl)(Panel_Radar, "icon_donkey"), [radorType.radorType_isShip] = (UI.getChildControl)(Panel_Radar, "icon_ship"), [radorType.radorType_isCarriage] = (UI.getChildControl)(Panel_Radar, "icon_carriage"), [radorType.radorType_isCamel] = (UI.getChildControl)(Panel_Radar, "icon_camel"), [radorType.radorType_isElephant] = nil, [radorType.radorType_isBabyElePhant] = (UI.getChildControl)(Panel_Radar, "icon_babyElephant"), [radorType.radorType_installation] = (UI.getChildControl)(Panel_Radar, "icon_tent"), [radorType.radorType_kingGuildTent] = (UI.getChildControl)(Panel_Radar, "icon_tent"), [radorType.radorType_lordGuildTent] = (UI.getChildControl)(Panel_Radar, "icon_tent"), [radorType.radorType_villageGuildTent] = (UI.getChildControl)(Panel_Radar, "icon_tent"), [radorType.radorType_selfDeadBody] = (UI.getChildControl)(Panel_Radar, "icon_deadbody"), [radorType.radorType_advancedBase] = (UI.getChildControl)(Panel_Radar, "icon_Outpost"), [radorType.radorType_Raft] = (UI.getChildControl)(Panel_Radar, "icon_Raft"), [radorType.radorType_Boat] = (UI.getChildControl)(Panel_Radar, "icon_Boat"), [radorType.radorType_FishingBoat] = (UI.getChildControl)(Panel_Radar, "icon_FishingBoat"), [radorType.radorType_PersonalTradeShip] = (UI.getChildControl)(Panel_Radar, "icon_PersonalTradeShip"), [radorType.radorType_GalleyShip] = (UI.getChildControl)(Panel_Radar, "icon_GalleyShip"), [radorType.radorType_PersonalBattleShip] = (UI.getChildControl)(Panel_Radar, "icon_PersonalBattleShip"), [radorType.radorType_huntingMonster] = (UI.getChildControl)(Panel_Radar, "icon_monsterHunting_normal"), [radorType.radorType_huntingMonsterQuestTarget] = (UI.getChildControl)(Panel_Radar, "icon_monsterHunting_quest")}
local typeDepth = {[radorType.radorType_none] = 0, [radorType.radorType_hide] = 0, [radorType.radorType_allymonster] = -5, [radorType.radorType_normalMonster] = -2, [radorType.radorType_namedMonster] = -10, [radorType.radorType_bossMonster] = -12, [radorType.radorType_normalMonsterQuestTarget] = -3, [radorType.radorType_namedMonsterQuestTarget] = -11, [radorType.radorType_bossMonsterQuestTarget] = -13, [radorType.radorType_huntingMonster] = -11, [radorType.radorType_huntingMonsterQuestTarget] = -12, [radorType.radorType_lordManager] = -14, [radorType.radorType_skillTrainner] = -15, [radorType.radorType_tradeMerchantNpc] = -16, [radorType.radorType_nodeManager] = -17, [radorType.radorType_normalNpc] = -2, [radorType.radorType_warehouseNpc] = -7, [radorType.radorType_potionNpc] = -8, [radorType.radorType_weaponNpc] = -9, [radorType.radorType_horseNpc] = -6, [radorType.radorType_workerNpc] = -10, [radorType.radorType_jewelNpc] = -11, [radorType.radorType_furnitureNpc] = -12, [radorType.radorType_collectNpc] = -13, [radorType.radorType_shipNpc] = -5, [radorType.radorType_alchemyNpc] = -4, [radorType.radorType_fishNpc] = -3, [radorType.radorType_guild] = -21, [radorType.radorType_guildShop] = -25, [radorType.radorType_itemTrader] = -26, [radorType.radorType_TerritorySupply] = -23, [radorType.radorType_TerritoryTrade] = -22, [radorType.radorType_Cook] = -24, [radorType.radorType_Wharf] = -20, [radorType.radorType_itemRepairer] = -33, [radorType.radorType_shopMerchantNpc] = -34, [radorType.radorType_ImportantNpc] = -32, [radorType.radorType_QuestAcceptable] = -41, [radorType.radorType_QuestProgress] = -40, [radorType.radorType_QuestComplete] = -42, [radorType.radorType_unknownNpc] = -2, [radorType.radorType_partyMember] = -90, [radorType.radorType_guildMember] = -80, [radorType.radorType_normalPlayer] = -1, [radorType.radorType_isHorse] = -100, [radorType.radorType_isDonkey] = -100, [radorType.radorType_isShip] = -100, [radorType.radorType_isCarriage] = -100, [radorType.radorType_isCamel] = -100, [radorType.radorType_isElephant] = -100, [radorType.radorType_isBabyElePhant] = -100, [radorType.radorType_installation] = -20, [radorType.radorType_kingGuildTent] = -20, [radorType.radorType_lordGuildTent] = -20, [radorType.radorType_selfDeadBody] = -40, [radorType.radorType_advancedBase] = -30, [radorType.radorType_Raft] = -100, [radorType.radorType_Boat] = -100, [radorType.radorType_FishingBoat] = -100, [radorType.radorType_PersonalTradeShip] = -100, [radorType.radorType_GalleyShip] = -100, [radorType.radorType_PersonalBattleShip] = -100}
local UI_color = Defines.Color
local colorBlindNone = {[radorType.radorType_allymonster] = UI_color.C_FFB22300, [radorType.radorType_normalMonster] = UI_color.C_FFB22300, [radorType.radorType_namedMonster] = UI_color.C_FFB22300, [radorType.radorType_bossMonster] = UI_color.C_FFB22300, [radorType.radorType_huntingMonster] = UI_color.C_FFB22300, [radorType.radorType_normalMonsterQuestTarget] = UI_color.C_FFEE9900, [radorType.radorType_namedMonsterQuestTarget] = UI_color.C_FFEE9900, [radorType.radorType_bossMonsterQuestTarget] = UI_color.C_FFEE9900, [radorType.radorType_huntingMonsterQuestTarget] = UI_color.C_FFEE9900}
local colorBlindRed = {[radorType.radorType_allymonster] = UI_color.C_FFD85300, [radorType.radorType_normalMonster] = UI_color.C_FFD85300, [radorType.radorType_namedMonster] = UI_color.C_FFD85300, [radorType.radorType_bossMonster] = UI_color.C_FFD85300, [radorType.radorType_huntingMonster] = UI_color.C_FFD85300, [radorType.radorType_normalMonsterQuestTarget] = UI_color.C_FFFFE866, [radorType.radorType_namedMonsterQuestTarget] = UI_color.C_FFFFE866, [radorType.radorType_bossMonsterQuestTarget] = UI_color.C_FFFFE866, [radorType.radorType_huntingMonsterQuestTarget] = UI_color.C_FFFFE866}
local colorBlindGreen = {[radorType.radorType_allymonster] = UI_color.C_FFD82800, [radorType.radorType_normalMonster] = UI_color.C_FFD82800, [radorType.radorType_namedMonster] = UI_color.C_FFD82800, [radorType.radorType_bossMonster] = UI_color.C_FFD82800, [radorType.radorType_huntingMonster] = UI_color.C_FFD82800, [radorType.radorType_normalMonsterQuestTarget] = UI_color.C_FFFFE866, [radorType.radorType_namedMonsterQuestTarget] = UI_color.C_FFFFE866, [radorType.radorType_bossMonsterQuestTarget] = UI_color.C_FFFFE866, [radorType.radorType_huntingMonsterQuestTarget] = UI_color.C_FFFFE866}
local CGT = CppEnums.CharacterGradeType
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TM = CppEnums.TextMode
local UI_RT = CppEnums.RegionType
local isDrag = false
local alphaValue = 1
local simpleUIAlpha = 0
local raderText = (UI.getChildControl)(Panel_Radar, "StaticText_raderText")
local radar_Background = (UI.getChildControl)(Panel_Radar, "rader_background")
local radar_SizeSlider = (UI.getChildControl)(Panel_Radar, "Slider_MapSize")
local radar_SizeBtn = (UI.getChildControl)(radar_SizeSlider, "Slider_MapSize_Btn")
local radar_AlphaScrl = (UI.getChildControl)(Panel_Radar, "Slider_RadarAlpha")
local radar_AlphaBtn = (UI.getChildControl)(radar_AlphaScrl, "RadarAlpha_CtrlBtn")
local radar_OverName = (UI.getChildControl)(Panel_Radar, "Static_OverName")
local radar_MiniMapScl = (UI.getChildControl)(Panel_Radar, "Button_SizeControl")
local radar_regionName = (UI.getChildControl)(Panel_Radar, "StaticText_RegionName")
local radar_regionNodeName = (UI.getChildControl)(Panel_Radar, "StaticText_RegionNodeName")
local radar_regionWarName = (UI.getChildControl)(Panel_Radar, "StaticText_RegionWarName")
local radar_DangerIcon = (UI.getChildControl)(Panel_Radar, "Static_DangerArea")
local redar_DangerAletText = (UI.getChildControl)(Panel_Radar, "StaticText_MonsterAlert")
local radar_DangetAlertBg = (UI.getChildControl)(Panel_Radar, "Static_Alert")
radar_regionName:SetAutoResize(true)
radar_regionName:SetNotAbleMasking(true)
radar_regionNodeName:SetAutoResize(true)
radar_regionNodeName:SetNotAbleMasking(true)
radar_regionWarName:SetAutoResize(true)
radar_regionWarName:SetNotAbleMasking(true)
radar_Background:addInputEvent("Mouse_On", "FGlobal_Radar_HandleMouseOn()")
redar_DangerAletText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
redar_DangerAletText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RADER_NEARMONSTERALERT"))
redar_DangerAletText:SetShow(false)
redar_DangerAletText:SetDepth(-9999)
radar_DangetAlertBg:SetShow(false)
radar_DangetAlertBg:SetDepth(-9998)
local raderAlert_Resize = function()
  -- function num : 0_0 , upvalues : redar_DangerAletText, radar_DangetAlertBg
  if redar_DangerAletText:GetSizeY() < redar_DangerAletText:GetTextSizeY() then
    redar_DangerAletText:SetSize(Panel_Radar:GetSizeX() - 60, redar_DangerAletText:GetSizeY() + 20)
  else
    redar_DangerAletText:SetSize(Panel_Radar:GetSizeX() - 60, redar_DangerAletText:GetSizeY())
  end
  redar_DangerAletText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  redar_DangerAletText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RADER_NEARMONSTERALERT"))
  redar_DangerAletText:ComputePos()
  radar_DangetAlertBg:SetSize(Panel_Radar:GetSizeX() - 25, Panel_Radar:GetSizeY() - 25)
  radar_DangetAlertBg:ComputePos()
end

raderAlert_Resize()
local Panel_OrigSizeX = 320
local Panel_OrigSizeY = 280
local wheelCount = 0.5
local cacheSimpleUI_ShowButton = true
local isMouseOn = false
local scaleMinValue = 50
local scaleMaxValue = 150
local useLanternAlertTime = 0
local beforSafeZone = false
local beforeCombatZone = false
local beforeArenaZone = false
local beforeDesertZone = false
local currentSafeZone = false
local nodeWarRegionName = nil
local balenciaPart2 = ToClient_IsContentsGroupOpen("65")
radar_Background:SetAlpha(0)
local _siegeAttackPosition = nil
local _OnSiegeRide = false
local _const_siegeAttackHitArea, RadarMap_UpdatePixelRate = nil, nil
local radarTime = {
controls = {iconNotice = (UI.getChildControl)(Panel_TimeBar, "StaticText_Icon_Notice"), commandCenter = (UI.getChildControl)(Panel_TimeBar, "Static_CommandCenter"), citadel = (UI.getChildControl)(Panel_TimeBar, "Static_Citadel"), raining = (UI.getChildControl)(Panel_TimeBar, "Static_Raining"), siegeArea = (UI.getChildControl)(Panel_TimeBar, "Static_SiegeArea"), VillageWar = (UI.getChildControl)(Panel_TimeBar, "Static_VillageWarArea"), regionType = (UI.getChildControl)(Panel_TimeBar, "regionType"), regionName = (UI.getChildControl)(Panel_TimeBar, "regionName"), terrainInfo = (UI.getChildControl)(Panel_TimeBar, "StaticText_Terrain"), serverName = (UI.getChildControl)(Panel_TimeBar, "StaticText_ServerName"), channelName = (UI.getChildControl)(Panel_TimeBar, "StaticText_ChannelName"), gameTime = (UI.getChildControl)(Panel_TimeBar, "StaticText_Time")}
}
;
((radarTime.controls).regionType):SetShow(false)
;
((radarTime.controls).regionName):SetShow(false)
local UCT_STATICTEXT = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
local terrainNotice = (UI.getChildControl)(Panel_Radar, "Static_Notice")
local terrainNoticeStyle = (UI.getChildControl)(Panel_Radar, "StaticText_Notice")
local terrainNoticeText = (UI.createControl)(UCT_STATICTEXT, terrainNotice, "terrainNoticeText")
local textInfo = ""
Panel_Radar:SetChildIndex(terrainNotice, 9999)
CopyBaseProperty(terrainNoticeStyle, terrainNoticeText)
;
(UI.deleteControl)(terrainNoticeStyle)
terrainNoticeStyle = nil
terrainNoticeText:SetSpanSize(10, 0)
local floor = math.floor
local sqrt = math.sqrt
local RegionData_IngameTime = 0
local RegionData_RealIngameTime = 0
local dayCycle = 86400
local QuestArrowHalfSize = 0
local checkLoad = function()
  -- function num : 0_1
  local radarControl = radarMap.controls
  do
    local SPI = radarControl.icon_SelfPlayer
    ;
    (UI.ASSERT)(SPI:GetSizeX() == SPI:GetSizeY(), "[Radar.lua] icon_SelfPlayer MEST BE \'square\'")
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

local updateWorldMapDistance = function(mapRadius)
  -- function num : 0_2 , upvalues : scaleMinValue, scaleMaxValue, RadarMap_UpdatePixelRate
  local config = radarMap.config
  config.mapRadius = (math.min)((math.max)(mapRadius, scaleMinValue), scaleMaxValue)
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  radarMap.worldDistanceToPixelRate = config.mapRadiusByPixel / config.mapRadius
  ToClient_setRadorUIDistanceToPixelRate(radarMap.worldDistanceToPixelRate / 100 * 2)
  RadarMap_UpdatePixelRate()
end

Rader_updateWorldMapDistance_Reset = function()
  -- function num : 0_3
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  (radarMap.config).mapRadius = (radarMap.config).constMapRadius
  FGlobal_Rader_updateWorldMapDistance_Relative(1.3)
end

FGlobal_Rader_updateWorldMapDistance_Relative = function(value)
  -- function num : 0_4 , upvalues : updateWorldMapDistance, scaleMinValue, radar_SizeSlider
  updateWorldMapDistance((radarMap.config).mapRadius + (radarMap.config).constMapRadius * value)
  local percents = (radarMap.config).mapRadius - scaleMinValue
  percents = (math.max)((math.min)(percents, 100), 0)
  radar_SizeSlider:SetControlPos(100 - percents)
  ToClient_SetRaderScale(radar_SizeSlider:GetControlPos())
  ToClient_SaveUiInfo(false)
end

FGlobal_Rader_UpdateWorldMapDistance = function(value)
  -- function num : 0_5
end

local controlAlign = function()
  -- function num : 0_6 , upvalues : radar_SizeSlider, radar_AlphaScrl, radar_MiniMapScl, radar_DangerIcon, radar_regionWarName
  local scl_minus = (radarMap.controls).rader_Minus
  local scl_plus = (radarMap.controls).rader_Plus
  radar_SizeSlider:SetScale(radarMap.scaleRateWidth, 1)
  scl_plus:SetPosX(scl_minus:GetPosX() + scl_minus:GetSizeX() + radar_SizeSlider:GetSizeX() + 15)
  local alpha_plus = (radarMap.controls).rader_AlphaPlus
  local alpha_minus = (radarMap.controls).rader_AlphaMinus
  radar_AlphaScrl:SetScale(1, radarMap.scaleRateHeight)
  alpha_minus:SetPosY(alpha_plus:GetPosY() + radar_AlphaScrl:GetSizeY() + alpha_minus:GetSizeY() + 5)
  local resetIcon = (radarMap.controls).rader_Reset
  resetIcon:SetVerticalBottom()
  resetIcon:SetHorizonRight()
  radar_MiniMapScl:SetVerticalBottom()
  radar_DangerIcon:ComputePos()
  radar_regionWarName:ComputePos()
end

local MAX_WIDTH = 512
local MAX_HEIGHT = 512
FromClient_MapSizeScale = function()
  -- function num : 0_7 , upvalues : MAX_WIDTH, Panel_OrigSizeX, MAX_HEIGHT, Panel_OrigSizeY, controlAlign, raderAlert_Resize
  local origEndX = Panel_Radar:GetPosX() + Panel_Radar:GetSizeX()
  if origEndX - getMousePosX() <= MAX_WIDTH and Panel_OrigSizeX <= origEndX - getMousePosX() then
    Panel_Radar:SetPosX(getMousePosX())
    Panel_Radar:SetSize(origEndX - getMousePosX(), Panel_Radar:GetSizeY())
    ;
    ((radarMap.controls).rader_Background):SetPosX(0)
    ;
    ((radarMap.controls).rader_Background):SetSize(origEndX - getMousePosX(), Panel_Radar:GetSizeY())
  end
  if getMousePosY() - Panel_Radar:GetPosY() <= MAX_HEIGHT and Panel_OrigSizeY <= getMousePosY() - Panel_Radar:GetPosY() then
    Panel_Radar:SetSize(Panel_Radar:GetSizeX(), getMousePosY() - Panel_Radar:GetPosY())
    ;
    ((radarMap.controls).rader_Background):SetSize(Panel_Radar:GetSizeX(), getMousePosY() - Panel_Radar:GetPosY())
  end
  -- DECOMPILER ERROR at PC100: Confused about usage of register: R1 in 'UnsetPending'

  radarMap.scaleRateWidth = Panel_Radar:GetSizeX() / Panel_OrigSizeX
  -- DECOMPILER ERROR at PC107: Confused about usage of register: R1 in 'UnsetPending'

  radarMap.scaleRateHeight = Panel_Radar:GetSizeY() / Panel_OrigSizeY
  local SPI = (radarMap.controls).icon_SelfPlayer
  local halfSelfSizeX = SPI:GetSizeX() / 2
  local halfSelfSizeY = SPI:GetSizeY() / 2
  local halfSizeX = Panel_Radar:GetSizeX() / 2
  local halfSizeY = Panel_Radar:GetSizeY() / 2
  SPI:SetPosX(halfSizeX - halfSelfSizeX)
  SPI:SetPosY(halfSizeY - halfSelfSizeY)
  -- DECOMPILER ERROR at PC136: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (radarMap.pcPosBaseControl).x = SPI:GetPosX() + halfSelfSizeX
  -- DECOMPILER ERROR at PC142: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (radarMap.pcPosBaseControl).y = SPI:GetPosY() + halfSelfSizeY
  ToClient_setRadorUICenterPosition(int2((radarMap.pcPosBaseControl).x, (radarMap.pcPosBaseControl).y))
  controlAlign()
  NpcNavi_Reset_Posistion()
  TownNpcIcon_Resize()
  Panel_PlayerEndurance_Position()
  Panel_CarriageEndurance_Position()
  Panel_HorseEndurance_Position()
  Panel_ShipEndurance_Position()
  FGlobal_PersonalIcon_ButtonPosUpdate()
  ToClient_SaveUiInfo(false)
  raderAlert_Resize()
end

Rader_IconsSetAlpha = function(alpha)
  -- function num : 0_8 , upvalues : alphaValue
  local actorAlpha = (math.max)((math.min)(alpha + 0.2, 1), 0.7)
  for _,areaQuest in pairs(radarMap.areaQuests) do
    (areaQuest.icon_QuestArea):SetAlpha(actorAlpha)
    ;
    (areaQuest.icon_QuestArrow):SetAlpha(actorAlpha)
  end
  ;
  ((radarMap.controls).icon_SelfPlayer):SetAlpha(actorAlpha)
  RaderMapBG_SetAlphaValue(alphaValue)
  FGlobal_PositionGuideSetAlpha(actorAlpha)
end

Radar_CalcAlaphValue = function(alpha)
  -- function num : 0_9 , upvalues : alphaValue, radar_AlphaScrl
  alphaValue = (math.max)((math.min)(alpha, 1), 0)
  radar_AlphaScrl:SetControlPos(100 * (1 - alphaValue))
  alphaValue = alphaValue + (1 - alphaValue) * 0.5
  return alphaValue
end

Rader_updateWorldMap_AlphaControl = function(alpha)
  -- function num : 0_10 , upvalues : alphaValue, radar_AlphaScrl
  alphaValue = Radar_CalcAlaphValue(1 - radar_AlphaScrl:GetControlPos() + alpha)
  Rader_IconsSetAlpha(alphaValue)
  ToClient_SetRaderAlpha(radar_AlphaScrl:GetControlPos())
  ToClient_SaveUiInfo(false)
end

FGlobal_ReloadRaderAlphaValue = function()
  -- function num : 0_11 , upvalues : alphaValue
  alphaValue = Radar_CalcAlaphValue(alphaValue)
  Rader_IconsSetAlpha(alphaValue)
end

Rader_updateWorldMap_AlphaControl_Init = function()
  -- function num : 0_12 , upvalues : radar_AlphaScrl, alphaValue
  local alphaSlideValue = 1 - radar_AlphaScrl:GetControlPos()
  alphaSlideValue = Radar_CalcAlaphValue(alphaSlideValue)
  Rader_IconsSetAlpha(alphaSlideValue)
  alphaValue = alphaSlideValue
end

Rader_updateWorldMap_AlphaControl_Scrl = function()
  -- function num : 0_13 , upvalues : radar_AlphaScrl
  Rader_updateWorldMap_AlphaControl_Init()
  ToClient_SetRaderAlpha(radar_AlphaScrl:GetControlPos())
  ToClient_SaveUiInfo(false)
end

Rader_updateWorldMap_ScaleControl_Scrl = function()
  -- function num : 0_14 , upvalues : radar_SizeSlider, updateWorldMapDistance, scaleMinValue
  local scaleSlideValue = 1 - radar_SizeSlider:GetControlPos()
  updateWorldMapDistance(scaleMinValue + scaleSlideValue * 100)
  NpcNavi_Reset_Posistion()
  ToClient_SetRaderScale(radar_SizeSlider:GetControlPos())
  ToClient_SaveUiInfo(false)
end

Rader_updateWorldMap_ScaleControl_Wheel = function(isUp)
  -- function num : 0_15 , upvalues : wheelCount, updateWorldMapDistance, radar_SizeSlider
  -- DECOMPILER ERROR at PC7: Unhandled construct in 'MakeBoolean' P1

  if isUp == true and wheelCount > 0 then
    wheelCount = wheelCount - 0.05
    updateWorldMapDistance((radarMap.config).mapRadius + wheelCount * 100)
  end
  if wheelCount < 1 then
    wheelCount = wheelCount + 0.05
    updateWorldMapDistance((radarMap.config).mapRadius + wheelCount * 100)
  end
  local percents = wheelCount * 100
  radar_SizeSlider:SetControlPos(100 - percents)
  NpcNavi_Reset_Posistion()
end

Radar_SetRotateMode = function(isRotate)
  -- function num : 0_16
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  radarMap.isRotateMode = isRotate
  local rot = 0
  if isRotate then
    rot = math.pi
  else
    resetRadorActorListRotateValue()
    resetPinRotate()
  end
  local radarControl = radarMap.controls
  ;
  (radarControl.rader_Background):SetParentRotCalc(isRotate)
  ;
  (radarControl.rader_Background):SetParentRotCalc(isRotate)
  ;
  (radarControl.icon_SelfPlayer):SetRotate(rot)
  FGlobal_GuildPinRotateMode(isRotate)
  FGlobal_PinRotateMode(isRotate)
  RadarBackground_SetRotateMode(isRotate)
  Radar_UpdateQuestList()
end

local pinX, pinZ = nil, nil
Radar_PinUpdate = function(isAlways)
  -- function num : 0_17
  SendPingInfo_ToClient(isAlways)
end

Radar_MouseOn = function()
  -- function num : 0_18 , upvalues : isMouseOn
  isMouseOn = true
end

Radar_MouseOut = function()
  -- function num : 0_19 , upvalues : isMouseOn
  isMouseOn = false
end

FGlobal_Radar_HandleMouseOn = function()
  -- function num : 0_20
  PaGlobal_TutorialManager:handleRadarMouseOn()
end

RadarMap_Background_MouseRUp = function()
  -- function num : 0_21 , upvalues : radar_MiniMapScl
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  local posX = mousePosX - Panel_Radar:GetPosX()
  local posZ = mousePosY - Panel_Radar:GetPosY() - Panel_Radar:GetSizeY()
  if ToClient_GetMyTeamNoLocalWar() ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_LOCALWAR_CANTNAVI_ACK"))
    return 
  end
  if ((getSelfPlayer()):get()):getLevel() < 11 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TUTORIAL_PROGRSS_ACK"))
    FGlobal_QuestWidget_UpdateList()
    if not isQuest160524_chk() then
      updateQuestWindowList(FGlobal_QuestWindowGetStartPosition())
    end
    return 
  end
  if ToClient_IsShowNaviGuideGroup(0) then
    radar_MiniMapScl:AddEffect("fUI_Button_Hide", false, posX, posZ)
    ToClient_DeleteNaviGuideByGroup(0)
  else
    radar_MiniMapScl:AddEffect("fUI_Button_Hide", false, posX, posZ)
    local posX = getMousePosX() - Panel_Radar:GetPosX()
    local posY = getMousePosY() - Panel_Radar:GetPosY()
    local intervalX = posX - (((radarMap.controls).icon_SelfPlayer):GetPosX() + ((radarMap.controls).icon_SelfPlayer):GetSizeX() / 2)
    local intervalZ = ((radarMap.controls).icon_SelfPlayer):GetPosY() + ((radarMap.controls).icon_SelfPlayer):GetSizeY() / 2 - posY
    intervalX = intervalX * (100 / (radarMap.worldDistanceToPixelRate * 2))
    intervalZ = intervalZ * (100 / (radarMap.worldDistanceToPixelRate * 2))
    local selfPlayerControlPos = radarMap.pcPosBaseControl
    local dist = intervalX - selfPlayerControlPos.x
    local disty = intervalZ - selfPlayerControlPos.y
    local tempPos = float2(dist, disty)
    local camRot = getCameraRotation()
    if radarMap.isRotateMode then
      tempPos:rotate(camRot + math.pi)
    end
    local selfPosition = (getSelfPlayer()):get3DPos()
    local float3Pos = float3(selfPosition.x + tempPos.x, 0, selfPosition.z + tempPos.y)
    float3Pos.y = selfPosition.y
    ToClient_WorldMapNaviStart(float3Pos, NavigationGuideParam(), false, true)
    audioPostEvent_SystemUi(0, 14)
  end
end

local controlInit = function()
  -- function num : 0_22 , upvalues : radarTime, radar_DangerIcon, radar_SizeBtn, radar_SizeSlider, radar_AlphaBtn, radar_AlphaScrl, alphaValue, radar_MiniMapScl, controlAlign, updateWorldMapDistance, scaleMinValue
  local radarControl = radarMap.controls
  ;
  (radarControl.timeNum):SetShow(false)
  ;
  (radarControl.timeNum):SetIgnore(true)
  local SPI = radarControl.icon_SelfPlayer
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (radarMap.pcPosBaseControl).x = SPI:GetPosX() + SPI:GetSizeX() / 2
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (radarMap.pcPosBaseControl).y = SPI:GetPosY() + SPI:GetSizeY() / 2
  ToClient_setRadorUICenterPosition(int2((radarMap.pcPosBaseControl).x, (radarMap.pcPosBaseControl).y))
  ;
  ((radarTime.controls).terrainInfo):addInputEvent("Mouse_On", "TerrainInfo_ShowBubble(true)")
  ;
  ((radarTime.controls).terrainInfo):addInputEvent("Mouse_Out", "TerrainInfo_ShowBubble(false)")
  ;
  ((radarTime.controls).raining):addInputEvent("Mouse_On", "Rader_Icon_Help_BubbleShowFunc(" .. 0 .. ", true )")
  ;
  ((radarTime.controls).raining):addInputEvent("Mouse_Out", "Rader_Icon_Help_BubbleShowFunc(" .. 0 .. ", false )")
  ;
  ((radarTime.controls).citadel):addInputEvent("Mouse_On", "Rader_Icon_Help_BubbleShowFunc(" .. 1 .. ", true )")
  ;
  ((radarTime.controls).citadel):addInputEvent("Mouse_Out", "Rader_Icon_Help_BubbleShowFunc(" .. 1 .. ", false )")
  ;
  ((radarTime.controls).siegeArea):addInputEvent("Mouse_On", "Rader_Icon_Help_BubbleShowFunc(" .. 2 .. ", true )")
  ;
  ((radarTime.controls).siegeArea):addInputEvent("Mouse_Out", "Rader_Icon_Help_BubbleShowFunc(" .. 2 .. ", false )")
  ;
  ((radarTime.controls).VillageWar):addInputEvent("Mouse_On", "Rader_Icon_Help_BubbleShowFunc(" .. 3 .. ", true )")
  ;
  ((radarTime.controls).VillageWar):addInputEvent("Mouse_Out", "Rader_Icon_Help_BubbleShowFunc(" .. 3 .. ", false )")
  radar_DangerIcon:addInputEvent("Mouse_On", "Rader_Icon_Help_BubbleShowFunc(" .. 4 .. ", true )")
  radar_DangerIcon:addInputEvent("Mouse_Out", "Rader_Icon_Help_BubbleShowFunc(" .. 4 .. ", false )")
  Panel_Radar:RegisterUpdateFunc("RadarMap_UpdatePerFrame")
  Panel_TimeBar:RegisterUpdateFunc("TimeBar_UpdatePerFrame")
  ;
  (radarControl.rader_Plus):addInputEvent("Mouse_LUp", "FGlobal_Rader_updateWorldMapDistance_Relative(-0.1)")
  ;
  (radarControl.rader_Minus):addInputEvent("Mouse_LUp", "FGlobal_Rader_updateWorldMapDistance_Relative(0.1)")
  radar_SizeBtn:addInputEvent("Mouse_LPress", "Rader_updateWorldMap_ScaleControl_Scrl()")
  radar_SizeSlider:addInputEvent("Mouse_LPress", "Rader_updateWorldMap_ScaleControl_Scrl()")
  ;
  (radarControl.rader_AlphaPlus):addInputEvent("Mouse_LUp", "Rader_updateWorldMap_AlphaControl(0.05)")
  ;
  (radarControl.rader_AlphaMinus):addInputEvent("Mouse_LUp", "Rader_updateWorldMap_AlphaControl(-0.05)")
  radar_AlphaBtn:addInputEvent("Mouse_LPress", "Rader_updateWorldMap_AlphaControl_Scrl()")
  radar_AlphaScrl:addInputEvent("Mouse_LPress", "Rader_updateWorldMap_AlphaControl_Scrl()")
  radar_AlphaScrl:SetControlPos(100 - alphaValue * 100)
  ;
  (radarControl.rader_Reset):addInputEvent("Mouse_LUp", "Rader_updateWorldMapDistance_Reset()")
  ;
  (radarControl.rader_Close):addInputEvent("Mouse_LDown", "Panel_Radar_ShowToggle()")
  ;
  (radarControl.rader_Background):SetSize(Panel_Radar:GetSizeX(), Panel_Radar:GetSizeY())
  ;
  (radarControl.rader_Background):addInputEvent("Mouse_LDown", "Radar_PinUpdate(false)")
  ;
  (radarControl.rader_Background):addInputEvent("Mouse_LDClick", "Radar_PinUpdate(true)")
  ;
  (radarControl.rader_Background):addInputEvent("Mouse_UpScroll", "FGlobal_Rader_updateWorldMapDistance_Relative(-0.1)")
  ;
  (radarControl.rader_Background):addInputEvent("Mouse_RUp", "RadarMap_Background_MouseRUp()")
  ;
  (radarControl.rader_Background):addInputEvent("Mouse_DownScroll", "FGlobal_Rader_updateWorldMapDistance_Relative(0.1)")
  radar_MiniMapScl:addInputEvent("Mouse_LPress", "FromClient_MapSizeScale()")
  radar_MiniMapScl:addInputEvent("Mouse_On", "RadarScale_SimpleTooltips( true )")
  radar_MiniMapScl:addInputEvent("Mouse_Out", "RadarScale_SimpleTooltips( false )")
  radar_MiniMapScl:addInputEvent("Mouse_LUp", "HandleClicked_RadarResize()")
  radar_MiniMapScl:setTooltipEventRegistFunc("RadarScale_SimpleTooltips( true )")
  ;
  ((radarTime.controls).channelName):addInputEvent("Mouse_LUp", "FGlobal_ChannelSelect_Show()")
  controlAlign()
  RadarMap_Init()
  Panel_Radar:ChangeSpecialTextureInfoName("New_UI_Common_forLua/Widget/Rader/Minimap_Mask.dds")
  Panel_Radar:setMaskingChild(true)
  ;
  (radarControl.rader_Plus):SetNotAbleMasking(true)
  ;
  (radarControl.rader_Minus):SetNotAbleMasking(true)
  radar_SizeBtn:SetNotAbleMasking(true)
  radar_SizeSlider:SetNotAbleMasking(true)
  ;
  (radarControl.rader_AlphaPlus):SetNotAbleMasking(true)
  ;
  (radarControl.rader_AlphaMinus):SetNotAbleMasking(true)
  radar_AlphaBtn:SetNotAbleMasking(true)
  radar_AlphaScrl:SetNotAbleMasking(true)
  ;
  (radarControl.rader_Reset):SetNotAbleMasking(true)
  ;
  (radarControl.rader_Close):SetNotAbleMasking(true)
  radar_MiniMapScl:SetNotAbleMasking(true)
  ;
  (radarControl.rader_Plus):SetAlpha(0)
  ;
  (radarControl.rader_Minus):SetAlpha(0)
  radar_SizeBtn:SetAlpha(0)
  radar_SizeSlider:SetAlpha(0)
  ;
  (radarControl.rader_AlphaPlus):SetAlpha(0)
  ;
  (radarControl.rader_AlphaMinus):SetAlpha(0)
  radar_AlphaBtn:SetAlpha(0)
  radar_AlphaScrl:SetAlpha(0)
  ;
  (radarControl.rader_Reset):SetAlpha(0)
  ;
  (radarControl.rader_Close):SetAlpha(0)
  radar_MiniMapScl:SetAlpha(0)
  ;
  (radarControl.icon_SelfPlayer):SetRotate(math.pi)
  radar_AlphaScrl:SetControlPos(ToClient_GetRaderAlpha() * 100)
  Rader_updateWorldMap_AlphaControl_Init()
  radar_SizeSlider:SetControlPos(ToClient_GetRaderScale() * 100)
  local scaleSlideValue = 1 - radar_SizeSlider:GetControlPos()
  updateWorldMapDistance(scaleMinValue + scaleSlideValue * 100)
end

local weatherTooltip = 0
local buildingTooltip = 0
local siegeTooltip = 0
local VillageWarTooltip = 0
Rader_Icon_Help_BubbleShowFunc = function(iconNo, isOn)
  -- function num : 0_23 , upvalues : weatherTooltip, radarTime, buildingTooltip, siegeTooltip, VillageWarTooltip, nodeWarRegionName, radar_DangerIcon
  if iconNo == 0 then
    if weatherTooltip == 0 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_WEATHER_RAIN_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_REDUCED_DAMAGE_REASON_RAIN")
      uiControl = (radarTime.controls).raining
    else
      if weatherTooltip == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_WEATHER_SNOW_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_REDUCED_DAMAGE_REASON_SNOW")
        uiControl = (radarTime.controls).raining
      else
        name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_WEATHER_CLEAR_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_WEATHER_CLEAR_DESC")
        uiControl = (radarTime.controls).raining
      end
    end
  else
    if iconNo == 1 then
      if buildingTooltip == 1 or buildingTooltip == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_COMBATPOSSIBLE_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_COMBATPOSSIBLE_DESC")
        uiControl = (radarTime.controls).citadel
      else
        name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_COMBATIMPOSSIBLE_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_COMBATIMPOSSIBLE_DESC")
        uiControl = (radarTime.controls).citadel
      end
    else
      if iconNo == 2 then
        if siegeTooltip == 0 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_SIEGEPOSSIBLE1_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_SIEGEPOSSIBLE1_DESC")
          uiControl = (radarTime.controls).siegeArea
        else
          if siegeTooltip == 1 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_SIEGEPOSSIBLE2_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_SIEGEPOSSIBLE2_DESC")
            uiControl = (radarTime.controls).siegeArea
          else
            name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_SIEGEIMPOSSIBLE_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_SIEGEIMPOSSIBLE_DESC")
            uiControl = (radarTime.controls).siegeArea
          end
        end
      else
        if iconNo == 3 then
          if VillageWarTooltip == 0 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_VILLAGEWARABLE_NAME")
            if nodeWarRegionName ~= "" then
              desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_VILLAGEWARABLE_DESC", "nodeWarRegionName", nodeWarRegionName)
            else
              desc = ""
            end
            uiControl = (radarTime.controls).VillageWar
          else
            name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_VILLAGEWARDISABLE_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_VILLAGEWARDISABLE_DESC")
            uiControl = (radarTime.controls).VillageWar
          end
        else
          if iconNo == 4 then
            local player = getSelfPlayer()
            if player == nil then
              return 
            end
            local playerGet = player:get()
            local ChaTendency = playerGet:getTendency()
            name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_INTO_DESERT_TITLE")
            desc = ""
            if ChaTendency < 0 then
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_INTO_COMBATZONE_FOR_CAOTIC_DESC")
            else
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_INTO_DESERT_DESC")
            end
            uiControl = radar_DangerIcon
          end
        end
      end
    end
  end
  do
    if isOn == true then
      TooltipSimple_Show(uiControl, name, desc)
    else
      TooltipSimple_Hide()
    end
  end
end

TerrainInfo_ShowBubble = function(isShow)
  -- function num : 0_24 , upvalues : radarTime, textInfo
  local terraintype = selfPlayerNaviMaterial()
  local radarControl = radarTime.controls
  if terraintype == 0 then
    textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_NORMAL")
    roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_NORMAL")
  else
    if terraintype == 1 then
      textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_ROAD")
      roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_ROAD")
    else
      if terraintype == 2 then
        textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_SNOW")
        roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_SNOW")
      else
        if terraintype == 3 then
          textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_DESERT")
          roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_DESERT")
        else
          if terraintype == 4 then
            textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_SWAMP")
            roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_SWAMP")
          else
            if terraintype == 5 then
              textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_OBJECT")
              roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_OBJECT")
            else
              if terraintype == 6 then
                textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_WATER")
                roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_WATER")
              else
                if terraintype == 7 then
                  textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_GRASS")
                  roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_GRASS")
                else
                  if terraintype == 8 then
                    textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_DEEPWATER")
                    roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_DEEPWATER")
                  else
                    if terraintype == 9 then
                      textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_AIR")
                      roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_AIR")
                    else
                      if getSelfPlayer() ~= nil then
                        return 
                      end
                      local isOcean = ((getSelfPlayer()):getCurrentRegionInfo()):isOcean()
                      if isOcean then
                        textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_OCEAN")
                        roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_OCEAN")
                      else
                        textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_NORMAL")
                        roadInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAINTYPE_NORMAL")
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
  do
    name = roadInfo
    desc = textInfo
    uiControl = (radarTime.controls).terrainInfo
    if isShow == true then
      TooltipSimple_Show(uiControl, name, desc)
    else
      TooltipSimple_Hide()
    end
  end
end

RadarScale_SimpleTooltips = function(isShow)
  -- function num : 0_25 , upvalues : radar_MiniMapScl
  local name, desc, uiControl = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_RADER_MINIMAP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_RADER_MINIMAP_DESC")
  uiControl = radar_MiniMapScl
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

RaderShowAni = function()
  -- function num : 0_26 , upvalues : UI_ANI_ADV, UI_color
  Panel_Radar:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local MainStatusOpen_Alpha = Panel_Radar:addColorAnimation(0, 0.35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MainStatusOpen_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  MainStatusOpen_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  MainStatusOpen_Alpha.IsChangeChild = true
end

RaderHideAni = function()
  -- function num : 0_27 , upvalues : UI_ANI_ADV, UI_color
  Panel_Radar:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local MainStatusOpen_Alpha = Panel_Radar:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MainStatusOpen_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
  MainStatusOpen_Alpha:SetEndColor(UI_color.C_00FFFFFF)
  MainStatusOpen_Alpha.IsChangeChild = true
  MainStatusOpen_Alpha:SetHideAtEnd(true)
  MainStatusOpen_Alpha:SetDisableWhileAni(true)
end

SortRador_IconIndex = function()
  -- function num : 0_28 , upvalues : radar_SizeSlider, radar_AlphaScrl, radar_MiniMapScl
  local mapButton = radarMap.controls
  Panel_Radar:SetChildIndex(radar_SizeSlider, 9999)
  Panel_Radar:SetChildIndex(radar_AlphaScrl, 9999)
  Panel_Radar:SetChildIndex(mapButton.rader_Reset, 9999)
  Panel_Radar:SetChildIndex(radar_MiniMapScl, 9999)
end

-- DECOMPILER ERROR at PC1204: Confused about usage of register: R72 in 'UnsetPending'

radarMap.getIdleIcon = function(self)
  -- function num : 0_29
  local iconPool = self.iconPool
  if iconPool:length() > 0 then
    return iconPool:pop_back()
  else
    self.iconCreateCount = self.iconCreateCount + 1
    local make_Icon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Static_Icon_" .. self.iconCreateCount)
    return make_Icon
  end
end

-- DECOMPILER ERROR at PC1208: Confused about usage of register: R72 in 'UnsetPending'

radarMap.returnIconToPool = function(self, icon)
  -- function num : 0_30
  (self.iconPool):push_back(icon)
end

-- DECOMPILER ERROR at PC1213: Confused about usage of register: R72 in 'UnsetPending'

radarMap.getIdleQuest = function(self)
  -- function num : 0_31 , upvalues : QuestArrowHalfSize
  local questPool = self.questIconPool
  if questPool:length() > 0 then
    return questPool:pop_back()
  else
    self.questCreateCount = self.questCreateCount + 1
    local iconQuestArea = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Static_QuestArea_" .. self.questCreateCount)
    local iconQuestArrow = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Static_QuestArrow_" .. self.questCreateCount)
    CopyBaseProperty((self.template).area_quest, iconQuestArea)
    CopyBaseProperty((self.template).area_quest_guideArrow, iconQuestArrow)
    iconQuestArea:SetShow(false)
    iconQuestArrow:SetShow(false)
    iconQuestArea:SetSize(((self.template).area_quest):GetSizeX(), ((self.template).area_quest):GetSizeY())
    iconQuestArrow:SetPosX((self.pcPosBaseControl).x - iconQuestArrow:GetSizeX() / 2)
    iconQuestArrow:SetPosY((self.pcPosBaseControl).y - iconQuestArrow:GetSizeY() / 2)
    iconQuestArrow:SetSize(((self.template).area_quest_guideArrow):GetSizeX(), ((self.template).area_quest_guideArrow):GetSizeY())
    QuestArrowHalfSize = iconQuestArrow:GetSizeY() / 2
    local questIcon = {icon_QuestArea = iconQuestArea, icon_QuestArrow = iconQuestArrow}
    return questIcon
  end
end

-- DECOMPILER ERROR at PC1217: Confused about usage of register: R72 in 'UnsetPending'

radarMap.returnQuestToPool = function(self, questIcon)
  -- function num : 0_32
  (self.questIconPool):push_back(questIcon)
end

Panel_TimeBar_ShowToggle = function()
  -- function num : 0_33
  local isShow = Panel_TimeBar:IsShow()
  if isShow then
    Panel_TimeBarNumber:SetShow(false)
    Panel_TimeBar:SetShow(false)
  else
    Panel_TimeBar:SetShow(true)
  end
end

RadarMap_updateRegion = function(regionData)
  -- function num : 0_34 , upvalues : radarTime, currentSafeZone, VillageWarTooltip, radar_regionName, UI_color, radar_regionNodeName, radar_regionWarName, radar_DangerIcon, beforeCombatZone, beforSafeZone, beforeArenaZone, beforeDesertZone, balenciaPart2, nodeWarRegionName
  if regionData == nil then
    return 
  end
  local radarControl = radarTime.controls
  local isArenaZone = (regionData:get()):isArenaZone()
  local isSafetyZone = (regionData:get()):isSafeZone()
  local isDesertZone = regionData:isDesert()
  currentSafeZone = isSafetyZone
  local checkVillageWarArea = function(control, isRight)
    -- function num : 0_34_0 , upvalues : VillageWarTooltip
    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Guild/Guild_00.dds")
    local x1, y1, x2, y2 = 0, 0, 0, 0
    if isRight then
      x1 = setTextureUV_Func(control, 333, 31, 353, 51)
      VillageWarTooltip = 0
    else
      -- DECOMPILER ERROR at PC30: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC31: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC32: Overwrote pending register: R3 in 'AssignReg'

      x1 = setTextureUV_Func(control, 354, 31, 374, 51)
      VillageWarTooltip = 1
    end
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
  end

  local linkedSiegeRegionInfoWrapper = ToClient_getInstallableVillageSiegeRegionInfoWrapper(((getSelfPlayer()):get()):getPosition())
  checkVillageWarArea((radarTime.controls).VillageWar, (linkedSiegeRegionInfoWrapper:get()):isVillageWarZone())
  radar_regionName:SetFontColor(UI_color.C_FFEFEFEF)
  radar_regionName:useGlowFont(false)
  radar_regionNodeName:SetFontColor(UI_color.C_FFEFEFEF)
  radar_regionNodeName:useGlowFont(false)
  radar_regionWarName:SetFontColor(UI_color.C_FFEFEFEF)
  radar_regionWarName:useGlowFont(false)
  radar_DangerIcon:SetShow(false)
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local ChaTendency = playerGet:getTendency()
  if isSafetyZone then
    radar_regionName:SetFontColor(4292276981)
    radar_regionName:useGlowFont(true, "BaseFont_12_Glow", 4281961144)
    radar_regionNodeName:SetFontColor(4292276981)
    radar_regionNodeName:useGlowFont(true, "BaseFont_8_Glow", 4281961144)
    radar_regionWarName:SetFontColor(4292276981)
    radar_regionWarName:useGlowFont(true, "BaseFont_8_Glow", 4281961144)
    do
      if beforeCombatZone == true then
        local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_ISSAFETYZONE_ACK_MAIN"), sub = ""}
        Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 0)
        FGlobal_LevelupGuide_Open()
      end
      beforSafeZone = true
      beforeCombatZone = false
      beforeArenaZone = false
      beforeDesertZone = false
      if isArenaZone then
        radar_regionName:SetFontColor(4294495693)
        radar_regionName:useGlowFont(true, "BaseFont_12_Glow", 4286580487)
        radar_regionNodeName:SetFontColor(4294495693)
        radar_regionNodeName:useGlowFont(true, "BaseFont_8_Glow", 4286580487)
        radar_regionWarName:SetFontColor(4294495693)
        radar_regionWarName:useGlowFont(true, "BaseFont_8_Glow", 4286580487)
        beforSafeZone = false
        beforeCombatZone = false
        beforeArenaZone = true
        beforeDesertZone = false
      else
        radar_regionName:SetFontColor(4294495693)
        radar_regionName:useGlowFont(true, "BaseFont_12_Glow", 4286580487)
        radar_regionNodeName:SetFontColor(4294495693)
        radar_regionNodeName:useGlowFont(true, "BaseFont_8_Glow", 4286580487)
        radar_regionWarName:SetFontColor(4294495693)
        radar_regionWarName:useGlowFont(true, "BaseFont_8_Glow", 4286580487)
        local msg = ""
        if ChaTendency >= 0 then
          if balenciaPart2 then
            if isDesertZone then
              msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_INTO_DESERT_TITLE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_INTO_DESERT_DESC")}
              Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 50)
              radar_DangerIcon:SetShow(true)
              Panel_Radar:SetChildIndex(radar_DangerIcon, 9999)
            else
              msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_ISCOMBATZONE_ACK_MAIN"), sub = ""}
              Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 1)
              radar_DangerIcon:SetShow(false)
              Panel_Radar:SetChildIndex(radar_DangerIcon, 9999)
            end
          else
            msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_ISCOMBATZONE_ACK_MAIN"), sub = ""}
            Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 1)
            radar_DangerIcon:SetShow(false)
            Panel_Radar:SetChildIndex(radar_DangerIcon, 9999)
          end
        else
          if balenciaPart2 then
            if isDesertZone then
              msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_ISCOMBATZONE_ACK_MAIN"), sub = ""}
              Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 1)
              radar_DangerIcon:SetShow(false)
              Panel_Radar:SetChildIndex(radar_DangerIcon, 9999)
            else
              msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_INTO_DESERT_TITLE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_INTO_COMBATZONE_FOR_CAOTIC_DESC")}
              Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 1)
              radar_DangerIcon:SetShow(true)
              Panel_Radar:SetChildIndex(radar_DangerIcon, 9999)
            end
          else
            msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_ISCOMBATZONE_ACK_MAIN"), sub = ""}
            Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 1)
            radar_DangerIcon:SetShow(false)
            Panel_Radar:SetChildIndex(radar_DangerIcon, 9999)
          end
        end
        beforSafeZone = not isDesertZone
        beforeCombatZone = not isDesertZone
        beforeArenaZone = not isDesertZone
        beforeDesertZone = isDesertZone
        FGlobal_CheckUnderwear()
      end
      do
        local selfPlayerWrapper = getSelfPlayer()
        local selfPlayerPos = selfPlayerWrapper:get3DPos()
        local linkSiegeWrapper = ToClient_getInstallableVillageSiegeRegionInfoWrapper(selfPlayerPos)
        nodeWarRegionName = ""
        do
          if linkSiegeWrapper ~= nil then
            local villageWarZone = (linkSiegeWrapper:get()):isVillageWarZone()
            if villageWarZone == true then
              nodeWarRegionName = linkSiegeWrapper:getvillageSiegeName()
            end
            radar_regionName:SetText(regionData:getAreaName())
          end
          radar_regionName:SetSize(radar_regionName:GetTextSizeX() + 40, radar_regionName:GetSizeY() + 3)
          radar_regionName:ComputePos()
          -- DECOMPILER ERROR at PC424: Confused about usage of register: R13 in 'UnsetPending'

          radarMap.regionTypeValue = (regionData:get()):getRegionType()
        end
      end
    end
  end
end

NodeLevelRegionNameShow = function(wayPointKey)
  -- function num : 0_35 , upvalues : radar_regionNodeName, nodeWarRegionName, radar_regionWarName
  local nodeName = ToClient_GetNodeNameByWaypointKey(wayPointKey)
  if nodeName == "" or nodeName == nil then
    radar_regionNodeName:SetShow(false)
  else
    radar_regionNodeName:SetShow(true)
    radar_regionNodeName:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RADER_REGIONNODENAME", "getName", nodeName))
    radar_regionNodeName:SetSize(radar_regionNodeName:GetTextSizeX() + 40, radar_regionNodeName:GetSizeY() + 3)
    radar_regionNodeName:ComputePos()
  end
  if nodeWarRegionName == "" or nodeWarRegionName == nil then
    radar_regionWarName:SetShow(false)
  else
    radar_regionWarName:SetShow(true)
    radar_regionWarName:SetText(nodeWarRegionName .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_VILLAGEWARABLE_NAME"))
    radar_regionWarName:SetSize(radar_regionWarName:GetTextSizeX() + 40, radar_regionWarName:GetSizeY() + 3)
    radar_regionWarName:ComputePos()
  end
end

registerEvent("FromClint_EventChangedExplorationNode", "NodeLevelRegionNameShow")
local _nightCheck = 0
local _nightAlertCheck = 0
RadarMap_UpdateTimePerFrame = function()
  -- function num : 0_36 , upvalues : dayCycle, RegionData_IngameTime, floor, radarTime, RegionData_RealIngameTime, _nightCheck, _nightAlertCheck, useLanternAlertTime
  local ingameTime = getIngameTime_variableSecondforLua()
  if ingameTime < 0 then
    return 
  end
  if dayCycle < ingameTime then
    ingameTime = ingameTime % dayCycle
  end
  if ingameTime ~= RegionData_IngameTime then
    RegionData_IngameTime = ingameTime
    local minute = floor(ingameTime / 60) % 60
    local hour = floor(ingameTime / 3600)
    local calcMinute = "00"
    if minute < 10 then
      calcMinute = "0" .. minute
    else
      calcMinute = tostring(minute)
    end
    local radarControl = radarTime.controls
    if hour == 12 then
      (radarControl.gameTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_TIME_AFTERNOON") .. " " .. tostring(hour) .. " : " .. calcMinute)
    else
      if hour == 0 then
        local calcHour = hour + 12
        ;
        (radarControl.gameTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_TIME_MORNING") .. " " .. tostring(calcHour) .. " : " .. calcMinute)
      else
        do
          if hour == 24 then
            local calcHour = hour
            ;
            (radarControl.gameTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_TIME_MORNING") .. " " .. "0" .. " : " .. calcMinute)
          else
            do
              if hour > 11 then
                local calcHour = hour - 12
                ;
                (radarControl.gameTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_TIME_AFTERNOON") .. " " .. tostring(calcHour) .. " : " .. calcMinute)
              else
                do
                  do
                    ;
                    (radarControl.gameTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_TIME_MORNING") .. " " .. tostring(hour) .. " : " .. calcMinute)
                    local radarTimeControl = radarTime.controls
                    local realInGameTime = getIngameTime_minute()
                    if RegionData_RealIngameTime ~= realInGameTime then
                      if realInGameTime > 1440 then
                        realInGameTime = realInGameTime % 1440
                      end
                      local minute = floor(realInGameTime % 60)
                      local hour = floor(realInGameTime / 60)
                      if hour == 22 and minute / 60 == 0 then
                        _nightCheck = 22
                        if _nightCheck ~= _nightAlertCheck then
                          Night_Alert(_nightCheck)
                          _nightAlertCheck = _nightCheck
                        end
                      end
                      if hour == 2 and minute / 60 == 0 then
                        _nightCheck = 2
                        if _nightCheck ~= _nightAlertCheck then
                          Night_Alert(_nightCheck)
                          _nightAlertCheck = _nightCheck
                        end
                      end
                      if hour > 21 or hour < 2 then
                        showUseLanternToolTip(true)
                      else
                        showUseLanternToolTip(false)
                        useLanternAlertTime = 0
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

showUseLanternToolTip = function(param)
  -- function num : 0_37 , upvalues : useLanternAlertTime
  local itemWrapper = getEquipmentItem(13)
  if itemWrapper == nil and param == true and useLanternAlertTime < 100 then
    FGlobal_ShowUseLantern(true)
    useLanternAlertTime = useLanternAlertTime + 1
  else
    FGlobal_ShowUseLantern(false)
  end
end

Panel_Rader_NightAlert:SetShow(false, false)
Panel_Rader_NightAlert:setMaskingChild(true)
Panel_Rader_NightAlert:RegisterShowEventFunc(true, "Rader_NightAlert_ShowAni()")
Panel_Rader_NightAlert:RegisterShowEventFunc(false, "Rader_NightAlert_HideAni()")
local Night_AlertPanel = (UI.getChildControl)(Panel_Rader_NightAlert, "Static_AlertPanel")
local Night_AlertText = (UI.getChildControl)(Panel_Rader_NightAlert, "StaticText_Alert_NoticeText")
Night_Alert = function(_nightCheck)
  -- function num : 0_38 , upvalues : Night_AlertText, UI_color, Night_AlertPanel
  local message = ""
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if isColorBlindMode == 0 then
    Night_AlertText:SetFontColor(UI_color.C_FFFF0000)
  else
    if isColorBlindMode == 1 then
      Night_AlertText:SetFontColor(UI_color.C_FF0096FF)
    else
      if isColorBlindMode == 2 then
        Night_AlertText:SetFontColor(UI_color.C_FF0096FF)
      end
    end
  end
  if _nightCheck == 22 then
    Night_AlertText:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_RADER_NIGHT_ALERT_TEXT1"))
  else
    if _nightCheck == 2 then
      Night_AlertText:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_RADER_NIGHT_ALERT_TEXT2"))
    else
      return 
    end
  end
  Panel_Rader_NightAlert:SetShow(true, true)
  Night_AlertPanel:SetShow(true)
end

local _cumulateTime = 0
Rader_NightAlert_Close = function(fDeltaTime)
  -- function num : 0_39 , upvalues : _cumulateTime
  _cumulateTime = _cumulateTime + fDeltaTime
  if _cumulateTime >= 9 then
    Panel_Rader_NightAlert:SetShow(false, true)
    _cumulateTime = 0
  end
end

Panel_Rader_NightAlert:RegisterUpdateFunc("Rader_NightAlert_Close")
Rader_NightAlert_ShowAni = function()
  -- function num : 0_40
  audioPostEvent_SystemUi(1, 9)
  ;
  (UIAni.fadeInSCR_MidOut)(Panel_Rader_NightAlert)
end

Rader_NightAlert_HideAni = function()
  -- function num : 0_41 , upvalues : UI_ANI_ADV, UI_color
  Panel_Rader_NightAlert:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo6 = Panel_Rader_NightAlert:addColorAnimation(0, 1.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo6:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo6:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo6.IsChangeChild = true
  aniInfo6:SetHideAtEnd(true)
  aniInfo6:SetDisableWhileAni(true)
end

local RadarMap_UpdateSelfPlayerPerFrame = function()
  -- function num : 0_42
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local selfPlayer = selfPlayerWrapper:get()
  if selfPlayer == nil then
    return 
  end
  local selfPlayerIcon = (radarMap.controls).icon_SelfPlayer
  if radarMap.isRotateMode == false then
    selfPlayerIcon:SetRotate(getCameraRotation())
  else
    Panel_Radar:SetRotate(-getCameraRotation() + math.pi)
  end
  local pcInfo = radarMap.pcInfo
  local selfPlayerPos = pcInfo.position
  selfPlayerPos.x = selfPlayer:getPositionX()
  selfPlayerPos.y = selfPlayer:getPositionY()
  selfPlayerPos.z = selfPlayer:getPositionZ()
  pcInfo.s64_teamNo = selfPlayerWrapper:getTeamNo_s64()
  ;
  ((radarMap.template).area_siegeAttackHit):SetShow(true)
end

FromClient_setSiegeAttackAreaPosition = function(position)
  -- function num : 0_43 , upvalues : _siegeAttackPosition, _OnSiegeRide
  _siegeAttackPosition = position
  _OnSiegeRide = true
end

local getPosBaseControl = function(actorPosition)
  -- function num : 0_44 , upvalues : sqrt
  local selfPlayerPos = (radarMap.pcInfo).position
  local selfPlayerControlPos = radarMap.pcPosBaseControl
  local dx = (actorPosition.x - selfPlayerPos.x) / 100
  local dz = (selfPlayerPos.z - actorPosition.z) / 100
  local distance = sqrt(dx * dx + dz * dz)
  local dxPerPixel = dx * radarMap.worldDistanceToPixelRate + selfPlayerControlPos.x
  do
    local dyPerPixel = dz * radarMap.worldDistanceToPixelRate + selfPlayerControlPos.y
    do return distance < (radarMap.config).mapRadius, dxPerPixel, dyPerPixel end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

local getPosQuestControl = function(areaQuest)
  -- function num : 0_45 , upvalues : sqrt
  local selfPlayerPos = (radarMap.pcInfo).position
  local selfPlayerControlPos = radarMap.pcPosBaseControl
  local dx = (areaQuest.x - selfPlayerPos.x) / 100
  local dz = (selfPlayerPos.z - areaQuest.z) / 100
  local distance = sqrt(dx * dx + dz * dz)
  local dxPerPixel = dx * radarMap.worldDistanceToPixelRate * 2 + selfPlayerControlPos.x
  do
    local dyPerPixel = dz * radarMap.worldDistanceToPixelRate * 2 + selfPlayerControlPos.y
    do return distance <= (radarMap.config).mapRadius + areaQuest.radius / 100, dxPerPixel, dyPerPixel end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

local RadarMap_DestoryQuestIcons = function()
  -- function num : 0_46
  for idx,areaQuest in pairs(radarMap.areaQuests) do
    if areaQuest ~= nil then
      (areaQuest.icon_QuestArea):SetShow(false)
      ;
      (areaQuest.icon_QuestArrow):SetShow(false)
      radarMap:returnQuestToPool(areaQuest)
    end
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  radarMap.areaQuests = {}
end

regeistTooltipInfo = function(index, isArrow)
  -- function num : 0_47
  if isArrow then
    registTooltipControl(((radarMap.areaQuests)[index]).icon_QuestArrow, Panel_QuestInfo)
  else
    registTooltipControl(((radarMap.areaQuests)[index]).icon_QuestArea, Panel_QuestInfo)
  end
end

QuestTooltipForHandle = function(index, controlIdx, IsArrow)
  -- function num : 0_48
  regeistTooltipInfo(controlIdx, IsArrow)
  ;
  (QuestInfoData.questDescShowWindowForLeft)(index)
  FGlobal_QuestTooltip_MouseIconOff()
end

Radar_UpdateQuestList = function()
  -- function num : 0_49 , upvalues : RadarMap_DestoryQuestIcons, floor, RadarMap_UpdatePixelRate
  RadarMap_DestoryQuestIcons()
  local questCount = questList_getCheckedProgressQuestCount()
  local controlCount = 1
  local pixelRate = radarMap.worldDistanceToPixelRate / 100 * 2
  for index = 1, questCount do
    local progressQuest = questList_getCheckedProgressQuestAt(index - 1)
    if progressQuest ~= nil then
      local questGroupId = (progressQuest:getQuestNo())._group
      local questId = (progressQuest:getQuestNo())._quest
      local questCondition = 0
      if progressQuest:isSatisfied() == true then
        questCondition = 0
      else
        questCondition = 1
      end
      local positionCount = progressQuest:getQuestPositionCount()
      if positionCount ~= 0 and not progressQuest:isSatisfied() then
        for posIndex = 1, positionCount do
          local questPosition = progressQuest:getQuestPositionAt(posIndex - 1)
          local areaQuest = radarMap:getIdleQuest()
          areaQuest.index = index - 1
          ;
          (areaQuest.icon_QuestArea):addInputEvent("Mouse_On", "QuestTooltipForHandle(" .. index - 1 .. ", " .. controlCount .. ", false)")
          ;
          (areaQuest.icon_QuestArea):addInputEvent("Mouse_Out", "QuestInfoData.questDescHideWindow()")
          ;
          (areaQuest.icon_QuestArea):addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget(" .. questGroupId .. ", " .. questId .. ", " .. questCondition .. ", false)")
          ;
          (areaQuest.icon_QuestArea):addInputEvent("Mouse_RUp", "RadarMap_Background_MouseRUp()")
          ;
          (areaQuest.icon_QuestArea):setTooltipEventRegistFunc("QuestTooltipForHandle(" .. index - 1 .. ", " .. controlCount .. ", false)")
          ;
          (areaQuest.icon_QuestArrow):addInputEvent("Mouse_On", "QuestTooltipForHandle(" .. index - 1 .. ", " .. controlCount .. ", true)")
          ;
          (areaQuest.icon_QuestArrow):addInputEvent("Mouse_Out", "QuestInfoData.questDescHideWindow()")
          ;
          (areaQuest.icon_QuestArrow):addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget(" .. questGroupId .. ", " .. questId .. ", " .. questCondition .. ", false)")
          ;
          (areaQuest.icon_QuestArrow):addInputEvent("Mouse_RUp", "RadarMap_Background_MouseRUp()")
          ;
          (areaQuest.icon_QuestArrow):setTooltipEventRegistFunc("QuestTooltipForHandle(" .. index - 1 .. ", " .. controlCount .. ", false)")
          areaQuest.x = (questPosition._position).x
          areaQuest.y = (questPosition._position).y
          areaQuest.z = (questPosition._position).z
          areaQuest.radius = questPosition._radius
          local size = floor(pixelRate * areaQuest.radius) * 2
          ;
          (areaQuest.icon_QuestArea):SetSize(size, size)
          ;
          (areaQuest.icon_QuestArea):SetParentRotCalc(radarMap.isRotateMode)
          -- DECOMPILER ERROR at PC162: Confused about usage of register: R19 in 'UnsetPending'

          ;
          (radarMap.areaQuests)[controlCount] = areaQuest
          controlCount = controlCount + 1
        end
      end
    end
  end
  for idx,areaQuest in pairs(radarMap.areaQuests) do
    if areaQuest ~= nil then
      Panel_Radar:SetChildIndex(areaQuest.icon_QuestArrow, 9998)
    end
  end
  for actorKeyRaw,_ in pairs(radarMap.actorIcons) do
    RadarMap_DestoryOtherActor(actorKeyRaw)
  end
  RadarMap_UpdatePixelRate()
end

RadarMap_UpdatePixelRate = function()
  -- function num : 0_50 , upvalues : floor
  for _,areaQuest in pairs(radarMap.areaQuests) do
    local size = floor(radarMap.worldDistanceToPixelRate * areaQuest.radius / 100 * 2)
    ;
    (areaQuest.icon_QuestArea):SetSize(size, size)
  end
end

local RadarMap_UpdateQuestAreaPositionPerFrame = function()
  -- function num : 0_51 , upvalues : getPosQuestControl, floor, QuestArrowHalfSize, sqrt
  local self = radarMap
  local enableHalfSize = 12
  local sizeX = Panel_Radar:GetSizeX()
  local sizeY = Panel_Radar:GetSizeY() * 0.9
  local camRot = getCameraRotation()
  local halfSizeX = Panel_Radar:GetSizeX() * 0.5
  local halfSizeY = Panel_Radar:GetSizeY() * 0.5
  local radarPosX = Panel_Radar:GetPosX()
  local radarPosY = Panel_Radar:GetPosY()
  local selfPlayerControlPos = radarMap.pcPosBaseControl
  local selfPlayerPos = (radarMap.pcInfo).position
  for _,areaQuest in pairs(self.areaQuests) do
    local questAreaIcon = areaQuest.icon_QuestArea
    local questArrowIcon = areaQuest.icon_QuestArrow
    local isShow, posX, posY = getPosQuestControl(areaQuest)
    if isShow then
      local areaSize = questAreaIcon:GetSizeX()
      local areaHalfSize = areaSize * 0.5
      local dist = posX - selfPlayerControlPos.x
      local disty = posY - selfPlayerControlPos.y
      local tempPos = float2(dist, disty)
      if radarMap.isRotateMode then
        tempPos:rotate(camRot + math.pi)
      end
      posX = posX - floor(areaHalfSize)
      posY = posY - floor(areaHalfSize)
      questAreaIcon:SetPosX(posX)
      questAreaIcon:SetPosY(posY)
      questAreaIcon:SetEnableArea(tempPos.x - dist, tempPos.y - disty, tempPos.x - dist + areaSize, tempPos.y - disty + areaSize)
      questAreaIcon:SetRectClip(float2(-(posX), -(posY)), float2(Panel_Radar:GetPosX() + sizeX - questAreaIcon:GetParentPosX(), Panel_Radar:GetPosY() + sizeY - questAreaIcon:GetPosY()))
    else
      do
        questArrowIcon:SetPosX((Panel_Radar:GetSizeX() - questArrowIcon:GetSizeX()) / 2)
        questArrowIcon:SetPosY((Panel_Radar:GetSizeY() - questArrowIcon:GetSizeY()) / 2)
        local dx = ((self.pcInfo).position).x - areaQuest.x
        local dy = ((self.pcInfo).position).z - areaQuest.z
        local radian = (math.atan2)(dx, dy)
        local arrowIconRotate = radian
        local arrowCalcRotate = -radian
        if radarMap.isRotateMode then
          arrowIconRotate = radian - camRot + math.pi
          arrowCalcRotate = -radian - camRot + math.pi
        end
        questArrowIcon:SetRotate(arrowIconRotate)
        questAreaIcon:SetParentRotCalc(radarMap.isRotateMode)
        do
          local tempPos = float2(0, QuestArrowHalfSize)
          tempPos:rotate(-(arrowIconRotate))
          questArrowIcon:SetEnableArea(QuestArrowHalfSize + tempPos.x - enableHalfSize, QuestArrowHalfSize + tempPos.y - enableHalfSize, QuestArrowHalfSize + tempPos.x + enableHalfSize, QuestArrowHalfSize + tempPos.y + enableHalfSize)
          local sizeX = Panel_Radar:GetSizeX() / 2
          local sizeY = Panel_Radar:GetSizeY() / 2
          local centerPosX = Panel_Radar:GetPosX() + sizeX - 5
          local centerPosY = Panel_Radar:GetPosY() + sizeY + 15
          local dx = getMousePosX() - centerPosX
          local dy = getMousePosY() - centerPosY
          local distance = sqrt(dx * dx + dy * dy)
          if distance < sizeX then
            questAreaIcon:SetIgnore(false)
            if isQuestDescShow then
              Panel_QuestInfo:SetShow(true, true)
            end
          else
            questAreaIcon:SetIgnore(true)
          end
          questAreaIcon:SetShow(isShow)
          questArrowIcon:SetShow(false)
          do
            if not isShow then
              local pos = float3(((self.pcInfo).position).x, ((self.pcInfo).position).y, ((self.pcInfo).position).z)
              if ToClient_IsViewSelfPlayer(pos) == true then
                questArrowIcon:SetShow(not isShow)
              end
            end
            -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end

RadarMap_DestoryOtherActor = function(actorKeyRaw)
  -- function num : 0_52
  local actorIcon = (radarMap.actorIcons)[actorKeyRaw]
  if actorIcon ~= nil then
    actorIcon:SetShow(false)
    radarMap:returnIconToPool(actorIcon)
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (radarMap.actorIcons)[actorKeyRaw] = nil
  end
end

Rader_ChangeTexture_On = function()
  -- function num : 0_53 , upvalues : raderText
  raderText:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_RADER_RADER") .. "-" .. PAGetString(Defines.StringSheet_GAME, "PANEL_RADER_MOVE_DRAG"))
end

Rader_ChangeTexture_Off = function()
  -- function num : 0_54 , upvalues : raderText
  raderText:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_RADER_RADER"))
end

Panel_Radar_ShowToggle = function()
  -- function num : 0_55
  local isShow = Panel_Radar:IsShow()
  if isShow then
    Panel_Radar:SetShow(false)
    RaderBackground_Hide()
  else
    Panel_Radar:SetShow(true)
    RaderBackground_Show()
  end
end

RadarMap_UpdateTerrainInfo = function()
  -- function num : 0_56 , upvalues : radarTime, textInfo
  local terraintype = selfPlayerNaviMaterial()
  local radarControl = (radarTime.controls).terrainInfo
  radarControl:ChangeTextureInfoName("new_ui_common_forlua/default/default_etc_01.dds")
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if terraintype == 0 then
    x1 = setTextureUV_Func(radarControl, 73, 170, 93, 190)
    textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_NORMAL")
  else
    -- DECOMPILER ERROR at PC41: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC42: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC43: Overwrote pending register: R3 in 'AssignReg'

    if terraintype == 1 then
      x1 = setTextureUV_Func(radarControl, 52, 170, 72, 190)
      textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_ROAD")
    else
      -- DECOMPILER ERROR at PC61: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC63: Overwrote pending register: R3 in 'AssignReg'

      if terraintype == 2 then
        x1 = setTextureUV_Func(radarControl, 108, 177, 128, 197)
        textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_SNOW")
      else
        -- DECOMPILER ERROR at PC81: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC82: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC83: Overwrote pending register: R3 in 'AssignReg'

        if terraintype == 3 then
          x1 = setTextureUV_Func(radarControl, 129, 177, 149, 197)
          textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_DESERT")
        else
          -- DECOMPILER ERROR at PC101: Overwrote pending register: R5 in 'AssignReg'

          -- DECOMPILER ERROR at PC102: Overwrote pending register: R4 in 'AssignReg'

          -- DECOMPILER ERROR at PC103: Overwrote pending register: R3 in 'AssignReg'

          if terraintype == 4 then
            x1 = setTextureUV_Func(radarControl, 150, 177, 170, 197)
            textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_SWAMP")
          else
            -- DECOMPILER ERROR at PC121: Overwrote pending register: R5 in 'AssignReg'

            -- DECOMPILER ERROR at PC122: Overwrote pending register: R4 in 'AssignReg'

            -- DECOMPILER ERROR at PC123: Overwrote pending register: R3 in 'AssignReg'

            if terraintype == 5 then
              x1 = setTextureUV_Func(radarControl, 73, 170, 93, 190)
              textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_OBJECT")
            else
              -- DECOMPILER ERROR at PC141: Overwrote pending register: R5 in 'AssignReg'

              -- DECOMPILER ERROR at PC142: Overwrote pending register: R4 in 'AssignReg'

              -- DECOMPILER ERROR at PC143: Overwrote pending register: R3 in 'AssignReg'

              if terraintype == 6 then
                x1 = setTextureUV_Func(radarControl, 171, 177, 191, 197)
                textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_WATER")
              else
                -- DECOMPILER ERROR at PC161: Overwrote pending register: R5 in 'AssignReg'

                -- DECOMPILER ERROR at PC162: Overwrote pending register: R4 in 'AssignReg'

                -- DECOMPILER ERROR at PC163: Overwrote pending register: R3 in 'AssignReg'

                if terraintype == 7 then
                  x1 = setTextureUV_Func(radarControl, 73, 170, 93, 190)
                  textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_GRASS")
                else
                  -- DECOMPILER ERROR at PC181: Overwrote pending register: R5 in 'AssignReg'

                  -- DECOMPILER ERROR at PC182: Overwrote pending register: R4 in 'AssignReg'

                  -- DECOMPILER ERROR at PC183: Overwrote pending register: R3 in 'AssignReg'

                  if terraintype == 8 then
                    x1 = setTextureUV_Func(radarControl, 171, 156, 191, 176)
                    textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_DEEPWATER")
                  else
                    -- DECOMPILER ERROR at PC201: Overwrote pending register: R5 in 'AssignReg'

                    -- DECOMPILER ERROR at PC202: Overwrote pending register: R4 in 'AssignReg'

                    -- DECOMPILER ERROR at PC203: Overwrote pending register: R3 in 'AssignReg'

                    if terraintype == 9 then
                      x1 = setTextureUV_Func(radarControl, 171, 135, 191, 155)
                      textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_AIR")
                    else
                      if getSelfPlayer() ~= nil then
                        return 
                      end
                      local isOcean = ((getSelfPlayer()):getCurrentRegionInfo()):isOcean()
                      -- DECOMPILER ERROR at PC232: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC233: Overwrote pending register: R4 in 'AssignReg'

                      -- DECOMPILER ERROR at PC234: Overwrote pending register: R3 in 'AssignReg'

                      if isOcean then
                        x1 = setTextureUV_Func(radarControl, 171, 177, 191, 197)
                        textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_OCEAN")
                      else
                        -- DECOMPILER ERROR at PC250: Overwrote pending register: R5 in 'AssignReg'

                        -- DECOMPILER ERROR at PC251: Overwrote pending register: R4 in 'AssignReg'

                        -- DECOMPILER ERROR at PC252: Overwrote pending register: R3 in 'AssignReg'

                        x1 = setTextureUV_Func(radarControl, 73, 170, 93, 190)
                        textInfo = PAGetString(Defines.StringSheet_GAME, "LUA_RADAR_TERRAININFO_NORMAL")
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
  do
    ;
    (radarControl:getBaseTexture()):setUV(x1, y1, x2, y2)
    radarControl:setRenderTexture(radarControl:getBaseTexture())
  end
end

local _isSiegeArea = false
local buildingType = ""
RadarMap_UpdatePosition = function()
  -- function num : 0_57 , upvalues : radarTime, weatherTooltip, UI_RT, buildingTooltip, buildingType, _isSiegeArea, siegeTooltip, radar_regionName, radar_regionNodeName
  if Panel_TimeBar:GetShow() == false then
    return 
  end
  local radarTimeControl = radarTime.controls
  local gapX = 15
  local regionNameSpanY = 0
  local posX = (radarTimeControl.gameTime):GetTextSizeX() + gapX
  ;
  (radarTimeControl.channelName):SetSpanSize(posX - 3, regionNameSpanY)
  posX = posX + (radarTimeControl.channelName):GetTextSizeX()
  ;
  (radarTimeControl.serverName):SetSpanSize(posX, regionNameSpanY)
  ;
  (radarTimeControl.terrainInfo):ComputePos()
  posX = (radarTimeControl.terrainInfo):GetSizeX() + 5
  local iconSize = 20
  ;
  (radarTimeControl.raining):ChangeTextureInfoName("new_ui_common_forlua/widget/rader/minimap_00.dds")
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if getWeatherInfoBySelfPos((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_RAIN_AMOUNT) > 0 then
    if getWeatherInfoBySelfPos((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_CELSIUS) < 0 then
      weatherTooltip = 2
      x1 = setTextureUV_Func(radarTimeControl.raining, 78, 206, 98, 226)
    else
      weatherTooltip = 0
      -- DECOMPILER ERROR at PC81: Overwrote pending register: R8 in 'AssignReg'

      -- DECOMPILER ERROR at PC82: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC83: Overwrote pending register: R6 in 'AssignReg'

      x1 = setTextureUV_Func(radarTimeControl.raining, 43, 133, 62, 152)
    end
  else
    weatherTooltip = 1
    -- DECOMPILER ERROR at PC95: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC96: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC97: Overwrote pending register: R6 in 'AssignReg'

    x1 = setTextureUV_Func(radarTimeControl.raining, 171, 187, 188, 205)
  end
  ;
  ((radarTimeControl.raining):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (radarTimeControl.raining):setRenderTexture((radarTimeControl.raining):getBaseTexture())
  ;
  (radarTimeControl.raining):SetShow(true)
  ;
  (radarTimeControl.raining):SetSpanSize(posX, regionNameSpanY + 1)
  posX = posX + iconSize
  ;
  (radarTimeControl.VillageWar):SetShow(true)
  ;
  (radarTimeControl.VillageWar):SetSpanSize(posX, regionNameSpanY + 1)
  posX = posX + iconSize
  ;
  (radarTimeControl.citadel):ChangeTextureInfoName("new_ui_common_forlua/window/guild/guild_00.dds")
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if UI_RT.eRegionType_Fortress == radarMap.regionTypeValue then
    buildingTooltip = 1
    x1 = setTextureUV_Func(radarTimeControl.siegeArea, 291, 31, 311, 51)
  else
    if UI_RT.eRegionType_Siege == radarMap.regionTypeValue then
      buildingTooltip = 2
      -- DECOMPILER ERROR at PC177: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC178: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC179: Overwrote pending register: R10 in 'AssignReg'

      x1 = setTextureUV_Func(radarTimeControl.siegeArea, 291, 31, 311, 51)
    else
      buildingTooltip = 0
      -- DECOMPILER ERROR at PC191: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC192: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC193: Overwrote pending register: R10 in 'AssignReg'

      x1 = setTextureUV_Func(radarTimeControl.siegeArea, 312, 31, 332, 51)
    end
  end
  ;
  ((radarTimeControl.citadel):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (radarTimeControl.citadel):setRenderTexture((radarTimeControl.citadel):getBaseTexture())
  ;
  (radarTimeControl.citadel):SetShow(true)
  ;
  (radarTimeControl.citadel):SetSpanSize(posX, regionNameSpanY + 1)
  posX = posX + iconSize
  local CheckSiegeArea = function(installType)
    -- function num : 0_57_0 , upvalues : radarTime, UI_RT, buildingType, _isSiegeArea, siegeTooltip, posX, regionNameSpanY
    local x1, y1, x2, y2 = 0, 0, 0, 0
    local radarTimeControl = radarTime.controls
    ;
    (radarTimeControl.siegeArea):ChangeTextureInfoName("new_ui_common_forlua/window/guild/guild_00.dds")
    local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
    local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
    if UI_RT.eRegionType_Fortress == installType and selfPlayerCurrentSiegeCanInstall() == true then
      buildingType = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_BULDINGTYPE_FORTRESS")
      if _isSiegeArea == false then
        _isSiegeArea = true
        local msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RADER_BULDIN_POSSIBLE", "buildingType", buildingType), sub = ""}
        if isGuildMaster == true or isGuildSubMaster == true then
          Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.3, 20)
        end
      end
      do
        x1 = setTextureUV_Func(radarTimeControl.citadel, 166, 1, 186, 21)
        siegeTooltip = 0
        if UI_RT.eRegionType_Siege == installType and selfPlayerCurrentSiegeCanInstall() == true then
          buildingType = PAGetString(Defines.StringSheet_GAME, "LUA_RADER_BULDINGTYPE_SIEGE")
          if _isSiegeArea == false then
            _isSiegeArea = true
            local msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RADER_BULDIN_POSSIBLE", "buildingType", buildingType), sub = ""}
            if isGuildMaster == true or isGuildSubMaster == true then
              Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.3, 20)
            end
          end
          do
            -- DECOMPILER ERROR at PC119: Overwrote pending register: R4 in 'AssignReg'

            -- DECOMPILER ERROR at PC120: Overwrote pending register: R3 in 'AssignReg'

            -- DECOMPILER ERROR at PC121: Overwrote pending register: R2 in 'AssignReg'

            x1 = setTextureUV_Func(radarTimeControl.citadel, 187, 1, 207, 21)
            siegeTooltip = 1
            if _isSiegeArea == true then
              _isSiegeArea = false
              local msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RADER_BULDIN_IMPOSSIBLE", "buildingType", buildingType), sub = ""}
              if isGuildMaster == true or isGuildSubMaster == true then
                Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.3, 21)
              end
            end
            do
              -- DECOMPILER ERROR at PC157: Overwrote pending register: R4 in 'AssignReg'

              -- DECOMPILER ERROR at PC158: Overwrote pending register: R3 in 'AssignReg'

              -- DECOMPILER ERROR at PC159: Overwrote pending register: R2 in 'AssignReg'

              x1 = setTextureUV_Func(radarTimeControl.citadel, 249, 31, 269, 51)
              siegeTooltip = 2
              ;
              ((radarTimeControl.siegeArea):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (radarTimeControl.siegeArea):setRenderTexture((radarTimeControl.siegeArea):getBaseTexture())
              ;
              (radarTimeControl.siegeArea):SetShow(true)
              ;
              (radarTimeControl.siegeArea):SetSpanSize(posX, regionNameSpanY + 1)
            end
          end
        end
      end
    end
  end

  ;
  (radarTimeControl.commandCenter):SetShow(false)
  CheckSiegeArea(radarMap.regionTypeValue)
  Panel_TimeBar:SetSize(295, 22)
  Panel_TimeBar:ComputePos()
  ;
  (radarTimeControl.gameTime):ComputePos()
  ;
  (radarTimeControl.channelName):ComputePos()
  ;
  (radarTimeControl.serverName):ComputePos()
  ;
  (radarTimeControl.terrainInfo):ComputePos()
  ;
  (radarTimeControl.raining):ComputePos()
  ;
  (radarTimeControl.citadel):ComputePos()
  ;
  (radarTimeControl.citadel):SetShow(false)
  ;
  (radarTimeControl.siegeArea):SetPosX((radarTimeControl.citadel):GetPosX())
  ;
  (radarTimeControl.VillageWar):ComputePos()
  ;
  (radarTimeControl.commandCenter):ComputePos()
  radar_regionName:ComputePos()
  radar_regionNodeName:ComputePos()
end

RadarMap_UpdatePosition()
RadarMap_MouseOnOffAnimation = function(deltaTime)
  -- function num : 0_58 , upvalues : simpleUIAlpha, radar_SizeSlider, radar_SizeBtn, radar_AlphaScrl, radar_AlphaBtn, radar_MiniMapScl
  local isUiMode = (CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode == getInputMode() or (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode == getInputMode()
  do
    local IsMouseOver = Panel_Radar:GetPosX() - 20 < getMousePosX() and getMousePosX() < Panel_Radar:GetPosX() + Panel_Radar:GetSizeX() + 20 and Panel_Radar:GetPosY() - 20 < getMousePosY() and getMousePosY() < Panel_Radar:GetPosY() + Panel_Radar:GetSizeY() + 20
    if IsMouseOver and isUiMode then
      simpleUIAlpha = 1
    else
      simpleUIAlpha = 0
    end
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).timeNum, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_Plus, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_Minus, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_AlphaPlus, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_AlphaMinus, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_Reset, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_SizeSlider, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_SizeBtn, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_AlphaScrl, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_AlphaBtn, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_MiniMapScl, 5 * deltaTime)
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

local iconPartyMemberArrow = {}
local partyMemberArrowIcon = function(index, isShow)
  -- function num : 0_59 , upvalues : iconPartyMemberArrow
  if iconPartyMemberArrow[index] == nil then
    if isShow == false then
      return 
    end
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

    iconPartyMemberArrow[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Static_PartyMemberArrow_" .. index)
    CopyBaseProperty((radarMap.template).area_quest_guideArrow, iconPartyMemberArrow[index])
    ;
    (iconPartyMemberArrow[index]):SetColor((Defines.Color).C_FF00C0D7)
    ;
    (iconPartyMemberArrow[index]):SetEnable(true)
    ;
    (iconPartyMemberArrow[index]):SetIgnore(true)
    Panel_Radar:SetChildIndex(iconPartyMemberArrow[index], 9999)
  end
  ;
  (iconPartyMemberArrow[index]):SetShow(isShow)
  if isShow == true then
    (iconPartyMemberArrow[index]):SetPosX((radarMap.pcPosBaseControl).x - (iconPartyMemberArrow[index]):GetSizeX() / 2)
    ;
    (iconPartyMemberArrow[index]):SetPosY((radarMap.pcPosBaseControl).y - (iconPartyMemberArrow[index]):GetSizeY() / 2)
    ;
    (iconPartyMemberArrow[index]):SetSize(((radarMap.template).area_quest_guideArrow):GetSizeX(), ((radarMap.template).area_quest_guideArrow):GetSizeY())
    local memberData = RequestParty_getPartyMemberAt(index)
    local dx = ((radarMap.pcInfo).position).x - memberData:getPositionX()
    local dy = ((radarMap.pcInfo).position).z - memberData:getPositionZ()
    local radian = (math.atan2)(dx, dy)
    ;
    (iconPartyMemberArrow[index]):SetRotate(radian)
    Panel_Radar:SetChildIndex(iconPartyMemberArrow[index], 9999)
  end
end

local partyMemberIconPerFrame = function()
  -- function num : 0_60 , upvalues : partyMemberArrowIcon
  local partyMemberCount = FGlobal_PartyMemberCount()
  for i = 0, 4 do
    partyMemberArrowIcon(i, false)
  end
  do
    if partyMemberCount <= 0 or Panel_Party:GetShow() == false then
      return 
    end
    for index = 0, partyMemberCount - 1 do
      local memberData = RequestParty_getPartyMemberAt(index)
      if memberData ~= nil then
        local isNearPartyMember = getPlayerActor(memberData:getActorKey())
        if isNearPartyMember == nil then
          partyMemberArrowIcon(index, true)
        else
          partyMemberArrowIcon(index, false)
        end
      else
        do
          do
            partyMemberArrowIcon(index, false)
            -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end

local getPosBaseControl2 = function(actorPosition)
  -- function num : 0_61 , upvalues : sqrt
  local selfPlayerPos = (radarMap.pcInfo).position
  local selfPlayerControlPos = radarMap.pcPosBaseControl
  local dx = (actorPosition.x - selfPlayerPos.x) / 100
  local dz = (selfPlayerPos.z - actorPosition.z) / 100
  local distance = sqrt(dx * dx + dz * dz) * 2
  local dxPerPixel = dx * radarMap.worldDistanceToPixelRate * 2 + selfPlayerControlPos.x
  do
    local dyPerPixel = dz * radarMap.worldDistanceToPixelRate * 2 + selfPlayerControlPos.y
    do return distance < (radarMap.config).mapRadius, dxPerPixel, dyPerPixel end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

RadarMap_UpdateSelfPlayerNavigationGuide = function()
  -- function num : 0_62 , upvalues : getPosBaseControl2
  local color = float4(1, 0.8, 0.6, 1)
  local colorBG = float4(0.6, 0.2, 0.2, 0.3)
  ;
  ((radarMap.controls).rader_Background):ClearShowAALineList()
  local pathSize = ToClient_getRenderPathSize()
  for ii = 0, pathSize - 1 do
    local pathPosition = ToClient_getRenderPathByIndex(ii)
    local isShow, posX, posY = getPosBaseControl2(pathPosition)
    ;
    ((radarMap.controls).rader_Background):AddShowAALineList(float3(posX, posY, 0))
  end
  ;
  ((radarMap.controls).rader_Background):SetColorShowAALineList(color)
  ;
  ((radarMap.controls).rader_Background):SetBGColorShowAALineList(colorBG)
end

local whaleTimeCheck = 0
local chattingAlertTimeCheck = 60
local strongMonsterCheckDistance = 3500
RadarMap_UpdatePerFrame = function(deltaTime)
  -- function num : 0_63 , upvalues : RadarMap_UpdateSelfPlayerPerFrame, RadarMap_UpdateQuestAreaPositionPerFrame, partyMemberIconPerFrame, whaleTimeCheck, _OnSiegeRide, strongMonsterCheckDistance, chattingAlertTimeCheck, redar_DangerAletText, radar_DangetAlertBg
  RadarMap_UpdateSelfPlayerPerFrame()
  RadarMap_UpdateSelfPlayerNavigationGuide()
  RadarMap_UpdateQuestAreaPositionPerFrame()
  RadarMap_UpdateTerrainInfo()
  RadarMap_MouseOnOffAnimation(deltaTime)
  RadarMap_UpdateSiegeAttackArea()
  local SPI = (radarMap.controls).icon_SelfPlayer
  local halfSelfSizeX = SPI:GetSizeX() / 2
  local halfSelfSizeY = SPI:GetSizeY() / 2
  local halfSizeX = Panel_Radar:GetSizeX() / 2
  local halfSizeY = Panel_Radar:GetSizeY() / 2
  SPI:SetPosX(halfSizeX - halfSelfSizeX)
  SPI:SetPosY(halfSizeY - halfSelfSizeY)
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (radarMap.pcPosBaseControl).x = SPI:GetPosX() + halfSelfSizeX
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (radarMap.pcPosBaseControl).y = SPI:GetPosY() + halfSelfSizeY
  ToClient_setRadorUICenterPosition(int2((radarMap.pcPosBaseControl).x, (radarMap.pcPosBaseControl).y))
  ToClient_SetRadarCenterPos(float2((radarMap.pcPosBaseControl).x, (radarMap.pcPosBaseControl).y))
  FGlobal_UpdateRadarPin()
  RaderBackground_updatePerFrame(deltaTime)
  partyMemberIconPerFrame()
  whaleTimeCheck = whaleTimeCheck + deltaTime
  if whaleTimeCheck > 30 then
    whaleTimeCheck = 0
    FGlobal_WhaleConditionCheck()
    FGlobal_TerritoryWar_Caution()
    FGlobal_SummonPartyCheck()
    FGlobal_ReturnStoneCheck()
  end
  _OnSiegeRide = false
  if ToClient_GetState_EnemyOnMyBoatAlert() then
    FGlobal_EnemyAlert_OnShip_Show()
  end
  if not ToClient_GetMessageFilter(10) then
    StrongMonsterByNear(deltaTime)
    if FromClient_DetectsOfStrongMonster(strongMonsterCheckDistance) then
      chattingAlertTimeCheck = chattingAlertTimeCheck + deltaTime
      if chattingAlertTimeCheck > 60 then
        chattingAlertTimeCheck = 0
        chatting_sendMessage("", PAGetString(Defines.StringSheet_GAME, "LUA_RADER_NEARMONSTER_CHATALERT"), (CppEnums.ChatType).System)
      end
    end
  else
    redar_DangerAletText:SetShow(false)
    radar_DangetAlertBg:SetShow(false)
  end
end

TimeBar_UpdatePerFrame = function(deltaTime)
  -- function num : 0_64
  RadarMap_UpdateTimePerFrame()
  RadarMap_UpdatePosition()
end

FGlobal_ChattingAlert_Call = function()
  -- function num : 0_65
end

local textAniTime = 0
local isAnimation = false
StrongMonsterByNear = function(deltaTime)
  -- function num : 0_66 , upvalues : textAniTime, strongMonsterCheckDistance, isAnimation, currentSafeZone, redar_DangerAletText, radar_DangetAlertBg
  textAniTime = textAniTime + deltaTime
  if FromClient_DetectsOfStrongMonster(strongMonsterCheckDistance) then
    local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    local isSafeZone = (regionInfo:get()):isSafeZone()
    if textAniTime < 2 and isAnimation == false and not currentSafeZone then
      redar_DangerAletText:SetShow(true)
      local aniInfo = (UIAni.AlphaAnimation)(1, redar_DangerAletText, 0, 0.4)
      isAnimation = true
    else
      do
        if textAniTime > 2 and textAniTime < 5 and isAnimation then
          local aniInfo = (UIAni.AlphaAnimation)(0, redar_DangerAletText, 0, 0.4)
          aniInfo:SetHideAtEnd(true)
          isAnimation = false
        else
          do
            do
              if textAniTime > 5 then
                textAniTime = 0
              end
              if not radar_DangetAlertBg:GetShow() and not currentSafeZone then
                radar_DangetAlertBg:SetShow(true)
              end
              redar_DangerAletText:SetShow(false)
              radar_DangetAlertBg:SetShow(false)
            end
          end
        end
      end
    end
  end
end

RadarMap_UpdateSiegeAttackArea = function()
  -- function num : 0_67 , upvalues : _OnSiegeRide, _siegeAttackPosition, floor, _const_siegeAttackHitArea
  if _OnSiegeRide == false or _OnSiegeRide == true then
    ((radarMap.template).area_siegeAttackHit):SetShow(false)
    return 
  end
  local position = _siegeAttackPosition
  local hitArea = (radarMap.template).area_siegeAttackHit
  local selfPlayerPos = (radarMap.pcInfo).position
  local selfPlayerControlPos = radarMap.pcPosBaseControl
  local dx = (position.x - selfPlayerPos.x) / 100
  local dz = (selfPlayerPos.z - position.z) / 100
  local dxPerPixel = dx * radarMap.worldDistanceToPixelRate * 2 + selfPlayerControlPos.x
  local dyPerPixel = dz * radarMap.worldDistanceToPixelRate * 2 + selfPlayerControlPos.y
  local areaSize = hitArea:GetSizeX()
  local areaHalfSize = areaSize * 0.5
  local posX = dxPerPixel - floor(areaHalfSize)
  local posY = dyPerPixel - floor(areaHalfSize)
  local currentRate = RaderMap_GetDistanceToPixelRate()
  _const_siegeAttackHitArea = (math.floor)(currentRate * 48)
  hitArea:SetSize(_const_siegeAttackHitArea, _const_siegeAttackHitArea)
  hitArea:SetPosX(posX)
  hitArea:SetPosY(posY)
  hitArea:SetDepth(-2)
  hitArea:SetParentRotCalc(radarMap.isRotateMode)
end

RadarMap_SimpleUIUpdatePerFrame = function(deltaTime)
  -- function num : 0_68 , upvalues : simpleUIAlpha, radar_SizeSlider, radar_SizeBtn, radar_AlphaScrl, radar_AlphaBtn, radar_MiniMapScl
  local isUiMode = (CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode == getInputMode() or (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode == getInputMode()
  do
    local IsMouseOver = Panel_Radar:GetPosX() - 20 < getMousePosX() and getMousePosX() < Panel_Radar:GetPosX() + Panel_Radar:GetSizeX() + 20 and Panel_Radar:GetPosY() - 20 < getMousePosY() and getMousePosY() < Panel_Radar:GetPosY() + Panel_Radar:GetSizeY() + 20
    if isUiMode then
      isUiMode = IsMouseOver
    end
    if IsMouseOver then
      simpleUIAlpha = 1
    end
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).timeNum, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_Plus, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_Minus, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_AlphaPlus, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_AlphaMinus, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, (radarMap.controls).rader_Reset, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_SizeSlider, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_SizeBtn, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_AlphaScrl, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_AlphaBtn, 5 * deltaTime)
    ;
    (UIAni.perFrameAlphaAnimation)(simpleUIAlpha, radar_MiniMapScl, 5 * deltaTime)
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

registerEvent("SimpleUI_UpdatePerFrame", "RadarMap_SimpleUIUpdatePerFrame")
registerEvent("FromClient_setSiegeAttackAreaPosition", "FromClient_setSiegeAttackAreaPosition")
RaderMap_GetDistanceToPixelRate = function()
  -- function num : 0_69
  return radarMap.worldDistanceToPixelRate
end

RaderMap_GetSelfPosInRader = function()
  -- function num : 0_70
  return radarMap.pcPosBaseControl
end

RadarMap_GetScaleRateWidth = function()
  -- function num : 0_71
  return radarMap.scaleRateWidth
end

RadarMap_GetScaleRateHeight = function()
  -- function num : 0_72
  return radarMap.scaleRateHeight
end

HandleClicked_RadarResize = function()
  -- function num : 0_73
  ToClient_SaveUiInfo(false)
end

checkLoad()
controlInit()
Radar_UpdateQuestList()
registerEvent("selfPlayer_regionChanged", "RadarMap_updateRegion")
registerEvent("EventActorDelete", "RadarMap_DestoryOtherActor")
registerEvent("EventQuestListChanged", "Radar_UpdateQuestList")
registerEvent("FromClient_UpdateQuestList", "Radar_UpdateQuestList")
Panel_Radar:addInputEvent("Mouse_On", "Rader_ChangeTexture_On()")
Panel_Radar:addInputEvent("Mouse_Out", "Rader_ChangeTexture_Off()")
Panel_Radar:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
RadarMap_EnableSimpleUI_Force_Over = function()
  -- function num : 0_74
  RadarMap_EnableSimpleUI(true)
end

RadarMap_EnableSimpleUI_Force_Out = function()
  -- function num : 0_75
  RadarMap_EnableSimpleUI(false)
end

registerEvent("EventSimpleUIEnable", "RadarMap_EnableSimpleUI_Force_Over")
registerEvent("EventSimpleUIDisable", "RadarMap_EnableSimpleUI_Force_Out")
RadarMap_EnableSimpleUI = function(isEnable)
  -- function num : 0_76 , upvalues : cacheSimpleUI_ShowButton
  cacheSimpleUI_ShowButton = true
end

if getEnableSimpleUI() then
  RadarMap_SetDragMode = function(isSet)
  -- function num : 0_77 , upvalues : isDrag
  isDrag = isSet
end

  resetRadorActorListRotateValue = function()
  -- function num : 0_78 , upvalues : typeDepth
  local actorList = nil
  for Key,value in pairs(typeDepth) do
    actorList = FromClient_getRadarIconList(Key)
    for key,control in pairs(actorList) do
      control:SetRotate(0)
    end
  end
end

  FGlobal_Rador_SetColorBlindMode = function()
  -- function num : 0_79 , upvalues : colorBlindNone, colorBlindRed, colorBlindGreen
  local ActorIconList = nil
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if isColorBlindMode == 0 then
    for key,value in pairs(colorBlindNone) do
      ActorIconList = FromClient_getRadarIconList(key)
      for key,control in pairs(ActorIconList) do
        control:SetColor(value)
      end
    end
  else
    do
      if isColorBlindMode == 1 then
        for key,value in pairs(colorBlindRed) do
          ActorIconList = FromClient_getRadarIconList(key)
          for key,control in pairs(ActorIconList) do
            control:SetColor(value)
          end
        end
      else
        do
          if isColorBlindMode == 2 then
            for key,value in pairs(colorBlindGreen) do
              ActorIconList = FromClient_getRadarIconList(key)
              for key,control in pairs(ActorIconList) do
                control:SetColor(value)
              end
            end
          end
        end
      end
    end
  end
end

  FromClient_RadorUICreated = function(actorKeyRaw, control, actorProxyWrapper, radorTypeValue)
  -- function num : 0_80 , upvalues : template, radorType, UI_color, typeDepth
  control:SetSize(10, 10)
  local base = template[radorTypeValue]
  local isColorBlindType = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if base ~= nil then
    CopyBaseProperty(base, control)
    control:SetShow(true)
    if isColorBlindType == 0 then
      if radorType.radorType_allymonster == radorTypeValue then
        control:SetColor(UI_color.C_FFB22300)
      else
        if radorType.radorType_normalMonster == radorTypeValue then
          control:SetColor(UI_color.C_FFB22300)
        else
          if radorType.radorType_namedMonster == radorTypeValue then
            control:SetColor(UI_color.C_FFB22300)
          else
            if radorType.radorType_bossMonster == radorTypeValue then
              control:SetColor(UI_color.C_FFB22300)
            else
              if radorType.radorType_huntingMonster == radorTypeValue then
                control:SetColor(UI_color.C_FFB22300)
              else
                if radorType.radorType_normalMonsterQuestTarget == radorTypeValue then
                  control:SetColor(UI_color.C_FFEE9900)
                else
                  if radorType.radorType_namedMonsterQuestTarget == radorTypeValue then
                    control:SetColor(UI_color.C_FFEE9900)
                  else
                    if radorType.radorType_bossMonsterQuestTarget == radorTypeValue then
                      control:SetColor(UI_color.C_FFEE9900)
                    else
                      if radorType.radorType_huntingMonsterQuestTarget == radorTypeValue then
                        control:SetColor(UI_color.C_FFEE9900)
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
      if isColorBlindType == 1 then
        if radorType.radorType_allymonster == radorTypeValue then
          control:SetColor(UI_color.C_FFD85300)
        else
          if radorType.radorType_normalMonster == radorTypeValue then
            control:SetColor(UI_color.C_FFD85300)
          else
            if radorType.radorType_namedMonster == radorTypeValue then
              control:SetColor(UI_color.C_FFD85300)
            else
              if radorType.radorType_bossMonster == radorTypeValue then
                control:SetColor(UI_color.C_FFD85300)
              else
                if radorType.radorType_huntingMonster == radorTypeValue then
                  control:SetColor(UI_color.C_FFD85300)
                else
                  if radorType.radorType_normalMonsterQuestTarget == radorTypeValue then
                    control:SetColor(UI_color.C_FFFFE866)
                  else
                    if radorType.radorType_namedMonsterQuestTarget == radorTypeValue then
                      control:SetColor(UI_color.C_FFFFE866)
                    else
                      if radorType.radorType_bossMonsterQuestTarget == radorTypeValue then
                        control:SetColor(UI_color.C_FFFFE866)
                      else
                        if radorType.radorType_huntingMonsterQuestTarget == radorTypeValue then
                          control:SetColor(UI_color.C_FFFFE866)
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
        if isColorBlindType == 2 then
          if radorType.radorType_allymonster == radorTypeValue then
            control:SetColor(UI_color.C_FFD82800)
          else
            if radorType.radorType_normalMonster == radorTypeValue then
              control:SetColor(UI_color.C_FFD82800)
            else
              if radorType.radorType_namedMonster == radorTypeValue then
                control:SetColor(UI_color.C_FFD82800)
              else
                if radorType.radorType_bossMonster == radorTypeValue then
                  control:SetColor(UI_color.C_FFD82800)
                else
                  if radorType.radorType_huntingMonster == radorTypeValue then
                    control:SetColor(UI_color.C_FFD82800)
                  else
                    if radorType.radorType_normalMonsterQuestTarget == radorTypeValue then
                      control:SetColor(UI_color.C_FFFFE866)
                    else
                      if radorType.radorType_namedMonsterQuestTarget == radorTypeValue then
                        control:SetColor(UI_color.C_FFFFE866)
                      else
                        if radorType.radorType_bossMonsterQuestTarget == radorTypeValue then
                          control:SetColor(UI_color.C_FFFFE866)
                        else
                          if radorType.radorType_huntingMonsterQuestTarget == radorTypeValue then
                            control:SetColor(UI_color.C_FFFFE866)
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
    control:SetShow(false)
  end
  monsterTitle = nil
  SortRador_IconIndex()
  ToClient_setRadorUICenterPosition(int2((radarMap.pcPosBaseControl).x, (radarMap.pcPosBaseControl).y))
  control:SetDepth(typeDepth[radorTypeValue])
  control:addInputEvent("Mouse_RUp", "RadarMap_Background_MouseRUp()")
end

  FromClient_RadorTypeChanged = function(actorKeyRaw, targetUI, radorTypeValue)
  -- function num : 0_81 , upvalues : template, radorType, UI_color, typeDepth
  local templateUI = template[radorTypeValue]
  if templateUI == nil then
    targetUI:SetShow(false)
    return 
  end
  CopyBaseProperty(templateUI, targetUI)
  local isColorBlindType = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if isColorBlindType == 0 then
    if radorType.radorType_allymonster == radorTypeValue then
      targetUI:SetColor(UI_color.C_FFB22300)
    else
      if radorType.radorType_normalMonster == radorTypeValue then
        targetUI:SetColor(UI_color.C_FFB22300)
      else
        if radorType.radorType_namedMonster == radorTypeValue then
          targetUI:SetColor(UI_color.C_FFB22300)
        else
          if radorType.radorType_bossMonster == radorTypeValue then
            targetUI:SetColor(UI_color.C_FFB22300)
          else
            if radorType.radorType_huntingMonster == radorTypeValue then
              targetUI:SetColor(UI_color.C_FFB22300)
            else
              if radorType.radorType_normalMonsterQuestTarget == radorTypeValue then
                targetUI:SetColor(UI_color.C_FFEE9900)
              else
                if radorType.radorType_namedMonsterQuestTarget == radorTypeValue then
                  targetUI:SetColor(UI_color.C_FFEE9900)
                else
                  if radorType.radorType_bossMonsterQuestTarget == radorTypeValue then
                    targetUI:SetColor(UI_color.C_FFEE9900)
                  else
                    if radorType.radorType_huntingMonsterQuestTarget == radorTypeValue then
                      targetUI:SetColor(UI_color.C_FFEE9900)
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
    if isColorBlindType == 1 then
      if radorType.radorType_allymonster == radorTypeValue then
        targetUI:SetColor(UI_color.C_FFD85300)
      else
        if radorType.radorType_normalMonster == radorTypeValue then
          targetUI:SetColor(UI_color.C_FFD85300)
        else
          if radorType.radorType_namedMonster == radorTypeValue then
            targetUI:SetColor(UI_color.C_FFD85300)
          else
            if radorType.radorType_bossMonster == radorTypeValue then
              targetUI:SetColor(UI_color.C_FFD85300)
            else
              if radorType.radorType_huntingMonster == radorTypeValue then
                targetUI:SetColor(UI_color.C_FFD85300)
              else
                if radorType.radorType_normalMonsterQuestTarget == radorTypeValue then
                  targetUI:SetColor(UI_color.C_FFFFE866)
                else
                  if radorType.radorType_namedMonsterQuestTarget == radorTypeValue then
                    targetUI:SetColor(UI_color.C_FFFFE866)
                  else
                    if radorType.radorType_bossMonsterQuestTarget == radorTypeValue then
                      targetUI:SetColor(UI_color.C_FFFFE866)
                    else
                      if radorType.radorType_huntingMonsterQuestTarget == radorTypeValue then
                        targetUI:SetColor(UI_color.C_FFFFE866)
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
      if isColorBlindType == 2 then
        if radorType.radorType_allymonster == radorTypeValue then
          targetUI:SetColor(UI_color.C_FFD82800)
        else
          if radorType.radorType_normalMonster == radorTypeValue then
            targetUI:SetColor(UI_color.C_FFD82800)
          else
            if radorType.radorType_namedMonster == radorTypeValue then
              targetUI:SetColor(UI_color.C_FFD82800)
            else
              if radorType.radorType_bossMonster == radorTypeValue then
                targetUI:SetColor(UI_color.C_FFD82800)
              else
                if radorType.radorType_huntingMonster == radorTypeValue then
                  targetUI:SetColor(UI_color.C_FFD82800)
                else
                  if radorType.radorType_normalMonsterQuestTarget == radorTypeValue then
                    targetUI:SetColor(UI_color.C_FFFFE866)
                  else
                    if radorType.radorType_namedMonsterQuestTarget == radorTypeValue then
                      targetUI:SetColor(UI_color.C_FFFFE866)
                    else
                      if radorType.radorType_bossMonsterQuestTarget == radorTypeValue then
                        targetUI:SetColor(UI_color.C_FFFFE866)
                      else
                        if radorType.radorType_huntingMonsterQuestTarget == radorTypeValue then
                          targetUI:SetColor(UI_color.C_FFFFE866)
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
  targetUI:SetDepth(typeDepth[radorTypeValue])
end

  registerEvent("FromClient_RadorTypeChanged", "FromClient_RadorTypeChanged")
  registerEvent("FromClient_RadorUICreated", "FromClient_RadorUICreated")
  local check_ServerChannel = function()
  -- function num : 0_82 , upvalues : radarTime
  local radarTimeControl = radarTime.controls
  ;
  (radarTimeControl.serverName):SetText(getCurrentWolrdName())
  local curChannelData = getCurrentChannelServerData()
  if isGameTypeKorea() then
    (radarTimeControl.serverName):SetShow(false)
  else
    if isGameTypeJapan() then
      (radarTimeControl.serverName):SetShow(false)
    else
      if isGameTypeEnglish() then
        (radarTimeControl.serverName):SetShow(false)
      else
        if isGameTypeTaiwan() then
          (radarTimeControl.serverName):SetShow(false)
        else
          if isGameTypeSA() then
            (radarTimeControl.serverName):SetShow(false)
          else
            ;
            (radarTimeControl.serverName):SetShow(true)
          end
        end
      end
    end
  end
  local channelName = getChannelName(curChannelData._worldNo, curChannelData._serverNo)
  ;
  (radarTimeControl.channelName):SetText("<PAColor0xFFb0cd61>" .. channelName .. "<PAOldColor>")
end

  check_ServerChannel()
  CalcPositionUseToTextUI = function(targetUIposX, targetUIposY, textUI)
  -- function num : 0_83
  if Panel_Radar:GetSizeX() < targetUIposX + textUI:GetTextSizeX() then
    textUI:SetPosX(Panel_Radar:GetSizeX() - textUI:GetTextSizeX())
  else
    textUI:SetPosX(targetUIposX)
  end
  if targetUIposY - textUI:GetTextSizeY() < Panel_Radar:GetPosY() then
    textUI:SetPosY(Panel_Radar:GetPosY())
  else
    textUI:SetPosY(targetUIposY - textUI:GetTextSizeY())
  end
end

  FromClient_setNameOfMouseOverIcon = function(actorProxyWrapper, targetUI, targetUIposX, targetUIposY)
  -- function num : 0_84 , upvalues : radar_OverName
  local actorName = ""
  if (actorProxyWrapper:get()):isNpc() then
    if actorProxyWrapper:getCharacterTitle() ~= "" then
      actorName = actorProxyWrapper:getName() .. " " .. actorProxyWrapper:getCharacterTitle()
    else
      actorName = actorProxyWrapper:getName()
    end
  else
    if (actorProxyWrapper:get()):isHouseHold() then
      actorName = getHouseHoldName(actorProxyWrapper:get())
    else
      do
        if (actorProxyWrapper:get()):isPlayer() then
          local playerActorProxyWrapper = getPlayerActor(actorProxyWrapper:getActorKey())
          if playerActorProxyWrapper ~= nil and (playerActorProxyWrapper:get()):isVolunteer() then
            return 
          end
        end
        actorName = actorProxyWrapper:getName()
        if radarMap.isRotateMode then
          targetUIposY = targetUIposY - targetUI:GetSizeY() * 2 - targetUI:GetSizeY() / 2
        else
          targetUIposX = targetUI:GetPosX()
          targetUIposY = targetUI:GetPosY()
        end
        radar_OverName:SetShow(true)
        radar_OverName:SetText(actorName)
        radar_OverName:SetSize(radar_OverName:GetTextSizeX() + 15, radar_OverName:GetTextSizeY() + (radar_OverName:GetSpanSize()).y)
        Panel_Radar:SetChildIndex(radar_OverName, 9999)
        CalcPositionUseToTextUI(targetUIposX, targetUIposY, radar_OverName)
        radar_OverName:SetDepth(-1000)
      end
    end
  end
end

  FromClient_NameOff = function()
  -- function num : 0_85 , upvalues : radar_OverName
  if radar_OverName:GetShow() then
    radar_OverName:SetShow(false)
  end
end

  RaderResizeByReset = function()
  -- function num : 0_86 , upvalues : Panel_OrigSizeX, Panel_OrigSizeY, controlAlign, raderAlert_Resize
  Panel_Radar:SetSize(Panel_OrigSizeX, Panel_OrigSizeY)
  ;
  ((radarMap.controls).rader_Background):SetPosX(0)
  ;
  ((radarMap.controls).rader_Background):SetSize(Panel_OrigSizeX, Panel_OrigSizeY)
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

  radarMap.scaleRateWidth = Panel_Radar:GetSizeX() / Panel_OrigSizeX
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  radarMap.scaleRateHeight = Panel_Radar:GetSizeY() / Panel_OrigSizeY
  local SPI = (radarMap.controls).icon_SelfPlayer
  local halfSelfSizeX = SPI:GetSizeX() / 2
  local halfSelfSizeY = SPI:GetSizeY() / 2
  local halfSizeX = Panel_Radar:GetSizeX() / 2
  local halfSizeY = Panel_Radar:GetSizeY() / 2
  SPI:SetPosX(halfSizeX - halfSelfSizeX)
  SPI:SetPosY(halfSizeY - halfSelfSizeY)
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (radarMap.pcPosBaseControl).x = SPI:GetPosX() + halfSelfSizeX
  -- DECOMPILER ERROR at PC66: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (radarMap.pcPosBaseControl).y = SPI:GetPosY() + halfSelfSizeY
  ToClient_setRadorUICenterPosition(int2((radarMap.pcPosBaseControl).x, (radarMap.pcPosBaseControl).y))
  controlAlign()
  NpcNavi_Reset_Posistion()
  TownNpcIcon_Resize()
  Panel_PlayerEndurance_Position()
  Panel_CarriageEndurance_Position()
  Panel_HorseEndurance_Position()
  Panel_ShipEndurance_Position()
  FGlobal_PersonalIcon_ButtonPosUpdate()
  ToClient_SaveUiInfo(false)
  raderAlert_Resize()
end

  FGlobal_ResetRadarUI = function()
  -- function num : 0_87 , upvalues : radar_AlphaScrl, radar_SizeSlider, updateWorldMapDistance, scaleMinValue
  RaderResizeByReset()
  radar_AlphaScrl:SetControlPos(ToClient_GetRaderAlpha() * 100)
  Rader_updateWorldMap_AlphaControl_Init()
  radar_SizeSlider:SetControlPos(ToClient_GetRaderScale() * 100)
  local scaleSlideValue = 1 - radar_SizeSlider:GetControlPos()
  updateWorldMapDistance(scaleMinValue + scaleSlideValue * 100)
end

  registerEvent("FromClient_setNameOfMouseOverIcon", "FromClient_setNameOfMouseOverIcon")
  registerEvent("FromClient_NameOff", "FromClient_NameOff")
  registerEvent("FromClient_ChangeRadarRotateMode", "Radar_SetRotateMode")
  changePositionBySever(Panel_Radar, (CppEnums.PAGameUIType).PAGameUIPanel_RadarMap, true, false, false)
  changePositionBySever(Panel_TimeBar, (CppEnums.PAGameUIType).PAGameUIPanel_TimeBar, true, false, false)
  Panel_Radar:SetSpanSize(7, 20)
end

