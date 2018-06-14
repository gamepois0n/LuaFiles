-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\menu\console\consolequickmenu.luac 

-- params : ...
-- function num : 0
local Type = {Inventory = 0, BlackSpirit = 1, WorldMap = 2, Skill = 3, Mail = 4, CharacterChallange = 5, ItemMarket = 6, Quest = 7, ServantCall = 8, ServantNavi = 9, CampActivate = 10, CampNavi = 11, HorseRaceInformation = 12, HorseRaceEnterOrCancel = 13, HouseList = 14, WorkerList = 15, InstallationList = 16, PetList = 17, MaidList = 18, TagSetting = 19, Tag = 20, NpcFind = 21, MovieGuide = 22, Mercenary = 23, VillageSiegeArea = 24, Pvp = 25, RingMenuSetting = 26, Profile = 27, VoiceChat = 28, Knowledge = 29, Undefined = 30}
-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu._functionTypeCount = Type.Undefined - 1
local getTypeName = function(index)
  -- function num : 0_0 , upvalues : Type
  for typeName,typeIndex in pairs(Type) do
    if index == typeIndex then
      return typeName
    end
  end
  return nil
end

local ExecuteFunction = {}
ExecuteFunction.Inventory = function()
  -- function num : 0_1
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Inventory)
end

ExecuteFunction.BlackSpirit = function()
  -- function num : 0_2
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_BlackSpirit)
end

ExecuteFunction.WorldMap = function()
  -- function num : 0_3
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_WorldMap)
end

ExecuteFunction.Skill = function()
  -- function num : 0_4
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Skill)
end

ExecuteFunction.Mail = function()
  -- function num : 0_5
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Mail)
end

ExecuteFunction.CharacterChallange = function()
  -- function num : 0_6
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Present)
end

ExecuteFunction.ItemMarket = function()
  -- function num : 0_7
  FGlobal_ItemMarket_Open_ForWorldMap(1, true)
  audioPostEvent_SystemUi(1, 30)
end

ExecuteFunction.Quest = function()
  -- function num : 0_8
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_QuestHistory)
end

ExecuteFunction.ServantCall = function()
  -- function num : 0_9
  Servant_Call(0)
end

ExecuteFunction.ServantNavi = function()
  -- function num : 0_10
  Servant_Navi(0)
end

ExecuteFunction.HorseRaceInformation = function()
  -- function num : 0_11
  HandelClicked_RaceInfo_Toggle()
end

ExecuteFunction.HorseRaceEnterOrCancel = function()
  -- function num : 0_12
  HandelClicked_RaceInfo_Join()
end

ExecuteFunction.HouseList = function()
  -- function num : 0_13
  FGlobal_HousingList_Open()
end

ExecuteFunction.WorkerList = function()
  -- function num : 0_14
  WorkerManager_ShowToggle()
end

ExecuteFunction.InstallationList = function()
  -- function num : 0_15
  HandleClicked_TentList_ShowToggle()
end

ExecuteFunction.PetList = function()
  -- function num : 0_16
  FGlobal_PetListNew_Toggle()
end

ExecuteFunction.MaidList = function()
  -- function num : 0_17
  MaidList_Open()
end

ExecuteFunction.TagSetting = function()
  -- function num : 0_18
end

ExecuteFunction.Tag = function()
  -- function num : 0_19
end

ExecuteFunction.NpcFind = function()
  -- function num : 0_20
  NpcNavi_ShowToggle()
end

ExecuteFunction.MovieGuide = function()
  -- function num : 0_21
end

ExecuteFunction.Mercenary = function()
  -- function num : 0_22
  FGlobal_MercenaryOpen()
end

ExecuteFunction.VillageSiegeArea = function()
  -- function num : 0_23
  FGlobal_GuildWarInfo_Show()
end

ExecuteFunction.Pvp = function()
  -- function num : 0_24
end

ExecuteFunction.RingMenuSetting = function()
  -- function num : 0_25
  FromClient_ConsoleQuickMenu_OpenCustomPage(2)
end

ExecuteFunction.Profile = function()
  -- function num : 0_26
  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_PlayerInfo)
end

ExecuteFunction.VoiceChat = function()
  -- function num : 0_27
  FGlobal_SetVoiceChat_Toggle()
end

ExecuteFunction.Knowledge = function()
  -- function num : 0_28
  PaGlobalFunc_Window_Knowledge_Show()
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.initialize = function(self)
  -- function num : 0_29
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu._functionTypeList = {}
-- DECOMPILER ERROR at PC197: Confused about usage of register: R3 in 'UnsetPending'

