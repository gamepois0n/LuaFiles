local Type = {
  Inventory = 0,
  BlackSpirit = 1,
  WorldMap = 2,
  Skill = 3,
  Mail = 4,
  CharacterChallange = 5,
  ItemMarket = 6,
  Quest = 7,
  ServantCall = 8,
  ServantNavi = 9,
  CampActivate = 10,
  CampNavi = 11,
  HorseRaceInformation = 12,
  HorseRaceEnterOrCancel = 13,
  HouseList = 14,
  WorkerList = 15,
  InstallationList = 16,
  PetList = 17,
  MaidList = 18,
  TagSetting = 19,
  Tag = 20,
  NpcFind = 21,
  MovieGuide = 22,
  Mercenary = 23,
  VillageSiegeArea = 24,
  Pvp = 25,
  RingMenuSetting = 26,
  Profile = 27,
  VoiceChat = 28,
  Knowledge = 29,
  Undefined = 30
}
PaGlobal_ConsoleQuickMenu._functionTypeCount = Type.Undefined - 1
local function getTypeName(index)
  for typeName, typeIndex in pairs(Type) do
    if index == typeIndex then
      return typeName
    end
  end
  return nil
end
local ExecuteFunction = {}
function ExecuteFunction.Inventory()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Inventory)
end
function ExecuteFunction.BlackSpirit()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_BlackSpirit)
end
function ExecuteFunction.WorldMap()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_WorldMap)
end
function ExecuteFunction.Skill()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Skill)
end
function ExecuteFunction.Mail()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Mail)
end
function ExecuteFunction.CharacterChallange()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Present)
end
function ExecuteFunction.ItemMarket()
  FGlobal_ItemMarket_Open_ForWorldMap(1, true)
  audioPostEvent_SystemUi(1, 30)
end
function ExecuteFunction.Quest()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_QuestHistory)
end
function ExecuteFunction.ServantCall()
  Servant_Call(0)
end
function ExecuteFunction.ServantNavi()
  Servant_Navi(0)
end
function ExecuteFunction.HorseRaceInformation()
  HandelClicked_RaceInfo_Toggle()
end
function ExecuteFunction.HorseRaceEnterOrCancel()
  HandelClicked_RaceInfo_Join()
end
function ExecuteFunction.HouseList()
  FGlobal_HousingList_Open()
end
function ExecuteFunction.WorkerList()
  WorkerManager_ShowToggle()
end
function ExecuteFunction.InstallationList()
  HandleClicked_TentList_ShowToggle()
end
function ExecuteFunction.PetList()
  FGlobal_PetListNew_Toggle()
end
function ExecuteFunction.MaidList()
  MaidList_Open()
end
function ExecuteFunction.TagSetting()
end
function ExecuteFunction.Tag()
end
function ExecuteFunction.NpcFind()
  NpcNavi_ShowToggle()
end
function ExecuteFunction.MovieGuide()
end
function ExecuteFunction.Mercenary()
  FGlobal_MercenaryOpen()
end
function ExecuteFunction.VillageSiegeArea()
  FGlobal_GuildWarInfo_Show()
end
function ExecuteFunction.Pvp()
end
function ExecuteFunction.RingMenuSetting()
  FromClient_ConsoleQuickMenu_OpenCustomPage(2)
end
function ExecuteFunction.Profile()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_PlayerInfo)
end
function ExecuteFunction.VoiceChat()
  FGlobal_SetVoiceChat_Toggle()
end
function ExecuteFunction.Knowledge()
  PaGlobalFunc_Window_Knowledge_Show()
