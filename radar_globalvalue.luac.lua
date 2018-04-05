-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\rader\radar_globalvalue.luac 

-- params : ...
-- function num : 0
local raderText = (UI.getChildControl)(Panel_Radar, "StaticText_raderText")
local radar_Background = (UI.getChildControl)(Panel_Radar, "rader_background")
local radar_SizeSlider = (UI.getChildControl)(Panel_Radar, "Slider_MapSize")
local radar_SizeBtn = (UI.getChildControl)(radar_SizeSlider, "Slider_MapSize_Btn")
local radar_AlphaScrl = (UI.getChildControl)(Panel_Radar, "Slider_RadarAlpha")
local radar_AlphaBtn = (UI.getChildControl)(radar_AlphaScrl, "RadarAlpha_CtrlBtn")
local radar_OverName = (UI.getChildControl)(Panel_Radar, "Static_OverName")
local radar_MiniMapScl = (UI.getChildControl)(Panel_Radar, "Button_SizeControl")
radar_Background:SetShowAALineList(true)
radar_Background:SetColorShowAALineList(float4(1, 1, 1, 1))
radarMap = {
config = {constMapRadius = 60, mapRadius = 60, mapRadiusByPixel = 80}
, 
controls = {rader_Background = (UI.getChildControl)(Panel_Radar, "rader_background"), icon_SelfPlayer = (UI.getChildControl)(Panel_Radar, "icon_selfPlayer"), timeNum = (UI.getChildControl)(Panel_TimeBarNumber, "timeNum"), rader_Plus = (UI.getChildControl)(radar_SizeSlider, "Button_RaderViewModePlus"), rader_Minus = (UI.getChildControl)(radar_SizeSlider, "Button_RaderViewModeMinus"), rader_AlphaPlus = (UI.getChildControl)(radar_AlphaScrl, "Button_AlphaPlus"), rader_AlphaMinus = (UI.getChildControl)(radar_AlphaScrl, "Button_AlphaMinus"), rader_Reset = (UI.getChildControl)(Panel_Radar, "Button_RaderViewModeReset"), rader_NpcFind_Toggle = (UI.getChildControl)(Panel_Radar, "Button_NpcFind_Toggle"), rader_Close = (UI.getChildControl)(Panel_Radar, "Button_Win_Close")}
, 
template = {icon_Player = (UI.getChildControl)(Panel_Radar, "icon_player"), icon_Party = (UI.getChildControl)(Panel_Radar, "icon_partyMember"), icon_Guild = (UI.getChildControl)(Panel_Radar, "icon_guildMember"), icon_Horse = (UI.getChildControl)(Panel_Radar, "icon_horse"), icon_DeadBody = (UI.getChildControl)(Panel_Radar, "icon_deadbody"), icon_Monster_general_normal = (UI.getChildControl)(Panel_Radar, "icon_monsterGeneral_normal"), icon_Monster_general_quest = (UI.getChildControl)(Panel_Radar, "icon_monsterGeneral_quest"), icon_Monster_named_normal = (UI.getChildControl)(Panel_Radar, "icon_monsterNamed_normal"), icon_Monster_named_quest = (UI.getChildControl)(Panel_Radar, "icon_monsterNamed_quest"), icon_Monster_boss_normal = (UI.getChildControl)(Panel_Radar, "icon_monsterBoss_normal"), icon_Monster_boss_quest = (UI.getChildControl)(Panel_Radar, "icon_monsterBoss_quest"), icon_Quest_acceptable = (UI.getChildControl)(Panel_Radar, "icon_quest_accept"), icon_Quest_cleared = (UI.getChildControl)(Panel_Radar, "icon_quest_clear"), icon_NPC_lordManager = (UI.getChildControl)(Panel_Radar, "icon_npc_lordManager"), icon_NPC_trainner = (UI.getChildControl)(Panel_Radar, "icon_npc_skillTrainner"), radorType_tradeMerchantNpc = (UI.getChildControl)(Panel_Radar, "icon_npc_trader"), radorType_nodeManager = (UI.getChildControl)(Panel_Radar, "icon_npc_nodeManager"), icon_NPC_talkable = (UI.getChildControl)(Panel_Radar, "icon_npc_general"), icon_NPC_garage = (UI.getChildControl)(Panel_Radar, "icon_npc_warehouse"), icon_NPC_liquidStore = (UI.getChildControl)(Panel_Radar, "icon_npc_potion"), icon_NPC_weaponStore = (UI.getChildControl)(Panel_Radar, "icon_npc_storeArmor"), icon_NPC_armorStore = (UI.getChildControl)(Panel_Radar, "icon_npc_storeArmor"), icon_NPC_horseStable = (UI.getChildControl)(Panel_Radar, "icon_npc_horse"), radorType_workerNpc = (UI.getChildControl)(Panel_Radar, "icon_npc_worker"), radorType_jewelNpc = (UI.getChildControl)(Panel_Radar, "icon_npc_jewel"), radorType_furnitureNpc = (UI.getChildControl)(Panel_Radar, "icon_npc_furniture"), icon_NPC_product = (UI.getChildControl)(Panel_Radar, "icon_npc_collect"), radorType_shipNpc = (UI.getChildControl)(Panel_Radar, "icon_npc_ship"), radorType_alchemyNpc = (UI.getChildControl)(Panel_Radar, "icon_npc_alchemy"), radorType_fishNpc = (UI.getChildControl)(Panel_Radar, "icon_npc_fish"), icon_NPC_itemRepairer = (UI.getChildControl)(Panel_Radar, "icon_npc_repairer"), icon_NPC_unknown = (UI.getChildControl)(Panel_Radar, "icon_npc_unknown"), icon_PIN_Party = (UI.getChildControl)(Panel_Radar, "icon_pin_Party"), icon_PIN_PartyMine = (UI.getChildControl)(Panel_Radar, "icon_pin_PartyMine"), icon_PIN_Guild = (UI.getChildControl)(Panel_Radar, "icon_pin_Guild"), icon_PIN_GuildMine = (UI.getChildControl)(Panel_Radar, "icon_pin_GuildMine"), icon_PIN_GuildMaster = (UI.getChildControl)(Panel_Radar, "icon_pin_GuildMaster"), pin_guideArrow = (UI.getChildControl)(Panel_Radar, "pin_area_guided"), area_quest = (UI.getChildControl)(Panel_Radar, "quest_area"), area_quest_guideArrow = (UI.getChildControl)(Panel_Radar, "quest_area_guided"), area_siegeAttackHit = (UI.getChildControl)(Panel_Radar, "Static_RedCircle")}
, 
pcInfo = {
position = {x = 0, y = 0, z = 0}
, s64_teamNo = (Defines.s64_const).s64_m1}
, worldDistanceToPixelRate = 1, 
pcPosBaseControl = {x = 0, y = 0}
, 
actorIcons = {}
, 
monsterIcons = {}
, iconPool = (Array.new)(), iconCreateCount = 0, 
areaQuests = {}
, questIconPool = (Array.new)(), questCreateCount = 0, regionTypeValue = (CppEnums.RegionType).eRegionType_MinorTown, scaleRateWidth = 1, scaleRateHeight = 1, isRotateMode = (ToClient_getGameOptionControllerWrapper()):getRadarRotateMode()}
FGlobal_Panel_Radar_Show_AddEffect = function()
  -- function num : 0_0 , upvalues : radar_Background
  Panel_Radar:SetShow(true)
  radar_Background:AddEffect("UI_Tuto_MiniMap_1", false, 0, 0)
  radar_Background:AddEffect("fUI_Tuto_MiniMap_01A", false, 0, 0)