;
(PaGlobal_ConsoleQuickMenu._functionTypeList)._ExecuteFunction = {
[__eQuickMenuDataType_Function] = {[Type.Inventory] = ExecuteFunction.Inventory, [Type.BlackSpirit] = ExecuteFunction.BlackSpirit, [Type.WorldMap] = ExecuteFunction.WorldMap, [Type.Skill] = ExecuteFunction.Skill, [Type.Mail] = ExecuteFunction.Mail, [Type.CharacterChallange] = ExecuteFunction.CharacterChallange, [Type.ItemMarket] = ExecuteFunction.ItemMarket, [Type.Quest] = ExecuteFunction.Quest, [Type.ServantCall] = ExecuteFunction.ServantCall, [Type.ServantNavi] = ExecuteFunction.ServantNavi, [Type.CampActivate] = ExecuteFunction.CampActivate, [Type.CampNavi] = ExecuteFunction.CampNavi, [Type.HorseRaceInformation] = ExecuteFunction.HorseRaceInformation, [Type.HorseRaceEnterOrCancel] = ExecuteFunction.HorseRaceEnterOrCancel, [Type.HouseList] = ExecuteFunction.HouseList, [Type.WorkerList] = ExecuteFunction.WorkerList, [Type.InstallationList] = ExecuteFunction.InstallationList, [Type.PetList] = ExecuteFunction.PetList, [Type.MaidList] = ExecuteFunction.MaidList, [Type.TagSetting] = ExecuteFunction.TagSetting, [Type.Tag] = ExecuteFunction.Tag, [Type.NpcFind] = ExecuteFunction.NpcFind, [Type.MovieGuide] = ExecuteFunction.MovieGuide, [Type.Mercenary] = ExecuteFunction.Mercenary, [Type.VillageSiegeArea] = ExecuteFunction.VillageSiegeArea, [Type.Pvp] = ExecuteFunction.Pvp, [Type.RingMenuSetting] = ExecuteFunction.RingMenuSetting, [Type.Profile] = ExecuteFunction.Profile, [Type.VoiceChat] = ExecuteFunction.VoiceChat, [Type.Knowledge] = ExecuteFunction.Knowledge}
}
-- DECOMPILER ERROR at PC444: Confused about usage of register: R3 in 'UnsetPending'

;
(PaGlobal_ConsoleQuickMenu._functionTypeList)._icon = {
[__eQuickMenuDataType_Function] = {
[Type.Inventory] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 501, _x2 = 984, _y2 = 551}
, 
[Type.BlackSpirit] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 399, _x2 = 984, _y2 = 449}
, 
[Type.WorldMap] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 552, _x2 = 1035, _y2 = 602}
, 
[Type.Skill] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 450, _x2 = 984, _y2 = 500}
, 
[Type.Mail] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 501, _x2 = 1035, _y2 = 551}
, 
[Type.CharacterChallange] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 399, _x2 = 1035, _y2 = 449}
, 
[Type.ItemMarket] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 552, _x2 = 984, _y2 = 602}
, 
[Type.Quest] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 450, _x2 = 1035, _y2 = 500}
, 
[Type.ServantCall] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1036, _y1 = 399, _x2 = 1086, _y2 = 449}
, 
[Type.ServantNavi] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1036, _y1 = 450, _x2 = 1086, _y2 = 500}
, 
[Type.CampActivate] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1036, _y1 = 654, _x2 = 1086, _y2 = 704}
, 
[Type.CampNavi] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1036, _y1 = 654, _x2 = 1086, _y2 = 704}
, 
[Type.HorseRaceInformation] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 399, _x2 = 1086, _y2 = 449}
, 
[Type.HorseRaceEnterOrCancel] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 450, _x2 = 1137, _y2 = 500}
, 
[Type.HouseList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 603, _x2 = 1188, _y2 = 653}
, 
[Type.WorkerList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 399, _x2 = 1188, _y2 = 449}
, 
[Type.InstallationList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 450, _x2 = 1188, _y2 = 500}
, 
[Type.PetList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 501, _x2 = 1188, _y2 = 551}
, 
[Type.MaidList] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 501, _x2 = 1137, _y2 = 551}
, 
[Type.TagSetting] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 552, _x2 = 1137, _y2 = 602}
, 
[Type.Tag] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1138, _y1 = 552, _x2 = 1188, _y2 = 602}
, 
[Type.NpcFind] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 603, _x2 = 984, _y2 = 653}
, 
[Type.MovieGuide] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 603, _x2 = 1137, _y2 = 653}
, 
[Type.Mercenary] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 934, _y1 = 654, _x2 = 984, _y2 = 704}
, 
[Type.VillageSiegeArea] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 985, _y1 = 603, _x2 = 1035, _y2 = 653}
, 
[Type.Pvp] = {_path = "Renewal/Function/Console_Function_RingMenu.dds", _x1 = 1087, _y1 = 654, _x2 = 1137, _y2 = 704}
, 
[Type.RingMenuSetting] = {_path = "Renewal/Function/Console_Function_RingMenu_01.dds", _x1 = 205, _y1 = 445, _x2 = 255, _y2 = 495}
, 
[Type.Profile] = {_path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 2, _x2 = 124, _y2 = 62}
, 
[Type.VoiceChat] = {_path = "Renewal/Function/Console_Function_RingMenu_01.dds", _x1 = 256, _y1 = 190, _x2 = 306, _y2 = 240}
, 
[Type.Knowledge] = {_path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 64, _x2 = 186, _y2 = 124}
}
}
-- DECOMPILER ERROR at PC511: Confused about usage of register: R3 in 'UnsetPending'

