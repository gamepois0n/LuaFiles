-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\loadconsoleui.luac 

-- params : ...
-- function num : 0
local UIGroup = Defines.UIGroup
local RenderMode = Defines.RenderMode
local defaultRenderModeBitSet = PAUIRenderModeBitSet({RenderMode.eRenderMode_Default})
local RenderModeWorldMapBitSet = PAUIRenderModeBitSet({RenderMode.eRenderMode_WorldMap})
local RenderModeBitSetInGameCashShop = PAUIRenderModeBitSet({RenderMode.eRenderMode_InGameCashShop})
local RenderModeAllModeOpen = PAUIRenderModeBitSet({RenderMode.eRenderMode_Default, RenderMode.eRenderMode_WorldMap, RenderMode.eRenderMode_Knowledge, RenderMode.eRenderMode_Dialog, RenderMode.eRenderMode_Dye, RenderMode.eRenderMode_InGameCashShop, RenderMode.eRenderMode_HouseInstallation, RenderMode.eRenderMode_BlackSpirit, RenderMode.eRenderMode_MentalGame, RenderMode.eRenderMode_customScreenShot, RenderMode.eRenderMode_UISetting, RenderMode.eRenderMode_CutScene, RenderMode.eRenderMode_IngameCustomize})
basicLoadUI = function(panelNodeName, panelID, panelGroup)
  -- function num : 0_0 , upvalues : defaultRenderModeBitSet
  loadUI(panelNodeName, panelID, panelGroup, defaultRenderModeBitSet)
end

preLoadConsoleGameUI = function()
  -- function num : 0_1 , upvalues : UIGroup
  basicLoadUI("UI_Data/Widget/Console/UI_Widget_EnemyGauge.XML", "Panel_ConsoleEnemyGauge", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Console/UI_Widget_Hpmp.XML", "Panel_ConsoleHpMpGauge", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Console/UI_Widget_AutoPotion.XML", "Panel_ConsoleAutoPotion", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/MainStatus/UI_ConsoleModeWidget_MainStatus.XML", "Panel_MainStatus", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/MainStatus/UI_ConsoleModeWidget_ServantIcon.XML", "Panel_ConsoleServantIcon", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/MainStatus/UI_ConsoleModeWidget_HouseIcon.XML", "Panel_ConsoleHouseIcon", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_Main_Console.XML", "Panel_UIMain_Console", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/QuickSlot/Panel_Console_QuickSlot.XML", "Panel_Console_QuickSlot", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/QuestList/Panel_Console_MainQuest.XML", "Panel_Console_MainQuest", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/QuestList/Panel_Console_CheckedQuest.XML", "Panel_Console_CheckedQuest", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Rader/Panel_Console_Rader.XML", "Panel_Console_Rader", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/RightTopIcons/Panel_Console_PersonalIcon.XML", "Panel_Console_PersonalIcon", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Menu/Panel_Console_Menu.XML", "Panel_Console_Menu", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Party/Panel_Console_Party.XML", "Panel_Console_Party", UIGroup.PAGameUIGroup_Widget)
end

loadConsoleGameUI = function()
  -- function num : 0_2
  runLua("UI_Data/Script/Widget/Console/Panel_ConsoleEnemyGauge.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_ConsoleHpMpGauge.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_ConsoleAutoPotion.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_Console_MainStatus.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_ConsoleHouseIcon.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_ConsoleServantIcon.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_UIMain_Console.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_Console_QuickSlot.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_Console_MainQuest.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_Console_Rader.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_Console_PersonalIcon.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_Console_Menu.lua")
  runLua("UI_Data/Script/Widget/Console/Panel_Console_Party.lua")
  runLua("UI_Data/Script/Common/Common_ConsoleUI.lua")
end