end

FGlobal_Panel_Radar_Show = function(isShow)
  -- function num : 0_1
  if _ContentsGroup_3DMiniMapOpen == false or Panel_WorldMiniMap == nil then
    Panel_Radar:SetShow(isShow)
    return 
  end
  local worldMiniMapState = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).RadarSwap)
  if worldMiniMapState then
    Panel_WorldMiniMap:SetShow(isShow)
  else
    Panel_Radar:SetShow(isShow)
  end
end

FGlobal_Panel_Radar_GetShow = function()
  -- function num : 0_2
  return Panel_Radar:GetShow()
end

FGlobal_Panel_Radar_GetSizeX = function()
  -- function num : 0_3
  if Panel_WorldMiniMap == nil then
    return Panel_Radar:GetSizeX()
  end
  local sizeX = 0
  local worldMiniMapState = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).RadarSwap)
  if worldMiniMapState then
    sizeX = Panel_WorldMiniMap:GetSizeX() + 22
  else
    sizeX = Panel_Radar:GetSizeX()
  end
  return sizeX
end

FGlobal_Panel_Radar_GetSizeY = function()
  -- function num : 0_4
  return Panel_Radar:GetSizeY()
end

FGlobal_Panel_Radar_GetSpanSizeX = function()
  -- function num : 0_5
  return (Panel_Radar:GetSpanSize()).x
end

FGlobal_Panel_Radar_GetSpanSizeY = function()
  -- function num : 0_6
  return (Panel_Radar:GetSpanSize()).y
end

FGlobal_Panel_Radar_GetPosX = function()
  -- function num : 0_7
  if Panel_WorldMiniMap == nil then
    return Panel_Radar:GetPosX()
  end
  local posX = 0
  local worldMiniMapState = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).RadarSwap)
  if worldMiniMapState then
    posX = FGlobal_Panel_WorldMiniMapPosX() - 14
  else
    posX = Panel_Radar:GetPosX()
  end
  return posX
end

FGlobal_Panel_Radar_GetPosY = function()
  -- function num : 0_8
  if Panel_WorldMiniMap == nil then
    return Panel_Radar:GetPosY()
  end
  local posY = 0
  local worldMiniMapState = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).RadarSwap)
  if worldMiniMapState then
    posY = FGlobal_Panel_WorldMiniMapPosY()
  else
    posY = Panel_Radar:GetPosY()
  end
  return posY
end

FGlobal_Panel_Radar_Movable_UI = function()
  -- function num : 0_9
  local raderText = (UI.getChildControl)(Panel_Radar, "StaticText_raderText")
  raderText:SetShow(false)
  Panel_Radar:SetIgnore(false)
  Panel_Radar:SetDragEnable(true)
  Panel_Radar:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  RadarMap_SetDragMode(true)
end

FGlobal_Panel_Radar_Movable_UI_Cancel = function()
  -- function num : 0_10
  local raderText = (UI.getChildControl)(Panel_Radar, "StaticText_raderText")
  raderText:SetShow(false)
  Panel_Radar:SetIgnore(true)
  Panel_Radar:SetDragEnable(false)
  Panel_Radar:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Etc_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(Panel_Radar, 102, 60, 110, 68)
  ;
  (Panel_Radar:getBaseTexture()):setUV(x1, y1, x2, y2)
  Panel_Radar:setRenderTexture(Panel_Radar:getBaseTexture())
  RadarMap_SetDragMode(false)
end