;
(PaGlobal_ConsoleQuickMenu._functionTypeList)._name = {
[__eQuickMenuDataType_Function] = {[Type.Inventory] = "INVENTORY", [Type.BlackSpirit] = "BLACKSPIRIT", [Type.WorldMap] = "WORLDMAP", [Type.Skill] = "SKILL", [Type.Mail] = "MAIL", [Type.CharacterChallange] = "CHALLENGE", [Type.ItemMarket] = "ITEM MARKETPLACE", [Type.Quest] = "QUEST", [Type.ServantCall] = "CALL MOUNT", [Type.ServantNavi] = "FIND MOUNT LOCATION", [Type.CampActivate] = "CAMP", [Type.CampNavi] = "FIND CAMP LOCATION", [Type.HorseRaceInformation] = "HORSE RACE", [Type.HorseRaceEnterOrCancel] = "ENTER HORSE RACE", [Type.HouseList] = "MY RESICENCE LIST", [Type.WorkerList] = "WORKER LIST", [Type.InstallationList] = "GARDEN", [Type.PetList] = "MY PET", [Type.MaidList] = "FAIRY MAID LIST", [Type.TagSetting] = "TAG CHARACTER SETTING", [Type.Tag] = "TAG CHARACTER", [Type.NpcFind] = "FIND NPC", [Type.MovieGuide] = "VIDEO GUIDE", [Type.Mercenary] = "MILITIA", [Type.VillageSiegeArea] = "SHOW NODE INSTALLATION AREA", [Type.Pvp] = "PVP", [Type.RingMenuSetting] = "RINGMENU SETTING", [Type.Profile] = "PROFILE", [Type.VoiceChat] = "VOICE CHAT", [Type.Knowledge] = "KNOWLEDGE"}
}
varify = function()
  -- function num : 0_30 , upvalues : Type
  for type,index in pairs(Type) do
    local func = ((PaGlobal_ConsoleQuickMenu._functionTypeList)._ExecuteFunction)[__eQuickMenuDataType_Function]
    local icon = ((PaGlobal_ConsoleQuickMenu._functionTypeList)._icon)[__eQuickMenuDataType_Function]
    local name = ((PaGlobal_ConsoleQuickMenu._functionTypeList)._name)[__eQuickMenuDataType_Function]
    _PA_ASSERT(func, "링메뉴에 메뉴�\128�\133 Function �\180 없습니다. type : " .. tostring(type))
    _PA_ASSERT(icon, "링메뉴에 메뉴�\128�\133 icon �\180 없습니다. type : " .. tostring(type))
    _PA_ASSERT(name, "링메뉴에 메뉴�\128�\133 name �\180 없습니다. type : " .. tostring(type))
  end
end

FromClient_ConsoleQuickMenu_ExecuteFunctionType = function(datatype, functionType)
  -- function num : 0_31
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
-- DECOMPILER ERROR at PC523: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.setDefaultSetting = function(self)
  -- function num : 0_32
  ToClient_setDefaultQuickMenu()
end

PaGlobal_ConsoleQuickMenu:setDefaultSetting()

