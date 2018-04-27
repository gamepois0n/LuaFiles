-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\menu\console\consolequickmenu.luac 

-- params : ...
-- function num : 0
local ExecuteFunction = {}
ExecuteFunction.__eQuickMenuFunctionType_Inventory = function()
  -- function num : 0_0
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Inventory)
end

ExecuteFunction.__eQuickMenuFunctionType_BlackSpirit = function()
  -- function num : 0_1
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_BlackSpirit)
end

ExecuteFunction.__eQuickMenuFunctionType_WorldMap = function()
  -- function num : 0_2
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_WorldMap)
end

ExecuteFunction.__eQuickMenuFunctionType_Skill = function()
  -- function num : 0_3
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Skill)
end

ExecuteFunction.__eQuickMenuFunctionType_Mail = function()
  -- function num : 0_4
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Mail)
end

ExecuteFunction.__eQuickMenuFunctionType_CharacterChallange = function()
  -- function num : 0_5
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Present)
end

ExecuteFunction.__eQuickMenuFunctionType_ItemMarket = function()
  -- function num : 0_6
  FGlobal_ItemMarket_Open_ForWorldMap(1, true)
  audioPostEvent_SystemUi(1, 30)
end

ExecuteFunction.__eQuickMenuFunctionType_Quest = function()
  -- function num : 0_7
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_QuestHistory)
end

ExecuteFunction.__eQuickMenuFunctionType_ServantCall = function()
  -- function num : 0_8
  Servant_Call(0)
end

ExecuteFunction.__eQuickMenuFunctionType_ServantNavi = function()
  -- function num : 0_9
  Servant_Navi(0)
end

ExecuteFunction.__eQuickMenuFunctionType_HorseRaceInformation = function()
  -- function num : 0_10
  HandelClicked_RaceInfo_Toggle()
end

ExecuteFunction.__eQuickMenuFunctionType_HorseRaceEnterOrCancel = function()
  -- function num : 0_11
  HandelClicked_RaceInfo_Join()
end

ExecuteFunction.__eQuickMenuFunctionType_HouseList = function()
  -- function num : 0_12
  FGlobal_HousingList_Open()
end

ExecuteFunction.__eQuickMenuFunctionType_WorkerList = function()
  -- function num : 0_13
  WorkerManager_ShowToggle()
end

ExecuteFunction.__eQuickMenuFunctionType_InstallationList = function()
  -- function num : 0_14
  HandleClicked_TentList_ShowToggle()
end

ExecuteFunction.__eQuickMenuFunctionType_PetList = function()
  -- function num : 0_15
  FGlobal_PetListNew_Toggle()
end

ExecuteFunction.__eQuickMenuFunctionType_MaidList = function()
  -- function num : 0_16
  MaidList_Open()
end

ExecuteFunction.__eQuickMenuFunctionType_TagSetting = function()
  -- function num : 0_17
end

ExecuteFunction.__eQuickMenuFunctionType_Tag = function()
  -- function num : 0_18
end

ExecuteFunction.__eQuickMenuFunctionType_NpcFind = function()
  -- function num : 0_19
  NpcNavi_ShowToggle()
end

ExecuteFunction.__eQuickMenuFunctionType_MovieGuide = function()
  -- function num : 0_20
end

ExecuteFunction.__eQuickMenuFunctionType_Mercenary = function()
  -- function num : 0_21
  FGlobal_MercenaryOpen()
end

ExecuteFunction.__eQuickMenuFunctionType_VillageSiegeArea = function()
  -- function num : 0_22
  FGlobal_GuildWarInfo_Show()
end