end
function PaGlobal_ConsoleQuickMenu:initialize()
end
PaGlobal_ConsoleQuickMenu._functionTypeList = {}
PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = ExecuteFunction.Inventory,
    [Type.BlackSpirit] = ExecuteFunction.BlackSpirit,
    [Type.WorldMap] = ExecuteFunction.WorldMap,
    [Type.Skill] = ExecuteFunction.Skill,
    [Type.Mail] = ExecuteFunction.Mail,
    [Type.CharacterChallange] = ExecuteFunction.CharacterChallange,
    [Type.ItemMarket] = ExecuteFunction.ItemMarket,
    [Type.Quest] = ExecuteFunction.Quest,
    [Type.ServantCall] = ExecuteFunction.ServantCall,
    [Type.ServantNavi] = ExecuteFunction.ServantNavi,
    [Type.CampActivate] = ExecuteFunction.CampActivate,
    [Type.CampNavi] = ExecuteFunction.CampNavi,
    [Type.HorseRaceInformation] = ExecuteFunction.HorseRaceInformation,
    [Type.HorseRaceEnterOrCancel] = ExecuteFunction.HorseRaceEnterOrCancel,
    [Type.HouseList] = ExecuteFunction.HouseList,
    [Type.WorkerList] = ExecuteFunction.WorkerList,
    [Type.InstallationList] = ExecuteFunction.InstallationList,
    [Type.PetList] = ExecuteFunction.PetList,
    [Type.MaidList] = ExecuteFunction.MaidList,
    [Type.TagSetting] = ExecuteFunction.TagSetting,
    [Type.Tag] = ExecuteFunction.Tag,
    [Type.NpcFind] = ExecuteFunction.NpcFind,
    [Type.MovieGuide] = ExecuteFunction.MovieGuide,
    [Type.Mercenary] = ExecuteFunction.Mercenary,
    [Type.VillageSiegeArea] = ExecuteFunction.VillageSiegeArea,
    [Type.Pvp] = ExecuteFunction.Pvp,
    [Type.RingMenuSetting] = ExecuteFunction.RingMenuSetting,
    [Type.Profile] = ExecuteFunction.Profile,
    [Type.VoiceChat] = ExecuteFunction.VoiceChat,
    [Type.Knowledge] = ExecuteFunction.Knowledge
  }
}
PaGlobal_ConsoleQuickMenu._functionTypeList._icon = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 501,
      _x2 = 984,
      _y2 = 551
    },
    [Type.BlackSpirit] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 399,
      _x2 = 984,
      _y2 = 449
    },
    [Type.WorldMap] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 552,
      _x2 = 1035,
      _y2 = 602
    },
    [Type.Skill] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 450,
      _x2 = 984,
      _y2 = 500
    },
    [Type.Mail] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 501,
      _x2 = 1035,
      _y2 = 551
    },
    [Type.CharacterChallange] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 399,
      _x2 = 1035,
      _y2 = 449
    },
    [Type.ItemMarket] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 552,
      _x2 = 984,
      _y2 = 602
    },
    [Type.Quest] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 450,
      _x2 = 1035,
      _y2 = 500
    },
    [Type.ServantCall] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 399,
      _x2 = 1086,
      _y2 = 449
    },
    [Type.ServantNavi] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 450,
      _x2 = 1086,
      _y2 = 500
    },
    [Type.CampActivate] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 654,
      _x2 = 1086,
      _y2 = 704
    },
    [Type.CampNavi] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 654,
      _x2 = 1086,
      _y2 = 704
    },
    [Type.HorseRaceInformation] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 399,
      _x2 = 1086,
      _y2 = 449
    },
    [Type.HorseRaceEnterOrCancel] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 450,
      _x2 = 1137,
      _y2 = 500
    },
    [Type.HouseList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 603,
      _x2 = 1188,
      _y2 = 653
    },
    [Type.WorkerList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 399,
      _x2 = 1188,
      _y2 = 449
    },
    [Type.InstallationList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 450,
      _x2 = 1188,
      _y2 = 500
    },
    [Type.PetList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 501,
      _x2 = 1188,
      _y2 = 551
    },
    [Type.MaidList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 501,
      _x2 = 1137,
      _y2 = 551
    },
    [Type.TagSetting] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 552,
      _x2 = 1137,
      _y2 = 602
    },
    [Type.Tag] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 552,
      _x2 = 1188,
      _y2 = 602
    },
    [Type.NpcFind] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 603,
      _x2 = 984,
      _y2 = 653
    },
    [Type.MovieGuide] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 603,
      _x2 = 1137,
      _y2 = 653
    },
    [Type.Mercenary] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 654,
      _x2 = 984,
      _y2 = 704
    },
    [Type.VillageSiegeArea] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 603,
      _x2 = 1035,
      _y2 = 653
    },
    [Type.Pvp] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 654,
      _x2 = 1137,
      _y2 = 704
    },
    [Type.RingMenuSetting] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 205,
      _y1 = 445,
      _x2 = 255,
      _y2 = 495
    },
    [Type.Profile] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 64,
      _y1 = 2,
      _x2 = 124,
      _y2 = 62
    },
    [Type.VoiceChat] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 256,
      _y1 = 190,
      _x2 = 306,
      _y2 = 240
    },
    [Type.Knowledge] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 126,
      _y1 = 64,
      _x2 = 186,
      _y2 = 124
    }
  }
}
PaGlobal_ConsoleQuickMenu._functionTypeList._name = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = "INVENTORY",
    [Type.BlackSpirit] = "BLACKSPIRIT",
    [Type.WorldMap] = "WORLDMAP",
    [Type.Skill] = "SKILL",
    [Type.Mail] = "MAIL",
    [Type.CharacterChallange] = "CHALLENGE",
    [Type.ItemMarket] = "ITEM MARKETPLACE",
    [Type.Quest] = "QUEST",
    [Type.ServantCall] = "CALL MOUNT",
    [Type.ServantNavi] = "FIND MOUNT LOCATION",
    [Type.CampActivate] = "CAMP",
    [Type.CampNavi] = "FIND CAMP LOCATION",
    [Type.HorseRaceInformation] = "HORSE RACE",
    [Type.HorseRaceEnterOrCancel] = "ENTER HORSE RACE",
    [Type.HouseList] = "MY RESICENCE LIST",
    [Type.WorkerList] = "WORKER LIST",
    [Type.InstallationList] = "GARDEN",
    [Type.PetList] = "MY PET",
    [Type.MaidList] = "FAIRY MAID LIST",
    [Type.TagSetting] = "TAG CHARACTER SETTING",
    [Type.Tag] = "TAG CHARACTER",
    [Type.NpcFind] = "FIND NPC",
    [Type.MovieGuide] = "VIDEO GUIDE",
    [Type.Mercenary] = "MILITIA",
    [Type.VillageSiegeArea] = "SHOW NODE INSTALLATION AREA",
    [Type.Pvp] = "PVP",
    [Type.RingMenuSetting] = "RINGMENU SETTING",
    [Type.Profile] = "PROFILE",
    [Type.VoiceChat] = "VOICE CHAT",
    [Type.Knowledge] = "KNOWLEDGE"
  }
}
function varify()
  for type, index in pairs(Type) do
    local func = PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction[__eQuickMenuDataType_Function]
    local icon = PaGlobal_ConsoleQuickMenu._functionTypeList._icon[__eQuickMenuDataType_Function]
    local name = PaGlobal_ConsoleQuickMenu._functionTypeList._name[__eQuickMenuDataType_Function]
    _PA_ASSERT(func, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 Function \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
    _PA_ASSERT(icon, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 icon \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
    _PA_ASSERT(name, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 name \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
  end
end
function FromClient_ConsoleQuickMenu_ExecuteFunctionType(datatype, functionType)
  if __eQuickMenuDataType_Function ~= datatype then
    return
  end
  local executeFunc = PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction[datatype][functionType]
  if nil == executeFunc then
    _PA_LOG("\237\155\132\236\167\132", "[ConsoleQuickMenu] QuickMenu.functionType \236\151\144 \237\131\128\236\158\133\236\157\180 \236\182\148\234\176\128\235\144\152\236\151\136\236\156\188\235\169\180 PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction \236\151\144 \236\182\148\234\176\128\237\149\180 \236\163\188\236\132\184\236\154\148  ")
    return
  end
  executeFunc()
end
registerEvent("FromClient_ConsoleQuickMenu_ExecuteFunctionType", "FromClient_ConsoleQuickMenu_ExecuteFunctionType")
function PaGlobal_ConsoleQuickMenu:setDefaultSetting()
  ToClient_setDefaultQuickMenu()
end
PaGlobal_ConsoleQuickMenu:setDefaultSetting()