ExecuteFunction.__eQuickMenuFunctionType_Pvp = function()
  -- function num : 0_23
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu._functionTypeList = {}
-- DECOMPILER ERROR at PC136: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_ConsoleQuickMenu._functionTypeList)._ExecuteFunction = {
[__eQuickMenuDataType_Function] = {[__eQuickMenuFunctionType_Inventory] = ExecuteFunction.__eQuickMenuFunctionType_Inventory, [__eQuickMenuFunctionType_BlackSpirit] = ExecuteFunction.__eQuickMenuFunctionType_BlackSpirit, [__eQuickMenuFunctionType_WorldMap] = ExecuteFunction.__eQuickMenuFunctionType_WorldMap, [__eQuickMenuFunctionType_Skill] = ExecuteFunction.__eQuickMenuFunctionType_Skill, [__eQuickMenuFunctionType_Mail] = ExecuteFunction.__eQuickMenuFunctionType_Mail, [__eQuickMenuFunctionType_CharacterChallange] = ExecuteFunction.__eQuickMenuFunctionType_CharacterChallange, [__eQuickMenuFunctionType_ItemMarket] = ExecuteFunction.__eQuickMenuFunctionType_ItemMarket, [__eQuickMenuFunctionType_Quest] = ExecuteFunction.__eQuickMenuFunctionType_Quest, [__eQuickMenuFunctionType_ServantCall] = ExecuteFunction.__eQuickMenuFunctionType_ServantCall, [__eQuickMenuFunctionType_ServantNavi] = ExecuteFunction.__eQuickMenuFunctionType_ServantNavi, [__eQuickMenuFunctionType_CampActivate] = ExecuteFunction.__eQuickMenuFunctionType_CampActivate, [__eQuickMenuFunctionType_CampNavi] = ExecuteFunction.__eQuickMenuFunctionType_CampNavi, [__eQuickMenuFunctionType_HorseRaceInformation] = ExecuteFunction.__eQuickMenuFunctionType_HorseRaceInformation, [__eQuickMenuFunctionType_HorseRaceEnterOrCancel] = ExecuteFunction.__eQuickMenuFunctionType_HorseRaceEnterOrCancel, [__eQuickMenuFunctionType_HouseList] = ExecuteFunction.__eQuickMenuFunctionType_HouseList, [__eQuickMenuFunctionType_WorkerList] = ExecuteFunction.__eQuickMenuFunctionType_WorkerList, [__eQuickMenuFunctionType_InstallationList] = ExecuteFunction.__eQuickMenuFunctionType_InstallationList, [__eQuickMenuFunctionType_PetList] = ExecuteFunction.__eQuickMenuFunctionType_PetList, [__eQuickMenuFunctionType_MaidList] = ExecuteFunction.__eQuickMenuFunctionType_MaidList, [__eQuickMenuFunctionType_TagSetting] = ExecuteFunction.__eQuickMenuFunctionType_TagSetting, [__eQuickMenuFunctionType_Tag] = ExecuteFunction.__eQuickMenuFunctionType_Tag, [__eQuickMenuFunctionType_NpcFind] = ExecuteFunction.__eQuickMenuFunctionType_NpcFind, [__eQuickMenuFunctionType_MovieGuide] = ExecuteFunction.__eQuickMenuFunctionType_MovieGuide, [__eQuickMenuFunctionType_Mercenary] = ExecuteFunction.__eQuickMenuFunctionType_Mercenary, [__eQuickMenuFunctionType_VillageSiegeArea] = ExecuteFunction.__eQuickMenuFunctionType_VillageSiegeArea, [__eQuickMenuFunctionType_Pvp] = ExecuteFunction.__eQuickMenuFunctionType_Pvp}
}
-- DECOMPILER ERROR at PC351: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_ConsoleQuickMenu._functionTypeList)._icon = {
[__eQuickMenuDataType_Function] = {
[__eQuickMenuFunctionType_Inventory] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 501, _x2 = 984, _y2 = 551}
, 
[__eQuickMenuFunctionType_BlackSpirit] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 399, _x2 = 984, _y2 = 449}
, 
[__eQuickMenuFunctionType_WorldMap] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 552, _x2 = 1035, _y2 = 602}
, 
[__eQuickMenuFunctionType_Skill] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 450, _x2 = 984, _y2 = 500}
, 
[__eQuickMenuFunctionType_Mail] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 501, _x2 = 1035, _y2 = 551}
, 
[__eQuickMenuFunctionType_CharacterChallange] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 399, _x2 = 1035, _y2 = 449}
, 
[__eQuickMenuFunctionType_ItemMarket] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 552, _x2 = 984, _y2 = 602}
, 
[__eQuickMenuFunctionType_Quest] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 450, _x2 = 1035, _y2 = 500}
, 
[__eQuickMenuFunctionType_ServantCall] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1036, _y1 = 399, _x2 = 1086, _y2 = 449}
, 
[__eQuickMenuFunctionType_ServantNavi] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1036, _y1 = 450, _x2 = 1086, _y2 = 500}
, 
[__eQuickMenuFunctionType_CampActivate] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1036, _y1 = 654, _x2 = 1086, _y2 = 704}
, 
[__eQuickMenuFunctionType_CampNavi] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1036, _y1 = 654, _x2 = 1086, _y2 = 704}
, 
[__eQuickMenuFunctionType_HorseRaceInformation] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 399, _x2 = 1086, _y2 = 449}
, 
[__eQuickMenuFunctionType_HorseRaceEnterOrCancel] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 450, _x2 = 1137, _y2 = 500}
, 
[__eQuickMenuFunctionType_HouseList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 603, _x2 = 1188, _y2 = 653}
, 
[__eQuickMenuFunctionType_WorkerList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 399, _x2 = 1188, _y2 = 449}
, 
[__eQuickMenuFunctionType_InstallationList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 450, _x2 = 1188, _y2 = 500}
, 
[__eQuickMenuFunctionType_PetList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 501, _x2 = 1188, _y2 = 551}
, 
[__eQuickMenuFunctionType_MaidList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 501, _x2 = 1137, _y2 = 551}
, 
[__eQuickMenuFunctionType_TagSetting] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 552, _x2 = 1137, _y2 = 602}
, 
[__eQuickMenuFunctionType_Tag] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 552, _x2 = 1188, _y2 = 602}
, 
[__eQuickMenuFunctionType_NpcFind] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 603, _x2 = 984, _y2 = 653}
, 
[__eQuickMenuFunctionType_MovieGuide] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 603, _x2 = 1137, _y2 = 653}
, 
[__eQuickMenuFunctionType_Mercenary] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 654, _x2 = 984, _y2 = 704}
, 
[__eQuickMenuFunctionType_VillageSiegeArea] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 603, _x2 = 1035, _y2 = 653}
, 
[__eQuickMenuFunctionType_Pvp] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 654, _x2 = 1137, _y2 = 704}
}
}
-- DECOMPILER ERROR at PC410: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_ConsoleQuickMenu._functionTypeList)._name = {
[__eQuickMenuDataType_Function] = {[__eQuickMenuFunctionType_Inventory] = "INVENTORY", [__eQuickMenuFunctionType_BlackSpirit] = "BLACKSPIRIT", [__eQuickMenuFunctionType_WorldMap] = "WORLDMAP", [__eQuickMenuFunctionType_Skill] = "SKILL", [__eQuickMenuFunctionType_Mail] = "MAIL", [__eQuickMenuFunctionType_CharacterChallange] = "CHALLENGE", [__eQuickMenuFunctionType_ItemMarket] = "ITEM MARKETPLACE", [__eQuickMenuFunctionType_Quest] = "QUEST", [__eQuickMenuFunctionType_ServantCall] = "CALL MOUNT", [__eQuickMenuFunctionType_ServantNavi] = "FIND MOUNT LOCATION", [__eQuickMenuFunctionType_CampActivate] = "CAMP", [__eQuickMenuFunctionType_CampNavi] = "FIND CAMP LOCATION", [__eQuickMenuFunctionType_HorseRaceInformation] = "HORSE RACE", [__eQuickMenuFunctionType_HorseRaceEnterOrCancel] = "ENTER HORSE RACE", [__eQuickMenuFunctionType_HouseList] = "MY RESICENCE LIST", [__eQuickMenuFunctionType_WorkerList] = "WORKER LIST", [__eQuickMenuFunctionType_InstallationList] = "GARDEN", [__eQuickMenuFunctionType_PetList] = "MY PET", [__eQuickMenuFunctionType_MaidList] = "FAIRY MAID LIST", [__eQuickMenuFunctionType_TagSetting] = "TAG CHARACTER SETTING", [__eQuickMenuFunctionType_Tag] = "TAG CHARACTER", [__eQuickMenuFunctionType_NpcFind] = "FIND NPC", [__eQuickMenuFunctionType_MovieGuide] = "VIDEO GUIDE", [__eQuickMenuFunctionType_Mercenary] = "MILITIA", [__eQuickMenuFunctionType_VillageSiegeArea] = "SHOW NODE INSTALLATION AREA", [__eQuickMenuFunctionType_Pvp] = "PVP"}
}
FromClient_ConsoleQuickMenu_ExecuteFunctionType = function(datatype, functionType)
  -- function num : 0_24
  if __eQuickMenuDataType_Function ~= datatype then
    return 
  end
  local executeFunc = (((PaGlobal_ConsoleQuickMenu._functionTypeList)._ExecuteFunction)[datatype])[functionType]
  if executeFunc == nil then
    _PA_LOG("후진", "[ConsoleQuickMenu] QuickMenu.functionType �\144 �\128입이 추가되었으면 PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction �\144 추가�\180 주세�\148  ")
    return 
  end
  executeFunc()
end

registerEvent("FromClient_ConsoleQuickMenu_ExecuteFunctionType", "FromClient_ConsoleQuickMenu_ExecuteFunctionType")

